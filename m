Return-Path: <net147@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 416F16968F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 10:59:44 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rr4so5816639pbb.34
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 03:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Wp3+Ww6oYZhSnTIqRYnS3zdW4z4O3z3RecKU4u0QiSY=;
	b=oh6QyX38JbxNIDfMp76FTvSefBkP/+wP7WO5Ef7YsPbJVIe6GpSctt3UCxnXrhnjEQ
	HEvt4xjU/NDzqXnxJzqRpy+bWyt1VHNI1Iemv8NjbDTl4ycpdXwVwb4qDoDY651xRA2l
	170AKywsV7CblpIpn/LOhRjNGZ4ifkmVpg0aZZC3IZrn03mZCkpNKiXgu0VO8zuDvob4
	B6DBcDKjv5o0HC+3WEAkYnDPL2MCoz0mGTxzyH1r06Npn9jxgDNBhSxl2CxFN67DLmrg
	jw+DStUqcjP/uDEVzsL32DGvvaz+QFtu3XTHj9aa6zOFNcpgNzaY8DvBuc2f78AfvDQa
	Yq2w==
X-Received: by 10.66.67.11 with SMTP id j11mr25418456pat.220.1369565985582;
	Sun, 26 May 2013 03:59:45 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	dr6sm25797222pac.11.2013.05.26.03.59.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 May 2013 03:59:43 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2013 21:13:00 +1000
Message-Id: <1369566786-20341-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH 0/6] base-files: add /run directory from FHS 3 draft specification
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 May 2013 10:59:44 -0000

This is an updated and split up version of the original monolithic
patch to add /run directory from FHS 3 draft specification.

For reference, my previously submitted patches (6):
  systemd: fix ordering for machineid and run-postinsts services
  resolvconf: remove /var/volatile/run/resolvconf/interface from package
  boot-directdisk: mount root by MBR disk signature for Linux 3.8+
  bind: remove empty /var/run directory
  cups: remove /var/run from package as cupsd will populate it on startup
  consolekit: remove /var/run from package

Jonathan Liu (6):
  base-files: add /run directory from FHS 3 draft specification
  systemd: do not create /var/volatile/run and /var/volatile/lock
  systemd: do not create symbolic link from /run to /var/run
  systemd: remove old /var/run workarounds
  udev: do not create /var/volatile/run in init script
  udev: do not create symbolic link from /run to /var/run

 meta/files/fs-perms.txt                                   |  5 ++---
 meta/recipes-core/base-files/base-files/fstab             |  1 +
 meta/recipes-core/base-files/base-files_3.0.14.bb         | 10 +++++-----
 meta/recipes-core/initscripts/initscripts-1.0/volatiles   |  7 +++----
 meta/recipes-core/systemd/systemd/00-create-volatile.conf |  2 --
 meta/recipes-core/systemd/systemd/init                    |  4 ----
 meta/recipes-core/systemd/systemd/var-run.conf            |  4 ----
 meta/recipes-core/systemd/systemd_204.bb                  |  3 ---
 meta/recipes-core/udev/udev.inc                           |  6 +-----
 meta/recipes-core/udev/udev/init                          |  1 -
 meta/recipes-core/udev/udev/volatiles                     |  1 -
 11 files changed, 12 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
 delete mode 100644 meta/recipes-core/udev/udev/volatiles

-- 
1.8.2.3


