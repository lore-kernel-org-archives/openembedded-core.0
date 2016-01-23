Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id BBF2F770C5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 04:55:32 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id mw1so4282971igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 20:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zmNuKo6P7Mzffgzx5DZtXi2azmqV7Fhvq9VwaGC6NGA=;
	b=L0nUyyJhhQmUTsf8+47rSv46gM2i2/zSEGFphLRubezVQeS/DD9O3CyUv5ojqRqNP9
	gDP3VQ5vZcQC37XKgwsXEKiF+O105snr1oY6LvEsM3v857EFH8jZ/YvR3Gmp4XlpJO/O
	PwX8/SzussanzL1ZGLVeI2E1qnxil3q3F5HqFcWftKKIdz+jMB0PvLqb/7yNJDOcUDXy
	T8X3gMOMZfoZUmwt16D3w1MXr5tcSJXaWL+96vHQiBHz25JaFEYwXlu91LqMKfJltj5F
	f6kkEyyPm6ImzpHGm6twUnDdpWggZWAQZYoNeDjbz2+rysPWn/jxTO4XFU3mPEjRkuce
	7GMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zmNuKo6P7Mzffgzx5DZtXi2azmqV7Fhvq9VwaGC6NGA=;
	b=Oji2lF50cIYm2pmqzvI/KisUAr4jPv7qbsKPUGf/+KddeacbhMykHQe+8CL41HaGz+
	AfmC6U6Tvk2SlE1bQ9CRZhIRIrABofL6vzAhr5v6P9vCEYIeN7Yv1TiiIaqVAwtktGrL
	tZcjGQp1zJPL9GRCsytfA/rqXgkTnyblSzxuoOjw9NVAb0PPp7GUcxTtZyYI82kcz0M8
	cNfXE1BIf7UP/yQWpg/vFTaDTOcry2ZhAagE6G43Befkq2tSj+NgZG2ye5R5fDFgCr/0
	9U8jnIYL0sRZvHsvp5VIfdsgZFSChNkVg45xnzI88jRu7p4zJAv41+NxErttr1RpZ4f2
	Ay3g==
X-Gm-Message-State: AG10YOQzEpbYStECc4wrphm2ieDxRwjYm2356SdAvxjDDSOCpGctZ20eqjkig3jFrEJis+Wo527U9Q77fSR6Zg==
X-Received: by 10.50.141.226 with SMTP id rr2mr6438528igb.75.1453524933532;
	Fri, 22 Jan 2016 20:55:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 22 Jan 2016 20:55:03 -0800 (PST)
In-Reply-To: <1453433025-25280-1-git-send-email-armccurdy@gmail.com>
References: <1453433025-25280-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jan 2016 20:55:03 -0800
Message-ID: <CAMKF1sqwNy8HJ0taYMVT-yi8tOg24bFp7v2Syu_d4yG1SXQMJw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pulseaudio.inc: drop obsolete dependency on liboil
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
X-List-Received-Date: Sat, 23 Jan 2016 04:55:32 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 21, 2016 at 7:23 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Pulseaudio dropped its dependency on liboil in 2009.
>
>   http://cgit.freedesktop.org/pulseaudio/pulseaudio/commit/?id=25724cdd40283a00e6edd9449d0f3cf16823b41b
>

ah discard my another message.
but also drop liboil

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index ec73526..b278115 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
>                      file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>                      file://src/pulsecore/resampler.h;beginline=4;endline=21;md5=09794012ae16912c0270f3280cc8ff84"
>
> -DEPENDS = "libatomic-ops liboil libsndfile1 libtool"
> +DEPENDS = "libatomic-ops libsndfile1 libtool"
>  # optional
>  DEPENDS += "udev alsa-lib glib-2.0 gconf"
>  DEPENDS += "json-c gdbm speexdsp libxml-parser-perl-native libcap"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

