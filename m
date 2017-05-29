Return-Path: <daniel.diaz@linaro.org>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 50EB377D81
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 21:04:40 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id o12so46441707iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 14:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OZ3mw+c4oBJk1j6/p5PZTBIHgwbxO4GnEDItQTd4xAY=;
	b=hxa+VpVzB73dgN2i12cVl5n8XbwRqFK6jF30gDyfSi7ugy6XbjNIp7eXiQ9XsGTR2g
	mdb6mfiLOlgmdgPfnlHOOklUXJ0BXxPyCgyP3jQ9BJqjyNmif08d2ZnnRTCNu80305Gm
	GN4H9KAbcwJ4hWVziMCOWmd49+2D1W3WxSal0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OZ3mw+c4oBJk1j6/p5PZTBIHgwbxO4GnEDItQTd4xAY=;
	b=Ryp+EkbePAHe2lHhJCCRb460ymA8zuSJ68zEt6WvzvxDbn4hhAiN2ehua0NxobPOw9
	omgwT5vj8s43G/PujY21bkxzgfIvf+4MaCrQKbMG9aP/sp0K633TG28tyK28h+ozA0Zu
	UU1xRAbBs7ZmL6GmC6G8RtatSVk1brMPgCLJcOXu/yvFFNz52RQHB1B/+RWVGuFcGCmM
	tJWMKkvO8O1O94UY9vuL4bhaEDShTRn9WIh+emEsmukD99r9cob90B1UpfvhJ5DBjZ0s
	enRs/+cfffUxVHf4VdohRAPENBKLzpu/CKUiNr6kzwjip8BKdp2UCbHt2QsJ4Fx1bjPH
	/Bfw==
X-Gm-Message-State: AODbwcDV0URrMNZX2yAFTOLL91RuJwEWKbmxx9aXR6SQ6ApMGMFpwgOg
	HkfGgEcVX+pD3RAxJQFpP43RNo7PxRJhQns=
X-Received: by 10.107.136.17 with SMTP id k17mr16004118iod.89.1496091881453;
	Mon, 29 May 2017 14:04:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.168.224 with HTTP; Mon, 29 May 2017 14:04:41 -0700 (PDT)
In-Reply-To: <1495131757-7261-1-git-send-email-daniel.diaz@linaro.org>
References: <1495131757-7261-1-git-send-email-daniel.diaz@linaro.org>
From: =?UTF-8?Q?Daniel_D=C3=ADaz_Rodr=C3=ADguez?= <daniel.diaz@linaro.org>
Date: Mon, 29 May 2017 16:04:41 -0500
Message-ID: <CAEUSe7-yrguHG2mYJha0n1+U=WagU5OUPqoc3DzpCiB1FvJy6w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] piglit: depend on virtual/egl
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
X-List-Received-Date: Mon, 29 May 2017 21:04:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping on this series (#6793 in Patchwork).

--=20
ddiaz



On 18 May 2017 at 13:22, Daniel D=C3=ADaz <daniel.diaz@linaro.org> wrote:
> While building for Hikey using Mali 450 driver (r6p0), an
> error like the following appears while linking:
>
>   [  1%] Linking C shared library ../../../../lib/libpiglitutil.so
>   [...]
>   [...]/aarch64-linaro-linux/gcc/aarch64-linaro-linux/6.3.1/ld: cannot fi=
nd -lEGL
>   collect2: error: ld returned 1 exit status
>   make[2]: *** [lib/libpiglitutil.so.0] Error 1
>
> Mesa generally provides virtual/egl (along with virtual/libgl,
> which satisfies Piglit's current DEPENDS) but that is not the
> implementation to use with Mali.
>
> Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> ---
>  meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-gr=
aphics/piglit/piglit_git.bb
> index d6bfb14..eae3eed 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -14,7 +14,7 @@ PV =3D "1.0+gitr${SRCPV}"
>
>  S =3D "${WORKDIR}/git"
>
> -DEPENDS =3D "libpng virtual/libx11 libxkbcommon libxrender waffle virtua=
l/libgl libglu python3-mako-native python3-numpy-native python3-six-native"
> +DEPENDS =3D "libpng virtual/libx11 libxkbcommon libxrender waffle virtua=
l/libgl libglu python3-mako-native python3-numpy-native python3-six-native =
virtual/egl"
>
>  inherit cmake python3native distro_features_check bash-completion
>  # depends on virtual/libx11
> --
> 1.9.1
>

