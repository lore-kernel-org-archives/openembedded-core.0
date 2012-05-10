Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SSZZu-0007J4-4A
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 22:03:10 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 May 2012 12:53:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="98669697"
Received: from unknown (HELO [10.255.12.250]) ([10.255.12.250])
	by AZSMGA002.ch.intel.com with ESMTP; 10 May 2012 12:53:14 -0700
Message-ID: <4FAC1CA9.7040901@linux.intel.com>
Date: Thu, 10 May 2012 12:53:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336659690-27308-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1336659690-27308-1-git-send-email-andrei@gherzan.ro>
Subject: Re: [PATCH] fotowall: Add #include ui_wizard.h to ExportWizard.cpp
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2012 20:03:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2012 07:21 AM, Andrei Gherzan wrote:
> App/ExportWizard.cpp depends on wizard.h which depends on ui_wizard. The last one
> should be already generated before compiling ExportWizard.cpp.
>
> [YOCTO #2297]
>
> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
> ---
>   .../ExportWizard-depends-on-ui_wizard.patch        |   12 ++++++++++++
>   meta/recipes-qt/qt-apps/fotowall_0.9.bb            |    6 ++++--
>   2 files changed, 16 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch
>
> diff --git a/meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch b/meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch
> new file mode 100644
> index 0000000..3ad5774
> --- /dev/null
> +++ b/meta/recipes-qt/qt-apps/fotowall/ExportWizard-depends-on-ui_wizard.patch

Missing Patch header (SOB and Upstream-Status:)

Thanks
	Sau!

> @@ -0,0 +1,12 @@
> +Index: Fotowall-0.9/App/ExportWizard.cpp
> +===================================================================
> +--- Fotowall-0.9.orig/App/ExportWizard.cpp	2009-11-30 13:21:31.000000000 +0200
> ++++ Fotowall-0.9/App/ExportWizard.cpp	2012-05-10 17:12:06.765230830 +0300
> +@@ -23,6 +23,7 @@
> + #include "imageloaderqt.h"
> + #include "posterazorcore.h"
> + #include "wizard.h"
> ++#include "ui_wizard.h"
> +
> + #include<QDesktopServices>
> + #include<QDesktopWidget>
> diff --git a/meta/recipes-qt/qt-apps/fotowall_0.9.bb b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
> index 52dd727..3cb79a3 100644
> --- a/meta/recipes-qt/qt-apps/fotowall_0.9.bb
> +++ b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
> @@ -7,12 +7,14 @@ LIC_FILES_CHKSUM = "file://GPL_V2;md5=79808397c3355f163c012616125c9e26 \
>                       file://main.cpp;beginline=6;endline=11;md5=b569acc2bf8974a3082b58fc53b9d8dc"
>   SECTION = "x11/apps"
>
> -PR = "r2"
> +PR = "r3"
>
>   DEPENDS = "qt4-x11-free"
>   RRECOMMENDS_${PN} += "qt4-plugin-imageformat-gif qt4-plugin-imageformat-jpeg qt4-plugin-imageformat-tiff"
>
> -SRC_URI = "http://qt-apps.org/CONTENT/content-files/71316-Fotowall-0.9.tar.bz2"
> +SRC_URI = "http://qt-apps.org/CONTENT/content-files/71316-Fotowall-0.9.tar.bz2 \
> +           file://ExportWizard-depends-on-ui_wizard.patch \
> +           "
>
>   SRC_URI[md5sum] = "142ef697332e0777c6d22c5bc96cc438"
>   SRC_URI[sha256sum] = "e4d0c005d2cb1d7c09438bfc3098eadebc08946e4fbc0655b7fc8b046de3810d"


