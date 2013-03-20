Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UINmn-0002qT-Au
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 19:30:54 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 Mar 2013 11:12:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,880,1355126400"; d="scan'208";a="217033438"
Received: from unknown (HELO helios.localnet) ([10.255.13.114])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Mar 2013 11:12:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: eu@felipetonello.com
Date: Wed, 20 Mar 2013 18:12:53 +0000
Message-ID: <1813949.PJfGMBEi9g@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <1363730053-7719-4-git-send-email-eu@felipetonello.com>
References: <1363730053-7719-1-git-send-email-eu@felipetonello.com>
	<1363730053-7719-4-git-send-email-eu@felipetonello.com>
MIME-Version: 1.0
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 3/3] qt-mobility: added list of modules to be compiled
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
X-List-Received-Date: Wed, 20 Mar 2013 18:30:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Felipe,

On Tuesday 19 March 2013 14:54:13 eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
> 
> This is useful for users that want to .bbappend this recipe to select
> specific modules to be compiled.
> 
> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> ---
>  meta/recipes-qt/qt4/qt-mobility_1.2.0.inc |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc index fca4cb0..b0ab613 100644
> --- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> +++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> @@ -18,7 +18,7 @@ SRC_URI =
> "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.t
> SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
>  SRC_URI[sha256sum]="ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc1
> 54cf0ba44"
> 
> -PR = "r7"
> +PR = "r8"
> 
>  S = "${WORKDIR}/qt-mobility-opensource-src-${PV}"
> 
> @@ -31,6 +31,8 @@ qtm_plugins	:= "/usr/lib/${qtm_dir}/plugins/QtMobility"
>  qtm_data	:= "/usr/share/${qtm_dir}"
>  qtm_imports	:= "/usr/lib/${qtm_dir}/imports"
> 
> +qtm_modules_list ?= "bearer contacts gallery location publishsubscribe
> messaging multimedia \ +systeminfo serviceframework sensors versit
> organizer feedback connectivity" qtm_bluezflag ?=
> "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'yes', 'no', d)}"

Typically variable names like this should be upper case; I know we've got some 
lower case ones in here already but let's not introduce any more that we'll 
have difficulty changing later.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


