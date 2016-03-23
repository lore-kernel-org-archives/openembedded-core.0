Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id A76436067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 03:51:46 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id p65so217081877wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 20:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=g7Jm0uO6dVqaHMUky4sJ5Kq0wyxm/leQLOPDfQ4mVjg=;
	b=PRR4OSpuKyMH/zMmFeLHh5UYaOz1M4bp9gTm/3OSjHD7/yzEK5Mmh0CeqBgciiUcCo
	jzaYpVhHW5I13ETX9B8t+8Z1knvQn2cM7EzlFHtrTqq1qjHVSksENFRHzyN73imUu7LE
	bSfp3fuAYrHum7g+FRBEYm3FSBWbqrpz/2NuR1STLln+AdQZggKXF/d5a0rFrWyLdGy/
	uAbTPyGXVe7P48c5ioXVuf6Rb5ZrRz2zdo03PBxouBC6YaqSC2em769ggAFFtMgvkbEj
	sCB4605I7Sq0+xbNt2/at9CUNQpLMJd73pgNOWiqEDjOijXzAatT+W5S6Tb4xOdSdlne
	H1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=g7Jm0uO6dVqaHMUky4sJ5Kq0wyxm/leQLOPDfQ4mVjg=;
	b=nNFHJwr1dy/yvxLFk9w/MNMv3y+nHz4t0ALC1fOto00J7V2DOaWxiOpC+zlIwNqXZF
	ib9mKEQs48MO96XU+MTAhnwqIOiZpGH6R2ZYh/s4ZKeIAS/lVN+oSzp05QtREzvMle5H
	t5syys3ikJP6tSHv85PzKv276Kxov+Xd63pbPecOoq8yu9bqQ4iWqiYaVj6WPg018fOd
	oNlVtPTnXwr5Y5k4RnsgDehXqkvYXyeNrEkHNowEUquJzIm0fuskEoD5CmO6xKcyArnQ
	I2ANTKccHLVRgSKV4ofyOiW151601yhbjnAnG0/+eiN4VaUHEHNYt8FHKcFZ5Skbpx5Y
	hsaw==
X-Gm-Message-State: AD7BkJJbJ7rje2uDCQgXnA/Wf++3/IG3nSZtX3fFXIuWMWP7FZ8Yj+ij/7isIqbhPMZRbdM/c5S9zzM9BR7UmQ==
MIME-Version: 1.0
X-Received: by 10.194.63.242 with SMTP id j18mr787944wjs.114.1458705106815;
	Tue, 22 Mar 2016 20:51:46 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Tue, 22 Mar 2016 20:51:46 -0700 (PDT)
In-Reply-To: <1458657857-10527-1-git-send-email-liu.ming50@gmail.com>
References: <1458657857-10527-1-git-send-email-liu.ming50@gmail.com>
Date: Tue, 22 Mar 2016 20:51:46 -0700
Message-ID: <CAJ86T=XbBusqrWkU=wdDWEJT5AHC+kEm=HcvNJgN01gEynjgBg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>,
	jian.liu@windriver.com,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libmad: avoid using legacy _thumb overrides
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
X-List-Received-Date: Wed, 23 Mar 2016 03:51:47 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 22, 2016 at 7:44 AM, Ming Liu <liu.ming50@gmail.com> wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> _thumb had been dropped from overrides since commit 351443d7:
> [ feature-arm-thumb.inc: drop legacy _thumb and _thumb-interwork over-rides ]
>
> Use bb.utils.contains('TUNE_FEATURES', 'thumb', **, **, d) instead.

Finding thumb in TUNE_FEATURES is not a valid way to determine whether
or not a particular package is being compiled as Thumb.

Since this recipe explicitly sets ARM_INSTRUCTION_SET = "arm", I think
the correct fix is simply to remove the "EXTRA_OECONF_append_thumb"
line.

> [YOCTO #9323]
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/recipes-multimedia/libmad/libmad_0.15.1b.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
> index 9e08b16..15a9d96 100644
> --- a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
> +++ b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
> @@ -27,7 +27,7 @@ inherit autotools pkgconfig
>
>  EXTRA_OECONF = "-enable-speed --enable-shared"
>  # The ASO's don't take any account of thumb...
> -EXTRA_OECONF_append_thumb = " --disable-aso --enable-fpm=default"
> +EXTRA_OECONF_append = "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' --disable-aso --enable-fpm=default', '', d)}"
>  EXTRA_OECONF_append_arm = " --enable-fpm=arm"
>
>  do_configure_prepend () {
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

