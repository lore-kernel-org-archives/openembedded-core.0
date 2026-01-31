Return-Path: <charles.embedded@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92007E7C6EE
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 21:12:10 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17663.1769893930108183766
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jan 2026 13:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LkxD4g9G;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: charles.embedded@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-794719afcd4so33378567b3.1
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 13:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769893929; x=1770498729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJ2CWbr77Fgjf6Z+48ARAq/IPIdmAXs7ZFZe5D7PxIA=;
        b=LkxD4g9GaplaK8Ylmon1X7B/I5XpZfkQFJOjNQTaZrlBfpMrROdjCaWP5JuICnmpw5
         GD4+UacZV+Efd2+SvQ3H6ltmuyYP/z0eLyAkos/4t6F9j6r1dh3h7b0SyBQaL16kL4MK
         o/ezk9Q23wUwq4Jpu8S/CzzwKWoHpdwJVNdusxvJ4oNMlsxi+kxYaJHY/LiwPLmZLK6U
         uh5/mKPVVgpkhmCXXp6LXcu+/dEI2yZN6SYEIif28Kr8xKSEovjFRBHkQcEqooed1T5s
         ryiXlAYBo+rWm8RDHHkyAnIsQLA15tsJP8mCODD7Qyzo3Yvlp51laASRQoX39teEVEY7
         E4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769893929; x=1770498729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJ2CWbr77Fgjf6Z+48ARAq/IPIdmAXs7ZFZe5D7PxIA=;
        b=cCdM87RuIPn39GJ0r6L4QLoi027d7MHf83Z552cQSbGjvwa9quhNcdvjaWJbdpRQpf
         0OiriAlkV4dMxO9ZSaQx/x92Vnv0wXHK92RHmNKypzQcz11POsufLEH+8+l30Cj/zNy4
         dd6jB5QI/2Z8n4ZwpHZAnl9vrO/FCeISQ60u0CPpwk1bNJumvznjyL175xgrYF46nZ3T
         f7Ngdk8PUub7x3MCb3kmuOXY48yYPV04hbZ/FzNUppBYUFtkCdai7mOXjCHyr6InS7v9
         CGw9fqCdRt7k/ict/63yv5KjeuCRH/84Qxp7GRZJyXkSSD4jbFNhRUdv8zHKqPfU4s2u
         4l4Q==
X-Gm-Message-State: AOJu0Yyfs0cxOLnU4LKmcwjsuXlfmKU33xdaieO4XtPKLfEjY20nXLWh
	RZPojTHXcFpfCGJn9Ji+kLSCoxqWiJ9CvlejrWQLlXQdU0QbvPDO9hkeSZADWg==
X-Gm-Gg: AZuq6aL5BT2Y5fVyP4JbiBaw7p3wTCeC16VjEuqqGYweYxHBwdDVnht4eh+tZ3xTXUT
	p0wg+8vBlg8/KEZlxkO7aMMK95gKoS2kXQhGS6nPDxtNVbKPebXnM9hEtK0rtqmgoiIS6hFKmH3
	pfCJunAhUpQBvezq6rQ3XJBii9xh0tYzuoZE/4B1z5/juIhcPXfIiFcJCHIWPGyyyowTc5wUplc
	yyD9Qw0omig4hFGBWN5otkIpLHVC+uMYvL2eYnql/D/Wo+kWRGA/xLF11g3mA/ft4aWvx9hd7K2
	kRGux4il0MLWmjGNOSlRjmJt5NAbdvSYllaYleoOvPB5oIO9+H4h1y/66Rf2sLGfRGOEZfFNWvA
	nl6PkS9KZurrV9x9MUppdpMUnMWna9rDjWrCgIvnh2/F0naLyeeAzBXgGS1qMsTGs5FzFdjIjGL
	1qV6M3zRPFiw6bUXdWQ7U=
X-Received: by 2002:a05:690c:6612:b0:794:3023:8596 with SMTP id 00721157ae682-7949dfbf60amr65890687b3.40.1769893928816;
        Sat, 31 Jan 2026 13:12:08 -0800 (PST)
Received: from charlesdias.. ([191.22.16.59])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794828cb304sm49415187b3.45.2026.01.31.13.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 13:12:08 -0800 (PST)
From: charles.embedded@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Charles Dias <charlesdias.cd@outlook.com>
Subject: [PATCH] runqemu: parse QB_GRAPHICS for nographic flag
Date: Sat, 31 Jan 2026 18:11:11 -0300
Message-ID: <20260131211111.1189479-1-charles.embedded@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 21:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230252

From: Charles Dias <charlesdias.cd@outlook.com>

The setup_vga() function was ignoring -nographic in QB_GRAPHICS
because it only checked the command-line self.nographic flag.
This caused QB_GRAPHICS to be appended after display autodetection,
resulting in conflicting options like "-device virtio-vga -display sdl"
and "-nographic" in the same command.

Add a check after reading qemuboot.conf to detect -nographic in
QB_GRAPHICS and set self.nographic accordingly. This prevents
unnecessary display autodetection for BSPs that specify -nographic
in their machine configuration, as happens in meta-zephyr layer.

Signed-off-by: Charles Dias <charlesdias.cd@outlook.com>
---
 scripts/runqemu | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 32a3d6296a..b791abfda3 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -986,6 +986,12 @@ to your build configuration.
                 v = os.path.dirname(self.qemuboot)
             self.set(k_upper, v)
 
+        # Parse QB_GRAPHICS to set internal flags if not already set by command-line
+        if not self.nographic and self.get('QB_GRAPHICS'):
+            if '-nographic' in self.get('QB_GRAPHICS'):
+                logger.debug('Detected -nographic in QB_GRAPHICS, setting nographic mode')
+                self.nographic = True
+
     def validate_paths(self):
         """Ensure all relevant path variables are set"""
         # When we're started with a *.qemuboot.conf arg assume that image

