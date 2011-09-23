Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6xnn-0003cO-Ay
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 06:55:55 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 Sep 2011 21:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,427,1312182000"; d="scan'208";a="54408484"
Received: from unknown (HELO [10.255.15.16]) ([10.255.15.16])
	by azsmga001.ch.intel.com with ESMTP; 22 Sep 2011 21:50:33 -0700
Message-ID: <4E7C1019.3050606@linux.intel.com>
Date: Thu, 22 Sep 2011 21:50:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <ACACFD211CF4804FA46249D0B0281C8E03F665@IRSMSX101.ger.corp.intel.com>
In-Reply-To: <ACACFD211CF4804FA46249D0B0281C8E03F665@IRSMSX101.ger.corp.intel.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>
Subject: Re: [PATCH 1/1] populate_sdk_rpm: add pkgconfig(pkg-config) to the list
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
X-List-Received-Date: Fri, 23 Sep 2011 04:55:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/22/2011 08:32 PM, Purdie, Richard wrote:
> Unless this goyt mangled by this device it still looks to have whitespace problems.
>
Got mangled by cut & paste!

Fixed it in the branch

Sau!


> Richard
>
> ----- Original Message -----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Friday, September 23, 2011 03:35 AM
> To: openembedded-core@lists.openembedded.org<openembedded-core@lists.openembedded.org>
> Subject: [OE-core] [PATCH 1/1] populate_sdk_rpm: add pkgconfig(pkg-config)	to the list
>
> Signed-off-by: Saul Wold<sgw@linux.intel.com>
> ---
>   meta/classes/populate_sdk_rpm.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
> index e837f9e..b550427 100644
> --- a/meta/classes/populate_sdk_rpm.bbclass
> +++ b/meta/classes/populate_sdk_rpm.bbclass
> @@ -35,7 +35,7 @@ fakeroot populate_sdk_rpm () {
>   	export INSTALL_PACKAGES_NORMAL_RPM="${TOOLCHAIN_TARGET_TASK}"
>   	export INSTALL_PACKAGES_ATTEMPTONLY_RPM=""
>   	export INSTALL_PACKAGES_LINGUAS_RPM=""
> -	export INSTALL_PROVIDENAME_RPM="/bin/bash /usr/bin/env /usr/bin/perl pkgconfig"
> +	export INSTALL_PROVIDENAME_RPM="/bin/bash /usr/bin/env /usr/bin/perl pkgconfigpkgconfig(pkg-config)"
>   	export INSTALL_TASK_RPM="populate_sdk-target"
>
>   	# Setup base system configuration


