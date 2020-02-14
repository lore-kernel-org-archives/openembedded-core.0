Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 14B9E6113D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 18:58:53 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id j17so4295763pjz.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 10:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TWDA/AYEayC4+SuakaZVFv6PCmTZG9aAkS+0cVxpqRQ=;
	b=S/PxAP35udTX5QOh3UVLItFXZ6gAkrlUMDfiLqLXgt8ovnv0UHHUAkUeFD9visBZyW
	K/DCNnUJfI1tpTWRVai3y2gGq02hVoy+uF6jIQy2DBLhTljio1xyIwmlfmRGHU4lQ5nk
	g5x29aLpm5yTUEPYPww8yLaIJIWsAdnJS3ohjKT7k/M+JVlYkAt+EkqV8qjPmr6Gbv84
	ZWroifJJxpCwF98CF8O1avr5N+s/Iwg+WplMCLtb8H4w0Hl6ATuOpLeBhQ/Rv0inXRgR
	eWhJA+2t33BDDXng0pAuTD8fLjrLSPgsTd0ZjTJdkSrUJ3McTEurc4M/fzxcoX+weuhn
	w+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TWDA/AYEayC4+SuakaZVFv6PCmTZG9aAkS+0cVxpqRQ=;
	b=HS4gv+Vljrm53hgShyuOEEJc7O5V74OWrszCCCvB35jNsickMEMRT/TTm3za2i9I4e
	dekJT2hEl+XuPmy2XOVZeKK9dL9KLfbPiT2b3yFljHclAc4A+70pBuTMELnZmirKopih
	E530OcQqu1YLrTURTYb5JbZdSLLpoZcY/Hx9cnEaT9fnoTVhSsA5oo7p5n8KoZDixKEj
	y5hFWWdcBuWXjkeeeB7YGumUUXRf3UqOLqxQCF+8kXJbIz+wE+VpLfy2EzJ5KtZJWFK6
	ylmQjIgg7vff+ZzVDqENuB2cCdSC4Q20qyN7dVJW4GmpQFz4dQWwXviLrp7kFsafMVLA
	Fl/w==
X-Gm-Message-State: APjAAAXSQdBHknAmoO+rbHrAAIGO33EvDZEjKBnwxvrmp9nVEgtJzJXx
	M8oD/vZSgHitbhxQPvtOLsLVz+gUU90=
X-Google-Smtp-Source: APXvYqycuSuQxzlGV170pwjk2XuqivLjl2Z1iGtRT0aZ8AKupQl+L4sczHEkYeRpUqaU3IuFcLJDAA==
X-Received: by 2002:a17:90a:b10b:: with SMTP id
	z11mr5431569pjq.132.1581706734542; 
	Fri, 14 Feb 2020 10:58:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::709])
	by smtp.gmail.com with ESMTPSA id
	y18sm7993307pfe.19.2020.02.14.10.58.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 10:58:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 10:58:58 -0800
Message-Id: <20200214185858.500028-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] busybox: Fix typo in patch
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
X-List-Received-Date: Fri, 14 Feb 2020 18:58:54 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-Remove-syscall-wrappers-around-clock_gettime-closes-.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch b/meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
index 1217daa108..0c7f9b8132 100644
--- a/meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
+++ b/meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
@@ -63,7 +63,7 @@ Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
 -		 * typically requiring -lrt. We just skip all this mess */
 -		syscall(__NR_clock_gettime, CLOCK_REALTIME, &ts);
 -#elif ENABLE_FEATURE_DATE_NANO && __TIMESIZE == 64
--		/* Let's only suppor the 64 suffix syscalls for 64-bit time_t.
+-		/* Let's only support the 64 suffix syscalls for 64-bit time_t.
 -		 * This simplifies the code for us as we don't need to convert
 -		 * between 64-bit and 32-bit. We also don't have a way to
 -		 * report overflow errors here.
-- 
2.25.0


