Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R1ZEG-0003QA-PP
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 09:40:56 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Sep 2011 00:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,349,1312182000"; d="scan'208";a="49185753"
Received: from unknown (HELO helios.localnet) ([10.252.120.53])
	by fmsmga001.fm.intel.com with ESMTP; 08 Sep 2011 00:35:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Thu, 8 Sep 2011 08:35:50 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <201108261047.10782.paul.eggleton@linux.intel.com>
	<201109071418.10285.paul.eggleton@linux.intel.com>
	<4E683C38.20506@linux.intel.com>
In-Reply-To: <4E683C38.20506@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201109080835.50416.paul.eggleton@linux.intel.com>
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
X-List-Received-Date: Thu, 08 Sep 2011 07:40:57 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 08 September 2011 04:53:28 you wrote:
> Now I understand what you are talking about, it might best to split this
> into 2 tasks a task-core moved to recipes-core/tasks and a
> task-core-x11, what about that?

I think that's the only way this can really work, yes.
 
> >> I can't access the LSB specs website right now
> >> unfortunately but does this have an official name within LSB? It's not
> >> "LSB-Core" is it?
> > 
> > Yep, it's LSB-Core (yet another meaning of "core", sigh...)
> 
> We could rename basic to task-lsb-core if that's what your thinking, but
> as you point out yet another "core".

Then again, if you're talking about LSB it makes sense to use the correct 
terminology.

> >> If there's demand for a minimal image with package management (someone
> >> asked for this on IRC just the other day, and it makes sense to me at
> >> least) then that's what I'd suggest turning this into. In which case it
> >> ought to be called core-image-minimal-pkgmgmt or something similar.
> > 
> > Any opinions on this one?
> 
> I think this is one that they can create themselves it's would be distro
> specific and would require additional space allocated to the rootfs,
> best for the distro do.  Remember we are trying to provide foundations
> and examples. core-image-minimal is supposed to be the smallest possible
> image with login and shell. It can be used by someone to build on.

That's exactly what I am thinking about. Since we already have such an image 
(core-image-base) that isn't being used for anything else, why not make it 
into something useful? Right now since core-image-minimal overrides 
IMAGE_INSTALL you can't use IMAGE_FEATURES and POKY_EXTRA_INSTALL to extend 
it, nor does it have package management that some users would be expecting; I 
think it would be useful to have a base image where those mechanisms do work. 
(Maybe the term "minimal" wouldn't apply to this image.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


