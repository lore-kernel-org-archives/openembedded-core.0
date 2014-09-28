Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5AC7160A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Sep 2014 02:59:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8S2xWbo020306
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Sep 2014 19:59:32 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sat, 27 Sep 2014 19:59:31 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 28 Sep 2014 11:00:16 +0800
Message-ID: <cover.1411721793.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V3 0/4] Fixes for systemd services in systemd
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
X-List-Received-Date: Sun, 28 Sep 2014 02:59:35 -0000
Content-Type: text/plain

Changes since V2:
sysklogd: Unlink /dev/log only if it's not from systemd

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
 .../files/0001-syslogd.c-add-systemd-support.patch | 246 +++++++++++++++++++++
 meta/recipes-extended/sysklogd/files/klogd.service |   9 +
 .../sysklogd/files/sysklogd.service                |  14 ++
 meta/recipes-extended/sysklogd/files/syslog.conf   |   8 +-
 meta/recipes-extended/sysklogd/sysklogd.inc        |  38 +++-
 9 files changed, 317 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-extended/sysklogd/files/0001-syslogd.c-add-systemd-support.patch
 create mode 100644 meta/recipes-extended/sysklogd/files/klogd.service
 create mode 100644 meta/recipes-extended/sysklogd/files/sysklogd.service

-- 
1.9.1


