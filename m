Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 03EB5619CD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 15:20:20 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id a4so7214676qto.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 08:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bN5MkZd4yGUdc84yOWTrNgADd6WVMuq47MOaZcmYP14=;
	b=M5OYfJ9wt+EOdpyJuyRY1feOVURIeQmbQ8i7++HiF2pHzTwB8WdnB9VImNfbaB/m8F
	xuKJ7hNl6Sqog9yX7/mX/NCBikeMgvvH66XsGS4N6pv61VhFFGet1oAl79PhakLFogFF
	mmhGDI6GEpn4wlpAoc550eWZrZ/dycxW542pyJucY1raSdy2Eqxez73N4c/3NYlfwyIt
	i0qekjFzUyM6Ym8lKAkUoFkC0rfFfNDJ9S/8kwfU6+Wqw8enXnCehQlGMTzJguYirTDN
	G3XpC1Ftxv8wYpVtHgTDivMadbliDqCKEvxkhJGd09AbXccFhsC5BN9TJhZsAMbFPBmr
	vJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bN5MkZd4yGUdc84yOWTrNgADd6WVMuq47MOaZcmYP14=;
	b=Jo5TjFp568muOiaJ/n6vEbHf5Jeegp7vZB1ZzHmJxKXwGxnSz0Ama+tUsS9RNlqzSq
	1Hw7ljTEkebvasl7LfeRdxOmO5gw+aaz0J9cTkEpjjAvPPu03mthZKBeFfUo3MynpIFW
	6BIkzNI+LhXhwe6OxrYYQZbR1GoVk8CpgRNIGTi4/+u+MBmyvUut/batLYsG76ypmaeb
	gymSl1erpnqKtvKK1qR9vhF/I0OzchK569CJWY4Uh1KM/924OV7jeFyUxA42FYzmKJKN
	T3k24H0D+JdtIvLPjUqqoYhpnVLTAukOmolEHrncaFR1DxZ4G/2KwRwPG6AkbYzqhNUy
	LJyg==
X-Gm-Message-State: ANhLgQ2kyla1Rn88etsLsW/po1oznIoQpyoOY9NIV4a8tYwBO4t4ab+9
	k4aJq4Ix4QC5xAEZTSl8Wi1xhwx3UlpfpZc4Ekw=
X-Google-Smtp-Source: ADFU+vsHEpQGfCf//YVYO2VSzULYE/fnlqkgIrc7Gh2gPOsaKm8H5iqrYMXR/XXrXufWXW7HyzM2o+2PrEAOM5MyPlg=
X-Received: by 2002:ac8:70d4:: with SMTP id g20mr15087062qtp.146.1583767221563;
	Mon, 09 Mar 2020 08:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200307223748.1178851-1-richard.purdie@linuxfoundation.org>
	<CAMKF1spC7POwDTKYGVuAZdZDfYDfeGMz6qRsq4hB3hY-F1aN6Q@mail.gmail.com>
	<c1b7a7ed56b4a8963fecf1c016b6ebb7d0781c76.camel@linuxfoundation.org>
In-Reply-To: <c1b7a7ed56b4a8963fecf1c016b6ebb7d0781c76.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Mar 2020 08:20:09 -0700
Message-ID: <CAMKF1soBKiCcr0igT_CXv882O9Mq-v8fCK_d6L15xVz4NgJGWQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] glibc: Explicitly disable msgfmt
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
X-List-Received-Date: Mon, 09 Mar 2020 15:20:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 8, 2020 at 12:18 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2020-03-07 at 20:17 -0800, Khem Raj wrote:
> > On Sat, Mar 7, 2020 at 2:37 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > If configure is rerun it finds msgfmt from gettext-native which is
> > > installed
> > > during package_write_ipk|deb and means builds are not determinisic.
> > >
> > > Whether msgfmt is needed is debatable (libc.mo files arne't
> > > generated without
> > > it) however we should at least be consistent which this patch
> > > ensures.
> > >
> >
> > I think we could turn it into a packageconfig and add depending on
> > gettext-native in knob,  keep the knob disabled by default. While
> > dont think translation files will be commonly installed on systems OE
> > targets but its seems limiting if we simply disable it.
>
> Keep in mind that currently in any build from scratch it is disabled.
> This patch doesn't regress anything, it just ensures builds are
> reproducible.

Yes I understand that, I was just wondering if its going to cause problems
for folks who has been relying on this behavior

>
> I agree if anyone wants it, we can add a PACKAGECONFIG.
>

perhaps acceptable for now.

> Cheers,
>
> Richard
>

