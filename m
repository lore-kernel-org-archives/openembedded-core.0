Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TAShv-0003AP-Ux
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 23:36:52 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Sep 2012 14:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,392,1344236400"; d="scan'208";a="199750553"
Received: from unknown (HELO helios.localnet) ([10.252.121.183])
	by orsmga002.jf.intel.com with ESMTP; 08 Sep 2012 14:24:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 08 Sep 2012 22:24:21 +0100
Message-ID: <10694471.LEfBYke1Mc@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <43838ea5c9fde9942d50713c95efbc4585472d28.1347055585.git.mark.hatle@windriver.com>
References: <cover.1347055585.git.mark.hatle@windriver.com>
	<43838ea5c9fde9942d50713c95efbc4585472d28.1347055585.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] qt4: Update qt4.inc to remove staticdev deps in -dbg packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Sep 2012 21:36:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 07 September 2012 17:07:11 Mark Hatle wrote:
> It appears that the qt4.inc had a copy/paste error relating to creating
> a list of staticdev packages, that caused them to show up as dependencies
> in the -dbg package.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
>  meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
>  meta/recipes-qt/qt4/qt4.inc          |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc
> b/meta/recipes-qt/qt4/qt4-embedded.inc index de1b88e..53eb652 100644
> --- a/meta/recipes-qt/qt4/qt4-embedded.inc
> +++ b/meta/recipes-qt/qt4/qt4-embedded.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "Qt is a versatile cross-platform application
> framework -- this is SECTION = "libs"
>  HOMEPAGE = "http://qt.nokia.com"
>  DEPENDS += "directfb tslib"
> -INC_PR = "r47"
> +INC_PR = "r48"
> 
>  QT_BASE_LIB  ?= "libqt-embedded"
> 
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc
> b/meta/recipes-qt/qt4/qt4-x11-free.inc index e229b85..0ae74f7 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> @@ -6,7 +6,7 @@ SECTION = "x11/libs"
>  DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext
> libxrender libxrandr libxcursor" PROVIDES += "qt4-x11"
> 
> -INC_PR = "r45"
> +INC_PR = "r46"
> 
>  QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl',
> '-no-opengl', d)} " QT_GLFLAGS_qemux86 = "-opengl"
> diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
> index b8c6baf..ba231ba 100644
> --- a/meta/recipes-qt/qt4/qt4.inc
> +++ b/meta/recipes-qt/qt4/qt4.inc
> @@ -61,7 +61,7 @@ python __anonymous () {
>          staticdev_packages.append("%s-staticdev" % pkg)
>      for name in d.getVar("OTHER_PACKAGES", True).split():
>          dbg_packages.append("%s-dbg" % name)
> -        dbg_packages.append("%s-staticdev" % name)
> +        staticdev_packages.append("%s-staticdev" % name)
> 
>      for name in d.getVar("QT_EXTRA_LIBS", True).split():
>          pkg = d.getVar("QT_BASE_LIB", True) + name.lower().replace("qt",
> "").replace("_", "-") + "4"

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


