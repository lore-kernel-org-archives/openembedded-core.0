Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S8Jvr-0007en-0a
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 00:18:07 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 16:09:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129544731"
Received: from unknown (HELO helios.localnet) ([10.252.123.170])
	by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2012 16:09:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Thu, 15 Mar 2012 23:09:16 +0000
Message-ID: <665936693.QMobc8r8oH@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <4F613827.3040705@opendreambox.org>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<e4d001f8c6f8945c8c70c2558ad5f9e1fd85dfad.1331685330.git.paul.eggleton@linux.intel.com>
	<4F613827.3040705@opendreambox.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] scripts/bitbake: ensure user is in build directory
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
X-List-Received-Date: Thu, 15 Mar 2012 23:18:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 15 March 2012 01:30:31 Andreas Oberritter wrote:
> On 14.03.2012 01:36, Paul Eggleton wrote:
> > If the user is in any directory other than $BUILDDIR when the bitbake
> > wrapper script is run, then show an error an exit.
> 
> this patch broke my setup.

Ah, sorry about that.
 
> My $BUILDDIR points to tmp, so that pseudo doesn't get rebuilt for every
> machine. I have a shared tmp for many machines.

So a couple of things:

1) Unless I'm missing something you can share the same TMPDIR between multiple 
build directories to get the same result.
 
2) pseudo is a native package. It shouldn't be rebuilt when changing MACHINE. 
In fact I just verified by creating a different build directory with only 
MACHINE changed in the config, it is not rebuilt.

> BUILDDIR doesn't seem to have any other use than pointing to the
> 'pseudodone' file. I don't understand why it's required to run bitbake
> from there.

Well, it's required that bitbake is run from the build directory and when you 
use the setup script as intended that's where BUILDDIR points to. I hadn't 
anticipated that anyone would be changing BUILDDIR to point to anything other 
than the build dir, however I don't really think it's a good idea to support 
that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


