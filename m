Return-Path: <iwanicki92@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E5CC5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 20:14:44 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6679.1787602474872230729
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 13:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JDYok6HJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: iwanicki92@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso6724804a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787602473; x=1788207273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SloWe1hWscdga9OD3Vz8Rix6AurevORXDXoG9cpNQDw=;
        b=JDYok6HJjejrYI+n+yUsZJdDr/Y6uW/rCtuUzro2yjEGgb5Hhz7IsqID7/xV06p4Ih
         hERQu1jQMiQ/nRQ6WQmlYu6oyZs38iWJwld2fYygAomod169I/Hq+MjP0hrwzQ/ebevI
         f3yWe+7tjHJ79pteEoKVWsIQpnzt4eE3jCDCHFYtUOrthA/9j4TRLMUoFGJmpJwCVxBP
         +VTPgX4IosE6dSJ9pZdvgX4vdr6IWiWpP3SaqyPtUGk5d+QYJmx1f1IqEKfRtzs7Wto5
         Cb8fp0xbOz0qpsvAxiTx/HjS0ng+fVg8KD7uVaaeyLOLSgftVvpyNfHmJOjdk6Og+qUr
         bUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602473; x=1788207273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SloWe1hWscdga9OD3Vz8Rix6AurevORXDXoG9cpNQDw=;
        b=WcNDAvOBIh2fzcqguRBj18TCsocOarZ53EGeqRlA5m3DmXmWPx8bCZH1YrviPhWv1v
         FsOgEOLslxBrdk83ICNxuyQ2J0KwPm4iKkC74jIwI58HJDedygH0RoyTCAhn4e3izz0N
         65JwGmNpbNixxhgGEQuMm19k3xYudozZjj2ZfKrC/nt1uTBYjKXeJ86ZM2K3sA/PdjNP
         lgzImywD1+/pdxFmvEz4LMp62dCW7ETuy7aBzPd9TdCDS3jm2P1mpLD0W7I/AeQPSS3P
         7EtOY/LqSJUtB6ZJny1W6oxw4BiW5XmEUrLLakDAm3TJF0WCc3WjgrqmqAbFVhB+N2HB
         BuPg==
X-Gm-Message-State: AFuF++kYOIpQeT7p8CsXA4qc8pmOdzGjJyAsQCa5h1wqkfV8nYK2EatI
	WIYTW+dIshWUiOEw2rxELdS1AAszqElBWXWQimQhBQeWuiGLmJnsUp1IQ18+duVgdVM=
X-Gm-Gg: AR+sD12dZUlv10kGiFH3tpFTt2McoP1pjn+lWsgbJUcDvQpwivxJuMaL5BLl/2KePX3
	Hg9Jdiw/0BMm7Bz86D44NvRKXcjaz78Zja32J/tBVSPTX9RS/IzLkFw3CQdbd+AUFekzelyeUAp
	p0dG2qTuD97voJSP5Yf3lZyzwTvAyoSJwEYReo8KdgT0ClDX+LeFFrAi96wQA1DL1X+XOnTzn2o
	abY1r4ycIg4D5D5yG9/d96flGEE8kpEqYBXDKOnL6Qke1MmynXNBYMo2adOy5HxHdgAg6c1oaEr
	PMSELHUM2GuX9905yD9FM3KAr/7jpY5jPAbDj9dkmto/hxPf8Oz8nKs0yqB1JypbdozKzQuafGi
	Sq/HXJpUsv7AHXSrGHqaEFxss65Slf0KM1Pr74+/CvrRKsUtRMcX5+FzZvYviaov7ZAxw/8Cnum
	EZ5OPhd7A+uToClvbE1VIkhohdP/t6gGiJ3ncLKd/8pD3wNe6/mBmhJsdllu3jCMDLsmU=
X-Received: by 2002:a17:906:ba83:b0:c24:47b8:ae5b with SMTP id a640c23a62f3a-c24e5c0bc67mr81822566b.22.1787602472855;
        Mon, 24 Aug 2026 13:14:32 -0700 (PDT)
