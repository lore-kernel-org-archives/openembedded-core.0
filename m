Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RV9hl-0003ur-0J
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Nov 2011 23:29:41 +0100
Received: by lahe6 with SMTP id e6so728047lah.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 14:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QqML+qB6G4oWPrQQvH2a6Veo70UPU4fmWCCzQFIOfgU=;
	b=hC6UwEivnnNAJP4r5JGgnpNrcmdw4julMi5r53XS1N8YPtEWzUPu49szk/4dNCE/O/
	9CfRKRszAKHXOGt20TsUpWg38JEZSo9pYfBNrCkGH9vWavSg+GJsLecC4t2UyKGa6XBE
	nFakxOGTbeh7jBEEcnmH2BMenW1LdeF/U9G2o=
Received: by 10.152.134.77 with SMTP id pi13mr30101921lab.21.1322518982148;
	Mon, 28 Nov 2011 14:23:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Mon, 28 Nov 2011 14:22:31 -0800 (PST)
In-Reply-To: <CAKZ=5EV8s7GQRPbUcXj44nDZK1xf=qBT3mvUZEb9+v5jGz3+9Q@mail.gmail.com>
References: <5ca10bdeed6e90862311b8417c0e6de353d1dc70.1322223227.git.julian.pidancet@gmail.com>
	<CAEsOVNfoFW+3G-bSYiOy4p-Pa_bDShY_c3hutpA+THDO8hUrvg@mail.gmail.com>
	<1322264404.25382.4.camel@ted>
	<CAEsOVNcAR_N2LszE41fTaA=FGXMgtOdnCTLvdMxyYC5+GkTkKg@mail.gmail.com>
	<CAKZ=5EV8s7GQRPbUcXj44nDZK1xf=qBT3mvUZEb9+v5jGz3+9Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Nov 2011 14:22:31 -0800
Message-ID: <CAMKF1sq7Pv4fqEOU2Pow4_Hsw27R6FOUZDf7O0kSEwgq_Moh-w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH v3] Introduce multiarch DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Nov 2011 22:29:41 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 28, 2011 at 2:14 PM, Julian Pidancet
<julian.pidancet@gmail.com> wrote:
> On Mon, Nov 28, 2011 at 9:32 PM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>> On Fri, Nov 25, 2011 at 5:40 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> This is firmly in multilib territory as its not just libgcc but libc as
>>> well and so it goes on.
>>>
>>> One of the reasons I'm nervous of the patch you're replying to is that
>>> people are now going to try and cross the two and we'll end up with a
>>> mess :(.
>>>
>>> Trying to build just libgcc from the gcc tree is a nightmare and when we
>>> last tried it, caused no end of problems.
>>>
>>> What specific problem are you trying to solve?
>>
>> The specific issue I'm having is for our 64-bit part that still uses a
>> 32-bit u-boot. Not sure the best approach really is...
>>
>> I've tried utilizing multilib by adding the following to my u-boot
>> recipe, but it's just hacky...
>>
>> DEPENDS_e5500-64b_append = " lib32-gcc"
>> CC_e5500-64b = "powerpc-poky-linux-gcc -m32"
>>
>> I'd rather NOT recompile gcc/eglibc/etc just for this 32-bit build of
>> u-boot where we don't need libc. I'd rather just have a functional
>> 32bit/64bit compiler for our 64-bit target.
>>
>> Looking forward farther, I would like to have one toolchain
>> ("meta-toolchain") that can produce target code for multiple targets
>> also.
>>
>
> Does u-boot really need to compile against libgcc ? I'm just curious.
>
> Unfortunately I believe that producing one libgcc per bit format is a
> multilib use-case, not a bi-arch use-case.
>
> Richard, regarding your concerns about people mixing up bi-arch and
> multilib. Isn't there any way we could make these two things mutually
> exclusive ?

I think we should make it inclusive
ideally we should have bi-arch/tri-arch toolchain building multilib userspace.
in which case we have single compiler for multilib as well as archness


