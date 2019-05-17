Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8CEA37DEB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:01 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id j187so9851433wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=M0sKSuDnOL+zrtjSm+jQ1zGv3M/+R1210pzqUWvDmQ0=;
	b=pK/gc0TPdekN2Mm61kyA4iVAzbabgOVniDvCF4lFpHVIb+d/DYuRU98xtznLn3otcD
	9BsK+WOcRLP+/Xoc0Wl+77bthUdx4t4iJjevaPcv/AXUU2Ozw/TY59/VCOGoDbWklNwW
	MS3tlB50bzUwTBtinjQIl92co8+PDEa/2NMNgd5nlaNlSDRBouDmJ3EaT806XlL6t+5D
	6UaFSNKjcFCUHjaryUidIC4sZI5MIB9DRjj8B+3SxfcBUUpqdydHaGlNwUjEG+/7Q4Bc
	eDWkCB+1ddZOXrSEAPos6nUvYcOz1KmwwSH7GoIwU70ncp4ejcLRfmSOAVhxD1KRouOK
	kGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=M0sKSuDnOL+zrtjSm+jQ1zGv3M/+R1210pzqUWvDmQ0=;
	b=N5dSrPqBoTZxV30HM0Qcl4YcMUFfNT6jd8nkO9jDd9/uuvmXKtnPTv+EI5RdocTKGc
	2UQUVDust53G+JQcjgl6Dq5DmVmYrTlmFYNuj5U5NQtz9k9LL7tNzX/oUq94jKPKdmuN
	MSmFucZ+u15iSD/b3AmTC/a0QjKR1gyGLwJoRl1v8ZNrf1haqNTEJNtFUoB8asjVrvRq
	udqEMKBHP9tjkIRF9h2C0iZXbgOKWKhSE7myPyCIwuzHIcIpyHAcASILG5TEL+41Z6j1
	sz5Nk99TMOtlfUE76KVxdgudehbqg8CrSnkd1i3qVoRg0jhFZlY9kehL7u56emELDzZ9
	r6fw==
X-Gm-Message-State: APjAAAUEaSwhQ8nieyJYo0bEOXgIABHnuU5h5ynDUhiCBImUEy1WO/7f
	idSt+iq3jrApt65BK66Lic80i57u
X-Google-Smtp-Source: APXvYqwXx7oVIjDxcQmQx0Z3fBkP42qtBQUFmCfn/L+lpSsn4tgoUdRzcSy2FSJSL5QGaamSOJI5EA==
X-Received: by 2002:a1c:9616:: with SMTP id y22mr3186519wmd.73.1558116722109; 
	Fri, 17 May 2019 11:12:02 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:19 +0200
Message-Id: <20190517181151.44001-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/37] adwaita-icon-theme: upgrade 3.30.1 -> 3.32.0
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
X-List-Received-Date: Fri, 17 May 2019 18:12:01 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch                  | 6 +++---
 ...ta-icon-theme_3.30.1.bb => adwaita-icon-theme_3.32.0.bb} | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.30.1.bb => adwaita-icon-theme_3.32.0.bb} (92%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
index 43abdcd85ac..4a983633139 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
@@ -1,4 +1,4 @@
-From 499222d95a3d06bc425672d50e8c47868667250b Mon Sep 17 00:00:00 2001
+From 4409423752885f76326d05c1266698155f47c5f9 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 30 May 2017 14:55:49 +0300
 Subject: [PATCH] Don't use AC_CANONICAL_HOST
@@ -14,12 +14,12 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 38e64bd..6ed480e 100644
+index 4a84501..52dbb8e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -3,7 +3,6 @@ AC_PREREQ(2.53)
  
- AC_INIT([adwaita-icon-theme], [3.30.1],
+ AC_INIT([adwaita-icon-theme], [3.32.0],
          [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
 -AC_CANONICAL_HOST
  AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb
similarity index 92%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb
index 8eadbd2eef7..02676f44010 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Run-installation-commands-as-shell-jobs.patch \
            "
 
-SRC_URI[md5sum] = "db3fd812821d72fdd9a3c7d622a95b35"
-SRC_URI[sha256sum] = "6d752a2b1bc668483956d4485c39cad1642d9358e133ff689526e43674a4e1ce"
+SRC_URI[md5sum] = "4b16278cfed860a86c8221de62eec151"
+SRC_URI[sha256sum] = "698db6e407bb987baec736c6a30216dfc0317e3ca2403c7adf3a5aa46c193286"
 
 DEPENDS += "librsvg-native"
 
-- 
2.17.1


