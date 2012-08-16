Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T25fU-0001IZ-9L
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 21:23:44 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2012 12:11:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="135095951"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2012 12:11:26 -0700
Message-ID: <502D45DD.3040106@linux.intel.com>
Date: Thu, 16 Aug 2012 12:11:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344844140-10565-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1344844140-10565-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/2] man: fix RDEPENDS and reformat recipe
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
X-List-Received-Date: Thu, 16 Aug 2012 19:23:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2012 12:48 AM, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>   meta/recipes-extended/man/man_1.6f.bb |    7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/man/man_1.6f.bb b/meta/recipes-extended/man/man_1.6f.bb
> index 9f75307..3dce1ae 100644
> --- a/meta/recipes-extended/man/man_1.6f.bb
> +++ b/meta/recipes-extended/man/man_1.6f.bb
> @@ -3,11 +3,11 @@ DESCRIPTION = "A set of documentation tools: man, apropos and whatis"
>   SECTION = "console/utils"
>   HOMEPAGE = "http://primates.ximian.com/~flucifredi/man"
>   LICENSE = "GPLv2"
> -PR = "r3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>
> -DEPENDS = "groff less"
> +PR = "r4"
>
> -LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
> +DEPENDS = "groff less"
>
>   SRC_URI = "http://primates.ximian.com/~flucifredi/${BPN}/${BPN}-${PV}.tar.gz \
>              file://man-1.5k-confpath.patch;striplevel=0 \
> @@ -61,4 +61,5 @@ do_install_append(){
>   }
>
>
> +RDEPENDS_${PN} = "less groff"
>   FILES_${PN} += "${datadir}/locale ${sysconfdir}/man.conf"
>

Merged both of these man change to OE-Core

Thanks
	Sau!



