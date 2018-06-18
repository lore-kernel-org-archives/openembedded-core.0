Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4CF751BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 22:10:44 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id w8-v6so10522219vkh.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 15:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jHYzn8QAajGb0LLQbpcNSGTWnF+HxEzFGCdXsL/Ql0c=;
	b=EYnpXyrKAKhUn57cHht4TjkC2klv1k2cQxOwxNU+QIUV+zGJYtFVAXosXjwu9nbr1Q
	YZLkx6vYZFM+8qL/9X5rV1LtKE3Yq0UfHNvviT5nir84w6QVufSe1jZZyzIQd6ef7o8h
	M8eQRIeDT7haJQF+R1b10FO1GxfzFnsOU6JzE9KL3ngwlmnc+Cg7/poefpOwOFW2/mlJ
	P++nMADDIV/YiWwXILiYalerArGgHrM8MA4Q4FFOgY4Ao5W8WWTZtUh+iAG66QbrwyWZ
	nCVtHzR6QbGqrs5pteHHgbDM0ssRBOy8DyhubDdP6L0KhvShnzlFIsFdLajs+2InUAUh
	04LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jHYzn8QAajGb0LLQbpcNSGTWnF+HxEzFGCdXsL/Ql0c=;
	b=R882uPugLCBiky9f6cS+0VmkpDZoOYaLjiwyvYbOeYT5XkknjVtsHA/EoX1kTLGdRn
	A9tTENtx8vBoBTEXrdJoYGi6+59svkrJf6hsmMOQkAhtxEg2sdIVLAA8eQxZ67MDVbqr
	aXual3HhkFQR2mX3vEYmqy7ocGTv1AXGMJfg73HfvW668dHPpTvLt3no2yeXGyelOzXL
	A5vKqbSHDD3okzFdDootF8bW7fT5TxWx8xF4u8b7Yt+ztQuOIiOJXjioFXEvSgJ15ByD
	j0L/xunFhhxUYNs9bSKN+Mz1QdLmCuhAoGksvRIXuQzh4Bjn5Ey25zpLGY7iwjgxMKTA
	YxxA==
X-Gm-Message-State: APt69E0mCN1vrlgR76HVLOpv7zJZfwHhU46NfEM8EHEq7R0B26WZ9anJ
	urkLZbse89lSgZXMcscD86E7Q8rc6mnpnwKKSks=
X-Google-Smtp-Source: ADUXVKKhDDotdMJnKMlZEf0AkrrQGxTIiTC8orUlurH9OBu26edXcxKYMERg/TpWU6gyWzFRR1Iy389t9c5KYv/mNuI=
X-Received: by 2002:a1f:5d85:: with SMTP id
	r127-v6mr8156358vkb.20.1529359845127; 
	Mon, 18 Jun 2018 15:10:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Mon, 18 Jun 2018 15:10:44 -0700 (PDT)
In-Reply-To: <DB6PR0601MB2133BF1D24EEC8F080A25DF8C3710@DB6PR0601MB2133.eurprd06.prod.outlook.com>
References: <DB6PR0601MB2133BF1D24EEC8F080A25DF8C3710@DB6PR0601MB2133.eurprd06.prod.outlook.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 18 Jun 2018 15:10:44 -0700
Message-ID: <CAJ86T=XAucDthyCjCJrpp_XyJ+fwm9b8LidkCqCJzzDcFyaWqA@mail.gmail.com>
To: Tobias Olausson <TOl@hms.se>
Cc: Magnus Olsson <Mago@hms.se>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] image_types.bbclass: add optional size to ubi vols
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
X-List-Received-Date: Mon, 18 Jun 2018 22:10:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 18, 2018 at 6:14 AM, Tobias Olausson <TOl@hms.se> wrote:
> From 6bd1c95cc26aebe820e3d83a97601e4057ef8db5 Mon Sep 17 00:00:00 2001
> From: Tobias Olausson <tol@hms.se>
> Date: Mon, 18 Jun 2018 15:01:53 +0200
> Subject: [oe-core][PATCHv2] image_types.bbclass: add optional size to ubi vols
>
> Instead of hard coding the ubi volume to be just large enough to fit the
> root file system, one can use a variable to set a preferred size.
>
> Signed-off-by: Tobias Olausson <tol@hms.se>
> ---
>  meta/classes/image_types.bbclass | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 00a00d318f..c53fb1fce4 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -164,10 +164,22 @@ multiubi_mkfs() {
>                 local vname="_$3"
>         fi
>
> +       # Set UBI_VOL_SIZE (for regular ubi) or UBI_VOL_SIZE_vname for multiubi
> +       if [ -n ${vname} ]; then

You need to quote ${vname} here, otherwise the test will always return true:

 $ [ -n ] && echo true
 true

 $ [ -n foo ] && echo true
 true

Wondering how much testing this patch has actually had ?

> +               local ubi_vol_size=${UBI_VOL_SIZE}
> +       else
> +               eval local ubi_vol_size=\"\$UBI_VOL_SIZE${vname}\"
> +       fi
> +
>         echo \[ubifs\] > ubinize${vname}-${IMAGE_NAME}.cfg
>         echo mode=ubi >> ubinize${vname}-${IMAGE_NAME}.cfg
>         echo image=${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs >> ubinize${vname}-${IMAGE_NAME}.cfg
>         echo vol_id=0 >> ubinize${vname}-${IMAGE_NAME}.cfg
> +
> +       if [ -n "${ubi_vol_size}" ]; then
> +               echo "vol_size=${ubi_vol_size}" >> ubinize${vname}-${IMAGE_NAME}.cfg
> +       fi
> +
>         echo vol_type=dynamic >> ubinize${vname}-${IMAGE_NAME}.cfg
>         echo vol_name=${UBI_VOLNAME} >> ubinize${vname}-${IMAGE_NAME}.cfg
>         echo vol_flags=autoresize >> ubinize${vname}-${IMAGE_NAME}.cfg
> --
> 2.17.1
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

