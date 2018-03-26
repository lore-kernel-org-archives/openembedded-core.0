Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2D61A606CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 12:20:52 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id m134-v6so5754385itb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 05:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SPGN4ZfyQ+J2xW2Q35uhdabpibdRqDDh6K+jBbSYVhI=;
	b=YfXXTMQ/i+HCFiiHM52oOZ/cTm/ee6RO46vOZ12ouHAQKaLLI030D2quapC4lu2uXe
	brtfhhblLuwQACnMZ0phS89QhJmdSAu224mdZ13gI5c8v2NW5pXS0Pj0Dw/3qk9FuYeH
	zOz2wdcKMzDBIXFZXJoe/NwMgteaaEAnw0CZ14KsEFxMTLkZ5vTPGxcy3m0O2O7GhnzY
	81xN06AjkY/qfJOxLYXtCf/gVpW5V1cnPfYoyNR3PD9/8OdOASscHY4fE40FkmaOj5S7
	4+hnn+n+i/daNiRcarq6qpGrc66KBAT9N1xe51Tfgx7Tdp31kPh0UMxXAqc80GPvJAoW
	Y3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SPGN4ZfyQ+J2xW2Q35uhdabpibdRqDDh6K+jBbSYVhI=;
	b=ZLHgZWfVw8lAsa/zbwzGPe04BcjXsBGKJhkMli4NyblnAqfRpYtERgoSnuqZ6/TYV0
	Z7L/NC/9dPWCWXOVcHTMC83EW2VsrNUm/p7EdNlpqRQdiEAsLFM3kj8GBXhoQsel8LXz
	AydoAASk7gDXWxvxvouuCrfiMJigMxSmDuk97RMoDH8+WBmOQ2GwBYYTtnzHUs/inA0q
	lEJUawk/BZwu8JzBQ3kFY3jcES4HgqCC9udEg5vZi8ChtdEgoXLTL01ERdiMU17wcklI
	d402VueK26rNKKFAvEHQpAE4tiV8ByTG7dpb/pSQGb4F8jSxS0s1Bz0YnxGyTLwzAmfE
	rV9w==
X-Gm-Message-State: AElRT7HQ5Hk2R6Xas6FxgCBW9E62h5DnQguc4tjhvxUBOVQAHxXWm48p
	3/IvS6NaWKDi7RKCcBtPcRRkQlLctn9e4CMpEOKlUg==
X-Google-Smtp-Source: AIpwx48rZzEGwHJ4XE2ZYrO/CHzVo4xf/oBydKovLAzZQ90WQbo8q599oxsQlk3Ztv1qZs+42EyJJ+5p+uZtKru4EFE=
X-Received: by 2002:a24:1f15:: with SMTP id
	d21-v6mr15641861itd.45.1522066854004; 
	Mon, 26 Mar 2018 05:20:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 26 Mar 2018 05:20:33 -0700 (PDT)
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Mar 2018 13:20:33 +0100
Message-ID: <CAJTo0LZ0w43gebb4P3ANPW++_9wz9HjfJMo_TKUX5BSWhs5_0w@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/21] PKG updates and QA warning fix
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
X-List-Received-Date: Mon, 26 Mar 2018 12:20:53 -0000
Content-Type: text/plain; charset="UTF-8"

All patches please, I occasionally send cover-letter only but thats
for consolidated pulls which are just pulling in patches which have
already been posted.

Ross

