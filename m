Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id D6E04771B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:48:45 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id j19-v6so5295615ljc.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 10:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dsSxSQ5qZBk8oVRMn07Yom6mdGh/HQGhIk/kqPr+LcY=;
	b=ZLb9Ce++zbHfQnB2HcLktQrnwJhQO8yVcZhyPi/dQHEwSzPwFcvNj7bOWl7ak0Xoqh
	MdFNqlp4x3giUkpcs6EDBlVQ1z1KArNSTiusRxmQU4fFLtcng+L+u/DPfXTFYKIa5SPl
	uuH6+qxhG2GWg33tOtlaJZaZB7441uOkSdBWykB2wYtlArSk4p8a1sn8IHa4pHNkE/tk
	weD1ct1vEYg0fIbLeQrcYFkVwt3f6CSL728KG3+zZgPY842Baa8FGtEvu8sVPkVHBhhV
	zQ9LeaCeiSInIPQF7qiGiNqNxku6n12a6+3Ki8gUd5v639KyJqDY0wQG40yhC4V4CjGf
	OVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dsSxSQ5qZBk8oVRMn07Yom6mdGh/HQGhIk/kqPr+LcY=;
	b=GM0hKavmnxmRDUZ3dbAIgLcpguCJfMz6cfAtpLW04ivQx6WZgDSkq2Tyjx9ug3BwFq
	p3dcS5APi8nYvwmWmEJ0PEEJGlqCJJgUy2HlO0uUr2SQEkEnkoJ2XrK8MfzB1w0zlVLY
	GJpRtFZmLw1fLELdk3YADftjSjlt5P87FmrgYVrZkTaqQDDFodFYQX5ZbwhH3z3KKJwt
	zW1wcWwH7gW0XHyIiHBtkhUlTUwfenfHN+QkYMLJtqSkGMWbuFzKZFPmdhX5g4fCHWtz
	6evhh98TQlVRDCJSg7nHKB4viQk0/dtDrIs0R0t8Jn+kngpt8ulgq21LuPi7ZJPg4bQB
	QNlw==
X-Gm-Message-State: AOUpUlGwOzE+h6Faf8TTI0v4ZV6t3Oszlg3iGT6ZDis0SR5CG4kPzVVs
	ukZA1olXB9cCjT5HQ4Y8FF77JhWm1BoqLX+10ns=
X-Google-Smtp-Source: AAOMgpemJkxkCBv0gYpnTuwVTs4UxETvmj9G4XTQG9VutIJ3iTGWrbqjH0s1M6+HYL3i31kjV3CZUZ9hEzsU6MiyVTo=
X-Received: by 2002:a2e:5012:: with SMTP id
	e18-v6mr11421379ljb.22.1531763326447; 
	Mon, 16 Jul 2018 10:48:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:8749:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 10:48:15
	-0700 (PDT)
In-Reply-To: <20180716153005.16552-1-ross.burton@intel.com>
References: <20180716153005.16552-1-ross.burton@intel.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jul 2018 10:48:15 -0700
Message-ID: <CAKmqyKM3jxBMcy=8hVmp7qGZYPdOWjkAt9HxKxMSpON5NCrX-g@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] atk: add explicit gettext-native dependency
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
X-List-Received-Date: Mon, 16 Jul 2018 17:48:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 16, 2018 at 8:30 AM, Ross Burton <ross.burton@intel.com> wrote:
> In native builds we attempt to turn off i18n but this doesn't work in Meson
> yet[1] but as the gettext class reduces dependencies in native builds we need to
> add gettext-native to DEPENDS explicitly.
>
> [1] https://github.com/mesonbuild/meson/issues/821
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

This fixes the build issue for me.

Tested-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  meta/recipes-support/atk/atk_2.28.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/atk/atk_2.28.1.bb b/meta/recipes-support/atk/atk_2.28.1.bb
> index a051247d8ff..d64df37f5de 100644
> --- a/meta/recipes-support/atk/atk_2.28.1.bb
> +++ b/meta/recipes-support/atk/atk_2.28.1.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
>                      file://atk/atkutil.c;endline=18;md5=6fd31cd2fdc9b30f619ca8d819bc12d3 \
>                      file://atk/atk.h;endline=18;md5=fcd7710187e0eae485e356c30d1b0c3b"
>
> -DEPENDS = "glib-2.0"
> +DEPENDS = "gettext-native glib-2.0"
>
>  GNOMEBASEBUILDCLASS = "meson"
>  inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

