Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1Vcd-00012i-Pa
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 05:49:52 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Sep 2011 20:44:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,348,1312182000"; d="scan'208";a="46631661"
Received: from unknown (HELO [10.255.14.148]) ([10.255.14.148])
	by azsmga001.ch.intel.com with ESMTP; 07 Sep 2011 20:44:47 -0700
Message-ID: <4E683A2F.7050302@linux.intel.com>
Date: Wed, 07 Sep 2011 20:44:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110816 Thunderbird/6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1315276240.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1315276240.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 0/2] Fixes for X and site/x86_64
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
X-List-Received-Date: Thu, 08 Sep 2011 03:49:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/2011 07:36 PM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> All,
>      These are some fixes. One is for enabling some HID device for rootless X,
> another is for grub conf error on x86_64. Pls. help to review.
>
> Thanks,
> Edwin
>
> The following changes since commit 314131e472a7d728ea96cbd577d2947d7bc9f50e:
>
>    linux-yocto: clean configuration for v3.0.4 (2011-09-05 20:25:46 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib gzhai/master2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2
>
> Zhai Edwin (2):
>    xserver-nodm-init: Change hidraw mode to allow normal user access
>    site/x86_64: Add entries to fix conf error on x86_64
>
>   .../x11-common/xserver-nodm-init/xserver-nodm      |    4 ++++
>   meta/site/x86_64-linux                             |   10 ++++++++++
>   2 files changed, 14 insertions(+), 0 deletions(-)
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


