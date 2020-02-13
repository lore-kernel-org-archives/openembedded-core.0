Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 97AF160C11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 06:38:24 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id a6so1950601plm.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 22:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lLIsO6+VajFIKlyCjkC0glybaIczrYa5G5aHljZpAG0=;
	b=W/2VDwbhGzl5cLlRMhJyURhkS1r5GCs/uVanNnsJkqBhQ93X6+NynxVp5lcio85aDe
	Fs/NIFY+Hlzp17IH6IGvyT68IHHe+S8pT4CCYbJYi/DtPLP/s0BycRsBmUwJe3RF/XZ9
	8lPuEPzsCZg40z6pjVOSqGW4fB/GxaQfU14reEFKTfO3Ev2Wz6N7hTg5sV0ItRIJkwR8
	8dS3sTvJ+DEYybTIY9euEgTihO1kDJHH/2DC6xxqDzoR+KCG0YupAMXIzUHeV73r6l3y
	1bROPJkaG3H6n0mU3Gglw8etZC2SvR1xHazQzIzrJW5A6nbDh5ybIWWuaxxGyfqngibv
	UwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lLIsO6+VajFIKlyCjkC0glybaIczrYa5G5aHljZpAG0=;
	b=YmIvhXpf3j5KR6Jlwilg07HYqc2r5q6ynvg5HKRwHBZjlz3dXFQN9CMWE3KjPlJswm
	zai8ir9/GwhHCXobdWZuzZoIpSNvWtAV2ZCTnf1QLa2vb4MnxrtDoiMbbsnyK/ETbUsT
	eS/QVsJWfx6Un5SwRlvY77Ehqzl3r/J3BWUqWBMV0RMoMZKDo90T8XgZUAVeS57Iuqrb
	yDPyfhQW1OLcA9OCgWZMaf77zqfjI5nSsgaVSFIOTnw2lyNp4h1/1sRUuZq3Om08rcO9
	kzBht2/tPmPoRlx7XIs12Tft1KNMzZxNuvpJJvGRaKZNuG0g1MAmfMwSOA165+ZySypP
	vuVw==
X-Gm-Message-State: APjAAAU/Hl9LoD2ytu7sO3KJ3KLOOECrwXSlCYVSKE8ppz8cq/7JrQIz
	7bvaXFnTvNQrP65FQNpPXkFgeHyJemw=
X-Google-Smtp-Source: APXvYqwI81C1cgFaoBb/m/wOngJGUQF3aUNQbw6Ei5UO1wyLpkYUALZzONh81o0dvQIDPs0HqlBR4w==
X-Received: by 2002:a17:90a:154b:: with SMTP id
	y11mr3400187pja.78.1581575905016; 
	Wed, 12 Feb 2020 22:38:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	k63sm1170302pjb.10.2020.02.12.22.38.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Feb 2020 22:38:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2020 22:38:19 -0800
Message-Id: <8002e94e6b5f865feb0a17a2454d53b7f748e965.1581575578.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1581575578.git.raj.khem@gmail.com>
References: <cover.1581575578.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] musl: Update to latest tip
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
X-List-Received-Date: Thu, 13 Feb 2020 06:38:25 -0000
Content-Transfer-Encoding: 8bit

Detailed changelog is here [1]

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=e6093b5a870a38ebfb3e54382acd48c698bde15d..a662220df547e5c2446518e74440a7d834f9ebe6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index f4853b4f2e..b6ec6fe9af 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "e6093b5a870a38ebfb3e54382acd48c698bde15d"
+SRCREV = "a662220df547e5c2446518e74440a7d834f9ebe6"
 
 BASEVER = "1.1.24"
 
-- 
2.25.0


