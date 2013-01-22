Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TxmRE-000464-Sc
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 23:35:34 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jan 2013 14:19:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,516,1355126400"; d="scan'208";a="277167620"
Received: from unknown (HELO envy.home) ([10.255.15.29])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jan 2013 14:19:57 -0800
Message-ID: <50FF108C.50604@linux.intel.com>
Date: Tue, 22 Jan 2013 14:19:56 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1358634922.git.raj.khem@gmail.com>
	<613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
	<50FEFA22.2090008@linux.intel.com>
	<CAMKF1spq_du8mB2nAvqcYQG7izORFHTkZFTBhUCE3SrJZ3KU2Q@mail.gmail.com>
	<50FF099C.5080203@linux.intel.com>
	<CAMKF1soo9U1WiGG8S4uyP0V-k2wvHDOvWiX+RsEd6SiPRYH3wA@mail.gmail.com>
In-Reply-To: <CAMKF1soo9U1WiGG8S4uyP0V-k2wvHDOvWiX+RsEd6SiPRYH3wA@mail.gmail.com>
X-Enigmail-Version: 1.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
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
X-List-Received-Date: Tue, 22 Jan 2013 22:35:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 01/22/2013 02:12 PM, Khem Raj wrote:
> On Tue, Jan 22, 2013 at 1:50 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>> I assumed that would be the target eventually - is that not the case?
> 
> yes when we have tested it
> However, I don’t see any other better way of coping with the case where we
> would like to use gold as default linker distrowide. One could cook up
> a patch for kernel
> to demand ld.bfd always like I did for uboot but we have way too many kernels
> to patch. I am open for other suggestions.
> 

I don't object to the approach, I was just wanting to boost my
confidence level with testing results. Sounds like that's coming, and I
should probably do some runs myself.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


