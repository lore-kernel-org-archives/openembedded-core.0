Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 807E66077F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 15:52:21 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id hr11so3071087vcb.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 08:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=kSP4V3PENlzBQ7bDRgTzpL7UKcN2P3jurH/8+8foTZg=;
	b=EfFIcdUCdtLRtS5ptRnaEyLdzFUiZqvbtgEWlHOn62+OLOfxG/dCRgiidYXMYYx1HZ
	KTRLMNVgQZvGQk6vO/Qd4jHFbKupHVpL3A1GrG4Sl2p9lvtzR2QKeMPnH3PASk0T74NB
	bLJ0mkheFZaKRZsHazf/CnPUdC7L17NPpNcHxHXMQORlekxey6IB0NYEuQbbt6faVlxK
	FGeGZV5l0vFZeaSKLjMO4svhgsro/UCR562pbqGcNHOb7KifsJ+bWaPVHqJA8noH6Vzc
	TXBwjqVjkND+lCkuDiH67TkC/Ofx/wXcmsmmVKwzs6TwqtTMnpLB6/hFR2jqLpPWeBmy
	Qe8w==
X-Received: by 10.58.181.225 with SMTP id dz1mr5555324vec.95.1371570742064;
	Tue, 18 Jun 2013 08:52:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 18 Jun 2013 08:52:02 -0700 (PDT)
In-Reply-To: <1371570476.20823.121.camel@ted>
References: <CAJTo0LbHu=CyeCL=yvyBrUtc0i==ybVXQSXDVkVqMy4jsyoEfg@mail.gmail.com>
	<1371566573.6580.59.camel@phil-desktop.brightsign>
	<CAJTo0LZD46Gckm=PGRw2NdSBibREWUzJbG_zhVtcAAqtAunn+w@mail.gmail.com>
	<1371567621.3466.16.camel@localhost>
	<CAJTo0LbT7ZbbmbibLCzOvv4a2939-Hr8uGEoUqg2sRVgEOCqmQ@mail.gmail.com>
	<1371570476.20823.121.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Jun 2013 16:52:02 +0100
Message-ID: <CAJTo0La15PruYdx+w6QKptep3EunCQRBF8AQO8Y3R9UjuY+H9g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQnrTjOrUQTpGfDspTtjK80H7SppZ8x3irL5vmpa54TyWWi0jKTlb0B1KVk8Czq9RyVN5zwq
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: magic libtool .la removal
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
X-List-Received-Date: Tue, 18 Jun 2013 15:52:22 -0000
Content-Type: text/plain; charset=UTF-8

On 18 June 2013 16:47, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> So I don't see the pressing need to set us off down a path on our own.
> Yes the .la files are annoying but they're not that much of a problem,
> are they?

Whilst the separate build directory work is a massive improvement,
there's plenty of packages that don't do B!=S and use libtool.  We're
not alone, at least Fedora and OSTree both wipe out all .la files.

As B!=S should solve this problem and others I can see the argument
for spending time making that work more comprehensively though.

Ross

