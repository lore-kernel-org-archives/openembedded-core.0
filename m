Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id C16257D06C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 14:56:25 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id t81so7470575oig.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 07:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Hn2hlkVXh0rJpJWXS4AysxlrZf4OJ+ezwEOc3DOBROU=;
	b=QFX1y4qNs6EMbwJJTnwDm9718hyKZwRSCe5bFs5shBBfiV4mxevYZDugyP3P0qkJN2
	nFhtSkhYBX6T/XtEq0ZM203p9qhAaud+aOwh1Uty2yAIDfep4/ZyEtyWdd7MVlUU/xyJ
	CVzvHWsTfG4KgfBVEWTTFpPwmNDS5mExrnc9l6dH/xdycBET54qq+E4gD/Ji5I5kKfFS
	Jv1Nn8TXvtFFGQBe/T0e5c4nt2olYlhvLqG6tzFoH84DOrnhscN9R6MmklM/ordYOJ2L
	NuZJ9PP0Q2tOM5qucdVaMJRgjjE8S8IjvtETKHS9VI1AAp/DC9GgIhVQQZjIP2gyRqsj
	UZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Hn2hlkVXh0rJpJWXS4AysxlrZf4OJ+ezwEOc3DOBROU=;
	b=j8NSAMseTON5S7cO1uV1uqQGkfTc6CSM5e8Z9kAIvHK1PFdPC2M1P3Z9i3tHMqzdLU
	aRIYddZM0MlAGgMlWJved8Ur86u/fmR/vVUI+z9+hQgwzQO2tXayy3b7YfRQ3yn9QaKt
	72lnEtyX8ELw0jwQ0UMJZ6JNl1xUC0xOxaOGVX5E/8Y1shARwnEuTgpxuuAmSG160Elt
	5C0z4ENGBeVaoYqTI20cqbeDWYq/CHeQuqkn1MA3sxUwkxctRvC1j1XXF5z08u9ckVxB
	/NxBGeoaV8VyHzqF1b306hvdlcc5dpZO8B16/eao3sPlUNGPk3lbyfgc8Bcu+pPUgQmo
	WlJA==
X-Gm-Message-State: APjAAAWT7gxPraRV8httAcZuXVhdonkjZdsZ3u4ACZYoxrPyb1SHACGl
	6dtvcWyy887H6dxx7h7u1T2KwN02MkdTYTwZs3E=
X-Google-Smtp-Source: APXvYqweiO8ZG1Pj1mIO+QrY9adZcRqm0MpcDNAg91BwU+LyKsU55nUzydRx0zEsynU5lmp+PajooZpUZTt0+XPV5Eg=
X-Received: by 2002:aca:cc86:: with SMTP id
	c128mr12654232oig.119.1554130586677; 
	Mon, 01 Apr 2019 07:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190401135217.17431-1-schnitzeltony@gmail.com>
	<20190401135217.17431-2-schnitzeltony@gmail.com>
In-Reply-To: <20190401135217.17431-2-schnitzeltony@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Apr 2019 16:56:15 +0200
Message-ID: <CANNYZj_ndpKB89k=jdqaLFc18k6VF+0pnOh51eTM8TaQpeB6bw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
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
X-List-Received-Date: Mon, 01 Apr 2019 14:56:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Apr 2019 at 15:52, Andreas M=C3=BCller <schnitzeltony@gmail.com> =
wrote:
> +EXTRA_OEMESON_prepend_class-target =3D "-Dintrospection=3D${@bb.utils.co=
ntains('GI_DATA_ENABLED', 'True', 'true', 'false', d)} "
> +EXTRA_OEMESON_prepend_class-native =3D "-Dintrospection=3DFalse "
> +EXTRA_OEMESON_prepend_class-nativesdk =3D "-Dintrospection=3DFalse "

Sadly, unlike autotools where the option name comes from a common m4
macro, this is not going to work with meson. There is no common ground
between upstreams on how to name this option, and so you get 'gir',
'with_introspection' and anything in between.

A better approach would be to introduce a variable:

GIR_MESON_OPTION ?=3D 'introspection'

and override it in recipes as needed.

Alex

Alex

