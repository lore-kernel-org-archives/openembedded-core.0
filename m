Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 907FF79210
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 02:27:51 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id r1-v6so1314005pgp.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 19:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=qlkPYi8eGc+wMd1NxESBceVp0BcoTCxZNm3Jw6lruEY=;
	b=U9gtaOYi54eKCZZXC30XEUKJvpsazr0bmrrrrazardzUX2DP1tCLeS2PcnLXVMBGtz
	z9y+onsv1EDjTyT5IEBRZTnwpAWmfQ8RNKJXIzH447bbe8h6Zap78zIDGks97t4RAZAd
	dzpmAhyLP2hOBLLpo/INI94XxwBWxIuhMFtm61tFrDmqs+Yt+7/gWDm0d/BCqhy6y9/Z
	pUrcqUzw+XkgHU549Wbhdal2MRwE0xkC2hQlrJnk2MRBi68T8WNs/5zK92C0KgI4SkdP
	9ToTK4tV+61mbyfXSFreH20NqKQorgr6MqQPkljaYBTbZaaDllg8LbNxCGCycEQg0em5
	dr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=qlkPYi8eGc+wMd1NxESBceVp0BcoTCxZNm3Jw6lruEY=;
	b=dx50LdvY35mf61FX6NVCFsuvWA8HiA94+ppoiY919aGjvmRRno9KJepcPRuUzOvRWs
	P1N77SLEpC+xK5AMMXLuqOTrsCQkuUjkGuqrbO1yaXVxCHc6ts7niZqas1H7OwrumoTh
	+YkiakLz2N0XAPK/+K+/rGF/0kFrA9EmBXFAbP5j0psxOXas2g8Fd3QO8KlHkOA/nfrO
	+a5ej9/RnvudcA/K/+OpIiNdWTCIXEPrLklAtCDEMMhZgMmBoHCkhaf/lBRz8lVT0uQv
	Gr+iQSHBI2wUfLgAT3Igs0LMyGH33TrnyOj4VAzT0ldA1W1RoCs6645uybK0Kf27d38v
	CrXg==
X-Gm-Message-State: AOUpUlEV4CHLWZXeMH06zaJPib9OQEcZE17lFWzv7gAl7le1mBjZb2FW
	cvKm6xa5lg6BWZ2C/elXpyw=
X-Google-Smtp-Source: AA+uWPy1uu099bBTBO2yrhhQ29ELXQEnzrltEfkDu6a8MjgNeBeI3VTrR8ctvpYKlgiKDHnZwraoPg==
X-Received: by 2002:a65:4c02:: with SMTP id
	u2-v6mr27800346pgq.364.1534386472680; 
	Wed, 15 Aug 2018 19:27:52 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:a9e5:5db8:861b:fcc9?
	([2601:202:4180:c33:a9e5:5db8:861b:fcc9])
	by smtp.gmail.com with ESMTPSA id
	r11-v6sm25273099pgn.62.2018.08.15.19.27.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Aug 2018 19:27:52 -0700 (PDT)
To: Denys Dmytriyenko <denis@denix.org>,
	openembedded-core@lists.openembedded.org
References: <1534382547-55346-1-git-send-email-denis@denix.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <da127d48-fa98-c8c6-bae5-27ba6249e9d1@gmail.com>
Date: Wed, 15 Aug 2018 19:27:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1534382547-55346-1-git-send-email-denis@denix.org>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [rocko][PATCH] module-base.bbclass: fix out-of-tree module builds with custom EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 16 Aug 2018 02:27:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/15/2018 06:22 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Commit d2aa88a6a92985f21414fceea2dc0facbf7f8779 was meant to backport build
> dependencies on bc-native and openssl-native, but it also changed execution
> of do_make_scripts() from calling make directly to using oe_runmake. That
> change was made in master/sumo as part of a separate make-mod-scripts recipe.
>
> Unfortunately, that doesn't work here in rocko in the context of module-base
> class, as it gets executed inside out-of-tree module environment. Quite often
> those out-of-tree modules provide own Makefile with custom EXTRA_OEMAKE var
> defined. But do_make_scripts() gets executed within STAGING_KERNEL_DIR and
> cannot simply use custom EXTRA_OEMAKE set by a module.
>
> Move back to calling make and passing HOSTCC/HOSTCPP directly w/o using
> EXTRA_OEMAKE.

Got this stagged it my rocko mut branch for testing.
thanks
Armin
>
> For more details please see:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-August/154189.html
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Anuj Mittal <anuj.mittal@intel.com>
> Cc: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/classes/module-base.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
> index 9f3465e..c1fa3ad 100644
> --- a/meta/classes/module-base.bbclass
> +++ b/meta/classes/module-base.bbclass
> @@ -13,7 +13,6 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
>  export KBUILD_OUTPUT = "${STAGING_KERNEL_BUILDDIR}"
>  
>  DEPENDS += "bc-native"
> -EXTRA_OEMAKE += " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
>  
>  export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_BUILDDIR}/kernel-abiversion')}"
>  KERNEL_OBJECT_SUFFIX = ".ko"
> @@ -25,6 +24,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  # be called before do_compile. See module.bbclass for an example.
>  do_make_scripts() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
> -	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> +	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> +	           HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" \
>  	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts prepare
>  }


