Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id CA88E7FCAA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:28 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id b19so128348wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CKJ3uoR9UNatPeECJKxvyR8hFNaxjC+bCejTuBw68RM=;
	b=ODs8TOTxaJMYekjSlXdtKTMHNaWKkckTXs9uWJtX7NXsIwaTLb/b1d1i3QsOhlhBRO
	4gVwKoR+TdFQWm0/Ya5LGurdqveq83RvrrO3usvF8BB5U+DVJxiced+QaQgVfZ60xGsd
	MTHLjSIvfmj+2fkOljUljyU6Rt8Mvj6yr2tqdiFsh8t+MywGXPHIHwIfp/Yi3GCY77py
	fOMMnp4IH6R+o/sQPTRwyJwOHOHktA7QwPesZFlx+FtCD+y/Ep6soBM8NEyF8nTLMnvm
	Plu8CO4THjQMTMZQQjcsEskxCN1LsQm3S4NKT8pqnBD3yohPba4j5eMVAUmMRN/T1Vki
	HZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CKJ3uoR9UNatPeECJKxvyR8hFNaxjC+bCejTuBw68RM=;
	b=AQwGEnFDtlnggwikI9wirTAW8EAN2ybPNo7lPDJrJC2GGMQOXzspe77wHRUfzv6ULp
	pFbVRj5izxAfBpt6IOLyV9dGLCwsRo9oEUkxwKKXNa2jkKBqEkGBgzgDURFSnIw39+C+
	KcMGwTvMg1Nz6L1rJnn0iShUTm+AS1ySHViD/ihrAoaELSxCSO0epFx+hlOWe+/KNgt0
	+ZpoQ9CUZGgR0MyWVoBz+vH84sX7ZQOg2MqvbyG63gCEWfnOZPtOK/m1Oc7a7W8x3I4+
	voPB1VhrER+ayo2Hv3sBmIw94KKmGJKZChfZZAFJn7H86cRzSVMoAIKVuwcGQf/AvDqz
	KiFA==
X-Gm-Message-State: APjAAAUPuJKQ3Fm2+EfFsFL6URtXd+nQfxd6LI3BOyzLAwHpyhq/n2Za
	uKPbdNd8XwhX/DPwIesExFqgS9Dg
X-Google-Smtp-Source: APXvYqwygKzm2eOM3SJ0HaziPNilDauYgYnq5KD8FeScFx8soOmE5xX5XialmcOU4fh+idr0wOJlog==
X-Received: by 2002:a1c:a78c:: with SMTP id q134mr391284wme.98.1579541128992; 
	Mon, 20 Jan 2020 09:25:28 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:24:53 +0100
Message-Id: <20200120172510.22648-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/24] selftest: check maintainers.inc for entries without recipes
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:29 -0000

Also remove a couple of entries found by the test :)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc   |  6 ----
 meta/lib/oeqa/selftest/cases/distrodata.py | 34 ++++++++++++++++++++--
 2 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ffb6da7dae9..01afc25b939 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -183,7 +183,6 @@ RECIPE_MAINTAINER_pn-flex = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-font-alias = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-font-util = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-fontconfig = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-foomatic-filters = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-formfactor = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-freetype = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-fribidi = "Ross Burton <ross.burton@intel.com>"
@@ -551,7 +550,6 @@ RECIPE_MAINTAINER_pn-pciutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-pcmanfm = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-perf = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-perl = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-perl-native = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-piglit = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-pigz = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-pinentry = "Armin Kuster <akuster808@gmail.com>"
@@ -574,9 +572,6 @@ RECIPE_MAINTAINER_pn-ptest-runner = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-pulseaudio = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-pulseaudio-client-conf-sato = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-python = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3 = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-async = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-dbus = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
@@ -586,7 +581,6 @@ RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kr
 RECIPE_MAINTAINER_pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python3-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pbr = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index 68ba556485e..5f7f488349a 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -42,8 +42,9 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
 
     def test_maintainers(self):
         """
-        Summary:     Test that oe-core recipes have a maintainer
+        Summary:     Test that oe-core recipes have a maintainer and entries in maintainers list have a recipe
         Expected:    All oe-core recipes (except a few special static/testing ones) should have a maintainer listed in maintainers.inc file.
+        Expected:    All entries in maintainers list should have a recipe file that matches them
         Product:     oe-core
         Author:      Alexander Kanavin <alex.kanavin@gmail.com>
         """
@@ -54,7 +55,16 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
                      return True
             return False
 
-        feature = 'require conf/distro/include/maintainers.inc\n'
+        def is_maintainer_exception(entry):
+            exceptions = ["systemd", "musl", "libpam", "newlib", "linux-yocto", "opensbi", "linux-dummy",
+                          "mesa-gl", "libgfortran", "volatile-binds", "libgloss", "bsd-headers",
+                          "cve-update-db-native", "libssp-nonshared", "argp-standalone", "fts"]
+            for i in exceptions:
+                 if i in entry:
+                     return True
+            return False
+
+        feature = 'require conf/distro/include/maintainers.inc\nLICENSE_FLAGS_WHITELIST += " commercial"\n'
         self.write_config(feature)
 
         with bb.tinfoil.Tinfoil() as tinfoil:
@@ -62,6 +72,11 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
 
             with_maintainer_list = []
             no_maintainer_list = []
+
+            missing_recipes = []
+            recipes = []
+            prefix = "RECIPE_MAINTAINER_pn-"
+
             # We could have used all_recipes() here, but this method will find
             # every recipe if we ever move to setting RECIPE_MAINTAINER in recipe files
             # instead of maintainers.inc
@@ -71,6 +86,7 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
                     continue
                 rd = tinfoil.parse_recipe_file(fn, appends=False)
                 pn = rd.getVar('PN')
+                recipes.append(pn)
                 if is_exception(pn):
                     continue
                 if rd.getVar('RECIPE_MAINTAINER'):
@@ -78,6 +94,15 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
                 else:
                     no_maintainer_list.append((pn, fn))
 
+            maintainers = tinfoil.config_data.keys()
+            for key in maintainers:
+                 if key.startswith(prefix):
+                     recipe = tinfoil.config_data.expand(key[len(prefix):])
+                     if is_maintainer_exception(recipe):
+                         continue
+                     if recipe not in recipes:
+                         missing_recipes.append(recipe)
+
         if no_maintainer_list:
             self.fail("""
 The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
@@ -87,3 +112,8 @@ The following recipes do not have a maintainer assigned to them. Please add an e
             self.fail("""
 The list of oe-core recipes with maintainers is empty. This may indicate that the test has regressed and needs fixing.
 """)
+
+        if missing_recipes:
+                self.fail("""
+Unable to find recipes for the following entries in maintainers.inc:
+""" + "\n".join(['%s' % i for i in missing_recipes]))
-- 
2.17.1


