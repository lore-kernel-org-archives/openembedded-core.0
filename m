Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SmqGo-00051S-RJ
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 19:55:15 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Jul 2012 10:44:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="167454417"
Received: from unknown (HELO [10.255.12.176]) ([10.255.12.176])
	by orsmga002.jf.intel.com with ESMTP; 05 Jul 2012 10:44:09 -0700
Message-ID: <4FF5D268.4080501@linux.intel.com>
Date: Thu, 05 Jul 2012 10:44:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341327589.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1341327589.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com
Subject: Re: [PATCH 0/4] linux-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 05 Jul 2012 17:55:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2012 08:14 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Here's a collection of updates and fixes from the past week.
> Built and boot tested here.
>
> There's only one that may be slightly interesting, that's my
> addition of the qemumipsel as a machine mapping. You may or may
> not want this change, but the kernel meta data change was
> trivial and should have been done a while ago, so that part I'll
> keep even if you don't want the branch mapping.
>
> The routine updates are:
>
>    - configuration audit updates
>    - 3.4.4 -stable update
>    - -rt refresh to 3.4.4-rt-13
>
> I also fixed linux-yocto-tiny to have kernel configuration
> audit reports again, there was a missing KMETA mapping in the
> recipe. There's some output from the audit that we need to look
> into, but that will be dealt with separately.
>
> I've built and booted this on every qemu target I could get
> my hands on .. but the matrix is increasing with multiple
> variants, kernel versions and recipes :)
>
> cc: Darren Hart <dvhart@linux.intel.com>
>
> Cheers,
>
> Bruce
>
> The following changes since commit 644ad4bf1e30fcee4b9d5abb819046d1f2193d27:
>
>    documentation/bsp-guide/bsp.xml: Yocto term paring (2012-07-02 16:47:45 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (4):
>    linux-yocto/3.4: add qemumipsel machine mapping
>    linux-yocto/3.4: v3.4.4 + configuration updates
>    linux-yocto/3.4: update preempt-rt to 3.4.4-rt13
>    linux-yocto-tiny: add KMETA specification
>
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    2 ++
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   17 +++++++++--------
>   3 files changed, 15 insertions(+), 12 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


