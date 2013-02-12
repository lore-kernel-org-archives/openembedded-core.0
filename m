Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1U5CMB-0004pJ-Sr; Tue, 12 Feb 2013 10:41:02 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Feb 2013 01:24:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,648,1355126400"; d="scan'208";a="284605214"
Received: from unknown (HELO helios.localnet) ([10.252.120.87])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2013 01:24:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 12 Feb 2013 09:24:53 +0000
Message-ID: <1687588.iZvXQbhphA@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-23-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <1360622147.6793.78.camel@ted>
References: <2760168.9kFd94gL1F@helios> <1360622147.6793.78.camel@ted>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: RFC: meta-oe appends and overlayed recipes
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
X-List-Received-Date: Tue, 12 Feb 2013 09:41:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 11 February 2013 22:35:47 Richard Purdie wrote:
> On Mon, 2013-02-11 at 17:09 +0000, Paul Eggleton wrote:
> > *
> > meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappe
> > nd This is adding qwt to the qte toolchain. As far as I am concerned this
> > is a distro policy decision - Qwt is a third-party library that is not
> > part of Qt. I believe this should be moved to the layers for whichever
> > distros want this.
> > 
> > * meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
> > * meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
> > These two add MySQL and PostgreSQL support to Qt and Qt/Embedded. I see
> > this as a distro policy decision; these should move to the layers for
> > whichever distros want this. FWIW, this is particularly egregious if
> > you've already built Qt, then add meta-oe and find Qt is being
> > unexpectedly rebuilt.
> If these were implemented as PACKAGECONFIG options, then distros would
> just need to set the appropriate PACKAGECONFIG for the package in the
> distro config and we wouldn't even need the appends...

The thing is the Qt configure options are a little more complicated - many of 
them are three-state switches (enable built-in, enable as a plugin or 
disabled). Thus we've opted to split the configuration options into variables 
for each type. We don't get PACKAGECONFIG's DEPENDS handling, but if we used 
PACKAGECONFIG we'd lose some flexibility.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre


