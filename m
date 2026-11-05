Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.631.1793897300020588161
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 08:48:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HipSNrJL;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: vgharaee@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so14582485e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793897298; x=1794502098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gr2z0lSEdi/qlkh17yOTTROqhkNmkqALo8HOCCZw8bs=;
        b=HipSNrJL8eP5WZxKdnkrLwSMvJqZ2J8Ls6bSiz2vuGJNDS0eZu/9+FL4oPA9TFPBNd
         bJjxkc7yHB8y8Kc6zmnBj6xOYl5KaekYlmG8ozYT+ZeauEBKViGxZi+KGwb32czlaOb1
         tlKFSid0nPO/Y2LBWwR/hFsQJSDyCJm5OFyCDQO93joy1MqjXo3rHGkdb8wKvJEanXh6
         e2Gi7EdeQ7d+mu7M5Se+QvqY+FRrivrZiLaurAddOQ7KDZwUQV3MriAPlASkfoYWVyWm
         X3sK54vhhexJ+rJ+Vtc1Sqx4RcN5VpdWwTyQue2ZwF47LyFh6hScTF1zmk+DQLkH5aaC
         c0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897298; x=1794502098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Gr2z0lSEdi/qlkh17yOTTROqhkNmkqALo8HOCCZw8bs=;
        b=u3SG+BPXaGbZq9yIffWiVDrWV65XL54HnW9byZbg/XYHAOkzhsi5Y1qCRDAVbKEMVO
         SnseY4lp1m2tQErt45r2Im/dp/ZvsGD2KWM4Wbs98N1JHp54nqfeAni28oCZy0jbdEjE
         RzLvy4n1OZxgSXGkMMyTuh087VMAZo3RtNM4Qcwccw7sDQ71ctX9XIgNHzleNE0GxA4k
         7lMlCKn6n/IOOfsP5ZBSwALkn8qf54MTszNm76BPu8xudSf56Hbt9W6dEshgcW2kDOHg
         f3XXbS62xDs2J3pLR9VQzDWkbEDlipdy/GVtYIbv+DPnjhYroGZrCIq9Dszr0ygdSonS
         z/0w==
X-Gm-Message-State: APuU4Z+AOS5hc3fzP0C7lJPMCiRncv1zAHLc11Tqm4BFg8KDKCF37pZG
	L4nwZHx/l8XqAjUQmIz6H0F1DihiNBu1yZumt8iox/1EECdItTwpeeJkuaetsQ==
X-Gm-Gg: AYBFou3n6BbXLsZu8NGT0+q+n48nyQMieC44o04h8WEzSS6JzlDwGAESUUA2FrbOvPP
	vAI6cpTpkzyWqhaqvfDI8yrPX671XFcFHkV0nl9DK6FWyDVEy1Omjc1am1BairBWSc0o7mWI6wC
	0qyz869/AE2oMPz/e5pt5OlJnxxsMxzeR35U2DWmLkOiRp3E2cpjgMXBh2rTuagXnw+Ld6yPBTq
	ihuFF87QB7TAJF9J8SiyEWH4p9h2zyDHlotTuRY3wLVW9SEnYkHz66NNQbaoAww+j1/I9DwVjdJ
	2wYj0Yh4x3kRz6ICw6VQ0uOqYVViwpHF2gVE+b1JMto3oUgvzEhxefFwmWHJnGNsgtVll47Bez2
	nOVSuGgC784q9NKzJW25xvIODxboMR01fZaKxXBh+QrcUHehSlaFZ0wJrOpyR40byoloey5ELxA
	qTwCUu4Z8II1Zn2UbbBNpzjOePeeVWHN9gCRqmaSXsZPUpUZn6qFU+6kdI/sJj+EvVRvPcQfsjV
	B5xqBRS/C6P1th4dni2hnCaTqLK8vQnqN8WcqVd4rIU2gLn0wujJer7cNqn8uEgNRc6fitZ6V7T
	COltRgpoAVpwXtKKEBs//R24R+cpc2z/VsrLn4HNfKbQewEPCc3pLgxjAj/a8xuQ41rBsQ==
X-Received: by 2002:a05:600c:3b8f:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4ac16acfdd5mr456708145e9.11.1793897298255;
        Thu, 05 Nov 2026 08:48:18 -0800 (PST)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.t-mobile.de ([88.128.94.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b63863d490sm42536975e9.2.2026.11.05.08.48.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:48:17 -0800 (PST)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 1/6] oe.fitimage: Support multiple kernel nodes and configuration selection
Date: Thu,  5 Nov 2026 17:48:21 +0100
Message-ID: <20261105164826.1340446-2-vgharaee@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105164826.1340446-1-vgharaee@gmail.com>
References: <20261105164826.1340446-1-vgharaee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 19:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249572
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
2.56.0

