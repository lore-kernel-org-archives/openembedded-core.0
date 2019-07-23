Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 371D47ED48
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 21:36:58 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id z4so43430781qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 14:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XJ1TA5no89GSPO1zO0ILyDUPlsq5QlJw/3+wZs53nYA=;
	b=PKGF8bFUL32UbjQyKC20Ep6QJZbHfZc2H4kJIjHJQa0UAZM9qLBoCtgQmktNpLAEoY
	rK+3FzBEm4YRwwsyGzdPs37+zqXWxLVM7vsdtsYCTgaAF2RlkClV6biyTBEIDmbp25UT
	viluDtfC/pqk2v9YimJw1+mmsjWWCvAFWYAdkhgbGRcFpo+NvO/xN1rBMu9PdoZ7yFTw
	LcgLCiDyaAmKh/mpgv6RVthUuqUnikZQ/o4lXzth/MRpGRqHeNbO9X+Sns8njY3Q+yoy
	MdAVIzpnHCQeD/b6cl3n4GWVl9FDP/IfNBdVbs9CixOx3b3gnoAyJyB/5e3l4qtN4yJ6
	F7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XJ1TA5no89GSPO1zO0ILyDUPlsq5QlJw/3+wZs53nYA=;
	b=GRPoSGtao27hav7p8ReaA/7TeR+q7lgAbMX/EvR2I0ZM/Ak04weoTfZcGogywiXaB7
	xZq+tdVjz9NsN49HyfcMbDS/Tbxmv0qGXBt+hY/5ZZgIGro2SrsCHajsOlE9hOHygCcc
	v6BrAvLwhl4OE9EMlYTFgTITAS2qjuWhJTQDhd1+JU9x8u+wM927SMbF5fNGwhFpzeWd
	q9xAavKk2VEMb1ylUNarVIlkz6L2jZBeX9eTlfCXATBWDdnQPIy3mSvas9bsO3F1KmzT
	JJBIpYLj5gUNn8+nBncdYgrQIJaAIzXCb/FcMgxkHVZvPCtmJqeb2SeIQpqeZ35BvjzL
	2tUQ==
X-Gm-Message-State: APjAAAUaYtewZBAF6cf5hy2k2n5vNycuaLMhTviUXfKRZEe0J3/eQ6UH
	VSpEhSfhw7gTTqRGmbVY48c6ip8w+1FrLyZuz0o=
X-Google-Smtp-Source: APXvYqyAzfBiavIlo4QjjOtr7wzqseJZhC6uCEY276AaDuaTiwKKopPDEg01N4Y8tbOWdqPEKH8ybRpi3AVt2UKkduw=
X-Received: by 2002:ad4:4112:: with SMTP id i18mr56457927qvp.175.1563917818781;
	Tue, 23 Jul 2019 14:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190722144809.14972-1-ross.burton@intel.com>
	<f4a6845ad7408e22bb84a85da103f53ffd5b1736.camel@intel.com>
	<CAMKF1srhurgFYqP0sEgdHn7jpYY44ihY=3r2Y=hRz_R21Rzi1w@mail.gmail.com>
	<393734e9ff3b6095b159744b01405a0b0616269d.camel@intel.com>
	<CAMKF1sqQ2SSdfj7BYnTnzHuScw8Fucxhhd7kwuragxF+y7nufg@mail.gmail.com>
	<CAMKF1srgRYSK9DXBVet23Re8fpwxbrh38q4sKYG2eE-jF-vz1w@mail.gmail.com>
	<CAJTo0LaH+-poVSJw-DPup=z2_73BLkMYfgLcCrKLujcknTwN6Q@mail.gmail.com>
	<CAMKF1sosDwZnprgxsq6NjgYxnNsN-Xqzk8uGcb+gwiiDhPwReg@mail.gmail.com>
In-Reply-To: <CAMKF1sosDwZnprgxsq6NjgYxnNsN-Xqzk8uGcb+gwiiDhPwReg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Jul 2019 14:36:42 -0700
Message-ID: <CAMKF1srummNiXg9H1O1r49bKNzdCTgmXjNDH0CEGfs-gQY7Jog@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libical: upgrade to 3.0.5
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
X-List-Received-Date: Tue, 23 Jul 2019 21:36:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 23, 2019 at 2:15 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Jul 23, 2019 at 2:12 PM Burton, Ross <ross.burton@intel.com> wrote:
> >
> > The last release of Orage was four years ago: I suggest removing that
> > from meta-xfce instead of keeping everyone else using an old version
> > of libical.
>
> thats the latest unfortunately. I think a simple fix would be to drop
> is_utc field  setting
> in orage since it seems to gone in libical3, I will try to cookup a
> patch and try
>

sent here
https://patchwork.openembedded.org/patch/163311/

we can merge libical3 update

> >
> > Ross
> >
> > On Tue, 23 Jul 2019 at 22:04, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > this is causing a failure in meta-xfce
> > >
> > > https://errors.yoctoproject.org/Errors/Details/253910/
> > >
> > > On Mon, Jul 22, 2019 at 6:12 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Mon, Jul 22, 2019 at 6:05 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
> > > > >
> > > > > On Mon, 2019-07-22 at 17:59 -0700, Khem Raj wrote:
> > > > > > On Mon, Jul 22, 2019 at 4:17 PM Mittal, Anuj <anuj.mittal@intel.com>
> > > > > > wrote:
> > > > > > > On Mon, 2019-07-22 at 15:48 +0100, Ross Burton wrote:
> > > > > > > > -LICENSE = "LGPLv2.1 | MPL-1.0"
> > > > > >
> > > > > > this should be MPL-2.0 | LGPL-2.1
> > > > > >
> > > > > > > > -LIC_FILES_CHKSUM =
> > > > > > > > "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
> > > > > > > > -
> > > > > > > > file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
> > > > > > > > +LICENSE = "LGPLv2.1 | MPL-2"
> > > > > > > > +LIC_FILES_CHKSUM =
> > > > > > > > "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
> > > > > > > > +
> > > > > > > > file://LICENSE.LGPL21.txt;md5=933adb561f159e7c3da079536f0ed871 \
> > > > > > > > +
> > > > > > > > file://LICENSE.MPL2.txt;md5=9741c346eef56131163e13b9db1241b3"
> > > > > > >
> > > > > > > Should this be MPL-2.0 instead? This is causing warnings:
> > > > > >
> > > > > > the license is MPL-2.0 but the license file name is MPL2.txt so this
> > > > > > seems fine.
> > > > >
> > > > > I meant the field in LICENSE. Quoted the wrong text.
> > > >
> > > > reply quote confused me. yes it is wrong. It should be MPL-2.0
> > > >
> > > > >
> > > > > Thanks.

