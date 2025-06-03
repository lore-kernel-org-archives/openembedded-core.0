Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2AFC5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 20:56:25 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.868.1748984175611015045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 13:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UK1kymS8;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23508d30142so64403395ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 13:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748984175; x=1749588975; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EJ5ssy7sMh6/YppwrbVSG7Bbkv1IjLyXHF0XkmN/zTc=;
        b=UK1kymS8xpvphVN6ww9n+BmPB9mWCkMrzQnFbIbQ86oUAlvaosCR2V/Swx1HbGmYac
         5Wdz8B82rieMSqZ1o6vRkgjkofq5itllHJ9hd6tRjEYhs96zGwsi5hlQ4wn1ocNq3cih
         EJ1oniQqZoTX47l3gkJjIPwdrg5RpuX+eYuKjdCccxp5s+ntfT8ANukYtxJVtNgIZFwl
         rti/AL84FoNGl+RSZts7jzUUl+1FftCSom7CtXSEuXzIkKt4OQzHuEn7nD3uN+P+wX8g
         e975KMFm56TylVVbmfiWNtN8uhqVvlTjKJJWpmBiEbsFO+t6EC/oZx6BHxKkOevQY/q0
         cCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748984175; x=1749588975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ5ssy7sMh6/YppwrbVSG7Bbkv1IjLyXHF0XkmN/zTc=;
        b=GdgimtbiovDI6rTyA9agDMbvhRUS6RoGzVsGhmFNoHyEHtxKGAOL3+d0e0JCyzd1sI
         TTghtHYhUw1Jkk8r2cqmV6sCjCaaEcBlUFYHmGNSwAgqUngpOqqu8jz1LI86R6LlTyDo
         TEIaYqrvCB2VhMcQ0J4jlb9k4j/ndMiE1Vnrr1WKgAPOM9g0aiQ0g9ksdveg8QJ5DbNU
         SNfKgVO13ezS43ifd84lIPQ84DINgnft2PtQiPtgEr90zx5527osOAzhmjDgBkhjJXLM
         mt21gnFw11spUqDSJmvPGYujsgjiKQhFJx0mNy2eo1VDONBUUGioqvaJWQrTS/srZivL
         SzfA==
X-Forwarded-Encrypted: i=1; AJvYcCU2pNvw67caNsuVf3okw6FZK6YH4zi+BpnveVqF8SZjKPOxVu3rKzcOtNpFUXsKlchiRABfESthLXH8B5A2AoZrgg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwK1fo4HyM8wnAyqoISfnwbxWG4CZNvv/s8FjE27yWNQGYK/zL+
	LgJwodZVx6kNU4uBbQuG8m1iDpyUURlke5Glohtd6NGdaeCNL0crmwiF
X-Gm-Gg: ASbGncu8FNK8yO+/7qTa0fZDuBRybRdB4hAnph8zOBtXkvsKMOOwuBtELUbD7JQ9jyN
	fTYcSev0yx2awk9DWRwCrxG+PiPOqDrr5AoBAZ7yWoB0uy0TsWKeM9ZEDObihtO1dGaiHjjbJ/U
	7YMkug08oONg4B8stY7i3bjMaeO0phGYi2Dt26VkMw451TGZMjLh90dhywR623sqX5Vd43/sem2
	8lRHrsHP9L31WXBnBPrxJbGaImCMwyUGzz35fxm48Qr5Yfw+Z/O34LFlQeQp508CGcdGm5AljM+
	aH90f+q5Eb58dgMUasqLzjO7Hg+OIiGuR9+a0wk0L38IZgurvVTA0xIdT09dicYFz9A+JTmV0mY
	kszogE5Rfs+KlONjpjOj31lzSN3VUCOdVzBbgPsFE6A==
