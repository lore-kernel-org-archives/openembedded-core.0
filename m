Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qofac-00048U-1t
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 19:50:42 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Aug 2011 10:46:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,311,1309762800"; d="scan'208";a="34771907"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by azsmga001.ch.intel.com with ESMTP; 03 Aug 2011 10:46:18 -0700
Message-ID: <4E398969.7010907@linux.intel.com>
Date: Wed, 03 Aug 2011 10:46:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1312387134-18067-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1312387134-18067-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH] libmusicbrainz: utilize base_libdir when	configured
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
X-List-Received-Date: Wed, 03 Aug 2011 17:50:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2011 08:58 AM, Kumar Gala wrote:
> Pass $base_libdir through when we configure to support a location
> other than /lib.
>
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
>   .../musicbrainz/libmusicbrainz_3.0.3.bb            |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb
> index d6fb2f4..20080ee 100644
> --- a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb
> +++ b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24 \
>                       file://include/musicbrainz3/includes.h;beginline=1;endline=21;md5=9ab2846573f560cea7561da472803a72"
>   DEPENDS = "expat neon"
>
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI = "http://ftp.musicbrainz.org/pub/musicbrainz/${BPN}-${PV}.tar.gz \
>              file://fix_build_issue_for_gcc_4.5.0.patch "
> @@ -15,3 +15,5 @@ SRC_URI[md5sum] = "f4824d0a75bdeeef1e45cc88de7bb58a"
>   SRC_URI[sha256sum] = "7fd459a9fd05be9faec60a9a21caa9a1e9fda03147d58d8c7c95f33582a738c5"
>
>   inherit cmake pkgconfig
> +
> +EXTRA_OECMAKE = "-DLIB_INSTALL_DIR=${base_libdir}"

I think this should be ${libdir}

Sau!



