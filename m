Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id D4C7D788B4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Feb 2018 15:11:36 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id q69so16369189lfi.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Feb 2018 07:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2/mYvpITZeqB0uiuD87VSLyY5tZnFgbm7N5HxUkJ0Ak=;
	b=ZVGpPOpwN6a/49NCdebhiejVU5Y/XFYLHKuf0PHGWh85SqDTLJhBRvh/TV/LNrk9ro
	rGATHyqOZQmGBgRuqy07Kx9xpu9S7zgNJ/w+wPskYU0XDdBQ/E4s+dx+LDruWu6U4YOK
	kT/NXGswuZvH4jTfokPSmHGnDWnd7BPio75zVMoDotIMnQMy/8JEc05CgOUjYQHG/XLb
	pdfBXDgTMGoY0ZaNW1Cq5lIDXaEgX/85FrClwXSHYBDCdoJ24f8lQriYxP+n2NKDjMxI
	MPG7F0fR8LfoYQbmkPAMAj85i2x/SgDhZpkNDBhNCqpYlBvk9+GkGTGpWV6x5JE9oF6t
	UyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2/mYvpITZeqB0uiuD87VSLyY5tZnFgbm7N5HxUkJ0Ak=;
	b=RjQo6dR8L8UFSj5uMu4UIJQv/uIIPaE8H7XtCYuIxzH1fJvuBcU15mqVh9fkSySyUf
	y9j2H4Lwn7XbGUDzekuPFo5WLdmerS+bwIN69KFW8mFsXHmQIATLbcvjlP75D2RknzDl
	GpnFzFX/udYXmYqutqPxQ+BFdJk5aj9vYxq5TX5BLwVw5X0ykMXvK6gD3L9NVBm4wN5k
	5nIQqlWfC5qhcdEg4SmciNPXdMha686Q/HUa5oxJw0hwaQ1kK3EjlwkYw9bgsjHUrWOI
	fVjW313E59lyw5fIN49dzY2VzZoahD3jeGVOxSIOkMJ6Ae5EXpIBzyx0zTfr+w58liZE
	3VJA==
X-Gm-Message-State: APf1xPDYIEnlYQjae0ss57Gesyw324BiyP9Ax7+KiLLNpzZJYkt1ssKb
	1tXnQX9urNSnkD+9jXEtrzlTbU8HL3CxT5/Lpac=
X-Google-Smtp-Source: AG47ELtc2vBEoGnUgs99Z0BFBZ292GzDtywf0EUipym49r1jJQ8tYW9chTrO50EI488KWSt3Rda28UzwAviUalTxFMc=
X-Received: by 10.25.181.8 with SMTP id e8mr3500491lff.94.1519485097061; Sat,
	24 Feb 2018 07:11:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Sat, 24 Feb 2018 07:11:36 -0800 (PST)
In-Reply-To: <1519445572-25411-1-git-send-email-akuster808@gmail.com>
References: <1519445572-25411-1-git-send-email-akuster808@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 24 Feb 2018 10:11:36 -0500
Message-ID: <CADkTA4OqTxuDpgLuVd2eutTjWNxLO7mRVpuo1K7p-_M_KycpeQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: akuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH 1/3] linux-yocto/4.1: update to 4.1.49 plus meltdown
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
X-List-Received-Date: Sat, 24 Feb 2018 15:11:38 -0000
Content-Type: text/plain; charset="UTF-8"

These all look good to me.

I was about to generate them myself, but you beat me to it!

Thanks,

Bruce

On Fri, Feb 23, 2018 at 11:12 PM, Armin Kuster <akuster808@gmail.com> wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_4.1.bb | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> index 316bc32..230f81e 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> @@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
>  KBRANCH_qemux86-64 ?= "standard/base"
>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
>
> -SRCREV_machine_qemuarm ?= "642e9b95f97f8e00ef819bbfb2f281c1079bfbb1"
> -SRCREV_machine_qemuarm64 ?= "782133d8166ac71ef1ffaba58b7cf81ec9e532a1"
> -SRCREV_machine_qemumips ?= "54d4575d0df1805e127c5fa59201cd978849fb3f"
> -SRCREV_machine_qemuppc ?= "58906f2737c644e67a7c9754b7e36630005a0011"
> -SRCREV_machine_qemux86 ?= "782133d8166ac71ef1ffaba58b7cf81ec9e532a1"
> -SRCREV_machine_qemux86-64 ?= "782133d8166ac71ef1ffaba58b7cf81ec9e532a1"
> -SRCREV_machine_qemumips64 ?= "03f0c0293abfe5226c2fdd22328476854fa0127f"
> -SRCREV_machine ?= "782133d8166ac71ef1ffaba58b7cf81ec9e532a1"
> -SRCREV_meta ?= "9f9c9a66ef3452343586adf150137967e955d71a"
> +SRCREV_machine_qemuarm ?= "8a40392c9aab6a3b25560c1a5d4a31d87a65a088"
> +SRCREV_machine_qemuarm64 ?= "a315195324973d3edbd4868a0d7acbd82b7d53ae"
> +SRCREV_machine_qemumips ?= "ea667187404992a98d49ea62313f826e6b7a9849"
> +SRCREV_machine_qemuppc ?= "8c3cd05eab5cf9c49847ed73d77f1d036808b5dc"
> +SRCREV_machine_qemux86 ?= "a315195324973d3edbd4868a0d7acbd82b7d53ae"
> +SRCREV_machine_qemux86-64 ?= "a315195324973d3edbd4868a0d7acbd82b7d53ae"
> +SRCREV_machine_qemumips64 ?= "4a026b26ffed34b40a7fb8fd190ee3eed964b5ea"
> +SRCREV_machine ?= "a315195324973d3edbd4868a0d7acbd82b7d53ae"
> +SRCREV_meta ?= "4e12cb8f8e06636f2058ea0ab3096ed38228a88b"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
>
> -LINUX_VERSION ?= "4.1.43"
> +LINUX_VERSION ?= "4.1.49"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

