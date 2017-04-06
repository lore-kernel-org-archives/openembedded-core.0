Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8042077CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 13:51:16 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o21so6486830wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 06:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=68TWnKRyIj2fXV7GRQjIXw7/73gPTUlpon99TuPR1QE=;
	b=sdBUx3TWvMxGlrsK3+udf8qwXpjlfLtXWJcFCq1kPIJbFoMaHRqeBvdWkd39df/gkr
	0L/OG6IzxJe3IIbhgRiB7N8hjr2fuKHZUr6YKI15vy7xeWeT/GSjk+IPOIt8oNDlAHAb
	WyOScfFlaPngpl97n1f0M3VumHSqZfRB4yRScebFfDME4rTM5vLQxo7tResNgR9/es1T
	UbQa9IESZFfG+eKetFFmJdUlxhbnagON1aHGSRbSbjiS7hhuCb9eBti7L4rZFkP+H/S5
	xz76D/2OvLrYNTVL8Wob6nhxmNDsJSJZ5SzirhlQ08V/rsm01JQm0p7eP0+bd5yPYE/y
	E2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=68TWnKRyIj2fXV7GRQjIXw7/73gPTUlpon99TuPR1QE=;
	b=Z0tHjgCPv6ZBS70iw1IPEK5Hu930xV5vggfYtbKJQlS/8jbQ2/2YccN7bXMBSTZAf9
	/Ggbow4yvXqSI4Bf/EUNRcEvod1IHmkEgHYEcxCte3xqnRoGfGyd4tJwNuWAecq4NHIw
	ynHO5abdYj/rdD2WALm4lZ4FadWS6XFk1voZv7rBGYKZM2jlVpkePnvVwWeGkXAQRw8Q
	9J84Lm/xrpaWm1JaPDhjzvLDyUUQJ2mYmvk/SMLHQuh+9v2aHd8zRJn/M/Cy9jRDjR6K
	sCOjYaWvfSo/KPu0bpIq2aW4fYDRmL9CjokUaPVM736zg9r5e+vfL0dTVT9fXN+LNhVv
	KFwA==
X-Gm-Message-State: AN3rC/5sRjUPBMKCZtTmWzOZdiyQH/y0ARpQsR0rpSe5T5i58TycVkD2TzGCeid2hNLDT1TD+TxtqHtIetpPnQ==
X-Received: by 10.223.179.24 with SMTP id j24mr244995wrd.172.1491486677916;
	Thu, 06 Apr 2017 06:51:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Thu, 6 Apr 2017 06:50:47 -0700 (PDT)
In-Reply-To: <cover.1491484515.git.joshua.g.lock@intel.com>
References: <cover.1491484515.git.joshua.g.lock@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Apr 2017 06:50:47 -0700
Message-ID: <CAMKF1sq7VfdNAJG60Ls6aoQOW2YvHztNqk_z8JwVWO=m1LpkKQ@mail.gmail.com>
To: Joshua Lock <joshua.g.lock@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Fixes for building on Fedora 26 (Alpha)
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
X-List-Received-Date: Thu, 06 Apr 2017 13:51:18 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 6, 2017 at 6:23 AM, Joshua Lock <joshua.g.lock@intel.com> wrote:
> As Fedora 26 has a new gcc [1] and a new system pkg-config implementation [2] I
> wanted to do some testing on that host OS so that we might be able to get some
> fixes in before Pyro/2.3 is released.
>
> The following series were the only changes required to start building (I have
> tested core-image-minimal, core-image-base and core-image-sato) on Fedora 26.

gcc patch looks fine to me.

>
> 1. https://fedoraproject.org/wiki/Changes/GCC7
> 2. https://fedoraproject.org/wiki/Changes/pkgconf_as_system_pkg-config_implementation

I think we should think about making pkgconf as default too for OE in
next release cycle.

>
> The following changes since commit 633ad6c9f436f5d2b6ee1a005b697661a054a394:
>
>   oeqa/runtime/utils/targetbuildproject: use parent classes defaults tmpdir (2017-04-06 10:13:39 +0100)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib joshuagl/fedora26
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=joshuagl/fedora26
>
> Joshua Lock (2):
>   elfutils: fix building elfutils-native with GCC7
>   gcc-6.3: backport fix of check for empty string in ubsan.c
>
>  .../elfutils-0.168/Fix_one_GCC7_warning.patch      | 44 ++++++++++++++++++++++
>  .../elfutils/elfutils-0.168/fallthrough.patch      | 36 ++++++++++++++++++
>  meta/recipes-devtools/elfutils/elfutils_0.168.bb   |  3 ++
>  meta/recipes-devtools/gcc/gcc-6.3.inc              |  1 +
>  .../gcc/gcc-6.3/ubsan-fix-check-empty-string.patch | 28 ++++++++++++++
>  5 files changed, 112 insertions(+)
>  create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/Fix_one_GCC7_warning.patch
>  create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/fallthrough.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/ubsan-fix-check-empty-string.patch
>
> --
> 2.9.3
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

