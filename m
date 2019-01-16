Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 75F597C1A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:53:38 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id c9so2535666itj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=d7o50Uh190MZ/a7URJskxklXGkIEE8gwPRZQ+BEu6Ec=;
	b=txSibJEfTOIC93HM4Cfblceghq2l27MLjD9NLIGgOjaQPsLBS/7ls/URFDOftVgV7P
	sWiYBmuZf0zl/Mtc1e9F4h95Dab7VJQHjxvaPjTZbMDnHnasIQvozwfc944uEJpH9lJl
	rFHaYPD4QWomXknZCDTcbSmmkLLd2KZq0n7QlJP2ZGOS+ZZaiYBRI6LJUXvwvdTWOUcn
	mssTe3Njvodo50PBZmwIPiTOVCqogvVmUv3uyAxNoYkE20czWvnSl8oY7fEi4yUqf+ry
	0mNquPbBa9OV8qwTu/CGLPuR7AJCGMPD5YRHy07RuCVxORlmMRp31js0PR1UV7GehYQr
	cMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=d7o50Uh190MZ/a7URJskxklXGkIEE8gwPRZQ+BEu6Ec=;
	b=dJI+cd0tA95q5ddEVZcHfVckfKF3hO59M1AIacO3GyYMAnQw5YWM0jTdMVTq4ZUV6o
	uigayNwDqmKWnxqwLCFGWiu7jWFisjkYwqZPsPEyM6TyrCam3WF66a7rqXQOohjmOBrK
	FOLg5WGJ6JLH3NU2zQuzi7udrwaWVe9WvU8gm/YlCgMSQHoj+3zK/9Wc95KljkMLeYTA
	13LaFCgMRnb8LwDb8LLGXG8k7FwPn7BZmc0Fjk4tDK9ibGoG0WGUiA5+3f2EqMgTtDzX
	aVd8mCLNbAYGimOQRog9f9ga3tGtoP7It5FW5IeP5IbBWuzHNAHzXrALD6ZXCYrvQwnK
	HFmg==
X-Gm-Message-State: AJcUukd/nqBAYz8dZcTLWVxpPKV3MyKmAAOKXRmngxWqNObzo16Mayo7
	Cn4/rNMpnKftlVpzhjAiEeTZfx908v09IMN2/pwxRg==
X-Google-Smtp-Source: ALg8bN7nuxtSlIY05XMq08HSQlVubbzCPtrF5O2yMo6EvqY05/jGsz5aeA2CQ8WaWb1N+f5gPurFQz+ihpk+Mh+ym1Y=
X-Received: by 2002:a24:c601:: with SMTP id j1mr1114635itg.130.1547643219383; 
	Wed, 16 Jan 2019 04:53:39 -0800 (PST)
MIME-Version: 1.0
References: <1547626542-681-1-git-send-email-li.zhou@windriver.com>
In-Reply-To: <1547626542-681-1-git-send-email-li.zhou@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Jan 2019 12:53:28 +0000
Message-ID: <CAJTo0LaamX7KcUxW5ECLL7ic63RNFSDbXyt0oV17vDyEpK9crg@mail.gmail.com>
To: Li Zhou <li.zhou@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ptest-runner: pass libdir to DEFAULT_DIRECTORY when compiling
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
X-List-Received-Date: Wed, 16 Jan 2019 12:53:38 -0000
Content-Type: text/plain; charset="UTF-8"

We maintain ptest-runner, so send a patch to that and just change the
srcrev in the recipe.

Ross

On Wed, 16 Jan 2019 at 08:34, Li Zhou <li.zhou@windriver.com> wrote:
>
> Ptest data are installed to PTEST_PATH ?= "${libdir}/${BPN}/ptest".
> When libdir isn't "/usr/lib", it will cause "No ptests found" error
> when running "ptest-runner" command. Here pass libdir to
> DEFAULT_DIRECTORY when compiling to avoid that error.
>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  ...r-remove-DEFAULT_DIRECTORY-s-hard-coded-i.patch | 36 ++++++++++++++++++++++
>  .../ptest-runner/ptest-runner_2.3.bb               |  5 +--
>  2 files changed, 39 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/ptest-runner/ptest-runner/0001-ptest-runner-remove-DEFAULT_DIRECTORY-s-hard-coded-i.patch
>
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner/0001-ptest-runner-remove-DEFAULT_DIRECTORY-s-hard-coded-i.patch b/meta/recipes-support/ptest-runner/ptest-runner/0001-ptest-runner-remove-DEFAULT_DIRECTORY-s-hard-coded-i.patch
> new file mode 100644
> index 0000000..56e1f96
> --- /dev/null
> +++ b/meta/recipes-support/ptest-runner/ptest-runner/0001-ptest-runner-remove-DEFAULT_DIRECTORY-s-hard-coded-i.patch
> @@ -0,0 +1,36 @@
> +From 6a663ac38c71108890e42f451f3a7b22afee0a40 Mon Sep 17 00:00:00 2001
> +From: Li Zhou <li.zhou@windriver.com>
> +Date: Wed, 16 Jan 2019 15:00:17 +0800
> +Subject: [PATCH] ptest-runner: remove DEFAULT_DIRECTORY's hard coded
> + initialization
> +
> +Ptest data are installed to PTEST_PATH ?= "${libdir}/${BPN}/ptest".
> +Here make DEFAULT_DIRECTORY be able to be defined outside of c code,
> +in case libdir isn't "/usr/lib", which will cause "No ptests found"
> +error when running "ptest-runner" command. We will pass libdir to
> +DEFAULT_DIRECTORY when compiling to avoid that error.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Li Zhou <li.zhou@windriver.com>
> +---
> + main.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/main.c b/main.c
> +index 83600b7..e963efe 100644
> +--- a/main.c
> ++++ b/main.c
> +@@ -37,7 +37,9 @@
> +
> + #include "utils.h"
> +
> ++#ifndef DEFAULT_DIRECTORY
> + #define DEFAULT_DIRECTORY "/usr/lib"
> ++#endif
> + #define DEFAULT_TIMEOUT 300
> +
> + static inline void
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.3.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.bb
> index 26add9b..9866d1a 100644
> --- a/meta/recipes-support/ptest-runner/ptest-runner_2.3.bb
> +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.bb
> @@ -10,12 +10,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>  SRCREV = "80712583732b4a809532f644fb09e7d2e812d7ba"
>  PV = "2.3+git${SRCPV}"
>
> -SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
> +SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
> +           file://0001-ptest-runner-remove-DEFAULT_DIRECTORY-s-hard-coded-i.patch"
>  S = "${WORKDIR}/git"
>
>  FILES_${PN} = "${bindir}/ptest-runner"
>
> -EXTRA_OEMAKE = "-e MAKEFLAGS="
> +EXTRA_OEMAKE = "-e MAKEFLAGS= CFLAGS="${CFLAGS} -DDEFAULT_DIRECTORY=\\\"${libdir}\\\"""
>
>  do_compile () {
>         oe_runmake
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

