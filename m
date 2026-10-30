Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18915.1793386318692511609
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 11:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qDos1CvM;
 spf=pass (domain: gmail.com, ip: 209.85.221.178, mailfrom: vinicius.eduardo.pedrosa@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso421709e0c.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 11:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793386317; x=1793991117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fIRNPSCnsOwCO/iTDnL7g2imZc6S4kxfs5iyp7CYwsE=;
        b=qDos1CvM8n/0QM2pYHClHNpbusfxqCzy+kK2QIXRA1Sk+9cbWBiz9Tr2kOWYAC1+aT
         JPwdDwVyfXnRcdAz+pehfnm5jp3C44zvDKKVETfoNVyWq5SEGfT3pMJWNu8jX4sNsPtT
         +j3uRONUUrlG7RKgCK1ORTp4AdydSxl57Xx2cjcom8BDRrQlZGIoZ8WTHdn1yM3KhMrv
         odQ2sC2VAY8LTqeVl2foG+7gyotBJPaJDXPcK4mh3LJS2rJDIRVQyYkgXZqI5IcOjAcT
         oD5hvlBJ2SMUM80+ByeMAsqU0n72+WO/9CCiFweEPZz1J7ig2rrfzZpvLoAq9IZV+CkB
         wEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793386317; x=1793991117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fIRNPSCnsOwCO/iTDnL7g2imZc6S4kxfs5iyp7CYwsE=;
        b=ktSxBBs8HZvnEeWt0bVZHIjFPANr3UDaNYX1Qy2+kSB90yWWQNZsqW/5CHwlW26jYp
         LgQvlh4eSM+/aJG4UKxQ4cKJoMoCZ2lbkoYZZ1137O3hhBHTWKWE65LJEH7AqnfVKDju
         VlToOcQtSSgWA2nowAI1frHcKO/od3MSVbFjb5OFFENZ0X2jc1kEJ3Zdx8yE6YennVqz
         kE3+2+xvEh8vRWrlJnPaqpNXDkET2GzWbJ0q0UTCvrW0O5QS9aaAYKSaeeTwmlPQ7bFI
         8Nq9pCKyMid/CYAOf8mWDCz82+nasPE7roojiyLq6qqtcPxWOt27+4tqo4WTyy85Qoku
         MHQQ==
X-Gm-Message-State: AFq9FYLP5tcLL4qP+h3dMj9o0y0yWhGScoDfPBX0lyznIf2Wur6r0CYw
	AdIVm6D7Ji/WR00Tk5Xrt/lqoimkzRQx2P1zzuW4jgCEuqu7ZqP3l0H9JXrsDLPxLtE=
X-Gm-Gg: AYBFou2i3letHgqiwlNRCoxGHj9G8+0NgFXEzBSCclIqQEM9N1s04sGEfMn/ANiThvU
	e7o4LY7oT5KAF6atbZrgaIEZqfwpKxFP7tFfwqTYVZ2DkB/vimUldRv014PHwCcjqkmAxQ0sGfb
	6vdQpQzFGwfvVyMlXmKbuh56+UJ40a6ENkUsUA5+WL5pSUbZQkxDD+RWmLX0EZ4wZP8ioZsF5k6
	E7uXs+W6nzz7570bDAVwM04aKDsOAeDCqKKz3Xwh7ZkntYJQlukrQxn9gcYv8OomxjIQcVSzjy+
	RPBHvSKoGOLy6oso1l9gOUI3Y+3o+QsTUyP6SRxPX0mHR5AWMkoCL2ay9HPNRHcMQD50p7oKMYl
	bK/FvlxOxl1gCtiX6YsIc5GvHLsc6Cne/aPqCoyaY/e4MMtkFykD2UN5lWcLHOvwQpSHO2sVF8w
	/jcyUq7T8hpQZFIZIMnjnM/FtLX3Jhq7wEIBvEvzItZPo3+B7qarVMYutgLZSG89JiCddQAIGQl
	Vijm4H7etXAxG67dPbr0fMpE623zicWd0hk88zmqzhj3dAhrOgGrT/8+wek7YrocGvG1TEa1CIL
	r83ACbYZfD9JB26TT2Jz0JitTi4f5l+Dsue4QPSHeSh6qK90Wfq9Gaqc8VbNImPZvqF4DuCRVjk
	6c+KRtR9/QCPG3TniHD49y9FU2+FgQG8P9b9Ga/MUogwWIETp9csEDbOyfA==
X-Received: by 2002:a05:6122:1da0:b0:5ea:c51a:37a1 with SMTP id 71dfb90a1353d-5ec686ff12emr1563759e0c.8.1793386317396;
        Fri, 30 Oct 2026 11:51:57 -0700 (PDT)
Return-Path: <vinicius.eduardo.pedrosa@gmail.com>
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69bf54casm3307298e0c.9.2026.10.30.11.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:51:56 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [PATCH v3] yocto-check-layer: don't skip entries when dropping invalid layers
Date: Fri, 30 Oct 2026 15:51:45 -0300
Message-ID: <20261030185145.818577-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3c6ddfc306b5369be0748e492955e3a1a4bb9a74.camel@pbarker.dev>
References: <3c6ddfc306b5369be0748e492955e3a1a4bb9a74.camel@pbarker.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 07:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249142
Content-Type: text/plain; charset="utf-8"

The "Detected layers" loop removes invalid entries from the list it's
iterating over. When two invalid layers are adjacent, removing the
first skips the second, leaving it in the list.

A skipped entry without conf/layer.conf makes the dependency pass fail
with KeyError: 'collections'. A skipped BSP+DISTRO entry isn't
reported. If no other layer is left to test, the script exits 0.

Move the filtering into validate_layers(), which builds a new list
containing only valid layers. Keep validation at its original position
and update dep_layers when it previously shared the same list, without
changing the existing dependency handling.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
Changes in v3:
Paul was right that v2 combined two separate changes. I should have
kept the dependency-handling change separate from the original bug fix.
This version keeps only the fix, with validation at its original
position, preserving the existing dependency handling and duplicate
collection checks.

Tested on master (b62d5e6) with two adjacent directories containing
only an empty conf/. Before the fix, the script raises KeyError;
afterwards, both directories are ignored and the valid layer is tested.

Regarding AI, I wrote the code myself and use AI to help with English
and code review. I'm not sure whether that alone requires the
AI-Generated tag, but I can add it if needed.

 scripts/yocto-check-layer | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 8c8b4db..ca4ada0 100755
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
@@ -125,19 +141,10 @@ def main():
         return 1
 
     logger.info("Detected layers:")
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
+    layers = validate_layers(layers)
+    # Keep dep_layers in sync when it previously shared the layers list.
+    if not args.dependency:
+        dep_layers = layers
     if not layers:
         return 1
 
-- 
2.43.0

