Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0E63675051
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 09:31:48 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id r16-v6so54612775oie.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 02:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sx9B84EQXdmrwMbfRmVzspFdIRE7giy8sL5GIMYhfbU=;
	b=iC9PXKkDX4Nlk/V3OnBTa0ybLN7b5Ti6H3Uo/IvNJ5jQkz+xOrbGfnPWza7B6JZvSk
	c31jij+qC8XTnsC7rVFOwCnhp8LTyHKJOH3B3L8NDoYDAf9upZfDwC1x6DgIOsnMmrnI
	/wR2G+udsPtV7ZHVEQ5F+tQAREnQptyML5NlA2zL6nDBJpuc+wUHxISKRmoib9BNRYkO
	r5j6BLqyufF1zL3SFOgyuDFP32/3RbeWIvPv4EklrvFJvuuxwwemN1p+l8U6u4c3OZKV
	7P9iHAWmxSdBZJw5PJ9IzTy9nhYGrARSDTY4GBkE6zSqbqZ2NqJ5h2KYCGjs8QXCmbjm
	9BUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sx9B84EQXdmrwMbfRmVzspFdIRE7giy8sL5GIMYhfbU=;
	b=AgeMsLEDwHHaonUB2r7k/7VF38hZUTMDBx9GIPHqUGYB+OI7UaHXBE4SgIhzG7IViY
	TBDg95IzT7lSDl/YjDSEJ4dA3HhoIsfM4PuOck4vxXEfi5A8UfrHmiwm+yWC6jK0Ipx7
	tnh/saLu/EP5X0jyWnvDDrt2bscoOjDEN+DoO4sypiRDy7mFANM9tlP4AbQd0Z5wejYE
	p/L5p8/odZL7EbtycVnlHkj8H3iOmJ/iegi1mqYcNQg6H2VmQED6C3UkETzdHyjaJ2kT
	1QFIG3SxryOUyxi01aW0Dm2MyckzX10inZap1ggnsBF2vFV2jBBEDsTa42e2EDgPz8NS
	GLjg==
X-Gm-Message-State: AOUpUlHNAcPIrm8SQcP5fYWxnBtgH4bpdjwL9/FmyfcCClM6Aq+795vu
	C2d6dfp6UN1TGWo4OTybdP8Rx061o/FJAN4jCKADLA==
X-Google-Smtp-Source: AAOMgpdjtBh9PEa+UF3md4IDyYkiblyAe1vjDzX8HIKtPzo5HyQHvZm4m0SqhJehlDebkerGzse4+OYxXtcUFexy4YE=
X-Received: by 2002:aca:5dc5:: with SMTP id
	r188-v6mr1519426oib.320.1531387909908; 
	Thu, 12 Jul 2018 02:31:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 02:31:29
	-0700 (PDT)
In-Reply-To: <ec0d3a1a70505f5eeebc8b03a8c84db285e90341.1531375710.git.Qi.Chen@windriver.com>
References: <cover.1531375709.git.Qi.Chen@windriver.com>
	<ec0d3a1a70505f5eeebc8b03a8c84db285e90341.1531375710.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Jul 2018 10:31:29 +0100
Message-ID: <CAJTo0LapzeveOe1xZtFo5FY_kPy2KxG2XdQH2aLpLtjyWM0-1A@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] systemd: change SRC_URI back to include musl patches unconditionally
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
X-List-Received-Date: Thu, 12 Jul 2018 09:31:49 -0000
Content-Type: text/plain; charset="UTF-8"

Can you squash this, and the other fixes, into the recipe upgrade?
Master doesn't need to see the revisions and fixes, and having commits
which are broken is bad for bisecting.

Ross

On 12 July 2018 at 07:12, Chen Qi <Qi.Chen@windriver.com> wrote:
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_239.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
> index 99fbfc1..ce8cc9a 100644
> --- a/meta/recipes-core/systemd/systemd_239.bb
> +++ b/meta/recipes-core/systemd/systemd_239.bb
> @@ -30,7 +30,7 @@ SRC_URI += "file://touchscreen.rules \
>  SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
>
>  # patches made for musl are only applied on TCLIBC is musl
> -SRC_URI += "${@d.getVar('SRC_URI_MUSL') if d.getVar('TCLIBC') == 'musl' else ''}"
> +SRC_URI += "${SRC_URI_MUSL}"
>  SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.patch \
>                 file://0002-don-t-use-glibc-specific-qsort_r.patch \
>                 file://0003-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch \
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

