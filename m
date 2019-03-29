Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 815C76B06C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 04:22:17 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id c20so609853qkc.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 21:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=keWxmiCoVmNqqNVmuECfKGD4uNkoO9tu/1OaVqu7/ds=;
	b=cDc1ZDWU7XMG2jweXIEGPgH3XzG6o/UBqMjwgjC+NruTD3W4C5fwQJqSBA9/dbzm22
	6XSJRdnnxmLIyDntGw24OKsxzOKfw0n+zcHVwwIe6eTXMbzNB4xVn/Zsl2MiS3r6ryW3
	iFnXbioTJfMSdgSwbE//I2HvjpBYOPo/yVZ9s2rolQnZlakTVr0Xt8S11CRZnt45mQz3
	aOTQ0UNx3aLXcWr9YkQjznQMHbwUDRzHPxLG7gtEy4zsV34dXuAudByPCCx+KwXanWLv
	DsEDYP5hkR+fnj2rgmiaMWXKTh/lpaxect+dc9Pu2FgorIhhF8M5HhP83vsPvS92dNYa
	AxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=keWxmiCoVmNqqNVmuECfKGD4uNkoO9tu/1OaVqu7/ds=;
	b=PDLePMd3A8dFtp+B7fY1GqnfYNlaFdH7MLxQleu13Hko6U3/VeBgSJWXFWl0ZUPldJ
	xVxBiSupG22xmAgWtjfddre9ixtwza9wnP2plF5u3w+oU3NnHRuXVK78WIqPqa7u4+cL
	mLObg1MzVjldcruHDRwXqx1AUIp4jZkI0JFhEaNP8Zu9HA9o81h6YW/mB5UoNuxmdd7h
	mxbHTqGI2fhZM3R63XHxG2WdbxBPgzaKh0dsB6+VA7bfNrIaTXk8bhAyByPj1WjBCiMn
	WHZiPSKDQdAqsrv4+2A4wqjaq/dPkQjYWvyj9dgfQH5uYvpfltPG1NoVm4mTcFoICIF6
	Vthg==
X-Gm-Message-State: APjAAAWUKpUuvAmLy8Kp+mGwcg7gfX15ukVDQJuLlMQEIsl/QhFOX8YA
	HFSsOnIERAiv+Ej98LYgR/lBxIf+Fk8Vr3skfzk=
X-Google-Smtp-Source: APXvYqwMu2sRqeqdZKQddXHJIUKGCUwiqF6dgHxD5KClpEVy2jAFXTn/q4/4d52q3fc8Ee0KGQcVe+aBKzphjVhPvWU=
X-Received: by 2002:a37:6814:: with SMTP id d20mr38182021qkc.102.1553833338037;
	Thu, 28 Mar 2019 21:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190327230712.4930-1-ross.burton@intel.com>
In-Reply-To: <20190327230712.4930-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Mar 2019 21:21:51 -0700
Message-ID: <CAMKF1soD0A=B3BoZnK9QCo_0oHDpy9zcc+hG19F4fRwvANHm5A@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] llvm: doesn't actually need pythonnative
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
X-List-Received-Date: Fri, 29 Mar 2019 04:22:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 27, 2019 at 4:07 PM Ross Burton <ross.burton@intel.com> wrote:
>
> LLVM doesn't actually need pythonnative, the host Python2 is sufficient but
> cmake's executable searching currently isn't reliable in cross-compilations.
>
> Convince cmake by setting PYTHON_EXECUTABLE to point at python2 in the HOSTTOOLS
> directory.  Note that currently LLVM *needs* python2 currently:
>

this should be ok

> https://github.com/llvm-mirror/llvm/blob/master/CMakeLists.txt#L670
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/llvm/llvm_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
> index d2ea927651d..31abadcace5 100644
> --- a/meta/recipes-devtools/llvm/llvm_git.bb
> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> @@ -12,7 +12,7 @@ DEPENDS = "libffi libxml2 zlib ninja-native llvm-native"
>
>  RDEPENDS_${PN}_append_class-target = " ncurses-terminfo"
>
> -inherit perlnative pythonnative cmake pkgconfig
> +inherit perlnative cmake pkgconfig
>
>  PROVIDES += "llvm${PV}"
>
> @@ -74,6 +74,7 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
>                    -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
>                    -DLLVM_OPTIMIZED_TABLEGEN=ON \
>                    -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS}' \
> +                  -DPYTHON_EXECUTABLE=${HOSTTOOLS_DIR}/python2 \
>                    -G Ninja"
>
>  EXTRA_OECMAKE_append_class-target = "\
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

