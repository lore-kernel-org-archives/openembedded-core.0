Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31021.1795560748791245793
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=OcEV9Qqd;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e47347279so3033626f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560747; x=1796165547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0M4jH7K/Ci1JBjAAsgFKXoHodUPGwrw5ETQyI/d9f6g=;
        b=OcEV9Qqd20qTtXvmHpur3cK957bFdVyKIaDVieLMdCTy4yZQ/tH76nY2f2YBM50Ok3
         3CVLdEcdZScEWd6AdhqcgRiIWjk2NuNyVJmxAN9YO6vfvIERdcsOVetN9l5zZYWQfBDE
         PPwFfghRfnqIeCE6T7J+qDyCQkI4VScrVCPQhy8RzprM3WU4dzeJrVX2kFgX4UAIc8ki
         ji5D1bdBul5nqJ77lZ8ZgGrLvrpqlgQxlJ6pXIMfDG4Wkcl/Z7KaLlpijEVylP+Q+TpG
         mWTEMIAcHZCAanlD5zYrNsjaHhsd+RgK/mc21wPdg1qPzzN0kSMeayjNDxguTh1PV1Er
         rtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560747; x=1796165547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0M4jH7K/Ci1JBjAAsgFKXoHodUPGwrw5ETQyI/d9f6g=;
        b=SSRVs5T6HQ+nbvzURz3RwTDdhRuBtfliygck0yo1nWMx6ogoi4wnLDYcfNFR7PqWez
         IHX+vkUcRL46Vp2Q+xvzNj45OJOJM6dGmYlw9qixyV5KJWYF9KcH8XS8i5I49Qdz73nQ
         pYJVKOlVcM2gnkNh7xfS16HL7nT5CTTlgSFb38Fa1aSrtkoBupEVNJjcosEz28KL8A2Y
         vGyBB0gZJENnfcN6ya/HQYidAkTZ/Cgwk86RzmPDp6P77Nr5vOh1bXa1L3463i2L8UX0
         BTmbNrDUKNpUk+aGoQtjAGoKVZLgDg61JKNZhcgkGK/rpLSC0DnPyEJB4sHL3WPrKDAR
         zp6w==
X-Gm-Message-State: APuU4Z/cLWWJbqJc3aUYuXPBQFPiX/k3c4Y3OgGtotfmKoANQD/Pr94o
	XXRYypjFbH7jvY63I1goKo3s6990ObpSGm1cAWUjW8Qpoyk6HpEZ2L9mNgYEVQ8LGkPWzecJJcY
	nw0iuMtw=
X-Gm-Gg: AZFdTZfDkzVteqEMku4x/74w2KdB501S7INd/0Pgy8dG09Ca0jnNhTLZjz9hdqS6vq0
	J2DvOc9GQVb0aBuaFNzh0JzOlIALg0gGD897Og8VM28UZGQVIC0vXwwB6T2O2iw++DGFkyXiIrY
	oCTz0QA7Z1scPfRdiFpUCrNKDagiwgnu5nacT2V3DjK2dHEV3/AYJxVVtdwgXoyiMIYpK6A1mLk
	05ftTLr6E0sPazJQ3KZiXPgkprwGQiWtb0fHXNyhlWXzAmKO7Y/dCPCraMHzZLM9C1fDE7ao/s+
	Ke2d9xHkHtALmEE9L6dqDjugD872tkoFxsGbw3Kii1FNlvJQS/ubI1DNyYzErAQtpWbzvT1jZ2L
	cJQ96Vr4QuFsM7YW3LrzPSaLdXSE82LqcP7AiD8oHQ6/N8jDUsjeOJl4zMbplwJ0WU3FAcyxi/S
	FbXqe9x6S0b+nKRtQnqbG8qvfy2oHlEAsciH7PoyStgkW8w49kYp+l4e1Nqax4u90ioS9JJWjGD
	I4iLOyK0Ww/9cvvi3HIa/NfyPmuc8wigGFEnslN1Lgr3kpjStMlChC5vz6U0EtHRBenH2rHKsVX
	p9/XGpDAGW3klKZ0l1BPWNZB0xVXtPXgSIcyIVgxFGgCdgvz3BO87w709wN5S/B5CmmAvY95KhN
	QN4hOnqHbLziYWZIbSb1GXfLxVjvi
X-Received: by 2002:a05:6000:4312:b0:4a7:2673:ad2e with SMTP id ffacd0b85a97d-4abacfea57emr32501671f8f.1.1795560747058;
        Tue, 24 Nov 2026 14:52:27 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 13/21] popt: correct CVE-2026-18739.patch metadata
Date: Tue, 24 Nov 2026 23:51:20 +0100
Message-ID: <0b0a22019344292933083161ca1c32a00c5509d6.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560335.git.yoann.congal@smile.fr>
References: <cover.1795560335.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251093
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

There was a typo in CVE tag in this patch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 15c5b3e7ff3e62b1763dfffa127875145b74730b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/popt/popt/CVE-2026-18739.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/popt/popt/CVE-2026-18739.patch b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
index 0a1e8f35907..94366f63437 100644
--- a/meta/recipes-support/popt/popt/CVE-2026-18739.patch
+++ b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
@@ -14,7 +14,7 @@ Co-authored-by: Panu Matilainen <pmatilai@redhat.com>
 
 Fixes: CVE-2026-18739
 
-CVE: CVE-2026-18743
+CVE: CVE-2026-18739
 Upstream-Status: Backport [https://github.com/rpm-software-management/popt/commit/14c42b415ba0c11640f7d4ee80920452d0287058]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
