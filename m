Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QNSsH-0002bV-Uz
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 18:48:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 May 2011 09:45:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,243,1304319600"; 
   d="scan'208";a="5320397"
Received: from unknown (HELO helios.localnet) ([10.255.16.165])
	by fmsmga001.fm.intel.com with ESMTP; 20 May 2011 09:45:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2011 17:45:29 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <RFC: Layer tooling brainstorming> <4DCBDC96.1080306@mvista.com>
	<4DCC1A0B.3040802@mvista.com>
In-Reply-To: <4DCC1A0B.3040802@mvista.com>
MIME-Version: 1.0
Message-Id: <201105201745.29497.paul.eggleton@linux.intel.com>
Cc: chris_larson@mentor.com
Subject: Re: [PATCH] Add support for remote layering.
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
X-List-Received-Date: Fri, 20 May 2011 16:48:30 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Returning a discussion that has begun on the wiki to the mailing list:

Jeremy Puhlman wrote:
> Paul Eggleton wrote:
>> A good start but naturally we want to avoid the bits that hard-code
>> variable values. I wonder about situations where people want their own
>> versions of layers or to share remote layers (e.g. between an oe-core setup
>> and a poky setup); however people can just use local layers for this.
>
> In reality they are setting "reasonable" defaults. Hardcoding implies
> something that is unchangeable. All the values are "set if unset", so they
> can be changed in the bblayers.conf file. Prior to the introduction of
> layers, all the values were hardcoded, just in a bitbake.conf file, so you
> always had working fetchers. With out that the fetchers are basically broken
> until after you have loaded up the layers. Given the fact that nearly every
> bitbake.conf file contains the same settings for defining fetchcmd and a like,
> simply having a reasonable default setting for the things the fetchers need
> is not really that terrible an idea irrespective of the remote layering.

I think it's just about the placing of these defaults, I don't necessarily 
object to having them in the first place. My main concerns are around the 
defaults for variables like TMPDIR which may end up actually being used in 
preference to what the user has set in local.conf. Obviously we have a 
chicken-and-egg situation where we depend on having the main layer present to 
read any configuration other than bblayers.conf - perhaps this indicates we 
need to restructure some of the config files if we want to make this work 
nicely.

> As for the second question. I have some content tools that I am cleaning up
> that basically provide methods for defining layers and groups of layers
> together for mirroring and sharing. That might address what your talking
> about there. They work along with the patch posted here, but could be
> modified to output things a bit differently if needed.

I'd definitely be interested in seeing these tools and trying to incorporate 
them into what we're doing for layer tooling in 1.1. Is there a lot of work 
left to do before you can release these?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


