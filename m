Return-Path: <yamane07ynct@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id CCE087FE69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 09:58:04 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 6so1011430pgk.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 01:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uU79ZyFgnfTE16fskDvluN7JzmuiCYIRBaSm87lzxPA=;
	b=Ohd7r+HOlI5PRbDdDTBGWILSsbrQNaiCaH3+WdQgomLam8VjehEqCqATNOFfKv64ri
	tVTLyOWhqW4VzGuueNTnguHn6OHBb2FQMfjinz8ZpAqcmkPC5ekGCVS+3OR2hk2SlIy/
	Ad+QuNxjX8nz7lQLU56CJS8m1qIYYcViZLgtyzTF4RVJnxFqtCNrgvRdYPUdodj9dyKV
	CMJMNsi67+W/zOqd+qrhx7fl3pMmHLqcjnAWkrJ7idFSq92FIfXWt92wfy/F+JpFiCXt
	aD7jmg+KULmjBuUYtmEGql19xz7ZSMZTAf3cZ+2ECaDg6LIOQleSiFDPpYDanjuaoo9Q
	jg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uU79ZyFgnfTE16fskDvluN7JzmuiCYIRBaSm87lzxPA=;
	b=MRkoDdQzpfcAtVpV1Q2pdw3hjjhIFS1igYz2BbZsRUnshZldvLHMfxvmLI3HBdqtY6
	r0rwDXkih2onhFxYwGpdedtTFzUMjAd2x1MQJmp9JMFlAAbFNEmqMoP81ETsrbsxmuSf
	RieI92c2YRsxSC09HpywgdqCHzkiS6MjqpHrii/xiA5kkHWZoaPTFVVrJm3FrSCMrgqa
	JOls3Qm1WSGtbklWgOqmr9ZHAVtPHWzddN7XK5u4Gf7UAZvLRAAsFeutKjmvTtVniRBK
	Vper51Tm3HgMokmAjJBmXtSvth43+CCM/ozCGGsqXgBEhr44Rv3Bx8IpHtcEAEZrEy95
	ECAg==
X-Gm-Message-State: APjAAAUJqkM6ojxkYzDr3U3Soilvr5mltqc+xlDuimlaxeTUKYD0K/nH
	PhoHLnVHsAobiFFfbKEltbb9KoHR
X-Google-Smtp-Source: APXvYqwjTf7gzw1Wh567B7DV0uwg6bpHgfm8nUBQYOoAJ3KA/GVYHq7PGMIdDl+2da1ZD3TnokD7CA==
X-Received: by 2002:a62:1857:: with SMTP id 84mr2031232pfy.257.1576663085790; 
	Wed, 18 Dec 2019 01:58:05 -0800 (PST)
Received: from localhost.localdomain (softbank060117076056.bbtec.net.
	[60.117.76.56]) by smtp.gmail.com with ESMTPSA id
	j38sm2411501pgj.27.2019.12.18.01.58.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Dec 2019 01:58:05 -0800 (PST)
From: Daisuke Yamane <yamane07ynct@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 09:57:50 +0000
Message-Id: <1576663070-30914-3-git-send-email-yamane07ynct@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576663070-30914-1-git-send-email-yamane07ynct@gmail.com>
References: <1576663070-30914-1-git-send-email-yamane07ynct@gmail.com>
Subject: [PATCH v3 3/3] u-boot: Move B from u-boot.inc to u-boot-common.inc
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
X-List-Received-Date: Wed, 18 Dec 2019 09:58:04 -0000

Use the same value of B between u-boot, u-boot-fw-utils and u-boot-tools.
This patch also enable the out-of-tree builds of u-boot-fw-utils and
u-boot-tools actually.

Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 1 +
 meta/recipes-bsp/u-boot/u-boot.inc        | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index a0f9c41..48402e4 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -21,3 +21,4 @@ SRC_URI = "git://git.denx.de/u-boot.git \
           "
 
 S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 55d8b47..ec77762 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -1,8 +1,6 @@
 SUMMARY = "Universal Boot Loader for embedded devices"
 PROVIDES = "virtual/bootloader"
 
-B = "${WORKDIR}/build"
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS += "kern-tools-native"
-- 
2.7.4


