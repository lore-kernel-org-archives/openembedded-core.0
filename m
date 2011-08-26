Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QwzVh-0002Cf-CR
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 18:44:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Aug 2011 09:39:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="42578831"
Received: from unknown (HELO helios.localnet) ([10.255.18.141])
	by orsmga001.jf.intel.com with ESMTP; 26 Aug 2011 09:39:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 26 Aug 2011 17:39:09 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <201108261047.10782.paul.eggleton@linux.intel.com>
	<4E57C747.2020104@linux.intel.com>
In-Reply-To: <4E57C747.2020104@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201108261739.10025.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Core image recipes
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
X-List-Received-Date: Fri, 26 Aug 2011 16:44:01 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 26 August 2011 17:18:15 Saul Wold wrote:
> On 08/26/2011 02:47 AM, Paul Eggleton wrote:
> > meta/recipes-extended/images/core-image-basic.bb
> 
> This image should NOT contain any X11, this is supposed to be an
> extention of core-image-minimal with many of the busybox related
> commands substituted for the real command set.  The intention of this
> image is two fold, first it's the largest image that we test against
> non-GPLv3 and it's the non-graphical LSB image (I am not sure if there
> is a spec test defined for that.

Hmm, I'm not sure what I was thinking earlier, you're right it doesn't appear 
to have X. I can't access the LSB specs website right now unfortunately but 
does this have an official name within LSB? It's not "LSB-Core" is it?
 
> So, no I do not think they can be merged.  But renaming core-image-core
> to core-image-x11-base might make sense, also renaming core-image-basic
> to core-image-lsb-basic may clear things up.

Sounds good to me. Should I send a patch?

> > Then, we have core-image-base, which whilst it doesn't remove package
> > management files, does not have "package-management" in its features, so
> > it's not a whole lot different to core-image-minimal AFAICT.
> 
> On this one I might agree, I know that we have not built that image, nor
> does it seem to be used by anything else.

If there's demand for a minimal image with package management (someone asked 
for this on IRC just the other day, and it makes sense to me at least) then 
that's what I'd suggest turning this into. In which case it ought to be called 
core-image-minimal-pkgmgmt or something similar.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


