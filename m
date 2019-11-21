Return-Path: <pb@pbcl.net>
Received: from pbcl.net (pbcl.net [159.69.221.92])
	by mail.openembedded.org (Postfix) with ESMTP id 13BD86069C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 13:59:56 +0000 (UTC)
Received: from pb by pbcl.net with local (Exim 4.89)
	(envelope-from <pb@pbcl.net>)
	id 1iXmzm-0006yG-OX; Thu, 21 Nov 2019 14:59:42 +0100
Date: Thu, 21 Nov 2019 14:59:42 +0100
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191121135942.h776ktsg6jwow4sj@pbcl.net>
References: <20191120134455.125118-8-alex.kanavin@gmail.com>
	<20191120194927.GA28030@localhost>
	<CANNYZj_g1kDJ5CSbKg4DEaATCiyPPT=2GuYEsUyHr+7ZpH8EkQ@mail.gmail.com>
	<20191120213844.ome6ota74rmgosy3@pbcl.net>
	<CANNYZj9uAs5wQPya6R9q3gfSQm_Xyu9xViGBxOQ2COKKbcYeWg@mail.gmail.com>
	<20191120223207.6cuuklpgrzuhqug3@pbcl.net>
	<CANNYZj93tJxTsCwS3cg3J=0WB--A0Af26Y=nO9fOdfNb9okRYg@mail.gmail.com>
	<20191120231812.GB3962@localhost>
	<238a39c7-b794-aaa0-1da6-4b585078f447@intel.com>
	<fc3a26d7c77f2781cbad28cdb8fc71995ab5e327.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <fc3a26d7c77f2781cbad28cdb8fc71995ab5e327.camel@linuxfoundation.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 08/11] lrzsz: remove the recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Nov 2019 13:59:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 21, 2019 at 10:10:30AM +0000, Richard Purdie wrote:
> On Thu, 2019-11-21 at 09:24 +0000, Ross Burton wrote:
> > 2) the source is positively ancient and building it on modern linux is 
> > getting harder over time

Just to put this in perspective, I tried fetching lrzsz-1.20.0.tar.gz
from the upstream site, unpacked it on my Debian "buster" host, did
"./configure && make" without modifying any files, and it built 
absolutely fine using gcc-8.3.0.  There were a few compiler warnings
but nothing worse than that.  

Now, I am happy to accept that building it inside oe-core is somewhat 
more difficult, and regenerating the autotools bits using modern tools
does look like it will require some patching, but I don't think we should
exaggerate the extent to which "old code" equals "problematic code".

> I just wanted to highlight that the way things are trending, its likely
> we'll end up with Linux builds alongside RTOS builds with multiconfig.
> These will likely need to communicate and the mechanism(s) for that
> remain to be seen.

meta-oe has a recipe for kermit... :-}

> over into Linux. I therefore have a slight inclination to try and keep
> this around if we can.
> 
> I do take the point about needing work to keep it maintained/working
> though :(.

I also have at least a passing fondness for lrzsz and if a small amount
of maintenance now will suffice to keep it working for another 21 years
then I think I would consider that a good outcome.  I will have a quick
look at the code and see if I can fix whatever is apparently problematic
about it.

I have no particular opinion as to whether it ought to stay in oe-core
or move into some sort of meta-retrocomputing layer.

p.

