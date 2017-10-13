Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9304077E93
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 02:42:37 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id p87so7783446pfj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 19:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2OJjUNqBV+XiSL0kIhL7ZNpOLDL9a4GV2vzIDnD+Fqc=;
	b=oaOt5NJwx8C2WC6CZ8SXoQHQTUj0DDvSKTM+tslbPKZLxk8Ej8sxkYKDOukWnk4+Zs
	d4LQ46ythSK1tQI3vtpoBZOZXTbkyUYGk8DT8QFdnvSdt/cX+I1r32iha0I+eLROvV+b
	IpFP3W/3zP9liLMAeuBSsi+3Wne6j1ssjF/M/Gfddcis/c6Cj5j8YdghphzQE79vqIOY
	4R/0b1yNZQ7VKyRlBGIelOA9tk4xveMf2Ep/LhzThTs8P+TcsxWCUCEuCX+LKnD5mX92
	ftldCh8vJyivf5EIPb2MUYlNtbdOb+O5Z4NBaK9iTk045Xs0ufi/J1TxsQ3q+PjNjAKk
	DshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2OJjUNqBV+XiSL0kIhL7ZNpOLDL9a4GV2vzIDnD+Fqc=;
	b=AuciGURkK/JuBgrqHZ5++WfFwry9EBvUJNgHVotRec/8JumbslaOFnNc6Vlj54X3cT
	qA8TN/U1mY5EdG0YIh4PHH/GWcWp3iPwOCzsKsPkAloT0Pxh6nQO0gYKvQAL8DPAlemd
	6+yxWFOeuJwmxQO75O760SkbwydLE/EmUPp4D6DJApdZwWwxlZ/31nkteTcko9npk7rh
	hAgvQdBReaUWvpOcaYx2wGCT+9Ye8LsECtqJ7Nbf7JgOsPZItMp+da8G3IOo+g4TznOg
	POUtSI/o73H54V5GhGFIWoDVNkOuSQ6QdsC1x+YkmgnWHrwbV0WEDvoA3VxHXWcMdW3X
	rsrw==
X-Gm-Message-State: AMCzsaVU4S839++GXZxAc7FYULCDYhQjr2anfyqu7zJcsGqcTeQqi/JM
	iKj6seNEU9zSEm2mAy7l9+JkDZ8YsZbFtim5uso=
X-Google-Smtp-Source: AOwi7QDJ22hW5u3yPPzJFVvW78lPtENwab0bsBbRdEIiWCR/v8Hu4rPFdpilYJb4QgvwxvzSxr2LngcXToRCVkeNbIM=
X-Received: by 10.98.194.215 with SMTP id w84mr3761984pfk.255.1507862558765;
	Thu, 12 Oct 2017 19:42:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Thu, 12 Oct 2017 19:42:08 -0700 (PDT)
In-Reply-To: <20171013004147.28663-1-timothy.t.orling@linux.intel.com>
References: <20171013004147.28663-1-timothy.t.orling@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Oct 2017 19:42:08 -0700
Message-ID: <CAMKF1sp2ezog=9DQV4zm=-sa5b7j4n1=ueGm_qJM8+LYsT82sA@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] powertop: update to v2.9
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
X-List-Received-Date: Fri, 13 Oct 2017 02:42:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 12, 2017 at 5:41 PM, Tim Orling
<timothy.t.orling@linux.intel.com> wrote:
> * Upstream filename added "v" before version:
>   - Add UPSTREAM_CHECK_REGEX
>   - Update SRC_URI to include the "v"
>   - Point ${S} to proper directory
>
> * Patch for required headers no longer needed in current upstream
> * Tested on qemux86-64 core-image-full-cmdline image with multilib
>

have you also tested with TCLIBC = "musl" ?
if not please do so

> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
>
> ---
>
> Changes in v2: use ${BPN} instead of ${PN} so multilib does not fail
> ---
>  ...0001-include-rquired-headers-for-typedefs.patch | 47 ----------------------
>  .../powertop/{powertop_2.8.bb => powertop_2.9.bb}  | 10 +++--
>  2 files changed, 6 insertions(+), 51 deletions(-)
>  delete mode 100644 meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch
>  rename meta/recipes-kernel/powertop/{powertop_2.8.bb => powertop_2.9.bb} (77%)
>
> diff --git a/meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch b/meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch
> deleted file mode 100644
> index 0fd63106d6..0000000000
> --- a/meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 0856d8145d187a7e5a49625247abe43a13f95acc Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 15 Sep 2015 19:36:28 +0000
> -Subject: [PATCH] include rquired headers for typedefs
> -
> -timeval struct needs to include sys/time.h and sprintf() usage requires
> -to include stdio.h headers from system
> -
> -Fixes
> -src/perf/perf_bundle.cpp:141:2: error: use of undeclared identifier 'sprintf'; did you mean 'vswprintf'?
> -src/devices/devfreq.h:35:18: error: field has incomplete type 'struct timeval'
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - src/devices/devfreq.h    | 1 +
> - src/perf/perf_bundle.cpp | 1 +
> - 2 files changed, 2 insertions(+)
> -
> -diff --git a/src/devices/devfreq.h b/src/devices/devfreq.h
> -index 16a60fb..4bede7c 100644
> ---- a/src/devices/devfreq.h
> -+++ b/src/devices/devfreq.h
> -@@ -25,6 +25,7 @@
> - #ifndef _INCLUDE_GUARD_DEVFREQ_H
> - #define _INCLUDE_GUARD_DEVFREQ_H
> -
> -+#include <sys/time.h>
> - #include "device.h"
> - #include "../parameters/parameters.h"
> -
> -diff --git a/src/perf/perf_bundle.cpp b/src/perf/perf_bundle.cpp
> -index cf1ae11..232f894 100644
> ---- a/src/perf/perf_bundle.cpp
> -+++ b/src/perf/perf_bundle.cpp
> -@@ -27,6 +27,7 @@
> - #include <algorithm>
> - #include <string.h>
> - #include <stdint.h>
> -+#include <stdio.h>
> - #include <sys/types.h>
> - #include <sys/stat.h>
> - #include <fcntl.h>
> ---
> -2.5.2
> -
> diff --git a/meta/recipes-kernel/powertop/powertop_2.8.bb b/meta/recipes-kernel/powertop/powertop_2.9.bb
> similarity index 77%
> rename from meta/recipes-kernel/powertop/powertop_2.8.bb
> rename to meta/recipes-kernel/powertop/powertop_2.9.bb
> index 4d7a3e7bd0..4fe5447a03 100644
> --- a/meta/recipes-kernel/powertop/powertop_2.8.bb
> +++ b/meta/recipes-kernel/powertop/powertop_2.9.bb
> @@ -6,17 +6,19 @@ DEPENDS = "ncurses libnl pciutils"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
>
> -SRC_URI = "http://01.org/sites/default/files/downloads/powertop/powertop-${PV}.tar.gz \
> -           file://0001-include-rquired-headers-for-typedefs.patch \
> +SRC_URI = "http://01.org/sites/default/files/downloads/powertop/powertop-v${PV}.tar.gz \
>  "
>
> -SRC_URI[md5sum] = "c55fedb69203e480801b18bd7b886241"
> -SRC_URI[sha256sum] = "a87b563f73106babfa3e74dcf92f252938c061e309ace20a361358bbfa579c5a"
> +SRC_URI[md5sum] = "583518c5c4434c6e9b9c58c3920950b6"
> +SRC_URI[sha256sum] = "aa7fb7d8e9a00f05e7d8a7a2866d85929741e0d03a5bf40cab22d2021c959250"
>
>  UPSTREAM_CHECK_URI = "https://01.org/powertop/downloads"
> +UPSTREAM_CHECK_REGEX = "powertop-[v]?(?P<pver>\d+(\.\d+)+)\.tar"
>
>  inherit autotools gettext pkgconfig
>
> +S = "${WORKDIR}/${BPN}-v${PV}"
> +
>  # we do not want libncursesw if we can
>  do_configure_prepend() {
>      # configure.ac checks for delwin() in "ncursesw ncurses" so let's drop first one
> --
> 2.13.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

