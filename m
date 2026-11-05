Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30074.1793868240518518983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=gSM3uWV3;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso366266f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868239; x=1794473039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+RO6PBNyDOmPg9Wu2Dw7kxrbdQ5JOITp7fmXoRhqiE0=;
        b=gSM3uWV3KmW2/dI6jPzBZlGu8YjID2bmptt+yWd13hRGn4WPT/ZpSmv/MDQuaMP9v4
         jkQ6Tw6+1d4FRdU5HDbgiURMuAvyakUeDH+zKcei0IRRg9ncCWq/lDL2xeqGkQ06XSs8
         wrfgkVC6Bmn2NrMI44we6XOw9pES3l7G1BIBh4icXhSqvcRy+QhAkGm6qlvOWI8cK5FE
         9PzzdUeBy5CPoYaHohGYYP5xXahs2nqSknjr+htcRjFrvJexyAcK2lynl8luCkiA1qn1
         f1LpkIxQZ8xoixez/DzKsIZxtAq/7dlHvr43XAOnBrNVYa/sRoOSVpXYflcalEL5UkKf
         GdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868239; x=1794473039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+RO6PBNyDOmPg9Wu2Dw7kxrbdQ5JOITp7fmXoRhqiE0=;
        b=ZAi2aoT4CY914UMY6Vrct0cu/pGTgVEiHcpuHbry+z8ZoBrjci1SAL+kPGZMoH08UD
         15kbAQVuXQsceldzgkXeC+HNgImG+nQ/Zyt0N3DglgnC6Y92CngOJ7n9NVI0Aw3Vtcgf
         VVyW4fdFcYZCpyv1FIAAtZvw70q8/6Ac8mCO9VjflUD1zmkOuvdUka/aGhJodKeFXvvw
         vSmzlzgERZ3uuw+JvXLSNxFTzGqeS5Fn439Q+b3wB5ytLoAJnJcqoWdKyMjguMXj559o
         IytKDDARCMIU9opKYyQAFrWJYDAj8aCtNeJ6QckAfYRsBZX26V7E82rAMwEy8WQGCEay
         Ue3Q==
X-Gm-Message-State: APuU4Z+NxbvUSUbagqqY0P7Frl0MQcSm+tCEPmNgtmQ7bh+hikNyClGH
	nQlSP1IjHPaRz6Toa+9ksowOjBYM1DoShxLkrVWkmS4CkAg70WjUds4OBKxLMmWqmt6wPKR5t8n
	5T1JMNVs=
X-Gm-Gg: AYBFou0974UmrRy2cGndt7ESDVuI3ocmK3bZ/BAkvpdohowELhU4hchilCrpmt4HQRo
	5GxMGrYUcN4aCJwjJ1CC7ZlRwtWKCOGG1mZV3Qm11oCzMOpiXbDrjEVNG1z9Zzepza9fToYwaSQ
	vOF2DUyevYimDjgW1o8//a7ruFiC4SbZPvK3tfWYQxYQLzZXqYOYH2yVeT4WcUOCPZdhbh3ke+G
	43ZkGqmO1/f6EeBduVmF88JF1ZzA8td/YDHzZmz9WKcGTCPAuHzt3F/R8HdEPDLJD+vAPCqZdN4
	jLLTZyolRGDL4j4/ZycGTNqlG92N4q/ZCqYqE0mUz6yjS1AkjB2RT4OeyPiBF9h9jmwl1bZNrAt
	a2zI48A62zgu3B3STy5WnAWdtSHrMGVDyFXXfB1GaWo/vYC8txXBgDeUxPzfyJs4YhR0UrkpZtV
	5BtPFR+N6EUbK2Z/aq8RCFbfdfqV55Ye4bKoRlJFFl29UTTP8qkwJWnaYipCC1dfeYcXDT+JDqT
	fx3JcCsBOLdlZ+bJNTWMn5mIsgI0kPxUa0ECIbK35Ad9LtMDfv4HbVz49q/T1OcFcb8O8aIcT10
	PmGvDGVLoVoJP0hOu6snny6uvRYXMlhQE6KnaWushR61hW1cjQZYzB1yNpnKa2Og8lR9NTRoKE3
	pJcXGnTVGgyx3mlfCLy378UJKLbUK7ptywOS6WBa0awWMr+oT2w==
X-Received: by 2002:a5d:5f87:0:b0:490:1358:2265 with SMTP id ffacd0b85a97d-490135823d3mr7834566f8f.34.1793868238755;
        Thu, 05 Nov 2026 00:43:58 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:58 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 37/60] python3-sphinxcontrib-applehelp: Add missing runtime dependencies
Date: Thu,  5 Nov 2026 09:42:56 +0100
Message-ID: <c15c227adc7c34ead491a1791bab54d640c94400.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249496
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <raj.khem@gmail.com>

The applehelp builder imports plistlib and shlex, and sphinx loads it
by default, so any sphinx app fails to initialize on target:

  ModuleNotFoundError: No module named 'plistlib'

Seen in python3-breathe ptests.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1762c51d2411b1640a0d469a75e53ffd20c0caf2)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3-sphinxcontrib-applehelp_2.0.0.bb          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb
index 686a4a17ae2..66b835fee59 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb
@@ -9,4 +9,9 @@ PYPI_PACKAGE = "sphinxcontrib_applehelp"
 
 inherit pypi python_flit_core
 
+RDEPENDS:${PN} += "\
+    python3-plistlib \
+    python3-shell \
+"
+
 BBCLASSEXTEND = "native nativesdk"
