Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHd8V-0006Xv-Ky
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 17:37:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 08:28:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="127352491"
Received: from unknown (HELO [10.255.12.159]) ([10.255.12.159])
	by orsmga001.jf.intel.com with ESMTP; 10 Apr 2012 08:28:20 -0700
Message-ID: <4F845194.1030008@linux.intel.com>
Date: Tue, 10 Apr 2012 08:28:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333957247.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1333957247.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 0/1] opkg: Add the condition for the content of arch.conf when enable multilib
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
X-List-Received-Date: Tue, 10 Apr 2012 15:37:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2012 12:48 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> After successfully installed some lib32 multilib packages into the
> x86-64 image, we just found that the file content of /var/lib/opkg/status in
> rootfs changed after the very 1st boot, many lib32 related packages information
> are missing in that file.
>
> The missing arch "x86" in arch.conf cause the above problem. Adding the
> condition for the content of arch.conf when enable multilib. If build
> multilib image, "ALL_MULTILIB_PACKAGE_ARCHS" will be used instead of
> "PACKAGE_ARCHS".
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: xiaofeng/multilib
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/multilib
>
> Thanks,
>      Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>
>
> Xiaofeng Yan (1):
>    opkg: Add the condition for the content of arch.conf when enable
>      multilib
>
>   meta/recipes-devtools/opkg/opkg-config-base_1.0.bb |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


Merged into OE-Core

Thanks
	Sau!


