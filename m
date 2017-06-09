Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 044C678253
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 01:43:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 70so9705757wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 18:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bw7JJa8T5mfOlMJZ7/NhvoR3fWi0fj5tvHQSPIBwI/8=;
	b=pJyDDDOvGlG0eq5GkU3w1PAdhFrfTn1jLZsYsaS3LBVYq+0oQePRsPCNzW6Q2IbavY
	M419aD6FGQYjC5O3t97cTl8IQTLYBvf25GfeAsAfH0OuRSkhT7c2apRnuT5Jp9QDFaQD
	s51G2P1JEOgIeb3inCxKUPZsb5ikB8QGfN89fGa7DqD2yJdcStr3nGVbAZwteuzz3cY1
	BPClwVFpYAZLpxqyk9gxS0/bW7eWn4INQxCwUwEuoe5DM2gjV3jePUycGB7hsZwzd//V
	PWyjUKCi2TiF+EgW6oFH/McyvcD4kza+IIL//dfje3ZDrIlTQoPvCD4q9dCqZO7i3snv
	Q2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bw7JJa8T5mfOlMJZ7/NhvoR3fWi0fj5tvHQSPIBwI/8=;
	b=jJt3ocM46RXZB6N5aiQlHW/Bbt37oyYhd2Cg0yKX3TtT2WMN2un6q+ii0lhLNKSp43
	oUkv/a67dNzWWw8obYUomqAlMrXQmcY3pyiazFihEzVb26IGkkbAvMqauK6j/bk5vXKH
	jU8lqB9jJ7a/p2Tb8B6hnBWrACuUYZtYagvtEmJVOu1xYdyXfYsBXPJPZG8NWi3dZ/nN
	T+yRJ2l4xpfV96sdA42neBQICmfpstDsmI/afw9aNWEUqiq9lzpLZOGe1840xXlyC1hi
	PC/uf//dhb5njB3EJWNsxe9qtNyNdASCXkUfE0XS21hMKvhiWmFbMGBs/eL8DnXcS4NR
	Fc8Q==
X-Gm-Message-State: AODbwcAjwCgcRHc5ymi7re/MEHLmCty1+voMwU03kEubrl+yTJFc6F/X
	ntYJcW3vOEROJTnHOPHkRoK0GnbzUA==
X-Received: by 10.80.171.197 with SMTP id u63mr12265685edc.127.1496972590368; 
	Thu, 08 Jun 2017 18:43:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Thu, 8 Jun 2017 18:42:39 -0700 (PDT)
In-Reply-To: <1496972359-6459-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1496972359-6459-1-git-send-email-fan.xin@jp.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jun 2017 18:42:39 -0700
Message-ID: <CAMKF1sqtRLkSFJMJ1zBHnMhX_4Sxa-sXUexL=tYJLwsL3m4Jaw@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] flex: Upgrade to 2.6.4
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
X-List-Received-Date: Fri, 09 Jun 2017 01:43:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 8, 2017 at 6:39 PM, Fan Xin <fan.xin@jp.fujitsu.com> wrote:
> 1. Upgrade flex from 2.6.0 to 2.6.4
>
> 2. Change the SRC_URI
>    Change SRC_URI from sourceforge to github due to the flex on sourceforge has not been updated more than one year.
>

how has it been tested ?
I think it needs to be tested with meta-oe before it gets into OE-core.

> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> ---
>  meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.4.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.4.bb} (90%)
>
> diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
> similarity index 90%
> rename from meta/recipes-devtools/flex/flex_2.6.0.bb
> rename to meta/recipes-devtools/flex/flex_2.6.4.bb
> index ab35b09..038aa37 100644
> --- a/meta/recipes-devtools/flex/flex_2.6.0.bb
> +++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
> @@ -10,7 +10,7 @@ BBCLASSEXTEND = "native nativesdk"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
>
> -SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
> +SRC_URI = "https://github.com/westes/flex/files/981163/${PN}-${PV}.tar.gz \
>             file://run-ptest \
>             file://do_not_create_pdf_doc.patch \
>             file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
> @@ -19,8 +19,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
>             ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disable-tests.patch', d)} \
>             "
>
> -SRC_URI[md5sum] = "266270f13c48ed043d95648075084d59"
> -SRC_URI[sha256sum] = "24e611ef5a4703a191012f80c1027dc9d12555183ce0ecd46f3636e587e9b8e9"
> +SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"
> +SRC_URI[sha256sum] = "e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995"
>
>  # Flex has moved to github from 2.6.1 onwards
>  UPSTREAM_CHECK_URI = "https://github.com/westes/flex/releases"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

