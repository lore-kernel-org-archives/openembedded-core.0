Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id CD4076BD1C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 02:33:58 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id t13so18939395qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 18:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ocCVsogmDuUwo6KW4913MC3JqeJtcsWdJXR9ec+w2Wo=;
	b=Sq79I4ZveuKBtso4+IMNC0GZJn9Jdrf9+MfHKMnDMS8rOb0PHE+65dbtruX7jWr3Z1
	xKr7Pti55CjPJcoKBDS2ELbTxiMUgXbIbd9/7szkGr8RaCfNSUsv0Scr5NIf+ucLADuy
	WOBosI3mSlYRSVeOcoTbh/0YQyjD+gbr4GH3u0cMg5zSJpt1ny1wqYWD2kibYaFNvrKR
	ZDEnQ2yHhK4n+nqjH8yMnW/wQMNDDfcKWNhW4/31sxLLqZp9V9MIJIgxIu0iZLpL2NNH
	LyDnjV8Ymeck0eleyNB9QW+AWtALIXJ5T+8jD71Zr0CR+gImTFBEsDdGNUpu5TMkbhvg
	f+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ocCVsogmDuUwo6KW4913MC3JqeJtcsWdJXR9ec+w2Wo=;
	b=XX5zptw//K1vLPSNTmx6vemN7pbTzbBDbrf8LiF1cRS3ACpdsQTGgLa8UzaAIqG7Ol
	fBeh1VaRSMvpyhalgknp3f1428PU5i8UyGkPv2ggeHlE7wBv4M6maXPDVBQt7OCiMq/z
	aGngUiG26LfE1/jTTr4DfSIYnjXz2EPVXO1xPn8kdWdvHS+Xtcm0L5ULs0WiPPuz8JTc
	1uEmtri8qvsrUZbPB6LM4ZQf6thIICzYdVbLL14YWtqUz4kmPasP0Rk7io/S2ijkqfyN
	W+0gkMvkMxZP2igGw7M4KaOHup8hxyVNLsmR2AUWNccgg2HNMzVYWcy+QC/E/ffWpl2X
	r72w==
X-Gm-Message-State: AJcUukci/AlHJhRn88ncvi186O+GyXVYSI0XoUCUX58m9797dnMG1uaC
	8OQoAiOZcRSMBp3dn0dfHSxhmi3V+uSevy7/JRY=
X-Google-Smtp-Source: AFSGD/X3WwR4fD60ySw3ctaW/X6sEMMjpdVH0dtCQKsFYph3qkufoFJaOjCSbLj55zKk6HEQFo4K4J5bYmSfAv5skto=
X-Received: by 2002:ac8:16d8:: with SMTP id y24mr20974586qtk.253.1545878039388;
	Wed, 26 Dec 2018 18:33:59 -0800 (PST)
MIME-Version: 1.0
References: <20181226235906.22007-1-alejandro.delcastillo@ni.com>
	<20181226235906.22007-4-alejandro.delcastillo@ni.com>
In-Reply-To: <20181226235906.22007-4-alejandro.delcastillo@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Dec 2018 18:33:33 -0800
Message-ID: <CAMKF1srgZnSdeikUO0TvBk4vVrzU4vVMps_=VJ+7Se7A3AOPdQ@mail.gmail.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] package_ip.bbclass: add xz threading
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
X-List-Received-Date: Thu, 27 Dec 2018 02:33:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 26, 2018 at 4:44 PM Alejandro del Castillo
<alejandro.delcastillo@ni.com> wrote:
>
> Before, threading was enabled via a patch to opkg-build. Now that
> opkg-build provides a hook for extra arguments, use that.
>
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> ---
>  meta/classes/package_ipk.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index 5eb910ca31..991ecac7e4 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -8,7 +8,7 @@ IPKGCONF_SDK =  "${WORKDIR}/opkg-sdk.conf"
>  PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
>
>  # Program to be used to build opkg packages
> -OPKGBUILDCMD ??= "opkg-build -Z xz"
> +OPKGBUILDCMD ??= "opkg-build -Z xz -a "--threads 0""

double strings look confusing, may be use single quotes here ?

>
>  OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
>  OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

