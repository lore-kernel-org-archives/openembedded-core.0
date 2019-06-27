Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id DA4D57E9BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 16:21:05 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k8so6088212iot.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 09:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DoZ4W2+kkIE0x5NNfCrV9KclFHrDLErJ5L2NT14oVm8=;
	b=RNgjCg/DvRGyqnMZNwm5PiGtL1diwu3c/Smcts5UeB2Zm00IqgDE+zefyLu6XOpCvW
	t2ieFWwkP5Msre2KceN7DKSJHqNFpXwVrrqqcvSbPYcp/iV8c+m9CYHgtH+6+y+av1H8
	Ogqx8rUl86NDBndkkKdv+Q3k8VoSycbJq/QOXUVJALXctnsf8syNtx4096oa4q66nfu2
	cwXI8H8er/gxoS4BDBERyVnRgR/m39fb1zWaKLSfl/m9S5hGjK3yWmuaPc0wBvQJCzOx
	y/cOWrnY8EYicK9fdJMRhXMsD3a0Km5Zi4veQFcEu/0XqLISk/rEZkdFmDGOJArDJ0IZ
	e2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DoZ4W2+kkIE0x5NNfCrV9KclFHrDLErJ5L2NT14oVm8=;
	b=FYUcOzRtprIPdj9tV5vgU0UEsQyLTjsvhr+BE8hMUPYSM6OGXUiI9t0tOFoHsKHJqy
	nOoZQoiAMGWPdGriyjbdn2ATv+RtJ7eX6AbOGk3c1RUEuBH/AVr3EOFzxEgaVHjuJo5s
	HYeF1pNXc5cILTVLIpHCSsH5LSdU4bxpFtrOAkXUgrX8+DZja0J+G4DF4zujfp6kmDOn
	MAS+fxmjLrBDyCu1oVgbm7fmWDMMAWtYoz72S0B/rUDG2Zj17suOvqEb1V3rALIZm2a4
	q43FJ3EylPXwV80f4iPs37KYYPEv5Tm3jGzOsNuX+UtIITiCW4vnfXNGZs0yMzrpHgrv
	PJ4Q==
X-Gm-Message-State: APjAAAW547pQrRWZKE6IQ5+5KNne57Bx0st6wj4gVVRVHMjgwtA1hiGT
	xyot5fAD5q8/00l5nRhmT4Q5CyVYxLP/Am3BhSdE6Uef
X-Google-Smtp-Source: APXvYqwN/pRFasFwr3gwMxyrGVpdxdz1QBI+Avg/Yuyula9dMLgdjS8L39pH6Z7lon4UmUXJl0ogj62LUS2oEDUqAeg=
X-Received: by 2002:a02:b798:: with SMTP id f24mr5539622jam.97.1561652466916; 
	Thu, 27 Jun 2019 09:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190627135539.16014-1-JPEWhacker@gmail.com>
In-Reply-To: <20190627135539.16014-1-JPEWhacker@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 27 Jun 2019 17:20:55 +0100
Message-ID: <CAJTo0LZB=YWvB-1gY0fD0GrMs=_+bpE57veg0fq2f_6aexN+dg@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix documentation DEPENDS
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
X-List-Received-Date: Thu, 27 Jun 2019 16:21:06 -0000
Content-Type: text/plain; charset="UTF-8"

To avoid needing perl-native, can it be told to use the host perl?

Ross

On Thu, 27 Jun 2019 at 14:56, Joshua Watt <jpewhacker@gmail.com> wrote:
>
> perl is required to generate the OpenSSL documentation, and therefore
> should be present at do_compile. If not, OpenSSL will skip the
> documentation generation, which isn't reproducible
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1c.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
> index 01174073167..c57626d8f6d 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
> @@ -10,6 +10,8 @@ LICENSE = "openssl"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=d343e62fc9c833710bbbed25f27364c8"
>
>  DEPENDS = "hostperl-runtime-native"
> +# Perl is required to generate documentation
> +DEPENDS_append_class-target = " perl-native"
>
>  SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://run-ptest \
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

