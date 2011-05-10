Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJor8-0002O8-S0
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 17:28:15 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2011 08:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,346,1301900400"; 
   d="scan'208";a="360043"
Received: from unknown (HELO [10.255.12.75]) ([10.255.12.75])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2011 08:25:28 -0700
Message-ID: <4DC958E8.6060907@linux.intel.com>
Date: Tue, 10 May 2011 08:25:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1304670670.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1304670670.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 0/1] qemu-script: Fix qemu segfault with Nvidia's proprietary driver
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
X-List-Received-Date: Tue, 10 May 2011 15:28:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/06/2011 01:36 AM, Zhai Edwin wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> Previsous solution is only giving warnings as different distro has different
> path of mesa libGL. This patch try to use different path for different distro
> after looking at /etc/lsb-release per Raj's suggestion. Ubuntu is there, and
> other distro handling can be easily added.
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: gzhai/fix3
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix3
>
> Thanks,
>      Zhai Edwin<edwin.zhai@intel.com>
> ---
>
>
> Zhai Edwin (1):
>    qemu-script: Fix qemu seg fault if install Nvidia proprietary driver.
>
>   scripts/poky-qemu-internal |   13 +++++++++++--
>   1 files changed, 11 insertions(+), 2 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
Merged in oe-core and poky master

Thanks
	Sau!


