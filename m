Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4C1307D06C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 16:21:26 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id c4so8241506ioh.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 09:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=TXzU5iPlf2vlo5k1yIBLnKb1yLMkaHtxWdYNrIhAWGI=;
	b=LZeV+DfGZOiZeWG+oBpSdX1bQw1dVRn/uYVKk9CbxZNXPmrkFRNWE2Hoj5iYSfOn+O
	73rq1lu0Cet7douFc4mbTOew78OmL45ixdGtQgERMNl6tskTFLqD2NzRRTru+E+2TvOG
	17uNiso00MwVFQxEhW1d6r6jD51u1fLdnndFbsL5bNhQdwgZUuSVQRRgz1fBwDrR+ROr
	sN4oC6SZ9VdZbYxEAwgNz8rOFidrqUEb9yfHYYKHz8MEZqmGHvRMAhHYyp7VLftAcYtm
	JD4Qcl4lOkrVG4gNi4/fm8uHTl9mBO5JWSScxhrPwQ0VgYVwK6I0+uz4dh1KPxibpWUk
	7ZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=TXzU5iPlf2vlo5k1yIBLnKb1yLMkaHtxWdYNrIhAWGI=;
	b=GS6Fe/DltQe4SLzlz2SgBGJy/ESDSZ4JPRqLB0/hEzAPgDn4JMeVcwJn8VkwkqN2JB
	zhMRZPgYsMwEUCIUrTrNj9vyIKbWU6l8tN+ucWs6Dxn2/7bNqDirzLkm1Rqi8Y3edE/Z
	xyboA6IOw2rcoxoSSTv0fldWOCJSqUyysGkMqvntnM1tD59VAfjXxgmqCmMdxzMf5rBe
	3tSOH20kEjydb6MNVfHnixSmRn5p8Gr3WuccCqO5Tl+NPFyUw/COUl3ey9Wz5t5ek69A
	utBBjM+EjQOcfUHyo5KJgae0G392VkRqYtotQ2bjIK/o/i7MrvjL+4e++ajv7e0apWRp
	S1Bw==
X-Gm-Message-State: APjAAAWCCJ+2W4t1Z1PJSAQbq0TQ7n9JnDtZaxyOKy8JJshbRKUKqSoV
	yQDybuH5Or2og77Uw8wUVzM4uCHxb10TFrnVXv4=
X-Google-Smtp-Source: APXvYqydIvqVLyivY/4R+6bWu1Cuy7M1075AvBtNuy0axFq40/GOMc/P1yROC6tpnIW0dLMAZYW2oMdAYOU0AFrzKDE=
X-Received: by 2002:a6b:7417:: with SMTP id s23mr2450519iog.2.1554135687340;
	Mon, 01 Apr 2019 09:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190401160106.22928-1-schnitzeltony@gmail.com>
	<CANNYZj80ZqNn_6i9_Z0_HYJErcKrymQZmpiVGn_B56Jw3c7acw@mail.gmail.com>
In-Reply-To: <CANNYZj80ZqNn_6i9_Z0_HYJErcKrymQZmpiVGn_B56Jw3c7acw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 1 Apr 2019 18:21:15 +0200
Message-ID: <CALbNGRTccK1a5QuZppiAOR1kG5mgMFzSYYg4+uHANRx3o3kCNA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 V2] gobject-introspection: auto-enable/-disable gobject-introspection for meson
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
X-List-Received-Date: Mon, 01 Apr 2019 16:21:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 1, 2019 at 6:10 PM Alexander Kanavin <alex.kanavin@gmail.com> w=
rote:
>
> On Mon, 1 Apr 2019 at 18:01, Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
> > +# Auto enable/disable based on GI_DATA_ENABLED
> >  EXTRA_OECONF_prepend_class-target =3D "${@bb.utils.contains('GI_DATA_E=
NABLED', 'True', '--enable-introspection', '--disable-introspection', d)} "
> > +EXTRA_OEMESON_prepend_class-target =3D "-D${GIR_MESON_OPTION}=3D${@bb.=
utils.contains('GI_DATA_ENABLED', 'True', 'true', 'false', d)} "
>
> Thanks, may I also ask that you go over the recipes in oe-core that
> inherit meson, and tweak them to use this option? (there is not a lot,
> and some don't use g-i at all).
OK will do - but I'll wait a bit just in case somebody finds reasons
not to apply this patch.
>
> >  # When building native recipes, disable introspection, as it is not ne=
cessary,
> >  # pulls in additional dependencies, and makes build times longer
> >  EXTRA_OECONF_prepend_class-native =3D "--disable-introspection "
> >  EXTRA_OECONF_prepend_class-nativesdk =3D "--disable-introspection "
> > +EXTRA_OEMESON_prepend_class-native =3D "-D${GIR_MESON_OPTION}=3DFalse =
"
> > +EXTRA_OEMESON_prepend_class-nativesdk =3D "-D${GIR_MESON_OPTION}=3DFal=
se "
> >
> > -UNKNOWN_CONFIGURE_WHITELIST_append =3D " --enable-introspection --disa=
ble-introspection"
> > +# Avoid triggering configure QA
> > +UNKNOWN_CONFIGURE_WHITELIST_append =3D " ${@["", "--enable-introspecti=
on --disable-introspection"][(bb.data.inherits_class('autotools', d))]}"
> > +UNKNOWN_CONFIGURE_WHITELIST_append =3D " ${@["", "${GIR_MESON_OPTION}"=
][(bb.data.inherits_class('meson', d))]}"
>
> I honestly don't remember why the whitelisting was considered a good
> idea, but I think it would be better to drop it altogether? That way
> there will be no silent regressions (when upstream decides to rename
> the option, for example, which does happen).
>
Whitelisting would make sense for for projects where gir is mandatory
and cannot be disabled by configuration - are there any?

And

