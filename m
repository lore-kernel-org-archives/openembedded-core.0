Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE047D265
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 10:15:30 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id y23so6465376lje.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 03:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kiAVVRIzWAm9si5a1MXXkHTuitgrHY9mEBcMvm6H4jA=;
	b=P3OYp9peS9MoisvduUfFGvJJIos5Z89ZV7QqQDwDMg/KSYK4nZ+1p1vtWKEvoRqmQI
	uxLn59qyqevVaB1Yfws4mgXSWRj9Mwn/r9kITuvGPhOqvZhQFxRO4Lr21JBEH96lGIYG
	D9bybVwpyCmlhPEy5HYiM7TOPfJOJA0PAnGRa8PYcgpvtOlbhZItB/uySKfagsQyRd+r
	XyKp6RGr841votUUeVnA7H31o2M7IM7ONGHE7YyP4XK/MmKt0qwVFJmuR0fGidElF7VI
	K2mUfXNFrqi9Haj3WpX1K94usFWa8cv5Oz6eLErHsM91EZ6GW5SOdl2uwXkO/XmsSmHb
	yJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kiAVVRIzWAm9si5a1MXXkHTuitgrHY9mEBcMvm6H4jA=;
	b=abNrmAs9h2OUfVeESpdBLTjMs4+sDLjcw9fGFZ2Wot4QbKIGJY5osvcgTg6z/KKhYo
	nF1BBvp/gXUlCQ9UpIFbOmFCpItC3mPKhJq/VxMgfGk39+G1ns9UNExgCaMqYHuhlJ+P
	fuVS5tq1Ys4Eo6ec5Pec4P1EbDRoEWr65YNo1gSXPFi3Za1h3CUuQP9YeBdV8NavE9VF
	n8onedwMiMfJew8fdrJwXx35ahnw4V8VRWwS0IN+J8Rfi06KJyaIkGvbW4mXflocO05j
	agrVyRgAsJ5QUWIhOdUX4aQSxxvFcy2zloFWKTM//9a1EFpSsJV06rTS/eRoOAc1+s+V
	FOkg==
X-Gm-Message-State: APjAAAVjInY21M0ljbCGyd7y9EQqUpRuJIpm3p1N1QHGm6x2uMdAnreX
	FX8M3KJvccm4nPy1m9y0dMuGm3g2
X-Google-Smtp-Source: APXvYqwHVe5MHdfFwWcjIGyKQ8+5An4qAzEsvY5gkwVwUpxCGdl4gdRTIBBzsjJFrebkDVMM47hK1g==
X-Received: by 2002:a2e:a0c5:: with SMTP id f5mr2220717ljm.114.1569752130856; 
	Sun, 29 Sep 2019 03:15:30 -0700 (PDT)
Received: from localhost.localdomain ([94.25.228.202])
	by smtp.gmail.com with ESMTPSA id
	d28sm2012918lfq.88.2019.09.29.03.15.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 03:15:29 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 13:15:24 +0300
Message-Id: <20190929101526.2061-3-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190929101526.2061-1-dbaryshkov@gmail.com>
References: <20190929101526.2061-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH 3/5] image-uefi.conf: define EFI_ARCH variable
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
X-List-Received-Date: Sun, 29 Sep 2019 10:15:30 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Define EFI_ARCH to suffix used by UEFI on the platform to name files.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/conf/image-uefi.conf | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/conf/image-uefi.conf b/meta/conf/image-uefi.conf
index aaeff12ccb80..669c16d42af4 100644
--- a/meta/conf/image-uefi.conf
+++ b/meta/conf/image-uefi.conf
@@ -9,8 +9,10 @@ EFI_PREFIX ?= "/boot"
 EFI_FILES_PATH = "${EFI_PREFIX}${EFIDIR}"
 
 # Determine name of bootloader image
-EFI_BOOT_IMAGE ?= "bootINVALID.efi"
-EFI_BOOT_IMAGE_x86-64 = "bootx64.efi"
-EFI_BOOT_IMAGE_x86 = "bootia32.efi"
-EFI_BOOT_IMAGE_aarch64 = "bootaa64.efi"
-EFI_BOOT_IMAGE_arm = "bootarm.efi"
+EFI_ARCH ?= "INVALID"
+EFI_ARCH_x86-64 = "x64"
+EFI_ARCH_x86 = "ia32"
+EFI_ARCH_aarch64 = "aa64"
+EFI_ARCH_arm = "arm"
+
+EFI_BOOT_IMAGE ?= "boot${EFI_ARCH}.efi"
-- 
2.23.0


