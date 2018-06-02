Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f172.google.com (mail-ot0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB5675212
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 05:06:40 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id w13-v6so4239978ote.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 22:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PUfz+fPo1v3pFQpMqOYnMC9afb8gy6l+hs6Fb2N68rw=;
	b=KYv0/hvpGTVTnlNxLHmTelpzkvTGb96m4Np5XkK4HOaBXf1jdbtgBkfFpywyv3WhUC
	5RmvAX9fWRgE51n3FKGsnh8YttwNUhNz2MzC3uqIWqkagfbLtB669MPysqpDE5Aa/Mly
	YqMf7rQ7OkMsilnZ0GYqhcBemZTGoUEH/W8E0WRqA5m1lSr/9AKGMON/GGfoeH2Zegko
	RgNCANWuiel+P1s4pnhusTliX+4KFuEdpHFb+QCIjuWTh1Od6e23LMG0M0E39hElmixl
	wZdzSLRhqpdMlQHKUMMnxpm17oSKP8LB/JqKVQP7WISpzNIOled1yH+iVmK18ciZmzUo
	+X0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PUfz+fPo1v3pFQpMqOYnMC9afb8gy6l+hs6Fb2N68rw=;
	b=YA5ZjFDcrQOj58BEBKXElXjWgHf1Ey3lfBUFuIyY7oBKrh+7bbxq5S50PiojlJfErS
	bOoNYNKXu9BTy+ivGfdR7GNKWPtFAN487x6G8dev46rZYu/Q/SZ7oiUEGU8sjuktQf5e
	OK8UIaiwBzhvlMvc+z/Ic0o3w2wOnVbCppDMvHRgjLvIXS0z9z2VzIwUc7hpJjPTP3mX
	6/k0i7cwbs0UjyAHkS9h0724J5d0qSdG12JNQG05mL3BqLtsm++PTDLcpsH4aM1s2GAC
	uQBCzcQEDGa5055jSJk5e1K/8v0DXOuY2vvx9fq9Y6LNV4qcQJII+rKE/j4hhuJv0HWA
	JGSg==
X-Gm-Message-State: ALKqPwdn5r2sOEUnWLkJtf8YEvff7EporA2VB5IPF2hqm4JMyLpDFL8Y
	t3p66F3aPJDVKAdnCusAnDCIkibg3OhpDD78LaSTFA==
X-Google-Smtp-Source: ADUXVKKG+SI/CLUXK1hvUhZDC+xjYjjNafQ2JfWIutwKfVydGR3YAOXE7ueNVuDD12HppIoza/w/DJqs3kQKwA75K9I=
X-Received: by 2002:a9d:cd:: with SMTP id 13-v6mr9545715otk.155.1527916001855; 
	Fri, 01 Jun 2018 22:06:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP;
	Fri, 1 Jun 2018 22:06:41 -0700 (PDT)
In-Reply-To: <20180601221436.27162-1-alistair.francis@wdc.com>
References: <20180601221436.27162-1-alistair.francis@wdc.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 2 Jun 2018 08:06:41 +0300
Message-ID: <CANNYZj_4YMuZY8Up7ci4-1JGcW2HNAdAM7xG96WpF0mfVKD7EQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] [meta] dbus: Fix X11 compille errors
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
X-List-Received-Date: Sat, 02 Jun 2018 05:06:41 -0000
Content-Type: text/plain; charset="UTF-8"

Wait, why is this problem not seen by anyone else, particularly on the
autobuilder? Can you provide the failure log please?

And do the same for the other patch to atk.

Alex

2018-06-02 1:14 GMT+03:00 Alistair Francis <alistair.francis@wdc.com>:
> When building with X11 set in DISTRO_FEATURES we need to specify that we
> depend on X11 native for building dbus. Otherwise we see missing include
> file compile errors.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-core/dbus/dbus_1.12.8.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/dbus/dbus_1.12.8.bb b/meta/recipes-core/dbus/dbus_1.12.8.bb
> index b3ddaafab5..40868628f6 100644
> --- a/meta/recipes-core/dbus/dbus_1.12.8.bb
> +++ b/meta/recipes-core/dbus/dbus_1.12.8.bb
> @@ -6,6 +6,7 @@ LICENSE = "AFL-2 | GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
>                      file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
>  DEPENDS = "expat virtual/libintl autoconf-archive"
> +DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-native', '', d)}"
>  RDEPENDS_dbus_class-native = ""
>  RDEPENDS_dbus_class-nativesdk = ""
>  PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

