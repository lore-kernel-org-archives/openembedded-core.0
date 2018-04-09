Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f173.google.com (mail-ot0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA3C74880
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 12:43:03 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id d9-v6so6152035oth.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 05:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Pc9aIc6eff2k+Tn/uTdpP2Tm4zbFUHQ/tzpUrhq8MGg=;
	b=JjHmQqyAJcwbz04p+Ku/MKg0Oc5FmKpCvQMoFU2wG/89oEGzW+nmNC4n8d2TGTTTmS
	q8dKzFRT5XrnlkTWcqpokcpcmd6OBxbd5PoCBznucskZ/AvilZX1RidZDyIfwUb4cX/7
	cVWVQzCHxplkLU6tI740z1qvIM8KQjWYBVSBSkP1++p3OJ6YOnLZdu7k2XRqcGBnCZVa
	qni/+CXuDywQRV/RsEPWm/nA8jIQzIL11K/1z0DgoQS7r/4P2lxNK17wsoy0zi9aKOaF
	jVhdLrmHhsaDufnDF+OGR26d2T6DiXkcaCHhYTtAvdh59KdcgYjiBDhs4MKMjN2vmXLZ
	aFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Pc9aIc6eff2k+Tn/uTdpP2Tm4zbFUHQ/tzpUrhq8MGg=;
	b=fi1SMHPwIhhaRemGBTI/zUxKtL+gmDKstVE4DTbiDxAT4GwcvR6WebygkfNMj4clQS
	NxQlApYtZzoIYlel8RCEInQbdyCegvwdeTtRhZn8Yt8yL0i+9A8xTPCwaC14qMpJz8Zm
	f/spkJHDCyJsQjAQofGgFJIOL1qBkAzXPIlulIFM0nd0IJyPVHLylnUGoSiEEvJ4SiLw
	AnRuwFNgkYhuWQEtLUp2T+LezvBNzpBz/BbbjjZJy1cGiBqCjvVRjZ2C+ta8z2V9wc5w
	VMZr73gyQp9ost6U+suBIpI+qPI+/FWz1tq3H8QCXmGnnXp53TCQQLMcIeC7cLgByOw9
	g1eA==
X-Gm-Message-State: AElRT7HPvoGTlVt5N7KetesFuTJOBFBFCY6EQEsOQJAmfytnslT8b7o/
	npjdg6dcmmLeRWrs0IgFvGocSa5zz0qHZwUze0Mkhw==
X-Google-Smtp-Source: AIpwx4+8HG+cD1zcYkammWD2swQQkMNHeCfFmnXpVgElJwNB2ZJDyRhwuvRiy28wQpd1349TkZFjmKW6EvwJweQRgwE=
X-Received: by 2002:a9d:281b:: with SMTP id
	m27-v6mr21683193otb.89.1523277784886; 
	Mon, 09 Apr 2018 05:43:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Mon, 9 Apr 2018 05:42:44 -0700 (PDT)
In-Reply-To: <77190353e2d8d1a30e5ad5bc0e59d0754bedce3b.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
	<77190353e2d8d1a30e5ad5bc0e59d0754bedce3b.1522806183.git.akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Apr 2018 13:42:44 +0100
Message-ID: <CAJTo0La-27uJ4HBPynvn6fufpU-Y4BPkNpurv9kZ0gJGK3UW-A@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 17/21] xorgproto: add replacement for depricated calibrateproto
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
X-List-Received-Date: Mon, 09 Apr 2018 12:43:04 -0000
Content-Type: text/plain; charset="UTF-8"

Both the summary in the recipe and the git commit message are wrong,
also is there any need for xorg-proto-common once this is merged?

Ross

On 4 April 2018 at 02:49, Armin Kuster <akuster808@gmail.com> wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/recipes-graphics/xorg-proto/xorgproto_2018.4.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-proto/xorgproto_2018.4.bb
>
> diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2018.4.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2018.4.bb
> new file mode 100644
> index 0000000..f48a22b
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-proto/xorgproto_2018.4.bb
> @@ -0,0 +1,14 @@
> +require xorg-proto-common.inc
> +
> +SUMMARY = "XCalibrate: Touchscreen calibration headers"
> +
> +DESCRIPTION = "This package provides the headers and specification documents defining \
> +the core protocol and (many) extensions for the X Window System"
> +
> +LICENSE = "MIT-style"
> +LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=b9e051107d5628966739a0b2e9b32676"
> +
> +SRC_URI[md5sum] = "81557ca47ee66a4e54590fcdadd28114"
> +SRC_URI[sha256sum] = "fee885e0512899ea5280c593fdb2735beb1693ad170c22ebcc844470eec415a0"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

