Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnFuj-0007Hm-US
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 21:45:54 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Jan 2012 12:38:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="99696163"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga002.jf.intel.com with ESMTP; 17 Jan 2012 12:38:15 -0800
Message-ID: <4F15DC37.8010909@linux.intel.com>
Date: Tue, 17 Jan 2012 12:38:15 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326372828.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1326372828.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 0/1] Fix libGL path in 64b Ubuntu 11.10
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
X-List-Received-Date: Tue, 17 Jan 2012 20:45:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2012 04:57 AM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
>> From 11.10, 64b Ubuntu has a new path for libGL.so. This patch fix it.
> Thanks,
> Edwin
>
> The following changes since commit 19241e7e2d88406c57613180dec9e7896c6674cc:
>
>    distro-tracking: Update info for webkit-gtk, web-webkit (2012-01-11 11:01:32 +0800)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib gzhai/master2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2
>
> Zhai Edwin (1):
>    runqemu: Fix the wrong path of libGL.so in 64b Ubuntu 11.10
>
>   scripts/runqemu-internal |   11 ++++++++++-
>   1 files changed, 10 insertions(+), 1 deletions(-)
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


