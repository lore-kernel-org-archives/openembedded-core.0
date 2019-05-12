Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1415B7D534
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 17:14:38 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id k24so7262941qtq.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 10:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Q7Lo9aDHqhyjCyhD1iCHeHjknbnY1kITvzNqUbmryf8=;
	b=bW1lzsrA4Yo1kku1W3Xb7yQrXSKcy2jcg2Rw6zfugC4O5SRfelk8Y49SNnEWtlfiK2
	wTwLI4wAIPS+a0SAdKjXTTylvhThs4W2D8+pGKF+9NCb8Megkou7IBrohABdhe8UZEyP
	rbGrPUY5hx8aMQvKLcwHP+/4HC4ftwr3H2/t+g2Me+/1UlKicYpqvO1v7ONOB2j5Issx
	tk4L8cjruOdtg8pDassHdgeQAVr3bJE8LFmlhTC7UKibQEjtYtmMZebWC5xL3mbyOk5i
	XD6nhkgTzFDg5KCFNppKo13QgoLFMhhSaWBYcEx4zgF8Hw2oRk48WKRheIfyo5xc6Ba2
	3j0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Q7Lo9aDHqhyjCyhD1iCHeHjknbnY1kITvzNqUbmryf8=;
	b=Vr+eHSw+InCmgIxDaVJVfMK5rgE2m573y23WssGwLJghogrlJyCrb2oL4N9ZyudM17
	iWJsdx27pzmwfr6YM5y2ZtmGNTEbExKDP8Z1Q+aACwqMBPmZeym83hg0a+4XxNN1y0g2
	BCrI0UUzmzZO7gHvIKQR8QhCAVdAK1IPksjbBCLLMKUet06r9RXF286ubGntG/OWxVHe
	h22QLxljbDJK67CyTBUvxOBnRUB29MHcGuxACSkMm5txV6SUBXW9qUyul3E1aSHkcOf5
	/GSEnE3CQ+yVMpmKrGMoHlrNYz8+ur/Er4jd2yd+HElAAoFGVydvX9o1hGlBTX5mQXys
	6LNw==
X-Gm-Message-State: APjAAAWFoHtFs5bqFdtcW9NeQZSJm83yfPDL8dfCLuH+WyX3P6VdQ7cd
	eEDpdIrDoNksaCAIcDNdqc8pSB058zEQ9XHv5zE=
X-Google-Smtp-Source: APXvYqxln1NA957u8Q1akmZqYoP38rp6eCMEsxtIaDMdOmXxSIbOiC2CzMHS20dOQX4X/K3R3/79tVG5rx8AQkGIKyA=
X-Received: by 2002:aed:3827:: with SMTP id j36mr19489185qte.196.1557681279773;
	Sun, 12 May 2019 10:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <736954077d40261a25f189a4d459c8cede0f8d99.camel@linuxfoundation.org>
In-Reply-To: <736954077d40261a25f189a4d459c8cede0f8d99.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 May 2019 10:14:13 -0700
Message-ID: <CAMKF1sp4uGcuL38vPsfcF6rm0sCvXjY9GDBuMckW4RM7Kzs-Ew@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core status with gcc9
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
X-List-Received-Date: Sun, 12 May 2019 17:14:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, May 12, 2019 at 6:21 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> I've run some tests and think we're now down to one remaining issue
> with gcc 9:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/579
> https://autobuilder.yoctoproject.org/typhoon/#/builders/55/builds/145
>

Assembler is not liking what gcc9 is generating

HOSTCC scripts/kconfig/conf.o
/tmp/ccnMW5be.s: Assembler messages:
/tmp/ccnMW5be.s: Internal error (Segmentation fault).

I wonder if its a common case or specific here?
I will try to reproduce it as well

> which is a kernel "make scripts" segfaulting on target on mips and
> hence failing to build kernel modules. If we can get that one fixed
> we're good from an OE-Core perspective to move to gcc 9.
>
> I have to recognise the work Khem has put in getting us this close!
>
> Cheers,
>
> Richard
>

