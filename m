Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C93C4450E
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:48:11 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12681.1784134081340811607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YMwYKU9J;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6a378a2cfdfso1435182eaf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134080; x=1784738880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3cdIS6kNZ+NCkFKKWrOSlKLAJT1/5HDzvJYCctLm/X8=;
        b=YMwYKU9JyEGzpT9CRYHqFHO6qBRnU6WppbvRB9vtN5jo9SlEcNNbptyzIAzmIfH+cr
         dA77GdpSQGU32J0p86Vl3c6rxInGKrofQdvroEqNH/uhOLONXHb+8etJxlvZyIh40Q6T
         0nIImmhFnpermmsf3nAxAEf1PrpiiJlOkDTdJpZpGgX9zGGQFQ/fN/BdldEyAWL/ARSL
         aveM3o3BYXBk1veoHOhxGPUe3MGb9TrH0tWtHl6hk8ocArJeYYZGC8z48dSF8xpsWAc3
         +8iaMmql2nldLqPOc5A/Ca6RJCoi8Betq1N4ZI7hGdhJjM4KsO9GJGxMFQHDwoeL2z0f
         KRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134080; x=1784738880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3cdIS6kNZ+NCkFKKWrOSlKLAJT1/5HDzvJYCctLm/X8=;
        b=E0DoohJo1PpzCgMT7hBOzZkCa/mmkMMzRDr7HEm00t/GTaaJjiwqMxdgSbN9YdCtUW
         HIbZiHK+0qQ0y/IkNjUhRvKny2qjgAv9bn+5JSpPwspqXD7UP2GfXD0uNH+1jjT1VHvK
         vqFesMErpZeYRfSC6exdK4ysaUbLBzzdGPMI3NJi0S5sqT1yENpJru0pdphnrh863GXb
         06QZF1+ZXqOIVMPLOMTW6HFbU/uIvtOezCZZiflvb+Kvtgpzco9J4ih+ruyUUOQhHH3P
         dq96C1UN/3pc6NPXGWy6oHYnnRUElnE7UZ290HIO6OujkvjzMQ6AhQtGzgTodFv0/erx
         fD8Q==
X-Gm-Message-State: AOJu0YyON8q1BgX1GylCTYwgaETA+5Jyhurlh4iNr68Vj20zdU7kZmM3
	1DFEpzBq0p+IRPMnFckVmVMtP3FiRn9eiOKYeC5iBreijrSiNmhISFib1+l1Iw==
X-Gm-Gg: AfdE7cnQ7mO6HSqqBBli69cd/kIDYpVA6Nb1pCXnqajDdqUHBOX42kAwAnHxJKdTwpX
	xTuZrNcn25NjW3RyIWYuVXYLnNIkDw9PJtY1U5EuTtFrlxVkJaVJ1BFuSQh3nwCx7xJDBtoESE6
	aDTmIgw4sC5GkfE4tZW2lMruGWms2xntwL6B3Navr4NMZi6XsuRj3nOTypBYAq9w+LoxkAQYTQJ
	XCfIFxrTVb9WrToYFoFTSvWPmsNRgojsIc5w4ycykeR+AKXZRsKYf0H96Ni/vM9exXBYuhxVHmd
	HTAszoXT+az94I/NAmeCHYa+5Flt/6t2BYyFlwaY+0gAK95juNuppJvlYonYElBDOPlxGufks6j
	BALTcC49vuqkk++vM5arzi7LF4LM+bm6heOBzbVIcAUVhemXtdcU/TknuCEyNLYSuu40DMETfav
	VqhW0JirMi
X-Received: by 2002:a05:6820:81cb:b0:6a3:759d:c418 with SMTP id 006d021491bc7-6a39a863ac2mr10460393eaf.71.1784134079052;
        Wed, 15 Jul 2026 09:47:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:58 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 23/25] lib: oe: sbom30: Handle None in Relationship
Date: Wed, 15 Jul 2026 10:45:19 -0600
Message-ID: <20260715164739.364323-24-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241017

The code to create relationships was designed to handle `None` in from
or to, but the `to_list()` function did not propagate the value for that
to work and instead raised a TypeError

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 0926266295..28778651d5 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -180,6 +180,9 @@ def hash_id(_id):
 
 
 def to_list(l):
+    if l is None:
+        return None
+
     if isinstance(l, set):
         l = sorted(list(l))
 
-- 
2.54.0


