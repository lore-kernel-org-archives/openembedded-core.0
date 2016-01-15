Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f194.google.com (mail-ig0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id AF1E673174
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 08:21:29 +0000 (UTC)
Received: by mail-ig0-f194.google.com with SMTP id o2so679867iga.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 00:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SqvUO5FBMwKdcsvHj7Kwui3fSt8o9mANdiR9xo6sak8=;
	b=xBxjheoVhYeujlXTYGeyD2XR1PFJWAa/V8BlvYMtnqowBgXRki96qjvN4/U+XXU+1X
	Yr2yRTuxwfdGaedtExgelcTMvSMOhaYbb8XTSNWfaZY+6FnVXv4mi3xLSlIgHp4x8c0M
	Pzo2/PhHjp6ytOBJuDYqyTu/Jb12g7Vvi7j/v2AKcTQfl3/oVumXOECGmcbH6hP58EhJ
	dR4AblP2IuApKiYViz1Mdype7FrzP+8xtWgGGTULHtP0A8LTyz+euMpPvJSHNzNUCxNy
	GxpnH0au3myj2t7Ncj/hsjQF7wmyGVlfp4b65r5VBAkua41WGFZsHMbYtqFiyAz9pVg8
	xj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=SqvUO5FBMwKdcsvHj7Kwui3fSt8o9mANdiR9xo6sak8=;
	b=VqzLNOyJ9BpjYY+IenCdZtmTva4fkNCb12/RLhcda+4GgivkYbG6wvWdpirZtDcujZ
	6O93rlfF1cVjISepD/EWOdpQNzPgTno6SDEPXdEtMGKTpOEv+gUoQdrsg10HQlW0A7+d
	IrWjHsSuWV92yI6F64USs4Y84mLu0DaKfcKNOgnD6dnE1kk5xZPl0Tv1m7U2OPtyh0FV
	sNsJsprD4oGu2LEAehEFgd90u8HGRXikYffB2E25a733yCzKI8x11fsChxU+4PqZe+9x
	Xstys2BKsZi16kaKrC9nex4MjZohMFj5bdVDnQ18ERvT5I8qZVRHnT7riDphxpr6GQBl
	VeLg==
X-Gm-Message-State: AG10YOQzJWlO6NxIq8oYEbjmtJuUtYyLy4pxgiXg+RvdYQpd2TYXnyqUck7qG4kDvCT0SEOZ3vtqyIAfuE8jgg==
MIME-Version: 1.0
X-Received: by 10.50.30.69 with SMTP id q5mr1984112igh.78.1452846090049; Fri,
	15 Jan 2016 00:21:30 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Fri, 15 Jan 2016 00:21:30 -0800 (PST)
In-Reply-To: <66e32244aed8d33f1b49fbe78179f2442545c730.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
	<66e32244aed8d33f1b49fbe78179f2442545c730.1451286789.git.liezhi.yang@windriver.com>
Date: Fri, 15 Jan 2016 09:21:30 +0100
Message-ID: <CALbNGRQ+sJBd7+_knzSc4AQTFXdPAJRgGAHnX7B_EZGLy0nj4w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/40] gstreamer1.0-plugins-good: fix PACKAGECONFIG for gudev and add one for v4l2 and libv4l2
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
X-List-Received-Date: Fri, 15 Jan 2016 08:21:29 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 28, 2015 at 8:14 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> From: Martin Jansa <Martin.Jansa@gmail.com>
>
> * WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on libcap, but it isn't a build dependency?
>   WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on libgudev, but it isn't a build dependency?
>   WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on libudev, but it isn't a build dependency?
>   WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on zlib, but it isn't a build dependency?
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-good.inc        |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
> index 0ce4b8f..edaafe8 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
> @@ -11,7 +11,7 @@ inherit gettext
>  PACKAGECONFIG ??= " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
> -    orc cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib \
> +    orc cairo flac gdk-pixbuf jpeg libpng soup speex taglib v4l2\
>      "
Just noticed that this patch removes gudev from default PACKAGECONFIG.
Was that intended?

Andreas

