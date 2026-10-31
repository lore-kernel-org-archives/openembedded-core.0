Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157.1793464003461657955
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2026 09:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=IRm8mL51;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: vgharaee@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so14402405e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 09:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793464002; x=1794068802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0DMyeWQj4RNOUtPgy6jPZh7Vpm+V/DXd81JWMP/CxDM=;
        b=IRm8mL517Y/pSzduVPMUEBk6QQ8XIA0taNf8jgBTLxzbZZEManT7L3mQLyVoI5NaDj
         IR39Qzy6ujQQIlckhSJgfdEMgX8ywT+UYivXPZuD/aDsr60aZfcCKyrnjT2pCbAmmttS
         zv78wywxLJL5mUNrQIp3QXyeTMnoaZNF27uXakEjS+oJYr1k7/l3XUm9x8oDBSi6wJyY
         5KCK4YfjSR1bf0cBED3pPXo/OSG262WQl20AdHolV4cLqzp+VjPwgmrT/62lagI1KoJO
         pfKpeCOSx5FQQW7puDeoXLwrB9a3QuHP+xpBR/9eRznzP2/FTUB4alOMr8kodGv52aem
         fuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793464002; x=1794068802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0DMyeWQj4RNOUtPgy6jPZh7Vpm+V/DXd81JWMP/CxDM=;
        b=W4MzS4Q4b9aaP5hI97oc4UFUtyh/B4hPGW3e4u9rlGOxx/e/sr5vyKKRSEVBajdTkf
         gOIFwb/wN6qvdM6Rf6kv1zXos/AnRU5OHnTE8f9a74rGPFNiOBQVcay/mevl1kYW22Dd
         SVXkzUJ/66YJKd+WIO0Ndvm5itKVH9PP5D2s9SqhIB3rfjWA3QGt4aSjneZFd5UXUdll
         K1rc5CMwafz1TfqIWbmhkNGeh9uBOoDjQfiojQzP4K+jJ+zsI9DDQCGcPId03wzfS0Sl
         n98BDHjEfX4IGsWDz62fO4fg7yMiHUKP2dzPGOe8ZUcBEu2CGL7AnGNZgcEb9JrjlciW
         1C2w==
X-Gm-Message-State: AFq9FYKKC6t48ngSbVSZvZ7GYRjvId4fWA/ZczwDTudKdn381DGeilH1
	wNHSCibNSKqN07SnAmknNspCkHdcneScZikMYOuzGTBJwo+dayvJ+xvHgL8tXg==
X-Gm-Gg: AYBFou0gGSz0C0AMFQSKuo9u2H/HL9q6R5uwDTqr95xhkHBZB7pKa0prdhgP/jmzOVJ
	hZeChCK4E42771YcVCw+3Mdsk8QcMF6IOgr5OeKb8PAdvpBVfUCzOYEELdRDa2gm6o5vr1ZPDc9
	RkLor/Am28POZd7IGleBOQ/A/jvpzyYYWKHkse1Q6Knx7h6c2xSUDg6TDKL2zYXPXrM7NnG8ANy
	Qk6gVq2emqGJKYrihw3ZWcU8T8sT1o64HalMS44kTaAzUiGr7y34h8curwnel6j/LhDpmzspRGe
	gdkKS8gv2NWIIOB/0rEf3yMUDcKKjmt1AfDZFZbET1G16/riZ7QUNPWNOnN6pOQenazx8B3BdIt
	5WljEBeA41aLd1G4Lq9RgdZ/thBIzhLhWJJ/6sKfj0AGejt4TqK3/5tzkPFivdhKDck5JmGeID8
	xnC1rmN+aFIxRiam0+rp9pZnJ+nvpGaDmF0v8qgPrlk+DoIjcV04gRvkAUNSHSdA0Lc1A3x4lXE
	zb1kEkKtiV1fWZCoCymCAZyFxWUuX2Etr2khbhSKlS1OoEXZKMyZGSJUX3bCERUX6Qt/jyy8EV4
	r/N5KWKuuIJbO5PTtS2mM8DZNSvUZhGNgYWwblpXBCovRvvPuW6qEmteMvrld5rTNoDlsLb7
X-Received: by 2002:a05:600c:138c:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4ac18c740c5mr122469245e9.25.1793464001665;
        Sat, 31 Oct 2026 09:26:41 -0700 (PDT)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.fritz.box ([2001:16e0:257:b301:9825:3e45:cd0a:824b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2640sm214214455e9.6.2026.10.31.09.26.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:26:41 -0700 (PDT)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/6] oe.fitimage: Support multiple kernel nodes and configuration selection
Date: Sat, 31 Oct 2026 17:26:44 +0100
Message-ID: <20261031162649.944625-2-vgharaee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031162649.944625-1-vgharaee@gmail.com>
References: <20261031162649.944625-1-vgharaee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 18:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249159
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

