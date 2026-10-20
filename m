Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6670.1792500754836944368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kTe8p25n;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: vgharaee@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso478340f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 05:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500753; x=1793105553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0DMyeWQj4RNOUtPgy6jPZh7Vpm+V/DXd81JWMP/CxDM=;
        b=kTe8p25nsULKurhTv/Wx1I+Gcm138aCGUgnm7vHosFFMkAbHuPExJICgFM27Yz41UL
         WpxC+HXclUueaCL2oJ/f98yUqQWQW0Qof+r9TcEBGUPVzsc/wYOk4KlYnLNPuYOsS/Ps
         EhDpIuaJtGSz4jKcoB/GdYJh06zsmLeldSR2BxaZTYAhICL5y/uJI2wjAiGZdf3sAWUd
         N28n6d2KF1HhqrEWUZoIVj4Xzo3b2jdIT43Vj18pCAQC5g7o0cX5GQ3Oadh2H5qCiKLA
         luzKMICHtSuH7FXL+z2ebTKXlyfFxrU5F9mCkYpLw5KsBT2lPYWQaWoldUaKubE2pFgK
         iLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500753; x=1793105553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0DMyeWQj4RNOUtPgy6jPZh7Vpm+V/DXd81JWMP/CxDM=;
        b=plarti6Xh6uxmOqKk1d9ZkpHmSYKz4hJBYrbIf8VAyZYaz5P8Arvv+MuVeJpBKUvZc
         DWR34aBrzpBKjNFaU8ydZI4VziDYgogwMRhFfJkVci15XFfoVsSkfZvoRaZSOoa2QEPR
         bfEcChx3FWLAHsvGiDtTYB57a/9NBgOlSTKsVj0oE7EeNfAhGqdkqPwmss9HEakOuXcm
         /nESInXi72YJfOz6djpO97HA5ETzQLKOnARWntdRmvgPeLdmrsObK4Lqh0oNQXi46hgt
         7Ek6epD3URqi6iVFNxEgPzVZDAJ/48PXOrKgfjIBEbZvnLbMFlR9UJorbFnt4u8ji2j6
         g2bQ==
X-Gm-Message-State: AFq9FYIt1Y5EC8WvCYBCG1wZU1WdkNLxywJUdHdhp/mHQ8ascPZnHpzD
	bzM58XLHPgTg6mOKNhM14b6rkiS8lZemVsKErDN6VXXyeWft8IbgJWDk3jr/Gg==
X-Gm-Gg: AYBFou0xoffbIDDATELixdse/WPCVsCOfVa5FzJvHop4c8xEx1D0IGlV2cPmTsbonMp
	LQK6mpTtXa/P/LafAG6Oq2sksBMnzjE6h49/kfW/0mxeSn3jC05gRPvVppRLubB+eSX9C2wQKnk
	4iyKNy16hgiaczXMUTJ8aOsHXRtN/vh5n71DNqNhdkCVp2Lay+eXfau5mUFZSxP91PBjW7GWCo5
	IF+1mjcBsR9jdarMmzF7FxK59GkgB4d49AE4TcLd8GK50ku2iyqhDNJXdSYG47xt5BynzCpB3MC
	Z5YPxwzVpCvPuNSf6fFmqCroiYwz+0JwecHt+RUZon80kvbZYtIH1ZnPKgcnqR6387N5xdUMceG
	5r6RO42MPsmGVmg7Vk6arFCzXU+BOxvlwGEPfSZJTdVGL4xK53cyr3e+a4J4xrBWxFoytRd/b6f
	5pVxxp57jm9GPBM5OfuNU9F1tEcm3ZcXk147GxbBd1FtJkpdJ0BczFQyxVtxsrLzCG7kQy7YiEm
	9YShYukV/ZdkWiskjQE20OHJynf4sE5PCNwM2Pu
X-Received: by 2002:a5d:5e86:0:b0:48e:adc:b97d with SMTP id ffacd0b85a97d-48e1e7a7a2emr4638120f8f.8.1792500752832;
        Tue, 20 Oct 2026 05:52:32 -0700 (PDT)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.t-mobile.de ([88.128.94.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fdbbsm6335698f8f.17.2026.10.20.05.52.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:52:32 -0700 (PDT)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] oe.fitimage: Support multiple kernel nodes and configuration selection
Date: Tue, 20 Oct 2026 14:52:30 +0200
Message-ID: <20261020125233.69997-2-vgharaee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020125233.69997-1-vgharaee@gmail.com>
References: <20261020125233.69997-1-vgharaee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 13:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248280
Content-Type: text/plain; charset="utf-8"

From: Vahid Gharaee <v.gharaee@reinhausen.com>

Signed-off-by: Vahid Gharaee <vgharaee@gmail.com>
---
 meta/lib/oe/fitimage.py | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index 484e5c5ee0..91ccc31d46 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -193,6 +193,7 @@ class ItsNodeRootKernel(ItsNode):
         self._dtbs = []
         self._dtb_alias = []
         self._kernel = None
+        self._kernels = {}
         self._ramdisk = None
         self._bootscr = None
         self._setup = None
@@ -268,8 +269,8 @@ class ItsNodeRootKernel(ItsNode):
     def fitimage_emit_section_kernel(self, kernel_id, kernel_path, compression,
         load, entrypoint, mkimage_kernel_type, entrysymbol=None):
         """Emit the fitImage ITS kernel section"""
-        if self._kernel:
-            bb.fatal("Kernel section already exists in the ITS file.")
+        if kernel_id in self._kernels:
+            bb.fatal("Kernel section '%s' already exists in the ITS file." % kernel_id)
         if entrysymbol:
             result = subprocess.run([self._host_prefix + "nm", "vmlinux"], capture_output=True, text=True)
             for line in result.stdout.splitlines():
@@ -294,7 +295,10 @@ class ItsNodeRootKernel(ItsNode):
             compression,
             opt_props,
         )
-        self._kernel = kernel_node
+        self._kernels[kernel_id] = kernel_node
+
+        if self._kernel is None:
+            self._kernel = kernel_node
 
     def fitimage_emit_section_dtb(self, dtb_id, dtb_path, dtb_loadaddress=None,
                                   dtbo_loadaddress=None, add_compatible=False):
@@ -425,7 +429,7 @@ class ItsNodeRootKernel(ItsNode):
 
         self._loadables.append(loadable_node)
 
-    def _fitimage_emit_one_section_config(self, conf_node_name, dtb=None):
+    def _fitimage_emit_one_section_config(self, conf_node_name, dtb=None, kernel=None):
         """Emit the fitImage ITS configuration section"""
         opt_props = {}
         conf_desc = []
@@ -436,9 +440,11 @@ class ItsNodeRootKernel(ItsNode):
         if dtb and os.path.splitext(dtb.name)[1] == ".dtbo":
             include_kernel = 0
 
-        if self._kernel and include_kernel:
+        selected_kernel = kernel if kernel is not None else self._kernel
+
+        if selected_kernel and include_kernel:
             conf_desc.append("Linux kernel")
-            opt_props["kernel"] = self._kernel.name
+            opt_props["kernel"] = selected_kernel.name
             if self._sign_enable:
                 sign_entries.append("kernel")
 
-- 
2.55.0

