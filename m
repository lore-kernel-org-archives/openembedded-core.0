Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4086362132
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 15:41:40 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id v105so25559754wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 08:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bg4mo9SS3w924PsGUxbCwATUhZH6a3S52W1En6bWR9k=;
	b=Mn3dWNaXZCrkSKaJjSJ+lPTCXGB6uiU5MD8hAMF5U3h/SGXBGtiNc0rBUxN+rGWEU1
	R4x7Ay0/rjrPKsfOpQhxU/rnPfEoRK+l8UG9GyuL6ZiZzXX/tTnQ6ren+aTAfInmpSL5
	tHt26ZNmVw89s7ZpBJp6XFFsTexGkD+FFJYxMa/LeQO5UAXDKAR9N19GNdOx3IcKDykL
	i462XhjEQAo4M0m0LF3FwxyIOKrB8qvFg9OYyzOBiKQVLy4w24amo9Du6mu59qq/terW
	JdxEA82AIWIAbyyFvh+xy8qp/jAEAud8HepHzskbzNL79QhLYscO/o5plpjEuxgT4EZk
	9KLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bg4mo9SS3w924PsGUxbCwATUhZH6a3S52W1En6bWR9k=;
	b=nz0my0QsUd1nI310qYkXdid3icGfvxttPy7uXZEfCvuupqEJS4WDa6qi84KOFjr3f5
	rQfD3HAX9PQaYzQeBYFwhKtXVq893iSyFDsT7Pn3+I3WZBUSfJcePoSgkfLFqVgzmVAc
	bFXvEmjTCXIBauEHdqbk4XQMIyohjHBP+ikpgQXsrrZx3l5v9r0ytOhQBsQ+5ANgH9ZK
	que4poK4ZMoFp8Px5kx/86u0piP9ICjkS0jgkarYZ+v27Pv4LryrM1Sdx/vtE9pHVGxP
	LlkVXEIeWIw9n84GRDop424XdL/bQtp5ejV4EfvNIu3E1Ei3/wa6msWM2MnrhokcCTeA
	YoZA==
X-Gm-Message-State: AHYfb5iWyp3Eq0Aj3XnB3BAl7vZXFagmWOpo+laZQvMvlufwNQiqfrtD
	yZTUSkECV4CW+iDRasPgcOQTKii9OA==
X-Received: by 10.223.167.9 with SMTP id c9mr6720489wrd.180.1502293301156;
	Wed, 09 Aug 2017 08:41:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.175.16 with HTTP; Wed, 9 Aug 2017 08:41:40 -0700 (PDT)
In-Reply-To: <20170809141922.2603-4-raj.khem@gmail.com>
References: <20170809141922.2603-1-raj.khem@gmail.com>
	<20170809141922.2603-4-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 9 Aug 2017 08:41:40 -0700
Message-ID: <CAJ86T=VTVv+w9YUCU2HpMDCpY64eS9ngiOGZ0uE-CJY_2M_9RQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] cairo: Add pkgconfig for opengl support
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
X-List-Received-Date: Wed, 09 Aug 2017 15:41:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 9, 2017 at 7:19 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Any explanation? Was this previously non-deterministic? If so, how far
back does the problem go?

> ---
>  meta/recipes-graphics/cairo/cairo.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
> index 8e1e2e1b88..fd376951bd 100644
> --- a/meta/recipes-graphics/cairo/cairo.inc
> +++ b/meta/recipes-graphics/cairo/cairo.inc
> @@ -22,7 +22,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
>  DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
>
>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
> -           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
> +           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
> +           ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
>
>  PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
>  PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
> @@ -30,6 +31,7 @@ PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
>  PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
>  PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
>  PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
> +PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"

Since the opengl distro feature can imply either OpenGL or OpenGL ES
support, it doesn't seem right to use it to select one over the other
(ie for recipes which support both, shouldn't the choice between
OpenGL or OpenGL ES be independent of the opengl distro feature) ?

>
>  #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
>  require cairo-fpu.inc
> --
> 2.14.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

