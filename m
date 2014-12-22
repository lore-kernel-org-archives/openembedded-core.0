Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 59FB3729B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 05:28:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBM5SUVP021176
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 21:28:30 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 21 Dec 2014 21:28:30 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Dec 2014 21:28:23 -0800
Message-ID: <71a5aa10d1cb5008c65a997d9a82a3f6292f20f0.1419226071.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1419226071.git.liezhi.yang@windriver.com>
References: <cover.1419226071.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] file: upgrade to 5.21
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
X-List-Received-Date: Mon, 22 Dec 2014 05:28:31 -0000
Content-Type: text/plain

* Upgrade to 5.21.
* The debian-742262.patch is still needed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-devtools/file/file/debian-742262.patch |    4 ++--
 .../file/{file_5.18.bb => file_5.21.bb}            |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/file/{file_5.18.bb => file_5.21.bb} (86%)

diff --git a/meta/recipes-devtools/file/file/debian-742262.patch b/meta/recipes-devtools/file/file/debian-742262.patch
index d57258c..1ef485e 100644
--- a/meta/recipes-devtools/file/file/debian-742262.patch
+++ b/meta/recipes-devtools/file/file/debian-742262.patch
@@ -9,10 +9,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 diff --git a/magic/Magdir/commands b/magic/Magdir/commands
 --- a/magic/Magdir/commands
 +++ b/magic/Magdir/commands
-@@ -50,6 +50,7 @@
+@@ -57,6 +57,7 @@
  0	string/wt	#!\ /usr/bin/awk	awk script text executable
  !:mime	text/x-awk
- 0	regex		=^\\s{0,100}BEGIN\\s{0,100}[{]	awk script text
+ 0	regex/4096	=^\\s{0,100}BEGIN\\s{0,100}[{]	awk or perl script text
 +!:strength - 12
  
  # AT&T Bell Labs' Plan 9 shell
diff --git a/meta/recipes-devtools/file/file_5.18.bb b/meta/recipes-devtools/file/file_5.21.bb
similarity index 86%
rename from meta/recipes-devtools/file/file_5.18.bb
rename to meta/recipes-devtools/file/file_5.21.bb
index 9068b93..702ea87 100644
--- a/meta/recipes-devtools/file/file_5.18.bb
+++ b/meta/recipes-devtools/file/file_5.21.bb
@@ -15,8 +15,8 @@ SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
            file://debian-742262.patch \
           "
 
-SRC_URI[md5sum] = "d420d8f2990cd344673acfbf8d76ff5a"
-SRC_URI[sha256sum] = "6519fb706d583231c2419592ebecdbb21d33c62eaf7a1a0b24ddfcb80c08bf07"
+SRC_URI[md5sum] = "549fe96e09041eabece9de2bb28ef923"
+SRC_URI[sha256sum] = "1a48741d3923c4cc73267109b8a396c0ce3aebe004181f3efb1b0a228d230bb6"
 
 inherit autotools
 
-- 
1.7.9.5


