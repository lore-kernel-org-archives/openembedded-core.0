Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9C3236FFF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 20:33:15 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l126so57145303wml.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 12:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=iVGSUN7O7+E1/pcm8deg9VcHsiG9WwIj1q12Fuv2fts=;
	b=AYw0iQ+asDpAcTqQxH9fVZNuR43//mWGUFfM3/pbRwQKsFsl258YycQg5fIrufcu4v
	e86BG/GoHWTzwjgAHulbo4htHzp2Cd2kw2nE/v7luUQFdM3GMmOJBfXCTjEH2fPweO2t
	GLGtJh9tIUtiFkXpuPfs8/VVqu6PXKZ2DbSvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iVGSUN7O7+E1/pcm8deg9VcHsiG9WwIj1q12Fuv2fts=;
	b=jOYAtHj5UCuekzSRfKbBypFBk+GY7/3Ie9yTfaz7uSzW/t0bLL32fKm38MmcSb+dxF
	7fk83ewZHCKLLLivG8xxqm/voo3xTl2d27ZMiMGcc1v2xk8WGifK4+VWEhVmKyEhVLcI
	qGz8QEFw0F3vieWR6+fSFb3h7jH2r2CaXmcvBuxcoK3yQhHIhYBKEs+E1Z9mcytRTRJz
	zJkmPZECSzkEs8/pM3UKdjyRpYZzrKolPeJUi8CcUPyn5nTvgWDFn9D60noMFzI1Lc0x
	0N53slY+O22OKGEA0SNgLsMKKvupPapgeUZOgLg1ZQ24e6DQq+bBnUVnlg3u/Mph1xGl
	nXJA==
X-Gm-Message-State: ALoCoQnwZfRjNnqsbtpgj8UatniGS3EWjS72/xwYZBgB4pUsI1ReaQ5XwCRQ55VZPJIkHJlsBh0a4WyAAFNrc7DM8AsHl1arMKK2a2IYh1JNd6PuShoo1QQ=
X-Received: by 10.194.175.194 with SMTP id cc2mr53939071wjc.121.1450297995587; 
	Wed, 16 Dec 2015 12:33:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.184.110 with HTTP; Wed, 16 Dec 2015 12:32:56 -0800 (PST)
In-Reply-To: <1450294001-6610-1-git-send-email-sgw@linux.intel.com>
References: <1450294001-6610-1-git-send-email-sgw@linux.intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 16 Dec 2015 21:32:56 +0100
Message-ID: <CAP71Wjz2XDTzzd0pO6FAXAc715QDaxY+FyOk_NoFOfoCoaOptg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: Upgrade to 2.4.64
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
X-List-Received-Date: Wed, 16 Dec 2015 20:33:16 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 16, 2015 at 8:26 PM, Saul Wold <sgw@linux.intel.com> wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-graphics/drm/{libdrm_2.4.62.bb => libdrm_2.4.64.bb} | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/drm/{libdrm_2.4.62.bb => libdrm_2.4.64.bb} (92%)
>
> diff --git a/meta/recipes-graphics/drm/libdrm_2.4.62.bb b/meta/recipes-graphics/drm/libdrm_2.4.64.bb
> similarity index 92%
> rename from meta/recipes-graphics/drm/libdrm_2.4.62.bb
> rename to meta/recipes-graphics/drm/libdrm_2.4.64.bb
> index ea6305e..cb0efe1 100644
> --- a/meta/recipes-graphics/drm/libdrm_2.4.62.bb
> +++ b/meta/recipes-graphics/drm/libdrm_2.4.64.bb

why not 2.4.65 which is the current most recent release?

> @@ -12,8 +12,9 @@ DEPENDS = "libpthread-stubs udev libpciaccess"
>
>  SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
>             file://installtests.patch "
> -SRC_URI[md5sum] = "c9291bae0e5ca65d1483821d3698d3ab"
> -SRC_URI[sha256sum] = "906c294bdbe1c94c3ca084305d61a6e5a8367f3b4986e6cc13b1e9b3f75931dc"
> +

Is this extra line intentional?

> +SRC_URI[md5sum] = "543b2d28359cf33974fa0e772dd61732"
> +SRC_URI[sha256sum] = "b60786fe7d6e42adb3966ce1a658f63fec528d537396381cbda93bcc99a934b6"
>
>  inherit autotools pkgconfig
>
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

