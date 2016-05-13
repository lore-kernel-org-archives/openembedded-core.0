Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0489E731ED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 16:47:05 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id gh9so8903043pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 09:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=2t0jJyW5F92N+HLNCoPpvvCjb0EL2FlbaZIdUu0DJvk=;
	b=b0sG01HEmmgSuFG28zPTYqWI0PkA+jgnRhgOzwLv8T+AdzbzgllGtP+cQRjWJZ6Z0g
	vU2JlMZs1Tgt/AyMK2RLpxGrxC+L/Qi0By1nR+FgdDFNm+NYCEunWkKRfzdehraxaryb
	zhRXEH5FmY7cXV3yQvJTkXzITofn61XQOif9EcMC8lGvodBvF1ijthwLPiCQwZ9sHrlA
	tcVQtfCtmsFd1jeUxA+4b2ZIdRKDU2h2e1nKHQRMZ7Se11oQqZ/nGE32R3oMgNmI/PsK
	tB+8q2yfMMEOMJYXyoM31mX6LI/71LTVbRE5gNVNelkbfwLBVNZ0CpZIyd2k0a0awRNh
	KSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2t0jJyW5F92N+HLNCoPpvvCjb0EL2FlbaZIdUu0DJvk=;
	b=LimDCZvQJP0AB+BDGUDKwBpkxLbF65TCTBe6CHuM4eLV06GhisbFokMuBct1KQuGVz
	eaZRb+2fmmkhiZcGsxeU7TU8jgKCRd/EJfdlxwDf6mKC/I6FQ/3MuLjGfENQEB2qYQh/
	S2tHoOGHXomdn3n3MEg/B1BtCX+i45fXcv2FZRsDxqIkb3bPUm+gcY4eXgSFsnNrfPQh
	3yKcurvO1fZa9s5zLZhdPidF2s2OjTE+5IQIJCfSvVhiYqrU5DZLE2SY7BdfuPlcxzJa
	b9HCvoiHJzlYEyEP6NeqpRUVZYLIueMIGqwKSESq30pA8uPZ8uXn6UBfEdcDudO+kPJl
	Nmzw==
X-Gm-Message-State: AOPr4FURn5ep+7C6g0mtqGZtrWfybrOCsDNvnVEJ22wDKg00B3fsXURM3+4E8vX7iOSDuQ==
X-Received: by 10.66.141.103 with SMTP id rn7mr24471071pab.70.1463158026943;
	Fri, 13 May 2016 09:47:06 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	uw2sm28725174pac.10.2016.05.13.09.47.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 09:47:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 09:46:54 -0700
Message-Id: <ae545dcb4292a0d9b6ff8fd2f251b040699f490d.1463157783.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
References: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
In-Reply-To: <cover.1463157783.git.raj.khem@gmail.com>
References: <cover.1463157783.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] feature-arm-vfp.inc: fix overzealous ARMPKGSFX_FPU modification
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
X-List-Received-Date: Fri, 13 May 2016 16:47:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <git@andred.net>

Since commit 972b4fc (feature-arm-neon.inc: restore vfpv3-d16 support)
we're replacing _all_ dashes (-) in ARMPKGSFX_FPU, which is causing
problems for all legitimate uses of the dash as TUNE_PKGARCH doesn't
have the right value anymore:

E.g. on raspberrypi2:

ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
    Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Error, the PACKAGE_ARCHS variable (all any noarch armv5hf-vfp armv5thf-vfp
armv5ehf-vfp armv5tehf-vfp armv6hf-vfp armv6thf-vfp armv7ahf-vfp
armv7at2hf-vfp armv7vehf-vfp armv7vet2hf-vfp armv7vehf-neon armv7vet2hf-neon
armv7vehf-neon-vfpv4 armv7vet2hf-neon-vfpv4 cortexa7hf-vfp cortexa7hf-neon
cortexa7hf-neon-vfpv4 cortexa7t2hf-vfp cortexa7t2hf-neon
cortexa7t2hf-neon-vfpv4 raspberrypi3) for DEFAULTTUNE (cortexa7thf-neon-vfpv4)
does not contain TUNE_PKGARCH (cortexa7hf-neonvfpv4).

Fix this by being more explicit about what we're modifying.

Reported-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: André Draszik <git@andred.net>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-vfp.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index bd366a1..9ef31e7 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -6,7 +6,7 @@ TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
 TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', ' vfp', '', d)}"
 
 TUNE_CCARGS  .= "${@ (' -mfpu=%s ' % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
-ARMPKGSFX_FPU = "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1].replace('-', '')) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
+ARMPKGSFX_FPU = "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1].replace('vfpv3-d16', 'vfpv3d16')) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
 TUNE_CCARGS_MFLOAT = "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else '' }"
-- 
2.8.2


