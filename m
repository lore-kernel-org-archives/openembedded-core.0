Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id E28B47D72F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 17:50:41 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 201so13422329qkd.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 10:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mKF6sSOGYEPihDmmjHuIYVTOf/A532/Vbo1w1rXYEJU=;
	b=tlE61Xm0zARRPZlBnK71P4FzqmeuPS2EEUk0hpwyjmr+pk3pBr5k+/HjIMVJjev0qJ
	XElwkJkLL5Qvb5RY6oQNj6nDMNhq/Ph6tF5i1uoLAm3rjFT6c2TZBZJUhtyz3/R58cUK
	+bbNuZnyLJX/uA5pfAzqTuKGWrEEaWjq4euGdlrkXi6hePS+nOER0d211ZPpAluQGlcJ
	ci7QV7kdYjV2817PIUC223BW/xvHB2f/+nlUaLR4IauH1WobUfEtHcdF9aUyWSTeN+QL
	sK4YJWqEJ7fpl/d08aFLGbAE25kyGLVsCU7I2ResvDWf80C+71ahwN7gOaEqKazNC+Le
	XX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mKF6sSOGYEPihDmmjHuIYVTOf/A532/Vbo1w1rXYEJU=;
	b=Bbb/SOy+A9DguftHUXgD+90fRPrAWItF2rkJohr8EgB+WkjMPj/oEffhjUPgxareha
	iWrOXeKjInjGqmgmMBsovuN3PKfT+sEgQbo7XmBfV2GAC1hxW8Seo7bjNg6nJxwlIDAE
	OQTqr/zDIjefhWKXITNY6pj6hqbCT1L4xC4/DIzvz7COEwtwG1m7HHkhZX5uZigtqnK7
	xKJliis78FO4xsTxc+5FYxLhfCBAU+ood0Lh5KqGdG1YLxDtpx4p1bw38hcelYIdAXxz
	OoonkDglxuYIre+KUJkhXbRJs6NpLjEZfZC5J1NVSnd/4m1ea0tEn8IOvS++IXEaLmYp
	18ZA==
X-Gm-Message-State: APjAAAXVmyo0YVE8pUu0FyA5TNxbJs+p8G7KT640y2VoQ2eup1v56PxI
	fZDOiCcwvIsUxi4ZoTa+psAM8MLfl3EOPFOVsHc=
X-Google-Smtp-Source: APXvYqwwvNAQgEIz+MTAUHUNz9+U5VWmzf3myyLXvlnJC9bqYpTvh/lBoiJyjOmP67TKyFy1u86f15eGenLk+EzmovU=
X-Received: by 2002:a05:620a:653:: with SMTP id
	a19mr24695768qka.337.1570470642200; 
	Mon, 07 Oct 2019 10:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191007164757.29687-1-mhalstead@linuxfoundation.org>
In-Reply-To: <20191007164757.29687-1-mhalstead@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Oct 2019 10:50:15 -0700
Message-ID: <CAMKF1sqw9D1yvESM4Ark4gNCSTKVNCoLRwBgfnch3dVGDsBEGw@mail.gmail.com>
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: rpurdie@linuxfoundation.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] uninative: Update to 2.7 release
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
X-List-Received-Date: Mon, 07 Oct 2019 17:50:42 -0000
Content-Type: text/plain; charset="UTF-8"

this helps archlinux too

On Mon, Oct 7, 2019 at 9:48 AM Michael Halstead
<mhalstead@linuxfoundation.org> wrote:
>
> The 2.7 release updates glibc to version 2.30. Recently added to openSUSE
> Tumbleweed and needed for Fedora Core 31.
>
> Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> ---
>  meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
> index df24346855..ad75d3e2a3 100644
> --- a/meta/conf/distro/include/yocto-uninative.inc
> +++ b/meta/conf/distro/include/yocto-uninative.inc
> @@ -6,9 +6,9 @@
>  # to the distro running on the build machine.
>  #
>
> -UNINATIVE_MAXGLIBCVERSION = "2.29"
> +UNINATIVE_MAXGLIBCVERSION = "2.30"
>
> -UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.6/"
> -UNINATIVE_CHECKSUM[aarch64] ?= "a37118fc8b423f48146120707b81dd15017512c3e8ef9e6ca2cb3a033f4f4046"
> -UNINATIVE_CHECKSUM[i686] ?= "3234fc3ded810225071f23a0e9a99f4f8c2480059945a848eff076ce78122ade"
> -UNINATIVE_CHECKSUM[x86_64] ?= "133387753a9acf3e1b788103c59fac91e968e2ee331d7a4b9498e926ada7be57"
> +UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.7/"
> +UNINATIVE_CHECKSUM[aarch64] ?= "e76a45886ee8a0b3904b761c17ac8ff91edf9811ee455f1832d10763ba794dfc"
> +UNINATIVE_CHECKSUM[i686] ?= "810d027dfb1c7675226afbcec07808770516c969ee7378f6d8240281083f8924"
> +UNINATIVE_CHECKSUM[x86_64] ?= "9498d8bba047499999a7310ac2576d0796461184965351a56f6d32c888a1f216"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

