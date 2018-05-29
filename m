Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id B26CA74C3F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 22:01:18 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id m144-v6so9861949vke.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 15:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A5OA2AD9kyUzbHqbwSkwr/7sOjJMQwxzz7jt8j+mXZE=;
	b=Gr1CD57Co95BgWjRvThkONnQnoNuQROnsmFxeNUaSiDTjbZBxhRSKs4kKE4ReEZP8I
	yEgk+JXGODMsPJ9QoSgUaf7bb8MaQ1/4UGbl8qEOaSHSP58Hphq5y9QkFs2RgC+FfJZC
	Nz1FX+2PcHSEo3jVIT/eoNPM00psuwtvf+SwxSQhlMObas9IZxn/uhq+csofUv5jwiHd
	fj0aNilWp2mpB7e343RrmdAepP4AYGc4JdVGH1MeprdrssvGydZ4TgrbAUXM6NCooR0v
	U61sLT0wPJ03bIhUygTjRP5um/crnYkNElp46ruBaNgyiZJ2wZJF9A2FjLLicZrNzMO3
	szpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A5OA2AD9kyUzbHqbwSkwr/7sOjJMQwxzz7jt8j+mXZE=;
	b=kxGGG0Td5lDF+Ro+Ha92tDvSep4t9bL79+OVVmmG4jYW1LRVG+dgNCvMT4Obwzc1Ot
	LpvvvtT0X/FefuoU9M/WMysdGx3YVu6JBAZ4ckN6ltK/v5dXKnIQkIbnnjXMAHznhtrE
	ZgFpFotLHQK5DUNJsTuUTMQrphCcpbiMacBfOg7lbptq3irxqOEPJDbTYj4Q8+OOpNsu
	or9Qy0+X2v3dd/GIl2+Hbw+2pbao7jKBLWyNFDgd9Zwn2rJNO/Rjg6MJb8+Wf343nAzf
	A/94wmzrEP3zyYxcABbI3AivR8pg3CoaWaML/WZZpnXJ2d6xexj6colly8jNSGqqAT8k
	pFBA==
X-Gm-Message-State: ALKqPwc/+1EJueKFb+znEh8oiAUKgTGYH1qAbGYHOlueLygOULXgztWV
	R3W99AjFyb/J05o6nxJ9Y1xrN2fQneeS5aTAGSY=
X-Google-Smtp-Source: ADUXVKLYIHq+btmGv4d+C3ac3stA3iPt9Hy1JPM4I+FGJ7me1GDoXSwUVYiLG8efzGzUbK/3pZAr2ys7tgrU/gC4VV0=
X-Received: by 2002:a1f:b254:: with SMTP id b81-v6mr124486vkf.20.1527631279231;
	Tue, 29 May 2018 15:01:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Tue, 29 May 2018 15:01:18 -0700 (PDT)
In-Reply-To: <5e17001bc93d4c8ba7eaa513080076cc1b382647.1527216285.git.liezhi.yang@windriver.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
	<5e17001bc93d4c8ba7eaa513080076cc1b382647.1527216285.git.liezhi.yang@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 29 May 2018 15:01:18 -0700
Message-ID: <CAJ86T=XjyBp=yJ1Ov6FM_FVfn+8twy92k4i+PFJhyy4W4xD75Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/24] at: add libselinux to PACKAGECONFIG
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
X-List-Received-Date: Tue, 29 May 2018 22:01:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 24, 2018 at 7:48 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> * add libselinux to PACKAGECONFIG for at
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-extended/at/at_3.1.20.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-extended/at/at_3.1.20.bb b/meta/recipes-extended/at/at_3.1.20.bb
> index 8fe3b43..b76e83d 100644
> --- a/meta/recipes-extended/at/at_3.1.20.bb
> +++ b/meta/recipes-extended/at/at_3.1.20.bb
> @@ -8,6 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
>  DEPENDS = "flex flex-native bison-native \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>
> +PACKAGECONFIG ?= "\
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \

The "new way" to do this would be:

  ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}

> +"
> +
> +PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux,"
> +
>  RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)} \
>  "
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

