Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44785.1795622120955999893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 07:55:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=MJM8J8/N;
 spf=pass (domain: baylibre.com, ip: 209.85.219.54, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso79393586d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 07:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795622120; x=1796226920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R0OvViyUOcqQVRSI7Vz+I/ravB5us7LrClnuSiOhgnI=;
        b=MJM8J8/NZGpNHkUaHwkkX+j3+9uKzVfExZukAYthkSLJuY47txvVbHqefzu60fEKfd
         XY6KiT2xiVJJTkgRkVMsiA9hx0pQT75qtq+j/z0/Zf4q5kmt+nJmGj7bvN7GUBJdj6xW
         /8uDgZhcTyJy5HN5SMFr+fVn/JF+TRCeBQyrRfrXlO8VYO3yJjL6udhtrh/CQ/oX5I8s
         hL17aMUZ3kewWdL6oV7+MsaqBVOzJaqb9ggKWFjoucB2hAg+yVpHZqQ076XPQ6ajslxF
         cKiseNYjp+xuzenEiBybEtquiWh/bWsj/DoDlN3pid+lePB9DtO/edhPlEUR1ABgW3Xx
         eTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622120; x=1796226920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=R0OvViyUOcqQVRSI7Vz+I/ravB5us7LrClnuSiOhgnI=;
        b=Q2/plJ2T4p36XMGRZuJn2WFxI3mb4dU/kRBF9HT9BfcBmhLWhg4OmCPqFnuktXVEg5
         wlfn/xqVHleI5fS+aTpcVp1Sw0Kg3Z4b0hngSXD/+8gozWelQzWWIjD0IlBTmd1NfV8d
         swU9/Glggjh6wcMQjr3hYDuuSoka5ytjUjxDOzZBspBkvPZbTY1i+6OcrgOmYU6R+SZ9
         sVvKrDTtAqlXxXr6WgdB261XYMbmXeWW55e7EtxgRqkXIyB6ZCRkVZHJKJcy31EPqxHf
         sjueSCRjEr9ky+z6bBGcFF3REYDgu4OZT/a1pPqUepCKVnQM05jgWmbDZ2bhrmEeBaYR
         2RSQ==
X-Gm-Message-State: APuU4Z+Fvx78huPHyiV6V8FmcOKBDLOSDrjB9BiQksaQRLdkMAl8le5z
	q/h2/AQifvbgPLtDV+gfTnJRg8T+A5aZgp2/wdc7mhPgtcmklPhATATzWNqdc9w9j6H60WTWabf
	CxGkR
X-Gm-Gg: AZFdTZfnbE27EBriREal1rwPuMjW6qhet9fR5fzEe36+dpDh+dvApqPbJ6spWICBW6N
	XmD4YflEJFN6Rk7MCkEXP7abkGfHxfBtpS0h64MpSMB6Rl7XBnAmieH1dlTzMbzk+Bfik6oAZ/5
	s1859sPO78z/Wg6YZoFmPAO8CHa5MW8NNUei+wchqyFn+CpOEK0nqtemk/ux3ErM8VCsPl04EHR
	3ISOakpcZX0dJe1zD0LzBxzAYfLqvpD9ZC9O9zubj1nCTRbLbfaDSv5UGLe3huw+ejI20AyZ1y1
	ED99UZOBnaaF6Ca/VAFAp8vLfstKxF38xCsCUuojHozFqwJR3nAND/DhH6Z6KbpEpdcfoMeRFsE
	m5/8WX1QFrdGscrMdWD/ezWXfVMhB7Ix5Lz7Fpm4S7scTWeIOWVjVnqcUZsodnAMjLikj94ykTI
	ya7J8aQoXBInigpUm+iB3E1mGr4PiNtc1UCUpKKR7USxa/EjQowHR7K+edq08542EZRyqNU140m
	UGtZpypu6HrzZOQtmxlWkdnaeRoCBcGbw1Xh4DnAbpDEftRrf2ce23+z2KQePmd8erWN6K0ZQLQ
	3him1O1U3lhi53ivYg7K2lfkUMxpoPfoJbLolgRnIJ0zoOYfg+lelLJufXuMxp9mJCzYYK222EQ
	YIjPUwHgwRQ==
X-Received: by 2002:a05:6214:2686:b0:921:7a02:7a53 with SMTP id 6a1803df08f44-9217a027bc0mr45689306d6.36.1795622119647;
        Wed, 25 Nov 2026 07:55:19 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.oryx-coho.ts.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b253csm167601326d6.15.2026.11.25.07.55.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:55:19 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 6/6] ptest-cargo.bbclass: don't follow symlinks when chowning
Date: Wed, 25 Nov 2026 10:55:07 -0500
Message-ID: <20261125155508.3024814-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125155508.3024814-1-tgamblin@baylibre.com>
References: <20261125155508.3024814-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 15:55:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251203
Content-Type: text/plain; charset="utf-8"

Use os.lchown() instead of shutil.chown(), as the former follows
symlinks. os.lchown changes the owner of the link itself.
shutil.chown() didn't add the follow_symlinks option until Python
3.13[1], so we can't just add that argument.

[1]: https://docs.python.org/3/library/shutil.html#shutil.chown

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/classes-recipe/ptest-cargo.bbclass | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index cc82ea320b..8f4f003a9a 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -117,12 +117,11 @@ python do_install_ptest_cargo() {
     if not script_exists:
         os.chmod(ptest_script, 0o755)
 
-    # this is chown -R root:root ${D}${PTEST_PATH}
+    # Equivalent to 'chown -R root:root ${D}${PTEST_PATH}, which doesn't follow
+    # symlinks
     for root, dirs, files in os.walk(ptest_dir):
-        for d in dirs:
-            shutil.chown(os.path.join(root, d), "root", "root")
-        for f in files:
-            shutil.chown(os.path.join(root, f), "root", "root")
+        for name in dirs + files:
+            os.lchown(os.path.join(root, name), 0, 0)
 }
 
 do_compile_ptest_cargo[dirs] = "${B}"
-- 
2.56.1

