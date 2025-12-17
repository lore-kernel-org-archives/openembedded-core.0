Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0CFD65526
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 09:42:05 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11099.1765964518963370677
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 01:41:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iPdpsb18;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b736d883ac4so873522766b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 01:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765964517; x=1766569317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PThKYS37zF79wn8O1AiDF6R0oiNV+bRVJXIj1h41B8Y=;
        b=iPdpsb18UNkougxi8MHaB1x+xLelAxZUsQmdWDfPYBhdrrLdHdN8kuo9epp5rjwT8L
         NFUf+u62ocILkIz31YxbP0rSskr+WwSHgJ2rLjnmNLw/npn1hnSWSKwgqXBdYUh5BSCb
         IwGal5FUjG2t+3zkRPIhlqmi6+qzcUwz1yy7s01Y7ZGrHYTEsWXj0vO2s9A/IPDWCsGy
         hpGfJEAJfwmjpMh0twJMQuiStyCspyisqkdomjxzw+xrDcujhUtqoJ6kMs0UfttvlI8F
         M3JeoLaWQzCU++l/ru3Uprla+muUicV0BrbmD7tvem5oUYxAZw6B5YLICw+4RZVFK6Hx
         oRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765964517; x=1766569317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PThKYS37zF79wn8O1AiDF6R0oiNV+bRVJXIj1h41B8Y=;
        b=t+avCVfyfWMR1YwZDIcBAAKs6whuS0yn+PA3AsRGISgfqcp4hl54CGBFp6z/qO4AWT
         ZiJ/issjt3AzxF2/A740g/WYgZQqBs2U5fX1JlVOBlRXSb4TnfsrgmAXNzYmpUuXi0sH
         VLUhPglkA27qrQsw5GqhQ4N67WtXMWwKjau2PG73mjAglvKadqL/nNglUH7TJcmOmGT4
         nUVXmy0hohSChAOrG1G3YAeKSNHMXY4b8sYfbFp1SZJLGj2WjdBd3DWO/7ikGwotn+WD
         kdtGPkHHOQSmQ8wA4GIZBhOBgt6hXaTd06XOZ84l+VlmbaKxnybEFXFkutwHN3kLOvNW
         ZFMA==
X-Gm-Message-State: AOJu0YxQCNii0k1sxNy4PoR4HFB0ZH6yv8Eg30d7ou7wVBj6DeHtqO09
	3GmboJfw4ENBxotl5PUpu8k8PRFe9MP0GcCOI5YXA0kYlMnD4M+ZkU/z8KwJnU53
X-Gm-Gg: AY/fxX7jbCmpB/YerGAL6Jg5FBm6Gp/zJFZnxM+0F03+OMlvhvYnzC0PNHgP/TwWqxq
	W7HGx9ESCvEcjiLsCFKoRKe+umTxpRlDCaf94cUO70087D/HASOAxQXUwTEyOCRQT0rxIxGDYGY
	PPoHZMo320mx8XR46/LBWfvNMbsJs2S57Sm4t6CgFr4hBuRyDgaaLgTU8gWiq8mpwQi9+gghECx
	iiGUvJMBvd5b1cJfCfRbBuoYxtQIlRekpNu1j97SbbTJ1gT9w7I32RnJLzu4AMaplkeS8dMACG/
	oJXdK93JvuSbFT2uRjF38h6YeNnH8sNkqR8qlx3hzEyq4KmhnWzDMC/YcKY3rSMOqlcalb9TC+D
	Kzk6WgTN/bNgofTxTTGPqEa/DbNvklBWNubZPDS931w+Zbllh953l/dpSgbMUOQKNP9h2gJxJ4c
	NYInYagwSpBOz/KOWtva+8gETW
X-Google-Smtp-Source: AGHT+IGr6Qf6tURHICiJLaqkvfvvaU7e82NEpwy+RxUzF5+nsadpxiXSb4VFEOwNtr+sbUS/9guKpQ==
X-Received: by 2002:a17:907:7b8a:b0:b73:5c12:3f8a with SMTP id a640c23a62f3a-b7d23698224mr1847367566b.18.1765964516936;
        Wed, 17 Dec 2025 01:41:56 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7ff7e5e79esm399533566b.46.2025.12.17.01.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:41:56 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH] cross.bbclass: Propagate dependencies to outhash
Date: Wed, 17 Dec 2025 10:41:53 +0100
Message-ID: <20251217094153.852432-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 09:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228015

From: Martin Jansa <martin.jansa@gmail.com>

Similar to what native and staging is doing since:
https://git.openembedded.org/openembedded-core/commit/meta/classes/native.bbclass?id=d6c7b9f4f0e61fa6546d3644e27abe3e96f597e2
https://git.openembedded.org/openembedded-core/commit/meta/classes/staging.bbclass?id=1cf62882bbac543960e4815d117ffce0e53bda07

