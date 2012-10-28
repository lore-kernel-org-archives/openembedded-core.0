Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TSHg8-0006Gd-3J
	for openembedded-core@lists.openembedded.org;
	Sun, 28 Oct 2012 02:28:40 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Oct 2012 18:14:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,663,1344236400"; d="scan'208";a="212008646"
Received: from unknown (HELO [10.255.14.47]) ([10.255.14.47])
	by orsmga001.jf.intel.com with ESMTP; 27 Oct 2012 18:15:06 -0700
Message-ID: <508C871A.3020806@linux.intel.com>
Date: Sat, 27 Oct 2012 18:15:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1350918262.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1350918262.git.mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Implement multilib SDK support
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
X-List-Received-Date: Sun, 28 Oct 2012 01:28:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/2012 08:20 AM, Mark Hatle wrote:
> The attached patch set implements multilib SDK support.  This means that
> when generating an SDK (either by a traditional SDK recipe or the
> do_populate_sdk task), that support infrastructure for each multilib
> will be included in the SDK.
>
> Note, this code does -not- change the toolchain.  If the generated toolchain
> does not work properly with the multilib configuration, that will need to
> be a seperate fix!
>
> This was tested with both the oe-core and our custom Wind River toolchain.
> Generation passed on the oe-core SDK, but the functionality of the toolchain
> was not tested.  The Wind River toolchain did get properly generated and
> functioned as expected.
>
> Note:  The 0003 patch that affects processing the environment file was
> agreed to with the other author of the function.
>
> The following changes since commit 06d27cf0fbcc4004e6f456880eca49893c9290bf:
>
>    xorg: remove XF86 BigFont extension (2012-10-22 14:57:26 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib mhatle/sdk
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/sdk
>
> Mark Hatle (4):
>    multilib: Add support for cross-canadian multilib packages
>    multilib - crosssdk: Stop building multilib for crosssdk packages
>    populate_sdk_base: Update extraction script for multilibs
>    populate_sdk_base: Ensure that the multilib cross-canadian tools are
>      used
>
>   meta/classes/base.bbclass              |   43 +++++++++++++++++++++++++++++---
>   meta/classes/multilib.bbclass          |   20 +++++++++++---
>   meta/classes/populate_sdk_base.bbclass |    7 +++--
>   meta/lib/oe/classextend.py             |    4 +-
>   4 files changed, 60 insertions(+), 14 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



