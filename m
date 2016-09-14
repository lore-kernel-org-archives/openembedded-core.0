Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8D78373695
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 16:41:44 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id k186so18386391wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 09:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SfqMguuuit2EWrMbxSy0bzCdhfBE3GGtFy2LDu6QquY=;
	b=lCwH/KwSsDNPXXZGiwefDwwlEqF2wv07MZKgJjN5sVGXvMwfi0UkK9mFaKNCNNKCxo
	vkxujbwRwJ7gBRmWBFYSoE9/gML21TC0VQc1bpTDxtSGwGJdKhm7Djt2PuUdd/UHyF+5
	2sUiAzxAXDhJi0UMnzKVnps781P5yR/SGAI36AdqlwAn88QW5gJWX1E0ldd7zisTpZ5B
	5nyAKE3my6epIrUlOkoS+sb3SrSHTbwBp4YpWfY8f62QL/34BNgVjctJr9/98Q1+942C
	3uib3RwBoVfY1JsgfcjfrMwdmcN8+hFtYqzTIon41gbVJE+HgJQHCmC7P0RG/WS1xKGn
	+gKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SfqMguuuit2EWrMbxSy0bzCdhfBE3GGtFy2LDu6QquY=;
	b=aaxpFIZ4circ+u3rPjqZ+Yfa4vqsn0EtlTHxM55/DZ7gm4MX1DakXrz1Wr3162iSN9
	QmnK7NgZqeE5maOhCKiPF5M1+wqapozZoXF7ElVESnviHBHDr9GgtHvSuDry7G7b9tuf
	H2Xny4sUG1SWTNa2VceYsl0Wgt0yCoLBGDsFjqlnM5wXQkijuw8zyio35O6tq3dX8Fgp
	F8CP5wA4mZvS0SoesEY2wyzq1FvPWWeYgXoAcJf7271qhWbH6RajFgwNZg3IaubdJ1n+
	JfJC6CIk4j69JdrwX2SRdNC6Y9e/LLRWI+OIAt6tHkfl2+N+ZaRLuOfKWOzZywFb59RK
	somA==
X-Gm-Message-State: AE9vXwMICcIkUyUMjK9UqnjyP19RE1Sat8V6mLoOPZobpZlZlKegClIOdIAqyumAQz+/ADzK
X-Received: by 10.194.161.166 with SMTP id xt6mr3867992wjb.165.1473871303938; 
	Wed, 14 Sep 2016 09:41:43 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id p13sm5025189wmd.1.2016.09.14.09.41.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Sep 2016 09:41:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2016 17:41:36 +0100
Message-Id: <1473871297-28966-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1473871297-28966-1-git-send-email-ross.burton@intel.com>
References: <1473871297-28966-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] cmake: use convenience options for clarity
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
X-List-Received-Date: Wed, 14 Sep 2016 16:41:45 -0000

The intention here was "everything but jsoncpp is system provided" so use the
convenience option to ensure this remains true in the future.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/cmake/cmake_3.6.1.bb | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake_3.6.1.bb b/meta/recipes-devtools/cmake/cmake_3.6.1.bb
index 2f188f0..67ba9c4 100644
--- a/meta/recipes-devtools/cmake/cmake_3.6.1.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.6.1.bb
@@ -25,13 +25,8 @@ python () {
 
 EXTRA_OECMAKE=" \
     -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
-    -DCMAKE_USE_SYSTEM_LIBRARY_BZIP2=1 \
-    -DCMAKE_USE_SYSTEM_LIBRARY_CURL=1 \
-    -DCMAKE_USE_SYSTEM_LIBRARY_EXPAT=1 \
-    -DCMAKE_USE_SYSTEM_LIBRARY_FORM=1 \
-    -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=1 \
-    -DCMAKE_USE_SYSTEM_LIBRARY_LIBLZMA=1 \
-    -DCMAKE_USE_SYSTEM_LIBRARY_ZLIB=1 \
+    -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 \
     -DKWSYS_CHAR_IS_SIGNED=1 \
     -DBUILD_CursesDialog=0 \
     ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
-- 
2.8.1