On 25 March 2018 at 16:00, Armin Kuster <akuster808@gmail.com> wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> Cover letter only
>
> Please consider these updates for master-next.
> nss has an outstanding patch sitting in the queue somewhere.
> Passed AB except failures not related to these changes.
>
> The following changes since commit f49ee61422c867516db252054e993df29f775136:
>
>   systemd-boot: upgrade to 237 (2018-03-20 09:59:33 +0000)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib akuster/mut-pkg-up
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/mut-pkg-up
>
> Armin Kuster (21):
>   ltp: add rdepend for procps
>   libpcre2: update to 10.31
>   xprop: update to 1.2.3
>   xkeypboard-config: update to 2.23.1
>   nss: update to 3.35
>   xkbcomp: update to 1.4.1
>   xinit: update to 1.4.0
>   xwininfo: update to 1.1.4
>   gnutls: update to 3.6.2
>   xeyes: update to 1.1.2
>   libshmfence: update to 1.3
>   xset: update to 1.2.4
>   xcb-proto: update to 1.13
>   curl: update to 7.59.0
>   mkfontscale: update to 1.1.3
>   util-macros: update to 1.19.2
>   nspr: update to 4.19
>   libxcb: update to 1.13
>   xf86-video-vesa: update 2.4.0 update
>   tzcode-native: update to 2018d
>   tzdata: update to 2018d
>
>  meta/recipes-extended/ltp/ltp_20180118.bb          |   1 +
>  ...code-native_2018c.bb => tzcode-native_2018d.bb} |   8 +-
>  .../tzdata/{tzdata_2018c.bb => tzdata_2018d.bb}    |   4 +-
>  .../{mkfontscale_1.1.2.bb => mkfontscale_1.1.3.bb} |   4 +-
>  .../xorg-app/{xeyes_1.1.1.bb => xeyes_1.1.2.bb}    |   4 +-
>  .../xorg-app/{xinit_1.3.4.bb => xinit_1.4.0.bb}    |   4 +-
>  .../{xkbcomp_1.4.0.bb => xkbcomp_1.4.1.bb}         |   6 +-
>  .../xorg-app/{xprop_1.2.2.bb => xprop_1.2.3.bb}    |   4 +-
>  .../xorg-app/{xset_1.2.3.bb => xset_1.2.4.bb}      |   4 +-
>  .../{xwininfo_1.1.3.bb => xwininfo_1.1.4.bb}       |   4 +-
>  ...ideo-vesa_2.3.4.bb => xf86-video-vesa_2.4.0.bb} |   6 +-
>  .../Fix-inconsistent-use-of-tabs-vs.-space.patch   |  62 ------
>  .../xorg-lib/{libxcb_1.12.bb => libxcb_1.13.bb}    |   6 +-
>  .../xorg-lib/libxshmfence/extensions.patch         |  14 +-
>  .../{libxshmfence_1.2.bb => libxshmfence_1.3.bb}   |   4 +-
>  ...d-config_2.22.bb => xkeyboard-config_2.23.1.bb} |   4 +-
>  .../0001-Make-whitespace-use-consistent.patch      | 215 ---------------------
>  ...print-is-a-function-and-needs-parentheses.patch |  75 -------
>  .../{xcb-proto_1.12.bb => xcb-proto_1.13.bb}       |  10 +-
>  ...util-macros_1.19.1.bb => util-macros_1.19.2.bb} |   4 +-
>  .../curl/{curl_7.58.0.bb => curl_7.59.0.bb}        |   4 +-
>  .../gnutls/{gnutls_3.6.1.bb => gnutls_3.6.2.bb}    |   4 +-
>  .../{libpcre2_10.30.bb => libpcre2_10.31.bb}       |   6 +-
>  ...int.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch |  30 ---
>  .../nspr/{nspr_4.18.bb => nspr_4.19.bb}            |   5 +-
>  .../nss/nss/nss-build-hacl-poly1305-aarch64.patch  |  30 +++
>  .../nss/{nss_3.34.1.bb => nss_3.35.bb}             |   5 +-
>  27 files changed, 86 insertions(+), 441 deletions(-)
>  rename meta/recipes-extended/tzcode/{tzcode-native_2018c.bb => tzcode-native_2018d.bb} (70%)
>  rename meta/recipes-extended/tzdata/{tzdata_2018c.bb => tzdata_2018d.bb} (98%)
>  rename meta/recipes-graphics/xorg-app/{mkfontscale_1.1.2.bb => mkfontscale_1.1.3.bb} (80%)
>  rename meta/recipes-graphics/xorg-app/{xeyes_1.1.1.bb => xeyes_1.1.2.bb} (72%)
>  rename meta/recipes-graphics/xorg-app/{xinit_1.3.4.bb => xinit_1.4.0.bb} (79%)
>  rename meta/recipes-graphics/xorg-app/{xkbcomp_1.4.0.bb => xkbcomp_1.4.1.bb} (75%)
>  rename meta/recipes-graphics/xorg-app/{xprop_1.2.2.bb => xprop_1.2.3.bb} (78%)
>  rename meta/recipes-graphics/xorg-app/{xset_1.2.3.bb => xset_1.2.4.bb} (77%)
>  rename meta/recipes-graphics/xorg-app/{xwininfo_1.1.3.bb => xwininfo_1.1.4.bb} (72%)
>  rename meta/recipes-graphics/xorg-driver/{xf86-video-vesa_2.3.4.bb => xf86-video-vesa_2.4.0.bb} (77%)
>  delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb/Fix-inconsistent-use-of-tabs-vs.-space.patch
>  rename meta/recipes-graphics/xorg-lib/{libxcb_1.12.bb => libxcb_1.13.bb} (85%)
>  rename meta/recipes-graphics/xorg-lib/{libxshmfence_1.2.bb => libxshmfence_1.3.bb} (77%)
>  rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.22.bb => xkeyboard-config_2.23.1.bb} (87%)
>  delete mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0001-Make-whitespace-use-consistent.patch
>  delete mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0002-print-is-a-function-and-needs-parentheses.patch
>  rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.12.bb => xcb-proto_1.13.bb} (83%)
>  rename meta/recipes-graphics/xorg-util/{util-macros_1.19.1.bb => util-macros_1.19.2.bb} (75%)
>  rename meta/recipes-support/curl/{curl_7.58.0.bb => curl_7.59.0.bb} (95%)
>  rename meta/recipes-support/gnutls/{gnutls_3.6.1.bb => gnutls_3.6.2.bb} (54%)
>  rename meta/recipes-support/libpcre/{libpcre2_10.30.bb => libpcre2_10.31.bb} (90%)
>  delete mode 100644 meta/recipes-support/nspr/nspr/0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch
>  rename meta/recipes-support/nspr/{nspr_4.18.bb => nspr_4.19.bb} (95%)
>  create mode 100644 meta/recipes-support/nss/nss/nss-build-hacl-poly1305-aarch64.patch
>  rename meta/recipes-support/nss/{nss_3.34.1.bb => nss_3.35.bb} (97%)
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

