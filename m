Return-Path: <danismostlikely@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2C6E27C1B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 14:34:12 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id u89-v6so8777457lje.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 06:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+6/EBkcBXTnoJ3CM2xcN8B2JMRgbAvMxHoB/mOzVNKA=;
	b=k5K0LcWj/Y8BAeczrnouA9dXd0Vju1ZAODv+t/yzHOA9J1zb+kEkKa4iraEyRJLJOd
	y28Zhtl+OlRLKxoRoeTzRHfYYE0YkFm7560DsXXCpb97z8E5IFLfPga7+FK2pXSILjiM
	v7SIYHvuiaMNI2WVNPA7+Ia3cqwl8rcPP85pgyqaOI/4ABkfN/dwZfdXvsL1zfZU0nBH
	LVrk/CzKit8FXaEFlkswWekOWmg6rP8834jptm0JEptZTOPWBNDBWeBkwQKtPI3vDC2D
	8EB14ExxcHx1b6q4sxfjSvBfasI6NVnZyYLc9/hW7Dsibpd5FDrQbjDltMwbGb43TrYE
	eBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+6/EBkcBXTnoJ3CM2xcN8B2JMRgbAvMxHoB/mOzVNKA=;
	b=d0UFZCBuSxb5RdTZOfLnvecBmHISle/+Jg95ssLNdXPJPH/m78eaGGm1AvHytOFfbv
	f9avvLiloN83uNrjDeycQYPWnsuynGFv6f+LXJCGkgBPrPNVV/Mhs8Tfl0sq2IXxjQ0O
	JluwsR2lFGCYOtWfLMguO0xDbcTZMeCFEMb+OgqA8xY/KAmd8uhJu1ucaW+GFGhqSGex
	hqsz+MWmzFHoLqnaf43zIuPXghKF5SLCGZ5dcENveRyiqetj8uuCSfmeyzEAd2YZYZ0Q
	2vD6SG7e06vXHnKzT19Hb8LC8ZLdRtHM3c27WHTNPgTb6PVk25xEg+1y4oPo3qgiVPXw
	5B6A==
X-Gm-Message-State: AJcUukc+gfxgKTnG2StgHggv3LF2lKQs4oY5Ns8+ggq7efDhJX5khJNS
	opwkWVdvx50rzFZY7QQo9Xz2JVg9VV57/JX0O2g=
X-Google-Smtp-Source: ALg8bN6IznJa6UKkbpAoT1eY97hUxse4zOyp3eiFq2HPEiUdWqIZQzPG3qw+6SonkEWlhjSIBsFdKCxgcYPHLn/YrSA=
X-Received: by 2002:a2e:7e04:: with SMTP id z4-v6mr9852254ljc.97.1547735652597;
	Thu, 17 Jan 2019 06:34:12 -0800 (PST)
MIME-Version: 1.0
References: <20190117071227.57387-1-kai.kang@windriver.com>
In-Reply-To: <20190117071227.57387-1-kai.kang@windriver.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 17 Jan 2019 08:34:00 -0600
Message-ID: <CACS+7ZTP43cySzvjex=beDWvJU=qh-jMC9G_RFDA_BRkWZRyoQ@mail.gmail.com>
To: kai.kang@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: reset default value of DEBUG_PREFIX_MAP
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
X-List-Received-Date: Thu, 17 Jan 2019 14:34:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Jan 2019 at 01:13, <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Reset default value of DEBUG_PREFIX_MAP with '-fdebug-prefix-map'.
> Specifying -fdebug-prefix-map is equivalent to specifying all the
> individual -f*-prefix-map options which means including
> -fmacro-prefix-map and -fdebug-prefix-map currently. Option
> -fmacro-prefix-map helps to avoid buildpaths qa warnings which caused
> by __FILE__ macro expansion for packages such as llvm and librepo.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/conf/bitbake.conf | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 0bdcd04d74..d20460e845 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -599,9 +599,9 @@ EXTRA_OEMAKE_prepend_task-install = "${PARALLEL_MAKEINST} "
>  # Optimization flags.
>  ##################################################################
>  # Beware: applied last to first
> -DEBUG_PREFIX_MAP ?= "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
> -                     -fdebug-prefix-map=${STAGING_DIR_HOST}= \
> -                     -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
> +DEBUG_PREFIX_MAP ?= "-ffile-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
> +                     -ffile-prefix-map=${STAGING_DIR_HOST}= \
> +                     -ffile-prefix-map=${STAGING_DIR_NATIVE}= \
>  "
>  DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
>

I like the idea of this, but it will break meta-clang until either 1)
https://reviews.llvm.org/D49466 lands, or 2) meta-clang sets its own
DEBUG_PREFIX_MAP.

> --
> 2.20.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

