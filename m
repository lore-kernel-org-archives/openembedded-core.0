Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id D9DF07891B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 18:25:48 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id y8-v6so10645536uan.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 11:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=D3/43ql5hI1YCNzLPlsjhJ9aF76PUwJ6Ljren/SPSvE=;
	b=MmAwt25faBMHk3yEvpN97/OxtzxoaC3yCTg7d9oVTSrWC8O3GKMwUsP1sl9tyhT8Qz
	UgxwD7vwxfQn/He9chKb4D9jvleuCg4pGB88PnxYOfWcFSrOfJONrL44ZvPeXsjMkG2G
	XD9wtmQTTkAo/pB8qo5+Twb9AQt/zcWEMso7rzNRbssG4Ox66f6N+0GXAjJdmwACkU9j
	VHs2ICTmpmuF7R+t+tsuljmY7x1OKwJUb8+KOggPnebgO8j7cHcdKGJSPO3Zc3rhYT/g
	otXiFYIgr6MKfYpG72iFhDT0omEnfI1pLXCTYMSkj56oIef7Gwf0q1REPYqA9wCHUadp
	/eiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=D3/43ql5hI1YCNzLPlsjhJ9aF76PUwJ6Ljren/SPSvE=;
	b=FoD2vz43aSf0f+pi/sPC2vMkcI7l6Nryg0Q5KKjXCtAtRfhlVQGvOECd5ChGz6HnHE
	ppnXXSXqH/P9frTQhHO/5iw2TUW0UmgoAL7N0pI4aDt35bmqmGNAwXJgWPAZ3jxnz7Sv
	3eS/76CMhAEnPbyZO3EmWRd7O6CVV2xzNwF+epl4iQsKbM+AYzg0JjsxB7vSci4Wm0eQ
	l54r50QpB5MU1GdvYgsAXft2reBZO6BcIoUzAiiaPpPXwJvZPmXNo/JV4LyxUFLAga2w
	HttTU2dAK7JwfgjvwLE0d+tuuaErmK7ZpRKKZJqERl9Ga1L3rmo2EtF8IIvLL2NiuO9w
	Colg==
X-Gm-Message-State: APt69E3mvlTeqn2RusrCnTX22RiTF5nvT8H3rihDOjw5hA+PVhbxQNjS
	PBvG9s6OdtMTdIPoaAb+zPJPDZG1qk5dXYxtnm8=
X-Google-Smtp-Source: AAOMgpddYNHcObrFJMGH7qBZZ8bgkGAdIfrNt0/8vxEXEAAJI1BbBlcTkKVEnVjVFxxxo2wtpKrljRdT5cgLal8+mO8=
X-Received: by 2002:ab0:11dd:: with SMTP id
	q29-v6mr16388508uac.191.1530555949514; 
	Mon, 02 Jul 2018 11:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <99949e3e-c252-9504-ea89-f379bab6f021@dresearch-fe.de>
In-Reply-To: <99949e3e-c252-9504-ea89-f379bab6f021@dresearch-fe.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Jul 2018 11:25:23 -0700
Message-ID: <CAMKF1soU6M4zv6Xu4ugwheBHGO49cZSnnOD-PWSWJsCaAJC28g@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: devshell problems after distro upgrade openSUSE Leap 42.3 -> 15.0
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
X-List-Received-Date: Mon, 02 Jul 2018 18:25:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 1, 2018 at 11:39 PM Steffen Sledz <sledz@dresearch-fe.de> wrote=
:
>
> After upgrading my build system from openSUSE Leap 42.3 to openSUSE Leap =
15.0 a
>
>   bitbake foo -c devshell
>
> no longer switches to the related work directory. The devshell is opened =
in the original directory without any error or warning instead.
>
> Any hints what's wrong here or how I can debug this behaviour?
>

which terminal are you using, probably some default behavior changes there =
?

> BTW: The problem ocurs with pyro, rocko, and sumo branches. Here's one of=
 the configurations.
>
> Build Configuration:
> BB_VERSION        =3D "1.34.0"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "opensuseleap-15.0"
> TARGET_SYS        =3D "arm-angstrom-linux-gnueabi"
> MACHINE           =3D "himx0294"
> DISTRO            =3D "angstrom"
> DISTRO_VERSION    =3D "v2017.06"
> TUNE_FEATURES     =3D "arm armv7a vfp thumb neon callconvention-hard"
> TARGET_FPU        =3D "hard"
> meta-hipos        =3D "HEAD:a42bfbebe01c70076a57228ffa161e8bbe271048"
> meta-freescale    =3D "pyro:af5a8cf74d488ba45715ed0b0e0441e60b10c31d"
> meta-fsl-arm-extra =3D "pyro:9613dbc02ca970122a01c935bc9e5789ced73a9d"
> meta-qt5          =3D "pyro:631ea6373ca3ffb0e17968dfcd6f3171f95bbac6"
> meta-congatec-x86 =3D "pyro:c8664aa2d7fba32ccdc1e89a83b5fb00796e907d"
> meta-intel        =3D "pyro:9b37952d6af36358b6397cedf3dd53ec8962b6bf"
> meta-angstrom     =3D "angstrom-v2017.06-yocto2.3:137803eb32f6b34374c7a5a=
3c1f03eb88b68e4d4"
> meta-oe
> meta-systemd
> meta-multimedia
> meta-networking
> meta-webserver
> meta-python
> meta-ruby
> meta-efl
> meta-gnome
> meta-xfce         =3D "pyro:dfbdd28d206a74bf264c2f7ee0f7b3e5af587796"
> meta              =3D "pyro:819aa151bd634122a46ffdd822064313c67f5ba5"
> meta-hipos-closed =3D "pyro:a3787398eece562172641491b4a6174e7e32c5f9"
>
> Steffen
>
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

