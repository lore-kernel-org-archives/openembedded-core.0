Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA1E7C3D9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 17:41:55 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id w204so2613984qka.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 09:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j1JbS3v09p5PzXoMZP02uV8/T7ifI70BU5n4bmKHjsE=;
	b=sXLRrGcI0Eq2sDAlMly0eIZUQq68jn6IAjKrJ7dGCfzzsM753ddpumzkoWr8WCS4hO
	6rKPrZu82Go7xrWTg+FOAG7r81Y4Q2UiuMTcx2BvlWqjSBtHEAXfNH5koBwIZfFlMtYC
	aK6Tgkpc1tuAZ7XvhJEhC5MN0OBJ+bGwGseBxt73KHmmsX4vU6qQ0vay9XUMj15lBiub
	JxFeQwEuCrSPUWmYmTOtS4WcBer1B8EfJ5qfzGMxy/ItjmohkkMXxqleeFAKMzFjbmu+
	vNx8++Y5kNvJF41V4XYnqr35fGzXZ/NgpYSiC4jLFp/4q0SprwqlJFYpntWIVSUyE+4E
	PkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j1JbS3v09p5PzXoMZP02uV8/T7ifI70BU5n4bmKHjsE=;
	b=gytlF0+hNqdxSXW60HqwoUDU/ZWm9HCYyaoHC8fzGpPu7HUvVztPlL2zOQjPLAYcMt
	fUi7UOqnhaxChuVlUUjdSfn5HvXNluhIiIdNDILAQK+qe7++1bPbv6WtnF4ZJ5qMQ5wp
	yNOLr0vtFYaIV602aA8vcWA6e7X1hWPIzpsW2jQh5wlj24EHFNHaIdkqx3txOL89PMoa
	LNLd556HkP9XkSLNI/zbowCUEpqY5Br7vLm4mpuCn+xyqJtHa7cho7pKiOFC1gqBKS4B
	cj8sbSqJv2Ryafpt16TFKpBnwAyR3d2megV3+giRN3BUPHp9am2J2609zlgtmKStMST5
	IDxw==
X-Gm-Message-State: AHQUAuYeZaqY5+IrlUKInDVl4muqACL4dVFHrtHdBn6+icu42A6waSf5
	2Gzgt+CDwj8HvGqkWN84mvO1JPAZOckB3VxrMxM=
X-Google-Smtp-Source: AHgI3IYKI63al8hvWF6trnE3dSiinrEXTjgBAQ2LH6+OzDfBHDQrdwfPJ9UmwokEiy0tPKOsd6qBNhSvz9oEc9hLzwc=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr16673230qka.206.1549647715999;
	Fri, 08 Feb 2019 09:41:55 -0800 (PST)
MIME-Version: 1.0
References: <20190208153221.4335-1-abrodkin@synopsys.com>
	<CAMKF1sqY_1h8j2KR322gF8swrvFapx1mJvicHn-U3bm0+m4-7g@mail.gmail.com>
	<4881796E12491D4BB15146FE0209CE64681D6A80@DE02WEMBXB.internal.synopsys.com>
In-Reply-To: <4881796E12491D4BB15146FE0209CE64681D6A80@DE02WEMBXB.internal.synopsys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Feb 2019 09:41:30 -0800
Message-ID: <CAMKF1sp8g3AVQUQY-qiKSw7PpO1Su1NRavA-eW7yN2tnAcOnwA@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Vineet Gupta <vineet.gupta1@synopsys.com>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto: Add dependency on libgcc for ARC
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
X-List-Received-Date: Fri, 08 Feb 2019 17:41:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 8, 2019 at 9:35 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> Hi Khem,
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Friday, February 8, 2019 8:28 PM
> > To: Alexey Brodkin <alexey.brodkin@synopsys.com>
> > Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>; Ross
> > Burton <ross.burton@intel.com>; linux-snps-arc@lists.infradead.org; Bruce Ashfield
> > <bruce.ashfield@windriver.com>
> > Subject: Re: [PATCH] linux-yocto: Add dependency on libgcc for ARC
> >
> > On Fri, Feb 8, 2019 at 7:32 AM Alexey Brodkin
> > <alexey.brodkin@synopsys.com> wrote:
> > >
> > > As of now in case of ARC there's no in-kernel implementation of basic libgcc
> > > functions used for millicode, multiplication, division etc instead we simply
> > > link with libgcc.a which provides everything used by the compiler.
> > >
> >
> > this is something you would be fixing in kernel eventually?
> > we can carry this as a workaround until then but it really needs to be
> > fixed in kernel.
>
> Well we do have it in our plans but given this is more a nice feature
> than something critical (as currently used approach with libgcc works
> perfectly fine) it might not be done very soon.
>
> Thus we'll need to keep this work-around for now.
>
> BTW exporting of libgcc parts into kernel means we'll need to
> keep it in sync with real libgcc later which is not optimal as well.

aarch64 kernel also bootstrapped with lbgcc for quite a while and then
moved away
I can understand that there might be bigger fish to fry, but this is
not a insignificant issue
where you make kernel dependency on toolchain runtime go away.

>
> -Alexey

