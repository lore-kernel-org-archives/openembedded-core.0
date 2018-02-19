Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 21541786B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 16:45:53 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id 37so333381lfs.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Agzx7IvbGvc/hld/Ds0xke8jgbqeaEkpdCS1tqr84vE=;
	b=KvcS1KS8w65tFim2AtrKkYDjpBGeIvt0s4rJVQk3eTCOYYRAK26oZ1r2YH0eJigLAn
	6hjmCJAi4r7xlWGoiDjPe1ZNA2NScieDsuGan2o4oNvNcy5VpqpWfU/MnXlik7zYHmx0
	ea1hS+YMj7dq4SV2e1uXEK968dsyiyzaw5Ld9KLwtDRpJ4B2N+AI1wNt/SXLK8BTetxl
	WEeuIkQBhjE90khbwHovN9X+5vZimOvN88vqPgOUrfJYi6wjQdC9pwOOxrvbezcGYzLU
	zYRfUZEbNlxo/t75/AghRqX6946np+0GOwdaUv9q9HH2A8+nol3XznNbBuYpCVzFqcgC
	9nUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Agzx7IvbGvc/hld/Ds0xke8jgbqeaEkpdCS1tqr84vE=;
	b=Q8ibZN4Xkm6p9FdGi2/FPsemSHSbPNuSKlW8MqSU39NAaI0+St76LaeWcVCoV2Ay9R
	ae+mKiP5ANoQToi3ReELDl5RP5XW3PhzLRGeWdkYCKVf45zWTky4E8asEqsNktDKLEv0
	beHmfpJVS4G0jiWJc9Fn5a8MVGE8O21pVVeU+OEqZIlDZZZI+swg/WBGDff30EZL67UV
	kaho73ibOu8HLrg5rNdDg0lxQKwya0ALRbXUbZCtjP4PnK7ecLgDdzkdbyqEHxxBOK93
	TaS9PoItbEUt79g+5QKKwx7khHWdZdLsWpxMr/GLR0q/I34QLN+gPuALLBeOreSuqJ2j
	KzCg==
X-Gm-Message-State: APf1xPCjcfagl06Jq1NPNJXwgdghD4aYv6EGM6zDAxZceZm1MIv3GdJf
	vDpyHpUuT45TNurCFr52htSsEOhs2Q388gGhkk0=
X-Google-Smtp-Source: AH8x226hQDkf1TbN2ehVeI1lzEfwzb4u/N1V1xNaCMkZSdVgW19Bhsult4gII/NIh6jUVOVeu65dRUYJH1XPFY7f1R4=
X-Received: by 10.46.23.219 with SMTP id 88mr10230217ljx.49.1519058754587;
	Mon, 19 Feb 2018 08:45:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Mon, 19 Feb 2018 08:45:54 -0800 (PST)
In-Reply-To: <1519058248.24236.259.camel@linuxfoundation.org>
References: <1519054841-4986-1-git-send-email-bruce.ashfield@windriver.com>
	<a2083091-1169-4ab3-1aba-55a1fc4cf2c0@gmail.com>
	<1519058248.24236.259.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 19 Feb 2018 11:45:54 -0500
Message-ID: <CADkTA4MjxCe1gY2zf6iro3DdQYs6_HZ9kH9SymcvhBJ8FJm1WA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2][rocko] linux-yocto/4.12: update to v4.12.20
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
X-List-Received-Date: Mon, 19 Feb 2018 16:45:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 19, 2018 at 11:37 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2018-02-19 at 08:16 -0800, akuster808 wrote:
>> Bruce,
>>
>> thanks. I hand applied this as I have another kernel change sitting
>> in
>> stable/rocko-next
>>
>> I will build this once RP is done with master
>
> You correctly pointed out I needed to sort master first! :)
>
> Bruce: Is there an update for 4.9 in rocko? If so we should perhaps
> pull that in too before we rebuild 2.4.2?

I haven't done a patch for 4.9 in rocko, but can. Give me a few minutes and
will send one out.

Bruce

>
> (and thanks for the 4.12 fixes, I was going to ask about them but Armin
> beat me to it)
>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