X-Google-Smtp-Source: AGHT+IHccIezE8uNodlaK5B97ionIp2CEIhW4GwRCAoWDoeOMSh9xhEQ+Ph7If+bgUVYE1vxKzzqCw==
X-Received: by 2002:a17:902:f785:b0:235:15f3:ef16 with SMTP id d9443c01a7336-235e114071cmr2802715ad.13.1748984174935;
        Tue, 03 Jun 2025 13:56:14 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:bcff:6d7:a328:fe85? ([2601:646:8201:fd20:bcff:6d7:a328:fe85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e30cb3bsm7676439a91.38.2025.06.03.13.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 13:56:14 -0700 (PDT)
Message-ID: <301069e2-445c-4298-843c-c1a3f7d17ca5@gmail.com>
Date: Tue, 3 Jun 2025 13:56:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC] rust: Upgrade 1.85.1->1.86.0
To: Randy MacLeod <randy.macleod@windriver.com>,
 Randy MacLeod <rwmacleod@gmail.com>
Cc: "Shinde, Yash" <Yash.Shinde@windriver.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
References: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com>
 <CANNYZj-BmEXJVc1rdVPGu5wz87AW1RvbX+WhgicAfEby7kjUhw@mail.gmail.com>
 <47ba1f68-f67b-4c58-b788-63e06fdf4816@windriver.com>
 <CANNYZj-JtVtjk2e+Z=OmVF8RaygO5M1e+6tbQuTZYotbYetQrg@mail.gmail.com>
 <7571c07b-2225-4449-8169-08b044208072@gmail.com>
 <afaa4102-c876-437a-871d-f6f90697d5f4@windriver.com>
 <CANNYZj-Pa_jhraEz7qAHoDXLxfg-7ztH4UhdRPXirw6biZGWEA@mail.gmail.com>
 <36532bcc-c9dd-430a-a932-ec81e9270f19@windriver.com>
 <CAK6=ix4WrPGEbsfRwEsZz56BJP61OnkjqO8xvcB9BYoNJ2A6RQ@mail.gmail.com>
 <CAMKF1spgaYyyYOs633Lr_0EMq=vmixOXLDa4Q2ivb9PJy0BY8A@mail.gmail.com>
 <105472d8-aa33-4894-b23f-0a4be90367c1@windriver.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <105472d8-aa33-4894-b23f-0a4be90367c1@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 20:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217824



On 6/3/25 11:31 AM, Randy MacLeod wrote:
> On 2025-06-02 1:09 p.m., Khem Raj wrote:
>>
>>
>> On Mon, Jun 2, 2025 at 6:03 AM Randy MacLeod <rwmacleod@gmail.com> wrote:
>>
>>     Hi Yash,
>>
>>
>>     On Mon, Jun 2, 2025, 07:15 Yash Shinde via lists.openembedded.org
>>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!
>>     AjveYdw8EvQ!eFbErouxWe_8sEEVI1krYJ8mhuv-
>>     rIrrvLEk7rYp2ZeCBYDpMmsVsNya8myxiMywaOFMMtB__0YvY7rtMhcpAg$>
>>     <Yash.Shinde=windriver.com@lists.openembedded.org> wrote:
>>
>>
>>         On 30-05-2025 18:45, Alexander Kanavin wrote:
>>>         On Fri, 30 May 2025 at 14:42, Yash Shinde<Yash.Shinde@windriver.com> wrote:
>>>
>>>>         As Khem mentioned, setting lld = false in config.toml doesn't build LLD.
>>>>         Furthermore, using "use-lld = false" ensures that LLD is not used as the
>>>>         default linker,
>>>>         causing the build to fall back to the system's default linker. This
>>>>         restores the earlier behavior.
>>>>         Also, the package QA error for rust-lld is not seen with this.
>>>         What about build times though? Are they back to what they were?
>>>
>>         The build time differences on my machine are as follows:
>>
>>         rust version
>>         	rust upstream builds
>>         	rust-native (yocto build)
>>         	rust target (yocto build)
>>         v1.85.1
>>         	10 mins
>>         	20 mins
>>         	33 mins
>>         v1.86.0
>>         	22 mins (with "lld" and "use-lld" set to "false")
>>         30 mins (with default settings i.e lld = true)
>>
>>         	31 mins (with "lld" and
>>         "use-lld" set to "false") 	43 mins (with "lld" and
>>         "use-lld" set to "false")
>>
>>         Note: The machine being used is a shared resource and fairly
>>         busy. Build times may differ due to other user's builds.
>>
>>
>>         The FS usage is as follows:
>>
>>         Rust version
>>         	rust upstream builds
>>         	Yocto rust builds (build/tmp/work/core2-64-poky-linux/
>>         rust/1.86.0/rustc-1.86.0-src/build)
>>         v1.85.1
>>         	4.6 G
>>         	6.3 G
>>         v1.86.0
>>         	15 G
>>         	8.8 G
>>
>>         The latest rust v1.86.0 upgrade changes are available at:
>>         https://git.yoctoproject.org/poky-contrib/log/?h=harish/
>>         rust_1.86.0_v2 <https://urldefense.com/v3/__https://
>>         git.yoctoproject.org/poky-contrib/log/?
>>         h=harish*rust_1.86.0_v2__;Lw!!AjveYdw8EvQ!
>>         eFbErouxWe_8sEEVI1krYJ8mhuv-
>>         rIrrvLEk7rYp2ZeCBYDpMmsVsNya8myxiMywaOFMMtB__0YvY7qkai0dkw$>
>>
> 
> FS bloat is partly due to:
>     1. we forgot to remove cargo from rust pkg,
>     2. rust-analyzer added in 1.86, - do we need it?

I think its not a bad idea for cross compiler on host and perhaps a 
packageconfig for target. Same for clippy, rustfmt

>     3. wasm-component-ld  built - do we need it?

If we need to support wasm output for rust compiler. Seems to
be a good candidate for packageconfig with disabled default.

>     4. llvm-bitcode-linker      built - do we need it?
> 

it was used from stage0 in prior releases. Now it is cross compiled
and is better

another change is that LTO is enabled for all these tool builds which 
might be also adding to build time, even though resulting binaries might
be faster.

> For now, drop the things we don't need by changing config.toml.
> We can consider adding them as disabled by default 
> PACKAGECONFIG[feature] options later.
> 
> This is from looking at the packages-split contents and a filtered 
> log.do_install.
> Details and more info below.
> 
> ../Randy
> 
> 
> 
> I expect that rust-analyzer is also the primary reason for the build 
> time increase but hopefully Yash can confirm.
> 
> I dug through the log files a bit which I don't do often these days so 
> maybe there's a better way to get
> this info.
> 
> ❯ rg  "^COMPILE|^Building" 1.85.1/log.do_install | sed 's/ (.*)$//'  > 
> 1.85.1/COMPILE-Building
> ❯ rg  "^COMPILE|^Building" 1.86/log.do_install | sed 's/ (.*)$//' > 
> 1.86/COMPILE-Building
> 
> 
> Diffs below (1).
> 
> 
> Initially I was looking at log.do_install and filtering out noise using 
> a combination of grep, sed, and
> emacs macros of all things!
> 
> I ended up reducing the log.do_install file length by an order of magnitude:
> ❯ wc -l */log.do_install
>     13351 1.85.1/log.do_install
>     22144 1.86/log.do_install
> 
> ❯ wc -l */log.do_install.Compiling.fix-with-emacs.Compiling.sed-path
>    1211 1.85.1/log.do_install.Compiling.fix-with-emacs.Compiling.sed-path
>    2103 1.86/log.do_install.Compiling.fix-with-emacs.Compiling.sed-path
> 
> Diff here:
> https://www.diffchecker.com/hduQYfmq/
> 
> in case anyone is interested in the lower level build view.
> 
> 
> 
> 1) diff -u and sdiff of high level COMPILE|Building
> 
> ✦ ❯ diff -u 1.8*/COMPILE-Building
> --- 1.85.1/COMPILE-Building    2025-06-03 14:11:34.838212146 -0400
> +++ 1.86/COMPILE-Building    2025-06-03 14:11:44.997206613 -0400
> @@ -2,18 +2,36 @@
>   Building bootstrap
>   Building stage0 library artifacts
>   Building compiler artifacts
> +Building stage0 tool wasm-component-ld
> +Building tool llvm-bitcode-linker
>   Building stage1 library artifacts
>   Building compiler artifacts
> +Building stage1 tool wasm-component-ld
> +Building tool llvm-bitcode-linker
>   Building stage1 library artifacts
>   Building stage0 tool rust-installer
>   Building compiler artifacts
> +Building stage1 tool wasm-component-ld
> +Building tool llvm-bitcode-linker
>   Building tool rustdoc
> +Building tool rust-analyzer-proc-macro-srv
> +Building stage0 tool generate-copyright
> +Building tool cargo
> +Building tool rust-analyzer
> +Building tool rustfmt
> +Building tool cargo-fmt
> +Building tool clippy-driver
> +Building tool cargo-clippy
>   COMPILE rust install clippy
>   Building bootstrap
>   Building stage0 library artifacts
>   Building compiler artifacts
> +Building stage0 tool wasm-component-ld
> +Building tool llvm-bitcode-linker
>   Building stage1 library artifacts
>   Building compiler artifacts
> +Building stage1 tool wasm-component-ld
> +Building tool llvm-bitcode-linker
>   Building stage1 library artifacts
>   Building compiler artifacts
>   Building tool clippy-driver
> @@ -23,8 +41,12 @@
>   Building bootstrap
>   Building stage0 library artifacts
>   Building compiler artifacts
> +Building stage0 tool wasm-component-ld
> +Building tool llvm-bitcode-linker
>   Building stage1 library artifacts
>   Building compiler artifacts
> +Building stage1 tool wasm-component-ld
> +Building tool llvm-bitcode-linker
>   Building stage1 library artifacts
>   Building compiler artifacts
>   Building tool rustfmt
> 
> ✦ ❯ sdiff 1.8*/COMPILE-Building
> COMPILE rust install                        COMPILE rust install
> Building bootstrap                        Building bootstrap
> Building stage0 library artifacts                Building stage0 library 
> artifacts
> Building compiler artifacts                    Building compiler artifacts
>                                    >    Building stage0 tool wasm- 
> component-ld
>                                    >    Building tool llvm-bitcode-linker
> Building stage1 library artifacts                Building stage1 library 
> artifacts
> Building compiler artifacts                    Building compiler artifacts
>                                    >    Building stage1 tool wasm- 
> component-ld
>                                    >    Building tool llvm-bitcode-linker
> Building stage1 library artifacts                Building stage1 library 
> artifacts
> Building stage0 tool rust-installer                Building stage0 tool 
> rust-installer
> Building compiler artifacts                    Building compiler artifacts
>                                    >    Building stage1 tool wasm- 
> component-ld
>                                    >    Building tool llvm-bitcode-linker
> Building tool rustdoc                        Building tool rustdoc
>                                    >    Building tool rust-analyzer- 
> proc-macro-srv
>                                    >    Building stage0 tool generate- 
> copyright
>                                    >    Building tool cargo
>                                    >    Building tool rust-analyzer
>                                    >    Building tool rustfmt
>                                    >    Building tool cargo-fmt
>                                    >    Building tool clippy-driver
>                                    >    Building tool cargo-clippy
> COMPILE rust install clippy                    COMPILE rust install clippy
> Building bootstrap                        Building bootstrap
> Building stage0 library artifacts                Building stage0 library 
> artifacts
> Building compiler artifacts                    Building compiler artifacts
>                                    >    Building stage0 tool wasm- 
> component-ld
>                                    >    Building tool llvm-bitcode-linker
> Building stage1 library artifacts                Building stage1 library 
> artifacts
> Building compiler artifacts                    Building compiler artifacts
>                                    >    Building stage1 tool wasm- 
> component-ld
>                                    >    Building tool llvm-bitcode-linker
> Building stage1 library artifacts                Building stage1 library 
> artifacts
> Building compiler artifacts                    Building compiler artifacts
> Building tool clippy-driver                    Building tool clippy-driver
> Building tool cargo-clippy                    Building tool cargo-clippy
> Building stage0 tool rust-installer                Building stage0 tool 
> rust-installer
> COMPILE rust install rustfmt                    COMPILE rust install rustfmt
> Building bootstrap                        Building bootstrap
> Building stage0 library artifacts                Building stage0 library 
> artifacts
> Building compiler artifacts                    Building compiler artifacts
>                                    >    Building stage0 tool wasm- 
> component-ld
>                                    >    Building tool llvm-bitcode-linker
> Building stage1 library artifacts                Building stage1 library 
> artifacts
> Building compiler artifacts                    Building compiler artifacts
>                                    >    Building stage1 tool wasm- 
> component-ld
>                                    >    Building tool llvm-bitcode-linker
> Building stage1 library artifacts                Building stage1 library 
> artifacts
> Building compiler artifacts                    Building compiler artifacts
> Building tool rustfmt                        Building tool rustfmt
> Building tool cargo-fmt                        Building tool cargo-fmt
> Building stage0 tool rust-installer                Building stage0 tool 
> rust-installer
> 
>>
>>         Regards,
>>         Yash
>>
>>
>>     Hi Yash
>>
>>
>>     That's good progress. We'll need to think about what, it anything,
>>     we're missing by not building rust-lld. We should run some tests
>>     to compare the link times but that can likely wait until after we
>>     get the update merged.
>>
>>
>> Though the internet has some information on lld improvements having 
>> this in OE context will be valuable.
>> I also think disabling lld is going to give us some reprieve. As more 
>> targets in rust seem to use it by default we need to consider that we 
>> do not start disabling defaults and wear off from upstream.
>>
>>     Remaining concerns:
>>
>>     1. Significant increase in FS usage, compile time. Have you looked
>>     into why there's still such a significant increase?
>>
>>     2.  * Enable INHIBIT_PACKAGE_DEBUG_SPLIT/STRIP to fix QA stripping
>>     errors. Fixes: ERROR: rust-1.86.0-r0 do_package: QA Issue: File '/
>>     usr/lib/rustlib/x86_64-poky-linux-gnu/bin/wasm-component-ld' from
>>     rust was already stripped, this will prevent future debugging!
>>     [already-stripped]
>>
>>
>>     Do we use this component? Is it new? Why is it produced without
>>     debug symbols?
>>
>>
>>     I'll take a more careful look at the commit code changes once we
>>     have answers to these questions.
>>
>>
>>     Thanks for your hard work.
>>     Almost done this upgrade hopefully.
>>
>>     Randy
>>
>>>         Alex
>>
>>         -=-=-=-=-=-=-=-=-=-=-=-
>>         Links: You receive all messages sent to this group.
>>         View/Reply Online (#217714): https://lists.openembedded.org/g/
>>         openembedded-core/message/217714 <https://urldefense.com/v3/
>>         __https://lists.openembedded.org/g/openembedded-core/
>>         message/217714__;!!AjveYdw8EvQ!eFbErouxWe_8sEEVI1krYJ8mhuv-
>>         rIrrvLEk7rYp2ZeCBYDpMmsVsNya8myxiMywaOFMMtB__0YvY7oWKRQz_A$>
>>         Mute This Topic: https://lists.openembedded.org/
>>         mt/113268009/953399 <https://urldefense.com/v3/__https://
>>         lists.openembedded.org/mt/113268009/953399__;!!AjveYdw8EvQ!
>>         eFbErouxWe_8sEEVI1krYJ8mhuv-
>>         rIrrvLEk7rYp2ZeCBYDpMmsVsNya8myxiMywaOFMMtB__0YvY7pWRz_sBA$>
>>         Group Owner: openembedded-core+owner@lists.openembedded.org
>>         <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>>         Unsubscribe: https://lists.openembedded.org/g/openembedded-
>>         core/unsub <https://urldefense.com/v3/__https://
>>         lists.openembedded.org/g/openembedded-core/unsub__;!!
>>         AjveYdw8EvQ!eFbErouxWe_8sEEVI1krYJ8mhuv-
>>         rIrrvLEk7rYp2ZeCBYDpMmsVsNya8myxiMywaOFMMtB__0YvY7ryeheIkg$>
>>         [rwmacleod@gmail.com]
>>         -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> -- 
> # Randy MacLeod
> # Wind River Linux
> 


