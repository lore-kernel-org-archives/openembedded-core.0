Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4A61E6FF93
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 21:55:38 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id e201so101673626wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 14:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OkIckg6HasJSGmf4Nyt+F1KMhL5+mTL2voobJipLmS0=;
	b=Toq7PMRrhY7ntCNxx7cPHd2KyKnA5xPGsRNxnFHf3a3wDVRS7TKuYDR6YcwSVGaRNW
	kZ60lXYGVYHB7BWGKgc6gjZ+qpDZHj8JrIpn9ObWIxq48HfJOsuMb965xEf+iuO+kaGI
	Ev7pxefQYOHA8mSxamy5/jfHjtO9pkRgIZFQ/k+rMeGQsWqNPBFdpmTyQE+C/VV60KAL
	/0fmEMRsyWQe2qglxEWug4Hl2VdQuLdUgS65foywWz0Ov24eeHBGhgHOyG++GeiqFjV5
	EXztK97nJzztw8keJvQUQssmlel6jY+OwCZzx+0jTZHqlQFAG7jKJ3ZizCpjskwirqCL
	eOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OkIckg6HasJSGmf4Nyt+F1KMhL5+mTL2voobJipLmS0=;
	b=mY/6o8drz5kNzl3v8wkksfzsLOyE5u0YwuXqvBwS+2Gdo2ww+SojeNp/uvEAQzGfL5
	baGolzm9ZUXpVeD4IdkSPNtUdJgpjVgjZ1D7MzKMXE+zOvU4F23DjdunY7+AGF3Drdy1
	hWWmvdKfZzdLweZQsWKYdygpmCBskvgCDj6D6jZjUJmwKjyIMzeBsFcKf/yfJfpmJAt1
	fgwXhXzMj0J8V8+89CaeLVq2ajVcniaF4PELhG1AC0X9nedzPfEEkvm6EG9r7ZMRcBMM
	zc3VBL8P40XTYN+u8unlqwjI6AsSBkRmBbcseUCv+Kci0XUyXTJGGFcUSLNAh0FcqJtI
	Ey4Q==
X-Gm-Message-State: AOPr4FWeaPA1tDXpcWW6GiqBmdbZPc8u05Ih4DcZqhhlvrrzjdk+c8uqHdFuKZPZfpz3MA==
X-Received: by 10.194.103.98 with SMTP id fv2mr17724792wjb.23.1461275738613;
	Thu, 21 Apr 2016 14:55:38 -0700 (PDT)
Received: from Saturn.local.all (212-41-67-230.adsl.solnet.ch. [212.41.67.230])
	by smtp.gmail.com with ESMTPSA id u3sm79661wmg.15.2016.04.21.14.55.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Apr 2016 14:55:38 -0700 (PDT)
Message-ID: <1461275736.6660.16.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Stefan Agner <stefan@agner.ch>, Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 21 Apr 2016 23:55:36 +0200
In-Reply-To: <9867f0e90947c89a380b578d1985a015@agner.ch>
References: <CAHiDW_FCskCiuL0bf0UwRWyR=nr0GYzGhf5fRuxMrkHz_j=kSQ@mail.gmail.com>
	<49E8A3AC-D4EF-4CCB-9CEA-1CA8E0A6425D@dominion.thruhere.net>
	<CAHiDW_EFx5JvzNwY0=MmHNaf0=MMDA1CBz6Z8o3JhbqEtEwNVA@mail.gmail.com>
	<9867f0e90947c89a380b578d1985a015@agner.ch>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: xinput-calibrator startup question
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
X-List-Received-Date: Thu, 21 Apr 2016 21:55:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Stefan

Am Donnerstag, den 21.04.2016, 13:11 -0700 schrieb Stefan Agner:
> On 2016-04-19 14:01, Jussi Kukkonen wrote:
> > On 19 April 2016 at 21:24, Koen Kooi <koen@dominion.thruhere.net>
> > wrote:
> > > 
> > > > Op 19 apr. 2016, om 17:12 heeft Jussi Kukkonen <
> > > > jussi.kukkonen@intel.com> het volgende geschreven:
> > > > 
> > > > Hi Koen,
> > > > 
> > > > I was looking at xinput-calibrator in preparation for bug 9365
> > > > "Remove
> > > > xtscal in preference of xinput-calibrator", and I'm wondering
> > > > if you
> > > > remember the logic behind this commit:
> > > > 
> > > > commit 6464bcd67d10ab9967ac83c27c413c1014be707e
> > > > Author: Koen Kooi <koen@dominion.thruhere.net>
> > > > Date:   Wed Apr 30 11:33:23 2014 +0200
> > > > 
> > > >    xinput-calibrator: fix XDG launch
> > > > 
> > > >    In the move from meta-oe to OE-core XDG based launched was
> > > > dropped
> > > >    without noting it in the commit message, so fix that
> > > > regression.
> > > > 
> > > >    Gnome-session will now launch the calibrator again.
> > > > 
> > > > The commit installs the app desktop file in the XDG autostart
> > > > directory. But we already have a XSession script for a similar
> > > > purpose
> > > > -- the result in Sato is that xinput-calibrator runs twice (and
> > > > I
> > > > would expect that to happen in gnome as well)?
> 
> It does not run twice in our case (LXDE). Can you point to the
> XSession
> script you are referring to?

This is not entirely true.

For the Colibri iMX.7 xinput-calibrator was launched twice initially.
Once by the XDG launch and once by the XSession script
/etc/X11/Xsession.d/30xinput_calibrate.sh.

The formfactor file https://github.com/Freescale/meta-fsl-arm/blob/mast
er/recipes-bsp/formfactor/formfactor/mx7/machconfig sets
HAVE_TOUCHSCREEN=1.
As a workaround we now override machconfig for our machine.

So for me the question remains if installing xinput-calibrator by
itself should launch the calibrator or if this should be conditional on
a config provided by the formfactor package.

Max

> 
> --
> Stefan

