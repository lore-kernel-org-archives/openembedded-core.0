Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCYSG-0006O8-De
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 18:09:21 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Sep 2012 08:56:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,423,1344236400"; d="scan'208";a="222106537"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by fmsmga002.fm.intel.com with ESMTP; 14 Sep 2012 08:56:41 -0700
Message-ID: <505353B8.3030300@linux.intel.com>
Date: Fri, 14 Sep 2012 08:56:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1347564407.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1347564407.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] linux-yocto: consolidated update
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
X-List-Received-Date: Fri, 14 Sep 2012 16:09:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2012 12:34 PM, Bruce Ashfield wrote:
> Richard/Saul,
>
> A small ``consolidated'' update this time. Two fixes, one to the build/tools,
> one meta branch update for KVM guests.
>
> The tools fix is something that I've been wanting to get to for a month
> now .. and I finally did. Matthew Foster reported the strange messages
> when working with linux-yocto-custom. It is now fixed, and no more nasty
> looking messages. The details of the messages and fix are in the patch.
>
> The second meta/config patch is to embed some fragments for use by a
> KVM guest. These will be used by other updates to the tools/scripts
> to follow.
>
> Cheers,
>
> Bruce
>
>
> The following changes since commit 7401ed019196313a7ae7cab0b9f3820356cfee29:
>
>    Update to upstream_tracking.inc (2012-09-12 17:56:58 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (2):
>    kernel-yocto: fix kernel configuration audit for custom yocto kernels
>    linux-yocto: virtio and KVM guest configuration
>
>   meta/classes/kernel-yocto.bbclass                  |    7 ++++++-
>   .../kern-tools/kern-tools-native_git.bb            |    2 +-
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    2 +-
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb       |    2 +-
>   4 files changed, 9 insertions(+), 4 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



