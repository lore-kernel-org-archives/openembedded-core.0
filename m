Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SeTlI-0003fO-5s
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 18:16:08 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Jun 2012 09:05:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="151998391"
Received: from unknown (HELO helios.localnet) ([10.252.120.143])
	by orsmga001.jf.intel.com with ESMTP; 12 Jun 2012 09:05:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 12 Jun 2012 17:05:30 +0100
Message-ID: <1452406.eSFiROSBlj@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-24-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1206121129470.13822@oneiric>
References: <1339487948-30612-1-git-send-email-bogdan.a.marinescu@intel.com>
	<2704914.5qldZ3P3Ag@helios>
	<alpine.DEB.2.02.1206121129470.13822@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] strace: update to 4.7
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
X-List-Received-Date: Tue, 12 Jun 2012 16:16:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 12 June 2012 11:31:59 Robert P. J. Day wrote:
> On Tue, 12 Jun 2012, Paul Eggleton wrote:
> > Any core-image-* would do e.g. core-image-minimal, and you could just use
> > CORE_IMAGE_EXTRA_INSTALL += "strace" in your local.conf to have strace
> > installed in the image by default for the purpose of doing this test.
> 
>   i remember running across precisely that and being somewhat confused
> by how that was described:
> 
> http://permalink.gmane.org/gmane.comp.handhelds.openembedded.core/18105
> 
> i still think there's some redundancy involving using both "_EXTRA_"
> and "+=" in the same directive.

Ultimately it's a variable like any other. Using += works regardless of 
whether someone has already set it or not and doesn't disturb any existing 
items if they have.

I agree that in our examples we should try to be consistent though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


