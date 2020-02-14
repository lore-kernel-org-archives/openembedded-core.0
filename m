Return-Path: <masahiroy@kernel.org>
X-Greylist: delayed 500 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 14 Feb 2020 05:29:42 UTC
Received: from condef-10.nifty.com (condef-10.nifty.com [202.248.20.75])
	by mail.openembedded.org (Postfix) with ESMTP id A8FC760740
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 05:29:42 +0000 (UTC)
Received: from conssluserg-04.nifty.com ([10.126.8.83])by condef-10.nifty.com
	with ESMTP id 01E5Inoq024703
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 14:18:49 +0900
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
	[209.85.221.169]) (authenticated)
	by conssluserg-04.nifty.com with ESMTP id 01E5IhtI020798
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 14:18:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 01E5IhtI020798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1581657524;
	bh=9jksyxMKOlxH2keMnn7ZMNSFVqerXpzbW90PGjw1HNM=;
	h=References:In-Reply-To:From:Date:Subject:To:From;
	b=O0Cewi7kRBRYiGU9OgebzIIpdQdp6MI8ziN7jpV6VvZA0dN2kssrq3mrHxYzPM9ZC
	G2ekDMgwEi9yRs5qUVnKJxMUrwRtDVqdMhdLEMCfTK/p+yNdIGqCkLAj+wZH8ASehT
	cPvHzwWneDFPYgavMDLzSZGypCE+9gJWoURFaWNJ0E0ihBfot7wWPqh1ggSJfvg/6B
	6Hu+U9zqkh0ThfOUW3PuIYfAqjTqZhY9a8EGQ1IMCh8XljlyWwS6nkleV0Xb4reuOa
	56YAyiwK+08wnICaDqWtpORvcSdbb6rYYHOHi896BmP1UD4Wgv7LFU4NTXYwXbPxtL
	PMpCzPmHcWAYA==
X-Nifty-SrcIP: [209.85.221.169]
Received: by mail-vk1-f169.google.com with SMTP id o187so2281714vka.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 21:18:43 -0800 (PST)
X-Gm-Message-State: APjAAAWBdECm1LW8wtQLzLhSt0tW773/KcBGwwn4+YlrchVi8hw1TI8/
	o53mhPrTlZQ7r2pzWJVNeNt78ZJlvHkdL3DdnAg=
X-Google-Smtp-Source: APXvYqy7EfNg60BoNvEyLSI5h04p8C9nU/Lb+eLzFaSNQRwJxfVVzmAy/WAd2HGFlWbzHAdX4HNTVs3Dfdb8RjswTQ8=
X-Received: by 2002:a1f:8cd5:: with SMTP id o204mr826901vkd.66.1581657522832; 
	Thu, 13 Feb 2020 21:18:42 -0800 (PST)
MIME-Version: 1.0
References: <20200113123731.15117-1-masahiroy@kernel.org>
In-Reply-To: <20200113123731.15117-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 14 Feb 2020 14:18:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS4=j8GwZR48EZMZFuyUy6ed-ZK_yiDZ32QrMnVnq=y5g@mail.gmail.com>
Message-ID: <CAK7LNAS4=j8GwZR48EZMZFuyUy6ed-ZK_yiDZ32QrMnVnq=y5g@mail.gmail.com>
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] bitbake.conf: do not let DISTROOVERRIDES fall back to empty string
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
X-List-Received-Date: Fri, 14 Feb 2020 05:29:43 -0000
Content-Type: text/plain; charset="UTF-8"

Hi.

On Mon, Jan 13, 2020 at 9:37 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Commit abacd7243a2e ("bitbake.conf: fix distro-less failure expanding
> FILESPATH") mended the littered DISROOVERRIDES when DISTRO is unset.
>
> Some time later, commit b7279f996397 ("bitbake.conf: Default DISTRO to
> nodistro") added a weak default to 'DISTRO'.
>
> So, this line can go back to the original simple definition.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


Please let me ping this in case this was missed.
This looks like a good clean-up to me.



> ---
>
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 62b5466b71..d2b6ca840f 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -736,7 +736,7 @@ DISTRO_NAME ??= "OpenEmbedded"
>  OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
>  LIBCOVERRIDE ?= ""
>  CLASSOVERRIDE ?= "class-target"
> -DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
> +DISTROOVERRIDES ?= "${DISTRO}"
>  MACHINEOVERRIDES ?= "${MACHINE}"
>
>  FILESOVERRIDES = "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}"
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada

