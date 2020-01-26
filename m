Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3F3E7916C9
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:07 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id g6so2872538plt.2
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=InrLC/iCUeYi3JCXTuGIrpFb0U/EnSsCUPwVVCkwnMg=;
	b=H7NjyPMCGxh+E1uyp+Dmjn6LIr8O1NyKinMUN5gKHCU+wGhV9r4JU54kfDqPFlcha+
	gUWWZirB6DSBmNYaeJFNqgpX3yZI+Pj0cvg3Uh9W533ZhNJNuPID/bOaZ47C4vgXNcKS
	fIZdzD4zvfaRC1XQseN1+5F+Ji58ylOPm7Gy0pJNr8EgnGoRoG+HJITysB1qWUM6u2sL
	IRyoHuOs2VwThj2TQOdl5WfXeqYkVxKYRu0/XfmLwbuOcIZ/6CjIIYdMnd9iYxzlVWyR
	igiazdZ7n2IiaG5Jr56xOefGf0f1RNNhzsrZEmVaWxE0Cqmrg98DFXxeTa0dIObeInjC
	K6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=InrLC/iCUeYi3JCXTuGIrpFb0U/EnSsCUPwVVCkwnMg=;
	b=VpXhBgxlBqjkM9Sv9YKSk6Z64pNOMHhZNfi4lfFW8zgdIfXtb1fZepE8fVlFWe3vf7
	7twT94pNH8kzf8GSq/ZhDxrHiAgbElX+ZoASllmsptYhTPxvk1U8EIZxZVz9O6LKdag3
	FdKdDBsHcQCQFoSlWd9nAnnWDzPK4SP4kTVFtLW0bPho0L+qITeLF3vofdpdxqoisJU7
	ALP3GXdzt/SjqGQ3n3fGQJdiacW/TVJmRRjVAeNOqeZBAL7YYF0RZwUT4TyATfNXbB45
	nLPQUa3zCBLVH7Otr04YdqsznpLkaUMyM8eWjbVoEMh1ilppnd9fGrokOT4Ntj0Hi/Zs
	cbww==
X-Gm-Message-State: APjAAAVhelIxMvEbqlN7iXyd+ms+WV2j1k4XZUptZwkylwRNFNU/W/Q+
	vJb8HtGvZnNPqyKuJtBEIhdMSY4V
X-Google-Smtp-Source: APXvYqyk86cd16qiZ2WZ/ExBcjF3bxQHVZT3eB5cERx727SLZWl9SaCSH0/QRlvBOP7kufk9ZJCfTQ==
X-Received: by 2002:a17:90a:ba91:: with SMTP id
	t17mr10312015pjr.74.1580055908152; 
	Sun, 26 Jan 2020 08:25:08 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.07
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:39 -0800
Message-Id: <021c8ae8e115ff6bab167146d97a340d4945118d.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 14/29] nasm: fix CVE-2018-19755
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:07 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../nasm/nasm/CVE-2018-19755.patch            | 116 ++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.14.02.bb    |   4 +-
 2 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2018-19755.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2018-19755.patch b/meta/recipes-devtools/nasm/nasm/CVE-2018-19755.patch
