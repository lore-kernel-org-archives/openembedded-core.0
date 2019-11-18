Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id D834A7F88D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 20:09:15 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id n4so21755038qte.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 12:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dHj1+ZsvyOx7Vg0sV3OXtE3S74RyvZJF3kyz7LtiH2Y=;
	b=NsDrTGUF6zHCnjYWz354TmDpsqPVRhBeSmQr+lKF7HEwwpymmoNHZ8mBzchnCTHsff
	q8nKvnp5UjTKlHYT54mLOj1x71fD0MP88wAntrOeM18rc6hqTo3bPFX0a8A27jQVTGKI
	JP1OXNHG+KQiiNAkLYd6Icslu4mGnz/oi0FVHnmv6Gm46cTnKNe/e9OIteK5z8IbxJuP
	J0lShgfJsgytE/xn/LnY1nm9jkz3bzCngcZe2RBL5gp4kb3+FHjVLy6sD2ZLQgBw4Lg8
	QZb1CMge6liugkGbL+DEfj0Hot7Vlu4XpKidcQVp01LN+m+bTDHNdF1e++vrhNkFnzVZ
	uPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dHj1+ZsvyOx7Vg0sV3OXtE3S74RyvZJF3kyz7LtiH2Y=;
	b=T2ctiW5oxjOv90TYk0S7euq+eY4qHbPtwFgWiOb6JLykZ7a+LZ36+nqdclKQlYSrl+
	R8FSVhjpyVAIFd1L2/mQcJ2B6XFaahrau7uys4Rd4uUbkrcOgK9ZdgVWZTKGbXy3dDbY
	Zkv9nMEky1YX2TiW5JhvNz5A3Ha2QmZrYKJNyChI+9+txVn0ABn2pMdsBPsDi7b/s8fc
	WgbVqNQs0LNyhuYf8PfAcOtYG6613DAaFRtJpY9FgHrfFrodFTHTedWGFknDxCnLIiPH
	DCOa70hHc1ej7vqDnL1oPZRF4s39+xt0O45Ow/s32pbvyI1QFkdLcbgDkNOhL8EM5n0q
	NtGg==
X-Gm-Message-State: APjAAAWAlSUlfQeGiEctM4ot8CAaE8Q/6+rsynab+81ib1fyas1VxHY7
	/BaRR9/j10yEhlaqHxvmGT0X3pRQC82HpNMnatc=
X-Google-Smtp-Source: APXvYqyaCG+hYB5Ssm1QhgMvbtZitNxgLgMICq00GxaM0DDe2aK3Ss+WJy2suV2buVWV3FrnQEYZ+lE/rt656TgV15Y=
X-Received: by 2002:aed:2724:: with SMTP id n33mr28988856qtd.194.1574107756280;
	Mon, 18 Nov 2019 12:09:16 -0800 (PST)
MIME-Version: 1.0
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
	<20191118142852.22981-13-alex.kanavin@gmail.com>
In-Reply-To: <20191118142852.22981-13-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Nov 2019 12:08:49 -0800
Message-ID: <CAMKF1srtYneT81UKC0Lcn4U_DgWiWb3Xm11mXL+2i3+yvCE5qg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] man-pages: correct the SRC_URI
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
X-List-Received-Date: Mon, 18 Nov 2019 20:09:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 18, 2019 at 6:33 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> The homepage: https://www.kernel.org/doc/man-pages/download.html
> specifies that the latest tarballs are published one level up
> from where we currently take them.
>

archive is a better location for what it's worth. Since long after a
release, the tarball may disappear from
level up but chances of it being in archive are higher. So Let's not
change this URI, unless there is another
reason that I missed.

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-extended/man-pages/man-pages_5.01.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/man-pages/man-pages_5.01.bb b/meta/recipes-extended/man-pages/man-pages_5.01.bb
> index 28525f4ba7e..ea1249e4396 100644
> --- a/meta/recipes-extended/man-pages/man-pages_5.01.bb
> +++ b/meta/recipes-extended/man-pages/man-pages_5.01.bb
> @@ -5,7 +5,7 @@ HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
>  LICENSE = "GPLv2+"
>
>  LIC_FILES_CHKSUM = "file://README;md5=794f701617cc03fe50c53257660d8ec4"
> -SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
> +SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
>
>  SRC_URI[md5sum] = "38abead776a506109e128ab96bcbbe58"
>  SRC_URI[sha256sum] = "070bef794c6826b3fb3965d1a2efdb46c25cb37c06c715987f88a50906cd5b6f"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

