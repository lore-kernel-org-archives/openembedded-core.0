Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id F20E875172
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 12:02:54 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id c5-v6so19462742itj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 05:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JJGr3XLV4MLKQMNfxsuqGrLOThpwaFB2oHPCp5uiq/I=;
	b=oztuGiCywxAZLjzJUk6sS/YR0gecrSaR6j/E3kGUqgg5OcI267JxmMmvl8nz+BzEak
	ndqJ7jflIatHs2VAT/ZxmHQIUai12y4s+iykyAqa+xX5fhFz9dvAGWu5wvG/zzbrJOZl
	EOlBAXWOlw3h4I4oZ+FhXaG86mdvrXaUkyFOzfDHS1vcrl/xSt/G3KPc1IXv/kSdned5
	9SIedZ5Or4fL+NqHXscItFogAZgz3QZeEwgUeN2IFc9yzorw2Hw3HBlybUyVXFBH5iby
	nu51qOMyb7Xb16P3Teu49saWZ+cHUSXGeVlNqpWHUTXBzC550jdV84wejhCMqykqxWQm
	Byew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JJGr3XLV4MLKQMNfxsuqGrLOThpwaFB2oHPCp5uiq/I=;
	b=t+4VA7tS87kPBYqUp8RzJusDKc3xcfNsuMTKuCDLnAFSlyxPu2x2w+TjKt9T+xMvT3
	z9qNEgYvrdNgXnrZswFY2b35xobw/m6HP/1HOEjNLXij/6TCH59oEZHTvBLR2LjzmsZQ
	BrD0jllnVwf5x40qhuPWUfHgvjR5iJPIQ+t9MjLcT14Ee8yWFRBE0A/C9nKez171br4C
	UqJwA0+/VYBcmvF1qzz8m2kpHkFKZuXwqAQTbf8It+YehPMZdXzoDIfIsl3yq2fuQxHq
	SrCX7/Xjnd02+9ebbRveWciM9ww6PtMmkXGUTgKq4MrWcKQ0GSAuS41Th7bqACnjrBA7
	Os2A==
X-Gm-Message-State: ALKqPwclRaHZNO1uTW7xeh49DVXaHdLyzoPOAqXr87j4nYQNOXbsKnXC
	KxBJoUfOXJX6JzliD/gswnNs41mKfgMIkuupSYq0uw==
X-Google-Smtp-Source: AB8JxZrUvBA9WTX2BqVaQEU+IM7zQpar6SFrLXchvf/6sZ30L64diCFz82Q8eDC16rv9XvZOasJcuUdovY/NLuX9ZYw=
X-Received: by 2002:a24:d2c4:: with SMTP id
	z187-v6mr1412086itf.60.1525953775635; 
	Thu, 10 May 2018 05:02:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Thu, 10 May 2018 05:02:35 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA015869526A@ALA-MBD.corp.ad.wrs.com>
References: <20180315082445.8104-1-jackie.huang@windriver.com>
	<CAJTo0LavpHe=+2uJ=9JatGE_Yr1kLLwNA+v-kWNxmt=ReuLcnw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA015869526A@ALA-MBD.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 May 2018 13:02:35 +0100
Message-ID: <CAJTo0LZ73iwvOtmFD_xbmtzCj=avFHtXqikwwRDL3Z5mjyeu+A@mail.gmail.com>
To: "Huang, Jackie (Wind River)" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distcc: update to 3.3
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
X-List-Received-Date: Thu, 10 May 2018 12:02:55 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Jackie,

Did you get to look at the distcc 3.3 upgrade failures?  We're open
again for updates and moving to 3.3 instead of a forked repository on
Armin's personal github would be nice!

Ross

