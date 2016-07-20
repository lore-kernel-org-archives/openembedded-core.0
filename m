Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id ED772606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 19:38:19 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id x72so22002899pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 12:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=I/+9M139epZH0h/m7dxyXnkHV2Ac5uBpixJArgg3OXw=;
	b=DYnxcy4KZsN9Jz+6sRajQoAsZGbS3iJBbEH/2D6GdUMuNm/sFLK9ctnRxt7Iag/SkC
	aZicd9kfHbne44gOgvwtwADUZTKZbZHgJKID7SyK3PLOUCYqb4how4FUVxbbK1kdwkTQ
	UFLU8Oc+LO3xVQl16qrz9U5lTr4balb8IyiR6eug0y6pnrOtyiweQhougKlm64zziUJl
	NKctIdkt/kWIqp9sO907vZk1TjiDazN27K+Wbf41C1oJ9r0sUFxNP33ks9mYAcRO9Ivh
	rZ0aC5BPDBUDrHHQ2tj752v8ZKp896U85rHu0eLxqIdsw2SQ3J1N/fzzAvpd/rKAB1ft
	Iznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=I/+9M139epZH0h/m7dxyXnkHV2Ac5uBpixJArgg3OXw=;
	b=WDCyotITNOUf0W21LO9Anzl2N3izTCEQj+diuQChFPIO1OKtbthJUKuDBEeT6bkVVR
	wb65SxSBggRtBQW9CR4SfH8OYebNEYHZnS8m+1pNw3Ms/M7UMR0uHE7Cy8hTVdkfakqc
	HDR5TQWZGrPXUhKBkIfB/oeFVklMRqwkXqS8h5i/wR/LSIcuK2AIj1Y29ufOl31MQtCB
	3OqYjskF9NA/NrgU9kJq7UPbD7fX2z53YtK2DFCgyhHJdPD9ICtUzu3uP4g+KK/2wuvR
	67GsU4oLtfhHvfT3PoCij6SXzgvHy1lNok2l6gG0V8W+64wNdvVoSQoPh3svv1gxVyeR
	Fbrg==
X-Gm-Message-State: ALyK8tKdTgtL5BI9bDLjr0CPfDWtSMpCTP2V+W9Xk+uXf18q3LzN9LYC7glaVOUMeVGDZw==
X-Received: by 10.98.95.5 with SMTP id t5mr67432919pfb.103.1469043500429;
	Wed, 20 Jul 2016 12:38:20 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	k78sm6462995pfa.78.2016.07.20.12.38.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jul 2016 12:38:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2016 12:38:09 -0700
Message-Id: <cover.1469043317.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH 0/3] Misc fixes
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
X-List-Received-Date: Wed, 20 Jul 2016 19:38:20 -0000

General fixes for gcc and webkitgtk found on musl/clang
Update glibc to latest on master

Khem Raj (3):
  glibc: Update to 2.24 after hard-freeze
  webkitgtk: Do not use gold with clang
  gcc: Fix libgcc unresolved symbols with PIE on musl

 .../glibc/cross-localedef-native_2.24.bb           |  2 +-
 meta/recipes-core/glibc/glibc/elf-meta.patch       | 32 --------
 meta/recipes-core/glibc/glibc_2.24.bb              |  3 +-
 meta/recipes-devtools/gcc/gcc-6.1.inc              |  1 +
 ...e-alias-for-__cpu_indicator_init-instead-.patch | 85 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.12.3.bb       |  2 +
 6 files changed, 90 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/elf-meta.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch

-- 
2.9.0


