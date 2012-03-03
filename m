Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S3t44-0000cJ-1y
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2012 18:48:16 +0100
Received: by yenm3 with SMTP id m3so1171174yen.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2012 09:39:43 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.173.132 as permitted sender) client-ip=10.236.173.132; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.173.132 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.173.132])
	by 10.236.173.132 with SMTP id v4mr19474626yhl.78.1330796383341
	(num_hops = 1); Sat, 03 Mar 2012 09:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=NWxlHrZ52kFL2Cxq4ML1GU7mzMjqsttnjlNXUPjfg2Q=;
	b=S5YZVXapTKug8BfR2VkQlrJjMQxEpxTWD41P04b/+LUwxjYbiAC1Ulr5N88vZa6P/I
	pHbqoq8cPozwTre5PvbOAw9ENoMm+uAvvc9nZiAESX1D9nM+GN+lCXxcgAR+bXyv7GWV
	sPNGHpZTVNbPHK3vUQNmkgqdcPPI2tDIi4DRqaqchV48bTbBLU4ZB2vMuel6tq7MN7hn
	QtiG832cS+QZLNRJpttm0+RObZm2kTdNBwS7dQea1kuYpApPBkABcaRqvLtG6tN8kQ03
	jcvdtF1JG6cVPmutGRDGOySu56zP0F69R0YH9dPWP2LbjAoFfucWSxR5vGd2hoDqbhR+
	o2rQ==
Received: by 10.236.173.132 with SMTP id v4mr15434401yhl.78.1330796383294;
	Sat, 03 Mar 2012 09:39:43 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o11sm15284275anl.11.2012.03.03.09.39.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Mar 2012 09:39:42 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Mar 2012 17:39:30 +0000
Message-Id: <cover.1330796256.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/4] Postinst trigger improvements for images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Mar 2012 17:48:16 -0000

This patchset make consistent the name used as postinst trigger in rootfs.

The following changes since commit 857840472705af1c0fbb8db917b4bb6809b929a6:

  wpa-supplicant: fix breakage during rebuild (2012-03-02 22:35:03 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (4):
  run-postinsts: fix opkg data path
  image.bbclass: fix rootfs generation without package management tools
  rootfs_rpm.bbclass: rename postinst trigger script
  opkg: rename postinst trigger script

 meta/classes/core-image.bbclass                    |    2 --
 meta/classes/image.bbclass                         |    7 +++++--
 meta/classes/rootfs_rpm.bbclass                    |    6 +++---
 .../dpkg/run-postinsts/run-postinsts               |    4 ++--
 .../dpkg/run-postinsts/run-postinsts.awk           |    2 +-
 meta/recipes-devtools/dpkg/run-postinsts_1.0.bb    |    2 +-
 meta/recipes-devtools/opkg/opkg.inc                |    8 ++++----
 7 files changed, 16 insertions(+), 15 deletions(-)

-- 
1.7.2.5



