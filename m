Return-Path: <andrea.adami@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 03F7B6E47A;
	Fri,  4 Jan 2019 12:10:45 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id j10so17453803pga.1;
	Fri, 04 Jan 2019 04:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fdvhDIRd/d3Q8Yjh6EYZW4qh37hsbk/mNOu51aDp/ZE=;
	b=DGHDp2njMSK+0ZAV4PfIE25+HKscfSTXe2YSvFlCQwcHxbbTEsS2+LvHDbTBNqI5aW
	oOhWXR6ViIIQZ6yFWcWzuUFUUMlhwksM65dLHhcFVaArIsAQH41kofLI2tT7h7u+U+Iw
	qwNpWVPj2lpSIL0hcRjgMy72V0vz5XeWFw6MUpW5cQoucyUCm86QIHx47Xh0OUlBRiSQ
	qYYJv5o/CzgZOweCgXrrnVloGQuP/JlNpV/qy/jezoE1JRKtwzSbYmw/QFZWoPyYqW+k
	dAdlOFdPFHg1dAqv1OkPwYp3oiagUK4AsKV/NH5M1fP6evUfxvcYYW5cfaSUkR6rH/Br
	oNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fdvhDIRd/d3Q8Yjh6EYZW4qh37hsbk/mNOu51aDp/ZE=;
	b=WlfXNOQs9yJQC8o2pl8ysY4i53CLeuNKlMzWbUw6irK/LvVkznFNob/zOD/DNm3sRK
	W+euiAv56vLFRsSvo7S4843RykKDfx1iQ9YToGznL1Z1n8udFtMsK0FjwwvPj+0RNhOt
	DgEJA3QXRchhdr9f3E/tyhon1bC5tMVE+WhsMj8ZfhMz7pRnNDtdlkOANgcR9PQcN/gI
	SS2K1bZ99pbH8XmhytUklwHRMXANOlbhi42kbCfYlTkyqVeySucwV2Pg5ugbwGPsvqOb
	vwMN1txnEquLURkgobvq/rvWezLr2Elaj1zjUn8U2mlWbcAtAw32U4dQ+I+PQkMs9/rT
	hPlQ==
X-Gm-Message-State: AJcUukfWJyEDlFpQTyv7qt5Zz3Puehyp5IOO+H3T6Mg2JMqkHAllfpk2
	SUmqsA1fh5uIxeQBDcCzjRW86UBbKzINGKXaLo0=
X-Google-Smtp-Source: ALg8bN7s4zTSvseJuF1c+HerrUp5vqX3sKTxecqw9XIrKbVo95XkcK5VrXabTTywK22YHmlH+FO+dsxpqcCEe1ZapmA=
X-Received: by 2002:a63:df13:: with SMTP id u19mr1443538pgg.294.1546603846846; 
	Fri, 04 Jan 2019 04:10:46 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sooPOtN-Y=0_cZ=Qv2viS5mwJAsm+yVsHpOJ5gpN65eZw@mail.gmail.com>
	<20190103225915.GB29139@localhost>
	<CAMKF1sqhDzQL9P1Vaw5Xczo0co_=NcP1-efnzW=tDnJT9cAq_A@mail.gmail.com>
In-Reply-To: <CAMKF1sqhDzQL9P1Vaw5Xczo0co_=NcP1-efnzW=tDnJT9cAq_A@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Fri, 4 Jan 2019 13:10:33 +0100
Message-ID: <CAAQYJAu+vBmZS731cd=0erSMMK3P6XqhkSGOH_5S=WEM90E3eg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Dropping armv5 and armv5e tunes in 2.7
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
X-List-Received-Date: Fri, 04 Jan 2019 12:10:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 4, 2019 at 12:21 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Thanks Adrian
>
> On Thu, Jan 3, 2019 at 2:59 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Thu, Jan 03, 2019 at 02:01:42PM -0800, Khem Raj wrote:
> > > Hello All
> > >
> > > You might have noticed a recent commit in gcc trunk
> > >
> > > https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b232e6b58e3766bc66fe08fdb7bcba1bdadda8a2
> > >
> > > Which removed support for deprecated -march=armv5 and armv5e, this
> > > will be released along with gcc-9 release which is upcoming and we
> > > might be able to add gcc9 to 2.7 release or 2.8 release for sure.
> > >
> > > We still have non-thumb tunes for armv5 and armv4 in our tune pack, I
> > > would like to propose a patch to remove them.
> > >...
> >
> > Note that gcc 9 does *not* remove non-thumb armv4 support.
> >
>
> yes that's right. However, I was taking this time to find out if we can drop all
> the ones besides armv5te even if gcc supported it unless there were OE users
> who are still interested in supporting them and had devices running OE
> which need them
>
> > Non-thumb armv5/armv5e have been removed due to
> > "have no known implementations".
> >
> > Non-thumb armv4 support was deprecated in gcc 6 together with armv2/armv3,
> > but there are still people using recent gcc on StrongARM - which is
> > non-thumb armv4.
>
> OK, that's a fair point, however, in OE's case I only have reports from users
> with armv4t devices, but it we can keep the armv4 arm-only tunes around along
> with the arm-thumb v4 ones
>

Khem,

on the kernel side it looks like RMK will not let die amrv4 so easily...

I still have around that Zaurus collie sa1100 armv4 and I think OE is
the only toolchain offering EABI for armv4
My plans were to lead it up to the upcoming linux v.5.0 so it should
not take long.
But all this is for fun I higly doubt there are still 'users'.

So IMHO it is premature to remove armv4.
Cheers
Andrea
> >
> > > Thanks
> > > -Khem
> >
> > cu
> > Adrian
> >
> > --
> >
> >        "Is there not promise of rain?" Ling Tan asked suddenly out
> >         of the darkness. There had been need of rain for many days.
> >        "Only a promise," Lao Er said.
> >                                        Pearl S. Buck - Dragon Seed
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

