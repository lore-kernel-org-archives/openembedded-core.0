Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.1604.1592374033250206529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 23:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lBPH12gg;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id c21so555600lfb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2020 23:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2O3fIBfy7PDjCtfsByXNgxn5JGjZRjsvk6Zf0brwBpU=;
        b=lBPH12ggGRrahPSMhSulKSwGdDRYrdqbKwtzN+5HSxUV/ZvGQG1v2SLE40zYrLFED7
         AG3dCBxhrMgxAXJswNGISTIhVaxlkh4Y0+oKAYooufj7SjOJyIveSlbBMkWTWp1Vyg/Y
         U4AmYFohawLjeaumaR4MgFKs5ttn8Bq4sCge/8piwrTkPzXCYIr4VRwQGFNV0QZN/VCs
         PoKY+C6A+EVFwli/70KT9SGMs8pipkvPjSj6MahKVQkmQ+52jKlx8xDC9TtQZmOAaAcg
         zjBfuOO/K14NjgzfNI/GaxtSVnvpkghivcgrI0jr6pV5f47ww5906QPAFUXS1YsNijGO
         HIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2O3fIBfy7PDjCtfsByXNgxn5JGjZRjsvk6Zf0brwBpU=;
        b=m3NWUjNx34/PLCYTkjEDy02TexfzE95vejrrcP6WZMEaN30Q8+04F/WKPgbYx1j7Ad
         VHnpwTyT8QNEJA9yhzt1uv5l/+WKjUIS42sDMzhhxlSxXJvFRXbWgknwMgzgDYSSSUJB
         016+6B4SXpcIUy8VNwHn2EUVRBG/s33YZ2BoCXhw4ORUN++CiZ+ftddxtcNBeEwOyTSE
         QqPwvIbvIw4PuGGeXNWcEJhtNu22HGOlGHb0WkZACmTvaT9mIc90iV55mPnkEQ4U0wHg
         r6LDzVBqAKLLN/sdfXN+qT4JvWmSfXRhT3TtSzpfC+w4wa9pWkollLsTk7GyWDBLTftI
         SzVg==
X-Gm-Message-State: AOAM532Zy5TbYg4Yrgmq2li1M+gqYbAFlaB2/UmgarbJe1yc8n/RfjLZ
	oAiUgTlka2kUfcDcBSaSgXHZpb5R
X-Google-Smtp-Source: ABdhPJzf/HpUCYosRIiI8Gl6GCN0ktwfl6LBc0tTTUpcuhaT6L57y4UkDowPcha2EANRzmF76gj1+A==
X-Received: by 2002:a19:c744:: with SMTP id x65mr3648044lff.133.1592374030740;
        Tue, 16 Jun 2020 23:07:10 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id n21sm4809441ljj.97.2020.06.16.23.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 23:07:09 -0700 (PDT)
Subject: Re: grub-efi-native: use RDEPENDS on grub-native instead of duplicating tools?
To: Christopher Clark <christopher.w.clark@gmail.com>,
 "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20190413144853.3765-1-jacob.kroon@gmail.com>
 <CACMJ4GaTed_mZsxhP2A_60AN1pmg-OfJDk=Zf-hTqZoC4YorjQ@mail.gmail.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <7f904c18-4aa0-a671-557b-bc9136ed3a94@gmail.com>
Date: Wed, 17 Jun 2020 08:07:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CACMJ4GaTed_mZsxhP2A_60AN1pmg-OfJDk=Zf-hTqZoC4YorjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/17/20 4:28 AM, Christopher Clark wrote:
> was: Re: [OE-core] [PATCH] grub-efi-native: Install grub-editenv
> 
> On Sat, Apr 13, 2019 at 7:49 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>>
>> Having a native version of grub-editenv around can be useful for
>> setting the targets grub environment.
> 
> Would it be acceptable to replace the tools being packaged in
> grub-efi-native with a RDEPENDS from grub-efi-native to grub-native,
> and so use the grub-mkimage and grub-editenv tools from the grub
> recipe instead?
> 
> The problem I'm encountering with the current dual packaging of
> grub-mkimage and grub-editenv tools, in both grub and grub-efi
> recipes, is that it prevents grub-native and grub-efi-native from
> being installed concurrently, and breaks my image build:
> 
> ERROR: xen-image-minimal-1.0-r0 do_image_wic: The file
> /usr/bin/grub-mkimage is installed by both grub-efi-native and
> grub-native, aborting
> 
> There's a wic script here:
> openembedded-core/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
> that may also be affected since it creates a boot partition with both
> legacy and EFI content.
> 
> The patch below resolves the error that I encountered. Does this change look OK?
> 
> Christopher
> 
> 
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb
> b/meta/recipes-bsp/grub/grub-efi_2.04.bb
> index b9d6225d27..5dd3398540 100644
> --- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
> @@ -6,6 +6,7 @@ GRUBPLATFORM = "efi"
> 
>   DEPENDS_append_class-target = " grub-efi-native"
>   RDEPENDS_${PN}_class-target = "grub-common virtual/grub-bootconf"
> +RDEPENDS_${PN}_class-native = "grub-native"
> 
>   SRC_URI += " \
>              file://cfg \
> @@ -61,9 +62,7 @@ do_install_append_class-target() {
>   }
> 
>   do_install_class-native() {
> -       install -d ${D}${bindir}
> -       install -m 755 grub-mkimage ${D}${bindir}
> -       install -m 755 grub-editenv ${D}${bindir}
> +        :
>   }
> 
>   do_install_class-target() {
> 

This change looks good to me. I added 'grub-editenv' before realizing 
that the tools were duplicated in 'grub', and I believe they are 
interchangeable.

Jacob
