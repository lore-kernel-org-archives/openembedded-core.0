Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 187B77325A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 07:19:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B7JSlm019654
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 23:19:29 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Jan 2016 23:19:28 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 Jan 2016 23:19:20 -0800
Message-ID: <5b358c60343b34bf06dc073876dc85a7fed8c3a9.1452496745.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452496745.git.liezhi.yang@windriver.com>
References: <cover.1452496745.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] autogen-native: 5.18.5 -> 5.18.6
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
X-List-Received-Date: Mon, 11 Jan 2016 07:19:29 -0000
Content-Type: text/plain

* Update increase-timeout-limit.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...n-native_5.18.5.bb => autogen-native_5.18.6.bb} |    4 +--
 .../autogen/autogen/increase-timeout-limit.patch   |   29 +++++++++-----------
 2 files changed, 15 insertions(+), 18 deletions(-)
 rename meta/recipes-devtools/autogen/{autogen-native_5.18.5.bb => autogen-native_5.18.6.bb} (90%)

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.5.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.6.bb
similarity index 90%
rename from meta/recipes-devtools/autogen/autogen-native_5.18.5.bb
rename to meta/recipes-devtools/autogen/autogen-native_5.18.6.bb
index 373dd89..d77b827 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.18.5.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.18.6.bb
@@ -14,8 +14,8 @@ SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
            file://redirect-output-dir.patch \
 "
 
-SRC_URI[md5sum] = "385d7c7dfbe60babbee261c054923a53"
-SRC_URI[sha256sum] = "7bbdb73b5518baf64c6d3739fb2ecc66d2cccda888ce5ad573abe235ab5d96ba"
+SRC_URI[md5sum] = "fdee403e524c0af3ded6b3becb365671"
+SRC_URI[sha256sum] = "2fc7f12a5ecb3b1e8bd4364aa906b837cff01f80edb7d2fb38ed8b9dfbcd3271"
 
 UPSTREAM_CHECK_URI = "http://ftp.gnu.org/gnu/autogen/"
 UPSTREAM_CHECK_REGEX = "rel(?P<pver>\d+(\.\d+)+)/"
diff --git a/meta/recipes-devtools/autogen/autogen/increase-timeout-limit.patch b/meta/recipes-devtools/autogen/autogen/increase-timeout-limit.patch
index 3d4c1d6..9efd7e5 100644
--- a/meta/recipes-devtools/autogen/autogen/increase-timeout-limit.patch
+++ b/meta/recipes-devtools/autogen/autogen/increase-timeout-limit.patch
@@ -12,22 +12,19 @@ Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0af7c18..5544f59 100644
+index 58a848b..170dd9e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -175,9 +175,9 @@ config_end_time=`date +%s 2>/dev/null`
- time_delta=`expr ${config_end_time} - ${config_start_time} 2>/dev/null`
+@@ -178,9 +178,9 @@ time_delta=`expr ${config_end_time} - ${config_start_time} 2>/dev/null`
+ if test -z "${AG_TIMEOUT}"
+ then
+   if test -z "${time_delta}"
+-  then time_delta=10
+-  elif test ${time_delta} -lt 5
+-  then time_delta=5 ; fi
++  then time_delta=60
++  elif test ${time_delta} -lt 30
++  then time_delta=30 ; fi
  
- if test -z "${time_delta}"
--then time_delta=10
--elif test ${time_delta} -lt 5
--then time_delta=5 ; fi
-+then time_delta=60
-+elif test ${time_delta} -lt 30
-+then time_delta=30 ; fi
- 
- AG_TIMEOUT=${time_delta}
- ]
--- 
-1.7.9.5
-
+   AG_TIMEOUT=${time_delta}
+ fi
-- 
1.7.9.5


