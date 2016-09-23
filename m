Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 70D1960684
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 18:49:39 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 107so2243106uah.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 11:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gW6mflEtqNDSEbrA4EuB3459ujRnbimpDavX17BDVpM=;
	b=ANDU4Gb1vion9vuKKKXNaeEdAKED29alOYx3M12E+khNcnr5DjWabJ8u0sT0IzmC3I
	KFwxX88lww5gdXDzoOQM4ePV3cmf+V/H5bfRIfk8k2xDgQBFgqUcB9rxBD/vTm9c5wO4
	kT2OOkIsoo9rF53AHfi8+S4iE0j4sbQ00bVj4K8slP1DYmK6n/xbXLfWgPzn4rzIj4eh
	FbJyikKlQEa4QVZYAPixAHeJy7AZ2x1Eamub7vpSJVm+MRkShmVUi2dKht2GBAzPIVhf
	Hv4eUjIgWblWppIeaDFb4+OzaJEEaBY7cnFvyhnppVyF5EfVSPpuR7bTRrWkv4JN/nOq
	zbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gW6mflEtqNDSEbrA4EuB3459ujRnbimpDavX17BDVpM=;
	b=D1uFaFw4I8ezBd6bHeJzhwUr/+QSFKfU4q4tXee0QuwycsQpUxTGyqv4PrLejAdUbx
	ls0Vy3lEzSMgdzUhro/0Zu0Ofpz+mgBEOuE2OgrAuQK2a+sp/XgSvDX9jNiW5IetwZZV
	E/NIxBbSjSvN9o41DO92LCGw+nNi4HZYfZ0Aj57vxWijfTIbzAxVvN9Km8K5Pl+W2P/j
	j3h5SrNKuf3ADutnQGb6i6cCK9DCgvFZam2lQuSWJwGXM/0RpP+BU/Ni+aMK0X9IXiF1
	8M+7Wp88b34a9k/8SrjELdkTt3SzfknzlswO8nWi9+unhCSeTFeUrEGqTvZniz1y8A/4
	ZWIA==
X-Gm-Message-State: AE9vXwPsGfNIBAxmUN49rREYjogxb4qf6iYcMTOR+BackcbmKgV28zB81S9uz+KY6sLDoofTaNyJBniIJq44aA==
X-Received: by 10.176.2.50 with SMTP id 47mr5708380uas.173.1474656581495; Fri,
	23 Sep 2016 11:49:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.80.33 with HTTP; Fri, 23 Sep 2016 11:49:10 -0700 (PDT)
In-Reply-To: <20160923164301.560-2-otavio@ossystems.com.br>
References: <20160923164301.560-1-otavio@ossystems.com.br>
	<20160923164301.560-2-otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Sep 2016 11:49:10 -0700
Message-ID: <CAMKF1sp=h+c1MU4nU5vkXCWJLgTZa6jXSf1f4B0QOn0A8XbvkQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] tune-ppc[65]00.inc: Disable QEMU usermode usage
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
X-List-Received-Date: Fri, 23 Sep 2016 18:49:42 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 23, 2016 at 9:43 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> The QEMU usermode fails with invalid instruction error when used with those tunes.
>
> The issue is being tracked in [YOCTO: #10304].
>

Does this option remove using particular SPE option when invoking QEMU
in usermode ? if so there may be another issue where these
instructions are emitted by compiler and they wont be emulated.

What will this change do which fixes the problem ?
from bug it seems it needs a Qemu with 32bit ABI, are we building that
version of qemu-ppc

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  meta/conf/machine/include/tune-ppce5500.inc | 3 +++
>  meta/conf/machine/include/tune-ppce6500.inc | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/meta/conf/machine/include/tune-ppce5500.inc b/meta/conf/machine/include/tune-ppce5500.inc
> index ace2614..cebb244 100644
> --- a/meta/conf/machine/include/tune-ppce5500.inc
> +++ b/meta/conf/machine/include/tune-ppce5500.inc
> @@ -18,3 +18,6 @@ PACKAGE_EXTRA_ARCHS_tune-ppc64e5500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc
>
>  # glibc configure options to get e5500 specific library (for sqrt)
>  GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'e5500', '--with-cpu=e5500', '', d)}"
> +
> +# QEMU usermode fails with invalid instruction error (YOCTO: #10304)
> +MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'e5500', ' qemu-usermode', '', d)}"
> diff --git a/meta/conf/machine/include/tune-ppce6500.inc b/meta/conf/machine/include/tune-ppce6500.inc
> index da1e864..5db7e76 100644
> --- a/meta/conf/machine/include/tune-ppce6500.inc
> +++ b/meta/conf/machine/include/tune-ppce6500.inc
> @@ -19,3 +19,6 @@ PACKAGE_EXTRA_ARCHS_tune-ppc64e6500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc
>  # glibc configure options to get e6500 specific library
>  GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'e6500', '--with-cpu=e6500', '', d)}"
>  GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'e6500', '--with-cpu=e6500', '', d)}"
> +
> +# QEMU usermode fails with invalid instruction error (YOCTO: #10304)
> +MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'e6500', ' qemu-usermode', '', d)}"
> --
> 2.10.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

