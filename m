Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B31996B3CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 12:39:39 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Jul 2013 05:39:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,751,1367996400"; d="scan'208";a="337314850"
Received: from unknown (HELO helios.localnet) ([10.252.122.182])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2013 05:39:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
Date: Fri, 26 Jul 2013 13:39:38 +0100
Message-ID: <2661953.CXEvbvU0xy@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <51F26B86.5020309@intel.com>
References: <51F26B86.5020309@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: is there a variable where the kernel version is stored?
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
X-List-Received-Date: Fri, 26 Jul 2013 12:39:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andrei,

On Friday 26 July 2013 15:28:54 Andrei Dinu wrote:
> I'm having a problem trying to run Bastille. Seems like the kernel
> version has changed from 3.8.11 to 3.8.13 and
> in order to run Bastille, i need to patch a file used by the tool to
> check the version of the system. It was previously
> patched with linux-yocto-3.8.11 version, but now it has changed to
> linux-yocto-3.8.13 and the tool doesn't work
> because it doesn't identify the right version of the kernel.
> 
> Is there a way to find out the kernel version at build time so i can
> replace it dynamically in that specific file?

Hmm, so if you add a DEPENDS on virtual/kernel you should be able to rely on 
the contents of ${STAGING_KERNEL_DIR}/kernel-abiversion - have a look at what 
meta/classes/module.bbclass does with this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

