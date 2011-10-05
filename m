Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RBJJp-00023G-Uo
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 06:42:58 +0200
Received: from mail-bw0-f52.google.com ([209.85.214.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 04 Oct 2011 21:37:22 -0700
Received: by bke5 with SMTP id 5so1486198bke.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 21:37:21 -0700 (PDT)
Received: by 10.223.26.220 with SMTP id f28mr2953584fac.87.1317789441027;
	Tue, 04 Oct 2011 21:37:21 -0700 (PDT)
Received: from [10.6.18.233] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id u6sm550584fan.17.2011.10.04.21.37.19
	(version=SSLv3 cipher=OTHER); Tue, 04 Oct 2011 21:37:20 -0700 (PDT)
Message-ID: <4E8BDEFD.4060704@intel.com>
Date: Tue, 04 Oct 2011 21:37:17 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1317692542-32543-1-git-send-email-james@digitalmatter.com.au>
In-Reply-To: <1317692542-32543-1-git-send-email-james@digitalmatter.com.au>
Subject: Re: [PATCH] qt4-embedded: move qt4-embedded-conf from RDEPENDS to RRECOMMENDS
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
X-List-Received-Date: Wed, 05 Oct 2011 04:42:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2011 06:42 PM, James Limbouris wrote:
> qt4-embedded-conf contains an environment setup script for profile.d.
> It has been packaged seperately to allow for its exclusion, but this is
> only practical if it is added to RRECOMMENDS, rather than RDEPENDS.
>
> Signed-off-by: James Limbouris<james@digitalmatter.com.au>
> ---
>   meta/recipes-qt/qt4/qt4-embedded.inc |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
> index ed872b0..c04c49c 100644
> --- a/meta/recipes-qt/qt4/qt4-embedded.inc
> +++ b/meta/recipes-qt/qt4/qt4-embedded.inc
> @@ -3,7 +3,7 @@ SECTION = "libs"
>   LICENSE = "LGPLv2.1 | GPLv3"
>   HOMEPAGE = "http://qt.nokia.com"
>   DEPENDS += "directfb tslib"
> -INC_PR = "r32"
> +INC_PR = "r33"
>
>   QT_BASE_NAME ?= "qt4-embedded"
>   QT_BASE_LIB  ?= "libqt-embedded"
> @@ -31,7 +31,7 @@ do_install_append() {
>   # with depending on the global package qt4-embedded
>   PACKAGES += " ${PN}-conf"
>   FILES_${PN}-conf += " ${sysconfdir}/profile.d/qte.sh"
> -RDEPENDS_${PN} += " ${PN}-conf"
> +RRECOMMENDS_${PN} += " ${PN}-conf"
>
>   inherit qt4e
>
Merged into OE-Core

Thanks
	Sau!



