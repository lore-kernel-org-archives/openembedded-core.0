Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SgfFi-0001oC-3t
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 18:56:34 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jun 2012 09:45:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181665680"
Received: from unknown (HELO [10.255.12.105]) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2012 09:45:50 -0700
Message-ID: <4FDF5B3E.5050503@linux.intel.com>
Date: Mon, 18 Jun 2012 09:45:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1339764889-25852-1-git-send-email-laurentiu.palcu@intel.com>
	<1339764889-25852-3-git-send-email-laurentiu.palcu@intel.com>
In-Reply-To: <1339764889-25852-3-git-send-email-laurentiu.palcu@intel.com>
Subject: Re: [PATCH 2/2] puzzles: upgrade to r9561
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
X-List-Received-Date: Mon, 18 Jun 2012 16:56:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2012 05:54 AM, Laurentiu Palcu wrote:
> Minor change in LICENCE file:
>
> -This software is copyright (c) 2004-2010 Simon Tatham.
> +This software is copyright (c) 2004-2012 Simon Tatham.
>
> Signed-off-by: Laurentiu Palcu<laurentiu.palcu@intel.com>
> ---
>   .../puzzles/{puzzles_r9375.bb =>  puzzles_r9561.bb} |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-sato/puzzles/{puzzles_r9375.bb =>  puzzles_r9561.bb} (88%)
>
> diff --git a/meta/recipes-sato/puzzles/puzzles_r9375.bb b/meta/recipes-sato/puzzles/puzzles_r9561.bb
> similarity index 88%
> rename from meta/recipes-sato/puzzles/puzzles_r9375.bb
> rename to meta/recipes-sato/puzzles/puzzles_r9561.bb
> index 1867dad..83fabdf 100644
> --- a/meta/recipes-sato/puzzles/puzzles_r9375.bb
> +++ b/meta/recipes-sato/puzzles/puzzles_r9561.bb
> @@ -6,13 +6,13 @@ PR = "r0"
>   MOD_PV = "${@d.getVar('PV',1)[1:]}"
>
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENCE;md5=9928b60f3b78be315b7ab699c1b03ff5"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=453de74d749439762ef4814f7bee1fec"
>
>   # Upstream updates puzzles.tar.gz for the new release, so checksums seem to be changing regularly right now
>   #SRC_URI = "svn://ixion.tartarus.org/main;module=puzzles;rev=${MOD_PV}"
>   SRC_URI = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-${PV}.tar.gz"
> -SRC_URI[md5sum] = "25f2349611cdd8fb35d27b24f5b937a8"
> -SRC_URI[sha256sum] = "bddf4e52c328c98b9d95bd7daf6b9098f25e8272a7c1059ba69809eb619124a2"
> +SRC_URI[md5sum] = "c86695aebfc95efe1d6241863849101b"
> +SRC_URI[sha256sum] = "2c20a45189387e3de8804a58bdb4e47ac4bb0f890001a509dfbdc015b5a84b95"
>
>
>   S = "${WORKDIR}/${BPN}-${PV}"

Merged into OE-Core

Thanks
	Sau!


