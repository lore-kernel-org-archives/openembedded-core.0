Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Tim Orling" <ticotimo@gmail.com>
Subject: [PATCH 2/2] python3-pyyaml: upgrade 5.4.1 -> 6.0
Date: Wed, 20 Oct 2021 18:57:25 +0000
Message-Id: <20211020185725.2566453-2-timothy.t.orling@intel.com>
In-Reply-To: <20211020185725.2566453-1-timothy.t.orling@intel.com>
References: <20211020185725.2566453-1-timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>

Now uses "vendored" distutils from setuptools by default
rather than from Python stdlib.

Changes
=======

* https://github.com/yaml/pyyaml/pull/327
  -- Change README format to Markdown
* https://github.com/yaml/pyyaml/pull/483
  -- Add a test for YAML 1.1 types
* https://github.com/yaml/pyyaml/pull/497
  -- fix float resolver to ignore `.` and `._`
* https://github.com/yaml/pyyaml/pull/550
  -- drop Python 2.7
* https://github.com/yaml/pyyaml/pull/553
  -- Fix spelling of “hexadecimal”
* https://github.com/yaml/pyyaml/pull/556
  -- fix representation of Enum subclasses
* https://github.com/yaml/pyyaml/pull/557
  -- fix libyaml extension compiler warnings
* https://github.com/yaml/pyyaml/pull/560
  -- fix ResourceWarning on leaked file descriptors
* https://github.com/yaml/pyyaml/pull/561
  -- always require `Loader` arg to `yaml.load()`
* https://github.com/yaml/pyyaml/pull/564
  -- remove remaining direct distutils usage

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../python/{python3-pyyaml_5.4.1.bb => python3-pyyaml_6.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyyaml_5.4.1.bb => python3-pyyaml_6.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb
rename to meta/recipes-devtools/python/python3-pyyaml_6.0.bb
index b11baa6331..2df0e649f0 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "PyYAML"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "607774cbba28732bfa802b54baa7484215f530991055bb562efbed5b2f20a45e"
+SRC_URI[sha256sum] = "68fb519c14306fec9720a2a5b45bc9f0c8d1b9c72adf45c37baedfcd949c35a2"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
-- 
2.30.2

