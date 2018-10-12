Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 440F979BE3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 19:08:59 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id w1so12838421vsj.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 12:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uwBMwUERWF9eYv43YvQzEghOjdWwbami76IKD2QfCt0=;
	b=TRIsG+fbjlKrOcWPtCaC1STLju64KoIC1akBX7EO7dymyLEg1yic+PAWxFDodW1bkJ
	AjTh+obe3eGRGjcdtd0LIm4cUAa9MZ9IheDt6l+dhFJFRSReGccKnAupjvl3Pe0u5nU0
	haGrFyCyr2+m2UjInJN9bjMm5B+lDfZ6SqwNGdG2e8cJ/HicQOMD5tingBdjr5l29RLN
	nEj9bAXvwk0Z/2eSnJh7vHu6Ha9AORjFzv4gdK1kQ3r94/GLAEEpSma8Tc2e3XhT52iR
	aGA050WUhNzC48HmPFKG6svI4BiHk12F55bd7FkVjsBiylL79F9y+fDS3iwO3rOEjam6
	zUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uwBMwUERWF9eYv43YvQzEghOjdWwbami76IKD2QfCt0=;
	b=mJPjyRTlBTaQ2e3TL2LSeS3MmmQxD+ee1QvBD8y5kzVDn1SuEyjGPMbFRNFZxi9E3G
	PAUenmgwrttsf9LNKftwKLjXBTGVz+d3O97QkdLlouhbNoDWfJGIupqLOUO6DqvSFEGT
	c61VhkOdRVMrliFdpWPTTR2UL9YUIGX+haUE0AylT2sCY2UHDi9I9k6JXbU0dJBMFlKw
	1YINtagLvF8Vhz/blRbW+muYRS5s84e7JJjzqSmGQJw8W+qfShZokU2r9aHd4GOMTLOD
	idb6BBPOL2R/ata6LdYzvchSqd54UAa+1VI/FHkNv9Ce2FhBGBCSOnJMQTCZaa6+z1Hb
	MVAw==
X-Gm-Message-State: ABuFfogVg/5CyZ1YNkVU3+QWJle7m82Jx0T+AKCil53ndygtorCFveVX
	zi4KbMVakltm21ryuoluYpwrxfbI1J1gy3B7vI0=
X-Google-Smtp-Source: ACcGV63ucYJXLY74DOs5UwDqvW6jbnO3LLvIw0ACFt4G3x2tnyJJjMYtMPE3I3uSKAUwmWGg3cp9k9YuvoNc+gwNZDc=
X-Received: by 2002:a67:7344:: with SMTP id o65mr2932373vsc.223.1539371340042; 
	Fri, 12 Oct 2018 12:09:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2748:0:0:0:0:0 with HTTP; Fri, 12 Oct 2018 12:08:59
	-0700 (PDT)
In-Reply-To: <aef25553a12c8d7c896b4a99272e5d8064cae260.1539310768.git.Qi.Chen@windriver.com>
References: <cover.1539310768.git.Qi.Chen@windriver.com>
	<aef25553a12c8d7c896b4a99272e5d8064cae260.1539310768.git.Qi.Chen@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 12 Oct 2018 12:08:59 -0700
Message-ID: <CAJ86T=UftZhx1qDSw6p7V=vw2NL5LV0Lu5dwx+EafYr_mP6J5w@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] packagegroup-core-lsb/-full-cmdline: add bzip2
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
X-List-Received-Date: Fri, 12 Oct 2018 19:08:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 11, 2018 at 7:24 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
> We are having the following error when using 'tar' from tar
> recipe to decompress .tar.bz2 files.
>
>   tar (child): bzip2: Cannot exec: No such file or directory
>   tar (child): Error is not recoverable: exiting now
>   tar: Child returned status 2
>   tar: Error is not recoverable: exiting now
>
> The tar package is introduced by these two packagegroups into image.

Maybe better to enable bzip2 by default in busybox (we already seem to
have bunzip2 enabled).

> From the README file from tar's source codes:>
>   """
>   ** gzip and bzip2.
>
>   GNU tar uses the gzip and bzip2 programs to read and write compressed
>   archives.  If you don't have these programs already, you need to
>   install them.
>   """
>
> So we'd better cluster gzip and bzip2 with tar. These two packagegroups
> already get 'gzip', so we also add 'bzip2'.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb | 1 +
>  meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb          | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
> index e86168802..ffa8388 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
> @@ -125,6 +125,7 @@ RDEPENDS_packagegroup-core-full-cmdline-initscripts = "\
>      "
>
>  RDEPENDS_packagegroup-core-full-cmdline-multiuser = "\
> +    bzip2 \
>      cracklib \
>      gzip \
>      shadow \
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> index 933864a..6631547 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> @@ -136,6 +136,7 @@ RDEPENDS_packagegroup-core-lsb-core = "\
>      bc \
>      binutils \
>      binutils-symlinks \
> +    bzip2 \
>      coreutils \
>      cpio \
>      cronie \
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

