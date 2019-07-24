Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1F8187EEBB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 03:03:36 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id y17so18448795ljk.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 20:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+bx9fltOdvMWdvGghL0WT+Lmt/b+CbzdeElp3d+a1GI=;
	b=BEHJVaQbGrlIiTAI6U1pV4qmP/B/TNjVv5kroY4667jVVIjuL+Iqkc/tch0nKJ8D9O
	P7H3QLN+WUBja9jsGDgAZER9NP0mbVt6//8LcuW/u2uY7Ts1T2EzLTPhq+hx4+Ag2Fpc
	FbGyHblzswRNDb9KwNszFJ33/BIYIKTsSLRMJjT/zxwj82OOBekQKG7CJZ3RkKpoRgBa
	LxhM7VSglKe0WFc06cAosWILMmC9e/tZ6S6izA5L/GvOYE8Y9YKbVE3u1FlyELZ6tE42
	EyFCpXQwDn+BJHvXuRDuJmzt1H77mMcbWsosAaT5pg9QyjG54JznEnilidA5TuvnU1J5
	/xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+bx9fltOdvMWdvGghL0WT+Lmt/b+CbzdeElp3d+a1GI=;
	b=DOkhQjhKTYXddJD0w24xRQvxrok/6KPMZ/Cdp3KL/7fINOdV4abB63aJrp+fsGEQGN
	aXvd0W8wYqRXtCYIAkel8LwGInxUyfBpf0FXadAUdeWJFQ/M+cRZXzkNHOYHkg2OHevG
	a81xK9w2XcD+WAiTMhlNh/WsoKEcDJj3ncQwgVcuVzsxEOC0JvaqxIo8ws6kRsyUyYW0
	erZt0Kc41V0qEH0C3K2xftMQZGHiBO/mtOye3X2TO5kD4i6dj0L7q1mhNjetNXeDSqSu
	p1EwlsEJM+drct5EPldmirom0Ks9+buaoGC5o2aGhKQxZUMbl+iqytdutsvN4RJ4cAtK
	zUNA==
X-Gm-Message-State: APjAAAXWCWfG6ETC8YZOY7JqsbKmIPcLKIkuM9dk0vcbt7tW7Czpt5k7
	gflnrB8MqKFynDNLswQYHK0ZyGowLgkFjDQSh+I=
X-Google-Smtp-Source: APXvYqwKxjU/q+aY87Is8NmaYeFM0OSEXJDLvkfujYTTu7eV7NUAIKoPYZWFwFM2J8p+QIRHY5JLw+KX3pY9O3ocy+0=
X-Received: by 2002:a2e:98f:: with SMTP id 137mr39167544ljj.232.1563937416521; 
	Tue, 23 Jul 2019 20:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190724023833.13718-1-Qi.Chen@windriver.com>
In-Reply-To: <20190724023833.13718-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 23 Jul 2019 23:03:25 -0400
Message-ID: <CADkTA4Og9UDHziXHSdN2VFvziRXm=dxtpFvMJvueAJrniOB-pA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] container-image-busybox: add a reference container image
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
X-List-Received-Date: Wed, 24 Jul 2019 03:03:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 23, 2019 at 10:39 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Add a small busybox based container image.

This really isn't a great container reference image. It isn't
manipulating many of
the things that you should be in a container image (linux-dummy, etc).

Have you seen the reference images that have either been presented at the
various ELC conferences and/or the ones that are in meta-virtualization ?
Or the ones from Togan labs, meta-overc, etc ?

IMHO, It would be better to collaborate on this in a non-core layer
for this release and
then consolidate things with the OCI image types, and when we sort out
if/what/when
makes sense from meta-virt into oe-core.

This is a topic of many opinions and different implementations and deserves some
cycles spent on documenting the choices, what we expect the base image to
do, etc.

Cheers,

Bruce

>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/images/container-image-busybox.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 meta/recipes-core/images/container-image-busybox.bb
>
> diff --git a/meta/recipes-core/images/container-image-busybox.bb b/meta/recipes-core/images/container-image-busybox.bb
> new file mode 100644
> index 0000000000..a4d63b0eea
> --- /dev/null
> +++ b/meta/recipes-core/images/container-image-busybox.bb
> @@ -0,0 +1,8 @@
> +SUMMARY = "A small busybox based container image."
> +LICENSE = "MIT"
> +
> +IMAGE_INSTALL = "busybox"
> +IMAGE_LINGUAS = ""
> +IMAGE_FSTYPES = "container"
> +
> +inherit core-image
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

