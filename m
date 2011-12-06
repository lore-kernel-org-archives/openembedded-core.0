Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RXun8-0007eZ-Ct
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 14:10:38 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Dec 2011 05:03:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="83997356"
Received: from unknown (HELO helios.localnet) ([10.252.121.246])
	by orsmga002.jf.intel.com with ESMTP; 06 Dec 2011 05:03:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 06 Dec 2011 13:03:48 +0000
Message-ID: <2251386.oTvBB9Hl7s@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <1323172804-16070-1-git-send-email-koen@dominion.thruhere.net>
References: <1323172804-16070-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Subject: Re: [PATCH] buildhistory bbclass: avoid absolute paths for files-in-image.txt to avoid diff churn when relocating TMPDIR
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
X-List-Received-Date: Tue, 06 Dec 2011 13:10:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 06 December 2011 13:00:04 Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/classes/buildhistory.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass index e4534e9..39f5ff6 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -321,7 +321,7 @@ buildhistory_get_image_installed() {
>  buildhistory_get_imageinfo() {
>  	# List the files in the image, but exclude date/time etc.
>  	# This awk script is somewhat messy, but handles where the size is not
> printed for device files under pseudo -	find ${IMAGE_ROOTFS} -ls | awk '{
> if ( $7 ~ /[0-9]/ ) printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6,
> $7, $11, $12, $13 ; else printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5,
> $6, 0, $10, $11, $12 }' > ${BUILDHISTORY_DIR_IMAGE}/files-in-image.txt +	(
> cd ${IMAGE_ROOTFS} && find . -ls | awk '{ if ( $7 ~ /[0-9]/ ) printf "%s
> %10-s %10-s %10s %s %s %s\n", $3, $5, $6, $7, $11, $12, $13 ; else printf
> "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, 0, $10, $11, $12 }' >
> ${BUILDHISTORY_DIR_IMAGE}/files-in-image.txt )
> 
>  	# Add some configuration information
>  	echo "${MACHINE}: ${IMAGE_BASENAME} configured for ${DISTRO}
> ${DISTRO_VERSION}" > ${BUILDHISTORY_DIR_IMAGE}/build-id

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 

Paul Eggleton
Intel Open Source Technology Centre


