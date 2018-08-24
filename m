Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 58340793B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 16:24:11 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id f19-v6so9319827qtf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 09:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vRJUgG5p3isc/is/cuEV8rx9Zojn8jw+ypkuNLNfGFg=;
	b=bUMDsOFr8cHlOlK3NgQKim4noxiBsnk5/ejkbGwDleeRdgRceT3m+o0WCmkNei33rG
	ivB10CYZHDRuBTXfVU7Tq10MRarAEbpxz+j4I3GQtdMWl40c6EEO/0EGxAnXiCcTn+7s
	FEXOwtG/zORZpjIr/xa6CcBX+BvxBoDkIUMOMPl2ubw20ikDKnaQVA9pxmYdtbRU2ToI
	dW9YWV6Jp4Nsxkp3lbrsshOBbFZWV9/mY55vmkjkgWEcsWdFKA0nh4KHIJs7yRgTYHSC
	pu6l4zb1YhNtmo9gHQL5IIqozXgGncAHH/4TiKDiEnlMkyE26oT3SUADdljIjEHqcJzA
	1aBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vRJUgG5p3isc/is/cuEV8rx9Zojn8jw+ypkuNLNfGFg=;
	b=VTxomTxxaV7lMsUyNrNDa6xws1sruC5oIt6GI2eKygAMOWDlAjfp9cL+nDyprh6DFM
	Uy05vbfw2q+Gx0gMWoP4rr76enVZbT85JExigKUTJJPGhLeZX0KpR3GBr7fsdgzTF27o
	EYXZjpbab4FyaRjtIvZaS1MyYURptt49qlhkB9F8ClmP9VmcqxxMKXPgx8eUMM/E+Pww
	ecNuC/GoBfY+TTBhUtKA+FcBwAquVuy+NVzDes8WONwqaoF/a8wUEmn9barQTxoFetqR
	a6dJzaLYUWXUC2/mLcU+5CmGp7w8Ep0EsI+tzeIMoyE61aGgR6/Px4UeEbvOc+pSCl+p
	BgTw==
X-Gm-Message-State: APzg51ABLMVSwMnnJUZbAvdvML6eFEvzpLrp6dYDhVZRFBMpc2ApS0+7
	Iwe7ayypGE8xj5KQeDMrcbkqXpEUaFDxsBXzKdQ=
X-Google-Smtp-Source: ANB0VdalDb2fTbyJX5kg5K9eXZx/YQympwMD6mXeTrIed6UO6DKXamF+MAwyaKdyHf8un/CZuGO5pT8dGgAEBQn62o4=
X-Received: by 2002:a0c:f94e:: with SMTP id
	i14-v6mr2615295qvo.50.1535127851962; 
	Fri, 24 Aug 2018 09:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20180824123346.8602-1-pascal.bach@siemens.com>
	<20180824141512.GG20864@hiutale> <20180824144323.GJ20864@hiutale>
	<355BE46A91031048906B695426A8D8E61B8A14FB@DEFTHW99EH4MSX.ww902.siemens.net>
	<20180824154822.GK20864@hiutale>
	<CAMKF1sqc6fQhZfSKZ80D2dyHL_D=2hRAS1zMFKScP8MpXgQRbA@mail.gmail.com>
	<20180824161727.GL20864@hiutale>
In-Reply-To: <20180824161727.GL20864@hiutale>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Aug 2018 09:23:45 -0700
Message-ID: <CAMKF1soK8gJP6NNwX3-7EWESEs11czMpi_qt5HBMJXaRp6tXAw@mail.gmail.com>
To: Mikko Rapeli <Mikko.Rapeli@bmw.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: add CMAKE_SYSROOT to generated toolchain file
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
X-List-Received-Date: Fri, 24 Aug 2018 16:24:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2018 at 9:17 AM <Mikko.Rapeli@bmw.de> wrote:
>
> On Fri, Aug 24, 2018 at 08:51:42AM -0700, Khem Raj wrote:
> > On Fri, Aug 24, 2018 at 8:48 AM <Mikko.Rapeli@bmw.de> wrote:
> > > So to me it looks like using SYSTEM with target_include_directories()
> > > is no longer possible with CMake and gcc > 6:
> > >
> > >
> > > https://cmake.org/cmake/help/v3.10/command/target_include_directories=
.html?highlight=3Dtarget_include_directories
> > >
> >
> > That=E2=80=99s right there is a patch I did  in WebKitgtk recipe in Oe =
Core you
> > might want to include similar fixes for this package the patch actually=
 it
> > a workaround but then I also think using isystem in apps is a bad idea
>
> Yes, I tend to agree, but developers have used this to silence compiler
> warnings from system header files.
>
> In a few cases I saw that there were no longer any warnings coming from t=
he
> headers but in some others there were.
>

Unlike olden days, cross gcc compiler now a days knows about its
system headers and adds them implicitly with right options
so doing this include dance manually is not useful. Let compiler
decide to do the needed
for system headers, one must just specify --sysroot and let it handle
everything from sysroot.

> Any other ideas how to suppress compiler wanings from system headers?
>

what kind of warnings do you see ?

> -Mikko

