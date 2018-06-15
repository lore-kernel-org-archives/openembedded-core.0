Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id C1AA374F46
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 06:54:45 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id i205-v6so7956725oib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 23:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rEjleOwe6C1Ge9aV5rXbKxwX9e0BpOciJpcCmhfUDOs=;
	b=uAZNkfWipq/ooMUe9USEohJb3Y/eorOdVSKtCVHP/PMLrsOp6aqsGAsEX9J2wasKuh
	EAUXCeWASZouDOzJ2mg0KRx2KT8iKMCIHuQzjjWi5NCvwgPA1RPNrpr5QWdonUJOY4+3
	P++woVFUKnb55ZteBbnxabunuuvbKyuM7x3pynYB4iTf3+dAWcFlgK28erjfHPG5r4zz
	dUUZRzT3/xHqpCrClDfziByryQvLUftXNTlXYlJfIkceE90zn123argeFEruDUHnSqZS
	xKWdCbl1cyb9CpLDmTbK1PL++mqOFtUng/aMh8HihUdS4AVLBSBp8S1LcWaLk0K6XJNZ
	GQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rEjleOwe6C1Ge9aV5rXbKxwX9e0BpOciJpcCmhfUDOs=;
	b=gY8v8/dWyHpJf23EytdbnZGGRPf7i/xJgD9IbzZCVPrXiTxE48Xog7V6sdsFb39Eh+
	OBy8H7GQf8NrwcO3BpgOAYN5t6Sk+yNVOfUOk6z9s1gHPQpfjWMtPeDszUfloSfYDrg4
	Pbdet8tCRWkuP1HNE9Gtq8fBLnMZefr7NPj/FktcMav6HlXA4rok/u5Am2KKM646cZbC
	r7vJPOqjWrcMQueEVSxFoZ1HUrSGQWCDohGZtP9WKmiOKhlNexICxIC1/1Px/Wi/o9lV
	PURBm7uZcITWCfasuXwfTZifIlI1qHP4FrJUO86jQuBstjlu9X19XuJl8hFG5oz3214u
	hyzQ==
X-Gm-Message-State: APt69E3t6CSddqbhFeJFuql7S0dcXBsdNKZTcd2AwJW+mCxEtnNN+w3O
	kZ/iiqLdzDRCURpEB/DAmtUfDvTpMo2ls3xEzlI=
X-Google-Smtp-Source: ADUXVKICqLljcf5rX9iBX/dcCdOujDdiObSEtgY0lq2EsmMG9lEEzQBng3+Heu76X4mzypfL35LinMET5a8VUa+UkXM=
X-Received: by 2002:aca:47cb:: with SMTP id
	u194-v6mr247881oia.45.1529045686655; 
	Thu, 14 Jun 2018 23:54:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 23:54:45
	-0700 (PDT)
In-Reply-To: <399d37ef-b872-cae7-f086-818127a588b7@gmail.com>
References: <20180531062031.40334-1-mingli.yu@windriver.com>
	<1527772404.16911.155.camel@linuxfoundation.org>
	<5B10A3D7.20309@windriver.com>
	<CANNYZj_3y_uP4a188SREALPvpBL=xnu=QZAW9s7V9iSG2a-t9Q@mail.gmail.com>
	<5B10DBE5.5050603@windriver.com>
	<62a9d51c-67da-353b-778e-b8af72408413@gmail.com>
	<CANNYZj-JRVCWfRr++c6YQzEtq1WgmhUgf8CwAx4_N6PEdXrYHg@mail.gmail.com>
	<ef063f72-b7b0-e48b-fd50-1f0d05b22255@gmail.com>
	<94dbb164-5f36-de0f-9d2f-c3e9f4afc6f5@linux.intel.com>
	<399d37ef-b872-cae7-f086-818127a588b7@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Jun 2018 09:54:45 +0300
Message-ID: <CANNYZj-pDd=Dpgs4sk-73HbxXFKa_aBLMJaRYSxzvdq-EO6aKg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>, "Yu, Mingli" <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: Improve reproducibility
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
X-List-Received-Date: Fri, 15 Jun 2018 06:54:45 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks! Mingli, can you try this please?

Alex

2018-06-15 9:44 GMT+03:00 Khem Raj <raj.khem@gmail.com>:
>
>
> On 6/1/18 12:34 PM, Alexander Kanavin wrote:
>>
>> On 06/01/2018 09:33 PM, Khem Raj wrote:
>>>>
>>>> The .s file is not generated and it does not contain any .file
>>>> directives. The .o file also does not contain the path. It appears in
>>>> the final .so library at linking stage.
>>>
>>>
>>> Can you share the linker cmdline ?
>>
>>
>> https://pastebin.com/WK9GVDfj
>>
>> Note that of the three assembly-generated object files, only the path to
>> the first shows up in the .so - because of assembly labels I believe.
>>
>
> Thanks for sharing this. If there is a no file directive in an object file
> then linker will use whatever is specified on linker cmdline so thats what
> we see, We should define FILE symbol explicitly for .S files here, for C/C++
> files compiler does that automatically.
>
> Other files dont make a claim in final symbol table since this one file
> alone has cross referencing to symbols from other objects.
>
> Something like this will help
>
> Index: boost_1_67_0/libs/context/src/asm/make_i386_sysv_elf_gas.S
> ===================================================================
> --- boost_1_67_0.orig/libs/context/src/asm/make_i386_sysv_elf_gas.S
> +++ boost_1_67_0/libs/context/src/asm/make_i386_sysv_elf_gas.S
> @@ -23,7 +23,7 @@
>   *
> ----------------------------------------------------------------------------------
> *
>   *                  *
>
> ****************************************************************************************/
> -
> +.file "make_i386_sysv_elf_gas.S"
>  .text
>  .globl make_fcontext
>  .align 2
> Index: boost_1_67_0/libs/context/src/asm/make_x86_64_sysv_elf_gas.S
> ===================================================================
> --- boost_1_67_0.orig/libs/context/src/asm/make_x86_64_sysv_elf_gas.S
> +++ boost_1_67_0/libs/context/src/asm/make_x86_64_sysv_elf_gas.S
> @@ -23,7 +23,7 @@
>   *
> ----------------------------------------------------------------------------------
> *
>   *                  *
>
> ****************************************************************************************/
> -
> +.file "make_x86_64_sysv_elf_gas.S"
>  .text
>  .globl make_fcontext
>  .type make_fcontext,@function
>
>
>> Alex
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

