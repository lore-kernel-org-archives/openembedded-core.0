Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UYSge-0000bQ-Sd
	for openembedded-core@lists.openembedded.org;
	Sat, 04 May 2013 04:59:02 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 May 2013 19:41:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,607,1363158000"; d="scan'208";a="328561198"
Received: from unknown (HELO envy2.home) ([10.255.12.120])
	by fmsmga001.fm.intel.com with ESMTP; 03 May 2013 19:41:03 -0700
Message-ID: <5184753F.9010904@linux.intel.com>
Date: Fri, 03 May 2013 19:41:03 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1367622401-28624-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1367622401-28624-1-git-send-email-sgw@linux.intel.com>
X-Enigmail-Version: 1.5.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dmidecode: fix fetch path to use BP
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
X-List-Received-Date: Sat, 04 May 2013 02:59:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/03/2013 04:06 PM, Saul Wold wrote:
> This is so the multilib prefix is not used

Thanks for catching that Saul. How do we know when to use P and when to
use BP? Where should this be documented? Maybe in the dev manual for
writing new recipes?

--
Darren


> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-devtools/dmidecode/dmidecode_2.12.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
> index bdddf30..000d2cd 100644
> --- a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
> +++ b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
>  PR = "r0"
>  
> -SRC_URI = "http://savannah.nongnu.org/download/dmidecode/${P}.tar.bz2"
> +SRC_URI = "http://savannah.nongnu.org/download/dmidecode/${BP}.tar.bz2"
>  
>  COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
>  
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


