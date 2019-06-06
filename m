Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3007E7C860
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 18:44:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45KZM05w4lz3L;
	Thu,  6 Jun 2019 20:44:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559846653;
	bh=ufsj7fZASAa3Sl3l2S2kjwSyP7QVcdr+2c2BRAGmgRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eB5uYRC1eIVme3wCjfjSfqG2DMfz9Yg/CjSXC7DIhJ4WAreXvDDbZskftYFAaYGFR
	A/ySrvrph3udpsdeSXkTCfXL+vUnLAuENbrNDOQ3eCAW8Gi3dwOv9NfNWUPx0bhkMJ
	og40vA5roVNv0K7a1vga/+Kd9leWMgFw+rtFmcf+6dj0xWG4429AoaLrR36CoUg4+i
	vx96S2hvLgY+sOo0R0/6h9j8grFQ+OEh09dHTdTujIR5TjFXmbn1nyo3KUByAiUIwe
	H4aposlTFgmnek+NFF1dsfCyuqNwUtoq5dYj2fFwhS/li2esMR3D8+jN3HutO1e5sl
	PPqXQ4/9XPD9XZwp39S+tFpEjWD2hypLedZyeO8aA/YjDe6FrMW6tjgzKV1QYE1FMi
	VvO0/HlOKLZxI9/tjoQRFncEi6ZBI3ItXzXk2ekMJhCR/aXyktL5zScU82mxoWWfHR
	tva51lwFss2C7HyqWkwZXcs8ZJ1N6iPMejhHLrz4IfZzUaNxBI+L/KQ2Zxk+gzs/JV
	1kmCF4/2Uo+fCQmjBqTw3bl+q5QGmwlvedWuoFavSxyoQxMfeU5tSUnaMzjfo3Oxjl
	c07xPS6NpE9qqkgtZ9+DsBuyMTtxKPtVeW/HJhVsbXPxnnsmNnM2aF4Md1q/SjBte+
	Lh0btZAJQDruHKntbjMpN17A=
Date: Thu, 6 Jun 2019 21:44:10 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190606184410.GA5907@localhost>
References: <20190605184116.24297-1-bunk@stusta.de>
	<a71198580613e3ad0d8ce05717e56a27db9a5e21.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <a71198580613e3ad0d8ce05717e56a27db9a5e21.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Remove manual RDEPENDS from PN-ptest to PN package
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
X-List-Received-Date: Thu, 06 Jun 2019 18:44:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jun 05, 2019 at 08:10:31PM +0100, Richard Purdie wrote:
> On Wed, 2019-06-05 at 21:41 +0300, Adrian Bunk wrote:
>...
> > --- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> > +++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> > @@ -44,7 +44,7 @@ inherit autotools gettext ptest
> >  
> >  EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
> >  EXTRA_OECONF_append_class-native = " --without-bzlib"
> > -RDEPENDS_${PN}-ptest = "libasm libelf bash make coreutils ${PN}-binutils ${PN}"
> > +RDEPENDS_${PN}-ptest = "libasm libelf bash make coreutils ${PN}-binutils"
> 
> Won't that need a += there to preserve the class definition?

Nice catch, v2 sent.

> How was this tested?

It looked obviously correct (famous last words...),
and I trust that this is breakage that would be
caught on the autobuilder.

> Cheers,
> 
> Richard

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


