Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A617F6C76F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 13:50:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Oct 2013 06:50:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,507,1378882800"; d="scan'208";a="393811618"
Received: from unknown (HELO helios.localnet) ([10.252.121.8])
	by orsmga001.jf.intel.com with ESMTP; 16 Oct 2013 06:50:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2013 14:50:27 +0100
Message-ID: <2444253.vL4HTbpqxr@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
MIME-Version: 1.0
Subject: RFC: Using formfactor data in other recipes
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
X-List-Received-Date: Wed, 16 Oct 2013 13:50:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

Andrea has been doing some cleanup on meta-handheld, and he and I have come 
across what seems to be a bit of a shortcoming with formfactor over the 
variable-based alternative that was used in OE-Classic (MACHINE_GUI_CLASS, 
MACHINE_DISPLAY_WIDTH_PIXELS, MACHINE_DISPLAY_HEIGHT_PIXELS etc.). In 
meta-opie, the latter variables are still being used in a machine-specific 
packagegroup recipe to select the appropriate set of pixmaps to be installed 
for each machine based on the screen resolution, so you don't have to have 
pixmaps installed that you're never going to use (which would waste storage 
space).

formfactor is the current method supported in OE-Core for representing 
differences in machine display/input characteristics, however it seems only 
queryable at runtime since its files are not written into the sysroot. We could 
change it to stage to the sysroot, and therefore the data could be queried at 
least at packaging time in other recipes that depend on formfactor. Does this 
sound like a reasonable solution for this kind of problem, or is there a 
better solution?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

