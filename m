Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 04A0777DAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 17:36:47 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id 188-v6so3663724oid.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 10:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t4V+AF1IVVv5qFtKljaQ/PL7HyKPyRkVpShjyCRHeCo=;
	b=vM1C41lNMeg0b/X4oZ6AWd8K3VimtlEGFnfOFtgMKgFxDZbM63Giwvd89R6dMGcnfN
	5JXs2L2l0XYDu1SJSw3E/I8hxmP3lVkNVmDqUZFGBuiI0jbgCd/ipVGgZkD7Gpr5Le+2
	yrgEXA2wFkzICey4poDRMMLf1qAJ6mbhCxprr0RxHQQN89hK6UJSsK1CQ8TbUzqIkkID
	qZdW1pwF5XrKs26zocvfLD5GQFK5vAjsolzPJzfFOL9dAQ4Lg5koKVihfAUhEkRD8ldW
	XIsyeSaHBs7lsANJtpCZ5dGPSLKYlcGqsx6KfrecCr506U4tfex5Tqc/x1C6EDcbABs2
	nEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t4V+AF1IVVv5qFtKljaQ/PL7HyKPyRkVpShjyCRHeCo=;
	b=A2fGAEA37weQGXklVNREc5LzRKpYfgfNHusiwgVZa1Jp8bYzKkeaairagnpDnfOmi9
	8w3b3kM6LO0RGBmAa+oW1NwExvhJ5HUIHqZvZ5exSRx+80ma28wtZktazLvCGQH04omv
	HuiFKdavQIXlIVnYTIPOAmqYC1Rl2XTei4xPD9At+VZe5Worum2DMlKRfBurTxAi6zgF
	8lkv+2013N4QRxufH0z7ORahSq2L6H9O8kH7jVW5BF5WBUTnNp5neuXK9iq85TyilAAj
	EMLCcA+zD+jt/ZdmCnfdviPPPSR/JwXSTZaDZu+Zun9/14DYWLmNJseyFa8AY3hQPqnn
	3KfA==
X-Gm-Message-State: APt69E3TmsTRtZvNvmxF4FfJwRaVIaqicno94pRWk8mLIKTlOIwzUEeI
	6cGS+anwjZugd/tstgt+/u7zqX+xckiR65DJN6tTgiKf
X-Google-Smtp-Source: ADUXVKJcpPq1h7vq3w3+Vphha86X/t21eBx/Dyj+eZKlyjGQHHQEkA/RO3yhcX2NS8Z5xAJF7oERKmJYPQIx4Jx7wYA=
X-Received: by 2002:aca:cd4d:: with SMTP id
	d74-v6mr15699890oig.170.1529602609021; 
	Thu, 21 Jun 2018 10:36:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Thu, 21 Jun 2018 10:36:28
	-0700 (PDT)
In-Reply-To: <1529570060-22244-1-git-send-email-maxin.john@intel.com>
References: <1529570060-22244-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jun 2018 18:36:28 +0100
Message-ID: <CAJTo0La50QrSiy0KW2SHvUpkG4Dr66uROvALZCL3cgLc8H6Y5g@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] harfbuzz: upgrade 1.7.5 -> 1.8.1
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
X-List-Received-Date: Thu, 21 Jun 2018 17:36:48 -0000
Content-Type: text/plain; charset="UTF-8"

Getting a buildhistory warnings that suggests packaging went wrong:

packages/corei7-64-poky-linux/harfbuzz/harfbuzz-bin: PKG changed from
libharfbuzz-bin to harfbuzz-bin [default] - may indicate debian
renaming failure
  * PV changed from "1.7.5" to "1.8.1"
packages/corei7-64-poky-linux/harfbuzz/harfbuzz: FILELIST: removed
"/usr/lib/libharfbuzz.so.0.10705.0", added
"/usr/lib/libharfbuzz-subset.so.0.10800.1
/usr/lib/libharfbuzz.so.0.10800.1 /usr/lib/libharfbuzz-subset.so.0"

The problem is that harfbuzz-subset is in PN so it doesn't know what
to call the package.  Either pull subset out into a separate package
(which sounds wrong considering the name) or set LEAD_SONAME.

Ross

On 21 June 2018 at 09:34, Maxin B. John <maxin.john@intel.com> wrote:
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  .../harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.1.bb}                | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.1.bb} (84%)
>
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
> similarity index 84%
> rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
> rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
> index 0a9b029..a42bf8c 100644
> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
> @@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
>
>  SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
>
> -SRC_URI[md5sum] = "1466ab51fc5aaa6af4065936939cec62"
> -SRC_URI[sha256sum] = "84574e1b1f65ca694cb8fb6905309665c0368af18a312357f8ff886ee2f29563"
> +SRC_URI[md5sum] = "97cb89c6e2a914c05c8b7e858703885f"
> +SRC_URI[sha256sum] = "fbed6392ddb085e45e6090a9f389f72926d0e355f4b0a2ef51d35cf21686df45"
>
>  inherit autotools pkgconfig lib_package gtk-doc
>
> @@ -35,5 +35,6 @@ FILES_${PN}-icu-dev = "${libdir}/libharfbuzz-icu.la \
>                         ${libdir}/libharfbuzz-icu.so \
>                         ${libdir}/pkgconfig/harfbuzz-icu.pc \
>  "
> +FILES_${PN}-dev += "${libdir}/cmake/harfbuzz/harfbuzz-config.cmake"
>
>  BBCLASSEXTEND = "native"
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

