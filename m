Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46273.1795625770885598992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KrrJFzFw;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38431138772so7791473eec.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625770; x=1796230570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+cArYfv23RBpYOylk3yapdqky67RNH3BZyL6+6pOE3k=;
        b=KrrJFzFwiAc4EpQ1+eMULHvVpD7nzLzy/+Hf8mldNhvz1b8u7TX8+4PopNBm0mv310
         AhFnWhzf1ZJwjUNbEAkzyYQqx3OFH+EnwKUp3DPIUn+C+qYVjmhzsjqa/66L074HQuwe
         5GIBFV7KolFt7t8xxM54bsP8IpXzYTRsA3nd4mEjC1AkP2K2bPrEP+h8337bWFICrbRH
         9ecnVtsR0iWq2xJVjVlTKl5pji0HYXUuwg0YKsr5dLX9/gLskWLOgQVUllpRH2uRM4z+
         XSQZwVijYAVfOne76wcQ3Fq5JRD2/ghGlcbsGNh/rHtPDZC9PCM8+1gDLa6jhIwvG8CU
         sBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625770; x=1796230570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+cArYfv23RBpYOylk3yapdqky67RNH3BZyL6+6pOE3k=;
        b=UOa7TmeKX6q9wolmsO/lrAFz3LEWgSVDP3aBg2naxZkPGBZRQiF9vFJsI82tc0Y3c5
         MWZXS2Eooi1RjU+iLfy4NmeicaGP2Pu3Vj9HXSDRvMaJ0cgnFvb1duOZsHjihTqV9PF0
         RdhHotwKac3FT0hoitIGrJjNinaHMGbkIu/j3vHcIjSVTimmwm7plXRJbqfIs8YEXcwv
         53t1nf4TOsf17AfyycQZj8NKCkpsWyvgVIpraw2ZaNKCvHne9+KJTNIzJ56YiCtY/bVb
         Z9wgPTexc6359NPYDwIsnxB4GSe0ViArcxPxD72Bv9TMWvbFp9hrMm/IfTpByRewPoEE
         DFXg==
X-Gm-Message-State: APuU4Z/XB4gQ5GYEvLNaEIwnhn+/lTRhHOb2tAnUmpGWQVPp+QfARHmH
	8qiESGzNtBUOFTlG0gxIsHziZOSEKkGcKJE3ylzljqGj/He27NmioRU4OFmRXAmw
X-Gm-Gg: AZFdTZfATZKJARNsttGE4xryBGZjzdJvn2yTEuRN61vvGMoX5gDRmNL24wKsl2a7Y+O
	zj49COa5f7vL27vabyZ1aFvVbY2z29F4/NPK3kUWUlY/oaPPt2OB9Z07FrpxVhm8Ze7CrAoixC0
	CWlJoqun5GBv12calOvT+teRJj2ci3YcGQpp55NBDdUnKYv1Yy0nHh7wcY3x5xU5HO1hIyTcEPd
	04hoUGA1zIfkRjsrZrx84qYR8Izt6AqDI/63du5cEx5gF4m5dkQnZ/1AiTjXsEXBCCsNpEbNLZH
	iMcUeyFNGk2gaV/nSIqZ2BML44W8SRyB0gkMaFFYwMfoF+GfunWTsHDL3xRmPf0A4XRJmO7+Fyr
	+l8m8MI+yiYbZhJgoMPpArkBDqhlGy1mQ9HMm0o3ZRTZkhb8PRbSdcvfX1m+DRbwR8Cyxnhbjae
	M+48EhBQJ9lS7hqnPl7r7X4xH+waJho34HPp9Fhv1BWOfffEw3wtlZbgVB63aGPgJfeyRVcTFSd
	Xl+C+QcKCwW4npv+gVpqFjIHezn2EhgrGRs00ADl0NTFnfvOyP6gixPDbYCynOdsxaqPgJ9RJ3x
	P1WUjJsdZrKzjGWgmN88YE+k7IhWxB9ArvvL+hCaTN0pjAJqUIl6ujpwMMAmf12OidzXZ7uZJis
	pXwMkkUZPkvoXQbHfHM5awx5oU7dVKfucwXFA5PWoVYN5cqzJE73Lvj/00+aGPEvGIzBCuSUTyA
	Gy56pbq6c1YU8oyyfIbIbf+2PRut0S6M1zjp/st1X7B+0q9wC5M4D2iBQ9JZTJY5uD/bfGJQSrP
	Vnvk4Z0sdYtWLQnMfpCSuqvPbMnySnvYRF2wDrt/83ikxP/SYB6TZI6b5OhTQWc/m95Jfb8j1Pz
	FwvY
X-Received: by 2002:a05:693c:8803:20b0:386:9b9c:ef1b with SMTP id 5a478bee46e88-3869b9cf99amr13663431eec.3.1795625769772;
        Wed, 25 Nov 2026 08:56:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm67535391eec.4.2026.11.25.08.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:56:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] gawk: Update printf patch status
Date: Wed, 25 Nov 2026 08:56:06 -0800
Message-ID: <20261125165606.2554824-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251231
Content-Type: text/plain; charset="utf-8"

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-printf-Avoid-undefined-behavior-converting-out-of-ra.patch | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk/0002-printf-Avoid-undefined-behavior-converting-out-of-ra.patch b/meta/recipes-extended/gawk/gawk/0002-printf-Avoid-undefined-behavior-converting-out-of-ra.patch
index 2e7d35e7e8..1a6f4fa369 100644
--- a/meta/recipes-extended/gawk/gawk/0002-printf-Avoid-undefined-behavior-converting-out-of-ra.patch
+++ b/meta/recipes-extended/gawk/gawk/0002-printf-Avoid-undefined-behavior-converting-out-of-ra.patch
@@ -14,8 +14,7 @@ intformat test fail when gawk is built with clang.
 
 Check the range before doing the conversion instead.
 
-Upstream-Status: Pending
-Reported upstream: https://lists.gnu.org/archive/html/bug-gawk/2026-11/msg00028.html
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=58356d4681f7e9dc2f48f7dc099346dc3f03d441]
 
 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
