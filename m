Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Si57p-0004pf-FS
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 16:46:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jun 2012 07:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="183716236"
Received: from unknown (HELO helios.localnet) ([10.252.120.123])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2012 07:35:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 22 Jun 2012 15:35:26 +0100
Message-ID: <1747366.kqsrF4mgDg@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <4FE0CB44.4030909@linux.intel.com>
References: <4FE0A296.5090809@linux.intel.com> <2812027.e5PhAjC3T6@helios>
	<4FE0CB44.4030909@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Buildhistory for the PACKAGE Reorder
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
X-List-Received-Date: Fri, 22 Jun 2012 14:46:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 19 June 2012 11:56:04 Saul Wold wrote:
> On 06/19/2012 11:29 AM, Paul Eggleton wrote:
> > On Tuesday 19 June 2012 09:02:30 Saul Wold wrote:
> >> Please find attached the buildhistory_diff from 2 world builds with and
> >> without the PACKAGE Reorder.
> > 
> > Saul, would you mind pushing the buildhistory repo somewhere (e.g. to a
> > poky- contrib branch)? That would help me debug some of the weirdness in
> > the output there.
> 
> Sorry it is available, was mentioned in my past emails, its in the
> poky-contrib.git sgw/repack-buildhistory

Ah, sorry, didn't think to look there.

Upon closer inspection though it looks like the output you attached is the 
result of piping the output of buildhistory-diff through 'grep -v "PACKAGES 
changed order"' - which would explain the "duplicated" lines. By eliminating 
the lines containing that string you've also eliminated many lines that also 
contained the package name, and thus their items are concatenated underneath 
those for the previous package.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


