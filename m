Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TgcC8-0001L3-79
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 15:12:56 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Dec 2012 05:58:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,230,1355126400"; d="scan'208";a="259918112"
Received: from unknown (HELO helios.localnet) ([10.252.123.5])
	by fmsmga002.fm.intel.com with ESMTP; 06 Dec 2012 05:58:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>, Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 06 Dec 2012 13:58:27 +0000
Message-ID: <3221241.HMtLP26WOa@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-19-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <50C0286B.60406@linux.intel.com>
References: <cover.1354650148.git.mark.hatle@windriver.com>
	<50C0286B.60406@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] Integrate Smart for RPM image generation
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
X-List-Received-Date: Thu, 06 Dec 2012 14:12:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 05 December 2012 21:08:59 Saul Wold wrote:
> On 12/04/2012 11:49 AM, Mark Hatle wrote:
> > The following patch set relies on the previous "Misc fixes" sent out
> > earlier today.
> > 
> > The set replaces the existing rootfs generation with one based on Smart.
> > The work was tested using buildhistory over a wide range of image types:
> > core-image-minimal
> > core-image-base
> > core-image-basic
> > core-image-lsb
> > core-image-sato
> > build-appliance
> 
> Did you try with the DISTRO = poky-lsb when doing the lsb build?  There
> are failures across the board with the LSB builds

I just did with core-image-lsb, and apart from the pkgconfig issue which I have 
worked around, it built fine - I did not see this error. The only thing I can 
think of is that it has something to do with these running concurrently, 
although I'm not sure how that could be a problem especially as we have 
locking for the rpm backend.

I'm now running a concurrent build of all of the four images that failed, 
we'll see if I get the same failure or not fairly soon.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


