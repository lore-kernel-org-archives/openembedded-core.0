Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7c5Z-0006T5-N5
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 01:29:13 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Mar 2012 17:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77183729"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Mar 2012 17:20:27 -0700
Message-ID: <4F5FE44B.5080309@linux.intel.com>
Date: Tue, 13 Mar 2012 17:20:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331666080-25116-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1331666080-25116-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] initscripts: test whether /etc/init.d/hwclock.sh exists
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
X-List-Received-Date: Wed, 14 Mar 2012 00:29:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2012 12:14 PM, Andreas Oberritter wrote:
> * bootmisc.sh executes /etc/init.d/hwclock.sh, which
>    is optional (depends on CONFIG_HWCLOCK in busybox).
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   .../initscripts/initscripts-1.0/bootmisc.sh        |    4 ++--
>   meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> index 5b86e79..4f76cb4 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> @@ -65,14 +65,14 @@ fi
>   # Set the system clock from hardware clock
>   # If the timestamp is more recent than the current time,
>   # use the timestamp instead.
> -/etc/init.d/hwclock.sh start
> +test -x /etc/init.d/hwclock.sh&&  /etc/init.d/hwclock.sh start
>   if test -e /etc/timestamp
>   then
>   	SYSTEMDATE=`date -u +%4Y%2m%2d%2H%2M`
>   	read TIMESTAMP<  /etc/timestamp
>   	if [ ${TIMESTAMP} -gt $SYSTEMDATE ]; then
>   		date -u ${TIMESTAMP#????}${TIMESTAMP%????????}
> -		/etc/init.d/hwclock.sh stop
> +		test -x /etc/init.d/hwclock.sh&&  /etc/init.d/hwclock.sh stop
>   	fi
>   fi
>   : exit 0
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index f3dc852..829694b 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
>   SECTION = "base"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> -PR = "r133"
> +PR = "r134"
>
>   INHIBIT_DEFAULT_DEPS = "1"
>

Merged into OE-Core

Thanks
	Sau!


