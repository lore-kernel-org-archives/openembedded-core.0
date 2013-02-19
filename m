Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U7qj5-0001Ed-4l
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 18:11:32 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Feb 2013 08:54:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,696,1355126400"; d="scan'208";a="264622519"
Received: from unknown (HELO [10.255.12.111]) ([10.255.12.111])
	by orsmga001.jf.intel.com with ESMTP; 19 Feb 2013 08:54:13 -0800
Message-ID: <5123AE35.5020007@linux.intel.com>
Date: Tue, 19 Feb 2013 08:54:13 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1361123592-32572-1-git-send-email-otavio@ossystems.com.br>
	<1361123592-32572-4-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1361123592-32572-4-git-send-email-otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 4/5] qt4-tools: Drop libx11 dependency when building without 'x11' distro feature
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
X-List-Received-Date: Tue, 19 Feb 2013 17:11:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/17/2013 09:53 AM, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> index cfc6fd8..d7ce8dc 100644
> --- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> +++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> @@ -1,10 +1,10 @@
>   DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
> -DEPENDS = "nativesdk-zlib nativesdk-dbus nativesdk-libx11 qt4-native"
> +DEPENDS = "nativesdk-zlib nativesdk-dbus ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11', '', d)} qt4-native"
>   SECTION = "libs"
>   HOMEPAGE = "http://qt.nokia.com"
>   LICENSE = "LGPLv2.1 | GPLv3"
>
> -INC_PR = "r13"
> +INC_PR = "r14"
>
>   FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
>
>

Does this also need a change to the EXTRA_OECONF to ensure that the x11 
functionality is disabled by default in the configuration.

Thanks
	Sau!



