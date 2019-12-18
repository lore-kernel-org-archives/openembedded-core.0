Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D72937FF6F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:17 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y11so2557481wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yzxoDVhIeJ3SIdGt9wFbGyt+WvZp3cdSPh1oZYRqw7s=;
	b=j7Mbf55fATqbA4dnVFx6VcmQZBuuvVHuxThgsiTor3ZlSTE1ctiRM5FbbAQpmGpSso
	Gv5NMIgJtjQJK0hsnOFOQkvpYzhAPpWpEk6ov/PYQXdg5mKoF/aDXJWhDGzlxIiO3A6A
	UohxESlzvgn5XjDBgYA1Tv+K+TYmOTYnnKyCplrDzZJfNE9lmunc/LpogQYuW06euhk9
	wR4cQrJ1OAVLY83sX/PopiLoz57QZzr0lfvnO+g1OWWe6TZN8s0Ucmk5fOe3T2ISVCpE
	1l/T/QYQlCtxr05Z9fx3u0AKxPNCOoe8vwPJAhc6NQURjIwDkhTCBiq/4t3nNAdSssrl
	fBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yzxoDVhIeJ3SIdGt9wFbGyt+WvZp3cdSPh1oZYRqw7s=;
	b=pMZ6m8jPoavQ+v5tsp6gn+1otIK6FIiB+M+D1KGRJ92Dd8Vfr2zJGK5IkFgDVioKu8
	OHilpYvINqKsYU4M1yL0syaGNKfL5GXqbUSNEo3krCJaFw6W6KJokOJ7yrExko+BwgGa
	Oa/WJMyMD3b5M1Dt0Z/hCFpzJsjczjmXcs/ntg7GwZEwOHjil+yd0qqEZK3gI2ZUbtAi
	yOVGMsZoOaK4DrSf+psgZUJ3eZ5Yxn3Wn5yL+69Za4et9nmtAmd25mrFBEqGd3iob6hn
	lWACCJ6hg4K//gSxruFIX7wU/k7X/fEU1TVctgDOHW/suHesKYQf0VuPN2QKA1ZjF1+C
	QnKA==
X-Gm-Message-State: APjAAAWTQwjtBj0X2PMBZuqfCw2zW54gmKKmnSCNc213XAmYx7ef3/JB
	yuWkRqRKaL74cSQyw7izunDI1i/gfa4=
X-Google-Smtp-Source: APXvYqxLQrTdQ438LZXWJT6JiTB/aDUlWA5Fv+x/eZYQzUqeml27lJZtBdu4KgRM9gOm4vT6MZ1KBw==
X-Received: by 2002:a05:6000:cb:: with SMTP id
	q11mr3187277wrx.14.1576679898533; 
	Wed, 18 Dec 2019 06:38:18 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:50 +0100
Message-Id: <20191218143758.129308-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
Subject: [PATCH 17/25] lttng-ust: update to 2.11.0
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:18 -0000

Remove patch as issue addressed upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../lttng-ust-doc-examples-disable.patch        | 17 -----------------
 ...{lttng-ust_2.10.5.bb => lttng-ust_2.11.0.bb} |  9 +++++----
 2 files changed, 5 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_2.10.5.bb => lttng-ust_2.11.0.bb} (89%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch b/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
deleted file mode 100644
index bff852799d0..00000000000
--- a/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Don't build the doc examples - we don't need them and in fact they
-never successfully built in previous iterations of the lttng-ust
-recipe anyway.
-
-Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
-
-Index: lttng-ust-2.9.1/doc/Makefile.am
-===================================================================
---- lttng-ust-2.9.1.orig/doc/Makefile.am
-+++ lttng-ust-2.9.1/doc/Makefile.am
-@@ -1,3 +1,3 @@
--SUBDIRS = . man examples
-+SUBDIRS = . man
- 
- dist_doc_DATA = java-agent.txt
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.5.bb b/meta/recipes-kernel/lttng/lttng-ust_2.11.0.bb
similarity index 89%
rename from meta/recipes-kernel/lttng/lttng-ust_2.10.5.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.11.0.bb
index cfaad30b694..6d7c05e65e3 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.10.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.11.0.bb
@@ -15,6 +15,8 @@ PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
 
 inherit autotools lib_package manpages python3native
 
+EXTRA_OECONF = "--disable-numa"
+
 DEPENDS = "liburcu util-linux"
 RDEPENDS_${PN}-bin = "python3-core"
 
@@ -26,12 +28,11 @@ RCONFLICTS_${PN} = "lttng2-ust"
 PE = "2"
 
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
-           file://lttng-ust-doc-examples-disable.patch \
            file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch \
-          "
+           "
 
-SRC_URI[md5sum] = "f0c86a9fa7dcfd0205fb42584a310b1c"
-SRC_URI[sha256sum] = "06f9ed9b2198855b1c7fcbf15fe57297ee259409ffa1b3bad87321412d98bc35"
+SRC_URI[md5sum] = "99823cfeb76562d753ffe67880e9cc59"
+SRC_URI[sha256sum] = "683280cfe5e12021e64c32cef9eeb0128f1f23dec32ba28adb5a2074be37c4d8"
 
 CVE_PRODUCT = "ust"
 
-- 
2.17.1


