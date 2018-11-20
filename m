Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 77F706C2FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 11:12:55 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b13so1519448wrx.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 03:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=NJqkxHXQAhc4BqTwnjza+lhvPMgQyqgjsD3AnF4KV90=;
	b=dKrP3iJ/E+wimfBSAZkomS6z5o1bRmoT1wTh1oKzWHuJfbPdweFrJUAZIayuAzOoLI
	yKpJ22Ucad8/HisYeJ3RMdBsZOoEXW89IWTPf/EM4ilCzoal3VR73Utd9e+v5h4THqrY
	NMIaqJ7c1Y13XZRq2YZUTgmA+Z3n86Mc4VQm4MWVbbepoSZ/iJKBLSP0NLqz4+k82bWH
	IQBxT18rcv7CXqqLhjn2hn/S7Yoak8sK7EOpjoRyzkM1zqECwR6MVH7aYWCNM4UsOhqY
	GkcVxD62jeJHOGSi9noXrpvAjHzGthgcnD7jIwCFpGQgLNs0oUzc9kkkXLWpaAoAwcdt
	6Mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=NJqkxHXQAhc4BqTwnjza+lhvPMgQyqgjsD3AnF4KV90=;
	b=snModBa04g8Mj6E3OcrA5+gk1uIWyj7NO8yu4Zn1sM7zt0k5caRa/5NtfP8NeurGg8
	tFWl3hGhTxthl9z+FtcYwz9HxsKDsuwzKSGaWOroWZP6iZBU+MLNKpxclCSRbp9nd3oV
	ja5EqjkLghsllCe8HjbTdEiMASqjmAsueR1HOLEGI2K4rDNe4qgA7h9+PELOlz6A/Q0T
	Hl3gjx+kLyIeY76z7zLX80TfqZnVpdeexgdLjrPNKsGon1nPAIPVXD1JLVVqbundd5KI
	2lxXifp1bis8vs8e4Yy2LhI/G85DQQ0tWrs9gOfhCiFfoytwq60qYWjZEAOFTIknvYHj
	re4g==
X-Gm-Message-State: AA+aEWY4kF5WS8DbZfgiTpoBWswz3jjXtITa9tZcImssfLp34UwPcWFs
	9p8XF9Kr8kRm6Xpj/XWMFxaiWAxJ6tY=
X-Google-Smtp-Source: AFSGD/U6sTBJ9mQbRKHFWxRLvQunyV55vtzGttU7x6u3OEWZVBw0gPc9xIkL1qkvzS8wwyjLjEK9CQ==
X-Received: by 2002:a5d:4dc8:: with SMTP id f8mr1597937wru.45.1542712375855;
	Tue, 20 Nov 2018 03:12:55 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v62-v6sm24325069wme.3.2018.11.20.03.12.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 03:12:55 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 11:12:52 +0000
Message-Id: <20181120111253.25370-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] harfbuzz: upgrade 1.9.0 -> 2.1.3
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
X-List-Received-Date: Tue, 20 Nov 2018 11:12:55 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../harfbuzz/{harfbuzz_1.9.0.bb => harfbuzz_2.1.3.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.9.0.bb => harfbuzz_2.1.3.bb} (90%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.9.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.1.3.bb
similarity index 90%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.9.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.1.3.bb
index 0b276348305..235f8d4a3b7 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.9.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.1.3.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "263a3f1cb014e3ad2e4123c238a9bfc5"
-SRC_URI[sha256sum] = "11eca62bf0ac549b8d6be55f4e130946399939cdfe7a562fdaee711190248b00"
+SRC_URI[md5sum] = "38b0a17fca5ae38ff54fc22939ded371"
+SRC_URI[sha256sum] = "613264460bb6814c3894e3953225c5357402915853a652d40b4230ce5faf0bee"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.11.0


