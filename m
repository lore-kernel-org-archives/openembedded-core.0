Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id B8A187ECB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 03:05:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jul 2019 20:05:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,272,1559545200"; d="scan'208";a="167836866"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.220])
	by fmsmga008.fm.intel.com with ESMTP; 16 Jul 2019 20:05:02 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 11:04:08 +0800
Message-Id: <20190717030408.11571-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717030408.11571-1-anuj.mittal@intel.com>
References: <20190717030408.11571-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python3: upgrade 3.7.3 -> 3.7.4
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
X-List-Received-Date: Wed, 17 Jul 2019 03:05:01 -0000
Content-Transfer-Encoding: 8bit

Also fixes CVE-2019-9740, CVE-2019-9948. For details, see:

https://docs.python.org/3.7/whatsnew/changelog.html#python-3-7-4-final

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../python/{python3_3.7.3.bb => python3_3.7.4.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.7.3.bb => python3_3.7.4.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3_3.7.3.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.7.3.bb
rename to meta/recipes-devtools/python/python3_3.7.4.bb
index 573624528d..a63abfd6cb 100644
--- a/meta/recipes-devtools/python/python3_3.7.3.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -37,8 +37,8 @@ SRC_URI_append_class-nativesdk = " \
            file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
            "
 
-SRC_URI[md5sum] = "93df27aec0cd18d6d42173e601ffbbfd"
-SRC_URI[sha256sum] = "da60b54064d4cfcd9c26576f6df2690e62085123826cff2e667e72a91952d318"
+SRC_URI[md5sum] = "d33e4aae66097051c2eca45ee3604803"
+SRC_URI[sha256sum] = "fb799134b868199930b75f26678f18932214042639cd52b16da7fd134cd9b13f"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.20.1


