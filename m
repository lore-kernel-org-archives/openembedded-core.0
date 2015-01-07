Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2770465CDB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 17:55:07 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id f73so851204yha.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 09:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=83XounoQppdGyaHF8wmEOPm4LfW60eVSjj81pEqMcCA=;
	b=Ur4KR37nhaGpqY6E4rSUUIMtSGAPVV+X1Srg0c5mFHvqzoSe5Q5uIcnPoXO+VaYPdj
	fDjKJ7cFedJHXIohaVZs4vREtawfVendlY6sp1D/J1zGXv2UZMpBhBc6UAnhCjhBnJQk
	WDWq5gCHvI8Lfd3zXaqSKwa1Nc4aaQnfbFrZi8GcBxOly2tlAWT9VqJhJYuQV0XXpPMv
	q0x3ziQDKNYoZSagZuqLNXrJcmDeF7bGtBeCQkzcEIZdu4KZKE2+uWBP7eGw1Zx4y2F8
	8le5czkfYt9G4p6KwUe+U10XGBphBp0u7u1OZaXzajfg5YoAqa8zLhgu029FuZ+PJVVY
	CWIw==
MIME-Version: 1.0
X-Received: by 10.236.39.134 with SMTP id d6mr3240276yhb.90.1420653306464;
	Wed, 07 Jan 2015 09:55:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Wed, 7 Jan 2015 09:55:06 -0800 (PST)
In-Reply-To: <CADkTA4M0XTK0fhtk1j-hV94Qr5TweM5VEBr-uq2Rf8edFG2nzA@mail.gmail.com>
References: <1420651519-25240-1-git-send-email-otavio@ossystems.com.br>
	<1420651519-25240-3-git-send-email-otavio@ossystems.com.br>
	<CADkTA4M0XTK0fhtk1j-hV94Qr5TweM5VEBr-uq2Rf8edFG2nzA@mail.gmail.com>
Date: Wed, 7 Jan 2015 15:55:06 -0200
X-Google-Sender-Auth: XcrfkGkWh2dHnM9U1S-5MecD0_k
Message-ID: <CAP9ODKohdyeDHi=LHc0T1n2Mq7kxLF0Hry-i2_cU4cv37D79Yw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] kernel.bbclass: When linux/version.h exists, copy it
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
X-List-Received-Date: Wed, 07 Jan 2015 17:55:12 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 7, 2015 at 3:47 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> Unless anyone needs these really fast, I'll queue the two kernel
> patches and take them
> for a spin today.
>
> I have a variant of the version.h here (and when the directories
> shuffle again, we can drop
> explicit copies all together), but will make the switch for this in
> the short term.

We have failures due this in meta-fsl-arm; it is for master only so we
can live with failures for some days.

I am happy you have something in same line.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

