Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB61BCD4F39
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 15:03:45 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9839.1778684621171687730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 08:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=quem/v8i;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4645dde00a7so6257088b6e.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778684620; x=1779289420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPYM7+EjK2MbhDX9cT/Y2IS0M8NU3Yl6H+gjjMjlytQ=;
        b=quem/v8iatj+nDH5gAJgNsRbeG2z+i9/AvxloHP0OWAeHyPmcUZ8jhx/ojX7hM5NuJ
         6Ece2o1FZE0xXZpdfH3f4StRViDedcRc3+cKrff7DHP39n8te52v6B1+foSBsIYUg8KS
         pfDM+xnGEd0XMekpmjXiC1+2vgS7/y7YA+qug9MuEdE3eGgdbY4wFWiIWzh0GH/lWJeW
         UxPrmkmgkJZRB4rQAtF5f/cjUvuM/4PMXSuaKZZt+3S4s77bsdFwGUomijTzBtERPE0Q
         g1KLOjXfLYW7jHn0P0/2snT0sccnHpMSmB8VT3o8Yw817FVnw6NFUqzVae0FYeb7A6eP
         QLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684620; x=1779289420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pPYM7+EjK2MbhDX9cT/Y2IS0M8NU3Yl6H+gjjMjlytQ=;
        b=ivfPfhVDqMm7abeP7yGeH5Pc2t1/flzcvCyD0NGW46Kcmp4pmNm5wgTK1jgDfzWc+d
         pqpMSfBJFqrqRonF8u0W2Mt8XbRHYLZ8UyuAzFj56xl9awmH2r1YyZxYLcpAYo+RbIop
         pyJgVIyOa0+tSCVTG7barwB/1VIyGb9PD9b3E5o8NMEV04CbgtyB5xLe1Op6h9s6qBRq
         Cew52oRYn7OFjr0fsgV2k+bUZ67WZ6rXSraJBqXSeK0rLUqu37Q51cYfcvMKTk0JL2Xb
         rM2v+KiGGjjOOVxKIy6dBcrVyvpQ43XMkW67Pb9FAlK3hOm9JtNZ1ulGSsyTzRwMHu2C
         AQmQ==
X-Gm-Message-State: AOJu0Yycge9fUUBMWRBPf6AFAzFagr65L8m6E/HVc07mtWqGgrUF89jG
	Otl1jAELPaoli5EG1G04XLyJixJv9hb6CYiOiGEaBifBKewrBaaDLTnRBvj3Tc7A
X-Gm-Gg: Acq92OFtT3DC2B+Qh6tgcyMxzo0QWhOe8HECKD/uxcQHoqigqV4g4gfq0LGrl13pw8M
	569ri5RdIpjzrOARugEXYjBkPI2biJajeEL0BgrPFNWEnt5jVgPh4e4ZWOmoZEjuEzOe4cyeChx
	DyTItIFT858HQuTYXakXwAOD//+WIguTMjKkRZd8ep3lHc30oIOsEpEHjFfD/gmBanyE8utSeG6
	txNrymOrCrpv5QkqtIdwGDZUeESUMyuyo7ug17R/OVAgvfMZwIoNShKjihg1MxtwqaLnHaPF6Bk
	UhpALwXf8w6WCQcFjPAqDcyfgAGp5qTkrJaDFUHUlNSiyib6U0x5if/T9gdv4WZlD4zJGIO6VV0
	SlG6SP8OgYdB3kMvdVrxbl5lMlY3TdoAJyxpTOl1JKQihNB7r3P7za/5wFbleIRZexCvgZFyWRl
	CM3wCjjxTw3UjGA7weSRy8
X-Received: by 2002:a05:6808:191f:b0:479:fca7:465d with SMTP id 5614622812f47-48293dec886mr5351673b6e.30.1778684618620;
        Wed, 13 May 2026 08:03:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::c552])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-435573e7254sm14765400fac.14.2026.05.13.08.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:03:38 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/2] spdx: Add SHA 512 support
Date: Wed, 13 May 2026 09:00:58 -0600
Message-ID: <20260513150334.925178-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513150334.925178-1-JPEWhacker@gmail.com>
References: <20260513150334.925178-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 15:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236989

Adds support for adding SHA-512 hashes (where possible). This is to
improve compliance with SBoM standards, in particular BSI TR-03181 [1].

SHA 256 hashes are still included for each file, and still used to index
files in the database. Also, while SHA 512 is supported as a hash for
downloads, most recipes are still using SHA 256 and would need to be
upgraded for full compliance with BSI TR-03183

[1]: https://www.bsi.bund.de/EN/Themen/Unternehmen-und-Organisationen/Standards-und-Zertifizierung/Technische-Richtlinien/TR-nach-Thema-sortiert/tr03183/TR-03183_node.html

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py       | 7 +++++++
 meta/lib/oe/spdx30_tasks.py | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 0f1f9281ad..b379ff947c 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -638,6 +638,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
     def new_file(self, _id, name, path, *, purposes=[], hashfile=True):
         if hashfile:
             sha256_hash = bb.utils.sha256_file(path)
+            sha512_hash = bb.utils.sha512_file(path)
 
             for f in self.by_sha256_hash.get(sha256_hash, []):
                 if not isinstance(f, oe.spdx30.software_File):
@@ -684,6 +685,12 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
                     hashValue=sha256_hash,
                 )
             )
+            spdx_file.verifiedUsing.append(
+                oe.spdx30.Hash(
+                    algorithm=oe.spdx30.HashAlgorithm.sha512,
+                    hashValue=sha512_hash,
+                )
+            )
 
         return self.add(spdx_file)
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 0a30be5767..7cc46d579b 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1478,6 +1478,10 @@ def create_image_spdx(d):
                             oe.spdx30.Hash(
                                 algorithm=oe.spdx30.HashAlgorithm.sha256,
                                 hashValue=bb.utils.sha256_file(image_path),
+                            ),
+                            oe.spdx30.Hash(
+                                algorithm=oe.spdx30.HashAlgorithm.sha512,
+                                hashValue=bb.utils.sha512_file(image_path),
                             )
                         ],
                     )
-- 
2.54.0


