Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
	[209.85.217.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6DF0C79356
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 03:21:17 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id e206so3698836vsd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2018 20:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k3If9zjgOCxLysikLT/2z3guJd3fzFIZrZY9Ny6rx3E=;
	b=f2KOAeDq92Ty+1Sv4mUws55elioCTpd5HIlLjagNwALfxRoPSe1a/7MtqYlEKpi1hD
	RPe3m/DEHZ9DqjzKiAjBkrgCDWbStfMlIuNQCrVmsu+yXj+zxEK/TCnI3Cuo3hodqlpS
	zCP4jks6ke3lG1gEX8215vjHloHUaahA2rm3JW/ZwVx5j1Ec9laWV1wuV9CiEojGxsHN
	uJ0ipKBGthQA7TxXmY2VbBrFnCGI0Dz0uvEZ1sXtxLZzmL4K4p4vMqhHZsxxPmNchzXe
	FLsHTzfqAKzIjVqCXFpAEInHNonKzUNNzX22qlW9VpjnrTfU9lUUxEX8vCUUmNqIRDPs
	qM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k3If9zjgOCxLysikLT/2z3guJd3fzFIZrZY9Ny6rx3E=;
	b=iiV8XfCvfwsBPwhxn08PEf0PPB7FymlwUUk6k6Ko6WNcAjisKhxkIylq6ox6f01rAh
	9AkxQXp9/vKlAKpChL8qXso3pnWwZ/oG+4u1h+OIBRRcGAqlgpGQkViwUZ2nmlAuii80
	cBqgApyJS5Tn3S2GNUoZPMQUdgljvNHmbLMyRLDW9xNXh7v6if8+cdwPaXXhY3kEWMWJ
	z9guJ64IlV1EKvhECngkIa+5MkzuKXuqyJ2mPxaoVnjpskpM/ghKBLv3aQftWKt3XofI
	deEFUUTZQNBQxGpu2VPNNyOa0bYvzYdBCjYRXJMh2ciRIuw++wU7AhiemFbenvKcBLPe
	McEQ==
X-Gm-Message-State: ABuFfoixRPN5TfLhsxeZkTIhI7zT86Wo5f4P0J3IhjPZPbOYnOpR3F/5
	g/NVXKoGDRd8rhv0mBQEbgLyHODt1uU/q2hq3EU=
X-Google-Smtp-Source: ACcGV61FiD6A3qi0nMQKYBbZbP4DF9gTWR5zxFiuuUAlJNcucnztKww9PBapgOJfwwpPCxt6mNjYzYThg/PDyyg41VM=
X-Received: by 2002:a67:1f4d:: with SMTP id f74mr11465946vsf.222.1539141678222;
	Tue, 09 Oct 2018 20:21:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2748:0:0:0:0:0 with HTTP;
	Tue, 9 Oct 2018 20:21:17 -0700 (PDT)
In-Reply-To: <20181010030904.20641-1-hongxu.jia@windriver.com>
References: <CAMKF1spfZM_hxKfRYtVPeT-8FZa3RUUOxSkd-Rmb9cajMrS0iQ@mail.gmail.com>
	<20181010030904.20641-1-hongxu.jia@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 9 Oct 2018 20:21:17 -0700
Message-ID: <CAJ86T=UPuyuJrfapif+maJB9kS8-W=K3CQNG-QNRqrUwOT0=JA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] webkitgtk: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 10 Oct 2018 03:21:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 9, 2018 at 8:09 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> They can't be built without opengl in DISTRO_FEATURES.
> [snip]
> |webkitgtk-2.20.3/Source/WebCore/platform/graphics/OpenGLShims.h:23:10:
> fatal error: GL/gl.h: No such file or directory
> [snip]
>
> Some sort of GL is needed yes. We indicate that with opengl losely in OE

It's loosely, not losely.

> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.20.5.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
> index c8d4f94..7f1ffce 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
> @@ -30,8 +30,7 @@ SRC_URI[sha256sum] = "15c0f8d26e9605afe0948d161ba5fd82efee8eda2debd409fd40a440ac
>
>  inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
>
> -# depends on libxt
> -REQUIRED_DISTRO_FEATURES = "x11"
> +REQUIRED_DISTRO_FEATURES = "x11 opengl"
>
>  DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
>             gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