Cross task outputs can call native dependencies and even when cross
recipe output doesn't change it might produce different results when
the called native dependency is changed, e.g. clang-cross-${TARGET_ARCH}
contains symlink to clang binary from clang-native, but when clang-native
outhash is changed, clang-cross-${TARGET_ARCH} will still be considered
equivalent and target recipes aren't rebuilt with new clang binary, see
work around in https://github.com/kraj/meta-clang/pull/1140 to make target
recipes to depend directly not only on clang-cross-${TARGET_ARCH} but
clang-native as well.

I have added a small testcase in meta-selftest which demostrates this issue.
Not included in this change, but will send it if useful.

openembedded-core $ ls -1 meta-selftest/recipes-devtools/hashequiv-test/
print-datetime-link-cross.bb
print-datetime-link-native.bb
print-datetime-native.bb
print-datetime-usecross.bb
print-datetime-usenative.bb

print-datetime-native provides script which prints defined PRINT_DATETIME variable.

print-datetime-link-native and print-datetime-link-cross both provide a symlink to
the script from print-datetime-native.

print-datetime-usenative and print-datetime-usecross are target recipes using the
native and cross versions of print-datetime-link-* recipe.

  # clean build all is rebuilt:
  $ bitbake -k print-datetime-usenative print-datetime-usecross
  WARNING: print-datetime-native-1.0-r0 do_install: print-datetime-native current DATETIME in script is 2025-11-13_20_05
  WARNING: print-datetime-link-native-1.0-r0 do_install: print-datetime-link-native current DATETIME in symlink is 2025-11-13_20_05
  WARNING: print-datetime-link-cross-x86_64-1.0-r0 do_install: print-datetime-link-cross-x86_64 current DATETIME in symlink is 2025-11-13_20_05
  WARNING: print-datetime-usenative-1.0-r0 do_install: print-datetime-usenative current DATETIME from print-datetime-link is 2025-11-13_20_05
  WARNING: print-datetime-usecross-1.0-r0 do_install: print-datetime-usecross current DATETIME from print-datetime-link is 2025-11-13_20_05

  # keep sstate-cache and hashserv.db:
  # print-datetime-usenative is correctly rebuilt, because print-datetime-link-native has different hash (because print-datetime-native hash changed)
  # print-datetime-usecross wasn't rebuilt, because print-datetime-link-cross-x86_64 doesn't include the changed hash of print-datetime-native
  $ bitbake -k print-datetime-usenative print-datetime-usecross
  WARNING: print-datetime-native-1.0-r0 do_install: print-datetime-native current DATETIME in script is 2025-11-13_20_07
  WARNING: print-datetime-link-native-1.0-r0 do_install: print-datetime-link-native current DATETIME in symlink is 2025-11-13_20_07
  WARNING: print-datetime-link-cross-x86_64-1.0-r0 do_install: print-datetime-link-cross-x86_64 current DATETIME in symlink is 2025-11-13_20_07
  WARNING: print-datetime-usenative-1.0-r0 do_install: print-datetime-usenative current DATETIME from print-datetime-link is 2025-11-13_20_07

It's because print-datetime-link-cross-x86_64 depsig doesn't include print-datetime-native signature:

$ cat tmp/work/x86_64-linux/print-datetime-link-cross-x86_64/1.0/temp/depsig.do_populate_sysroot
OEOuthashBasic
18
SSTATE_PKGSPEC=sstate:print-datetime-link-cross-x86_64:x86_64-oe-linux:1.0:r0:x86_64:14:
task=populate_sysroot
drwx                                                                                       .
drwx                                                                                       ./recipe-sysroot-native
drwx                                                                                       ./recipe-sysroot-native/sysroot-providers
-rw-                   32 19fbeb373f781c2504453c1ca04dab018a7bc8388c87f4bbc59589df31523d07 ./recipe-sysroot-native/sysroot-providers/print-datetime-link-cross-x86_64
drwx                                                                                       ./recipe-sysroot-native/usr
drwx                                                                                       ./recipe-sysroot-native/usr/bin
drwx                                                                                       ./recipe-sysroot-native/usr/bin/x86_64-oe-linux
lrwx                                                                                       ./recipe-sysroot-native/usr/bin/x86_64-oe-linux/print-datetime-link -> ../print-datetime

While print-datetime-link-native doesn't have this issue, because print-datetime-native signature is there:

