Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id F22167D015
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 16:36:47 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id e5so9159541otk.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 09:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ySofe31pWHNaiS/Pdcp3oyIw8XLl/xYKgb+fFa6Eo5M=;
	b=GquyWTtiWIi1u7xAgTI87h/mioTIvB67LZLfudchokcLtAgGpZ4TG6pOMFZaS2N9Bf
	hOPIt6s5cqy2k2sGo3RG3gwJfI/sUvSGswCe9x/cgSnfoYNWj0zi/E3iIsWelWF2ODOM
	pSa4aYcMWlHnyHnQV0mpIaakxBMJQjM6XVdDK31mvpf0YqXi78PcG2aCqp3mDdM1Cgpi
	IagfTWvBv4crHGsouB3wQTqKFR0Otl4ncd3zpwQPwVJ7lHkw+sFUDzPcPYg3EUNwhQXt
	RocGOHjKjqTrDhxIh8E1v1+/8TT9pM1O4v8B6/Hgty9nWY3bsdPUIuslB7yd/8ReiK1M
	8NhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ySofe31pWHNaiS/Pdcp3oyIw8XLl/xYKgb+fFa6Eo5M=;
	b=gZGShLNLOuOD/JO6yNImyUS35ZEMuSRisVfcd6rkWCNARrMvWieLOzyq5YhiCUZvBc
	W6NO9PHwtSvxVJ0JEhts90DxG+ZyVJ3P6CTIJF3geHRZDEchCV/Z8b/9NKg1IUwpYjCM
	yd2eMhbMz3R3U4MwZmFNzV75V3ksKIuGYqiC7Wvf6N0wtUFPVEDkgLY+VtOnuaVaHhRi
	96uu5TFXdlusJ71kY2J/lhdbl7Q8VUkQkCy2dqmLxIA3n0IxjqJ8mSslHKZwTXIHPCll
	jSicQd3XXoPY4Bggg2K2c1+/G5KthUk4SJHXC2aDyygRNpPg3QB3rj4PvFjrEzGkTwCC
	3TgA==
X-Gm-Message-State: APjAAAW6L/ZjpIkXDz1aCTZr2RrKU2jsDXic5I5/jQmNiFd2lHDkFljh
	W8uKohDkvjG2aPDEorU1kYo5lH0hQ8ordHk3R3k=
X-Google-Smtp-Source: APXvYqx+O+j8AB3G/8mcItpGZ5RvgSjDo0Z2FUYHN2XAPlXIt1wnDMZX0nHFP0h7LnQWzek14ADXH+Aa+y7DhaYGlsg=
X-Received: by 2002:a9d:62c8:: with SMTP id z8mr44914309otk.144.1554136608961; 
	Mon, 01 Apr 2019 09:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190401160106.22928-1-schnitzeltony@gmail.com>
	<CANNYZj80ZqNn_6i9_Z0_HYJErcKrymQZmpiVGn_B56Jw3c7acw@mail.gmail.com>
	<CALbNGRTccK1a5QuZppiAOR1kG5mgMFzSYYg4+uHANRx3o3kCNA@mail.gmail.com>
In-Reply-To: <CALbNGRTccK1a5QuZppiAOR1kG5mgMFzSYYg4+uHANRx3o3kCNA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Apr 2019 18:36:37 +0200
Message-ID: <CANNYZj_=Xwi4P88jqwPbR3xOom-LQkutRY=Vs11UcCpU=WTNtg@mail.gmail.com>
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
X-List-Received-Date: Mon, 01 Apr 2019 16:36:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Apr 2019 at 18:21, Andreas M=C3=BCller <schnitzeltony@gmail.com> =
wrote:

> > I honestly don't remember why the whitelisting was considered a good
> > idea, but I think it would be better to drop it altogether? That way
> > there will be no silent regressions (when upstream decides to rename
> > the option, for example, which does happen).
> >
> Whitelisting would make sense for for projects where gir is mandatory
> and cannot be disabled by configuration - are there any?

For autotools, basically no, as they all use the same m4 macro file
which allows disabling.

For meson or other build systems the answer is also no, because in
this case we would have to patch the upstream code to either make gir
generation optional (and then 'inherit gobject-introspection'), or
disable it altogether (and then don't inherit g-i at all). The reason
is that introspection data generation is done through running a target
binary, which requires a functional qemu usermode, and for some target
MACHINEs qemu won't work (e.g. mips-n32, some flavours of powerpc etc
- g-i class determines that and does the right thing to disable
introspection automatically). Here's an example of such patching:

https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/=
libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-generate-gir-or=
-gtkdo.patch?id=3Df06d14b2963e9d5145041057c3ad0e48654f1501

(newer versions of libmodulemd made g-i optional, and so the current
oe-core recipe and its patches reflects that).

Alex

