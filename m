Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id EEA806E630
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 02:38:29 +0000 (UTC)
Received: by igk11 with SMTP id 11so3028415igk.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 19:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/oFoJn0XauU5mF5PRVsRodKBflROXHckb+rCJ+Otwfw=;
	b=iwKuVkJOup4fU+CdfJHoXTX6vE9mWGxk/yysibPaWWYXGvg5xCZ8ZjqqmhML3Pp3ba
	DxuYmrZCZUvvN+KU0RB7j2RJu49CCpMI54xvSM39mJdTHifHyz16U3pVKqtpLcjq9Y/u
	CejNxJkzFNGVC0i7SElAp9dCR2d65AdtVRdzXOXBeI94VU5J5MylDBBbOyGDoxD06LY0
	poFAPm4/kN1sSv52Samdt4Ln/S5bfXrVK2ezRBOe2+6jXulEbgznQcT5WnK59pm/LDGO
	ezyNsv0FUUBr87IS6vcOGP4m3VQLNGh9PB/aBqzQpg/MvuqXoyrPqSAbTFEqClG7Y+4N
	EhrQ==
X-Received: by 10.50.30.196 with SMTP id u4mr946924igh.11.1438828709488; Wed,
	05 Aug 2015 19:38:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Wed, 5 Aug 2015 19:38:00 -0700 (PDT)
In-Reply-To: <1438808330-21635-1-git-send-email-dv@pseudoterminal.org>
References: <1438808330-21635-1-git-send-email-dv@pseudoterminal.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Aug 2015 19:38:00 -0700
Message-ID: <CAMKF1soa767f4m+f0hdR8yVCXD3jMDtun0v6n0cL2Samsyxurw@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-base: Enable pango packageconfig by default
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
X-List-Received-Date: Thu, 06 Aug 2015 02:38:32 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 5, 2015 at 1:58 PM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> There is no discernible reason why pango should be initially disabled,

build-time will increase and it may not be needed by default reference
images in OE-Core but that may not be strong reason if it
spits our separate packages. Can you measure a considerable increase
in build time ?

> since the necessary dependency is already included in OE core
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
> index 06eac67..faecf13 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
> @@ -12,7 +12,7 @@ PACKAGES_DYNAMIC =+ "^libgst.*"
>  PACKAGECONFIG ??= " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
> -    orc ivorbis ogg theora vorbis \
> +    orc ivorbis ogg theora vorbis pango \
>      "
>
>  X11DEPENDS = "virtual/libx11 libsm libxrender"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