new file mode 100644
index 0000000000..6e3f909d0f
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2018-19755.patch
@@ -0,0 +1,116 @@
+From 3079f7966dbed4497e36d5067cbfd896a90358cb Mon Sep 17 00:00:00 2001
+From: Cyrill Gorcunov <gorcunov@gmail.com>
+Date: Wed, 14 Nov 2018 10:03:42 +0300
+Subject: [PATCH] preproc: Fix malformed parameter count
+
+readnum returns 64bit number which may become
+a negative integer upon conversion which in
+turn lead to out of bound array access.
+
+Fix it by explicit conversion with bounds check
+
+ | POC6:2: error: parameter count `2222222222' is out of bounds [0; 2147483647]
+
+https://bugzilla.nasm.us/show_bug.cgi?id=3392528
+
+Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2018-19755
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ asm/preproc.c | 43 +++++++++++++++++++++----------------------
+ 1 file changed, 21 insertions(+), 22 deletions(-)
+
+diff --git a/asm/preproc.c b/asm/preproc.c
+index b6afee3..e5ad05a 100644
+--- a/asm/preproc.c
++++ b/asm/preproc.c
+@@ -1650,6 +1650,23 @@ smacro_defined(Context * ctx, const char *name, int nparam, SMacro ** defn,
+     return false;
+ }
+ 
++/* param should be a natural number [0; INT_MAX] */
++static int read_param_count(const char *str)
++{
++    int result;
++    bool err;
++
++    result = readnum(str, &err);
++    if (result < 0 || result > INT_MAX) {
++        result = 0;
++        nasm_error(ERR_NONFATAL, "parameter count `%s' is out of bounds [%d; %d]",
++                   str, 0, INT_MAX);
++    } else if (err) {
++        nasm_error(ERR_NONFATAL, "unable to parse parameter count `%s'", str);
++    }
++    return result;
++}
++
+ /*
+  * Count and mark off the parameters in a multi-line macro call.
+  * This is called both from within the multi-line macro expansion
+@@ -1871,11 +1888,7 @@ static bool if_condition(Token * tline, enum preproc_token ct)
+                   pp_directives[ct]);
+         } else {
+             searching.nparam_min = searching.nparam_max =
+-                readnum(tline->text, &j);
+-            if (j)
+-                nasm_error(ERR_NONFATAL,
+-                      "unable to parse parameter count `%s'",
+-                      tline->text);
++                read_param_count(tline->text);
+         }
+         if (tline && tok_is_(tline->next, "-")) {
+             tline = tline->next->next;
+@@ -1886,11 +1899,7 @@ static bool if_condition(Token * tline, enum preproc_token ct)
+                       "`%s' expects a parameter count after `-'",
+                       pp_directives[ct]);
+             else {
+-                searching.nparam_max = readnum(tline->text, &j);
+-                if (j)
+-                    nasm_error(ERR_NONFATAL,
+-                          "unable to parse parameter count `%s'",
+-                          tline->text);
++                searching.nparam_max = read_param_count(tline->text);
+                 if (searching.nparam_min > searching.nparam_max) {
+                     nasm_error(ERR_NONFATAL,
+                           "minimum parameter count exceeds maximum");
+@@ -2079,8 +2088,6 @@ static void undef_smacro(Context *ctx, const char *mname)
+  */
+ static bool parse_mmacro_spec(Token *tline, MMacro *def, const char *directive)
+ {
+-    bool err;
+-
+     tline = tline->next;
+     skip_white_(tline);
+     tline = expand_id(tline);
+@@ -2103,11 +2110,7 @@ static bool parse_mmacro_spec(Token *tline, MMacro *def, const char *directive)
+     if (!tok_type_(tline, TOK_NUMBER)) {
+         nasm_error(ERR_NONFATAL, "`%s' expects a parameter count", directive);
+     } else {
+-        def->nparam_min = def->nparam_max =
+-            readnum(tline->text, &err);
+-        if (err)
+-            nasm_error(ERR_NONFATAL,
+-                  "unable to parse parameter count `%s'", tline->text);
++        def->nparam_min = def->nparam_max = read_param_count(tline->text);
+     }
+     if (tline && tok_is_(tline->next, "-")) {
+         tline = tline->next->next;
+@@ -2117,11 +2120,7 @@ static bool parse_mmacro_spec(Token *tline, MMacro *def, const char *directive)
+             nasm_error(ERR_NONFATAL,
+                   "`%s' expects a parameter count after `-'", directive);
+         } else {
+-            def->nparam_max = readnum(tline->text, &err);
+-            if (err) {
+-                nasm_error(ERR_NONFATAL, "unable to parse parameter count `%s'",
+-                      tline->text);
+-            }
++            def->nparam_max = read_param_count(tline->text);
+             if (def->nparam_min > def->nparam_max) {
+                 nasm_error(ERR_NONFATAL, "minimum parameter count exceeds maximum");
+                 def->nparam_max = def->nparam_min;
+-- 
+2.10.5.GIT
+
diff --git a/meta/recipes-devtools/nasm/nasm_2.14.02.bb b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
index ecec78d8ec..e4f964ce93 100644
--- a/meta/recipes-devtools/nasm/nasm_2.14.02.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
@@ -3,7 +3,9 @@ SECTION = "devel"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 
-SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2"
+SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
+           file://CVE-2018-19755.patch \
+           "
 
 SRC_URI[md5sum] = "3f489aa48ad2aa1f967dc5e293bbd06f"
 SRC_URI[sha256sum] = "34fd26c70a277a9fdd54cb5ecf389badedaf48047b269d1008fbc819b24e80bc"
-- 
2.17.1