Received: from iwans-fedora ([2a02:a312:c8bf:9d80:69ba:755e:25b5:838e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f9c9fsm1456068266b.39.2026.08.24.13.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:14:32 -0700 (PDT)
From: iwanicki92 <iwanicki92@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v2] sbom30.py/spdx30_tasks.py: fix SPDX_* prefix lookup
Date: Mon, 24 Aug 2026 22:10:18 +0200
Message-ID: <20260824201017.3914783-2-iwanicki92@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 20:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244150

Sub-variables (_name, _type, _comment, _id_email) were being looked
up using the literal string "SPDX_IMAGE_SUPPLIER", "SPDX_SDK_SUPPLIER"
"SPDX_PACKAGE_SUPPLIER", "SPDX_INVOKED_BY", "SPDX_ON_BEHALF_OF",
instead of the value of those variables, breaking the documented
ability to use a custom prefix (e.g. MY_COMPANY).

Tested by setting in local.conf:

```
MY_COMPANY_name = "CCCC"
MY_COMPANY_type = "organization"
SPDX_IMAGE_SUPPLIER = "MY_COMPANY"
SPDX_IMAGE_SUPPLIER_name = "AAAA"
SPDX_IMAGE_SUPPLIER_type = "organization"
SPDX_PACKAGE_SUPPLIER = "MY_COMPANY"
SPDX_PACKAGE_SUPPLIER_name = "BBBB"
SPDX_PACKAGE_SUPPLIER_type = "organization"
```

And then comparing `core-image-minimal-qemux86-64.rootfs.spdx.json`
SBOMs. Before this change SBOM contained only AAAA and BBBB but no CCCC,
after there was only CCCC.

Signed-off-by: iwanicki92 <iwanicki92@gmail.com>
---
Changes in v2:

Change the expand path to fallback to `varname` itself when lookup
doesn't find anything. This change allows for both old, undocumented `_ref`
indirection and documented indirection (`SPDX_* = "<PREFIX>"`)
---
 meta/lib/oe/sbom30.py       |  6 +++++-
 meta/lib/oe/spdx30_tasks.py | 10 +++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index e02382c3cc78..becf9e30d392 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -397,7 +397,11 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         self.doc.import_.append(m)
         return spdxid
 
-    def new_agent(self, varname, *, creation_info=None, add=True):
+    def new_agent(self, varname, *, creation_info=None, add=True, expand=False):
+        if expand:
+            varname = self.d.getVar(varname) or varname
+        if not varname:
+            return None
         ref_varname = self.d.getVar(f"{varname}_ref")
         if ref_varname:
             if ref_varname == varname:
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index dac02e378429..88c707476a65 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -905,7 +905,7 @@ def create_spdx(d):
                 force_purposes=["install"],
             )
 
-            supplier = build_objset.new_agent("SPDX_PACKAGE_SUPPLIER")
+            supplier = build_objset.new_agent("SPDX_PACKAGE_SUPPLIER", expand=True)
             if supplier is not None:
                 spdx_package.suppliedBy = (
                     supplier if isinstance(supplier, str) else supplier._id
@@ -1213,8 +1213,8 @@ def write_bitbake_spdx(d):
     objset = oe.sbom30.ObjectSet.new_objset(d, "bitbake", False)
 
     host_import_key = d.getVar("SPDX_BUILD_HOST")
-    invoked_by = objset.new_agent("SPDX_INVOKED_BY", add=False)
-    on_behalf_of = objset.new_agent("SPDX_ON_BEHALF_OF", add=False)
+    invoked_by = objset.new_agent("SPDX_INVOKED_BY", add=False, expand=True)
+    on_behalf_of = objset.new_agent("SPDX_ON_BEHALF_OF", add=False, expand=True)
 
     if d.getVar("SPDX_INCLUDE_BITBAKE_PARENT_BUILD") == "1":
         # Since the Build objects are unique, we may as well set the creation
@@ -1536,7 +1536,7 @@ def create_image_sbom_spdx(d):
     objset, sbom = oe.sbom30.create_sbom(d, image_name, root_elements)
 
     # Set supplier on root elements if SPDX_IMAGE_SUPPLIER is defined
-    supplier = objset.new_agent("SPDX_IMAGE_SUPPLIER", add=False)
+    supplier = objset.new_agent("SPDX_IMAGE_SUPPLIER", add=False, expand=True)
     if supplier is not None:
         supplier_id = supplier if isinstance(supplier, str) else supplier._id
         if not isinstance(supplier, str):
@@ -1657,7 +1657,7 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
     )
 
     # Set supplier on root elements if SPDX_SDK_SUPPLIER is defined
-    supplier = objset.new_agent("SPDX_SDK_SUPPLIER", add=False)
+    supplier = objset.new_agent("SPDX_SDK_SUPPLIER", add=False, expand=True)
     if supplier is not None:
         supplier_id = supplier if isinstance(supplier, str) else supplier._id
         if not isinstance(supplier, str):
-- 
2.55.0


