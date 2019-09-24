Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id D7E2A7F07B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:37:27 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id d66so112990vka.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 20:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Xq/rbU2c7jhDhg7+WYy1sQDdhitKbmDmDMI3IfmMhv0=;
	b=UdsMyPtECToASOh3w8S1770ZONwB0Mkf3ZivQ77Mc447JwtiSXISlLV+A6sATaQIHQ
	pd07Tv+1jch37rtsbWqWZ+ZPww89GBb3j5PatH7VHs6CzpoDImuZltS9KelLtk0oTf8X
	WXMVzVd17RB1R059YBmqupbAfI3yorlWOg/jdDIQATsTnTSHkFK3zPuGuoAqk+bR4gJI
	jKdKKP9G5LJW7KRCOzoUgQT0KY6r3mtcnONNrEu3BPJVJ3SNEPjQjsXcLy9xHG0KPrPQ
	e2vxcIl2kfrrMcFC/OMTTvgv3M8T0MQtbkofhfH27vY/NlxI/2lb0Vr9iqcLRgKbIVQ2
	RCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Xq/rbU2c7jhDhg7+WYy1sQDdhitKbmDmDMI3IfmMhv0=;
	b=g/9szCPk2z4/b5uz7Yudt/9ewsq4d6FB/3CVc8HHZSIpnwZT0tXlPDbOrdFfv3yPj/
	WOkGhpgi7+nHh88oYHwnyfrL8WHfNm1LHt3e9BNUmAA2U2T7r0R4iiRmE8BQ5N6BGNSG
	z1HmYg9qJrfVTxM3e6It7qRuwX113faaxGNVmlEH2OXrXYG33pjnyyBwFHjjuSZbmk4+
	a4VnZci6p+ABZEPw3+XbHtRFGneLhlRSmhtNkN5F5CQrMyS7vuhdjqY81BGvAlLlhAke
	LVjNe2DqOmQUawFcfrqWvg+uKrRT8RDvb7DOub8RGDlcCxWnIwdNujksgO98Q64Z1ynR
	QwMQ==
X-Gm-Message-State: APjAAAWyCH7awjoDib8JsCrhX2O8JW+SP/POuuLzNcnH+2CooVuMxPbo
	SLPbuEi7GocRBxn01HeCkgRvdmUvQi1FsHLn78E=
X-Google-Smtp-Source: APXvYqztimwkd4tnlBW2icDehtiGta3+KbUHqBmlrpwbBYN8pbtWQHXqidD+mU4Mj4Ak3rhkw7G/GSORRNeGRB6ColA=
X-Received: by 2002:a05:6122:9e:: with SMTP id r30mr483085vka.10.1569296247989;
	Mon, 23 Sep 2019 20:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569292053.git.akuster808@gmail.com>
	<e09f916e2b5ff8c7cef7cfd13b43a7f9d2463346.1569292053.git.akuster808@gmail.com>
In-Reply-To: <e09f916e2b5ff8c7cef7cfd13b43a7f9d2463346.1569292053.git.akuster808@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 23 Sep 2019 20:37:16 -0700
Message-ID: <CAJ86T=VijcAyk6cLv4hx2P74Ar2bbqVOHBgJpD65_aStBc9GfQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [warrior][ 25/50] boost: Fix build and enable context and coroutines on aarch64
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
X-List-Received-Date: Tue, 24 Sep 2019 03:37:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 23, 2019 at 7:52 PM Armin Kuster <akuster808@gmail.com> wrote:
>
> From: "Bedel, Alban" <alban.bedel@aerq.com>
>
> Like for ARM bjam need some hints about the ABI to properly build on
> aarch64. While at it also enable context and coroutine as these are
> supported on aarch64.

What's the symptom when this is mis-detected ?

I'm guessing big endian 32bit ARM (ie the _armeb over-ride) probably
needs the same fix too... but it's not clear how to test or confirm
that.

> Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-support/boost/boost.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
> index 9be3717..c2e2cbb 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -33,6 +33,7 @@ BOOST_LIBS_append_x86 = " context coroutine"
>  BOOST_LIBS_append_x86-64 = " context coroutine"
>  BOOST_LIBS_append_powerpc = " context coroutine"
>  BOOST_LIBS_append_arm = " context coroutine"
> +BOOST_LIBS_append_aarch64 = " context coroutine"
>  # need consistent settings for native builds (x86 override not applied for native)
>  BOOST_LIBS_remove_class-native = " context coroutine"
>  # does not compile
> @@ -151,6 +152,7 @@ BJAM_OPTS_append_x86-x32 = " abi=x32 address-model=64"
>
>  # cross compiling for arm fails to detect abi, so provide some help
>  BJAM_OPTS_append_arm = " abi=aapcs architecture=arm"
> +BJAM_OPTS_append_aarch64 = " abi=aapcs address-model=64 architecture=arm"
>
>  do_configure() {
>         cp -f ${S}/boost/config/platform/linux.hpp ${S}/boost/config/platform/linux-gnueabi.hpp
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

