Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8FC067842D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 02:09:25 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id p1so5929469pfh.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 18:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jOXhHUoFN6CuYURhUjI/I8BIHq7NWlQ3jGwQ0LO26B0=;
	b=OmZNMzHn5EtWIT3goao79O+CV7QtZjJZHZQWEt7FhrOkz6i0akyJ3qShf+EPYTtFZA
	VCUBv2pLtliNcK+UZwJsaC3PDWZy4Q+Lwerki82nELI1vVhRTrTkreMw/fbPtBbfV/KW
	1A+ZBQkLzDdOpCEcKLHsvW283vPRwKoVh1cZ/bpM1Fby2EW3wcSI1yk/Tuud5RUU/9jy
	PE9A0Pgsb6RabTZxY1tXCtu8Hx5NfSp63jcC1qoTVse43GXxChKx+kqkTyugo6IstAJH
	QaKWpmSIkoMyXp3FTeQ3JL0BDQKB7t2LSJEDit1lhzMySB2PKNDEHn3PIiCQ8wWcG17/
	imWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jOXhHUoFN6CuYURhUjI/I8BIHq7NWlQ3jGwQ0LO26B0=;
	b=lPZOIyCJkw5dQx8Fk5fpnpEn2723117C234rvYa4CMLdbvbm6rEK67O/oVlgCbmIfN
	JjhTrVDUdL3EmrT4qjtfji5vcvdsbv/zH2TlBKtkbby9EMykMOJqzlZr+uzGAJO8nMuX
	wmVSuij8Nkv3bhifbrrilNAw0RdcFBhtEuzspnGALibG/gFfN5C7g25IH74krhYfskYh
	8dXbyA+yENKr7oQ3Q1QFITDEkwFWdiqIgZ+UCzhValr2i/O0Ir/YMzdTAR3JfBhPhJE9
	1BIn/qJ5UKhh9iZJYo5NQBdr2KPmHZbEKKcPfAnyh5QsdW9lpizpFqQHhG6ZGhasHLGC
	Xq2Q==
X-Gm-Message-State: AKwxytfmS5RtTEGjwek13kaXDbNPR3bp83xo+SbUweDkYUWT8wc4dEwS
	NOIxuppalseApaaP09WubrPcag==
X-Google-Smtp-Source: AH8x227tGSjNU99CnvPgfxHpZpMEoHyPVxFwgbWevfUJpYY5p/wmNTAQjhWLIqD5pG+8vYs5ScrNaQ==
X-Received: by 2002:a17:902:8f8a:: with SMTP id
	z10-v6mr2558516plo.395.1516586966277; 
	Sun, 21 Jan 2018 18:09:26 -0800 (PST)
Received: from ip-172-31-0-24.ap-northeast-2.compute.internal
	(ec2-52-78-194-108.ap-northeast-2.compute.amazonaws.com.
	[52.78.194.108]) by smtp.gmail.com with ESMTPSA id
	13sm35201098pfs.112.2018.01.21.18.09.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 18:09:25 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jan 2018 02:09:19 +0000
Message-Id: <1516586959-83636-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] iw: 4.9 -> 4.14
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
X-List-Received-Date: Mon, 22 Jan 2018 02:09:25 -0000

Upgrade iw from 4.9 to 4.14

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta/recipes-connectivity/iw/{iw_4.9.bb => iw_4.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iw/{iw_4.9.bb => iw_4.14.bb} (86%)

diff --git a/meta/recipes-connectivity/iw/iw_4.9.bb b/meta/recipes-connectivity/iw/iw_4.14.bb
similarity index 86%
rename from meta/recipes-connectivity/iw/iw_4.9.bb
rename to meta/recipes-connectivity/iw/iw_4.14.bb
index 6daeb07..e1b17de 100644
--- a/meta/recipes-connectivity/iw/iw_4.9.bb
+++ b/meta/recipes-connectivity/iw/iw_4.14.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://separate-objdir.patch \
 "
 
-SRC_URI[md5sum] = "06e96ab7a5c652f8eaed6f71533a9e0f"
-SRC_URI[sha256sum] = "12f921f3dbe0f33c309f5f2891cccf5325c94bd48dceeb102de183f5f048a9e2"
+SRC_URI[md5sum] = "2067516ca9940fdb8c091ee3250da374"
+SRC_URI[sha256sum] = "a0c3aad6ff52234d03a2522ba2eba570e36abb3e60dc29bf0b1ce88dd725d6d4"
 
 inherit pkgconfig
 
-- 
1.9.1


