Return-Path: <california.l.sullivan@intel.com>
X-Greylist: delayed 979 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Dec 2017 18:37:29 UTC
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 6BDBB77F34
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 18:37:29 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Dec 2017 10:19:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,373,1508828400"; d="scan'208";a="182252516"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga005.jf.intel.com with ESMTP; 07 Dec 2017 10:19:11 -0800
To: openembedded-core@lists.openembedded.org
References: <20171121214703.11109-1-california.l.sullivan@intel.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <c787ba10-43f1-0e9b-e22f-192d19ff2f58@intel.com>
Date: Thu, 7 Dec 2017 10:19:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171121214703.11109-1-california.l.sullivan@intel.com>
Subject: Re: [PATCH 1/2] init-install: fix grub-install command
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
X-List-Received-Date: Thu, 07 Dec 2017 18:37:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Armin,

This is also suitable for Rocko. Please add it to your backport queue 
when you can.

Its in master here: 
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=0b8460e2ce9f9a4ea8de8497fbb65b91cb69b8e0

Thanks,
Cal

On 11/21/2017 01:47 PM, California Sullivan wrote:
> The grub_version variable was calling 'grub-install -v' (verbose) instead
> of 'grub-install -V' (version) causing unexpected failures.
>
> Fixes bug [YOCTO #12111].
>
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ---
>   meta/recipes-core/initrdscripts/files/init-install.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
> index 572613e..1cac806 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install.sh
> @@ -132,7 +132,7 @@ fi
>   
>   disk_size=$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
>   
> -grub_version=$(grub-install -v|sed 's/.* \([0-9]\).*/\1/')
> +grub_version=$(grub-install -V|sed 's/.* \([0-9]\).*/\1/')
>   
>   if [ $grub_version -eq 0 ] ; then
>       bios_boot_size=0


