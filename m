Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 73A897C538
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 00:38:40 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id a3so713696pff.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2019 16:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6WwkSPJyLfHqzaATIlJV9Q8PWGblq5yoAJD6fLpOP24=;
	b=l5K5o2e4UkYExrC9FyLv2itnZzkUSlXTRNFRLnFkYU4QiNwdtWwehcG/zXdB+uArDa
	VZFs02QAfPqgPSeuJbf4o4GXgm6koccVAFiDjd+e2+CWDU20wTi1OqFFyrIZq52hZNZa
	+hwbTmLrcx78o2MMkz0SG0iVOSaKbJbrraZoIToUTv6povzJZSCf43zLlYbZC4QKAAI+
	hxdLUn5FqmTbU4XrDLVGkr5+mEZTgf/YZo9F4OV7pS9MyOsX5KGxzOjKaOp+hIJvwrMM
	7so3PiL2kd4U8jqZpRewCinu1Cl1tzgiigjTInokOCJK1ih2gk5KjV95QwZsp+16CYTq
	t/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6WwkSPJyLfHqzaATIlJV9Q8PWGblq5yoAJD6fLpOP24=;
	b=ECSBTo6m9kPr6U7FLYz3KU52UYjyC60UuzZzC1w9N7vCx41bP9CYysrdOiNCqt2Xzw
	+n2tApuAYn5pCetI4ljSxZGFmEOtR1B8VChvxDJkNC3dEGUL5vFYnVoNqAl+c0rjQr2Z
	x2kHrP6OtpUjQZ7sAOIR31zX7xD6qDGnFIWL3N4Ie3bIrHXIH2tK3yqNv8xeNvQVfSfE
	3imwoudG98yEPQUvgLqEJ2LezLKZW8vHe2GNqYRwRR9qj89jFdke49H1snx+jOBD6oos
	giMEzQFgVGu933tw6UJ65UebcSk8FEhigKReMBm9pEMZmEGPJF/6hotc9xIowJ+40Xge
	YdQQ==
X-Gm-Message-State: AHQUAuYwRjY2z2+kKM4IR1a99XUSz3dYeVu5+6mJ7cVEY+3TkJXOgsRG
	rLM0gVv2VQA08YVkUhK0j1+hv+eO
X-Google-Smtp-Source: APXvYqxgUj9m/1y69kH2qkUOeymKoaPDtTz+vkIEQX38Hu+nuKKE8FCklgmI6lOsGbGowmjceIynvg==
X-Received: by 2002:a62:5543:: with SMTP id j64mr12967600pfb.105.1551573520870;
	Sat, 02 Mar 2019 16:38:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5fa3])
	by smtp.gmail.com with ESMTPSA id
	f65sm2889328pff.21.2019.03.02.16.38.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Mar 2019 16:38:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Mar 2019 16:38:33 -0800
Message-Id: <20190303003834.44637-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/2] grub: Enhance Waddress-of-packed-member patch to cover x86_64 testcase
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
X-List-Received-Date: Sun, 03 Mar 2019 00:38:40 -0000
Content-Transfer-Encoding: 8bit

This was not compiled last time when testing aarch64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/disable-address-of-packed-member.patch    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-bsp/grub/files/disable-address-of-packed-member.patch b/meta/recipes-bsp/grub/files/disable-address-of-packed-member.patch
index 4af6a599d5..415f52ebe3 100644
--- a/meta/recipes-bsp/grub/files/disable-address-of-packed-member.patch
+++ b/meta/recipes-bsp/grub/files/disable-address-of-packed-member.patch
@@ -247,3 +247,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  static grub_dl_t my_mod;
  
+--- a/grub-core/commands/usbtest.c
++++ b/grub-core/commands/usbtest.c
+@@ -63,6 +63,10 @@ static const char *usb_devspeed[] =
+     "High"
+   };
+ 
++#if __GNUC__ >= 9
++#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
++#endif
++
+ static grub_usb_err_t
+ grub_usb_get_string (grub_usb_device_t dev, grub_uint8_t index, int langid,
+ 		     char **string)
-- 
2.21.0


