Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6932A7C8CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 07:07:40 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id f196so11431273qke.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 23:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=twt0r5wGXT8uD0GDVPuUa5bJ3HF1pMJgm04inmx8K0s=;
	b=BzVMwEfv0n52cnNmi1fqRyDAV2zsGVkptO1Wpkx67S05lIu610o7LtrNGYy5VYeoON
	s5HzyItR42phtHOonlkvdElCgjKVU8MHSCRa9hivZgwfcNgBsHkk1iyd6pZOgeeN7wAF
	0KynFigE5p4hzWtAiUdY+FO4a/cw/fmpyls7Oj/scYrzN4y8KrGTww50pOQUcaSO3tDK
	8CJ2ZAjD+FWHQTH2SbLanHqaZrup1SG+2WahcsaDTdnasjts7GzBFAGfp8FIlpIS2JMS
	YTShpqz30kqIMAzq75S7xlmHjaWnVsMKo+LpoIE7CMHFW9b5mnGOTLi27PE+mnpodJiw
	W7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=twt0r5wGXT8uD0GDVPuUa5bJ3HF1pMJgm04inmx8K0s=;
	b=she9lGkfCBYBNltSD8VY68+sNIYG89Oqexh1mjGKolwnbxbguhEUrOkRoS5b+0KvVU
	T7j/umuwtGzAkCHrZh3o0tAZK0VCFBFEvUbIzn5rHUgA7jVfmnHz7EUmeHZaMUSA6CWm
	bCNHhkuZphibb4vVGD5GnkUTu2t15DTvHicV2jje4kj4FzmB9TsB7au6Yb152rRZ2kE2
	ptmiYGb2/JZe6krVxBB83w4CocGAOLvwgK0uBonObH/WIgymDJmVx8SPQxGbtnFvxhe6
	rcZn/kr+uKpq2fW6wV530u0uqqua0RFXih/jCSlzQmZV9FfwTu9EOfa+SWEk4faMJypH
	/lCw==
X-Gm-Message-State: AHQUAubN3GCQ6ls4Y0QtwsRzP2t55TJHAd0jnUnLftT18boON8EmnjhW
	SvIjZU6rrL6PrhwynnhHLydarQTGFAjKBL4DHzk/4wkr
X-Google-Smtp-Source: AHgI3IY67Db12mb9GhiNBPeXhaKR+Dqeq/bcph/0MdW/nLqdwcZWT7UwVaqZt5JW7MMegIfrsuyeLRTvbFECDzH1dZE=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr19357577qka.206.1550560061187;
	Mon, 18 Feb 2019 23:07:41 -0800 (PST)
MIME-Version: 1.0
References: <20190219000849.6177-1-richard.purdie@linuxfoundation.org>
	<20190219000849.6177-3-richard.purdie@linuxfoundation.org>
In-Reply-To: <20190219000849.6177-3-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Feb 2019 23:07:15 -0800
Message-ID: <CAMKF1sqKePayLE9-WXUe5Q9uv2qqFY7BRzfw67PdPbfDLAPijw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] gtk+3: upgrade 3.24.1 -> 3.24.5
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
X-List-Received-Date: Tue, 19 Feb 2019 07:07:40 -0000
Content-Type: text/plain; charset="UTF-8"

on ubuntu 14.04 https://errors.yoctoproject.org/Errors/Details/228774/

On Mon, Feb 18, 2019 at 4:10 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-gnome/gtk+/{gtk+3_3.24.1.bb => gtk+3_3.24.5.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-gnome/gtk+/{gtk+3_3.24.1.bb => gtk+3_3.24.5.bb} (83%)
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.1.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
> similarity index 83%
> rename from meta/recipes-gnome/gtk+/gtk+3_3.24.1.bb
> rename to meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
> index 6de3e73f2f0..799cbd4707e 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3_3.24.1.bb
> +++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
> @@ -7,8 +7,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
>             file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
>             file://0003-Add-disable-opengl-configure-option.patch \
>            "
> -SRC_URI[md5sum] = "9dfe16f486573815f242fa400763feb7"
> -SRC_URI[sha256sum] = "68387be307b99aadcdc653561d7a2a7f0113b93561fb18ded7075ec9ced5b02f"
> +SRC_URI[md5sum] = "32862355c08f6af3e7848c695cd4081b"
> +SRC_URI[sha256sum] = "0be5fb0d302bc3de26ab58c32990d895831e2b7c7418d0ffea1206d6a3ddb02f"
>
>  S = "${WORKDIR}/gtk+-${PV}"
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

