Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TwFpY-0006dx-Dr
	for Openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 18:34:45 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jan 2013 09:18:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,493,1355126400"; d="scan'208";a="275559892"
Received: from unknown (HELO [10.255.15.56]) ([10.255.15.56])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2013 09:18:49 -0800
Message-ID: <50F983F9.4020708@linux.intel.com>
Date: Fri, 18 Jan 2013 09:18:49 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: nitin.a.kamble@intel.com
References: <cover.1358365495.git.nitin.a.kamble@intel.com>
	<9ab00cdffdd81cbdcd68ac03aafd925372f25ad7.1358365495.git.nitin.a.kamble@intel.com>
In-Reply-To: <9ab00cdffdd81cbdcd68ac03aafd925372f25ad7.1358365495.git.nitin.a.kamble@intel.com>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] linux-yocto_3.4: use ${KSRC_linux_yocto_3_4_repo} based SRC_URI
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
X-List-Received-Date: Fri, 18 Jan 2013 17:34:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/16/2013 11:46 AM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> This makes replacing kernel git repository easy.
> For example you can add the following line in your local.conf to use your
> own local kernel repository:
>
> KSRC_linux_yocto_3_4_repo = "/home/nitin/linux-yocto-3.4.git/;protocol=file"
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> index 70ed967..92129b6 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> @@ -11,7 +11,8 @@ SRCREV_machine_qemux86-64 ?= "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
>   SRCREV_machine ?= "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
>   SRCREV_meta ?= "7e0cd2990798aae80565baa17d3b6c771874f284"
>
> -SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},${KMETA};name=machine,meta"
> +KSRC_linux_yocto_3_4_repo ?= "git.yoctoproject.org/linux-yocto-3.4.git;protocol=git"
> +SRC_URI = "git://${KSRC_linux_yocto_3_4_repo};nocheckout=1;branch=${KBRANCH},${KMETA};name=machine,meta"
>

Nitin,

Can't the same be accomplished by setting SRC_URI-yocto-linux in your 
local.conf file:

> SRC_URI_linux-yocto = "/home/nitin/linux-yocto-3.4.git/;protocol=file
;nocheckout=1;branch=${KBRANCH},${KMETA};name=machine,meta"

Yes, it might require a little cut paste of the nocheck... part.

Sau!



>   LINUX_VERSION ?= "3.4.24"
>
>


