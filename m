Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0E51C7D03B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 15:08:43 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id z126so15224883itd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 08:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=dFyLIaoPlG7cVb6SM0Id9JwfxpU2IN9vwqgATdMb8QY=;
	b=hIrZ/LycA+IxD8TX0bkLdHOKylzdAooePwbXNuFPVgPs3phpWoVXROQOZ9VVVcpC8Y
	n55QnIN1kj6g2kQlm0RxbxlaTawPynDGjXznI1A9gnO0YrZ41MZ81KEkNp+9YIZ8ANdm
	BOEYy9NPEJBCbnkYSKQu1Id1d9J9MiAYpyhsfahxpMCXX7l7yQprhrLU+WC4k1xCU0a5
	j51N2BZ09DpMHTQpv+iMtcELkXK2+Pjyzupx1FkkACfVuUnWH/dOLmV1lkjeJV2KMwkY
	M1nO5Z+/uCwxRE2TYjqhCspMBf04fvAvia5S+STATcMomJgVawg5u6RVQFTEREOhBl+8
	8Lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=dFyLIaoPlG7cVb6SM0Id9JwfxpU2IN9vwqgATdMb8QY=;
	b=dLbRocZRJXDhznfPtNcxpvA63RjizA7xkAimCPr4Wj42DilYqKAwtsNSEMJ+7xOvs8
	qZ4rggfvzm6anpURceM8b5EoSA2g09X8ElGjVoiO7KBy9kgEQG/ME9NVE1SfdRQqVkfA
	nd6KE84A3Wx6t1RJX7zTEtMKgUM+xSud+znml2BmTtPen0oGhA3daw65sdF99+j7AhSj
	0NswGaWG5U1qZ24GFUaQLOgsyhF20E7MrGr9LIRJh0NfZhlVuxtTXTQ4VxzxUm6J7KLC
	RQnFBbhiXJk2/pfqqBMVjn9ryakaj2U6vVQklBmd4u+YnneuaJHNb2sBpU29fX4OAqy2
	0pUQ==
X-Gm-Message-State: APjAAAWHDKM0Zxm2Ymdm/5xCTD8bjoFYBO4GMu7ZhUNv3a5GMMcEPnC8
	EDiaXES+SZTlSlem13AqfFhnoN2tMEKMJEHhoFY=
X-Google-Smtp-Source: APXvYqxnoNHpDwKVz9wEXWHoAFU1zvLrp5PL28Ip7lzcJjwfXiCzrGLjy4IHJw/CmaH2Q/dBIgI1b8Yx9+L3j79SiZA=
X-Received: by 2002:a24:22c5:: with SMTP id o188mr17386694ito.68.1554131325013;
	Mon, 01 Apr 2019 08:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190401135217.17431-1-schnitzeltony@gmail.com>
	<20190401135217.17431-2-schnitzeltony@gmail.com>
	<CANNYZj_ndpKB89k=jdqaLFc18k6VF+0pnOh51eTM8TaQpeB6bw@mail.gmail.com>
In-Reply-To: <CANNYZj_ndpKB89k=jdqaLFc18k6VF+0pnOh51eTM8TaQpeB6bw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 1 Apr 2019 17:08:29 +0200
Message-ID: <CALbNGRRKz2hh5y20i2eNErHOkFTcsgoZ1778zqmGF1_xEqgtWg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gobject-introspection: auto-enable/-disable gobject-introspection for meson
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
X-List-Received-Date: Mon, 01 Apr 2019 15:08:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 1, 2019 at 4:56 PM Alexander Kanavin <alex.kanavin@gmail.com> w=
rote:
>
> On Mon, 1 Apr 2019 at 15:52, Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
> > +EXTRA_OEMESON_prepend_class-target =3D "-Dintrospection=3D${@bb.utils.=
contains('GI_DATA_ENABLED', 'True', 'true', 'false', d)} "
> > +EXTRA_OEMESON_prepend_class-native =3D "-Dintrospection=3DFalse "
> > +EXTRA_OEMESON_prepend_class-nativesdk =3D "-Dintrospection=3DFalse "
>
> Sadly, unlike autotools where the option name comes from a common m4
> macro, this is not going to work with meson. There is no common ground
> between upstreams on how to name this option, and so you get 'gir',
> 'with_introspection' and anything in between.
>
> A better approach would be to introduce a variable:
>
> GIR_MESON_OPTION ?=3D 'introspection'
>
> and override it in recipes as needed.
>
Had an initial version like this - but shelved (or lost) the idea somehow.

Agreed: V2 will follow.

Andreas

