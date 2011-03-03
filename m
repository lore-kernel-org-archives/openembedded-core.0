Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Pv9tq-0002oe-59
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 15:53:06 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Mar 2011 06:29:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,258,1297065600"; d="scan'208";a="893386285"
Received: from unknown (HELO [10.255.17.39]) ([10.255.17.39])
	by fmsmga001.fm.intel.com with ESMTP; 03 Mar 2011 06:29:44 -0800
From: Joshua Lock <josh@linux.intel.com>
To: Chris Larson <clarson@kergoth.com>
In-Reply-To: <AANLkTinAUZ72Tfmm4K8F5kJDLUrfO6AmzEKaLfG9NX5x@mail.gmail.com>
References: <4D6E7EB1.5080602@windriver.com>
	<41F9E0FC-E0A1-4C7F-8999-3E1B53FDDEE1@dominion.thruhere.net>
	<1299157757.2550.5.camel@scimitar>
	<E900D076-3678-445D-89D2-973EC3A558A8@dominion.thruhere.net>
	<1299161111.2550.8.camel@scimitar>
	<AANLkTinAUZ72Tfmm4K8F5kJDLUrfO6AmzEKaLfG9NX5x@mail.gmail.com>
Date: Thu, 03 Mar 2011 14:29:38 +0000
Message-ID: <1299162578.2550.19.camel@scimitar>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 (2.32.1-1.fc14) 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: oe-core cleanup...
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
X-List-Received-Date: Thu, 03 Mar 2011 14:53:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

My last reply went straight to Chris rather than the list so re-sending,
sorry Chris.

Is it intended that the list doesn't reply to list by default?

On Thu, 2011-03-03 at 07:14 -0700, Chris Larson wrote:
> On Thu, Mar 3, 2011 at 7:05 AM, Joshua Lock <josh@linux.intel.com>
wrote:
> > I agree, in fact yesterday I discovered we have the beginnings of
such a
> > tool (bitbake-layers) written by Chris. Currently it prints out
which
> > recipes are being modified by a .bbappend and .bbappend files for
which
> > no recipe exists.
> >
> > I had to write a trivial patch (attached) to make it work but it's a
> > good start. :-)
> 
> Note that "fixes the instantiation of the BBCooker to match recent
> changes in the BitBake libraries." is not correct.  It's not a recent
> change, it's a poky vs upstream difference at the moment, due to the
> switch to the Process based server.  The change in that patch will
> make it work with poky, which is good, but not with master.

Fair enough, Poky is (currently) the environment in which I do most of
my BitBake hacking but I appreciate you pointing this out.

I was just about to reply pointing out that the patch is against Poky
rather than upstream.

> 
> This is the last somewhat large piece of the bitbake sync, as far as I
> know -- we need to decide how best to resurrect the XML/RPC server in
> master, but we haven't yet determined how the user should select their
> server.  For the average user, they just want to run a UI, the server
> is implementation details, so I'd argue that we let the UI instantiate
> the server it needs, create a UI that spawns an xml/rpc server and
> displays the connection info to stdout, and add an env var to let the
> other UIs connect to a nondefault server, but there are other
> possibilities that need to be considered.  In poky, you have to
> comment/uncomment lines in bin/bitbake, which is .. not ideal :)

I agree with what you're saying here and I'm thinking along similar
lines wrt having the UI be able to select the desired server but was
also thinking of having a command line switch to choose which server you
want to use. I've kept quiet about this so far as I don't yet have any
patches. ;-)

I like the idea of an env var to use a non-default server.

> 
> Do let me know if you come up with any good ideas for additional
> commands for the bitbake-layers tool -- I'm sure there are plenty of
> useful things we can add to assist in layer maintenance.  Thanks!
> I'll apply the #! change to upstream right away.

Great, thanks very much. I've not had any good ideas yet but you can be
sure you'll see patches if/when I do.

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