$ cat tmp/work/x86_64-linux/print-datetime-link-native/1.0/temp/depsig.do_populate_sysroot
OEOuthashBasic
18
print-datetime-native: 60f2734a63d708489570ca719413b4662f8368abc9f4760a279a0a5481e4a17b
quilt-native: 65d78a7a5b5cbbf0969798efe558ca28e7ef058f4232fcff266912d16f67a8b8
SSTATE_PKGSPEC=sstate:print-datetime-link-native:x86_64-linux:1.0:r0:x86_64:14:
task=populate_sysroot
drwx                                                                                       .
drwx                                                                                       ./recipe-sysroot-native
drwx                                                                                       ./recipe-sysroot-native/sysroot-providers
-rw-                   26 3d5458be834b2d0e4c65466b9b877d6028ae2210a56399284a23144818666f10 ./recipe-sysroot-native/sysroot-providers/print-datetime-link-native
drwx                                                                                       ./recipe-sysroot-native/usr
drwx                                                                                       ./recipe-sysroot-native/usr/bin
lrwx                                                                                       ./recipe-sysroot-native/usr/bin/print-datetime-link -> print-datetime

With the cross.bbclass fix the link-cross recipe has a checksum from native recipe as well:

$ cat tmp/work/x86_64-linux/print-datetime-link-cross-x86_64/1.0/temp/depsig.do_populate_sysroot
OEOuthashBasic
18
print-datetime-native: 9ceb6c27342eae6b8da86c84685af38fb8927ccc19979aae75b8b1e444b11c5c
quilt-native: 65d78a7a5b5cbbf0969798efe558ca28e7ef058f4232fcff266912d16f67a8b8
SSTATE_PKGSPEC=sstate:print-datetime-link-cross-x86_64:x86_64-oe-linux:1.0:r0:x86_64:14:
task=populate_sysroot
drwx                                                                                       .
drwx                                                                                       ./recipe-sysroot-native
drwx                                                                                       ./recipe-sysroot-native/sysroot-providers
-rw-                   32 19fbeb373f781c2504453c1ca04dab018a7bc8388c87f4bbc59589df31523d07 ./recipe-sysroot-native/sysroot-providers/print-datetime-link-cross-x86_64
drwx                                                                                       ./recipe-sysroot-native/usr
drwx                                                                                       ./recipe-sysroot-native/usr/bin
drwx                                                                                       ./recipe-sysroot-native/usr/bin/x86_64-oe-linux
lrwx                                                                                       ./recipe-sysroot-native/usr/bin/x86_64-oe-linux/print-datetime-link -> ../print-datetime

And print-datetime-usecross is correctly rebuilt whenever print-datetime-native output is different.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/cross.bbclass | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/meta/classes-recipe/cross.bbclass b/meta/classes-recipe/cross.bbclass
index 93de9a5274..da3c4e7eab 100644
--- a/meta/classes-recipe/cross.bbclass
+++ b/meta/classes-recipe/cross.bbclass
@@ -101,3 +101,39 @@ addtask addto_recipe_sysroot after do_populate_sysroot
 do_addto_recipe_sysroot[deptask] = "do_populate_sysroot"
 
 PATH:prepend = "${COREBASE}/scripts/cross-intercept:"
+
+#
+# Cross task outputs can call native dependencies and even when cross
+# recipe output doesn't change it might produce different results when
+# the called native dependency is changed, e.g. clang-cross-${TARGET_ARCH}
+# contains symlink to clang binary from clang-native, but when clang-native
+# outhash is changed, clang-cross-${TARGET_ARCH} will still be considered
+# equivalent and target recipes aren't rebuilt with new clang binary, see
+# work around in https://github.com/kraj/meta-clang/pull/1140 to make target
+# recipes to depend directly not only on clang-cross-${TARGET_ARCH} but
+# clang-native as well.
+#
+# This can cause poor interactions with hash equivalence, since this recipes
+# output-changing dependency is "hidden" and downstream task only see that this
+# recipe has the same outhash and therefore is equivalent. This can result in
+# different output in different cases.
+#
+# To resolve this, unhide the output-changing dependency by adding its unihash
+# to this tasks outhash calculation. Unfortunately, don't know specifically
+# know which dependencies are output-changing, so we have to add all of them.
+#
+python cross_add_do_populate_sysroot_deps () {
+    current_task = "do_" + d.getVar("BB_CURRENTTASK")
+    if current_task != "do_populate_sysroot":
+        return
+
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+    pn = d.getVar("PN")
+    deps = {
+        dep[0]:dep[6] for dep in taskdepdata.values() if
+            dep[1] == current_task and dep[0] != pn
+    }
+
+    d.setVar("HASHEQUIV_EXTRA_SIGDATA", "\n".join("%s: %s" % (k, deps[k]) for k in sorted(deps.keys())))
+}
+SSTATECREATEFUNCS += "cross_add_do_populate_sysroot_deps"

