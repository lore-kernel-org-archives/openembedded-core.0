Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 763F27468E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 15:49:07 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id o16so4040084pfk.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 08:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1IcXk3RCtBW+Wys/I2g9pAOYE6B6kR4BBGG44ZrI3cw=;
	b=CHxU3fPV4zzKH/I4jGbDp0QmMwlIIS0jovdGL/bs47bzMWSEB1YREsA/T06cwAIjaP
	4NZ0KRKQFvBi3BGEQoa6UbdQB7H/6HkU/mFbEhzs1xzMtNWUMoIAOudbpDXzhLcpl8XN
	AJtFsYl69Wcq3T1Uwx0ytRvitdbvb2CvUXOo+Oh27NH0gCU2dvMEQl/W8x5qZ/YqODpw
	cKXxxLiWaQbFiMuFGuhO8aiIpQclNX9DA5SQLaSXTC7wpylNZYbCN4+gnJbTzXk3kxQU
	bT8pte+bvEKcR2dTiFnJSuVoo02qY8BddYoPJVhxsaVg+PWCrnr3DL/fHetpioqgd6Qz
	lrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=1IcXk3RCtBW+Wys/I2g9pAOYE6B6kR4BBGG44ZrI3cw=;
	b=EZoIiLRRdfjgeB3dJ+QlmznzzndjuY/Xz7+z/ZOsjvrKKO3kAHqvBwPhKXeytmwc/L
	6nS8IAfidFEYhDCAXA6JKujrSRprKjSVNpxBuBD/V9tnErhdan2CCR0F2JhHji0TUNW2
	XVqcDFNuv/VeonKuI1GLrZL0SDoVtbB/22ykM8+jB+yZCKambEw/eUQ3IY6L/fbegSdw
	segCbEve7rfaKHV34OogitqD2RFMUuQqIIBcmU5Sw7EFC26o+MKpHBzNxqMEoAGBLo4U
	2h51qRgiQRVGeE4FaL87b+xHGILIsACV8HHAPYool7kWQBKWpB3Q2hlQX60601dY/Fz6
	dxAQ==
X-Gm-Message-State: ALQs6tAJ6/lW5JH5/OZ92Yrb0FNrrKt/Q4Jhq3M9RkXKCy9f8NIavhoP
	EvOB931/hjhr5u4RPAXt46vwFPR6
X-Google-Smtp-Source: AIpwx49gXO1WPamK8fZgX5KI0eqMznrKycvBZ7Ed5vl5t5MlDj8e+jEaYjIi3CuhEIP4emvi1fiCVA==
X-Received: by 10.101.85.11 with SMTP id f11mr1131813pgr.252.1523548148466;
	Thu, 12 Apr 2018 08:49:08 -0700 (PDT)
Received: from ?IPv6:2601:646:8880:466c:b946:b3:7b1:a98f?
	([2601:646:8880:466c:b946:b3:7b1:a98f])
	by smtp.gmail.com with ESMTPSA id
	q62sm10938180pfd.61.2018.04.12.08.49.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Apr 2018 08:49:07 -0700 (PDT)
To: Alistair Francis <alistair.francis@wdc.com>,
	openembedded-core@lists.openembedded.org
References: <1523380197-2763-1-git-send-email-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <cb803b32-b0b5-559f-ab66-7e556f1a5e0e@gmail.com>
Date: Thu, 12 Apr 2018 08:49:06 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1523380197-2763-1-git-send-email-alistair.francis@wdc.com>
Subject: Re: [PATCH] meta-oe/numactl: Enable NUMA in the kernel config
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
X-List-Received-Date: Thu, 12 Apr 2018 15:49:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/10/18 10:09 AM, Alistair Francis wrote:
> If a user has specified numa in their DISTRO_FEATURES then they should
> have NUMA support enabled in the kernel. Without kernel support the
> numactl program is not very useful.
> 

This should be done in OE-Core as part of main recipe.

Note that this patch is sent to oe-core ml but is actually against
meta-oe layer which follows oe-devel mailing list.

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta-oe/recipes-kernel/linux/linux-yocto.inc           | 2 ++
>  meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend | 1 +
>  meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend | 1 +
>  meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend | 1 +
>  meta-oe/recipes-support/numactl/numactl/numa.cfg       | 2 ++
>  meta-oe/recipes-support/numactl/numactl_git.bb         | 1 +
>  6 files changed, 8 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/linux/linux-yocto.inc
>  create mode 100644 meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend
>  create mode 100644 meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend
>  create mode 100644 meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend
>  create mode 100644 meta-oe/recipes-support/numactl/numactl/numa.cfg
> 
> diff --git a/meta-oe/recipes-kernel/linux/linux-yocto.inc b/meta-oe/recipes-kernel/linux/linux-yocto.inc
> new file mode 100644
> index 0000000..9533eb6
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/linux/linux-yocto.inc
> @@ -0,0 +1,2 @@
> +KERNEL_FEATURES_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
> +
> diff --git a/meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend b/meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend
> new file mode 100644
> index 0000000..161f9d3
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/linux/linux-yocto_4.12.bbappend
> @@ -0,0 +1 @@
> +require linux-yocto.inc
> diff --git a/meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend b/meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend
> new file mode 100644
> index 0000000..161f9d3
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/linux/linux-yocto_4.14.bbappend
> @@ -0,0 +1 @@
> +require linux-yocto.inc
> diff --git a/meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend b/meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend
> new file mode 100644
> index 0000000..161f9d3
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/linux/linux-yocto_4.15.bbappend
> @@ -0,0 +1 @@
> +require linux-yocto.inc
> diff --git a/meta-oe/recipes-support/numactl/numactl/numa.cfg b/meta-oe/recipes-support/numactl/numactl/numa.cfg
> new file mode 100644
> index 0000000..fe1394d
> --- /dev/null
> +++ b/meta-oe/recipes-support/numactl/numactl/numa.cfg
> @@ -0,0 +1,2 @@
> +CONFIG_NUMA=y
> +CONFIG_ACPI_NUMA=y
> diff --git a/meta-oe/recipes-support/numactl/numactl_git.bb b/meta-oe/recipes-support/numactl/numactl_git.bb
> index b9cbcf0..ef2dab2 100644
> --- a/meta-oe/recipes-support/numactl/numactl_git.bb
> +++ b/meta-oe/recipes-support/numactl/numactl_git.bb
> @@ -21,6 +21,7 @@ SRC_URI = "git://github.com/numactl/numactl \
>      file://run-ptest \
>      file://0001-define-run-test-target.patch \
>  "
> +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'numa', ' file://numa.cfg', '', d)}"
>  
>  S = "${WORKDIR}/git"
>  
> 


