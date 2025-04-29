Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 510A8C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 13:21:17 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.19719.1745932868905366402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 06:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GUSjLV4V;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac25520a289so952810966b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 06:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745932867; x=1746537667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSML+UErPJPqgi438AczIk6YCeDE8wtwFwPRR+h6BoA=;
        b=GUSjLV4ViNn+EA+JZwXKlW1thI66ZvflFyVgZVKQ7qxrhxLfF2L85gFEfgKa1rENWm
         50d8aYpw+lYjaoJOTWDsjiVgWWxtVxn64HvuDOBC0wfB8kKaC6A9Xyzp0QqbU27VBAhp
         4adZ4nFXngK9M52j4kd8GmXogw2PCAYV/0Sk9wP6oceCfTmUMLdQD/lCUl/AtvwRRawA
         RZAa3NEdTooosAybkURajvKRsbFmdIng2dONP4F6PeG6SSJ2iyEh3NTbcQ9PR470Yll9
         bFyYx+22JXKEsQmG7TNSbYRUrJ3J26WhuW+M2btG9G1n0m21jZAd8cCjLawuX95glXxd
         Ftkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932867; x=1746537667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSML+UErPJPqgi438AczIk6YCeDE8wtwFwPRR+h6BoA=;
        b=U9Rf6iApXY0khkDuvg2XFG4kzB9AUl02za0GFnAF3AlOhR5XDjq7Gdp981rkD299DA
         3uhjej6jqHh+D6hfr1IFarW1NFRX1oOEeDb6S5aQjdpS8qHHqoXHKsNYVV2I8cWVIgLz
         FcIlwlXZKxl3G+j9npgufa1ywxB/EV/CdKW136KMMpF59L8FlhhcVTSAtUPbyJTJQLyH
         zFriEiwuIs7oviTvonrG0Vkhd4J3WBjMpt8wxzgufpEPq5LAClRFGRwDQZRuxvyAxZmy
         q+7x7a01pg/ITPbcQcbRdPdOr/6vdxYmwMBmYUx7ijfBFZ76CWv3Ild1bax3HXABtFih
         pLjw==
X-Forwarded-Encrypted: i=1; AJvYcCVF5BA2CbS/Bw4s/LZONZPL+buRjrAVuYd2+CYwjXnWRcC8RPmzxKq2Xxe2SJ67rFWDIteyOXt4LrjSirdVow1BxA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxls8wz4xKgZftBSSGyC1p8YaUxYRJ4BlgiueB7T5zozt9mrSkp
	kad7/LTG4hZzQVG4nZMKb7oweEfdhcL3gKxq4EjCfuSvAU0yV7j+
X-Gm-Gg: ASbGncvY8kij65WESGF+ofOQ4Xv8yRHTk3lKdvBhHfPb0KDzn/N+bJlgyxA99lETOED
	rwJXcVT3Ue15sU+FsGKVMqco861CXIxWDfqPvi/RpAblqUkzliBctkHlcUodEHZ+n7z3pxLcS8v
	y8+D5L7QSPUN7f2Wzhwff86cZQEEPENffE9l1jTGe2DsPS4rc5qAXqKFAzumqT+35LAQkU8MGAN
	dZTYLIZUFsNERnRQGYT0h5TPlXN4n0Tuq61Js2MChK/kbhbGLiqp69JGqrOHmPXLyLiS/WN83K4
	+ApWqLbm2BeCZE6M21AmJhUFfHxHknAI6cPHBsb1CZIaNU2hGLj0DHXFxcDb
X-Google-Smtp-Source: AGHT+IFlaT9Pn2c4nTH7pp4TIPgH1E56r2RQj9io5i2kl9FMBncGqa9AZE4j17i06dLA1CF0ViBmGA==
X-Received: by 2002:a17:907:60d0:b0:acb:6472:c444 with SMTP id a640c23a62f3a-acec4cef5a5mr384804366b.32.1745932866833;
        Tue, 29 Apr 2025 06:21:06 -0700 (PDT)
