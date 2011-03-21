Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1Q1W5C-0002qe-0F
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 04:47:06 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Mar 2011 20:44:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,217,1299484800"; d="scan'208";a="722240698"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2011 20:44:11 -0700
Message-ID: <4D86C98C.9060008@intel.com>
Date: Mon, 21 Mar 2011 11:44:12 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <71E89804-8B25-4810-95EE-C9B1880C0103@dominion.thruhere.net>
In-Reply-To: <71E89804-8B25-4810-95EE-C9B1880C0103@dominion.thruhere.net>
Subject: Re: Qemu-native requires alsa-libs-native
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
X-List-Received-Date: Mon, 21 Mar 2011 03:47:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen,
We enabled alsa in configure for the feature of receiving sound from 
guest. It is assumed that audio system on host is already enabled.

I'm not sure if we need add alsa native, given that they are host 
specific. Besides alsa, we also need sound card driver on host, which is 
beyond the scope of our build system.
Maybe, we can check alsa lib first, and enabled "--audio-drv-list=alsa" 
after finding it. Or we can document alsa as build prerequisite?


Koen Kooi wrote:
>
> Hi,
>
> While attempting to build the qemuarm machine in oe-core I get this:
>
> | + 
> /OE/tentacle/build/tmp-angstrom_2010_x/work/x86_64-linux/qemu-native-0.13.0-r1/qemu-0.13.0/configure 
> --prefix=/OE/tentacle/build/tmp-angstrom_2010_x/sysroots/x86_64-linux/usr 
> --target-list=arm-linux-user,arm-softmmu,i386-linux-user,i386-softmmu,x86_64-linux-user,x86_64-softmmu,mips-linux-user,mips-softmmu,ppc-linux-user,ppc-softmmu,mipsel-linux-user 
> --disable-werror --disable-vnc-tls --enable-kvm 
> --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370
>
> |
> | Error: alsa check failed
> | Make sure to have the alsa libs and headers installed.
>
> But there's not alsa-libs-native in OE-core. Should we add such a 
> recipe or disable also in qemu?
>
> That's with:
>
> OE Build Configuration:
> BB_VERSION        = "1.13.0"
> METADATA_BRANCH   = "master"
> METADATA_REVISION = "f0afe5827570eff5442d2f9a9846b4098e5c3333"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "qemuarm"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "v20110320-core"
> TARGET_FPU        = "soft"
>
>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


