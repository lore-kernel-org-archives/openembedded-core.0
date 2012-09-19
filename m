Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TEKZr-0007J5-D1
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 15:44:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Sep 2012 06:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="224052439"
Received: from unknown (HELO helios.localnet) ([10.252.121.228])
	by fmsmga002.fm.intel.com with ESMTP; 19 Sep 2012 06:31:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Sep 2012 14:31:39 +0100
Message-ID: <3089732.XYZjcTqTr7@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CAMKF1srg0a1GhHPqY9dS_AjTJRXS7wSNzH1-UBMUJEuaXfuidw@mail.gmail.com>
References: <70CC66F5C30A414DADDA6973E4CA391A68BAF6@039-SN1MPN1-001.039d.mgd.msft.net>
	<224680354.d9icDWC9tY@helios>
	<CAMKF1srg0a1GhHPqY9dS_AjTJRXS7wSNzH1-UBMUJEuaXfuidw@mail.gmail.com>
MIME-Version: 1.0
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: multilib errors
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
X-List-Received-Date: Wed, 19 Sep 2012 13:44:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 19 September 2012 06:26:31 Khem Raj wrote:
> On Wed, Sep 19, 2012 at 4:03 AM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > I have seen these errors as well. It definitely should be doing these
> > checks - the warnings occur during the file checksum code but more
> > broadly they indicate the system will fail to find these files should you
> > try to build the targets mentioned. Looking more closely, I could be
> > wrong but it looks to me that BPN is not correct at least in the case of
> > lib64-build-appliance-image - I think it ought to be
> > "build-appliance-image"  but instead it is "lib64-build-
> > appliance-image", which means that it can't find the files referred to in
> > SRC_URI anymore given that they are located in a directory named "build-
> > appliance-image".
> 
> IMO when we inherit multilib bbclass then it should also add new
> ${BPN} based dirs to FILESPATH

BPN-based dirs are already in FILESPATH - that's the issue, BPN itself is not 
the expected value.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


