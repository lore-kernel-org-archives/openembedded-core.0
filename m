Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T7TxJ-0004lk-Pw
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 18:20:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 31 Aug 2012 09:08:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,347,1344236400"; d="scan'208";a="187432023"
Received: from unknown (HELO [10.255.12.251]) ([10.255.12.251])
	by azsmga001.ch.intel.com with ESMTP; 31 Aug 2012 09:08:07 -0700
Message-ID: <5040E167.4080100@linux.intel.com>
Date: Fri, 31 Aug 2012 09:08:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Marc Ferland <ferlandm@sonatest.com>
References: <1346350125-10939-1-git-send-email-ferlandm@sonatest.com>
In-Reply-To: <1346350125-10939-1-git-send-email-ferlandm@sonatest.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sysstat: Explicitly disable sensors support.
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
X-List-Received-Date: Fri, 31 Aug 2012 16:20:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/30/2012 11:08 AM, Marc Ferland wrote:
> Since no lmsensors recipe exists by default in oe-core, explicitly disable
> support for it in sysstat. In my case sysstat would fail linking complaining
> about undefined references when adding my own lmsensors recipe.
>
> Signed-off-by: Marc Ferland <ferlandm@sonatest.com>
> ---
>   meta/recipes-extended/sysstat/sysstat.inc       |    2 ++
>   meta/recipes-extended/sysstat/sysstat_10.0.5.bb |    2 +-
>   2 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
> index 9da40a7..287bb54 100644
> --- a/meta/recipes-extended/sysstat/sysstat.inc
> +++ b/meta/recipes-extended/sysstat/sysstat.inc
> @@ -3,12 +3,14 @@ DESCRIPTION = "The sysstat utilities are a collection of performance monitoring
>   HOMEPAGE = "http://sebastien.godard.pagesperso-orange.fr/"
>   LICENSE = "GPLv2+"
>   SECTION = "console/utils"
> +INC_PR = "r1"
>
>   SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.gz \
>   		   file://99_sysstat"
>
>   inherit autotools gettext
>
> +EXTRA_OECONF += "--disable-sensors"
>   EXTRA_OEMAKE += 'LFLAGS=""'
>
>   do_install() {
> diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.5.bb b/meta/recipes-extended/sysstat/sysstat_10.0.5.bb
> index 233102a..1c8595a 100644
> --- a/meta/recipes-extended/sysstat/sysstat_10.0.5.bb
> +++ b/meta/recipes-extended/sysstat/sysstat_10.0.5.bb
> @@ -2,7 +2,7 @@ require sysstat.inc
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>
> -PR = "r0"
> +PR = "${INC_PR}.1"
>
>   SRC_URI[md5sum] = "208dd236d726d20591d53d3a20124dd4"
>   SRC_URI[sha256sum] = "1f474d6ca742af73d0f9d09a374bda64c72bccb126aef327fa74383ff438feff"
>
Merged into OE-Core

Thanks
	Sau!



