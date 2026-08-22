Return-Path: <iwanicki92@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8FEC5B572
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 21:17:45 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4356.1787433460946155030
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 14:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WZZ1tK/T;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: iwanicki92@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso349067366b.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 14:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787433459; x=1788038259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=edWceRFli2OkWppAW7y2xTLqkKPHdpeR5v3/Tw9JuBo=;
        b=WZZ1tK/TdUioIFtKcUiX2+B502uNDsomISvtvH5QXc9Z9X2ptEG9/zUXZUXbSVujA5
         TD9znMOeLzKkedNOX+sKZIlSLb9RCLBOcLroS17i4slz74gkyx7NaFkC1IjhBjDVfw3o
         gM5FviQWQi9xFW1p4xd5YVpACybSpslQR1GT7eQ6um3GLLLUBPlfyvFa7L4iy3hoPdsI
         DuKP3MD3mHuUsQgnMsNbfOHpy4J1cYeqy148gY1QEiwUpXVtFFpFGec4DboVqoUZTJys
         eexPnyuk7oqb3bCdropFkQXnPx2rpwDkKSrxoFpdr2R26HPhBLNsz9jSnODuptgwkhzI
         I9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787433459; x=1788038259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=edWceRFli2OkWppAW7y2xTLqkKPHdpeR5v3/Tw9JuBo=;
        b=YGw4TXM0BfNS4jU/zncd9KUsmAEge9Mfu2WLtbm4UJrIcXfseNHufEkMknpmM0xo5q
         9Mq3HgessWmJj+8vi9mVdfLKRcx6uYlQi9LtNKaqPjzJ4mYGpc4DJbD3q+JwtvFRP45A
         XoNrArRMVJzmwmLACN1f/IDccjakebGEc8WtRnigfe6KvvuMLvfAdG0avb95D3DQslCf
         zk6AsaeaXQISLF5nHQV8F1Qswh/8tExvw7KVByt3bKdhTYKpGiKDkmSPcUMXOLRXimuH
         b58CVsxyUFg/9gcDtzEVdOKK3K8nnRKV1SATldkiHX4KK47ltBFF7vD7FgDFh+aZRvfu
         ZAKA==
X-Gm-Message-State: AFuF++nTGU5tK8JpNGTfyHSdPyfk9+mB4MUUPNzS56NclDqErRDfNmlb
	9OpJAp/+moVewVFJ8XW18MmIo5gQCAhAT9ntqJ5H3iuP6AkRrx8FZo+EVbOslR8c
X-Gm-Gg: AR+sD12X0n74NVKZpSi0GFgHNXro0mAkWC391f19epqTuholBwPwOnh0wN3R+AYTx9z
	Y88FriDTkJ8sp7AM/5x4VZOl5fY6EyDrzHfRkpe0jscpGEI4/gafRNRYQejQmTbKySHdL0CKAZq
	AmB5Kj9xERAD4Ouvi1+AukRDSvFGIK9b4s36oosCx5jcFaIFhP4Kk3WDxjB5j9D5RGTT/O5DuYC
	Qh97pKZTuptwOVPy7fxdTa0fPkWwqrqjeG2HJlZM+t8QEf4ayi8hXZOWSHaQYaSzWwkMCHDtlQV
	WVI2s0W58DiEDM1jao5tr8SWXRCoE4pJGwTBiDlPhRTfigocCoMGoYYdxnusGbv2rCLWm3CCXo7
	FURvTkixcY9xPofDoVOFWjMU2glGfRHzuk8h6oEib50ypKNVcKXBbOl+og5W/hh768fQ0k2NUGo
	+fOEJnlRnQ4D80E6LUlIHVyhmkbJ/zuFAMeI06BgWg41NHw9XLU7kPv91mj3r9l2cPQ9DKV+zvk
	WVMOg==
X-Received: by 2002:a17:907:7b83:b0:c20:fe93:a86 with SMTP id a640c23a62f3a-c246a62b495mr1952531466b.18.1787433458837;
        Sat, 22 Aug 2026 14:17:38 -0700 (PDT)
Received: from iwans-fedora ([2a02:a312:c8bf:9d80:69ba:755e:25b5:838e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24967383e5sm465928666b.45.2026.08.22.14.17.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 14:17:38 -0700 (PDT)
From: iwanicki92 <iwanicki92@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sbom30.py/spdx30_tasks.py: fix SPDX_* prefix lookup
Date: Sat, 22 Aug 2026 23:17:34 +0200
Message-ID: <20260822211734.3596359-1-iwanicki92@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 21:17:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244005

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
 meta/lib/oe/sbom30.py       |  6 +++++-
 meta/lib/oe/spdx30_tasks.py | 10 +++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index e02382c3cc78..5af2e4ff1c0c 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -397,7 +397,11 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         self.doc.import_.append(m)
         return spdxid
 
-    def new_agent(self, varname, *, creation_info=None, add=True):
+    def new_agent(self, varname, *, creation_info=None, add=True, expand=False):
+        if expand:
+            varname = self.d.getVar(f"{varname}")
+            if not varname:
+                return None
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


