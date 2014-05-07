Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7C7FA605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 18:11:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 07 May 2014 10:59:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1005,1389772800"; d="scan'208";a="527990411"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga001.fm.intel.com with ESMTP; 07 May 2014 11:04:20 -0700
Message-ID: <536A75A4.6030403@linux.intel.com>
Date: Wed, 07 May 2014 11:04:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1399478735-27819-1-git-send-email-ross.burton@intel.com>
	<1399478735-27819-4-git-send-email-ross.burton@intel.com>
In-Reply-To: <1399478735-27819-4-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH 4/5] freetype: upgrade to 2.5.3
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
X-List-Received-Date: Wed, 07 May 2014 18:11:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/07/2014 09:05 AM, Ross Burton wrote:
> Also drop the redundant definition of S.
>
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
>
> +SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "d6b60f06bfc046e43ab2a6cbfd171d65"
> +SRC_URI[sha256sum] = "c0848b29d52ef3ca27ad92e08351f023c5e24ce8cea7d8fe69fc96358e65f75e"
>
>   inherit autotools-brokensep pkgconfig binconfig multilib_header
>
>

Hmm, something else went wrong:

>  /srv/hdd/builds/world/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -L/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib -lharfbuzz  -no-undefined
>> | /bin/grep: /srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libfreetype.la: No such file or directory
>> | sed: can't read /srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libfreetype.la: No such file or directory
>> | libtool:   error: '/srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libfreetype.la' is not a valid libtool archive
>> | make: *** [/srv/hdd/builds/world/tmp/work/x86_64-linux/freetype-native/2.5.3-r0/freetype-2.5.3/objs/libfreetype.la] Error 1
>> | ERROR: oe_runmake failed
>> | WARNING: /srv/hdd/builds/world/tmp/work/x86_64-linux/freetype-native/2.5.3-r0/temp/run.do_compile.28294:1 exit 1 from
>> |   exit 1
>> | ERROR: Function failed: do_compile (log file is located at /srv/hdd/builds/world/tmp/work/x86_64-linux/freetype-native/2.5.3-r0/temp/log.do_compile.28294)
>


Sau!


