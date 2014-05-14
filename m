Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CCA1D6028A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 04:29:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 May 2014 21:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1049,1389772800"; d="scan'208";a="540016818"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by orsmga002.jf.intel.com with ESMTP; 13 May 2014 21:28:54 -0700
Message-ID: <5372F106.4060700@linux.intel.com>
Date: Tue, 13 May 2014 21:28:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1399896893-486-1-git-send-email-ross.burton@intel.com>
	<1399896893-486-3-git-send-email-ross.burton@intel.com>
In-Reply-To: <1399896893-486-3-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH 3/7] freetype: upgrade to 2.5.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 May 2014 04:29:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2014 05:14 AM, Ross Burton wrote:
> Also drop the redundant definition of S.
>

There seems to be a problem with this update, both native and target 
fail as follows:

> | /bin/grep: /srv/ssd/builds/world/tmp/sysroots/qemux86-64/usr/lib64/libfreetype.la: No such file or directory
> | sed: can't read /srv/ssd/builds/world/tmp/sysroots/qemux86-64/usr/lib64/libfreetype.la: No such file or directory
> | x86_64-poky-linux-libtool: link: `/srv/ssd/builds/world/tmp/sysroots/qemux86-64/usr/lib64/libfreetype.la' is not a valid libtool archive
> | make: *** [/srv/ssd/builds/world/tmp/work/core2-64-poky-linux/freetype/2.5.3-r0/freetype-2.5.3/objs/libfreetype.la] Error 1
> | ERROR: oe_runmake failed
> | WARNING: /srv/ssd/builds/world/tmp/work/core2-64-poky-linux/freetype/2.5.3-r0/temp/run.do_compile.17097:1 exit 1 from
> |   exit 1
> | ERROR: Function failed: do_compile (log file is located at /srv/ssd/builds/world/tmp/work/core2-64-poky-linux/freetype/2.5.3-r0/temp/log.do_compile.17097)


Sau!


> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   .../freetype/{freetype_2.5.2.bb => freetype_2.5.3.bb}        |   10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
>   rename meta/recipes-graphics/freetype/{freetype_2.5.2.bb => freetype_2.5.3.bb} (89%)
>
> diff --git a/meta/recipes-graphics/freetype/freetype_2.5.2.bb b/meta/recipes-graphics/freetype/freetype_2.5.3.bb
> similarity index 89%
> rename from meta/recipes-graphics/freetype/freetype_2.5.2.bb
> rename to meta/recipes-graphics/freetype/freetype_2.5.3.bb
> index 0c62a67..7182c21 100644
> --- a/meta/recipes-graphics/freetype/freetype_2.5.2.bb
> +++ b/meta/recipes-graphics/freetype/freetype_2.5.3.bb
> @@ -13,13 +13,9 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=c017ff17fc6f0794adf93db5559ccd56
>
>   SECTION = "libs"
>
> -SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
> -"
> -
> -SRC_URI[md5sum] = "10e8f4d6a019b124088d18bc26123a25"
> -SRC_URI[sha256sum] = "4ff4bd393aa01071ec7b849d035508a505a78f88b2bcf25ff11e58e43c0b9def"
> -
> -S = "${WORKDIR}/freetype-${PV}"
> +SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "d6b60f06bfc046e43ab2a6cbfd171d65"
> +SRC_URI[sha256sum] = "c0848b29d52ef3ca27ad92e08351f023c5e24ce8cea7d8fe69fc96358e65f75e"
>
>   inherit autotools-brokensep pkgconfig binconfig multilib_header
>
>

