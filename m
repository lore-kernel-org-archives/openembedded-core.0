Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id EC90C73923
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 23:42:14 +0000 (UTC)
Received: by iecvj10 with SMTP id vj10so2431678iec.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 16:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ELnEM/UbSAEf7uVkWyjrFRL/QoDF7JumU99vVXs2f0M=;
	b=hvAf6qfAuVo/xKAOAb+2KzyVBZuCZUFnyJAcR2PDXlYwUycu0Mqm0vlUmUmgajYf2r
	bdRke/6QQyRl6XP5tzqJQurCBD/Rgrg7lA/COf2X3u9GtgLjZFosFtorh1xXMqioP2Wz
	/CQqFmlgkq4wQBuas5LaMi0LxCs/q6nkO1ZADIqt+DegqmpDvcvez6PmlSOd84pHK8ZD
	aKcyQIg9nFzRHWIMTKyJ0eHuQXBlKkObdPRSgFIj/TYcG9WO8HQ+uy+v0nDgUAqM/Kmz
	9LOMaLGb0acsBeetOO6m8SzVCw6axl14Mx4cGzfZvK+ZBB26E5Uv7gMU4/20yIa9CW11
	VaKg==
MIME-Version: 1.0
X-Received: by 10.202.102.21 with SMTP id a21mr30705323oic.118.1426117335082; 
	Wed, 11 Mar 2015 16:42:15 -0700 (PDT)
Received: by 10.202.217.69 with HTTP; Wed, 11 Mar 2015 16:42:15 -0700 (PDT)
In-Reply-To: <550009C1.80502@kernelconcepts.de>
References: <1426025096-24078-1-git-send-email-florian.boor@kernelconcepts.de>
	<CAJ86T=WvZ=cU2GCQ=P3XPar-WhQvhZFX0MbPcL7ahtkiW8xrhA@mail.gmail.com>
	<550009C1.80502@kernelconcepts.de>
Date: Wed, 11 Mar 2015 16:42:15 -0700
Message-ID: <CAJ86T=X3UcOPoE4AJKauCvfDZkt8WsKBj25XScZ5F0Sd47O6=A@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Florian Boor <florian.boor@kernelconcepts.de>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] directfb: Allow native builds of directfb 1.7.6
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
X-List-Received-Date: Wed, 11 Mar 2015 23:42:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi Florian,

On Wed, Mar 11, 2015 at 2:24 AM, Florian Boor
<florian.boor@kernelconcepts.de> wrote:
> Hi Arndre,
>
> On 10.03.2015 23:32, Andre McCurdy wrote:
>> Are you sure that excluding tslib-native from DEPENDS works? Since
>> -lts is hardcoded in LDFLAGS (see directfb.inc) the linker won't run
>> unless libts.so is found in sysroot (regardless of whether or not you
>> configure with "--with-inputdrivers=none"). That being said, I don't
>> know if -lts really needs to be hardcoded in LDFLAGS, it's been there
>> since directfb was first imported into oe-core, with no explanation of
>> comment.
>
> yes it works - tested it and made sure that there was no native libts around
> from a previous build.

That's a bit mysterious. It does fail for me.

I wonder if your build is somehow finding a libts.so from the host system?

> But you are right, this hardcoded -lts in LDFLAGS looks strange. I can take a
> look at this later since I need to build and test this anyway.

Good, I think removing the hardcoded -lts from LDFLAGS is going to be
the right approach.

>
> Greetings
>
> Florian
>
> --
> The dream of yesterday                  Florian Boor
> is the hope of today                    Tel: +49 271-771091-15
> and the reality of tomorrow.            Fax: +49 271-771091-19
> [Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
>                                         http://www.kernelconcepts.de/en

