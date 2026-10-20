Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7612.1792503350576902474
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 06:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ma+J3AQm;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: vgharaee@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1835631f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 06:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792503349; x=1793108149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0DMyeWQj4RNOUtPgy6jPZh7Vpm+V/DXd81JWMP/CxDM=;
        b=ma+J3AQm3OrpUxpYWnp0XZosBgTamXgyx2X3ehHkFlTGdBDIRMdoHLhcR4FqVaOODy
         VQcCQKqUmZLclrIRIsSsMytcYx44XYzytk8FIUcm+7gTwmuiqwtsKmKYgDprmuDoFsYI
         nnolo7hd4/WHZVK35rCZALkQcyny/vEhgBXCprLSeh0pCa+Or1TXzLfaqDO/ERlCMqx1
         NDLnN+GLUQfTOX8YY6ptpbb1/g4AnwyLA87l0BDWBb19f7UtVC+AEcq1mlPbZM/EbbA/
         tTXk/VCaLEXiknT3KjjKYpuHCPnipc3ducRfV2PiKrQzvuY1BLdvhd1MURYg0gYSQTXP
         qc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503349; x=1793108149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0DMyeWQj4RNOUtPgy6jPZh7Vpm+V/DXd81JWMP/CxDM=;
        b=ELvBo8grY+iqBoDLoO3cT1WJrhRDIuaAxRyRcBmV0rGGQZL+V2CpxXlvRMJ64g7DXW
         eihry2d1vkWUsTae7IKCG9egl6FUYS8v6sgu6+nAR/eVjXbaXt7UowJWeV3u77M/P+pG
         HBp1QR+t83Bbq2btXYNsj4vfuHmLtrekU4FO1w/J9yyuWayr9plxHU7BU6AIyX2jF2rE
         RI3PfBwzaLBa2oyQsmR6QoVqf8yBZ4vC5+Ohx/0ezCvzTOuukRpQw6ouWcG8qmEbhdaI
         vKqDHS7iWy/qv5TuKO7wne8e5f4wuTsDb6IpJM8VZ180AqynLSEtGZAUooNpE7kbhW7j
         dtsw==
X-Gm-Message-State: AFq9FYJ/5OSBWKDVurutEvRiWxiX2xn2vuz1PdGMWpYw0PXl/8XCWs4Q
	fsC24OOBSlk8d5Bf3DfLCAc+GWllu7icSUmDi6gttrL4hM0p+tu3wVvMWuhIXw==
X-Gm-Gg: AYBFou1kJ8SpvrMGczVMQ0cEz/0oKLuAXAKDCztKSBs+cTU5dj74MXdrc7uFW/QFvuf
	AQZnYnzQyjcUJ7xOmib7dtfV9qMFPFokIyNjDCYQrkgKyjPFkIRhCNdCt26sN8ZgE+NdgoumhdQ
	ainNxQE9EK1P3h/l6X550xUYUGDMwGU640GwobZUTmmoZEkGupx2pJHl7pLGiKT67/ayb5dekQw
	juPA9XiCMZ4w94wQw+MeqocrTMofjv5qkWrLoL9o+s2OOHFSK227jDSsat64MLQ9QRDvK3aluNM
	cEY0jytxVxsTqZocnLDHMKDHlriJMoQQLKUDFqH9OPFR09O7tldQFMzFhS69PTXa5Q1p2a/XDL+
	ORScnRHubKIjwlvkTlCOubUTtvrcGLYGOQ7i4LeabMLwB0+iRBvppJBtdkeJw2L12ofagm1bZXH
	AtjYUoLnYBsn/LdzHY1642AsJrmCyblkN8jmn2LqCHrjpE+gByyM5zZpiPxx3MWVfyaooLv03Uk
	Y/G4Il1iDyuRUcG6cbGiYBIGqtqS4/andzDce4=
X-Received: by 2002:a05:600c:c166:b0:4a1:f736:79f3 with SMTP id 5b1f17b1804b1-4a1f7367b83mr32721875e9.5.1792503348674;
        Tue, 20 Oct 2026 06:35:48 -0700 (PDT)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.t-mobile.de ([88.128.94.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818d61sm6060209f8f.31.2026.10.20.06.35.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:35:48 -0700 (PDT)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/4] oe.fitimage: Support multiple kernel nodes and configuration selection
Date: Tue, 20 Oct 2026 15:35:48 +0200
Message-ID: <20261020133551.90185-2-vgharaee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020133551.90185-1-vgharaee@gmail.com>
References: <20261020133551.90185-1-vgharaee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 13:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248288
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

