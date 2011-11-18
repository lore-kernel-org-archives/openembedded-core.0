Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RRP1N-0001PE-LF
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 15:02:25 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Nov 2011 05:55:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,533,1315206000"; d="scan'208";a="92452429"
Received: from unknown (HELO helios.localnet) ([10.252.121.185])
	by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2011 05:55:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Nov 2011 13:55:47 +0000
Message-ID: <4407672.GTMaySf1kg@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-12-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <4EC22317.1090109@gmail.com>
References: <cover.1320429060.git.paul.eggleton@linux.intel.com>
	<E2FAFDF6-ABD2-4242-8BAC-8124ED2B1013@dominion.thruhere.net>
	<4EC22317.1090109@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 2/3] core-image-minimal-initramfs: force IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 18 Nov 2011 14:02:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 15 November 2011 12:30:15 Dmitry Eremin-Solenikov wrote:
> This was merged as IMAGE_FSTYPES =+ "cpio.gz"
> Now this brings problems if I have IMAGE_FSTYPES += "live" in my
> local.conf / BSP machine.conf.
> 
> 1) OE tries to generate hddimg for this initramfs image, which is
> strange idea
> 2) If OE is trying to generate bootimg (hddimg) when the kernel is not
> yet deployed, building fails (as bootimg can't find a deployed kernel to
> put into hddimg).
> 
> Please revert this back to original patch as proposed by Paul.

OK, so what are we going to do about this? Do we have to do some filtering of 
this variable?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


