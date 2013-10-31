Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 001D96D257
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 03:44:53 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id at1so3969564iec.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 20:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ksgXp69YhQgxH9zvz3uauRtCS0YFS8a0f8u25mdfqZY=;
	b=znNqErEZqOEAKWRf1Vl3xdbdtUmWTrhtQoXhqyscVfto9O3v1d8x6RJhV6QSQo7iqG
	6nuCkPdSl18gOSvOxzihx0Q1Afv7cqMs2/rrmwOiQ+N4lk6g/pw9S+5KvSgkovmgrHJI
	Qwm6/tVTaJygpdrTL3goyI41XITT6e6a7YtGIr3SNzgUmJHcxFJxL1hmF2pI5O9HXSMr
	9Vjrv1j6mcLR5R0NqfbLkbj3QPnR10Zlo1oHGmA9VDnOf530o9L/wcJ8iyNL8UtYLbVs
	JCIBCJXj4t84qpPSdu7T08RQs7wSMTLKht9yebVI3W6ViOVNrWXbT3meA7fC/IiRDnQ2
	pz8Q==
X-Received: by 10.50.22.67 with SMTP id b3mr4823404igf.39.1383191095816; Wed,
	30 Oct 2013 20:44:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Wed, 30 Oct 2013 20:44:25 -0700 (PDT)
In-Reply-To: <1382970798-13574-5-git-send-email-ross.burton@intel.com>
References: <1382970798-13574-1-git-send-email-ross.burton@intel.com>
	<1382970798-13574-5-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Oct 2013 20:44:25 -0700
Message-ID: <CAMKF1sr=OGmHxJ4yz_h6R5_YKkzEN-3QcJZMhFhg_QyroZmQvw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] libgcrypt: remove --without-pth
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
X-List-Received-Date: Thu, 31 Oct 2013 03:44:55 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 28, 2013 at 7:33 AM, Ross Burton <ross.burton@intel.com> wrote:
> This isn't recognised by configure, and the random number daemon that requires
> Pth isn't enabled.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-support/libgcrypt/libgcrypt.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
> index 6a0e0cf..e0dfec2 100644
> --- a/meta/recipes-support/libgcrypt/libgcrypt.inc
> +++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
> @@ -15,7 +15,7 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.gz \
>
>  inherit autotools binconfig pkgconfig
>
> -EXTRA_OECONF = "--without-pth --disable-asm --with-capabilities"
> +EXTRA_OECONF = "--disable-asm --with-capabilities"

should it now depend on pth as well for deterministic builds.

>
>  # libgcrypt.pc is added locally and thus installed here
>  do_install_append() {
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

