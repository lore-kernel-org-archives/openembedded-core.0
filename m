Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TL4LR-0002oz-Lh
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 05:49:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Oct 2012 20:36:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,549,1344236400"; d="scan'208";a="231819829"
Received: from unknown (HELO envy.home) ([10.255.14.4])
	by fmsmga002.fm.intel.com with ESMTP; 07 Oct 2012 20:36:22 -0700
Message-ID: <50724A08.7050500@linux.intel.com>
Date: Sun, 07 Oct 2012 20:35:36 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Poky <poky@yoctoproject.org>, 
 openembedded-core@lists.openembedded.org
References: <cover.1349479383.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1349479383.git.dvhart@linux.intel.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [poky] [PATCH 0/2] Update poky-tiny to linux-yocto-tiny_3.4 for qemux86
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
X-List-Received-Date: Mon, 08 Oct 2012 03:49:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 10/05/2012 04:31 PM, Darren Hart wrote:
> As these patches are dependent on eachother, sending to both poky and oe-core
> lists. Flame away.
> 
> The refresh to 3.4 for tiny is coming in rather late as I was focused on other
> BSPs. However, qemux86 has been at 3.4 for poky and linux-yocto for a while now.
> This update effectively uses a subset of that tested config for the images built
> with poky-tiny. This only impacts qemux86 on poky-tiny.  That configuration
> builds and boots to the serial console.
> 
> NOTE: This kernel recipe is pending a minor meta-data change to the
> linux-yocto_3.4 git repository which will require a SRCREV_meta update. That
> update can be made to only the linux-yocto-tiny_3.4 recipe in order to minimize
> risk to the rest of the system. However, please do not commit this until the
> meta-data patch goes in. At that point I will update the branch with the new
> SRCREV and notify the list in response to this email.

The necessary changes have been committed to linux-yocto-3.4.git. I have
updated the branch with the appropriate SRCREV_meta for
linux-yocto-tiny_3.4.bb. These patches are ready to pull.


> The following changes since commit 415be864abdbd6f86e554aba684f5d7a9499e2e7:
> 
>   sstate: Add extra entries to the sstate duplicate files whitelist (2012-10-05 16:18:26 +0100)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/poky-contrib dvhart/1.3/tiny
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dvhart/1.3/tiny
> 
> Darren Hart (2):
>   linux-yocto-tiny: Add tiny recipe for the 3.4 linux-yocto kernel
>   poky-tiny: Update the default kernel to linux-yocto-tiny_3.4
> 
>  meta-yocto/conf/distro/poky-tiny.conf             |    2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |   26 +++++++++++++++++++++
>  2 files changed, 27 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb


Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


