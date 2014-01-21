Return-Path: <dvhart@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 7EEA660CEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 23:55:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 21 Jan 2014 15:55:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="462540967"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.24.1.180]) ([10.24.1.180])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jan 2014 15:55:54 -0800
Message-ID: <1390348553.13672.22.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2014 15:55:53 -0800
In-Reply-To: <cover.1390342768.git.dvhart@linux.intel.com>
References: <cover.1390342768.git.dvhart@linux.intel.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Richard Purdie <richard.purdie@intel.com>, Poky <poky@yoctoproject.org>,
	Paul Eggleton <paul.eggleton@intel.com>
Subject: Re: [PATCH 00/15] Update x86 tune files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jan 2014 23:55:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-01-21 at 14:40 -0800, Darren Hart wrote:
> All,
> 
> The following lays the groundwork for some rethinking of support for x86
> platforms. In particular, the meta-intel layer will undergo some major
> refactoring once this is merged. We believe it is of value to keep as much
> of the tune files available in oe-core as possible, rather than isolating
> them all in meta-intel.
> 
> This series renames the x86-related tune files, documents best practices,
> updates the core2 tune file, adds a corei7 tune file, and updates the dependent
> machine configs. This spans oe-core and poky and I feel is best viewed as a
> whole. Please forgive the cross-post.
> 
> The new corei7 tune file applies to Nehalem and Silvermont (Bay Trail) CPUs
> which support up to SSE4.2. This provides an appropriate demarcation line while
> maximizing compatibility as well as including optimal support for the current
> generation of the embedded CPUs (Bay Trail) by including it in the new tune. AVX
> (Sandy Bridge and beyond) is not included as that would not apply to Bay Trail,
> although it can easily be added in a corei7-avx tune file as an additional
> patch for users who care more about the last few percent of performance over
> compatibility and consolidation.
> 
> An important note and likely a point of contention: The core2 update changes the
> core2 arch to core2-32, making the 32 bit explicit rather than implied in order
> to provide a consistent naming scheme going forward with newer tunes where
> 64 bit would be logical assumption if not explicitly stated. See patch 5/15 for
> details on this bit.
> 
> Finally, update the machines dependent on these tune files to use the new names.
> As we remove x86_64, the 64b x86 machines now build as core2-64 for maximum
> compatibility.


I missed a couple things I'm getting to now:

* the yocto-bsp substrates
* the inclusion of XSERVER_IA32_* in the genericx86 BSPs
* the eglibc-ld.inc file .... I need some help here, but am 
  updating the core2 references and adding corei7... do we 
  really have to do this for every tune file!?!?
* profile-manual core2 references

Coming in v2

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