On 22 March 2018 at 01:09, Huang, Jackie (Wind River)
<jackie.huang@windriver.com> wrote:
> I will take a look and fix, thanks!
>
>
>
> Thanks,
>
> Jackie
>
>
>
> From: Burton, Ross [mailto:ross.burton@intel.com]
> Sent: Wednesday, March 21, 2018 18:44
> To: Huang, Jie (Jackie)
> Cc: OE-core
> Subject: Re: [OE-core] [PATCH] distcc: update to 3.3
>
>
>
> This fails to start under systemd so caused the QA to fail:
>
>
>
> https://autobuilder.yocto.io/builders/nightly-qa-extras/builds/882/steps/Running%20Sanity%20Tests_7/logs/stdio
>
>
>
> Ross
>
>
>
> On 15 March 2018 at 08:24, <jackie.huang@windriver.com> wrote:
>
> From: Jackie Huang <jackie.huang@windriver.com>
>
> * update to version 3.3
> * Remove 0001-zeroconf-Include-fcntl.h.patch since it's
>   included in v3.3
> * Add update-distcc-symlinks into FILES.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../distcc/{distcc_3.2.bb => distcc_3.3.bb}        | 10 +++++---
>  .../files/0001-zeroconf-Include-fcntl.h.patch      | 29
> ----------------------
>  2 files changed, 6 insertions(+), 33 deletions(-)
>  rename meta/recipes-devtools/distcc/{distcc_3.2.bb => distcc_3.3.bb} (91%)
>  delete mode 100644
> meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch
>
> diff --git a/meta/recipes-devtools/distcc/distcc_3.2.bb
> b/meta/recipes-devtools/distcc/distcc_3.3.bb
> similarity index 91%
> rename from meta/recipes-devtools/distcc/distcc_3.2.bb
> rename to meta/recipes-devtools/distcc/distcc_3.3.bb
> index b6da65a582a..a266e7dde9b 100644
> --- a/meta/recipes-devtools/distcc/distcc_3.2.bb
> +++ b/meta/recipes-devtools/distcc/distcc_3.3.bb
> @@ -14,14 +14,15 @@ PACKAGECONFIG[popt] =
> "--without-included-popt,--with-included-popt,popt"
>
>  RRECOMMENDS_${PN} = "avahi-daemon"
>
> -SRC_URI = "git://github.com/distcc/distcc.git;branch=${PV} \
> +SRC_URI = "git://github.com/distcc/distcc.git;branch=master \
>             file://separatebuilddir.patch \
> -           file://0001-zeroconf-Include-fcntl.h.patch \
>             file://default \
>             file://distccmon-gnome.desktop \
>             file://distcc \
>             file://distcc.service"
> -SRCREV = "d8b18df3e9dcbe4f092bed565835d3975e99432c"
> +
> +SRCREV = "002e68b766ccd7ad05551e67d162b71a7a773d0d"
> +
>  S = "${WORKDIR}/git"
>  UPSTREAM_VERSION_UNKNOWN = "1"
>
> @@ -60,9 +61,10 @@ PACKAGES += "distcc-distmon-gnome"
>
>  FILES_${PN} = " ${sysconfdir} \
>                 ${bindir}/distcc \
> -    ${bindir}/lsdistcc \
> +               ${bindir}/lsdistcc \
>                 ${bindir}/distccd \
>                 ${bindir}/distccmon-text \
> +               ${sbindir}/update-distcc-symlinks \
>                 ${systemd_unitdir}/system/distcc.service"
>  FILES_distcc-distmon-gnome = "  ${bindir}/distccmon-gnome \
>                                 ${datadir}/distcc"
> diff --git
> a/meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch
> b/meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch
> deleted file mode 100644
> index b17ec9c9599..00000000000
> --- a/meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 8331fc4759d809512f404e7a27f817ad6d616450 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 13 Apr 2015 18:00:33 -0700
> -Subject: [PATCH] zeroconf: Include fcntl.h
> -
> -We need it for getting deinitions for O_* e.g. O_CREAT
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/zeroconf.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/zeroconf.c b/src/zeroconf.c
> -index 414ddc4..31bd33f 100644
> ---- a/src/zeroconf.c
> -+++ b/src/zeroconf.c
> -@@ -33,6 +33,7 @@
> - #include <unistd.h>
> - #include <stdlib.h>
> - #include <limits.h>
> -+#include <fcntl.h>
> -
> - #include <avahi-common/domain.h>
> - #include <avahi-common/error.h>
> ---
> -2.1.4
> -
> --
> 2.13.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

