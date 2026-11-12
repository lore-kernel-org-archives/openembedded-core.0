Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13055.1794489957594449318
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 05:25:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Lz/iAc9z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso636287366b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 05:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794489956; x=1795094756; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wBsbduThWA5PuYM1cq1t91ry1UVArIvg8ppoR0dvYYI=;
        b=Lz/iAc9z/FPnuQ8K2Um5vLRzvO6Djfi7KMdrdjTi8DJjpeHfOLus/KiN0PT+XhrxFZ
         66jPXMYYFUIfY+m2/F+8SIAA1gGiT33rd2S82YQnJxcZb7ZshRHf5VkHC2WBhPkqAi+m
         rGx/vpHe9q9NlP7bQxjB/FFsmo9wVxf6VNj6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489956; x=1795094756;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wBsbduThWA5PuYM1cq1t91ry1UVArIvg8ppoR0dvYYI=;
        b=WPL9MtBClfVL9jAQRWmxMTm7uFLYh+PmJCKMXt017PdGt9JdAH8NErqVD9UZ7GcGnW
         NKmeKzsNlyl05jq4uSXtcuwkCxQQIBagZoV9B/SetYD8+D3f8ELKMeNka4rF4UFOheka
         uQhtL0tPLqwN0i2nswE5Qinc+QSsfr110qKJ5JxQrAG3K24RepPKUaYHgY4tWrqq3WEt
         +iW1tIc8Vz3l1ig3Xgq1uI2SMRt/gb1Nche1vSQ/FE/eXEFb5dWuXQzeaPD3IX2bJbQ8
         XL21JL1nE9Miso1ItNwewWXIRxGJP9/GzYnBehXM8xpC8swVxBHJ5pRf3S4HDnd7T/S/
         E98g==
X-Forwarded-Encrypted: i=1; AL+hErHFwSpqiReLvB7dsdpfoqhH+jV6rgP7I6TEfVdsSpejYS7qXU8QfMUu+wlokIBmLKMas5I/QVZdXxALqjJmgkT4DQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8u/BB4dbvfp/LFkBiQEFMZsC+fcw00xAI0l2V+M/ZkTUjAt4fZ
	EJ4rh7uiSVt3aeNgyu7KAepcTclq9AKpiNWPKfRDznkPid0hZnS8u5q67Anx1oeB9cY=
X-Gm-Gg: AYBFou3vvljaNyGYRvVlu8hnV1YfyBVIAJkYLYvHeAmm5DMqvMPnuOhFzhSstkt/Lb8
	JoHaYyZaucUj4VXjfDb23xSnY4GKjjkwzOstg8XqCm0xATbIrImrTuFCdirBSpyVYcB7df+xuO9
	S7fYXPiNJtTbX0xrFgxRXEWDzpANU0I9S4Cr9cevitifS4JK7hAIYHH0rY3MvQdN9JEdWw6eG6m
	z4SIj95Cc7xEYyuSJEnfw5NdBHPPoB9EH2iQ7CA5RraUj7/CoEhzE3iAJ3s4teh3kUBzPyT+/gd
	AleKIzLPYrii5grIK6Ot6Lo6yb/ErDTIg9Uyg+Uma7X2aMmoLLaVYasfEg+0KHQknUoBt2vdoik
	ryCoZ3wor0NCH5+0XwB2rTqX2QWpmGVx2KInR1LW7VlNrzgBqY1+WZjigP39zsmiVnQZGaKgler
	wYtq5Zm2pcRxCThTkff2vbXlAXQcrYRXenL7ZQSr2JjCK+65ufZUaMKCSWSPdP2wo/hdfWWTvd/
	m/M2v/8ePoiXjRJ5ZhaJmlY5bimBTImxEXgDpq0wSmC4TvzEoFPQHDVglTKYaOHbPZrP+ASe+Fi
	J4jGMEh1gMdJcLgEiYdv26GbxJ/2LL+cZqYS+6ah4l+3fix93HelxcXep/6/XBPJf08KHbpilc+
	nMyQiFBlx3zUMDZdgfDxbKjuykQq8wBqD19lS58o3
X-Received: by 2002:a17:907:d407:b0:c26:19de:9126 with SMTP id a640c23a62f3a-c5066b7ed7emr580115366b.25.1794489955790;
        Thu, 12 Nov 2026 05:25:55 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1562:9f61:e354:1b51? ([2001:8b0:aba:5f3c:1562:9f61:e354:1b51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a651csm350621166b.4.2026.11.12.05.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:25:54 -0800 (PST)
Message-ID: <ac8ff53e3255be6f3c080bbe56a9968e97ed53eb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] packagegroups: Add clang to the SDK
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>, Sunil Dora
	 <sunilkumar.dora@windriver.com>
Date: Thu, 12 Nov 2026 13:25:53 +0000
In-Reply-To: <20261108204558.3577002-1-khem.raj@oss.qualcomm.com>
References: <20261108204558.3577002-1-khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10build1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 13:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250096

On Sun, 2026-11-08 at 12:45 -0800, Khem Raj via openembedded-core wrote:
> diff --git a/meta/recipes-core/packagegroups/packagegroup-clang-cross-can=
adian.bb b/meta/recipes-core/packagegroups/packagegroup-clang-cross-canadia=
n.bb
> new file mode 100644
> index 0000000000..a1d7445b71
> --- /dev/null
> +++ b/meta/recipes-core/packagegroups/packagegroup-clang-cross-canadian.b=
b
> @@ -0,0 +1,11 @@
> +SUMMARY =3D "Host SDK package for clang cross canadian toolchain"
> +
> +include recipes-core/packagegroups/packagegroup-cross-canadian.bb
> +
> +PN =3D "packagegroup-clang-cross-canadian-${MACHINE}"
> +
> +CLANG =3D "clang-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> +
> +RDEPENDS:${PN} +=3D "\
> +=C2=A0=C2=A0=C2=A0 ${@oe.utils.all_multilib_tune_values(d, 'CLANG')} \
> +"

Reviewing this, I did end up wondering if we really need cross-canadian
for clang?

Unlike gcc/gdb/binutils, a single clang binary supports all the targets
and the -cross-canadian pieces are just symlink farms. Do we need them
at all or could just just point at "clang" everywhere without the
triplets?

I'm wondering if we can simplify in this case rather than perpetuating
that complexity...

Cheers,

Richard
