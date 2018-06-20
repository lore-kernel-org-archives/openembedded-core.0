Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id A0FA877D6D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 23:33:10 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id l11-v6so843475uak.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 16:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Iyu+SC76ZWSeEBvRU6rzjayD0hsUKXWBN5KqcglEy80=;
	b=k+ZtakjLTobTbTxOtVuOc1OgVQniSkVfi8ln9MIbGCm5/YsebV2kK/uiO/Yj7GBwwQ
	2P/An/YQr1itASaBAICicRYcq+rFhOYBatQX1PSSJWBEEQ1KvooNTPigz+DVtF8oymtv
	92swFm+XHgOUhriTOUQRe14hwx37ZpXPit05jqmkggVDD1whp99PleEOjwoNR1OeGuUN
	sCujOqUE/5cnrXvsaujR4lpAmCJwDQp5V9j/QX9mxmar+DSXnTcRQLDzNYhX6+ZZp0E6
	TWsFyaVZnN4Z4GNvYbCRU1qOpJ4+ZAsgvKixIuF1pK2b51B1z4b2OMn+z335W3rpud8S
	MtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Iyu+SC76ZWSeEBvRU6rzjayD0hsUKXWBN5KqcglEy80=;
	b=VcZBrIhiWb8pq2dDPaw08XUqL03ZMg5X8KMUcTUaOxseYcUbex0a46D1wqlIKhBbZO
	ucycwjvhCtB+qrCR0KRV0oHbcXip1+dvYp1e0ybmlG/GDvO53TclxZyZxDLLs+gMlK/O
	aELPZmhiRSnUQH80rZBEkQ/hpcTTOreGLhK/GBvn5HC9PxC3FieML84vKaJdn5MXXo6H
	8Aa1bVjU3P98F7TuxtsJ1SuXA7XWHy/x37NnnhllNwIYQJueXWUxIfC2uSlxiBfk87TS
	v+o58JWOHRj09Pqb3RtkwIXP8PYBIkPVLuWd16OdtUCC5E91sxZwwByqjJ+NWEPQAd1Y
	CwLg==
X-Gm-Message-State: APt69E1F1hEUUmMUPT9v75uaoPuabCiCbHGmps/tvpbLI43bviSujuQQ
	yvtZWnpzQWIupCOxoUOZLMX2UhlfurA5PIV+1fQ=
X-Google-Smtp-Source: ADUXVKLAFM4uXnzrUYRB4mPtCjSgJpkbGyRmTVumWSScrE5wRbTWn9OmySZBBO4VCenI4VHcrKDyLGagAx2o3dPJIhg=
X-Received: by 2002:ab0:59e7:: with SMTP id
	k36-v6mr7681501uad.81.1529537591457; 
	Wed, 20 Jun 2018 16:33:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Wed, 20 Jun 2018 16:33:10 -0700 (PDT)
In-Reply-To: <20180620052106.22306-1-raj.khem@gmail.com>
References: <20180620052106.22306-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 20 Jun 2018 16:33:10 -0700
Message-ID: <CAJ86T=Ux4NWkdBcSG68bCprxuDcjacwQJOgoTmQBMufveXXskg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-target: Enable fp arch extention when fpu is available
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
X-List-Received-Date: Wed, 20 Jun 2018 23:33:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 19, 2018 at 10:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
> This is especially needed when defaulting to hard-float ABI
> Fixes errors e.g.
> cc1: error: -mfloat-abi=hard: selected processor lacks an FPU
>
> Fixes [YOCTO #12795]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-target.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
> index 56e4b95af4..92cad28b7a 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -14,9 +14,9 @@ EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>  # specific). For example, for ARM, ARMv6+ adds atomic instructions that may
>  # affect the ABI in the gcc-runtime libs. Since we can't rely on gcc on the
>  # target to always be passed -march etc, its built-in default needs to be safe.
> -EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
> -EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
> -EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve"
> +EXTRA_OECONF_append_armv6 = " --with-arch=armv6${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
> +EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
> +EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"

Does this work for gcc7?

>  # libcc1 requres gcc_cv_objdump when cross build, but gcc_cv_objdump is
>  # set in subdir gcc, so subdir libcc1 can't use it, export it here to
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

