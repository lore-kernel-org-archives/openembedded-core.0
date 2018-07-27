Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id D8DB678CC4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:58:05 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id a5-v6so4332210qtp.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 01:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=np33Hm25IsBbHBjuXs6zBipJvBNuRle0geSMiKwqNQI=;
	b=rgq9tP3eHFfnA8jEAeV8EdX+noUbtiMaLMTVorbNz2KTs14GquHCakmiCOvGlcS/Fm
	+pQ/k5cQQj1sVxCI1RioysoyhGN0+3i2C2wb/FRDRLEaGZi90GD9qyCbfZZe/VQ9i39h
	+oEnfTcE9Yv1wn/vbIr8YqYDWinsGTV0V3F/N1/lEDse9o82f9GzDwGxLO8GoHdb5zjG
	ZUbJw5aR9f0SiNNF5Mc7ZdPwiowPNuvuDPV0eaYFZ68f2RiN40bXX5kEmjv0CJEb031k
	b1wSKeAy33/SLNVz76b3lWWScm3bR/MUBmWolbBT92G9FG8ugx/iVm6E/EVJbsdmzTTa
	H4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=np33Hm25IsBbHBjuXs6zBipJvBNuRle0geSMiKwqNQI=;
	b=mGQwj+2VYHCuvy5tlYTD4YvXLD13lCqoNLp2w8X7iARlEUVoa5uSdQbfazGLI5RBql
	49mz8FY1Vy7eLxw6GewZF+e2RJsXnWohkDiZRG0wlGFhu1BkjynDa6YUwh6YDJDdRuc8
	sTGXi7H7jYTrGDZ02qirgpyIKz4KxcdyjFpUBvDcsnFN8rRasE8bFPINC13o0Yi8yEsL
	oRRqgqGqbMx7Sw+7FkVRZ4epxEmkeNq/ZGXAEkG9UU53FqSJzkYU2lMcG4Z62G4/tnEx
	h9DiM7jMyyO24w+RFNtBzLnmgQ8Ey0qDogeRkz9bGbmr8FWUEQZEQx45uxh+GcTVJOxv
	B0HQ==
X-Gm-Message-State: AOUpUlGCRzmtZKf9yXIGsWhWHalhVNeKGhbr9UFx1Vp/5IYWhCCzl7sC
	2D+bYA4WWCgSmCGaAjL5SQsK8YiQHpSDqccxNmQ=
X-Google-Smtp-Source: AAOMgpdnITMwHNMqTZcdUaEX9T7qtEVMQ2XcRjOUcDPtLyfP5kxZLVa1sJJaPVUkz7+Cdpr0oW0u/XDebN2u+WjaGFU=
X-Received: by 2002:ac8:3209:: with SMTP id
	x9-v6mr5389305qta.128.1532681886648; 
	Fri, 27 Jul 2018 01:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1532682009.git.liezhi.yang@windriver.com>
	<fbdc16a21bd8b04c9eff1eda6701fa723b07b9ed.1532682009.git.liezhi.yang@windriver.com>
In-Reply-To: <fbdc16a21bd8b04c9eff1eda6701fa723b07b9ed.1532682009.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Jul 2018 01:57:40 -0700
Message-ID: <CAMKF1spUhjxjO6F_xVW+AZWPZ+co_f2XKgeSU03Ge3y9fk5_3g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] python3-pbr: add it for python3-testtools
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
X-List-Received-Date: Fri, 27 Jul 2018 08:58:06 -0000
Content-Type: text/plain; charset="UTF-8"

please remove it from meta-python once its in core
On Fri, Jul 27, 2018 at 1:51 AM Robert Yang <liezhi.yang@windriver.com> wrote:
>
> - The python3-testtools RDEPENDS on it.
> - It is from meta-python, I extended it to nativesdk.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-devtools/python/python-pbr.inc       | 14 ++++++++++++++
>  meta/recipes-devtools/python/python3-pbr_3.1.1.bb |  2 ++
>  2 files changed, 16 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python-pbr.inc
>  create mode 100644 meta/recipes-devtools/python/python3-pbr_3.1.1.bb
>
> diff --git a/meta/recipes-devtools/python/python-pbr.inc b/meta/recipes-devtools/python/python-pbr.inc
> new file mode 100644
> index 0000000..74f67fb
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python-pbr.inc
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Python Build Reasonableness: PBR is a library that injects some useful and sensible default behaviors into your setuptools run"
> +HOMEPAGE = "https://pypi.python.org/pypi/pbr"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
> +
> +SRC_URI[md5sum] = "4e82c2e07af544c56a5b71c801525b00"
> +SRC_URI[sha256sum] = "05f61c71aaefc02d8e37c0a3eeb9815ff526ea28b3b76324769e6158d7f95be1"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-pip"
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-devtools/python/python3-pbr_3.1.1.bb b/meta/recipes-devtools/python/python3-pbr_3.1.1.bb
> new file mode 100644
> index 0000000..97e7361
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pbr_3.1.1.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-pbr.inc
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

