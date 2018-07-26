Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id EAE5678C32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 15:26:28 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id d189-v6so3640397oib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 08:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ty3Fc4EXrYkvwpu8XBmCg255UHswy82C2mvhWQV/N2I=;
	b=WpuaeAKFepVWrULNQVF3zZNhjNw7URU59GBuM7w5smUP82wvrjZQjd6tbiS8LoebDK
	QQDRn+1rsZULuAi1KlPdcAX70vsor3jZCUuhJz687206LfQT+wa77dHklN0Oadqlfqmd
	v+sdcQN1W7n2PVCmYM2z4p3sy1Tj5C2PbvlOrYuyIDvU6c9UwMYrz+0BMbReh+coFA02
	36dOfPCRcKCSBLmaxY6yKl7sgdgCDO8ekb4rqdCYDiuEmn8jgrtKKitA+o2we2Qa6sl/
	dzDpZzFK+NX5U6bSbO4imdkGKnXLS5CzvTboUEfiTE0np5bVt/RvKqdgtG86JwTQleMZ
	wFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=ty3Fc4EXrYkvwpu8XBmCg255UHswy82C2mvhWQV/N2I=;
	b=VnQzwNLfn0RYSOp11zikYI5ABRHBtIu1j9BN/tIH2ScKP1XlWKXdwrzfK96GkFtBbk
	5s/3Ig1KD400Gnhq7huuVFAREYiotDaGM7dyYXLZrn/KY+UBpD2MEVY19uiDH7dAiEnQ
	jIDiLENXT8e/Shmh5RUXpiPAAXAjl79CqzBxitAO148M9P+wuj8sRguDT+Bi0Ac1wmre
	CLysYq6jEqWFwgVKa6or1104W+pWeBbm23f6qHhMrZ8f1z4q7DWY6EshSvJbHzbhcSRD
	dY7a0fP7W4VK1owCuf6MfXJSA649AENIhTZN8Gd9zC4cZgiCdrSlbg7MSpgr0Wnj1z4E
	h8BQ==
X-Gm-Message-State: AOUpUlEvy7kAGKnoJxgaM1X6Phbhh+oncPePlQI10NrR3UEVMBLgtsWo
	9rjvUnRZtb+qMQ8sFNN3C7/T8p4j
X-Google-Smtp-Source: AAOMgpd7njT3zZnaEMhbi4LntOBVSbn124B2Tc6Qp871Tp8jEz7xFeJGQWXRMVhKcGtzLYpKs4STQg==
X-Received: by 2002:aca:5841:: with SMTP id
	m62-v6mr2595330oib.346.1532618789545; 
	Thu, 26 Jul 2018 08:26:29 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:9011:e8d9:eeb5:4862?
	([2601:202:4180:c33:9011:e8d9:eeb5:4862])
	by smtp.gmail.com with ESMTPSA id
	m62-v6sm2260401oik.30.2018.07.26.08.26.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 08:26:29 -0700 (PDT)
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20180725181158.13285-1-JPEWhacker@gmail.com>
	<20180726150409.26104-1-JPEWhacker@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <6aece375-859a-b762-dbde-8cef9b72805c@gmail.com>
Date: Thu, 26 Jul 2018 08:26:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180726150409.26104-1-JPEWhacker@gmail.com>
Subject: Re: [sumo][PATCH v3] u-boot: Fix build race condition
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
X-List-Received-Date: Thu, 26 Jul 2018 15:26:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/26/2018 08:04 AM, Joshua Watt wrote:
> Backports 2f61b13d6acba787b00598d519c85222e993e4ca (included in the
> 2018.07 release) which fixes a race condition when building.
>
> [YOCTO #12705]

Thanks. I will pull in shorly

- armin
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  ...efi_loader-avoid-make-race-condition.patch | 51 +++++++++++++++++++
>  .../u-boot/u-boot-common_2018.01.inc          |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-bsp/u-boot/files/0001-efi_loader-avoid-make-race-condition.patch
>
> diff --git a/meta/recipes-bsp/u-boot/files/0001-efi_loader-avoid-make-race-condition.patch b/meta/recipes-bsp/u-boot/files/0001-efi_loader-avoid-make-race-condition.patch
> new file mode 100644
> index 0000000000..da7e27c64c
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/files/0001-efi_loader-avoid-make-race-condition.patch
> @@ -0,0 +1,51 @@
> +From 5c2e24a9ed54dfee77d1844a080e998b4affe916 Mon Sep 17 00:00:00 2001
> +From: Heinrich Schuchardt <xypron.glpk@gmx.de>
> +Date: Sat, 2 Jun 2018 19:00:41 +0200
> +Subject: [PATCH] efi_loader: avoid make race condition
> +
> +When U-Boot is built with 'make -j' there is not guarantee that targets in
> +directory arch/ are built before targets in directory lib/. The current
> +build instruction for EFI binaries in lib/ rely on dependencies in arch/.
> +If $(EFI_CRT0) or $(EFI_RELOC) is not yet built before trying to build
> +%.efi an error
> +    *** No rule to make target '%.efi'
> +occurs.
> +
> +With the patch separate copies of $(EFI_CRT0) and $(EFI_RELOC) named
> +efi_crt0.o and efi_reloc.o are built in lib/efi_loader and
> +lib/efi_selftest.
> +
> +Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> +Signed-off-by: Alexander Graf <agraf@suse.de>
> +
> +Upstream-Status: Backport from 2018.07
> +
> +Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> +---
> + scripts/Makefile.lib | 10 ++++++++--
> + 1 file changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> +index 8f19b2db56..f2f398c935 100644
> +--- a/scripts/Makefile.lib
> ++++ b/scripts/Makefile.lib
> +@@ -404,8 +404,14 @@ cmd_efi_ld = $(LD) -nostdlib -znocombreloc -T $(EFI_LDS_PATH) -shared \
> + 
> + EFI_LDS_PATH = $(srctree)/arch/$(ARCH)/lib/$(EFI_LDS)
> + 
> +-$(obj)/%_efi.so: $(obj)/%.o arch/$(ARCH)/lib/$(EFI_CRT0) \
> +-		arch/$(ARCH)/lib/$(EFI_RELOC)
> ++$(obj)/efi_crt0.o: $(srctree)/arch/$(ARCH)/lib/$(EFI_CRT0:.o=.S)
> ++	$(call if_changed_dep,as_o_S)
> ++
> ++$(obj)/efi_reloc.o: $(srctree)/arch/$(ARCH)/lib/$(EFI_RELOC:.o=.c) $(recordmcount_source) FORCE
> ++	$(call cmd,force_checksrc)
> ++	$(call if_changed_rule,cc_o_c)
> ++
> ++$(obj)/%_efi.so: $(obj)/%.o $(obj)/efi_crt0.o $(obj)/efi_reloc.o
> + 	$(call cmd,efi_ld)
> + 
> + # ACPI
> +-- 
> +2.17.1
> +
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
> index d2073ea0c7..11b82b7e26 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
> @@ -11,6 +11,7 @@ SRCREV = "f3dd87e0b98999a78e500e8c6d2b063ebadf535a"
>  
>  SRC_URI = "git://git.denx.de/u-boot.git \
>      file://MPC8315ERDB-enable-DHCP.patch \
> +    file://0001-efi_loader-avoid-make-race-condition.patch \
>  "
>  
>  S = "${WORKDIR}/git"


