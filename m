Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5DA4374ECF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 05:04:52 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id f1-v6so9879973plt.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 22:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vNbSSoOGqWOD61ZUYevGYhfgSRAC6TBImMq/K/9kYMA=;
	b=pdl0OiRahrl8GrA7OMSKOhzQ1MULCqmW2UIhpuKZa/vMIcQOIsxlSXFKeypoyQl3tt
	pgnyPthdAgkkN1PLbDlobeVEGGIM+wH6lUQ9ilSE5HvYwhKUyOIySt+wGx+77ZBiVIxd
	BojifMWxZbkHaW+Q+oXmCuerf1Pw36Q5VnqGVPh/KGfYFEGW5SdHPaw5nMOqNP426Or2
	gwz5ZycsI6OqqkHE1UbyIIHVW6yBz6WNdnz7u5YpURTU5cqWDSPRAv5HPJ+QiTR8lUq5
	is7BYNdg/fd0E+bGvHoz/ZEY3p6qKG4hWqmc++WSgcADw43zWApcuKMSDhbxSH6Yv+LT
	Qi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vNbSSoOGqWOD61ZUYevGYhfgSRAC6TBImMq/K/9kYMA=;
	b=fSry5LjduEMUXx/PUcnD4IdR4ZYPOdSwkjv3MihJK/dpo+fME2uxHe32u3qr86AgQO
	BoJfoEoI23e28k5hih5LEpMyjqwdHKi6+DoOOVIc6nbi3uI3Sd2CTMgeVu+mbrNqIplp
	s2FgURf6a7fspfN6kuYw4pBv+6wTKYk+eRXXE2OmVpPQ6R3SontWGZrqNiSwXNo348jT
	rwF4+PsMhzTOvyJss4+TDTB3Q1aaKZQ7oJ5T1181EsnIIeCsKrIUqBZZtjZ/E7tmNZmE
	YwhhtcJX3IIA+2wp3ynQN5ZlsPYO+cG3rf7/ExlGwcWL6gHAoEy9uAJNBl15Czk1Wot7
	7e8g==
X-Gm-Message-State: ALKqPwfZ4Q40j+3rPii0nKW68Rpi0gZjC3XbRSDRg4OVPUfpFtbhrllR
	AicOujU505w0NTBe95qX92ofDg==
X-Google-Smtp-Source: ADUXVKK2ernQISGmS/bRAQOdU0fOoaBgZUzS6/w2jH+H92u6KILJYbL+bpICiUrRHUkkJq1AyIlEvA==
X-Received: by 2002:a17:902:9a95:: with SMTP id
	w21-v6mr1325296plp.168.1527656693853; 
	Tue, 29 May 2018 22:04:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	l71-v6sm24952157pge.8.2018.05.29.22.04.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 22:04:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2018 22:04:48 -0700
Message-Id: <8caf9a4387f6e45894e8dab673efb8cb997580c2.1527656441.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1527656441.git.raj.khem@gmail.com>
References: <cover.1527656441.git.raj.khem@gmail.com>
Subject: [PATCH 2/6] qemuppc/ppc7400: Drop disabling spe
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
X-List-Received-Date: Wed, 30 May 2018 05:04:53 -0000

gcc8 has separated spe backend from usual rs6000 backend for ppc
which means when we can non longer mix spe and non-spe configs for
gcc machines as we use to be able to do until gcc7.

If we need to enable spe we will need *-*-*spe* in tuple which we
already get for spe enabled tunes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/machine/include/tune-ppc7400.inc | 2 +-
 meta/conf/machine/qemuppc.conf             | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/tune-ppc7400.inc b/meta/conf/machine/include/tune-ppc7400.inc
index 425e8bd215..8bfda56c25 100644
--- a/meta/conf/machine/include/tune-ppc7400.inc
+++ b/meta/conf/machine/include/tune-ppc7400.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppc7400"
 require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppc7400] = "Enable ppc7400 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppc7400', ' -mcpu=7400 -mno-spe', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppc7400', ' -mcpu=7400', '', d)}"
 
 AVAILTUNES += "ppc7400"
 TUNE_FEATURES_tune-ppc7400 = "m32 fpu-hard ppc7400 altivec"
diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index 537b2f6774..f1e551584a 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -5,8 +5,6 @@
 require conf/machine/include/qemu.inc
 require conf/machine/include/tune-ppc7400.inc
 
-TARGET_CC_KERNEL_ARCH = "-mno-spe"
-
 KERNEL_IMAGETYPE = "vmlinux"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
-- 
2.17.0


