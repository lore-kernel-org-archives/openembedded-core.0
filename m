Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 25D726FF5D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Apr 2016 00:00:19 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id u185so16836762iod.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 17:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TisjdSN0g/zytq+hxWqpnPEBEC3ewr4Kx+it0iuCa+c=;
	b=gfdR/KvHJMWLO6yuVvJClFQzCL6lSC2LsUWMAz+evtqUtLH9vt6j6H0OCu83bnopGl
	3u6KRAo6Bu8ywg0HaUd8TIcYCGmhjZvCVgkgk5f3RhSB6wMag3M0nDHLEh4uqg8XJ1D9
	lzLzjMyGcwnQBHBI7+y8jMe8VUqFp1gm5POepT7+ApLM0SRtGAbIitE6P7sufgd9TZtm
	E6+vBlN1d7DceAJuELqBj8txtA9Z2ynbydjJecGmsx3OsJjD+r567R+JgV17FFwmdpJF
	+LaRembykDdQapoz500TREdeIV/J17eSDBxrjt1j/TWgeNlj+AG2e8gOTnXo6LpYb23R
	WQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TisjdSN0g/zytq+hxWqpnPEBEC3ewr4Kx+it0iuCa+c=;
	b=mvI+cE8olXmfjOO8SJ2JxKoIB4prVSN0cHMz1kVI2sVTb9kWV7M1In05LahMLxZ6XD
	fzgpDvrSquUwmklf+nwuVvNMNxq8WLFhJn503h0n1hL19Z0j70WgJ+yx18vgImEIQGKV
	8i1iMC4HsSK7rtlP1zeoZWePM+FEkvwwlIsaXXaND/sCRAn6fYoMx+ihfqqAI2JL4ajJ
	uxIKaL649T9JYlGIfR71Gsy4Bc4YM4YFomCHbdUjuFlvsMK6yV5RUYY7p6wn++2gzQnE
	UdMu3HPyEy2E2o2TRE5tGkMFzoptcsrY7L+Iy7ozChM8Pqu8LIrKXAX7CgrfdM/ngxWD
	DbrA==
X-Gm-Message-State: AOPr4FVZ9kp+flXUT8KJWyK/G+4R0BIOY6JiX/z6W/QJeKRwbBUJeVBByptW4CkreT/lfA==
X-Received: by 10.107.8.99 with SMTP id 96mr26485028ioi.60.1460764820003;
	Fri, 15 Apr 2016 17:00:20 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	a75sm30569006ioj.36.2016.04.15.17.00.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Apr 2016 17:00:19 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 16:59:58 -0700
Message-Id: <1460764798-12701-8-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460764798-12701-1-git-send-email-armccurdy@gmail.com>
References: <1460764798-12701-1-git-send-email-armccurdy@gmail.com>
Subject: [2.2][PATCH 7/7] harfbuzz: update 1.2.5 -> 1.2.6
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
X-List-Received-Date: Sat, 16 Apr 2016 00:00:19 -0000

Overview of changes leading to 1.2.6
Friday, April 8, 2016
====================================

- Blacklist GDEF table of another set of Times New Roman (Bold) Italic.
- DirectWrite backend improvements.  Note: DirectWrite backend is
  exclusively for our internal testing and should NOT be used in any
  production system whatsoever.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../harfbuzz/{harfbuzz_1.2.5.bb => harfbuzz_1.2.6.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.2.5.bb => harfbuzz_1.2.6.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.6.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.2.5.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.2.6.bb
index 078b3e5..e80b194 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.5.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.6.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "cf1eca3bdcdcfb818c7ebb4644b4cc0d"
-SRC_URI[sha256sum] = "cfca0b6ba42c36a1f7b03fffb926dc4d137be2aa2a2ad8930259072e43a347d5"
+SRC_URI[md5sum] = "9f4b6831c86135faef011e991f59f77f"
+SRC_URI[sha256sum] = "7537bacccb3524df0cd2a4d5bc7e168bcc10e8171e0324f3cd522583868192c1"
 
 inherit autotools pkgconfig lib_package
 
-- 
1.9.1


