Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpRzm-00019L-AQ
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 23:31:54 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Aug 2011 14:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,325,1309762800"; 
   d="scan'208";a="4569490"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Aug 2011 14:27:28 -0700
Message-ID: <4E3C603F.6070100@linux.intel.com>
Date: Fri, 05 Aug 2011 14:27:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1312437938-29860-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1312437938-29860-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH] prelink: Add lib64 dirs to prelink.conf
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
X-List-Received-Date: Fri, 05 Aug 2011 21:31:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2011 11:05 PM, Kumar Gala wrote:
> Handle multlib or cases that baselib is lib64.
>
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
>   meta/recipes-devtools/prelink/prelink/prelink.conf |    8 ++++----
>   meta/recipes-devtools/prelink/prelink_git.bb       |    2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-devtools/prelink/prelink/prelink.conf b/meta/recipes-devtools/prelink/prelink/prelink.conf
> index c5a4f4a..ed30c28 100644
> --- a/meta/recipes-devtools/prelink/prelink/prelink.conf
> +++ b/meta/recipes-devtools/prelink/prelink/prelink.conf
> @@ -12,7 +12,7 @@
>   -l /usr/bin
>   -l /usr/X11R6/bin
>   -l /usr/games
> --l /usr/local/lib
> --l /lib
> --l /usr/lib
> --l /usr/X11R6/lib
> +-l /usr/local/lib{,64}
> +-l /lib{,64}
> +-l /usr/lib{,64}
> +-l /usr/X11R6/lib{,64}
> diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
> index c653d4d..bb95da7 100644
> --- a/meta/recipes-devtools/prelink/prelink_git.bb
> +++ b/meta/recipes-devtools/prelink/prelink_git.bb
> @@ -10,7 +10,7 @@ LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
>   SRCREV = "ac461e73b17253a4da25c5aafeac7193b553156c"
>   PV = "1.0+git${SRCPV}"
> -PR = "r4"
> +PR = "r5"
>
>   #
>   # The cron script attempts to re-prelink the system daily -- on

Merged into OE-Core

Thanks
	Sau!



