Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TJEGS-00089j-UW
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 04:00:45 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Oct 2012 18:47:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,525,1344236400"; d="scan'208";a="229824135"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by fmsmga002.fm.intel.com with ESMTP; 02 Oct 2012 18:47:44 -0700
Message-ID: <506B9940.5080605@linux.intel.com>
Date: Tue, 02 Oct 2012 18:47:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1349108459-16408-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1349108459-16408-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpcap: add dependency on libnl
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
X-List-Received-Date: Wed, 03 Oct 2012 02:00:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2012 09:20 AM, Ross Burton wrote:
> libpcap uses libnl on Linux to support sniffing mac80211 devices, which could be
> useful.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-connectivity/libpcap/libpcap.inc |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
> index 7d4e841..5381ef0 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap.inc
> +++ b/meta/recipes-connectivity/libpcap/libpcap.inc
> @@ -8,12 +8,12 @@ SECTION = "libs/network"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867 \
>                       file://pcap.h;beginline=1;endline=34;md5=8d6cf7e17d5745010d633e30bc529ea9"
> -DEPENDS = "flex-native bison-native"
> +DEPENDS = "flex-native bison-native libnl"
>
>   PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
>   PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,bluez4"
>
> -INC_PR = "r2"
> +INC_PR = "r3"
>
>   SRC_URI = "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz"
>
>
Merged into OE-Core

Thanks
	Sau!



