Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C42A377B45
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 21:02:12 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id g65so7726040pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 14:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=m3ykegpx16NGtJTlmbfaReoKFPRqLKMEB/KnjppKIDw=;
	b=iPqjFWnLJB9LnpLLbGipk6Qj2hMSUsdp3yJCXQ1yHqKu4yy+GCEZxQaO7KeduDPZL2
	5g75zkPrXB//Z9Tc6+wkZ9awo4XGQvBRUuHKfAJ3Qwglq9xgGsVoWnZPlN5FFQg68Nld
	ae+LZa5EPxLYFNYd119MQ9hbykrkJcuGYnw8r53Lr+MYIZEjecbNqtRkQ1j+7M8yUYwU
	FQ2CaHGicbzzX79ABq4BRzWoe0sao34cZNRH+ATMltTEnk8ZuCf+YIYATENGc1WUVh3F
	s+V8qbgYgC8wE3qJX+uACjYdNrCxcmYFKlk10x320Gz3gg6MiDexUHRE/BP6uQrAUKxb
	b1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m3ykegpx16NGtJTlmbfaReoKFPRqLKMEB/KnjppKIDw=;
	b=Bd4Vx61+eKw8CyLf75CQdwODTvAbJt51u5etMhZko0inzlkV9VGDNrKwXS3DpiVxDi
	qJOMvAxv6P5amshBrk4gYWRV3gqE3kVCqZPJDS29QpctY6OMrRgYO8cYJeBQzNyspL+E
	PYuqWvPoHLSsSda/ZwxSNwNckQx3jjO28fYtzrj8ugvMaIDxudGc9IwORYndF4UcY3Fr
	ACVRScZR+tKPD6Ko2/3f2xE76qkfp52BeinnVGLxm4PJWgi7ESE6tpeh+evLLnSMSUqU
	Ou9KRZN4eMdQQmJ7ufVwGFgSkV8Nr3+twzHOSkzT06QYHS3du+Rb1QDwmGEypr5EAYId
	EMuw==
X-Gm-Message-State: AHPjjUhFVLx7+qgCYQjnSDMQmR0SL5TWfBkVqUttu1M/CkAVP7uHT1L2
	BEPygCSSz17EQp9OxB3gqA8qDXu1J95QvuvLVrs=
X-Google-Smtp-Source: AOwi7QAPwLNb0Gj2xEDFV8fu0sD8V49jRzYINyvDa+PCJlDdDAI39HuW2eDotMlMuh/+KjFEb3N3cWqhOq/vOB3McbI=
X-Received: by 10.98.157.74 with SMTP id i71mr2393207pfd.168.1506546133936;
	Wed, 27 Sep 2017 14:02:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Wed, 27 Sep 2017 14:01:43 -0700 (PDT)
In-Reply-To: <1506531609-5917-1-git-send-email-trini@konsulko.com>
References: <1506531609-5917-1-git-send-email-trini@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Sep 2017 14:01:43 -0700
Message-ID: <CAMKF1srXi9mNZejjSK2+1irS4neRHbK+BQyka-czvjPLsc8E2Q@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Fix bmaptool support for RSS
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
X-List-Received-Date: Wed, 27 Sep 2017 21:02:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 27, 2017 at 10:00 AM, Tom Rini <trini@konsulko.com> wrote:
> With RSS we need to ensure that when making a bmap image that the
> python3 that we created is found via /usr/bin/env rather than the host
> python3.  Otherwise we're relying on the build host to have bmaptool
> support installed.
>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
> I played around with a few ways to try and fix this problem, and this
> was the best I could come up with.  Once this is in we need this in pyro
> as well as it's broken there too.
> ---
>  meta/classes/image_types.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 61dca626311e..3ff960e3a889 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -311,3 +311,6 @@ DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
>  # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
>  # images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdddirect, hddimg, iso, etc.
>  IMAGE_TYPES_MASKED ?= ""
> +
> +# bmap requires python3 to be in the PATH
> +EXTRANATIVEPATH += "${@'python3-native' if d.getVar('IMAGE_FSTYPES').find('bmap') else ''}"
> --

I think somewhere inherit python3native should fix it.

> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

