Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RSawU-0000M5-7Q
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 21:58:18 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Nov 2011 12:51:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="78508067"
Received: from srifenb-mobl.amr.corp.intel.com (HELO envy.home)
	([10.7.199.145])
	by orsmga002.jf.intel.com with ESMTP; 21 Nov 2011 12:51:47 -0800
Message-ID: <4ECAB9E5.2000608@linux.intel.com>
Date: Mon, 21 Nov 2011 12:51:49 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321902595.git.nitin.a.kamble@intel.com>
	<42da19b90f85ae6e3d8e324a7e877c89bb61dd66.1321902595.git.nitin.a.kamble@intel.com>
In-Reply-To: <42da19b90f85ae6e3d8e324a7e877c89bb61dd66.1321902595.git.nitin.a.kamble@intel.com>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH 1/1] netbase.bbappend: sync up with oecore/yocto layer
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
X-List-Received-Date: Mon, 21 Nov 2011 20:58:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Nitin,

Please provide a complete change log with patches. Even for simple
patches the commit log needs to indicate why the change is needed and
how the issue is addresses. For something like this, just mentioning the
list of updates is probably adequate.

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Headers_and_Commit_Messages

Thanks,

Darren

On 11/21/2011 11:11 AM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  .../beagleboard/interfaces                         |    0
>  ...netbase_4.46.bbappend => netbase_4.47.bbappend} |    0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-yocto/recipes-core/netbase/{netbase-4.46 => netbase-4.47}/beagleboard/interfaces (100%)
>  rename meta-yocto/recipes-core/netbase/{netbase_4.46.bbappend => netbase_4.47.bbappend} (100%)
> 
> diff --git a/meta-yocto/recipes-core/netbase/netbase-4.46/beagleboard/interfaces b/meta-yocto/recipes-core/netbase/netbase-4.47/beagleboard/interfaces
> similarity index 100%
> rename from meta-yocto/recipes-core/netbase/netbase-4.46/beagleboard/interfaces
> rename to meta-yocto/recipes-core/netbase/netbase-4.47/beagleboard/interfaces
> diff --git a/meta-yocto/recipes-core/netbase/netbase_4.46.bbappend b/meta-yocto/recipes-core/netbase/netbase_4.47.bbappend
> similarity index 100%
> rename from meta-yocto/recipes-core/netbase/netbase_4.46.bbappend
> rename to meta-yocto/recipes-core/netbase/netbase_4.47.bbappend

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


