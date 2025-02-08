Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A20C0219E
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 14:05:32 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.9257.1739023523967568141
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 06:05:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iOjbSLG4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2fa40c0bab2so1342779a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 06:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739023523; x=1739628323; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dZ3JWAaYbfh4j2RC+59bngKfB21w5HylHTVVUDLzr0=;
        b=iOjbSLG4GBf2WTyQjvprClM/fuT6o5hUizsD2PDxSNfnjOPQiDPIC4uwq4hnyNxmfP
         /gaLS6kyFslCbYUS8Pp6+7pOYYfhqRZ+FFM8XqvX7J8UqBmnnL06hlDFRjzRQBWOL+ee
         /baJEMTW1P9jJE04rZLKsGegsGM5vvcuIxgZBrbM8HjBQQwiXcSvgZPU2nXg1+/YSDgd
         D0Rq4mf5Vthrr+MaF7LNKFGfwau5figKQqhAJp5ldD0vazr2JgQEXiB+l8xtZS8Td6lp
         rd+G7T4hTRxFJGasLHXIAW7dnpxqfh+DstIdrmrNTOKUBlQfTrptdqCa2uejdhb3Crhz
         4qXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739023523; x=1739628323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/dZ3JWAaYbfh4j2RC+59bngKfB21w5HylHTVVUDLzr0=;
        b=uGNTjj8TE5uLItaN2oeMnvZ9oEQ8WvXOawX93E547eW3eN/w1PFw2NCeBQABwI9EPM
         /WFmBj3jPohnnXymgND6ko38fNDB7r1ruRKVvNyB3M2WzNnjBafo9g1YWbOgf1i9LzK6
         5DaHQHrjWb58P6tB2Hx7w9sn+tNpQ+Kbhr3APmz5cvG2+/fbHAXF6aDMMkdg3jMu/sOc
         clbplQbZABbuXUDNjEWz6h4bFtLHcbcVfVfor/tyQE+SY7IcFjhg0tyNKMjDUrDg65LF
         jlBzgMrAgIpN0myjg04TPH29Fv7ktcXHazshO2+GeKL1MbCg6sw/meUCZz3Zw+0xGccr
         dlgg==
X-Gm-Message-State: AOJu0Yw2OU2qeYDpfw5t5bYNlVomBIhJ0dXlIUCOUBBvmD10s1RNPZo5
	tSyBK4Jb0xRZl+lqugqWhzU0Zf+QsekrSzn/qptzdBXkujQi8EhL4pBOwh2uDKooPHiwytnOPSk
	T
X-Gm-Gg: ASbGncvjF1jxewk7nGPzn+309ePwrFWoGrjYCRlGkNXfMbVSOO8u9zB1xq6shl5u7/h
	CGE669iXOvXbnEx1/gkJufN9xyQakXz5LleigTlWNdY5zpEXloJ3B4FD7YsY76WfJ+f+1jJkcIE
	PVOQPkRJ+ZEH5Q8f3/CC8ffUZBU6rEcJ4lf4N3xo+3FNRhUhlO1VLERyJbNn049BzvCsiaWdbZo
	NO7hEmr0gOlrlROqZYLg2eI5t7H+y8STXY3WICmuvTvWfnJafRgqa2JpwX3hrbfBHLTaEctnRIG
	Svsp
X-Google-Smtp-Source: AGHT+IHLViJDNJorUrRbHoNKiCxeH47m8HKuk8261mrXYuaHBzgFZ+IzIxyMDj8RzyWTKYxeNKz+ZA==
X-Received: by 2002:a17:90a:ec86:b0:2fa:13ce:bf16 with SMTP id 98e67ed59e1d1-2fa24068f50mr11042673a91.11.1739023523261;
        Sat, 08 Feb 2025 06:05:23 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c820sm47278345ad.173.2025.02.08.06.05.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 06:05:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/13] selftest/rust: correctly form the PATH environment variable
Date: Sat,  8 Feb 2025 06:05:00 -0800
Message-ID: <72156282059aa5a013a386eb95f89dc38726326e.1739023409.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739023409.git.steve@sakoman.com>
References: <cover.1739023409.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 14:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211033

From: Alexander Kanavin <alex@linutronix.de>

There were two issues here:

- the path to native python was not included, so the test
suite was running with host python, causing failures due to
host python being given native libraries:
https://autobuilder.yoctoproject.org/typhoon/#/builders/148/builds/1711/steps/12/logs/stdio
(rust recipe uses native python throughout)

- tmp/hosttools was listead ahead of native-sysroot/usr/bin

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aec96b5aec8d6b4a5ae8a719ca05bb727a6197cb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index ca98f8c0fd..26f132edc4 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -208,9 +208,8 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
             tmpdir = get_bb_var("TMPDIR", "rust")
 
             # Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hosttools.
-            cmd = " export PATH=%s/recipe-sysroot-native/usr/bin:$PATH;" % rustlibpath
-            cmd = cmd + " export TARGET_VENDOR=\"-poky\";"
-            cmd = cmd + " export PATH=%s/recipe-sysroot-native/usr/bin/%s:%s/hosttools:$PATH;" % (rustlibpath, tcpath, tmpdir)
+            cmd = "export TARGET_VENDOR=\"-poky\";"
+            cmd = cmd + " export PATH=%s/recipe-sysroot-native/usr/bin/python3-native:%s/recipe-sysroot-native/usr/bin:%s/recipe-sysroot-native/usr/bin/%s:%s/hosttools:$PATH;" % (rustlibpath, rustlibpath, rustlibpath, tcpath, tmpdir)
             cmd = cmd + " export RUST_TARGET_PATH=%s/rust-targets;" % rustlibpath
             # Trigger testing.
             cmd = cmd + " export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
-- 
2.43.0


