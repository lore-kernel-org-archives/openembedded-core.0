Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 38ECE71A8E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 02:13:54 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id h78so2037417lfg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 18:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IRw+CbGYjfH1e3lprbGZOelJAh1FdOQCW0+SeNO1VVI=;
	b=aMtdCPvQIrataHdsUPQgvyEf7yzS/GFPgJ7m4bgTUYfG5VxorBPcVMfVgxd7mfkO6v
	lG4QmvZa5cj6ApIe06q+4Gg8Tqvw5DTW1riMGSLWGaxDLcE6FZ1Bai8JXt6s977AIdkA
	hlwc6gVRahnX+cXVVQyaQ7XlNT2bUOVqVs1vieZ5Oh/mPcyCdU4siD3lwUzv9+LKaZY8
	JV8jAohZmEbBc+zBUESCt7TQXbHqkWinXUgvZcPva/zKJoK49TfShCUBPDqG/FGybv2F
	9pxDcf53lBhNELNXW9xz/Ptj0GkTVXX2TtEblBPJH5v0VnSOwZKY87/m7Qd7oipXuC8R
	1R6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IRw+CbGYjfH1e3lprbGZOelJAh1FdOQCW0+SeNO1VVI=;
	b=BoI8qT2Qd9hF4Jv0/UaI9mCJ4NzGfEblG0V1AZXS34om7CzU5H5kysEL1gvHnCiYDp
	B1UYY8db91VLoPavtG2/B4OBN60wIiiRiRSgQ4zqQQLVqSbCBpqj7kGT7Q44gZygW2H/
	vo9AUNX50Sk38azArllslrg806UUl9lR1FYFruza7QsOguf1s9uzRHNSX7jADreA7NYN
	OAyh6uWjuU7sqRCpigeLvgDPD16jsHG1vkatJvZRnIaRC3Igou5PraATmWakzFFW5ggw
	oLTKy96pGYGjF553JOHck2BbYe+UyrKLODoUTxsT4gCFlwCLQvYmeOaedfG05k2PLTqE
	KavQ==
X-Gm-Message-State: APf1xPBeBrXUAF23EZT9e5/YMJdP3HfYMEFprp/mCpzBjTkxdzH1PllY
	4M6O7b4Eov//OB0Y2NbDHqpq7FcuWGmJsIrso4ZDXw==
X-Google-Smtp-Source: AH8x227KJEMK7caFHWYxp4a/wsVOECYmriIX8/jTCQZdxc162sJwOKXMdFV1tjWcp6Y/8BL6bt48+MZhuXp0ZXF4xrQ=
X-Received: by 10.25.25.9 with SMTP id 9mr4050286lfz.3.1519092835180; Mon, 19
	Feb 2018 18:13:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Mon, 19 Feb 2018 18:13:54 -0800 (PST)
In-Reply-To: <1519083917.24236.261.camel@linuxfoundation.org>
References: <1519054657-4616-1-git-send-email-bruce.ashfield@windriver.com>
	<1519054657-4616-2-git-send-email-bruce.ashfield@windriver.com>
	<1519083917.24236.261.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 19 Feb 2018 21:13:54 -0500
Message-ID: <CADkTA4PuqYLTvLpqFozxsitP+6GdXf=evvq=4bO8HUZpQch=uw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] make-mod-scripts: change how some kernel module tools are built
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
X-List-Received-Date: Tue, 20 Feb 2018 02:13:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 19, 2018 at 6:45 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2018-02-19 at 10:37 -0500, Bruce Ashfield wrote:
>> From: Joe Slater <jslater@windriver.com>
>>
>> Remove do_make_scripts() from module-base.bbclass and put
>> functionality in a recipe.  This will build the scripts only
>> once instead of each time an external module is built.
>>
>> [YOCTO #12228]
>>
>> Signed-off-by: Joe Slater <jslater@windriver.com>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>
>> v2: added the LIC_FILES_CHECKSUM
>>
>
> Sadly this doesn't pass all our tests:
>
> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/827/steps/Running%20oe-selftest/logs/stdio
>
> oe-selftest -r sstatetests.SStateTests.test_sstate_sametune_samesigs
>
> should reproduce.
>
> I suspect that the recipe may need:
>
> PACKAGE_ARCH = "${MACHINE_ARCH}"

I'll see what I can do. I don't hold a lot of in-depth knowledge on
this topic, but I made that change locally and am starting a build.

Bruce

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

