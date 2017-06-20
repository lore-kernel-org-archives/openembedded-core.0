Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym03.jp.fujitsu.com (mgwym03.jp.fujitsu.com [211.128.242.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1FA2C7823D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 04:51:48 +0000 (UTC)
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by
	mgwym03.jp.fujitsu.com with smtp
	id 674c_4b48_93b9f259_6725_4db7_b0a7_85c4d0983780;
	Tue, 20 Jun 2017 13:51:42 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
	(g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id E315BAC00A6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 13:51:41 +0900 (JST)
Received: from G01JPEXCHKW17.g01.fujitsu.local
	(G01JPEXCHKW17.g01.fujitsu.local [10.0.194.56])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	B09E4BD66AB for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 13:51:40 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHKW17.g01.fujitsu.local (10.0.194.56) with Microsoft SMTP
	Server id 14.3.266.1; Tue, 20 Jun 2017 13:51:40 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Jun 2017 13:53:06 +0900
Message-ID: <1497934386-25305-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] file: 5.30 -> 5.31
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
X-List-Received-Date: Tue, 20 Jun 2017 04:51:51 -0000
Content-Type: text/plain

1. Upgrade file from 5.30 to 5.31

2. Rebase the following patch file.
   debian-742262.patch

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-devtools/file/file/debian-742262.patch     | 17 ++++++++++++++---
 .../file/{file_5.30.bb => file_5.31.bb}                 |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/file/{file_5.30.bb => file_5.31.bb} (96%)

diff --git a/meta/recipes-devtools/file/file/debian-742262.patch b/meta/recipes-devtools/file/file/debian-742262.patch
index 1ef485e..d31ac59 100644
--- a/meta/recipes-devtools/file/file/debian-742262.patch
+++ b/meta/recipes-devtools/file/file/debian-742262.patch
@@ -1,19 +1,30 @@
-The awk pattern was checked *before* the Perl pattern, so the perl
-script with BEGIN{...} would be reported as awk, this patch fixes it.
+The awk pattern was checked *before* the Perl pattern, so the
+perl script with BEGIN{...} would be reported as awk, this patch fixes it.
 
 Upstream-Status: Backport [debian]
 
 Signed-off-by: Christoph Biedl <debian.axhn@manchmal.in-ulm.de>
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Rebase on 5.31
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
 ---
+ magic/Magdir/commands | 1 +
+ 1 file changed, 1 insertion(+)
+
 diff --git a/magic/Magdir/commands b/magic/Magdir/commands
+index 1a46efd..255c04b 100644
 --- a/magic/Magdir/commands
 +++ b/magic/Magdir/commands
 @@ -57,6 +57,7 @@
  0	string/wt	#!\ /usr/bin/awk	awk script text executable
  !:mime	text/x-awk
- 0	regex/4096	=^\\s{0,100}BEGIN\\s{0,100}[{]	awk or perl script text
+ 0	regex/4096	=^[A-Za-z0-9_]{0,100}BEGIN[A-Za-z0-9_]{0,100}[{]	awk or perl script text
 +!:strength - 12
  
  # AT&T Bell Labs' Plan 9 shell
  0	string/wt	#!\ /bin/rc	Plan 9 rc shell script text executable
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/file/file_5.30.bb b/meta/recipes-devtools/file/file_5.31.bb
similarity index 96%
rename from meta/recipes-devtools/file/file_5.30.bb
rename to meta/recipes-devtools/file/file_5.31.bb
index 0998fcf..1b1f502 100644
--- a/meta/recipes-devtools/file/file_5.30.bb
+++ b/meta/recipes-devtools/file/file_5.31.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/file/file.git \
         file://0001-Add-P-prompt-into-Usage-info.patch \
         "
 
-SRCREV = "79814950aafb81ecd6a910c2a8a3b8ec12f3e4a6"
+SRCREV = "70c5f15060c7ad81150177de83a3e64500a54c9f"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.7.4


