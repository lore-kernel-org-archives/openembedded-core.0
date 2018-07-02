Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 86D6776094
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 18:24:22 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id s23-v6so7321166vks.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 11:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QF6PoKE+yBYM9/yX55NMXpGKSrbw9bfyf+98ZKjlm80=;
	b=czesjP407s4GLenHfajd+vS6bRrX+v6SXbiGvdpe5rMbll7Oj4yenZLokhJTirlyCW
	TVWKcqbDjsOAGz3pgl2++GkPVbt0k+2RxyjA+fvmIXJUNoDilnv00R7z4Qrbudqh7TYS
	tvF476rbOsoeTsp2E4Tkyry39uJOvnYSS4re3QIa0iVqfzr7spyYCoz5XHPfjaYbsR/o
	94IZfpw7CtfZpvj5eNpfVu0aacVym+YQDz28ReEqyFPL2WaaCPHo1UQG/1b/38e+micm
	3d3KOFN+zOvKglbwPhLUzhUtN+ESLwCSKwabqmZxAY2btuHALHAHuqWsjT9qtAomGN/z
	7DIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QF6PoKE+yBYM9/yX55NMXpGKSrbw9bfyf+98ZKjlm80=;
	b=m4WRpLhiaIcnUpiiXM7s27qE/NIPfgEpeKSQ+XFmb57Maa4mSuZ4TcgbfAMXXy5zR1
	ICwoJwejt2iWyD518p1b8mOe1BnYxy+zSQRP3RZFN6KCJ2Ac70AK/XQ9MTd7xwb4D0LQ
	vuEu90LfOGm4svB6ZmtfXbK+J4YQUt6jgUmTnMaT1p2AN7uw1Kmsm5xblpex5CHD3erB
	E7/f6VJ0Kp1gHZiUinO1DD074l0bSdgI4UNMA1IwyeUG3JDL3xYIImquAmyj6/Om+NYC
	5nr5Xn2+V0MKrviPCBnzc4h2Lh/G2n3YiV0B0duYHUJxaULIwZ3u23e0YEj2MDv6SYJg
	YBYw==
X-Gm-Message-State: APt69E2p29EA/lJiUXE1aVFCyjycnh4+g5N7a974DMB6ZIurk71NPBTf
	0dpiIXYwaRKdf9HsihgMwBBUcRou9OwMTfzio3w=
X-Google-Smtp-Source: AAOMgpc1eCrCjyhMzLMbERgdtTfj8RNEfgzvQHmKeD6wnqT4o6WsUolv/bXLe9RoJr2gKma5yNxJhpLw5pAsUbrvvgg=
X-Received: by 2002:a1f:2cce:: with SMTP id
	s197-v6mr3876733vks.106.1530555863162; 
	Mon, 02 Jul 2018 11:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20180702150303.12778-1-ptsneves@gmail.com>
In-Reply-To: <20180702150303.12778-1-ptsneves@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Jul 2018 11:23:57 -0700
Message-ID: <CAMKF1sp05SENZT9jMNZJPPuyYtDiJ71-R7HehpNXAXs0K3Rk8A@mail.gmail.com>
To: Paulo Neves <ptsneves@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gtest, gmock: Created a git version of gtest.
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
X-List-Received-Date: Mon, 02 Jul 2018 18:24:22 -0000
Content-Type: text/plain; charset="UTF-8"

Please send it openembedded-devel ml instead of core ml.
On Mon, Jul 2, 2018 at 8:03 AM Paulo Neves <ptsneves@gmail.com> wrote:
>
> There are no new tag releases of the googletest
> repositories for 2 years, while development
> continued.
> Created a new recipe for non tagged release
> hash. This new recipe does not require the
> package config patch as it is supported by
> upstream.
>
> Refactored common recipe data in an include
> file.
> ---
>  meta-oe/recipes-test/gtest/gtest.inc      | 19 +++++++++++++++++++
>  meta-oe/recipes-test/gtest/gtest_1.8.0.bb | 20 +-------------------
>  meta-oe/recipes-test/gtest/gtest_git.bb   |  6 ++++++
>  3 files changed, 26 insertions(+), 19 deletions(-)
>  create mode 100644 meta-oe/recipes-test/gtest/gtest.inc
>  create mode 100644 meta-oe/recipes-test/gtest/gtest_git.bb
>
> diff --git a/meta-oe/recipes-test/gtest/gtest.inc b/meta-oe/recipes-test/gtest/gtest.inc
> new file mode 100644
> index 000000000..7a834ef25
> --- /dev/null
> +++ b/meta-oe/recipes-test/gtest/gtest.inc
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "Google's framework for writing C++ tests"
> +HOMEPAGE = "https://github.com/google/googletest"
> +SECTION = "libs"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://googlemock/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
> +                    file://googletest/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
> +
> +PROVIDES += "gmock"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +ALLOW_EMPTY_${PN} = "1"
> +ALLOW_EMPTY_${PN}-dbg = "1"
> +
> +RDEPENDS_${PN}-dev += "${PN}-staticdev"
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-oe/recipes-test/gtest/gtest_1.8.0.bb b/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
> index 48cf4e04b..b264862f1 100644
> --- a/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
> +++ b/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
> @@ -1,24 +1,6 @@
> -DESCRIPTION = "Google's framework for writing C++ tests"
> -HOMEPAGE = "https://github.com/google/googletest"
> -SECTION = "libs"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://googlemock/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
> -                    file://googletest/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
> -
> -PROVIDES += "gmock"
> -
> -S = "${WORKDIR}/git"
> +require gtest.inc
>  SRCREV = "ec44c6c1675c25b9827aacd08c02433cccde7780"
>  SRC_URI = "\
>      git://github.com/google/googletest.git;protocol=https; \
>      file://Add-pkg-config-support.patch \
>  "
> -
> -inherit cmake
> -
> -ALLOW_EMPTY_${PN} = "1"
> -ALLOW_EMPTY_${PN}-dbg = "1"
> -
> -RDEPENDS_${PN}-dev += "${PN}-staticdev"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-oe/recipes-test/gtest/gtest_git.bb b/meta-oe/recipes-test/gtest/gtest_git.bb
> new file mode 100644
> index 000000000..2f091b2c7
> --- /dev/null
> +++ b/meta-oe/recipes-test/gtest/gtest_git.bb
> @@ -0,0 +1,6 @@
> +require gtest.inc
> +SRCREV = "ba96d0b1161f540656efdaed035b3c062b60e006"
> +SRC_URI = "\
> +    git://github.com/google/googletest.git;protocol=https; \
> +"
> +
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

