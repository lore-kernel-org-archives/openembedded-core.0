Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C78B37FA44
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 21:22:13 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t2so6240757wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 13:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kmnLb0+fxN8PR4cm7HLvKCTLXeRX6WLybKO91HsPoBU=;
	b=Cywr3m4omj7tzZDnxZVIj2RfQy4c16qZmvhfFPpUBufuSrupoijVhWCAlPhrDzVG/c
	qlaq/wrTxNwrF+LYwwuxQ6ob6msRogr67cLFb5/HEej6hj4FKbi1HV3E2m0nN48KRYyY
	UerbYFm4W58h+qkhsQTMsAeSbt2gAVqtXUv4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kmnLb0+fxN8PR4cm7HLvKCTLXeRX6WLybKO91HsPoBU=;
	b=tTZmxU3ogMSTxn6sWjJBiUsKGCme4Pxfpvmf2FiVMii0zKfX0p0dI+MoQD/bL/8Y+T
	/FzF/3D/3n7pLFfmHwqiJVqwTGvRRA3B5EIHbDy33dbovBZ+LmRmkRI5jEm5QByiZBKA
	lrIMUIcYAdgPycphgGoJeA+UX7b4V+cfMz01MTqHqEKaJYZ7oKjyWJD+IsPh0NnpX0OU
	NjzQa6Rj7DYRCCqUziso2VEQU8M+YUZZ3ArWJtv/mQX+D2PshLyRCcOZjWu41/ZGP0f+
	+zBI0XmT4FzFV7flBIQ7Q7Yyr8T7zXiobeneZJeL/KTi2uxB55MXwkJPRR9Fp6hmVGrt
	OlEQ==
X-Gm-Message-State: APjAAAVUIMAqQ6umbP37074AsdltLg8qqLqnqTKNnFAEkiL0949c0J+y
	5upcHVi8kyG8GG4lxfnIb0+3yq2pnKQ=
X-Google-Smtp-Source: APXvYqx4+hVf7Z8D2JHYbG0vTdH/NCObGeM3Ikdme0ykgJQXQxlFD/1a1Yr33Q8eJwTp7HWjdvk5mA==
X-Received: by 2002:adf:979a:: with SMTP id s26mr13888711wrb.92.1574371334178; 
	Thu, 21 Nov 2019 13:22:14 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e16sm4939533wrj.80.2019.11.21.13.22.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 13:22:13 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 21:22:07 +0000
Message-Id: <20191121212208.4885-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191121212208.4885-1-richard.purdie@linuxfoundation.org>
References: <20191121212208.4885-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/5] core-image-full-cmdline: Add less
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
X-List-Received-Date: Thu, 21 Nov 2019 21:22:14 -0000
Content-Transfer-Encoding: 8bit

Less was coming from busybox in these images, add the full version.

[YOCTO #13630]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../packagegroups/packagegroup-core-full-cmdline.bb              | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index 2d96d1ba385..15a8e6dedc3 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -81,6 +81,7 @@ RDEPENDS_packagegroup-core-full-cmdline-utils = "\
     gawk \
     gmp \
     grep \
+    less \
     makedevs \
     mc \
     mc-fish \
-- 
2.20.1


