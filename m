Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3901D6AFC2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 15:54:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jul 2013 08:54:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1029,1363158000"; d="scan'208";a="367494022"
Received: from unknown (HELO helios.localnet) ([10.252.121.245])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2013 08:54:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 09 Jul 2013 16:54:10 +0100
Message-ID: <3588463.kQicxHoPbN@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <044c6bc4-86ca-4c96-bb24-50183cdf65b3@CH1EHSMHS029.ehs.local>
References: <044c6bc4-86ca-4c96-bb24-50183cdf65b3@CH1EHSMHS029.ehs.local>
MIME-Version: 1.0
Cc: meta-xilinx@yoctoproject.org
Subject: Re: [PATCH 0/2] scripts/runqemu: 'qemuzynq' and 'qemumicroblaze'
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
X-List-Received-Date: Tue, 09 Jul 2013 15:54:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Nathan/all,

On Thursday 04 July 2013 17:42:26 Nathan Rossi wrote:
> The following patches add support to the runqemu scripts to allow for
> the machines named 'qemuzynq' and 'qemumicroblaze' to be booted within
> qemu. These target machines reside in the 'meta-xilinx' layer.

I think we should look at changing runqemu so that it can be extended to 
support additional machines in the layers that add support for the machines 
themselves. I'm not entirely sure how we would implement this, but it should 
be possible assuming runqemu can know the path to all layers that are enabled 
(just query bitbake for BBLAYERS?) and there was some standard mechanism 
within the layer to add the machine-specific parts for the runqemu script.

Since this is unlikely to happen immediately I've acked these patches going 
in, but I think we'll need to look at doing this some time soon.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

