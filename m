Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF85678679
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 00:54:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAE0s6iA025434
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 16:54:06 -0800
Received: from pek-lpg-core1.windriver.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 13 Nov 2017 16:54:05 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 01:58:44 +0800
Message-ID: <6dd746c278000f364e6cfd3d86db34d8b89a7806.1510595883.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510595883.git.liezhi.yang@windriver.com>
References: <cover.1510595883.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/10] file: 5.31 -> 5.32
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
X-List-Received-Date: Tue, 14 Nov 2017 00:54:05 -0000
Content-Type: text/plain

Rebase debian-742262.patch for new source.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/file/file/debian-742262.patch       | 7 ++-----
 meta/recipes-devtools/file/{file_5.31.bb => file_5.32.bb} | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/file/{file_5.31.bb => file_5.32.bb} (96%)

diff --git a/meta/recipes-devtools/file/file/debian-742262.patch b/meta/recipes-devtools/file/file/debian-742262.patch
index d31ac59..319f9db 100644
--- a/meta/recipes-devtools/file/file/debian-742262.patch
+++ b/meta/recipes-devtools/file/file/debian-742262.patch
@@ -14,17 +14,14 @@ Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/magic/Magdir/commands b/magic/Magdir/commands
-index 1a46efd..255c04b 100644
+index f6ad1c8..f79e7dd 100644
 --- a/magic/Magdir/commands
 +++ b/magic/Magdir/commands
 @@ -57,6 +57,7 @@
  0	string/wt	#!\ /usr/bin/awk	awk script text executable
  !:mime	text/x-awk
- 0	regex/4096	=^[A-Za-z0-9_]{0,100}BEGIN[A-Za-z0-9_]{0,100}[{]	awk or perl script text
+ 0	regex/4096	=^[\040\t\f\r\n]{0,100}BEGIN[\040\t\f\r\n]{0,100}[{]	awk or perl script text
 +!:strength - 12
  
  # AT&T Bell Labs' Plan 9 shell
  0	string/wt	#!\ /bin/rc	Plan 9 rc shell script text executable
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/file/file_5.31.bb b/meta/recipes-devtools/file/file_5.32.bb
similarity index 96%
rename from meta/recipes-devtools/file/file_5.31.bb
rename to meta/recipes-devtools/file/file_5.32.bb
index 1b1f502..5e15925 100644
--- a/meta/recipes-devtools/file/file_5.31.bb
+++ b/meta/recipes-devtools/file/file_5.32.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/file/file.git \
         file://0001-Add-P-prompt-into-Usage-info.patch \
         "
 
-SRCREV = "70c5f15060c7ad81150177de83a3e64500a54c9f"
+SRCREV = "d474e35513940dbca039b510b4de705b44f5bd9c"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.7.4


