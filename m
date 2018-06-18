Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id E9C4175047
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 14:43:52 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id q4-v6so7640455pgr.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 07:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=EtNWycQgyLAGdHJffF1qSeEN5SeAuLV6/M4FsPQcmgA=;
	b=B244rmuNfr0QKRa3BnV9fLBF3A6MxHndlYPCbHWYRKxhvJ6cGWbEoa+mQJBtGOdMIj
	Y5tog+wDX90Z+hDOZX/xAwFRWTr3HnTocD/WJp/kJASdFDcWjiUGfBqkhB+tM6AQLJKO
	H1hRqyRkntM4VjR1WDLhJJAt5ay41bssY3hucXrjoEOUUBsYbinVJuUZtJJuRG52Zlie
	YDxeA7EF+OprfxXcu76VNrFhS+oCrEc4zTju3bLSq8e3Obg7d9rknsbjULQMNOVIn2wm
	Q0V2WfdzY0QLqUZg4JnIcS0uV9I5h6b0fRqloovKyQrr/zSdCf3GKOvzNIvFHmAlvN6P
	2EjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=EtNWycQgyLAGdHJffF1qSeEN5SeAuLV6/M4FsPQcmgA=;
	b=GyZbsPJaCJ4GG+iXeBn7TvepL5KI9CwV2Mek6JtvQK+F7NnUDKEIFhokx4u8tPc67c
	r2w3rsWbK0HCD5YVgR7Fcg2f3brTP4HI1m3Eg3JTuK1/H6XHByp+8D91hfEqtcBwJS/S
	T9qDOSb4GNEJJklJj2unEH//2X/0sWlxRYDCDANnL1DRSyV7SLySfieMnj1BycXM8ZvM
	3s0nlWhD5xmqlPvgKVQ+cbkvN3+FDpDJMwPF6dTm4dDcu0dyTw5t7cTdYR7d2GgZLsT+
	SKzLdfi7nR2wF2YLQJPi0EoAjYJh4Tw/LUw6DI/mhYDYE4ql5zvWhww7mXfFPU4t882X
	Qjvg==
X-Gm-Message-State: APt69E270J5gXVPx7TlHa9akQNNQ3rkbtBTJt1jhP99tV/Lfnznpfpo9
	OBq4ax5pijxys6AzUke3VUCw/Q==
X-Google-Smtp-Source: ADUXVKL27xmu1PUGD8s9sDPE02qgAEIZ9GWDvmKVZGMsNuFd7FrBMTSDlJ5hRRiy2if5CmLFqvDGaQ==
X-Received: by 2002:a65:5d4a:: with SMTP id
	e10-v6mr8203932pgt.25.1529333034045; 
	Mon, 18 Jun 2018 07:43:54 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:eb:1883:34e0:8f40?
	([2601:202:4000:1184:eb:1883:34e0:8f40])
	by smtp.gmail.com with ESMTPSA id
	n70-v6sm33184002pfh.140.2018.06.18.07.43.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jun 2018 07:43:53 -0700 (PDT)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20180618100538.7431-1-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <30eef550-3dd5-bb4a-299f-4e9c00113bfc@gmail.com>
Date: Mon, 18 Jun 2018 07:43:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180618100538.7431-1-ross.burton@intel.com>
Subject: Re: [PATCH] xf86-video-omap: remove
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
X-List-Received-Date: Mon, 18 Jun 2018 14:43:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 06/18/2018 03:05 AM, Ross Burton wrote:
> This driver is dead upstream and doesn't appear to provide any advantage over
> upstream kernel drivers and xserver's modesetting support.

works for me. please remove from maintainer.inc too

thanks,
Armin
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../xorg-driver/xf86-video-omap_0.4.5.bb           | 41 ----------------------
>  1 file changed, 41 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb
>
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb
> deleted file mode 100644
> index 0430f67b40e..00000000000
> --- a/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -require xorg-driver-video.inc
> -
> -SUMMARY = "X.Org X server -- Texas Instruments OMAP framebuffer driver"
> -
> -SUMMARY = "X.Org X server -- TI OMAP integrated graphics chipsets driver"
> -
> -DESCRIPTION = "Open-source X.org graphics driver for TI OMAP graphics \
> -Currently relies on a closed-source submodule for EXA acceleration on \
> -the following chipsets: \
> -  + OMAP3430 \
> -  + OMAP3630 \
> -  + OMAP4430 \
> -  + OMAP4460 \
> -  + OMAP5430 \
> -  + OMAP5432 \
> -\
> -NOTE: this driver is work in progress..  you probably don't want to try \
> -and use it yet.  The API/ABI between driver and kernel, and driver and \
> -acceleration submodules is not stable yet.  This driver requires the \
> -omapdrm kernel driver w/ GEM support. \
> -"
> -
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
> -DEPENDS += "virtual/libx11 libdrm xorgproto"
> -
> -SRC_URI[md5sum] = "3b8ea5e8fba63355c0dc6681c49d5fe5"
> -SRC_URI[sha256sum] = "93e7d42107521e61f61980eaea64fb452e87b7b94272e48938ac8d904ccfab5a"
> -
> -CFLAGS += " -I${STAGING_INCDIR}/xorg "
> -
> -# Use overlay 2 on omap3 to enable other apps to use overlay 1 (e.g. dmai or omapfbplay)
> -do_compile_prepend_armv7a () {
> -        sed -i -e s:fb1:fb2:g ${S}/src/omap_xv.c
> -}
> -
> -python () {
> -    if not bb.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
> -        raise bb.parse.SkipRecipe("'opengl' not in DISTRO_FEATURES")
> -}
> -


