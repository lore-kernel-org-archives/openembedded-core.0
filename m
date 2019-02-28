Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id F2A4C7C860
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 21:05:26 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id z7so18261187lji.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 13:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wGFh6cp9nQK37TggdMEINgzjU1T9H4ojmHU8TIl/o5c=;
	b=rTJ1pgM2oeqM5yVlwZYU/y2yFsmxx1gojVLcGVnBBcbQne9UDOpPtMm+/4jTXvc3Wj
	Rb2PFW6w8rNfAchRYY8H7qLSlyobKkWfEhJAY861L3FGJbuyKFkIg2WX68DkMNErD0KA
	H54SL1s6D3mlsXGw/nDKKsrb3MAezGlB5IvpXQRWdlOJwZot3KemtihpYjYx2XdRg4QC
	hdL4xFDFGA1sNbacIm6oK5cz9/N6BgqM41VvdsgFh4CkD6YeF6gYAZK5ySm8lUQba5h8
	dVVzPXpndvkQTdKI5N8qAz3BPGalsCBMnUkBsliUDgadru9GbMwqwWMxhMaveZ9xFMdJ
	/5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wGFh6cp9nQK37TggdMEINgzjU1T9H4ojmHU8TIl/o5c=;
	b=kWpkaIIlHzXE4upyd+HXiNADGfQhc6eHkF2E5eaNadsp0Mnv3n+UVW0C2TVb76C5Ve
	DASbPWciPOnhGTyf/V9LX7t3GtK1jDgsnBBViW2w7tncnJ8KOwjaW8DIjZ/GW4oeMN6e
	LkfqH7rQxYok8VL59C9m11LSArcMo44x3z9wj1QVgJz4694q7YU7iOkRkGu3HI/geUvN
	OgZSc39pCyi5PWbmzQ+tW23VnpYXQKoworpfcbfZvG5XcpZaGyeHm9gGgV9VcmJCmuXP
	3kvZnMyfo9WAW1T+T0Hlc02uCMPS2U7npODiI750gLP3QXO6kvx2O0OQUjZPXaeS2+I3
	c7ug==
X-Gm-Message-State: APjAAAWXJbjJ4S3L+FiysA2MomYhk59oaJSdGYnt1ePNU2VoRMmFvnp+
	rmX6sx8wuveKrhktd6mJ36zYUlFw4//p/BNAYbs=
X-Google-Smtp-Source: APXvYqw+3K4Ptre+EDoxSmgIxZmf5cMPxelSxN7bUEcJNLdL9xjpPKX6amnixUl9wHaLXfSz2tvPc6mAmCgzM07FAzE=
X-Received: by 2002:a2e:711b:: with SMTP id m27mr531140ljc.141.1551387927301; 
	Thu, 28 Feb 2019 13:05:27 -0800 (PST)
MIME-Version: 1.0
References: <20190228183224.26536-1-alistair.francis@wdc.com>
	<CANNYZj_Qc1in4voneFDom8pJ-rqzBQbtWQmU=ycO_v1g5N_rNA@mail.gmail.com>
In-Reply-To: <CANNYZj_Qc1in4voneFDom8pJ-rqzBQbtWQmU=ycO_v1g5N_rNA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Feb 2019 13:04:06 -0800
Message-ID: <CAKmqyKN_ZzhCD2TYiC2yGiNa-fa0Ye0bPgX8mShsoyLNF-3t1w@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu-native: Add missing dtc-native dependency
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
X-List-Received-Date: Thu, 28 Feb 2019 21:05:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 28, 2019 at 12:15 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 28 Feb 2019 at 19:33, Alistair Francis <Alistair.Francis@wdc.com> wrote:
> > diff --git a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> > index c8acff8e19..e3efd873ca 100644
> > --- a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> > +++ b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> > @@ -1,6 +1,6 @@
> >  BPN = "qemu"
> >
> > -DEPENDS = "glib-2.0-native zlib-native"
> > +DEPENDS = "glib-2.0-native zlib-native dtc-native"
> >
> >  require qemu-native.inc
>
> The dtc dependency is pulled into qemu-system-native recipe via 'fdt'
> PACKAGECONFIG. Is there a reason it needs to be in qemu-native? (which
> since today provides only the usermode bits)
> If there is, it should be in the commit message.

I'll send a v2 using package config.

DTC is required to avoid this error when building:

hw/core/loader-fit.c:30:10: fatal error: libfdt.h: No such file or directory

Alistair

>
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

