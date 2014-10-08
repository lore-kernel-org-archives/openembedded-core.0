Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 854C37029A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 06:46:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s986kLa8024891
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Oct 2014 23:46:22 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 7 Oct 2014 23:46:21 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Oct 2014 14:44:40 +0800
Message-ID: <b4a35a769f5d4f9d6eaa72b4924bbe8f1dc8fbb7.1412750609.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1412750609.git.Chong.Lu@windriver.com>
References: <cover.1412750609.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libpcre: Upgrade to 8.36
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
X-List-Received-Date: Wed, 08 Oct 2014 06:46:24 -0000
Content-Type: text/plain

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-support/libpcre/libpcre/Makefile                     | 2 +-
 meta/recipes-support/libpcre/{libpcre_8.35.bb => libpcre_8.36.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.35.bb => libpcre_8.36.bb} (94%)

diff --git a/meta/recipes-support/libpcre/libpcre/Makefile b/meta/recipes-support/libpcre/libpcre/Makefile
index 5419d71..708d807 100644
--- a/meta/recipes-support/libpcre/libpcre/Makefile
+++ b/meta/recipes-support/libpcre/libpcre/Makefile
@@ -65,7 +65,7 @@ am__test_logs1 = $(TESTS:=.log)
 am__test_logs2 = $(am__test_logs1:.log=.log)
 TEST_LOGS = $(am__test_logs2:.test.log=.log)
 MKDIR_P = /bin/mkdir -p
-PACKAGE_STRING = PCRE 8.34
+PACKAGE_STRING = PCRE 8.36
 SHELL = /bin/sh
 srcdir = .
 top_srcdir = .
diff --git a/meta/recipes-support/libpcre/libpcre_8.35.bb b/meta/recipes-support/libpcre/libpcre_8.36.bb
similarity index 94%
rename from meta/recipes-support/libpcre/libpcre_8.35.bb
rename to meta/recipes-support/libpcre/libpcre_8.36.bb
index 92098c8..6aa0237 100644
--- a/meta/recipes-support/libpcre/libpcre_8.35.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.36.bb
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
            file://Makefile \
 "
 
-SRC_URI[md5sum] = "6aacb23986adccd9b3bc626c00979958"
-SRC_URI[sha256sum] = "a961c1c78befef263cc130756eeca7b674b4e73a81533293df44e4265236865b"
+SRC_URI[md5sum] = "b767bc9af0c20bc9c1fe403b0d41ad97"
+SRC_URI[sha256sum] = "ef833457de0c40e82f573e34528f43a751ff20257ad0e86d272ed5637eb845bb"
 
 S = "${WORKDIR}/pcre-${PV}"
 
-- 
1.9.1


