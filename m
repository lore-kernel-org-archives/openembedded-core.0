Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6493.1793052474782052338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 15:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tCZ9IUxY;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8439fe796ebso2385636a34.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 15:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793052474; x=1793657274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oJ7Bi6zn87dRoWdjRUs2L7zIkV/VGDO0Q3ZYZumZ1hA=;
        b=tCZ9IUxYo5s7nE9UoP1Efm9b0nF6TjahLSI/LoVsIs6tXHofNSiBSJXvtKOcDq5eZY
         t9P8+RLGqoft6EQ+2QJWGSNVxt6RLuBNaMLedIp6UPdfAn9jY1Ivv3zwKrbAXKO2J98T
         nA1+WcAerH7kPRTCZYctnrNFwWFqvYOv36+WXJDjV582Ho55AgNicVCwRPVE60yVNv4u
         JpZoaXJMZaoegPTkWIFYzKT7eg5vYNNFR2vcj6mFVegQEA3+n5YDdVdZYw6Myl5nfBWK
         Pv4HztnokYYDy+0ppMIa2/1HXaoXe6iulKYSNqi7Id6sUO3KZstb1F8yxcfHH1fJye1m
         vfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793052474; x=1793657274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oJ7Bi6zn87dRoWdjRUs2L7zIkV/VGDO0Q3ZYZumZ1hA=;
        b=EyLjrKc9PC+B2g0THt3bemiksEeV3rcD2sr+5IVBytGOWaceSOpnOBH1u4MxonLOtl
         ILGPiJgZAhwzFA/xkmKjB8X2zftvcSj209oQN3lzC7/i0xgvnKzMWCGpEkGde/bHuZCg
         QTkcQ9/z0ehyXTgjh8yifpjtpWzWS0FJqfg5E0Pg3aanqwCB+aO91T1hVvSyV3bidUo2
         BntVWNFpDRSFhMDVXoOi53w/OlTyKOFKYOGEwY4cG9454wR09YeGzsM/z7UMNnEwy8sZ
         ZbqFXPCOIc5HGl+FwbOmdoY+rtCa0PJK0cNDFnhuww4keqWeIN1llDRac8HS1nglOhO6
         zx4Q==
X-Gm-Message-State: AFq9FYKwTN+LRjBJW2df/SlnI5U6B0ZsT4WWSGJtEyT1AhlHQBOgakQU
	ipxErqVdiVLuju6nT+tg6HCCzzH1/P6Z07vk4J0tsQUtJkU33Zb8ZIwmNxQTCw==
X-Gm-Gg: AYBFou0CBr1yimTiDVK/ZmY2M6X5e9rhZkfneT8yfAXbOxJwJSSCmAmX2NszJUf2qNd
	LYkzOBJSd18vWlUyWQaPO6+6paQxBiYtYRtocSGzQgA2s8j2yCPfda8nS1jmkd51E7GLP65B7Pl
	CTCsvwdnsBmx35np9vyo1CoAnyx1PF114hmkK4Lj9bq5+20ghxN//F9h1LUebsVHwTxgsbXlbPH
	B3ydh69KliZ4BsfcZgVGrluGNwRU8d9j/BXauPfNLQ4N4OuCnS+34Q/SQrtWALTYDgSoTvMV2wA
	kiz4S9/S7O5xicbbWrLRpfigAeROmTc60PfOq0dGyNl01jh4j76DkTcXO9C9XN9y4nd/dOg4d6x
	1/mviBlCycSjf/C/YQj+inMpbiFiBMKxlNjTu9Nyx6RG4nB2/fgix6eh2sdH2+cCjEnWi0nDi2E
	qqdyCuUX7Ds630Iq9V8p6LRDx0uJ7NGBWRaei2ki4AtmsTMegL6t2pLhAaTzZ6xSfWPrjVQILVf
	49B16nKH7hz+d0xqKxbed/Vkksm39n0JNn25RwKiRMIlLEhfLEuFA==
X-Received: by 2002:a05:6830:3911:b0:845:8d86:9f7a with SMTP id 46e09a7af769-850fd37b7e0mr6897234a34.10.1793052473862;
        Mon, 26 Oct 2026 15:07:53 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::283f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0763easm9025237a34.13.2026.10.26.15.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:07:53 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 0/3] Fix incomplete license expressions being preferred over complete ones
Date: Mon, 26 Oct 2026 16:06:32 -0600
Message-ID: <20261026220751.2480577-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 22:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248701
Content-Type: text/plain; charset="utf-8"

Fixes a bug where an incomplete (missing the actual license text) could
be preferred over the same expression that included the license text.

Joshua Watt (3):
  lib/oe/license.py: Fix documentation of parse_legacy_license()
  lib/oe/sbom.py: Fix partial licenses masking complete ones
  lib/oe/sbom.py: Split deduplication of CreationInfo

 meta/lib/oe/license.py |   4 +-
 meta/lib/oe/sbom30.py  | 107 +++++++++++++++++++++++++++++++++--------
 2 files changed, 88 insertions(+), 23 deletions(-)

-- 
2.56.0

