Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2DDE177756
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 22:49:24 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r123so12285226wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 15:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YySVYO+pMCbmB8E+NfVwj49t80QwhBAQ9052zPJQp+U=;
	b=O32GVJukUdASHsCGqb4QYuzph2DEyRoBYRMqiWclGbDxt9NZIUxXHjr67qMIK/MuFf
	ilYkgkp0n+zB3SyyxviRG+AEgv77/BROU36EhWaqhIaH6ZbHfEa/++XG/F65YvQE2sPH
	xmdib+z3TjxE0b8CndrOMOc+bk32/FphZmNH04k7MLWDDaPLHgddVzq5k0GsLR5e1GxL
	625mXAjTMhsZrsS84QhwU22S1cX3uXRfmd3LKs3V+tpYQjqpZJJvRU3EJ+hkmeOOa0m+
	wWZAz95h7TDG54ZZl/rk7KXWhc4AObsZE24O1mtmCCF3M/a//ru//ZNEXL/500Du06Lc
	ECjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YySVYO+pMCbmB8E+NfVwj49t80QwhBAQ9052zPJQp+U=;
	b=UAxEZiOor9NDu4rdQ9yAz8OdI+U61Cz/in1Byh6yVeChXfU5eaOoI45hovsAwyexOK
	wdyjhW0xMj6SuMtWfScucdLky46HlUOCMV8o2zrmtE0c1CF6v614lel8Knj4VdqAPf9y
	lKFe2JDbQH2KZvCXZK+B9Ln5H4WkS9WrBVyCRP+fnbmy9sX/tPKzqVHHxCuTtDrVFtv+
	pR07X0iHeB4MrJ9qnMafNEgwtI3LbHofGDsly90Nh4/cjmSzp+x/tZneDnqzXMXjSqpl
	zoTy1xftTSQSVhAKfhpNQZuYicB+B6rFpT+YgFGzkbrZVE9SZmx6aQYimP+omOTm92lD
	6kZA==
X-Gm-Message-State: AIVw112JN2WAPaD7dXB+aSfjiipwQADZUTWHV2hexmCU2+lDcLaj97qq
	Jlvp5SSrZCo4mqw4QqUHJPiz+iPjVA==
X-Received: by 10.80.147.197 with SMTP id o63mr2035325eda.194.1501109365780;
	Wed, 26 Jul 2017 15:49:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Wed, 26 Jul 2017 15:48:55 -0700 (PDT)
In-Reply-To: <1501107263-14093-1-git-send-email-jslater@windriver.com>
References: <1501107263-14093-1-git-send-email-jslater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Jul 2017 15:48:55 -0700
Message-ID: <CAMKF1sr2t=DsJRPjOaM8G6osNs5MW=KEUroCS=OevfV1aea8vQ@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND][PATCH 1/1] go: centralize definition of COMPATIBLE_HOST
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
X-List-Received-Date: Wed, 26 Jul 2017 22:49:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 26, 2017 at 3:14 PM, Joe Slater <jslater@windriver.com> wrote:
> Put it in goarch.bbclass which all go related recipes inherit.
>

looks ok

> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta/classes/go.bbclass               | 5 -----
>  meta/classes/goarch.bbclass           | 6 ++++++
>  meta/recipes-devtools/go/go-cross.inc | 4 ----
>  meta/recipes-devtools/go/go.inc       | 6 ------
>  4 files changed, 6 insertions(+), 15 deletions(-)
>
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index 85f71a2..cedda68 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -1,10 +1,5 @@
>  inherit goarch
>
> -# x32 ABI is not supported on go compiler so far
> -COMPATIBLE_HOST_linux-gnux32 = "null"
> -# ppc32 is not supported in go compilers
> -COMPATIBLE_HOST_powerpc = "null"
> -
>  GOROOT_class-native = "${STAGING_LIBDIR_NATIVE}/go"
>  GOROOT = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
>  GOBIN_FINAL_class-native = "${GOROOT_FINAL}/bin"
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 4a5b2ec..57537fb 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -11,6 +11,12 @@ TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH', True), d.getVar('TUNE_FEAT
>  TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
>  GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE',True) == d.getVar('HOST_GOTUPLE',True)]}"
>
> +# define here because everybody inherits this class
> +#
> +COMPATIBLE_HOST_linux-gnux32 = "null"
> +COMPATIBLE_HOST_powerpc = "null"
> +COMPATIBLE_HOST_powerpc64 = "null"
> +
>  def go_map_arch(a, d):
>      import re
>      if re.match('i.86', a):
> diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
> index 71e4611..1c2d9e3 100644
> --- a/meta/recipes-devtools/go/go-cross.inc
> +++ b/meta/recipes-devtools/go/go-cross.inc
> @@ -13,7 +13,3 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/go-cross:"
>  GOROOT_FINAL = "${libdir}/go"
>  export GOROOT_FINAL
>
> -# x32 ABI is not supported on go compiler so far
> -COMPATIBLE_HOST_linux-gnux32 = "null"
> -# ppc32 is not supported in go compilers
> -COMPATIBLE_HOST_powerpc = "null"
> diff --git a/meta/recipes-devtools/go/go.inc b/meta/recipes-devtools/go/go.inc
> index 91d040d..52abbeb 100644
> --- a/meta/recipes-devtools/go/go.inc
> +++ b/meta/recipes-devtools/go/go.inc
> @@ -12,12 +12,6 @@ DEPENDS += "${@ 'libgcc' if not oe.utils.inherits(d, 'cross') else ''}"
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_SYSROOT_STRIP = "1"
>
> -# x32 ABI is not supported on go compiler so far
> -COMPATIBLE_HOST_linux-gnux32 = "null"
> -# ppc is not supported in go compilers
> -COMPATIBLE_HOST_powerpc = "null"
> -COMPATIBLE_HOST_powerpc64 = "null"
> -
>  export GOHOSTOS = "${BUILD_GOOS}"
>  export GOHOSTARCH = "${BUILD_GOARCH}"
>  export GOOS = "${TARGET_GOOS}"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

