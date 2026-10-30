Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9904.1793362479956408500
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 05:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=g/ojw4Xn;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: vinicius.eduardo.pedrosa@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso132474241.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 05:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793362479; x=1793967279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cG4w6+p0HocFd2R/or3i1b3M1XNxrYaxH2FBoyzJb7g=;
        b=g/ojw4XnovZOrLx9GsQpN+j0QdaJu2fJ+qIq8dtAGykvdybzjXZLoxiijomcAjM1id
         tBZFJ2TtcJ/RHktYjH8/z8E9IKEgwFuEgOrgMJHb4B/dJrox263DdosMog21RgdojNui
         EsKQ//ZZxAyjp5QYl5870Py3Y0wxmwHFmEFHNRTQoH9yuLLh9rHnkzJ8ncbU9iIvtkrb
         OQXDiV0M8uZfKzNnJI5ysBjRHD3exweTu1qcI54krjzgom/v+ZeJKw5eclfJBGAhTNnB
         o0hrrImCZagVfqCmFSqywP2rtn3K/TDQpGJUgbwSN/kSNhNgmpfTuwYUyA4m2TlVn29k
         0kiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362479; x=1793967279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cG4w6+p0HocFd2R/or3i1b3M1XNxrYaxH2FBoyzJb7g=;
        b=Qrms/9NYV99V9PjevPvwWld4Ev7/2NQSyqAbHOMGCJZUith3h/Zn+LJxAHF5pJYReQ
         vpF8N9dZcQS8MI3YBeAmNQj8qt6WFD7JcRgTCx+z9WJo4BWqLzCTcVg69ecL2PuYw4ex
         MsQw7LHfjVQRKleY3jWhdenGWgRTn3HsAMigXgnTX461490Vc3elcB/sXNTGQjU8UOiu
         eyJAhMbvLUqfIwKBVt4bE+6yweC+B5WW+x7utmX7/LlXsBMKs54eNs/RbM2iAUIbEiV6
         12aa0vVHr95I/HS/SY/3jgEcEvffYMDV6ODCdYJ4agKoaBS9HLklnaF8pcBled2n7bOl
         dJKw==
X-Gm-Message-State: AFq9FYIP897fXFLpdlJh9mj3Vuy4qfuf2U4WEKxQXuyfcISFY3KS8tFD
	ST9Fxgw2+Jvm0KWwBVa9PCJ5NNl4wDrsbzplIpc0qNcsUDkUcagcG3dnsOOp5exZOus=
X-Gm-Gg: AYBFou0UOAdo0lDA4CcpTnm1l73AgRxz7bxjiMUBMlxAvW34sNZmIe8j7emcYhegEdF
	zV+NhJFL/OkDdXkYvI16twgLIpdOZ8jl0l2HLB9AgOnUmmF3fHSck8rdbWFKbV6suIEQGSGijGC
	hrSICgCOVZxrYKVsv54iDRWF5tovJEm14aXCK8/kReJaBLzyA35lW8iO1O9EWHxKX7JObvaYR8o
	hwdiLYip0FB04OM16ufSUd5M5A5EeLoK4LsDYs4AlAY20ALBOiDQOGhiQlJv28AWK57efsxdwGZ
	sCUFNiWa1t9nTAzy9+YqLc9/3DgwoUlIzf5c6eGRvGI4cOIY8DJvMAvkXggjbRv/jeoGjZmI1nF
	mNCM6ELqYg+d7wQ33Zy7MgMrHZvD9iRlGs0KcVcm1NdGJ8hv9gfPh7YjdehFJO7QSBLgJoM88G5
	WWvdVv1HaXq6iXxmsRfcRBVbs/7P7c/uyLr7V4WMJ9ZaMFs+fnc0SjcnWJoT/Ms9hsDT1hiCZtg
	PJxFoTff93Tg7MMklbJoVvNbr1Zg5wwrt+BCmPHt6jafu5PLlwgHQFqCLTVC+6RlnupTLsNv606
	1WGEGEaHGognq40fCDgUPJBAkiaqRlW4i+eUwObhvyuODluVPohFjiYFHpDWaZXON+YxhP1h5Yz
	LR2meUxOh3Ni/FVJ9nEgrlFUfo41tIcDDQ/uo
X-Received: by 2002:a05:6102:290c:b0:779:5049:87b2 with SMTP id ada2fe7eead31-7d0723d710bmr953473137.0.1793362477644;
        Fri, 30 Oct 2026 05:14:37 -0700 (PDT)
