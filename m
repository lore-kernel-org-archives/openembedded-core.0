Return-Path: <lpapp@archlinux.us>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id E758160144
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 18:04:19 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id hy10so4901912vcb.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Dec 2014 10:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=uQnWwJznQ0scBumfbQGlwvA6MxAg4I5VvkXlLxh38v8=;
	b=QqtGybSU0kxyIs2kTbysC4oVgoaFxYZp4Md4fasXMgXx4TGU3S/XKeZvBn5qAuFpaX
	gCzrZiGtNoTGCS3jn/dumuWe9uPqgHiPgcCszPqhb+CNf6XJBOqVWSAm790nGJlXlXme
	YKcrYWN5bHjldC3WjkfuupI5CU/EV8EpXvCMu2yxzNtvoMzM4p+oaFKzF3doiFU2Nw4I
	jfHMiJF0DYS6nEltU817Z/EP9cGrxTj8HJ1bdqTzueZAca9AuCac/8wcklt1owILbYYB
	GsxkfjVyOiMSfNjwlCpDVaeg0SfYUIcXwzKAFLFb862udeGLSNJ7Cnsgxe3zCAgXy4hd
	+8XA==
X-Gm-Message-State: ALoCoQk3wat//3Yrx2kqxprmP4Slz1k6efhB0gRki6/3tQAt/gbD3D5KR/drCX+Ml3D+p0HpQYcG
MIME-Version: 1.0
X-Received: by 10.220.139.135 with SMTP id e7mr3346585vcu.75.1417457059755;
	Mon, 01 Dec 2014 10:04:19 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.31.188.129 with HTTP; Mon, 1 Dec 2014 10:04:19 -0800 (PST)
In-Reply-To: <CAJTo0LayXWcmDG623USQP5Z081CooTM0JAzpW2bMaWV=cE6LxA@mail.gmail.com>
References: <1407438629-13369-1-git-send-email-marex@denx.de>
	<CAJTo0Lbk2eOtBbOFj5d8oEpW6N9p3wmuw5kUMEqzsRKPyakt6w@mail.gmail.com>
	<1417446810.15614.28.camel@linuxfoundation.org>
	<3316034.dGek4aGvY6@peggleto-mobl5.ger.corp.intel.com>
	<CAJTo0LayXWcmDG623USQP5Z081CooTM0JAzpW2bMaWV=cE6LxA@mail.gmail.com>
Date: Mon, 1 Dec 2014 18:04:19 +0000
X-Google-Sender-Auth: LUgFT90H_fIXXPvjNj_ZKKOmc9U
Message-ID: <CAOMwXhPTqhHZQ_jxDydTywThH_Kt=EkV=kiUCni+x+XM56FBAA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Marek Vasut <marex@denx.de>, Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Yocto: Install full set of python modules in Qt SDK toolchain
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
X-List-Received-Date: Mon, 01 Dec 2014 18:04:20 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 1, 2014 at 4:44 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 1 December 2014 at 15:21, Paul Eggleton <paul.eggleton@linux.intel.com>
> wrote:
>>
>> > Make nativesdk-python-core RRECOMMEND python-modules?
>>
>> This sounds like a reasonable option to me. The split as it is at the
>> moment
>> exists mainly for trimming the target; the SDK is perhaps less sensitive
>> to
>> size constraints.
>
>
> Patch sent.

Thanks!

>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

