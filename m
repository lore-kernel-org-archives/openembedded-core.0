Received: from mail-oa0-f45.google.com ([209.85.219.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TwhKJ-0006u4-QP
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 23:55:52 +0100
Received: by mail-oa0-f45.google.com with SMTP id i18so4896984oag.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 14:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=NJqfQYbKK+ah/loUELS9Q6CMU9M6BZt49Dlslz0vtzY=;
	b=P9TAgDVlliei6doLvYA7RG2HYDJ1gT4OHytHpKT81rEuiWFe4xy6dPmc6eF+b7GuQo
	a27oaRPmuY6NyB5/1SFg64viQuICl9lZmAxYx2vI2fLMn36vPwOz9aVfysy0ozc+dpmH
	s+/7xwR7UEGzbPIBt35zk1W52HiHFvOUGXEqYfcfdIOZVG/Qbrsoh0ZXY8vNYesBqC85
	jEuVjNGvZaZUBjAih+7LbR+YGDKokte1RQEYkX5G7SQy9hapuuBRLTniUht5DOHdVoYl
	9IlNb9fhTU1sq0orOHqjA4M25/TbB5ijG8l+HNp/FniDsoJh1u4wHMk/h02FO4h5K1Cp
	UVWA==
X-Received: by 10.60.171.76 with SMTP id as12mr10445865oec.107.1358635224576; 
	Sat, 19 Jan 2013 14:40:24 -0800 (PST)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id 7sm6936441obu.4.2013.01.19.14.40.23
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 14:40:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 14:40:06 -0800
Message-Id: <fd16b03bb5881c7011869be4207a5d4c8a1f7441.1358634922.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
References: <613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
In-Reply-To: <cover.1358634922.git.raj.khem@gmail.com>
References: <cover.1358634922.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] boost: Upgrade 1.51 -> 1.52
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Jan 2013 22:55:52 -0000

Drop hash_enums.patch which is already applied upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/boost/boost.inc               |    2 -
 .../boost/{boost_1.51.0.bb => boost_1.52.0.bb}     |    8 ++--
 meta/recipes-support/boost/files/hash_enums.patch  |   45 --------------------
 3 files changed, 3 insertions(+), 52 deletions(-)
 rename meta/recipes-support/boost/{boost_1.51.0.bb => boost_1.52.0.bb} (44%)
 delete mode 100644 meta/recipes-support/boost/files/hash_enums.patch

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 4fe5a35..1266666 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -16,8 +16,6 @@ BOOST_VER = "${@"_".join(d.getVar("PV",1).split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV",1).split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-INC_PR = "r5"
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BOOST_P}.tar.bz2"
 
 S = "${WORKDIR}/${BOOST_P}"
diff --git a/meta/recipes-support/boost/boost_1.51.0.bb b/meta/recipes-support/boost/boost_1.52.0.bb
similarity index 44%
rename from meta/recipes-support/boost/boost_1.51.0.bb
rename to meta/recipes-support/boost/boost_1.52.0.bb
index b95049f..6c9dd3f 100644
--- a/meta/recipes-support/boost/boost_1.51.0.bb
+++ b/meta/recipes-support/boost/boost_1.52.0.bb
@@ -2,10 +2,8 @@ include boost.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-PR = "${INC_PR}.1"
-
 SRC_URI += "file://arm-intrinsics.patch \
-            file://hash_enums.patch \
            "
-SRC_URI[md5sum] = "4b6bd483b692fd138aef84ed2c8eb679"
-SRC_URI[sha256sum] = "fb2d2335a29ee7fe040a197292bfce982af84a645c81688a915c84c925b69696"
+SRC_URI[md5sum] = "3a855e0f919107e0ca4de4d84ad3f750"
+SRC_URI[sha256sum] = "222b6afd7723f396f5682c20130314a10196d3999feab5ba920d2a6bf53bac92"
+
diff --git a/meta/recipes-support/boost/files/hash_enums.patch b/meta/recipes-support/boost/files/hash_enums.patch
deleted file mode 100644
index 368da96..0000000
--- a/meta/recipes-support/boost/files/hash_enums.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Allow hashing of enums.
-Fixes errors like 
-
-/opt/poky/1.3.0-1/sysroots/i586-poky-linux/usr/include/boost/functional/hash/extensions.hpp:257:34: error: no matching function for call to 'hash_value(const myspace::idx&)'
-
-Upstream-Status: Pending
-Singed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: boost_1_51_0/boost/functional/hash/hash.hpp
-===================================================================
---- boost_1_51_0.orig/boost/functional/hash/hash.hpp	2012-07-15 16:28:30.000000000 -0700
-+++ boost_1_51_0/boost/functional/hash/hash.hpp	2012-09-26 14:00:57.738364002 -0700
-@@ -15,6 +15,8 @@
- #include <boost/functional/hash/detail/hash_float.hpp>
- #include <string>
- #include <boost/limits.hpp>
-+#include <boost/type_traits/is_enum.hpp>
-+#include <boost/utility/enable_if.hpp>
- 
- #if defined(BOOST_NO_TEMPLATE_PARTIAL_SPECIALIZATION)
- #include <boost/type_traits/is_pointer.hpp>
-@@ -89,6 +91,9 @@
-     typename boost::hash_detail::long_numbers<T>::type hash_value(T);
-     template <typename T>
-     typename boost::hash_detail::ulong_numbers<T>::type hash_value(T);
-+    template <typename T>
-+    typename boost::enable_if<boost::is_enum<T>, std::size_t>::type
-+      hash_value(T);
- 
- #if !BOOST_WORKAROUND(__DMC__, <= 0x848)
-     template <class T> std::size_t hash_value(T* const&);
-@@ -178,7 +183,12 @@
-     {
-         return hash_detail::hash_value_unsigned(v);
-     }
--
-+    template <typename T>
-+    typename boost::enable_if<boost::is_enum<T>, std::size_t>::type
-+      hash_value(T v)
-+    {
-+      return static_cast<std::size_t>(v);
-+    }
-     // Implementation by Alberto Barbati and Dave Harris.
- #if !BOOST_WORKAROUND(__DMC__, <= 0x848)
-     template <class T> std::size_t hash_value(T* const& v)
-- 
1.7.9.5