Return-Path: <vinicius.eduardo.pedrosa@gmail.com>
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee437d86sm2417827241.8.2026.10.30.05.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:14:37 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [PATCH v2] yocto-check-layer: don't skip entries when dropping invalid layers
Date: Fri, 30 Oct 2026 09:14:28 -0300
Message-ID: <20261030121428.1658630-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029112443.1734921-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261029112443.1734921-1-vinicius.eduardo.pedrosa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 14:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249046
Content-Type: text/plain; charset="utf-8"

The "Detected layers" loop removes invalid entries from the list it's
iterating over. When two invalid layers are next to each other,
removing the first one skips the second.

A skipped entry without conf/layer.conf makes the dependency pass fail
with KeyError: 'collections'. A skipped BSP+DISTRO entry isn't
reported at all. If no other layer is left to test, the script exits 0.

Move the check into validate_layers(), which returns a new list with
only the valid layers. Call it right after detect_layers(), so
dep_layers is built from the filtered list too.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
v2: move the check into validate_layers(), as suggested by Paul.

Since it now runs before dep_layers is built, a dropped BSP+DISTRO
layer no longer takes part in the duplicate collection check, and with
--dependency it can't be pulled in as a dependency of another layer
anymore. Without --dependency it already couldn't.

Hit it on a layer that had a few subdirectories with an empty conf/ in
them.

Tested on master (b62d5e6) with small synthetic layers, same tree and
command before/after:
- two adjacent dirs with an empty conf/: KeyError before; after, both
  get the "ignoring" line and the real layer is tested
- two adjacent BSP+DISTRO dirs only: exit 0 before, exit 1 after
- valid layer + one stray conf/ dir: same test results before/after
- --dependency, valid layer depending on a BSP+DISTRO one: before, the
  BSP+DISTRO layer was added to BBLAYERS for the test; after, the valid
  layer is skipped for the missing dependency, same as without
  --dependency

Applies to master-next too, not tested there.

 scripts/yocto-check-layer | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 8c8b4db..607b03b 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -48,6 +48,22 @@ def dump_layer_debug(layer):
     if collections:
         logger.debug("%s collections: %s" % (layer["name"], ", ".join(collections)))
 
+def validate_layers(layers):
+    valid_layers = []
+    for layer in layers:
+        if layer['type'] == LayerType.ERROR_BSP_DISTRO:
+            logger.error("%s: Can't be DISTRO and BSP type at the same time."\
+                     " Both conf/distro and conf/machine folders were found."\
+                     % layer['name'])
+        elif layer['type'] == LayerType.ERROR_NO_LAYER_CONF:
+            logger.info("%s: Doesn't have conf/layer.conf file, so ignoring"\
+                     % layer['name'])
+        else:
+            logger.info("%s: %s, %s" % (layer['name'], layer['type'],
+                layer['path']))
+            valid_layers.append(layer)
+    return valid_layers
+
 def main():
     parser = argparse.ArgumentParser(
             description="Yocto Project layer checking tool",
@@ -103,6 +119,12 @@ def main():
     if not layers:
         logger.error("Failed to detect layers")
         return 1
+
+    logger.info("Detected layers:")
+    layers = validate_layers(layers)
+    if not layers:
+        return 1
+
     if args.additional_layers:
         additional_layers = detect_layers(args.additional_layers, args.no_auto)
     else:
@@ -124,23 +146,6 @@ def main():
         logger.error("Failed layer validation")
         return 1
 
-    logger.info("Detected layers:")
-    for layer in layers:
-        if layer['type'] == LayerType.ERROR_BSP_DISTRO:
-            logger.error("%s: Can't be DISTRO and BSP type at the same time."\
-                     " Both conf/distro and conf/machine folders were found."\
-                     % layer['name'])
-            layers.remove(layer)
-        elif layer['type'] == LayerType.ERROR_NO_LAYER_CONF:
-            logger.info("%s: Doesn't have conf/layer.conf file, so ignoring"\
-                     % layer['name'])
-            layers.remove(layer)
-        else:
-            logger.info("%s: %s, %s" % (layer['name'], layer['type'],
-                layer['path']))
-    if not layers:
-        return 1
-
     # Find all dependencies, and get them checked too
     if not args.no_auto_dependency:
         depends = []
-- 
2.43.0

