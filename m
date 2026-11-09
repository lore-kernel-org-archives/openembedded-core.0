Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3696.1794253684246225957
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 11:48:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=MFd1ySPs;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-85a6c747dc9so812481a34.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 11:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253683; x=1794858483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6HhJL9qpsmK5T5siTyfRkDD4MIqxFfeTZ9MsiurJnE=;
        b=MFd1ySPsl+ZWA8t2f1gr/Djq+CJKAtfMvCyY3xPqG5/p7cZYB0p7m2Xhs0xkRPXAIP
         nWr3kBmy8u6O/0lYzZ3FcVre7Nl5jGOgTJMmYQdcSeSa2gHChDAFWBwmUGTR6AzB9+pk
         BL39lyZ1tuGUXZjELyGwqQA7WMAS85VgpGsO/FhQWcd/UQW1rv4qXtowpYiKUhwPPk69
         JfydyHhfhKKNHiGkDV95x3RwQ/eArV8mbZ6bnuiRiR1xu/LRQJ5kIG9lE5nf8LRbHeBf
         lqimhelwWIGrmoUBV5gBa34BGku2tYZlwzHlQFFfYd4hLvp2vWgz+ooYhAZDV99Huacj
         asPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253683; x=1794858483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6HhJL9qpsmK5T5siTyfRkDD4MIqxFfeTZ9MsiurJnE=;
        b=JDkJGGEsJkWzXMcRTklQdyEdngkaWe1XelkARgcevrzhA1yClmOW8X4YG0WUCqHm7r
         IaZ0Vin6+j+3qVMJxWsNg+wk4KBMV4z8y9orox008JiEN9JHJmajoteWK/4rOxybDENP
         /lyVNGakWpIldcaHykN2U4fVqWNDl3vRJBCZCMvCwLjTZWWmOMaomD4Kz0UYKQfWTizn
         qPpVZ01jvuddFxccqfl+Z9ExVhiuWhPRwTANgqYKaf45fuTK/Nv0JlH9r5fFs5Sje5i6
         GNY0QcynRS19m0CHe4Gt+J+be60+WQotW23Qy6iTOFcAnHTrX8zJeQ1KJqSskZ8fV509
         iWxw==
X-Gm-Message-State: APuU4Z+8m6Kn7OOjh1BLPfFaY6mvHIw2KyXeUVqKtyIOLarsXcU+kNet
	uNNrcruevZuVZ5P2YC2n2ovsLp2iijw7lAu/dSlao2K6/b2YJvQRu9yLVWy9CA==
X-Gm-Gg: AYBFou2AgRMWyKEBqynLuqGA1t7UdoHJ+YJcfe+9Gc7gcgSJ/5rBbD5rfpSkpUfBvnZ
	ewhgEQT4ypeTBQwnmpjs2ANla7ylLfo41rmRvN7UjZ6nnT34tfvxpouLAm4H5tffNWtuKyF3iRm
	AOdJZdyFFddMpz84m6CCmTFXj1GocrrS7n5cpmAjPMrW40dSihG2wINN1nzTZYNnWDeXNQa54HZ
	pkONMYugVO8awPIV31eNvkODiw9B9aUoeTEQgA121s9hxU4vlWo8lTNX3AT8rsXLQsEGNk4dwNr
	8m89GJYoEFIldVmWyyoGoRzQnhlAxE1IiHa1fkoUm2FibG1ooQfdx+jVS5Zlwpy6E9jRjwm8YPP
	3Aqxv8wyckZCxUECC/32n/uQWrArjbOF2wTNSK6z87ypJU0ZjS7Yqc+qqx9O/x5S/row2XgvlMC
	EYQ1CGAjWC/X45zprCit6AnndiWkNB1w3S5SQ9Kl5/beDdoJ1dh9WubNuAEnjwbtaD8cCP9x5Uk
	1Ey4HCQZrpMtLdrwvSGn+6JRZrFm4GZqOqLH/s65d+69w75s5/zaH71jz6tSN6ekw0kkXO9V1+d
	YkIIwZBHtgsMRUs9vyL2QbM6lQI=
X-Received: by 2002:a05:6820:3401:20b0:716:ab86:59f6 with SMTP id 006d021491bc7-718a5288860mr50493eaf.8.1794253683257;
        Mon, 09 Nov 2026 11:48:03 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::3232])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa132e65sm70363eaf.14.2026.11.09.11.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:48:02 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v9 1/9] spdx: Skip dependencies that are not in the taskhash
Date: Mon,  9 Nov 2026 12:45:37 -0700
Message-ID: <20261109194759.550935-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109194759.550935-1-JPEWhacker@gmail.com>
References: <20261104153535.3184146-1-JPEWhacker@gmail.com>
 <20261109194759.550935-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 19:48:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249866
Content-Type: text/plain; charset="utf-8"

If a dependency is not in the taskhash, it cannot be included in the
SPDX data because the dependency may not trigger the recipe to rebuild
if it changes (although aliases help with this), but more importantly
bitbake may not restore the sstate object associated with the dependency
which causes errors when constructing the final SBoM

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 646ec7d074..3c3ba15e74 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -306,13 +306,14 @@ def collect_dep_objsets(d, direct_deps, subdir, fn_prefix, obj_type, **attr_filt
         dep_obj, dep_objset = oe.sbom30.find_root_obj_in_jsonld(
             d, subdir, fn_prefix + dep.pn, obj_type, **attr_filter
         )
-        # If the dependency is part of the taskhash, return it to be linked
-        # against. Otherwise, it cannot be linked against because this recipe
-        # will not rebuilt if dependency changes
-        if dep.in_taskhash:
-            dep_objsets.append(dep_objset)
+        # If the dependency is not part of the task hash, do not include it
+        # since the dependency may not be present in subsequent runs, and may
+        # not rebuild if it changes
+        if not dep.in_taskhash:
+            bb.debug(1, f"Skipping dependency {dep.pn} (not in taskhash)")
+            continue
 
-        # The object _can_ be linked against (by alias)
+        dep_objsets.append(dep_objset)
         dep_objs.add(dep_obj)
 
     return dep_objsets, dep_objs
-- 
2.56.0

