Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QveJ8-0002C1-4i
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 01:53:30 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Aug 2011 16:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,266,1312182000"; 
   d="scan'208";a="9945290"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Aug 2011 16:48:44 -0700
Message-ID: <4E52EADB.1040409@linux.intel.com>
Date: Mon, 22 Aug 2011 16:48:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313571326.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1313571326.git.dongxiao.xu@intel.com>
Subject: Re: [PATCH 0/2][PULL] multilib: use ${BPN} in file names
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
X-List-Received-Date: Mon, 22 Aug 2011 23:53:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2011 01:57 AM, Dongxiao Xu wrote:
> Hi Richard,
>
> This pull request is to fix some file names in certain recipes,
> please help to review and pull.
>
> Thanks,
> Dongxiao
>
> The following changes since commit 13db5f420ca9bff98561f80d78958278734ad1f4:
>
>    distro-tracking: Update info for gpgme, libassuan, apr... after last upgrade. (2011-08-15 15:26:04 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dxu4/ml2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml2
>
> Dongxiao Xu (2):
>    busybox: Change ${PN} to ${BPN} in file names
>    sysvinit: Change ${PN} to ${BPN} in file names
>
>   meta/recipes-core/busybox/busybox.inc          |   30 +++++++-------
>   meta/recipes-core/busybox/busybox_1.18.4.bb    |    2 +-
>   meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb |   52 ++++++++++++------------
>   3 files changed, 42 insertions(+), 42 deletions(-)
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



