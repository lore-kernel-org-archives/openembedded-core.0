Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA147714FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 09:10:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8P9A7sv012189
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 02:10:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 25 Sep 2014 02:10:06 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Sep 2014 17:10:47 +0800
Message-ID: <cover.1411635424.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/4] Fixes for syslog services in systemd
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
X-List-Received-Date: Thu, 25 Sep 2014 09:10:11 -0000
Content-Type: text/plain

The following changes since commit f6a39cc957bf85ff43513f0b76afc3b2c9c906b6:

  sstatesig: fix overrides behaviour to remove SIGGEN_LOCKEDSIGS_i586 (2014-09-17 22:00:05 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/systemd-syslog-service
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd-syslog-service

Chen Qi (4):
  systemd: enable syslog.socket by default
  busybox: fix for syslog service in systemd
  sysklogd: add systemd support
  sysklog: comment out configuration regarding xconsole

 meta/recipes-core/busybox/busybox.inc              |   9 +-
 .../busybox/files/busybox-klogd.service.in         |   4 +-
 .../busybox/files/busybox-syslog.service.in        |   7 +-
 meta/recipes-core/systemd/systemd_216.bb           |   2 +
 .../files/0001-syslogd.c-add-systemd-support.patch | 217 +++++++++++++++++++++
 meta/recipes-extended/sysklogd/files/klogd.service |   9 +
 .../sysklogd/files/sysklogd.service                |  14 ++
 meta/recipes-extended/sysklogd/files/syslog.conf   |   8 +-
 meta/recipes-extended/sysklogd/sysklogd.inc        |  37 +++-
 9 files changed, 289 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-extended/sysklogd/files/0001-syslogd.c-add-systemd-support.patch
 create mode 100644 meta/recipes-extended/sysklogd/files/klogd.service
 create mode 100644 meta/recipes-extended/sysklogd/files/sysklogd.service

-- 
1.9.1


