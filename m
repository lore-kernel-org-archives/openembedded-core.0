Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7595474D41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 12:17:00 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id t22-v6so7129506ljc.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 05:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Z17oRWIi5iQx3ifaEoQHTRvg8lm1p3BYOX5N4NzSdr8=;
	b=Y56cOA8JApPRN2GXZ6aQPk8vdBx/brKM2jid4WQPHen4w9sJYtKDOVVcsUvt62QfYx
	7ehB4WL1gnIMgnr/sM/Gbq1ekqPgb5eNIDimlXR4QCx03qY+jEhCnlWgqpLHJyhXACPF
	dBZ68VKsaqgxZW3KhIwgbNLPsMVjR/Mnsvb5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Z17oRWIi5iQx3ifaEoQHTRvg8lm1p3BYOX5N4NzSdr8=;
	b=uiRVKordES8lw1DAE9EPJo5kmdw/hyHoUgownGP/vJNpg93k9cSr/giWL1r0rNTyIK
	bbnzT9eTyaoPe1nKrX4UXRnc2M0WDHyxOrP8TLw++UPpfcINhFjJnyrK1evOKpFRRQw7
	6Btu388l7aUvvZSh9ofsj5NG9mxvlyvrhdxizjapb/raKKhytqe6frt8l4kv/HqOxWCX
	iGNS/KpdYqClw4t0huAkq04AABo/y5/Z5mQPgEms8v4lCSgiwG9SReI94LOvHlrUtWke
	wlv9+5WFhMPJdFFvz/ypQT/5HGhIrfTYJXNq7lP/87NOACjFQesXStneJZBqU2l6bIl1
	KXiQ==
X-Gm-Message-State: APt69E3klgkXEZCfUy+kXTf6nMiL78aFclRYip9HgBqPe6MY6P0PC7nA
	lyelsbEJs76LI4m7csIKcU2TEINBdVPaHlHtwJedew==
X-Google-Smtp-Source: AAOMgpfDbn9Hy8UCZPmHmO1HJuPszoM0Oh5iVu93v1LpYi8ggHLSM0Altyv7m0s+TBhTBbZbPhw7g7vtRtAOY9JdIEM=
X-Received: by 2002:a2e:9105:: with SMTP id
	m5-v6mr4722075ljg.121.1530274621011; 
	Fri, 29 Jun 2018 05:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <1530194188-6052-1-git-send-email-daniel.diaz@linaro.org>
In-Reply-To: <1530194188-6052-1-git-send-email-daniel.diaz@linaro.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 29 Jun 2018 14:16:49 +0200
Message-ID: <CAP71WjzL8jHXRZGrmKOXr1ewK-WNNgdy9-cGpGZbBh+uuHG_uA@mail.gmail.com>
To: Daniel Diaz <daniel.diaz@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kmscube: Update to master from 2018-06-17
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
X-List-Received-Date: Fri, 29 Jun 2018 12:17:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 3:56 PM Daniel D=C3=ADaz <daniel.diaz@linaro.org> w=
rote:
>
> Changes from 0d8de4ce:
>   c2d4ba8 drm-legacy: fix poll for flip event, actually exit on user inpu=
t
>   56c3917 formats: use weston's egl config matching logic, centralize for=
mat
>   aac3788 Rework default modifier handling
>   4f7cec0 Use weak functions to handle lack of gbm modifiers
>   98f31bf cube-tex: make use of modifiers
>   063ce5c gbm: fix fallback for drivers that don't support modifiers
>   9dcce71 add MSAA
>
> Also refresh gbm_bo_map/_unmap patch.
>
> Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>

Thanks for sending this out! without

>   063ce5c gbm: fix fallback for drivers that don't support modifiers

kmscube is broken and won't work with Gallium drivers (e.g. freedreno)
if mesa > 18.x, and since OE-core has mesa 18.1.2, it means kmscube is
currently broken!

Acked-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

> ---
>  .../detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch      | 10 ++++=
+-----
>  meta/recipes-graphics/kmscube/kmscube_git.bb                   |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unm=
ap-and-use-it-or-avoid-it.patch b/meta/recipes-graphics/kmscube/kmscube/det=
ect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch
> index 3605446..611e541 100644
> --- a/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-=
use-it-or-avoid-it.patch
> +++ b/meta/recipes-graphics/kmscube/kmscube/detect-gst_bo_map-_unmap-and-=
use-it-or-avoid-it.patch
> @@ -49,9 +49,9 @@ diff --git a/configure.ac b/configure.ac
>  index 8397f7b..c7f1f4d 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -65,5 +65,8 @@ if test "x$enable_gbm_modifiers" =3D xyes; then
> -       AC_DEFINE(HAVE_GBM_MODIFIERS, 1, [Define if you can use GBM prope=
rties.])
> +@@ -49,5 +49,8 @@ if test "x$HAVE_GST" =3D "xyes"; then
>   fi
> + AM_CONDITIONAL(ENABLE_GST, [test "x$HAVE_GST" =3D "xyes"])
>
>  +AC_CHECK_LIB([gbm], [gbm_bo_map], [HAVE_GBM_BO_MAP=3Dyes], [])
>  +AM_CONDITIONAL(ENABLE_GBM_MAP, [test "x$HAVE_GBM_BO_MAP" =3D "xyes"])
> @@ -99,12 +99,12 @@ diff --git a/kmscube.c b/kmscube.c
>  index 3a2c4dd..276dc55 100644
>  --- a/kmscube.c
>  +++ b/kmscube.c
> -@@ -142,7 +142,11 @@ int main(int argc, char *argv[])
> +@@ -148,7 +148,11 @@ int main(int argc, char *argv[])
>         else if (mode =3D=3D VIDEO)
> -               egl =3D init_cube_video(gbm, video);
> +               egl =3D init_cube_video(gbm, video, samples);
>         else
>  +#if HAVE_GBM_BO_MAP
> -               egl =3D init_cube_tex(gbm, mode);
> +               egl =3D init_cube_tex(gbm, mode, samples);
>  +#else
>  +              printf("gbm_bo_map() support missing\n");
>  +#endif
> diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-=
graphics/kmscube/kmscube_git.bb
> index 5b64ed6..46aeeb0 100644
> --- a/meta/recipes-graphics/kmscube/kmscube_git.bb
> +++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
> @@ -6,7 +6,7 @@ DEPENDS =3D "virtual/libgles2 virtual/egl libdrm gstreame=
r1.0 gstreamer1.0-plugins
>
>  LIC_FILES_CHKSUM =3D "file://kmscube.c;beginline=3D1;endline=3D23;md5=3D=
8b309d4ee67b7315ff7381270dd631fb"
>
> -SRCREV =3D "0d8de4ce3a03f36af1817f9b0586d132ad2c5d2e"
> +SRCREV =3D "9dcce71e603616ee7a54707e932f962cdf8fb20a"
>  SRC_URI =3D "git://anongit.freedesktop.org/mesa/kmscube;branch=3Dmaster;=
protocol=3Dgit \
>      file://detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch"
>  UPSTREAM_CHECK_COMMITS =3D "1"
> --
> 2.7.4
>

