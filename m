Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E63F419BA
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:54:20 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6996.1776318853578460945
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y4CcplrT;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2d868d014a5so4319812eec.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 22:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318853; x=1776923653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQRRmGpdY5+eQpzr46pHvkLD35oZBq1F6M5kHSNtOgo=;
        b=Y4CcplrTQdjPlAkYHmEI00Ss9ZtqxCCl/ZPQ164WAt781Kus7bkmEOYJqQkqmin0OA
         rW9nGQQSV2qCqZbAzX39WABZCCSEVN7eF+GHyZWjpV/J4ARw9fqBHLtDhWG3y6p341Of
         9wcEXairJhL6u3yeDBKnQY/91Lg4wOJPu+15zQbU3rstkIRMeZa8aWmPIhGkR+hTMXC4
         V+P/SJtzHZzNMi/Cg1zbwKFOYn9OmbgzZmxIJ+dncjtxxNQqzAJvrFx+7QonWOFfFzyN
         oZTgyNnp8b+V0KrTVk5FqLAz1SVNYOfTxcJriZdPHXFBCi+O9eDWUb5yaPoV05nGBOxA
         7OTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318853; x=1776923653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BQRRmGpdY5+eQpzr46pHvkLD35oZBq1F6M5kHSNtOgo=;
        b=WAgn81Zixa3nAqs3rFg0AXm7cdtKh5QKfbBe+xdaJvVtxen9LeSFOLdBbhTd1QbcB5
         1GI3xDQNmS7mqbltRrqVYt16AONMCoJofM1i82L/x1/bQyAcrd4OwwpQFJQi0EEAo3Iq
         2YhGSejdSgvf3BNfpM8N3/84q4HC5N6Uon9XtdGeNaVrWM4jUj1jgGQibawxraVB5/kL
         No4hYAhCHfJY3zKpqAMPq6XXqJWz9awPRjix0rueMpfyulQTrNeKLCQvGxxhOr9MbJID
         usdoWu8Ld5LxLLwCPX2iBZL/NcLr4PycPK8tqmyhQ8d8yCUNREzANH7QOngSlGiN3AW1
         fCYg==
X-Gm-Message-State: AOJu0Yy4m4WS1/xeIbDVKht0gosZfx4dzSNzkkgKQXJO0HJyQqx24q+p
	1a+yqDlIaxlpRkdIOp93hZ3P8R4PYu+0Ek5Asg+8Jc4tvaxhf3DXvA7+YWB5VlPR
X-Gm-Gg: AeBDieu07+a4ZgwXF86/Lo9Rq2/jAW9Lrl30T5p3xv9NaL1phv+rstmaqEFoLpbIoUr
	ThzXTNuDiBjujFkhLq8XJALoloRUReha7/pK9gJHu4FCi5wyOLXKhcZwkD+RKcILuTTIWl0rdhy
	UsuplPTFfTN6ejx9t0ree2lDwVsI0VLgV+hF1/mqGJdzeQiLJE0zcsk8WhoZL2YVeuxnlc3YMdj
	px2TYwFUSBkB0dzxb6Pel7Y/TNLq0vgySrH9imS1NOEfiAkiWoca0GhXWbz8WKziglEFZuflEJq
	dOAhLmWLGIMker8IY6+3Qgna09zPtri5xUC5tjRT5mpv7YdzUr3pCK5XDVRIJC5tMlLPzK9YN+i
	8bMJ9qn/RFnSCiErsWCPfSQyy7c02rKPOMwGAUnaGk+Y23bamCJT8CJ8aPfniw11aFVd6KOREAW
	KzYXAAKYMwFN2VO5D4t0JxQ9pfr9FTh37aGccpk0YtgNuEX+5ekLP6GDZBDf3U9Un9qerAMI24u
	sV2hUhwXtDkplCYX2M/2FbolZocBy/yjxo2Lql6vcup2ksIwfiSSNUWrLmtY5pcUG3+Cqi1COSC
	+02ilQCRh6X++PZvuF4Tpa3Z+T/ddZSau6VE9Ne5fmuOExRHvYw=
X-Received: by 2002:a05:7301:1299:b0:2df:c5bb:3720 with SMTP id 5a478bee46e88-2dfc5bb3aa3mr1266168eec.15.1776318852612;
        Wed, 15 Apr 2026 22:54:12 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb8443csm6060212eec.14.2026.04.15.22.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:54:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 3/7] python3-pdm-backend: upgrade 2.4.7 -> 2.4.8
Date: Wed, 15 Apr 2026 22:54:03 -0700
Message-ID: <20260416055407.795016-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055407.795016-1-khem.raj@oss.qualcomm.com>
References: <20260416055407.795016-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 05:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235335

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ython3-pdm-backend_2.4.7.bb => python3-pdm-backend_2.4.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-backend_2.4.7.bb => python3-pdm-backend_2.4.8.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.4.8.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb
rename to meta/recipes-devtools/python/python3-pdm-backend_2.4.8.bb
index 94d40ac528..5833bb717b 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.8.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "a509d083850378ce919d41e7a2faddfc57a1764d376913c66731125d6b14110f"
+SRC_URI[sha256sum] = "d8ef85d2c4306ee67195412d701fae9983e84ec6574598e26798ae26b7b3c7e0"
 
 inherit pypi python_pep517
 

