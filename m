Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1Vms-0001e5-Kj
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 06:00:26 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Sep 2011 20:55:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,348,1312182000"; d="scan'208";a="15066237"
Received: from unknown (HELO [10.255.14.148]) ([10.255.14.148])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Sep 2011 20:55:22 -0700
Message-ID: <4E683CAA.6080609@linux.intel.com>
Date: Wed, 07 Sep 2011 20:55:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110816 Thunderbird/6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1315426812.4368.1.camel@lenovo.internal.reciva.com>
In-Reply-To: <1315426812.4368.1.camel@lenovo.internal.reciva.com>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] useradd.bbclass: use correct value for $D in postinst functions
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
X-List-Received-Date: Thu, 08 Sep 2011 04:00:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2011 01:20 PM, Phil Blundell wrote:
> This corrects the location of the password file used during package installation.
>
> See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/009183.html and subsequent discussion.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/classes/useradd.bbclass |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index 5f5b68d..1e03a04 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -15,8 +15,8 @@ SYSROOT=""
>
>   if test "x$D" != "x"; then
>   	# Installing into a sysroot
> -	SYSROOT="${STAGING_DIR_TARGET}"
> -	OPT="--root ${STAGING_DIR_TARGET}"
> +	SYSROOT="$D"
> +	OPT="--root $D"
>
>   	# Add groups and users defined for all recipe packages
>   	GROUPADD_PARAM="${@get_all_cmd_params(d, 'group')}"
> @@ -79,7 +79,7 @@ useradd_sysroot () {
>
>   	# Explicitly set $D since it isn't set to anything
>   	# before do_install
> -	D=${D}
> +	D=${STAGING_DIR_TARGET}
>   	useradd_preinst
>   }
>

Merged into OE-Core

Thanks
	Sau!


