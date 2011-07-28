Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QmJqf-0006wX-GC
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 08:13:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jul 2011 23:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,280,1309762800"; d="scan'208";a="33167564"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2011 23:09:17 -0700
Message-ID: <4E30FD0C.7040503@linux.intel.com>
Date: Wed, 27 Jul 2011 23:09:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>	<969FA904-0086-42FA-B605-07B74FB728B4@kernel.crashing.org>	<1311688752.2344.238.camel@rex>	<627CF4AB-F07D-4285-B31C-3C5631270420@kernel.crashing.org>	<1311697113.2344.268.camel@rex>	<7B0836D8-31B6-407E-848E-FED9C5BFE78A@kernel.crashing.org>	<1311720776.2344.319.camel@rex>	<9A300C7A-E352-4566-AB92-88DF3CF743D7@kernel.crashing.org>	<1311755778.2344.325.camel@rex>	<704B147D-6F12-4534-9C34-01AE69290717@dominion.thruhere.net>	<1311759058.2344.344.camel@rex>
	<CCDC209E-514C-425B-A60E-EC7D704E244A@kernel.crashing.org>
In-Reply-To: <CCDC209E-514C-425B-A60E-EC7D704E244A@kernel.crashing.org>
Subject: Re: Add basic PowerPC core tune config (bug?)
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
X-List-Received-Date: Thu, 28 Jul 2011 06:13:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/27/2011 10:25 PM, Kumar Gala wrote:
> For some reason when I get to do_rootfs for core-image-sato when using rpms I run into an issue in that:
>
> ${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}
>
> Isn't expanding or taking the assignment in meta/conf/machine/include/tune-ppcFOO.inc but just using what it found in meta/conf/bitbake.conf
>
> the tune-ppcFOO.inc looks like:
>
> DEFAULTTUNE ?= "ppce5500"
>
> require conf/machine/include/powerpc/arch-powerpc64.inc
>
> TUNEVALID[ppce5500] = "Enable ppce5500 specific processor optimizations"
> TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "-mcpu=e5500", "", d)}"
> TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "ppce5500", "", d)}"
>
> AVAILTUNES += "ppce5500"
> TUNE_FEATURES_tune-ppce5500 = "m64 hard-fpu ppce5500"
> PACKAGE_EXTRA_ARCHS_tune-ppce5500 = "powerpc64 ppce5500"
>
> any ideas?
>
I believe that I am seeing this also with an atom-pc build, where the 
PACKAGE_EXTRA_ARCHS seems OK, but ends up just being i586 instead of a 
list of ARCHS that includes core2 (which atom-pc should be).

I am looking into this issue.

Sau!

> - k
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


