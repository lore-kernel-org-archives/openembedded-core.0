Return-Path: <lpapp@archlinux.us>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4202565C9F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 18:08:58 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id ij19so4769975vcb.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Dec 2014 10:08:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=kJDzmbHItr/CTPVRarAGCvyolrCDT9wgKqPnl2YYnFk=;
	b=P4q2H8c7gmGARtsbNJ8BytBrvMY0a8gO0T2QW90UlkH5KtMhggZCdSKDVYgkCFiS5n
	DeK+LBq3Niy95MwZ9r5gThjeTNfzeDvsETROLigCYq0r71kcVQypE3iMGH0FZ3nJdQ9U
	JrB+PypgzMaL8SCUC0GS8d8BueCY1TuOZDOPABW7WUzxwRjZw9cSzbVtji3xbu6GV77G
	3ND19USPu8uayG/KU6oGTfrfCuWh//tcRKi53+jB93CC7f6vkJGiUf1TZZr8vPoPmfmc
	LJLrk30IK9UJ8IekeF17ulIBghH9Yt0CysXLSGgowof2ELpGtn/Rd3XUJxc4xwEuP4FE
	4a3g==
X-Gm-Message-State: ALoCoQmUcCtyQWCBw7oHCMbWpp4CMpryEOIHj4d0pE1o6bcx+8l+jeTzOwiVAEHHFglcofKby/Nq
MIME-Version: 1.0
X-Received: by 10.52.37.201 with SMTP id a9mr24845602vdk.56.1417457339047;
	Mon, 01 Dec 2014 10:08:59 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.31.188.129 with HTTP; Mon, 1 Dec 2014 10:08:59 -0800 (PST)
In-Reply-To: <1417451798-28112-1-git-send-email-ross.burton@intel.com>
References: <1417451798-28112-1-git-send-email-ross.burton@intel.com>
Date: Mon, 1 Dec 2014 18:08:59 +0000
X-Google-Sender-Auth: BuePEGfplNfm_HHoRIobN5OpJPc
Message-ID: <CAOMwXhNv7vXjdgE0p6WQ1=H0TadbyEuFQ8ZLU0D=k-k+o_dcbw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] python: ensure all of Python is installed in nativesdk
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
X-List-Received-Date: Mon, 01 Dec 2014 18:09:00 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 1, 2014 at 4:36 PM, Ross Burton <ross.burton@intel.com> wrote:
> If any part of Python gets installed in a SDK, we need to ensure that all of
> Python gets installed to avoid replacing python in the environment with a
> minimal package set.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/python/python_2.7.3.bb |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
> index 50c751e..7f13e22 100644
> --- a/meta/recipes-devtools/python/python_2.7.3.bb
> +++ b/meta/recipes-devtools/python/python_2.7.3.bb
> @@ -161,6 +161,7 @@ require python-${PYTHON_MAJMIN}-manifest.inc
>  # manual dependency additions
>  RPROVIDES_${PN}-core = "${PN}"
>  RRECOMMENDS_${PN}-core = "${PN}-readline"
> +RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python-modules"
>  RRECOMMENDS_${PN}-crypt = "openssl"
>  RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
>
> --
> 1.7.10.4
>
> --

Is it worth referring to bug number 6735?
____________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

