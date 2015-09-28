Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0442F755FA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 09:20:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8S9KfuR013354
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 02:20:41 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 28 Sep 2015 02:20:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Sep 2015 02:20:41 -0700
Message-ID: <5a37554dfd79d1c65ce30ab9db9b05608066eedd.1443432019.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1443432019.git.liezhi.yang@windriver.com>
References: <cover.1443432019.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python-async: inherit setuptools
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
X-List-Received-Date: Mon, 28 Sep 2015 09:20:42 -0000
Content-Type: text/plain

Fixed when bitbake nativesdk-python-async:
DEBUG: Executing shell function do_compile
Traceback (most recent call last):
  File "setup.py", line 2, in <module>
    from setuptools import setup
ImportError: No module named setuptools

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python-async_0.6.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-async_0.6.2.bb b/meta/recipes-devtools/python/python-async_0.6.2.bb
index 8ed0b03..576e0a8 100644
--- a/meta/recipes-devtools/python/python-async_0.6.2.bb
+++ b/meta/recipes-devtools/python/python-async_0.6.2.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8
 
 S = "${WORKDIR}/async-${PV}"
 
-inherit distutils
+inherit distutils setuptools
 
 RDEPENDS_${PN} += "python-threading python-lang"
 
-- 
1.7.9.5