Received: from localhost.localdomain ([185.164.141.141])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f48a3sm7384344a12.34.2025.04.29.06.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 06:21:06 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
To: bruce.ashfield@gmail.com
Cc: michalwsieron@gmail.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH v2] kernel-module-split: Allow for external conf files
Date: Tue, 29 Apr 2025 15:20:36 +0200
Message-ID: <20250429132035.213425-2-michalwsieron@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <aAKpeGEgdlK3jOdy@gmail.com>
References: <aAKpeGEgdlK3jOdy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 13:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215664

Some recipes might provide conf files produced during build phase or
simply tracked in the VCS instead of generating them with Yocto.
In such cases those conf files wouldn't be assigned to correct packages.
With this change, if user wants to generate a conf file they still can,
but not generating them won't prevent assigning the file to proper
package given the file exists.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---

I am quite busy lately so didn't have time to go back to this topic.

This v2 differs from v1 by added comments and post install hook is now
treated the same way as (CONF)FILES:* variable modification.

 .../kernel-module-split.bbclass               | 27 +++++++++++++------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 9487365eb7..a2d81f18e2 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -99,9 +99,12 @@ python split_kernel_module_packages () {
             bb.warn("module_autoload_%s was replaced by KERNEL_MODULE_AUTOLOAD for cases where basename == module name, please drop it" % basename)
         if autoload and basename not in autoloadlist:
             bb.warn("module_autoload_%s is defined but '%s' isn't included in KERNEL_MODULE_AUTOLOAD, please add it there" % (basename, basename))
+
+        # The .conf file can either be installed by a recipe or generated from module_autoload_*
+        conf = '%s/%s.conf' % (d.getVar('modulesloaddir'), basename)
+        name = '%s%s' % (dvar, conf)
+        # If module name is in KERNEL_MODULE_AUTOLOAD, then generate the .conf file and write to `name`.
         if basename in autoloadlist:
-            conf = '%s/%s.conf' % (d.getVar('modulesloaddir'), basename)
-            name = '%s%s' % (dvar, conf)
             os.makedirs(os.path.dirname(name), exist_ok=True)
             with open(name, 'w') as f:
                 if autoload:
@@ -109,6 +112,9 @@ python split_kernel_module_packages () {
                         f.write('%s\n' % m)
                 else:
                     f.write('%s\n' % basename)
+        # If the .conf file exits, then add it to FILES:* and CONFFILES:* and add postinstall hook.
+        # It doesn't matter if it was generated from module_autoload_* or installed by the recipe.
+        if os.path.exists(name):
             conf2append = ' %s' % conf
             d.appendVar('FILES:%s' % pkg, conf2append)
             d.appendVar('CONFFILES:%s' % pkg, conf2append)
@@ -121,18 +127,23 @@ python split_kernel_module_packages () {
         # Write out any modconf fragment
         modconflist = (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()
         modconf = d.getVar('module_conf_%s' % basename)
+
+        # The .conf file can either be installed by a recipe or generated from module_conf_*
+        conf = '%s/%s.conf' % (d.getVar('modprobedir'), basename)
+        name = '%s%s' % (dvar, conf)
+        # If module name is in KERNEL_MODULE_PROBECONF, then generate the .conf file and write to `name`.
         if modconf and basename in modconflist:
-            conf = '%s/%s.conf' % (d.getVar('modprobedir'), basename)
-            name = '%s%s' % (dvar, conf)
             os.makedirs(os.path.dirname(name), exist_ok=True)
             with open(name, 'w') as f:
                 f.write("%s\n" % modconf)
-            conf2append = ' %s' % conf
-            d.appendVar('FILES:%s' % pkg, conf2append)
-            d.appendVar('CONFFILES:%s' % pkg, conf2append)
-
         elif modconf:
             bb.error("Please ensure module %s is listed in KERNEL_MODULE_PROBECONF since module_conf_%s is set" % (basename, basename))
+        # If the .conf file exits, then add it to FILES:* and CONFFILES:*.
+        # It doesn't matter if it was generated from module_conf_* or installed by the recipe.
+        if os.path.exists(name):
+            conf2append = ' %s' % conf
+            d.appendVar('FILES:%s' % pkg, conf2append)
+            d.appendVar('CONFFILES:%s' % pkg, conf2append)
 
         if "description" in vals:
             old_desc = d.getVar('DESCRIPTION:' + pkg) or ""
-- 
2.49.0


