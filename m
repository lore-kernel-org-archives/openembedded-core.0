Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Td3r0-0006uy-Fj
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 19:56:26 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Nov 2012 10:42:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,321,1352102400"; d="scan'208";a="172754724"
Received: from unknown (HELO envy.home) ([10.255.13.41])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Nov 2012 10:42:12 -0800
Message-ID: <50B3B804.70003@linux.intel.com>
Date: Mon, 26 Nov 2012 10:42:12 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1353941677.21863.59.camel@ted>
In-Reply-To: <1353941677.21863.59.camel@ted>
X-Enigmail-Version: 1.4.6
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Change build output message to list BUILD_SYS, TARGET_SYS and NATIVELSBSTRING
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
X-List-Received-Date: Mon, 26 Nov 2012 18:56:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/2012 06:54 AM, Richard Purdie wrote:
> The build summary is meant to reflect key configuration variables. Information
> about the build system we're running on is important but currently missing
> from the information displayed.
> 
> Printing TARGET_SYS removes the need to print TARGET_OS and TARGET_ARCH
> and we add BUILD_SYS and NATIVELSBSTRING to show information about the
> build system.
> 
> [YOCTO #3456]
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Tested-by: Darren Hart <dvhart@linux.intel.com>


Fedora 17 amd64 host:
Build Configuration:
BB_VERSION        = "1.17.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Fedora-17"
TARGET_SYS        = "i586-poky-linux"
MACHINE           = "qemux86"
DISTRO            = "poky"
DISTRO_VERSION    = "1.3+snapshot-20121126"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta
meta-yocto
meta-yocto-bsp
meta-yocto
meta-yocto-bsp
meta              = "master:7eb5d130ad451c105f4349bd94164cff58e88040"


Looks good to me.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


