Return-Path: <ross@burtonini.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8F701619FF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 11:33:37 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id d27so938962lfq.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 03:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=burtonini-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SthM3bxQavDRoMyfNewri1dwRCn4f03+imu7/fIfoSw=;
	b=fZ96Rj8RHNevn3qQ/hj1aw7yur8eMlvyNJyCywdL1cnoATUqBLO0HA360XGmZ93+RB
	+MPvRnTZcriEmwx9YRF/dTq9yNpd41HnbEhFM8rJoCRZ6Jriu6o+kM7mOBlaLF12MGaQ
	J4Nt1TOp04Elz32gb/DQhU5t9Oc78/w3/CuV7zLNtm7Zsn2eL1DxjrAX1WqmiOSD51J2
	N3Lm/Ew8l0CFyIuTMK3e4tmFkYV/T5RUZKiNSMlNV/BsPh3Ug/ZGjTvtbJtfPeMoF2LU
	/U/W3wYrn9IOJ9JDQ5u0L+c93C2JsNdk6bDnDlchdx+IckUBclP0aVl8eMSxuwBzf6C/
	115w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SthM3bxQavDRoMyfNewri1dwRCn4f03+imu7/fIfoSw=;
	b=I9L1AWzSCXcuxs5IhSyuKBfFcBslLwK24Efo3V8rIWLn73r1hVppk53gtgiIMjBERi
	oyLwSjfgr5nsogLae00/jWA8BIKnhAW5kPYmkHlD5otoycrvHlvzd/4TCr9KlYQ6nP9o
	RtDSabB1t2FtPagaPIMp6yNbV1F9Dx9/GrnmedFb13N3BEpO29+cyh1KqAVOYzDkXfxS
	TBCxf+rsfhpTVzx05/3/5T8Yvf/jv/1fr2mZmcC5RHxvmGhlK+0IHJtj9nVomHcnIwUF
	lbtkmmNIZSQ/Mg7hmxqEPl+pkjCrIIrFHynjz79lcKDPkishaGyYAFEe9RIZwzO81Avz
	9kdQ==
X-Gm-Message-State: ANhLgQ14uTRJ0ag8ePH/7ZdFKWasYPjsfQtstEBDzJVIk2tdZ0oV79et
	aMVzpOwws4Ge+SSbPImdyE/VH9UdoBqpd5Hr7hJnB09bCnDU/A==
X-Google-Smtp-Source: ADFU+vviCes05zroZaxPJJ91NSzTpdUWj4Xg0ZGRGkJDUW7de5qMevQI0cZoLKAXSV6RKTumqPCgZWHSj1JX2KBqefE=
X-Received: by 2002:a05:6512:1041:: with SMTP id
	c1mr5243704lfb.211.1582976017856; 
	Sat, 29 Feb 2020 03:33:37 -0800 (PST)
MIME-Version: 1.0
References: <20200228230006.28594-1-jpuhlman@mvista.com>
In-Reply-To: <20200228230006.28594-1-jpuhlman@mvista.com>
From: Ross Burton <ross@burtonini.com>
Date: Sat, 29 Feb 2020 11:33:30 +0000
Message-ID: <CAAnfSTuSNgYK=SZvBjsXoqb=eTqNc9h924bodMUwCrgqDLLmGQ@mail.gmail.com>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xorgproto: move pc files to libdir
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
X-List-Received-Date: Sat, 29 Feb 2020 11:33:38 -0000
Content-Type: text/plain; charset="UTF-8"

Can you file a bug upstream so they can fix this?

Ross

On Fri, 28 Feb 2020 at 23:00, Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
>
> From: Jeremy Puhlman <jpuhlman@mvista.com>
>
> We fixed this two years go:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-June/151922.html
>
> However xorgproto moved to meson and uses pkgconfig module to generate the .pc
> which does not provide a method of omitting the libdir, which now means any
> pc generated from meson using the module will always be mulitlib incompatible.
>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  meta/recipes-graphics/xorg-proto/xorgproto_2019.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2019.2.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2019.2.bb
> index fb3f3aed3d..c0785ccd64 100644
> --- a/meta/recipes-graphics/xorg-proto/xorgproto_2019.2.bb
> +++ b/meta/recipes-graphics/xorg-proto/xorgproto_2019.2.bb
> @@ -19,6 +19,8 @@ inherit meson
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[legacy] = "-Dlegacy=true,-Dlegacy=false"
>
> +# Datadir only used to install pc files, $datadir/pkgconfig
> +datadir="${libdir}"
>  # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
>  RDEPENDS_${PN}-dev = ""
>  RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

