Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SmqF0-0004sd-2R
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 19:53:22 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Jul 2012 10:42:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="167453540"
Received: from unknown (HELO helios.localnet) ([10.252.120.245])
	by orsmga002.jf.intel.com with ESMTP; 05 Jul 2012 10:42:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 05 Jul 2012 18:42:15 +0100
Message-ID: <1656802.Mb7ogIjIbu@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1207051311580.30933@oneiric>
References: <alpine.DEB.2.02.1207051311580.30933@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: is there a "bitbake" variation that will tell me about *only* the used packages?
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
X-List-Received-Date: Thu, 05 Jul 2012 17:53:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 05 July 2012 13:14:32 Robert P. J. Day wrote:
>   it's possible i'm misreading something, but i want to display a list
> of recipes and their versions that will go into the given target.  i
> configured for qemuarm and i want to bitbake core-image-minimal.
> 
>   if i run "bitbake -s", that appears to show me *all* packages and
> preferred versions, not just for, say, core-image-minimal.  is there a
> variation that will tell me that info only for the recipes that will
> be used for a given target?

This is something being worked on under bug #2404:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=2404

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


