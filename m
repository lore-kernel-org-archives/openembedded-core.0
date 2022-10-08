Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Tim Orling" <ticotimo@gmail.com>
Subject: [PATCH 05/10] python3-pyopenssl: upgrade 22.0.0 -> 22.1.0
Date: Sat,  8 Oct 2022 16:54:49 -0700
Message-Id: <a8a22d79cb625fee0d4b8d7a181e8a6cb62e054d.1665270768.git.tim.orling@konsulko.com>
In-Reply-To: <cover.1665270768.git.tim.orling@konsulko.com>
References: <cover.1665270768.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

22.1.0 (2022-09-25)
Backward-incompatible changes:

    Remove support for SSLv2 and SSLv3.

    The minimum cryptography version is now 38.0.x (and we now pin
releases against cryptography major versions to prevent future breakage)

    The OpenSSL.crypto.X509StoreContextError exception has been
refactored, changing its internal attributes. #1133

Deprecations:

    OpenSSL.SSL.SSLeay_version is deprecated in favor of
OpenSSL.SSL.OpenSSL_version. The constants OpenSSL.SSL.SSLEAY_* are
deprecated in favor of OpenSSL.SSL.OPENSSL_*.

Changes:

    Add OpenSSL.SSL.Connection.set_verify and
OpenSSL.SSL.Connection.get_verify_mode to override the context object’s
verification flags. #1073

    Add OpenSSL.SSL.Connection.use_certificate and
OpenSSL.SSL.Connection.use_privatekey to set a certificate per
connection (and not just per context) #1121.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...{python3-pyopenssl_22.0.0.bb => python3-pyopenssl_22.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_22.0.0.bb => python3-pyopenssl_22.1.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb
index db0e809ef54..4d83b8c7d74 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[sha256sum] = "660b1b1425aac4a1bea1d94168a85d99f0b3144c869dd4390d27629d0087f1bf"
+SRC_URI[sha256sum] = "7a83b7b272dd595222d672f5ce29aa030f1fb837630ef229f62e72e395ce8968"
 
 PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools3
-- 
2.34.1

