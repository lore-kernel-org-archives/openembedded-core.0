Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QIThi-000210-7A
	for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 00:40:58 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 May 2011 15:38:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,328,1301900400"; d="scan'208";a="919066239"
Received: from unknown (HELO [10.255.12.56]) ([10.255.12.56])
	by fmsmga001.fm.intel.com with ESMTP; 06 May 2011 15:38:15 -0700
Message-ID: <4DC47857.8050809@linux.intel.com>
Date: Fri, 06 May 2011 15:38:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Nitin A Kamble <nitin.a.kamble@intel.com>
References: <cover.1303776892.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1303776892.git.nitin.a.kamble@intel.com>
Cc: openembedded-core@lists.openembedded.org, poky@yoctoproject.org
Subject: Re: [poky] [PATCH 0/2] GPLv2 tar & cpio recipe fixes
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
X-List-Received-Date: Fri, 06 May 2011 22:40:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/25/2011 05:19 PM, Nitin A Kamble wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> Acked by Scott Garman, who is maintainer of GPLv3 tar&  cpio recipes.
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: nitin/misc
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc
>
> Thanks,
>      Nitin A Kamble<nitin.a.kamble@intel.com>
> ---
>
>
> Nitin A Kamble (2):
>    tar-1.17 (GPLv2) bugfix
>    cpio-2.8 (GPLv2) bug fix
>
>   .../cpio/cpio-2.8/avoid_heap_overflow.patch        |   25 ++++++++++++++++++++
>   meta/recipes-extended/cpio/cpio_2.8.bb             |    6 +++-
>   .../tar/tar-1.17/avoid_heap_overflow.patch         |   22 +++++++++++++++++
>   meta/recipes-extended/tar/tar_1.17.bb              |    3 +-
>   4 files changed, 53 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch
>   create mode 100644 meta/recipes-extended/tar/tar-1.17/avoid_heap_overflow.patch
>

Pulled into Master

Thanks
	Sau!


