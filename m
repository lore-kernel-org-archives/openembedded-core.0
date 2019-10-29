Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 852417F699
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 15:41:25 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id y6so10888938lfj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 08:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9vPcRmFo3J0pEpoK4y1J0uTZCUjPJhwmcc9dhWCw/Ns=;
	b=VNlUWP52pInkr6+HLNDlm9BnVliUFV4iIhIEb7bY0lhwJBx65GG9U30JTW2kMXxTdt
	SZoGFlQsbxZCidEIMxRU0WW0rMOl7o4ICrJBiERrvKWS81XYkoO9FThUbRLCVKj3VYyE
	tsGGZTU6zKIwWfM0cqqIfr4+1sYgyb3LYZcPq+6608fCtLlt/Bvx4LTIw8x0sGWx4Ujq
	YIwIc+gxKdNrBe737nEpUJQGHdShdlEd1CXkHFkM8aybFnUX2eJG4dS5hGDCu73oW1va
	9NJk6QxS9pCZ51BWinXRuz72IPGhj+v0OlD8hV9f3ofWV2lXAhezYaIjIm05v4lEVauj
	zzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9vPcRmFo3J0pEpoK4y1J0uTZCUjPJhwmcc9dhWCw/Ns=;
	b=p8yTfN92c3pxpkuw5BQD8o+Luoqcsuk0lBvwU8iXxsJj6p8427akx+S8DXr277bIWo
	1dI6YLUP6hPlIDGNgQtXQNq3gdRsBSSd/zHYtesdtf2ROddnZF73SQ/SXxate9WagLhn
	gjFfM+LA9hRK5v5L6BCIkt0OSp3ICwhGFh7TsA+FZzXItMDRKKgPDY1oyQOqbsBjAw1i
	8rPLIdc2x0gw8ZekmYhHjw5A8q/1H2XwIcUF8IfJRqmd18S+1oKmobGEhJ6t0pq0+juQ
	OTnieFmWpVVhHKAHI0cohRUFFrwfGss1PwX1RNXRjJi146Y2Ugq8zzfjVc2gvQlBOEZJ
	eboA==
X-Gm-Message-State: APjAAAXfbNBDYRmvwGLfOV03MKKioXqOWnjt9frXxfxQM3dk43lJjxdm
	D4PcLDGxaulE+WarBHj+XoVpBSXbkj4uqUpFcXk=
X-Google-Smtp-Source: APXvYqxB8Xpdp5BzXutS5AwWEG14SjoVcpok5vEfY1afb0obG29uoo8004uUxxAKz4LPXzICf7iMfX7Ox3ZVGmCndT0=
X-Received: by 2002:a19:855:: with SMTP id 82mr2859062lfi.44.1572363686034;
	Tue, 29 Oct 2019 08:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191025214605.3957-1-alistair.francis@wdc.com>
In-Reply-To: <20191025214605.3957-1-alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 29 Oct 2019 16:40:58 +0100
Message-ID: <CAKmqyKP5sdt3F9HP_0-T5yS4jZHU0CwxP-eR4N3uLdf4Kg9kZQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 1/2] libsdl2: Fix build failure when using mesa 19.2.1
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
X-List-Received-Date: Tue, 29 Oct 2019 15:41:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 25, 2019 at 11:51 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Ping!

Alistair

> ---
> v5:
>  - Backport upstream fix
>
>  ...DL-fails-to-compile-with-Mesa-Master.patch | 41 +++++++++++++++++++
>  .../libsdl2/libsdl2_2.0.10.bb                 |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0002-Fixed-bug-4797-SDL-fails-to-compile-with-Mesa-Master.patch
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0002-Fixed-bug-4797-SDL-fails-to-compile-with-Mesa-Master.patch b/meta/recipes-graphics/libsdl2/libsdl2/0002-Fixed-bug-4797-SDL-fails-to-compile-with-Mesa-Master.patch
> new file mode 100644
> index 0000000000..8f5b6a0cef
> --- /dev/null
> +++ b/meta/recipes-graphics/libsdl2/libsdl2/0002-Fixed-bug-4797-SDL-fails-to-compile-with-Mesa-Master.patch
> @@ -0,0 +1,41 @@
> +# HG changeset patch
> +# User Sylvain Becker <sylvain.becker@gmail.com>
> +# Date 1570898876 -7200
> +#      Sat Oct 12 18:47:56 2019 +0200
> +# Node ID 369b01006eb2f6fd563f7c315d29ae3fe503c432
> +# Parent  4cbaffd0083b8cd17070dbd9d4ab1ce0fa9fca2d
> +Fixed bug 4797 - SDL fails to compile with Mesa Master (thanks Michael Olbrich!)
> +
> +fix building with Mesa 19.2
> +
> +With Mesa 19.2 building fails with:
> +
> +/include/GLES/gl.h:63:25: error: conflicting types for 'GLsizeiptr'
> +
> +The same type is defined in include/SDL_opengl.h for OpenGL and the two
> +headers should not be included at the same time.
> +This was just never noticed because the same header guard '__gl_h_' was
> +used. This was changed in Mesa. The result is this error.
> +
> +Fix this the same way GLES2 already handles this: Don't include the GLES
> +header when the OpenGL header was already included.
> +(https://hg.libsdl.org/SDL/rev/a60b3c292f0f)
> +
> +Upstream-Status: Backport [https://hg.libsdl.org/SDL/rev/369b01006eb2]
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +
> +diff --git a/src/video/SDL_video.c b/src/video/SDL_video.c
> +--- a/src/video/SDL_video.c
> ++++ b/src/video/SDL_video.c
> +@@ -37,9 +37,9 @@
> + #include "SDL_opengl.h"
> + #endif /* SDL_VIDEO_OPENGL */
> +
> +-#if SDL_VIDEO_OPENGL_ES
> ++#if SDL_VIDEO_OPENGL_ES && !SDL_VIDEO_OPENGL
> + #include "SDL_opengles.h"
> +-#endif /* SDL_VIDEO_OPENGL_ES */
> ++#endif /* SDL_VIDEO_OPENGL_ES && !SDL_VIDEO_OPENGL */
> +
> + /* GL and GLES2 headers conflict on Linux 32 bits */
> + #if SDL_VIDEO_OPENGL_ES2 && !SDL_VIDEO_OPENGL
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
> index cdc8650e17..862abe1d54 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
> @@ -15,6 +15,7 @@ PROVIDES = "virtual/libsdl2"
>  SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
>             file://more-gen-depends.patch \
>             file://0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch \
> +           file://0002-Fixed-bug-4797-SDL-fails-to-compile-with-Mesa-Master.patch \
>  "
>
>  S = "${WORKDIR}/SDL2-${PV}"
> --
> 2.23.0
>

