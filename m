Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 580797F54D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 11:29:51 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j18so1912168wrq.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 04:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=YtLTClkFMDtRhf858v57NWywEheGiqCPabrkbRNHZLU=;
	b=KGNJ8MDNdi/ifPXBvLb3BDTbjtqDq0K26xpkS6u9Me28Yeg7FaOUIazwU9gEYjViqG
	oNcHNPRxhq4TG/KBdm4n8DIXSfBMhvMCV2FnUOIZSZUFDl7K7T1d5pHA28xSJ8fsoGYn
	LDBdLur/UNqNf64bFxQOeNg83MPnEsp2P8VeVfCLQZ3HkSOEXiJogNETZjw2YQJwQGSC
	nIydzzkmyV/1DblMFQM/0sIa4/1G+vLUzSXI9b1eZIOy50Xwr39SlDX5bRllZBMVlNVp
	E87xKcE6bz8rKBnaH1gPZG4MXCHLPeoJd+6Re2IZeoQkvuWoWSBbPrONekBbMWcVDCPu
	fNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YtLTClkFMDtRhf858v57NWywEheGiqCPabrkbRNHZLU=;
	b=oKhoIlm6v3cL3+lQ4EKDdmURYfBVGhG6IhbwhpT9EgIQ0D2qvU4fY2XujglWVVmYEb
	V8OEcy1Bk5xhle31LutR2o/nCu+58PNVZJ/P0WwKaPnOEJ///H+/lTI0VbDHHKuLNxfR
	jLQCt3874gMWMUa/oX4cH/S0U93Bh2v3UOZDx776DLkbM9Zbds9X/yMEAbC2NmdKUPzS
	XTp+VUq8rqbdVw1A2rETqoKg61PSHW1xk6v55n14Hr7o/qbxsCHnR8XjONM4BsYeDk92
	XTqdTsObnW0kclUF33SJ6ex+wbYumFxzn1VeSFsr+kaPhmvpVhcxvPtBA3ohDhUGl5Nb
	j/+g==
X-Gm-Message-State: APjAAAVW5lOxMcdzzg0SEU3Jdhvd0aRNpM3sRTYoasHyYC9g5KLqZOio
	nnq5t1DT5n+WckNd6s9QjueIoPT8ydk=
X-Google-Smtp-Source: APXvYqysLN4dKZgofTtrt/eJBJoJDWSU8RwLksEA2ylrytWrEkLfJ5oxXttQNos1lUycFNiMtVmaOA==
X-Received: by 2002:a05:6000:92:: with SMTP id
	m18mr2731747wrx.105.1571311791687; 
	Thu, 17 Oct 2019 04:29:51 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id r2sm1907514wrm.3.2019.10.17.04.29.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 17 Oct 2019 04:29:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2019 12:29:43 +0100
Message-Id: <20191017112945.345-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017112945.345-1-ross.burton@intel.com>
References: <20191017112945.345-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] python3: ensure that all forms of python3-config are in python3-dev
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
X-List-Received-Date: Thu, 17 Oct 2019 11:29:51 -0000
Content-Transfer-Encoding: 8bit

In multilib builds python3-config gets renamed to eg python3-config-lib64 but
this ends up being packaged in python3-core not python3-dev.

The manifest uses an extended glob to package all python* binaries that are not
python-config into python3-core:

            "${bindir}/python*[!-config]",

However, this doesn't do what was intended, as [] is a range match.

Replace the globs with more verbose but precise matches, and clear out
FILES_${PN} to ensure that new binaries don't end up in ${PN} (which shouldn't
exist).

[ YOCTO #13592 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 6 ++++--
 meta/recipes-devtools/python/python3_3.7.4.bb              | 5 ++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 1ad85a9ff38..cd9dc847a8f 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -210,7 +210,9 @@
         "summary": "Python interpreter and core modules",
         "rdepends": [],
         "files": [
-            "${bindir}/python*[!-config]",
+            "${bindir}/python3",
+            "${bindir}/python${PYTHON_MAJMIN}",
+            "${bindir}/python${PYTHON_BINABI}",
             "${includedir}/python${PYTHON_BINABI}/pyconfig*.h",
             "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]",
             "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
@@ -487,7 +489,7 @@
         "files": [
             "${base_libdir}/*.a",
             "${base_libdir}/*.o",
-            "${bindir}/python*-config",
+            "${bindir}/python*-config*",
             "${datadir}/aclocal",
             "${datadir}/pkgconfig",
             "${includedir}",
diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
index 01230b0fec3..8c429e95c38 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -303,11 +303,14 @@ do_create_manifest[depends] += "${PN}:do_prepare_recipe_sysroot"
 do_create_manifest[depends] += "${PN}:do_patch"
 
 # manual dependency additions
-RPROVIDES_${PN}-modules = "${PN}"
 RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-modules"
 RRECOMMENDS_${PN}-crypt_append_class-target = " openssl ca-certificates"
 RRECOMMENDS_${PN}-crypt_append_class-nativesdk = " openssl ca-certificates"
 
+# For historical reasons PN is empty and provided by python3-modules
+FILES_${PN} = ""
+RPROVIDES_${PN}-modules = "${PN}"
+
 FILES_${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
 FILES_${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
 
-- 
2.20.1


