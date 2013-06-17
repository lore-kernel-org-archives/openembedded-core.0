Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 712E46098F;
	Mon, 17 Jun 2013 00:02:43 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id id13so1575803vcb.13
	for <multiple recipients>; Sun, 16 Jun 2013 17:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=GZfkm6sjxsQacIRGYp8U3IQRojRSOvqOzpQ7qSIAR98=;
	b=am7TWuOkR7+NabB4rYTQsHTeJfDbhGMgW3l2DluEI4VsFh1AMWkz7p+Ot62aEqYvRX
	52qClBmrJJjqGMvm37Vu7blXpilehiVq2v1xerVGGpmzwe5ZLmYmJGB2qugCrpOx3FuR
	4LmlsGiV95Lr05msEQobg3fnoahehNUilYmJnHY2idmMKoVqcHd2DPan74niRhHMKZws
	myuT4zhesBt2/gokBWEP0ZAu3O/XNUXrb1woilgQesAvRKU3h+08BQ6aFoQcgBHat119
	vVqDRdO7oglYwzunkjwYU1k2CUMPtdTqHYdEMnbsc0YOcKcEmKcJFq/bhCn4+59q7uaL
	z81Q==
X-Received: by 10.52.0.130 with SMTP id 2mr2876408vde.97.1371427363953; Sun,
	16 Jun 2013 17:02:43 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Sun, 16 Jun 2013 17:02:03 -0700 (PDT)
In-Reply-To: <20130611160434.GI3233@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 17 Jun 2013 01:02:03 +0100
X-Google-Sender-Auth: D4Px12JmMwCHVVteFD3z6N33PPI
Message-ID: <CANyK_8dActF1_nuvK29WMdr-Kh1DONoRXB2YMXqVj89AKmEWYg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world
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
X-List-Received-Date: Mon, 17 Jun 2013 00:02:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 11 June 2013 17:04, Martin Jansa <martin.jansa@gmail.com> wrote:
> There weren't many (any) changes merged to meta-oe last week, I hope to
> get better builds now (started few minutes ago).
>
> common:
>   meta-openembedded/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb, do_package
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb, do_compile
>   openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb, do_package
>   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb, do_compile
>   meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do_compile
>   meta-openembedded/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb, do_compile
>   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb, do_configure
>   meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb, do_compile
>

I decided to do some prodding around into these.

samba: builds for me, I'm not using gcc-4.8 though
packagekit, gypsy, omgps: Reference deprecated/removed functions in glib
tk: tcl is version 8.6 in openembedded-core so can't build tk 8.5 anymore

I'm currently playing around with upgrading packagekit to a more
recent version, will see how I get on. I'm busy with other work at the
minute and openembedded work is just a side project for me so it may
take a while...

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

