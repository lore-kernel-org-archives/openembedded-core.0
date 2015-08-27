Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F1E6C60043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 14:28:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 27 Aug 2015 07:28:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="633322675"
Received: from djcarton-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.50])
	by orsmga003.jf.intel.com with ESMTP; 27 Aug 2015 07:28:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Patrick Ohly <patrick.ohly@intel.com>
Date: Thu, 27 Aug 2015 15:28:29 +0100
Message-ID: <4504524.Woi8pdWB6k@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1440681597.3006.35.camel@intel.com>
References: <cover.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<1440681597.3006.35.camel@intel.com>
MIME-Version: 1.0
Cc: leonardo.sandoval.gonzalez@intel.com
Subject: Re: [PATCH V3 0/3] Add UEFI firmware for qemux86*
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
X-List-Received-Date: Thu, 27 Aug 2015 14:28:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 27 August 2015 15:19:57 Patrick Ohly wrote:
> On Tue, 2015-07-14 at 20:07 +0000,
> 
> leonardo.sandoval.gonzalez@linux.intel.com wrote:
> > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> > 
> > These patches include:
> >     1. iasl recipe taken from luv-yocto repository into OE-Core (the only
> >     
> >        change done was the LICENSE, from Intel-ACPI to BSD | GPLv2)
> >     
> >     2. OVMF recipe (taken from luv-yocto repository) into OE-Core
> >     3. Boot script: Instrumenting runqemu to include
> >     OECORE_MACHINE_SYSROOT,
> >     so the OVMF BIOS can be found.
> 
> I've tried out these patches. Mostly it worked as advertised and I'd
> love to use EFI with qemu, so I'd like to see this merged.
> 
> I noticed that "git format-patches" from your branch followed by "git
> am" mangles the
> meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-too
> lchain.patch because it is a mixture of Unix line ends (patch boiler plate)
> and DOS line ends (actual patches). The file ended up with all Unix line
> ends, which then failed during do_patch. I solved that by checking out your
> branch and copying the file. Whoever merges needs to be careful here. This
> might also be a problem for combo-layer, so perhaps a solution not based on
> patching the makefiles may be needed.

Good to note this - FYI the --keep-cr option is what you need to add to your 
"git am" command line in order to avoid this problem. combo-layer does this 
already (we hit this same problem with patches to files with DOS line endings a 
while back).

This is one reason why using the branch is usually a lot easier and safer than 
applying emails as patches (assuming the submitter sends a pull request with a 
branch - I'd encourage everyone sending series of more than a couple of 
patches to do this using the create-pull-request/send-pull-request scripts if 
they aren't already).

Cheers,
Paul
-- 

Paul Eggleton
Intel Open Source Technology Centre

