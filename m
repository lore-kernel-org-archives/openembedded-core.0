Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 86831784DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 13:19:45 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 9so12938301wme.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 05:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=04Q9jFNDS0AIH8TUyf+panEsDtOntruttrif09bwxCc=;
	b=Dknckf2V+F27t4f9j8ReFysK1mgvktaQsO5IHlLFdPtZHvrO6TU178fw0ApLnfrzK3
	rAaL3roCddAnzH9O4CF1SJKr9cV0SkrCZP9Vgku3c504zHVJjgyP9K400yJ+I0v4x+Ij
	J+Vrs4wKFmZxI/SKke0VfJyNENmfCT9odvVqOlOvD+586y63/tmFhcovfcTs1JEBk4eM
	+YNSXnAcYbdtXJ/+Ebl143M3FDLoPYW1CqFYLE+PEAox+sGGWycU0wdDGVODLhMnvzSb
	/kdO4zAK0m8z9qarIpGAB6srRmR0N2VgBbzOnA5wmmIScDkjwK8Ul3WLLhboQA303Zwf
	gSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=04Q9jFNDS0AIH8TUyf+panEsDtOntruttrif09bwxCc=;
	b=WZN/Z7GROrAC3KpTsuPpvq9ZW/3/zHprQctI8DPSF634n2Tj8xCuICLNQnhgwcirjK
	YvAGzUXqvK8WVEBmzorUWTQQIakl7T7WyZYh6oNWb0dD4su3yMtr8FCTtCX4TqNBvLaV
	H1e80xHUd3dZ5eeRPUl/4stgHBBwJXQ2LPsVpvyhGKQaAJIxNlE+tmewlAcPc6RjJAlQ
	+F3+Kk5OsFROhABoE/2rB6l4jS58v8UgKkk4bj2HD0Vv9/mBvTWDA4aKE2ZGFUU5Glfj
	rZo7U6JcJrbEdmQY3l9e102KMej5D1uNu4d9wty07+XxGNSqAt5vo/zjIyPDrRix0zqz
	ZCVw==
X-Gm-Message-State: AJaThX5ZVDKPFn4l/X/jV2HPVuY9DGzZ+OtLCWxZX2js/uRj+yq1FQ6e
	CyvyBgoRIluigs76u99iSVON1/Lx
X-Google-Smtp-Source: AGs4zMYy0tarGVmhCkv6pBsKVYXI5d8k80ewkgz3fD0Godbes43o9iKHrSGE2JOsKZGMmuUqCmf2qg==
X-Received: by 10.28.63.141 with SMTP id m135mr1992697wma.72.1512047985922;
	Thu, 30 Nov 2017 05:19:45 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	q15sm3602780wra.91.2017.11.30.05.19.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Nov 2017 05:19:45 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Nov 2017 13:19:34 +0000
Message-Id: <20171130131935.20771-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171130131935.20771-1-ross.burton@intel.com>
References: <20171130131935.20771-1-ross.burton@intel.com>
Subject: [PATCH 3/4] gperf: merge inc into bb
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
X-List-Received-Date: Thu, 30 Nov 2017 13:19:46 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/gperf/gperf.inc    | 22 ----------------------
 meta/recipes-extended/gperf/gperf_3.1.bb | 23 +++++++++++++++++++++--
 2 files changed, 21 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-extended/gperf/gperf.inc

diff --git a/meta/recipes-extended/gperf/gperf.inc b/meta/recipes-extended/gperf/gperf.inc
deleted file mode 100644
index a8ce230f652..00000000000
--- a/meta/recipes-extended/gperf/gperf.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "GNU gperf is a perfect hash function generator"
-HOMEPAGE = "http://www.gnu.org/software/gperf"
-SUMMARY  = "Generate a perfect hash function from a set of keywords"
-LICENSE  = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://src/main.cc;beginline=8;endline=19;md5=dec8f611845d047387ed56b5b85fa99b"
-
-SRC_URI  = "${GNU_MIRROR}/gperf/gperf-${PV}.tar.gz"
-
-inherit autotools
-
-# autoreconf couldn't find acinclude.m4 when stepping into subdirectory. Instead of
-# duplicating acinclude.m4 in every subdirectory, use absolute include path to aclocal
-EXTRA_AUTORECONF += " -I ${S}"
-
-do_configure_prepend() {
-        if [ ! -e ${S}/acinclude.m4 ]; then
-                cat ${S}/aclocal.m4 > ${S}/acinclude.m4
-        fi
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/gperf/gperf_3.1.bb b/meta/recipes-extended/gperf/gperf_3.1.bb
index 942820b91d5..c680ee183cb 100644
--- a/meta/recipes-extended/gperf/gperf_3.1.bb
+++ b/meta/recipes-extended/gperf/gperf_3.1.bb
@@ -1,5 +1,24 @@
-require gperf.inc
-
+DESCRIPTION = "GNU gperf is a perfect hash function generator"
+HOMEPAGE = "http://www.gnu.org/software/gperf"
+SUMMARY  = "Generate a perfect hash function from a set of keywords"
+LICENSE  = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://src/main.cc;beginline=8;endline=19;md5=dec8f611845d047387ed56b5b85fa99b"
 
+SRC_URI  = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
 SRC_URI[md5sum] = "9e251c0a618ad0824b51117d5d9db87e"
 SRC_URI[sha256sum] = "588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2"
+
+inherit autotools
+
+# autoreconf couldn't find acinclude.m4 when stepping into subdirectory. Instead of
+# duplicating acinclude.m4 in every subdirectory, use absolute include path to aclocal
+EXTRA_AUTORECONF += " -I ${S}"
+
+do_configure_prepend() {
+        if [ ! -e ${S}/acinclude.m4 ]; then
+                cat ${S}/aclocal.m4 > ${S}/acinclude.m4
+        fi
+}
+
+BBCLASSEXTEND = "native"
-- 
2.11.0


