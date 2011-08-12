Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QrnnC-0007UG-B2
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 11:12:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2011 02:08:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="37110194"
Received: from unknown (HELO helios.localnet) ([10.255.18.64])
	by orsmga002.jf.intel.com with ESMTP; 12 Aug 2011 02:08:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Fri, 12 Aug 2011 10:08:03 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <CAGiJk9fq+p3LcBOOz=V+_kprRppAOR-nOAOW6tgK3zwE78Skwg@mail.gmail.com>
In-Reply-To: <CAGiJk9fq+p3LcBOOz=V+_kprRppAOR-nOAOW6tgK3zwE78Skwg@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201108121008.03554.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Questions about the layer structure in OpenEmbedded-Core
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
X-List-Received-Date: Fri, 12 Aug 2011 09:12:38 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 12 August 2011 07:17:52 Samuel Stirtzel wrote:
> lately I looked a bit into the structure of OE-Core and found pages
> like: http://www.yoctoproject.org/projects/openembedded-core, and
> http://openembedded.org/index.php/LayerIndex
> 
> 1. question: Are these informations reliable (the layer index page
> seems outdated).

I wrote both of these with input from the community recently, so they should 
be fairly reliable and up-to-date - was there something missing that you 
noticed? Suggestions welcome.

> 2.: Currently the "UI layer" seems to be contained in
> meta-openembedded, so is this _the_ layer for UI and windowmanager
> recipes or is this a subject to change?

There are several different UIs available. OE-core provides Sato (mainly for 
testing); the meta-openembedded repository contains several layers that 
provide some more (GNOME, XFCE, etc.)
 
> 3.: The commercial layer is nowhere found, what are the plans for this
> layer, or was this just an idea?

As Denys mentioned this sort of thing is (or is expected to be) provided by 
multiple OSVs.
 
> 4.: In which layer would distributions fit in the graphic?

I would imagine they would take the place of the commercial layer - after all, 
both would be providing the same sorts of "policy" type metadata.
 
> 5.: Is something important missing / wrong in my graphic (other than
> the distro stuff)?

It looks good, but I'm not sure that you'd expect to be mixing all of these 
layers together in one configuration; e.g. the commercial layer / distro 
layers.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


