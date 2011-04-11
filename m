Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1Q9LfT-00027b-Vd
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Apr 2011 20:17:31 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Apr 2011 11:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,192,1301900400"; d="scan'208";a="731894953"
Received: from unknown (HELO [10.255.12.197]) ([10.255.12.197])
	by orsmga001.jf.intel.com with ESMTP; 11 Apr 2011 11:13:37 -0700
Message-ID: <4DA344D1.6080206@intel.com>
Date: Mon, 11 Apr 2011 11:13:37 -0700
From: Saul Wold <saul.wold@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Yu Ke <ke.yu@intel.com>
References: <cover.1302485033.git.ke.yu@intel.com>
	<b5e34c499be6bf4ac13d59e98c1e61585d1d9a84.1302485033.git.ke.yu@intel.com>
In-Reply-To: <b5e34c499be6bf4ac13d59e98c1e61585d1d9a84.1302485033.git.ke.yu@intel.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 5/9] evieext: upgrade from 1.1.0 to 1.1.1
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
X-List-Received-Date: Mon, 11 Apr 2011 18:17:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/10/2011 06:28 PM, Yu Ke wrote:
> From: Yu Ke<ke.yu@intel.com>
>
> - also change license checksum, the license is still MIT-X, but corp name
>    is changed from SUN to Oracle
>
> Signed-off-by: Yu Ke<ke.yu@intel.com>
> ---
>   .../distro/include/preferred-xorg-versions.inc     |    2 +-
>   .../{evieext_1.1.0.bb =>  evieext_1.1.1.bb}         |    8 ++++----
>   2 files changed, 5 insertions(+), 5 deletions(-)
>   rename meta/recipes-graphics/xorg-proto/{evieext_1.1.0.bb =>  evieext_1.1.1.bb} (54%)
>
> diff --git a/meta/conf/distro/include/preferred-xorg-versions.inc b/meta/conf/distro/include/preferred-xorg-versions.inc
> index 5fd2040..fabc0da 100644
> --- a/meta/conf/distro/include/preferred-xorg-versions.inc
> +++ b/meta/conf/distro/include/preferred-xorg-versions.inc
> @@ -9,7 +9,7 @@ PREFERRED_VERSION_bigreqsproto-nativesdk ?= "1.1.1"
>   PREFERRED_VERSION_compositeproto ?= "0.4.2"
>   PREFERRED_VERSION_damageproto ?= "1.2.1"
>   PREFERRED_VERSION_dmxproto ?= "2.3.1"
> -PREFERRED_VERSION_evieext ?= "1.1.0"
> +PREFERRED_VERSION_evieext ?= "1.1.1"
>   PREFERRED_VERSION_fixesproto ?= "4.1.2"
>   PREFERRED_VERSION_fontcacheproto ?= "0.1.3"
>   PREFERRED_VERSION_fontcacheproto-native ?= "0.1.3"
> diff --git a/meta/recipes-graphics/xorg-proto/evieext_1.1.0.bb b/meta/recipes-graphics/xorg-proto/evieext_1.1.1.bb
> similarity index 54%
> rename from meta/recipes-graphics/xorg-proto/evieext_1.1.0.bb
> rename to meta/recipes-graphics/xorg-proto/evieext_1.1.1.bb
> index 5800af1..271398d 100644
> --- a/meta/recipes-graphics/xorg-proto/evieext_1.1.0.bb
> +++ b/meta/recipes-graphics/xorg-proto/evieext_1.1.1.bb
> @@ -6,10 +6,10 @@ DESCRIPTION = "This package provides the wire protocol for the X Event \
>   Interception Extension.  This extension allows the interception of \
>   keyboard and mouse events."
>
> -PR = "r1"
> +PR = "r0"
>   PE = "1"
>
> -LIC_FILES_CHKSUM = "file://COPYING;md5=6cf85dc8217152304ac976db1e240ebe"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4db9fc6a58e873c6392eec53082d89b5"
>
Was there a change in the type of license?  Why did COPYING change?

Sau!
> -SRC_URI[md5sum] = "5c74f61d6f77b2e6a083b2b31000be42"
> -SRC_URI[sha256sum] = "47881a52a8d9da1e41e4f028ed32a8b44f738afbead819c0a07253fdc1641885"
> +SRC_URI[md5sum] = "98bd86a13686f65f0873070fdee6efc7"
> +SRC_URI[sha256sum] = "1cf74114436d99f56577a90b6438a32ba31b8128c9e63842bb179aba592733fe"



