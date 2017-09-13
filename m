Return-Path: <alistair23@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id C05FE78667
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 20:08:09 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u48so607566wrf.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 13:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BaLhu1+1QI+N1Ut17wV+rlt3oicjs+PhTzyMBptN7OI=;
	b=STdnricWzo28w0y2uf61JrZnbvrazfhrxtgC488/84PKYDBJfGtQQav8uVyK+Pp8N1
	qD5NGR/FcUHfg0kql65XVzNVJdBnjh8d14eV3wc1/OUvuwuSa0fiWdrGUGeQk1DL/8im
	czb1Ml6Rr0m/3uRg3pNyfLSW4ZKyOMOrCyFoJuPEi15uP3NxlCQvkGKmwnlPnutNF6MN
	y0a4MeXPVvqBxgFwkbVMEnaGnqHs1Rqo86PEzAy4Tac4L/ofw0pkl2NDt65oSZ6GDdlR
	yelq5elByu0UmU5Gh7Lcpn6f/oGKjR+NoCpPAUbVDinY+yMZoBpbdGPO8h86jR1gy3df
	mg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BaLhu1+1QI+N1Ut17wV+rlt3oicjs+PhTzyMBptN7OI=;
	b=obzoOk89pdTa1rri5lRG1UVPSuB3kc20gY1MHVDK6JBPotA/7XitjCH5ehwixvouBu
	qBYoTHo3tBLD80E7KfzkpXi1rUX77vUfiCS6es5HwHrl46/3YNXzI8WUNSKfvfQgcVyL
	D/7HzBN9tuMmImZaz+6A4pGIHTNxV/hlLRmsPxo62IwQjEe6DNKctMtqMntIiYerwVjD
	8Nm5hSbJHGxN2vNpGx3PrIMJvKVmeHcvHFDFow5PYOiyH7bHxLNgwGqF4sMlHcfiu4jR
	dyt6fuM+2OMrMpunSPl5vwiZ3ClwAoGCwlLF5Y2t6LGL0ojG6TAgUTr7TrfFWZ6ZimXs
	XVDg==
X-Gm-Message-State: AHPjjUhkvhmiMigi8960xaoMB/viRJLNE0ShFQeE1PXAXVmBe47e70wd
	ZPEt3ACYLaNmsQtscu8a2wKpOo2kSQnevY7Zwr6uMQ==
X-Google-Smtp-Source: ADKCNb455PrhbJrkZNrjhs+dOICPUgg/v4cLtXQ6Dzv0v5iw4yyRTbXaV/E/4X6SQeqI2+OODknMCiix+9bRn6cQsHU=
X-Received: by 10.223.169.143 with SMTP id b15mr13057003wrd.127.1505333290513; 
	Wed, 13 Sep 2017 13:08:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Wed, 13 Sep 2017 13:07:39 -0700 (PDT)
In-Reply-To: <20170905150847.32681-1-ross.burton@intel.com>
References: <20170905150847.32681-1-ross.burton@intel.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Sep 2017 13:07:39 -0700
Message-ID: <CAKmqyKPiyBMAMDQZ6RG0envtnUto=n7jx0dxwgsqJaZvV=yMzQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: recommend shared-mime-info
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
X-List-Received-Date: Wed, 13 Sep 2017 20:08:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 5, 2017 at 8:08 AM, Ross Burton <ross.burton@intel.com> wrote:
> Large portions of GIO are not that useful without the MIME database.  Add a
> recommends to shared-mime-info so that GIO works out of the box, but can be
> removed (using BAD_RECOMMENDATIONS) if shared-mime-info is too large and isn't
> required.
>
> [ YOCTO #11792 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

This patch breaks openSSL compilation when cross compiling with MinGW.

Investigating the issue more at the moment.

Thanks,
Alistair

> ---
>  meta/recipes-core/glib-2.0/glib.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index d6ef4dfc0b0..ce15ccefc39 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -73,6 +73,8 @@ FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py \
>                         ${bindir}/gdbus-codegen"
>  FILES_${PN}-utils = "${bindir}/*"
>
> +RRECOMMENDS_${PN} += "shared-mime-info"
> +
>  ARM_INSTRUCTION_SET_armv4 = "arm"
>  ARM_INSTRUCTION_SET_armv5 = "arm"
>  # Valgrind runtime detection works using hand-written assembly, which
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

