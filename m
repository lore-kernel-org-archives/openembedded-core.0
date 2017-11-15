Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id D81C778524
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 03:09:37 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id 1so31343566qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MDxRoyRMXia/EWwfvU/hEbd7mhlpKEcasn3ADkES0PU=;
	b=JWWejhVGSPTYn/zftRgHXqdNYoDJkGMDOMc+Y2iP34K++ZVY5mLL5iabx5RSD7I/tI
	Je2K0ANpVudZkfb7WCauru1Wl8RlWqt8AJ6BfSp93C6NIDUk+8ccHHQGW9Oy+KeCijUH
	BROrCVHzxbdVxVH0kYlNYI9htr2IRK3CpUBMEyW4VYoiGA8kYuvISY/93FDeloT86uE4
	BXpMsaHJWu5wHUI9UDDnKwLMUPyY/ipyMoeMfCRhBAp+8/w7OVWYaqkxZoK8Esy+8XtX
	7XLCyUmiDz2m7LiUf2FkjmTnPj1zdEll06du4I6qieURoEMXBTnDfKuncRWoQwumEsAj
	i6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MDxRoyRMXia/EWwfvU/hEbd7mhlpKEcasn3ADkES0PU=;
	b=FdBAKOxWlFWiA+f4q2lm4hNRn617u7X8fTrRz7O5GwwA83ajhTD7g9wVcPpP1OgRK6
	GqhTz5IT8/MzG6ARCm9Ae0enbjfdOsgEXGxBhuN8hZlAuCSECeKuBN5qaGo32zfggQHo
	s2K7IUrI3Pr8SMDedVYcm2KPH6zAhCIYqJOkQfXLssseGqmKVV+W5e0bNYOBwIywupWN
	hxCngennVJOuQU4aUydYtHYKbx4/B6wseMvyNZPIm87gjDfaaDV1nvW/vOOlSCLDdzy7
	m+Ygqop6GmpT5iEnuhINMh+Q5nLB02q0uAMSlSfqo6hqGnGeFXGDm8rwrliusiEPbhmX
	2rUQ==
X-Gm-Message-State: AJaThX6Ywb//FeKF7JBwTkqN/ISedYIvtWFPHtBpN/ZdIpEcyqRtJozA
	4EBzcctRjCRl4PLYBLLZzy6AEA==
X-Google-Smtp-Source: AGs4zMYnpIrpWVT9myPCG19N7dNA9/bisibEOyVjmjIt6ilcf2qoLzsAz/GYPEwHxCPEzedlmAMKfQ==
X-Received: by 10.55.23.154 with SMTP id 26mr23303730qkx.175.1510715378997;
	Tue, 14 Nov 2017 19:09:38 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id
	r21sm7319968qkh.89.2017.11.14.19.09.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 19:09:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 19:09:18 -0800
Message-Id: <a737cd8e89895fe2d0f5f32ec09ff6ffd9a9ebec.1510715185.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1510715185.git.raj.khem@gmail.com>
References: <cover.1510715185.git.raj.khem@gmail.com>
Subject: [PATCH 7/8] musl: Update to latest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Nov 2017 03:09:38 -0000

These commits are added
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=eb03bde2f24582874cb72b56c7811bf51da0c817..105eff9dec51bc4898a74af2854ab71f927a5c3b

Key fix for malloc
https://git.musl-libc.org/cgit/musl/commit/?id=a71b46cfd289aa0ff829fc9a436c59c398f8326d

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 932c9a27a0..9e15842ad7 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "eb03bde2f24582874cb72b56c7811bf51da0c817"
+SRCREV = "105eff9dec51bc4898a74af2854ab71f927a5c3b"
 
 PV = "1.1.18+git${SRCPV}"
 
-- 
2.15.0


