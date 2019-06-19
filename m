Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id D5D257D716
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 11:20:00 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id h6so37298094ioh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 04:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gt8sDNblyH8Tns/TZFnErL8wXBE+g/EnSvoc7PqWTlk=;
	b=w10Z4Achp7GrojgAaqvxNqharzvgU5jrmSxMlq4wcdWPYWozxWNNtX9nSfTO2Cu1Fk
	KTlayOOBrqW+fLghivPBF68Nb+/E5jAdissL+naJgPahOuCm0Lt0wFGYK8j1aXtqflXh
	ogAxwsh1JEXH2Y7x7A3u4pd3oAMPADbCx+bU5+FNrh/v2BXBELi0GiunItrO9b+YMBRj
	08dAJtGssXr52QOA3m4ZtX5hzCycXr/dLX7dt60h2822QAwjxPnQMgdLePmO82BlEVTF
	DpsloDgfV7uI5prSeTUXtkx5XIoSYW2eH+EpQF449so+UZThifjT1bHy75I0VBDIOWrs
	uJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gt8sDNblyH8Tns/TZFnErL8wXBE+g/EnSvoc7PqWTlk=;
	b=fAjxaK+7mP7Icv7RaHAJewczrjmqfgU7CAPjfrbIhGkTXoPl7OI30sITkmNQRdqZSO
	lNbULarf67R6yeZ5TxRBANEXv4KZbr5ZV5vIF/pmWRVRbZzmjHfyXAnAz4pzyWqKraJK
	BVU9a112gXZzblFy8eYRselSeVrEcPmOyPP+WNJNCzfG91EDADxpS76pHiEp4eOF0+jv
	MzjvRTnMBKHF/lBnp+PiO10yy8gCWEutOorVudt5fAc6Tx0ug4Fpy5FDwCk257KnXKzX
	AzueLccgohk+1IMZWMrO95Qj8KoPR2K9m964FlezFWX57d9nYccb2IaPoFOJidHFHTtZ
	wKWw==
X-Gm-Message-State: APjAAAVyjN057CJsG4ykeBZ3Ci1BdViaOYouf5ckf8a39oy1Gyx3OYMA
	88/+4uw+F9qMHoVutPi08zyg2Lv25saoQ5XRjB2mTQ==
X-Google-Smtp-Source: APXvYqyz0JcDLXEwoCpNLorIawZSJIoTNlQlnJFMfb5MJj9BnyrpGD8Jif2PpAUUC66P++SeXCRP118x2INpRxb8Bv0=
X-Received: by 2002:a02:3093:: with SMTP id
	q141mr42129021jaq.128.1560943201849; 
	Wed, 19 Jun 2019 04:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190619103251.28854-1-ricardo@ribalda.com>
	<20190619110446.GA20319@localhost>
In-Reply-To: <20190619110446.GA20319@localhost>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Jun 2019 12:19:50 +0100
Message-ID: <CAJTo0LZ-rkqsYNa6RZ8kvf8iDK2k3PEh1T5z6Vv3bF+wAGaoaQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dpkg: Use less as pager
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
X-List-Received-Date: Wed, 19 Jun 2019 11:20:01 -0000
Content-Type: text/plain; charset="UTF-8"

I'd say we can assume that less exists.

On Wed, 19 Jun 2019 at 12:05, Adrian Bunk <bunk@stusta.de> wrote:
>
> On Wed, Jun 19, 2019 at 12:32:51PM +0200, Ricardo Ribalda Delgado wrote:
> >...
> > --- a/meta/recipes-devtools/dpkg/dpkg.inc
> > +++ b/meta/recipes-devtools/dpkg/dpkg.inc
> > @@ -4,7 +4,7 @@ SECTION = "base"
> >
> >  DEPENDS = "zlib bzip2 perl ncurses"
> >  DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
> > -RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} perl"
> > +RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} perl less"
> >...
>
> Is this part actually required?
> busybox also provides a less.
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

