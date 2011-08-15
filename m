Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qt0iG-0007k7-S0
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 19:12:33 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Aug 2011 10:07:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,375,1309762800"; d="scan'208";a="41638600"
Received: from unknown (HELO [10.255.14.242]) ([10.255.14.242])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2011 10:07:55 -0700
Message-ID: <4E49526B.5080003@linux.intel.com>
Date: Mon, 15 Aug 2011 10:07:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1313164851.6733.166.camel@phil-desktop>
In-Reply-To: <1313164851.6733.166.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: default-distrovars: add x11 to default DISTRO_FEATURES
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
X-List-Received-Date: Mon, 15 Aug 2011 17:12:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2011 09:00 AM, Phil Blundell wrote:
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/conf/distro/include/default-distrovars.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index 2ef25e4..ce51c2c 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -16,7 +16,7 @@ DISTRO_FEATURES_LIBC ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-
>   					libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams libc-sunrpc \
>   					libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
>   					libc-posix-wchar-io"
> -DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g ${DISTRO_FEATURES_LIBC}"
> +DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g x11 ${DISTRO_FEATURES_LIBC}"
>
>   IMAGE_FEATURES ?= ""
>

Merged into OE-Core

Thanks
	Sau!


