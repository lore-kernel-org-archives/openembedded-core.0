Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1QWbHT-0003q8-Ra
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 23:36:16 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 14:32:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,366,1304319600"; d="scan'208";a="14674935"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 14:32:48 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <DD2AB20F-4D4A-4C8A-A2E4-0159FDBB98DF@dominion.thruhere.net>
References: <46ED2218-6735-449C-B10C-D557B92DA339@dominion.thruhere.net>
	<4DF672F2.2030909@linux.intel.com>
	<49501374-7FBE-400E-A91B-BD7EBD7FB65C@dominion.thruhere.net>
	<1308000620.15712.288.camel@rex>
	<BA4956B5-23B8-4590-8B23-A9837D6A11EA@dominion.thruhere.net>
	<1308082816.10825.38.camel@elmorro>
	<DD2AB20F-4D4A-4C8A-A2E4-0159FDBB98DF@dominion.thruhere.net>
Date: Tue, 14 Jun 2011 16:33:10 -0500
Message-ID: <1308087190.10825.40.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: Re: Where is atom-pc.conf hiding?
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
X-List-Received-Date: Tue, 14 Jun 2011 21:36:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-14 at 14:08 -0700, Koen Kooi wrote:
> Op 14 jun 2011, om 22:20 heeft Tom Zanussi het volgende geschreven:
> 
> > On Tue, 2011-06-14 at 00:40 -0700, Koen Kooi wrote:
> >> Op 13 jun 2011, om 23:30 heeft Richard Purdie het volgende geschreven:
> >> 
> >>> On Mon, 2011-06-13 at 22:36 +0200, Koen Kooi wrote:
> >>>> Op 13 jun 2011, om 22:28 heeft Saul Wold het volgende geschreven:
> >>>> 
> >>>>> On 06/13/2011 11:31 AM, Koen Kooi wrote:
> >>>>>> Hi,
> >>>>>> 
> >>>>>> Khem was asking if I could reproduce the recent x86 breakage he was seeing[1] and I ran into another bug:
> >>>>>> 
> >>>>>> koen@dominion:/OE/tentacle/sources/meta-intel$ git blame meta-n450/conf/machine/n450.conf  | grep atom
> >>>>>> 158f88d7 (Saul Wold   2011-01-03 15:33:52 -0800  6) require conf/machine/atom-pc.conf
> >>>>>> 
> >>>>> meta-yocto seems to be the place you need to look!
> >>>>> 
> >>>>> I hope that the layering tools can help to detect and inform folks of this like of dependency.
> >>>> 
> >>>> Isn't meta-yocto supposed to a the integration layer with no new
> >>>> parts? I can't use meta-yocto since it has conflicting beagleboard
> >>>> stuff in it, which means that meta-intel is now broken for me as well.
> >>>> That surely isn't the intended plan?!?!
> >>> 
> >>> The plan on public record is that atom-pc moves to meta-intel as soon as
> >>> the layer tooling comes online and meta-yocto becomes its own repo
> >>> (which at present its not but its certainly the intent).
> >> 
> >> So can someone at least put that in the meta-intel or meta-n450 README? Most layers now have a README with the dependency info (e.g. http://git.shr-project.org/git/?p=meta-smartphone.git;a=blob;f=meta-palm/README;h=200a3c83ff11ad790fe4e03e93a26520ec0c6714;hb=HEAD ) It would be nice if the ones on yocto-project.org had somethign similar :)
> >> _
> > 
> > Would something like this do the trick for now (if so, I can do similar
> > for the other meta-intel bsps)?
> 
> I'd put it in README, but yeah, it's an improvement.

OK, yeah, for some reason n450 decided to name its README
'ReleaseNotes'.  I'll find out if there was a reason for that and rename
it to README like the others if not...

Tom

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




