Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 558716C73E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 14:47:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2013 06:47:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,798,1378882800"; d="scan'208";a="416945672"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.192])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2013 06:47:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ross Burton <ross.burton@intel.com>
Date: Fri, 29 Nov 2013 14:47:41 +0000
Message-ID: <1935443.LMsZVW7734@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1385733065-13722-1-git-send-email-ross.burton@intel.com>
References: <1385733065-13722-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4-x11-free: depend on ICU
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
X-List-Received-Date: Fri, 29 Nov 2013 14:47:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ross,

On Friday 29 November 2013 13:51:05 Ross Burton wrote:
> ICU presence is auto-detected at configure time and until recently (e68850
> and d61230) was pulled into most builds through harfbuzz and beecrypt.  Now
> it's floating and this leads to build failures.
> 
> As in all likelihood the majority of people were building this with ICU
> enabled, add an explicit dependency.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
>  meta/recipes-qt/qt4/qt4.inc          |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc
> b/meta/recipes-qt/qt4/qt4-x11-free.inc index 369b3d5..46869aa 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> @@ -3,7 +3,7 @@ require qt4.inc
>  DESCRIPTION = "Qt is a versatile cross-platform application framework --
> this is the X11 version." HOMEPAGE = "http://qt-project.org/"
>  SECTION = "x11/libs"
> -DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext
> libxrender libxrandr libxcursor" +DEPENDS += "virtual/libgl virtual/libx11
> fontconfig libxft libxext libxrender libxrandr libxcursor icu" PROVIDES +=
> "qt4-x11"
>  QT4DEPENDS = ""
> 
> diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
> index 293eb87..659561c 100644
> --- a/meta/recipes-qt/qt4/qt4.inc
> +++ b/meta/recipes-qt/qt4/qt4.inc
> @@ -23,7 +23,7 @@ QT_MULTIMEDIA ?= "${@base_contains('DISTRO_FEATURES',
> 'pulseaudio', '-pulseaudio QT_CONFIG_FLAGS += "-release -no-cups
> -reduce-relocations \
>                      -shared -no-nas-sound -no-nis \
>                      -system-libjpeg -system-libpng -system-libtiff
> -system-zlib \ -                    -no-pch -stl -glib \
> +                    -no-pch -stl -glib -icu \
>                      -no-rpath -silent \
>                      ${QT_DBUS} \
>                      ${QT_QT3SUPPORT} \

It seems like ICU might still have problems building for PowerPC. If that's 
the case, we should probably be explicitly disabling ICU for that 
architecture, right?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

