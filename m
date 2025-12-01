Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A04D116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 16:32:01 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25755.1764606717185446175
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 08:31:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=foi8nmnx;
 spf=pass (domain: smile.fr, ip: 209.85.208.43, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so1077929a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 08:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764606715; x=1765211515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fey6/MMZYY5H26igQ2VPhHYh3Z8zP28DH95PmOpkcug=;
        b=foi8nmnxeHAVETVSSuTQyf+NYHwVdOJxAZeWgn/Ke52SkGqqLZlIVM7hTEyaEUGG8I
         sfwDalFwWv7TdEk0vurdgva6wNwqMs3pUGmzeC9nk4/54KNNsLVFNbzrVH4LyA14+phY
         II3wE2naYTSxPwO6Fa/D2tybf+ARJc9sUPa6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764606715; x=1765211515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fey6/MMZYY5H26igQ2VPhHYh3Z8zP28DH95PmOpkcug=;
        b=T1RXMoa9L7G252nOaQ2j0NS54XeJFdSm9jxOrZ3Ovpq5QWK1AMngtAWlsrcwDUCP2s
         MXS7bs7WctYFR1YqVHYtEa+QtP41e8ytr8Tm/C+XHJ1IqP2Js6Iyj6HTajO0eU2HCEF+
         +hnPgBLPK0zS7iOQYHfZ1w9D7FA/lHimBeEvPL9McRlNAPwXbDZ9KodQOIoofKDCa0r5
         XHGhhGje0fk1ML81TipJae9/eebjxKgmT5CegOINL/ynGpWoqPpdnxypJMS8G6W/iIdp
         Y/JmsFmCo6x30EV3fLlZKb0jJEi7ahTtSVWOd9fY333Lnx+OycnjaMea4iK9LEyuB2N7
         jS8g==
X-Gm-Message-State: AOJu0YyTY6HSsLXuRo6aIaEYohndUbkg26O7BsWhKiApwklFHev8kcgI
	CpepnkyidbSyw/GrwkElcbb1i2zKTdvS/Ns33+CO/zrfhAu/jFtNYKBraHO21dsJlDKwC8gymZ/
	a9Hhn
X-Gm-Gg: ASbGncupzQqiqwJYNF2MtHb5o9elQ6JmUcLdhhpxtb+NJnSfHTR2URowr7dny/ebcNR
	frn5SJ+yVR0SfJsGX9tfLrXB7+wK+FZOzBE+QC5vIewhTKbzRACFbVDrTKxCWKpxjELj28eOwCs
	XHyqPrxbtJn+rCsJXpzhm4yFdTTYHdVkAwml31YhAxc8ICCaK/3t8QOQFPUUV8ZhySotGzaomeo
	cMvUaXItPla7MHha//hqKA4VNNX1Mtg8npqfNMk4YYQQGJhC5n0jOLrq89L+4cHrVHoAicd+J2R
	dP8feUUdLxmJK9vM1qEJ6WxUHrYV92OZIfYl22NTj9yGzaywJScslktGQRDKjSJtpae4TVc59RU
	vP9GEr7MYezTst7usS7vmbRon635DisIfL+UtWugAWIYsdHk/p5ExCiizscqTrQw4d/sGi2TpnQ
	A9tULJEoEd62laDhSjp29NpOqSyu36+2GX1rGJE7AHzAcsoUtKq+abLkFNb3bw9+96Jo7Ml8FO8
	zZ0H/GQaAEbt02J73QJNvU=
X-Google-Smtp-Source: AGHT+IHPcK2p+CxLn98z7YiGJ6unIG32vo1npjafKNixXEglGudbmzRmejqbSTVpEkdCTzsKxJOdvA==
X-Received: by 2002:a05:6402:24d4:b0:647:550a:2f3a with SMTP id 4fb4d7f45d1cf-647550a2f6dmr11257657a12.5.1764606715372;
        Mon, 01 Dec 2025 08:31:55 -0800 (PST)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-3d1a-8466-8f7c-672d.rev.sfr.net. [2a02:8434:8fe1:4f01:3d1a:8466:8f7c:672d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90d45sm12980290a12.8.2025.12.01.08.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:31:55 -0800 (PST)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [PATCH v2 4/6] patchtest/selftest:  Extract head-attached test loop into function
Date: Mon,  1 Dec 2025 17:30:58 +0100
Message-Id: <20251201163100.143476-4-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251201163100.143476-1-naftaly.ralamboarivony@smile.fr>
References: <20251201163100.143476-1-naftaly.ralamboarivony@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 16:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227132

From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>

Move the loop that run the tests in head attached tests into a function
'test_head_attached'. Also add an explicit check for the case where no patches
are found and exit with an error.

Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
---
 meta/lib/patchtest/selftest/selftest | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index a1be478e1a..92acc4d556 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -95,6 +95,12 @@ def test(root, patch):
 
     return results
 
+def test_head_attached(patches, counts):
+    for patch_info in patches:
+        results = test(patch_info["root"], patch_info["patch"])
+        counts = analyze_result(results, patch_info, counts)
+    return counts
+
 if __name__ == '__main__':
     counts = {
         "pass": 0,
@@ -107,8 +113,10 @@ if __name__ == '__main__':
     }
 
     results = None
+
     patches = get_patches(patchesdir)
-    for patch_info in patches:
-        results = test(patch_info["root"], patch_info["patch"])
-        counts = analyze_result(results, patch_info, counts)
+    if not patches:
+        print(f"Error: Unable to find patch(es) in {patchesdir}")
+        sys.exit(1)
+    counts = test_head_attached(patches, counts)
     print_results(counts)

