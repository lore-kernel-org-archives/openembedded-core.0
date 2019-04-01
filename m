Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
	[209.85.167.172])
	by mail.openembedded.org (Postfix) with ESMTP id 76BD97D01A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 16:10:38 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id v84so7745160oif.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 09:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DUpwwCLFBvHJv91n9SW6LlZk1+dsXmpsXkI6DsfeHH8=;
	b=EzXNr4ThSYtDitjORYdgWJvwsoxnEy2Te3NYK35uI33bmoK2kxL9BOZR6bCwSLyE1x
	re0wS1hUF468h6iECfznD/WLac+RsB8Ey6NEgN86sKDY4EtnDm2HJVLnY5G8dHoyuB9i
	26cwt6lzGsKYd+iK3pA/9mhIhnQOPJs6v/kiWTsMVr+lH2au/OoJm0PYDrXzWTiye5I2
	e1iFaXKU08IjJnuU2UADCv/7OFSfTrAkfRq2fw/GbLYrqKtsf4WOeWuMziZvUdK5PYON
	P8g78Chkk+kBbwd/+GUgndix+9/PPbzU1n5Ru7b9N744JvxxPD3fxqQ8rhN1SkXNpawH
	jouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DUpwwCLFBvHJv91n9SW6LlZk1+dsXmpsXkI6DsfeHH8=;
	b=k5mcgdy7fz7Z4yquwMiBrQ1DDgD+HGPsARrI5Tx36F5lLcjbS1fzbbaq6633svtbNm
	WcTsOj2AoJvEapa57JOfkKm0Rkd+Cc7YZFiUD3s+cKKZhQBfihALhCP0vhdC9zhpn7Kl
	mNwZfVenkdY/uf6f1MMx+/UdbG6gPRk+zKZa4VH+/MUHjkVlijIyBsXyBGijBwuFSW6Y
	+1YB7F/cJsBv7oSy8TztS+/zWUbvdYvCJiMce4Gl6Asjf+WDJhRDulBjNnoEj/axDLLJ
	SXvTlO6mHM1wBHm1BDi3zfWkzLC2i+H/mlzX+JMiLGxlZbqqmiAHgbDsmwdkXpNlQ3Lw
	AgeQ==
X-Gm-Message-State: APjAAAWuhBJxRL1L+v+t6L2LyeiQF9uW6J8/ciq0noBg0BazNt24rQ6H
	PpJMqIpOfj9O8rGiLOTTujqMCIdu+c2XPzzF59Q=
X-Google-Smtp-Source: APXvYqy9qhflnAf3pqOtBXZUUs0gDA+5wo2/A+hqbtu9uOSX4J0W5JCJxl2gMj1XR0N1xzUflQg8VOSVaTc1TR1j7lA=
X-Received: by 2002:aca:ac94:: with SMTP id
	v142mr13438645oie.135.1554135039490; 
	Mon, 01 Apr 2019 09:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190401160106.22928-1-schnitzeltony@gmail.com>
In-Reply-To: <20190401160106.22928-1-schnitzeltony@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Apr 2019 18:10:28 +0200
Message-ID: <CANNYZj80ZqNn_6i9_Z0_HYJErcKrymQZmpiVGn_B56Jw3c7acw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
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
X-List-Received-Date: Mon, 01 Apr 2019 16:10:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Apr 2019 at 18:01, Andreas M=C3=BCller <schnitzeltony@gmail.com> =
wrote:
> +# Auto enable/disable based on GI_DATA_ENABLED
>  EXTRA_OECONF_prepend_class-target =3D "${@bb.utils.contains('GI_DATA_ENA=
BLED', 'True', '--enable-introspection', '--disable-introspection', d)} "
> +EXTRA_OEMESON_prepend_class-target =3D "-D${GIR_MESON_OPTION}=3D${@bb.ut=
ils.contains('GI_DATA_ENABLED', 'True', 'true', 'false', d)} "

Thanks, may I also ask that you go over the recipes in oe-core that
inherit meson, and tweak them to use this option? (there is not a lot,
and some don't use g-i at all).

>  # When building native recipes, disable introspection, as it is not nece=
ssary,
>  # pulls in additional dependencies, and makes build times longer
>  EXTRA_OECONF_prepend_class-native =3D "--disable-introspection "
>  EXTRA_OECONF_prepend_class-nativesdk =3D "--disable-introspection "
> +EXTRA_OEMESON_prepend_class-native =3D "-D${GIR_MESON_OPTION}=3DFalse "
> +EXTRA_OEMESON_prepend_class-nativesdk =3D "-D${GIR_MESON_OPTION}=3DFalse=
 "
>
> -UNKNOWN_CONFIGURE_WHITELIST_append =3D " --enable-introspection --disabl=
e-introspection"
> +# Avoid triggering configure QA
> +UNKNOWN_CONFIGURE_WHITELIST_append =3D " ${@["", "--enable-introspection=
 --disable-introspection"][(bb.data.inherits_class('autotools', d))]}"
> +UNKNOWN_CONFIGURE_WHITELIST_append =3D " ${@["", "${GIR_MESON_OPTION}"][=
(bb.data.inherits_class('meson', d))]}"

I honestly don't remember why the whitelisting was considered a good
idea, but I think it would be better to drop it altogether? That way
there will be no silent regressions (when upstream decides to rename
the option, for example, which does happen).

Alex

