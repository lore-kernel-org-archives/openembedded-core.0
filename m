Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id BAB4A75401
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 16:50:36 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id v8-v6so57045080oie.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 09:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rIi55ryy/pWz1C54Asw9DCBc3GcbvwMdjImWSBZYD/4=;
	b=Onv+ctj/biH/sXSvamumFIR54Y7fFZxQn5LGKELsQedpdceQIJQHdbfcd8jKscLLkh
	qVdaXkF2s9/SRY+BFLqLM68+W3R7SbAUBgdHgUQ7czKfMi9OC+Sk3yy++Ea/r/t+x1KC
	+8I6BQPv1MDUhIbisQQS600WWFs3CK458/Wqo3ioMba2X4knaNYcXgdUyu1uByK8/UT5
	Ugkb72HT9Qefx/VC2Kz0iM2STI7LK3vkZut302O0KTAYQ9h1zi0GzuSs+idHSYj+lo2C
	MSw/RxfdDXAc6aZnaexcCS7qV9sl46HANa6CS8c0jfCs5wjwePedGqt7hxHP/vwNMsbL
	fuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rIi55ryy/pWz1C54Asw9DCBc3GcbvwMdjImWSBZYD/4=;
	b=MV5YberodujImRAI+5h/yYMio8Skeo+k350FgDtdy1zrA7YAostD+zlsGGUwdjjo2m
	eF0gvv7FGLyAU3IsCOftn+sqU1Kj/XU1Gs8On+S2MQv5TioCnBP7OqX86/ELCek3dMuM
	6LsGQKlajT5Z/z6OA2sAbXBLzmAEbvneeCiKsjxnIoEFM6M03tEgNBtQ5Y1O1p2iuVo/
	jdalzVltPelVRrduKck0444/aRu9Z+XtnImgz52tfJZihnvpgEg5lZyqpKVqbBq7zScI
	8OZvfM0FF1FrW+gCbU9ol/s0IIerbY32sLZs+bMIvhf6nSuP0MHRNYEMGhpkrPP6rKkB
	kAaQ==
X-Gm-Message-State: AOUpUlEUd89UIKB+iVDQXIij1KrcrCXZcQtrB2JIdakNnuwnFdWdhIsk
	6wLfgL6xThJ6HzgFWeFuzFNcyGifMkZcU/dI/r+UpA==
X-Google-Smtp-Source: AAOMgpfpSNlpVy24kHfQ1aN63isfpwkndrBMV07XQmPDZSlFLp3p9l3yUsLSN5RtHWpIV3O9u9NBBrbIOehFE4uKk+I=
X-Received: by 2002:aca:efd7:: with SMTP id
	n206-v6mr3459901oih.70.1531414237695; 
	Thu, 12 Jul 2018 09:50:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 09:50:17
	-0700 (PDT)
In-Reply-To: <1531357980-3431-1-git-send-email-chin.huat.ang@intel.com>
References: <1531357980-3431-1-git-send-email-chin.huat.ang@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Jul 2018 17:50:17 +0100
Message-ID: <CAJTo0LZ3PqTT1cU8dUsX6yb8S0PS__ZVQhj-B7KaRss+LQ9_9A@mail.gmail.com>
To: Chin Huat Ang <chin.huat.ang@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nativesdk-cmake: fix cmake toolchain file path
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
X-List-Received-Date: Thu, 12 Jul 2018 16:50:36 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I'd suggest that this is unfortunate fallout from the change to the
default cmake packaging (I ran a large build and did a
buildhistory-diff, but didn't consider nativesdk), but cmake itself is
an exception and should put ${datadir}/cmake into PN explicitly.

Ross

On 12 July 2018 at 02:13, Chin Huat Ang <chin.huat.ang@intel.com> wrote:
> The SDK cmake is currently broken as the cmake.sh (sourced via environment-
> setup script) sets cmake alias which looks for cmake toolchain file
> $OECORE_NATIVE_SYSROOT/usr/share/OEToolchainConfig.cmake which cannot be
> found as the file is packaged into nativesdk-cmake-dev package that is not
> installed as part of SDK by default.
>
> The solution here is to move OEToolchainConfig.cmake to a different path which
> doesn't get packaged up in -dev package, in this case the same directory as
> cmake.sh which depends on it.
>
> Both qemux86 and qemuarm64 core-image-sato SDK's cmake has been tested to work
> with this fix to make sure that OEToolchainConfig.cmake does not have target
> architecture specific cmake toolchain settings.
>
> [YOCTO #12827]
>
> Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
> ---
>  meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh | 2 +-
>  meta/recipes-devtools/cmake/cmake_3.11.4.bb              | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh b/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
> index 0eb56b6..be7f2b6 100644
> --- a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
> +++ b/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
> @@ -1 +1 @@
> -alias cmake="cmake -DCMAKE_TOOLCHAIN_FILE=$OECORE_NATIVE_SYSROOT/usr/share/cmake/OEToolchainConfig.cmake"
> +alias cmake="cmake -DCMAKE_TOOLCHAIN_FILE=$OECORE_NATIVE_SYSROOT/environment-setup.d/OEToolchainConfig.cmake"
> diff --git a/meta/recipes-devtools/cmake/cmake_3.11.4.bb b/meta/recipes-devtools/cmake/cmake_3.11.4.bb
> index 3f8fd7a..7ef5740 100644
> --- a/meta/recipes-devtools/cmake/cmake_3.11.4.bb
> +++ b/meta/recipes-devtools/cmake/cmake_3.11.4.bb
> @@ -35,10 +35,8 @@ EXTRA_OECMAKE=" \
>  "
>
>  do_install_append_class-nativesdk() {
> -    mkdir -p ${D}${datadir}/cmake
> -    install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
> -
>      mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
> +    install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${SDKPATHNATIVE}/environment-setup.d/OEToolchainConfig.cmake
>      install -m 644 ${WORKDIR}/environment.d-cmake.sh ${D}${SDKPATHNATIVE}/environment-setup.d/cmake.sh
>  }
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

