Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Pv7O3-0005ci-Ko for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 13:12:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p23CAXNl008365
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Mar 2011 12:10:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07723-09 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2011 12:10:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p23CARZq008359
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Mar 2011 12:10:27 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <A0E1CD11-8650-4AAD-BE14-278241E67042@dominion.thruhere.net>
References: <4D6E7EB1.5080602@windriver.com> <1299088802.26736.10715.camel@rex>
	<BED5DD21-1E73-4DB2-9E29-17E70DF7344C@dominion.thruhere.net>
	<1299093521.26736.10877.camel@rex> <4D6EE7A6.20603@mentor.com>
	<A0E1CD11-8650-4AAD-BE14-278241E67042@dominion.thruhere.net>
Date: Thu, 03 Mar 2011 12:10:22 +0000
Message-ID: <1299154222.26736.12921.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Thu, 03 Mar 2011 12:12:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-03 at 09:02 +0100, Koen Kooi wrote:
> Op 3 mrt 2011, om 01:58 heeft Tom Rini het volgende geschreven:
> 
> > On 03/02/2011 12:18 PM, Richard Purdie wrote:
> >> On Wed, 2011-03-02 at 19:27 +0100, Koen Kooi wrote:
> >>> Op 2 mrt 2011, om 19:00 heeft Richard Purdie het volgende geschreven:
> >>> 
> >>>> Thanks for starting this thread Mark, I've also just been looking at
> >>>> this question so its timely.
> >>>> 
> >>>> On Wed, 2011-03-02 at 11:30 -0600, Mark Hatle wrote:
> >>>>> I finally got a chance to look at the oe-core and where it currently is..  Some
> >>>>> suggestions below:
> >>>>> 
> >>>>> LICENSE file, this may need to be cleaned up to only cover the components
> >>>>> actually in the oe-core.
> >>>>> 
> >>>>> README likely needs some revision
> >>>>> 
> >>>>> README.hardware needs a lot of revision.  Anything outside of support for QEMU
> >>>>> should be removed.
> >>>>> 
> >>>>> The meta-demoapps and meta-rt components, will those be staying or going?
> >>>>> 
> >>>>> The meta/recipes.txt needs to be verified as still what we want -- I assume it
> >>>>> is at this point..
> >>>>> 
> >>>>> meta/recipes-...  sato, qt, gnome, I thought were going elsewhere?
> >>>>> 
> >>>>> Do the items in the "scripts" need to be renamed or is Poky being kept in the
> >>>>> naming?  Same with the poky-init-build-env?
> >>>>> 
> >>>>> Then I also assume the items in the documentation directory need to be cleaned
> >>>>> up as well...
> >>>>> 
> >>>>> Let me know what you'd like me to try and tackle -- or if we need to bring these
> >>>>> items up at the TSC for recommendation.
> >>>> 
> >>>> I'm proposing this change so far:
> >>>> 
> >>>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/roorg&id=891ad22536b49d4fee066a5865ad730f791d36e9
> >>>> 
> >>>> with those relocated files being removed from oe-core. Any objections to
> >>>> that to start with?
> >>> 
> >>> Why not put the recipes in meta-oe? I have need for e.g eds-dbus and would like to have that in meta-oe.
> >> 
> >> Which pieces are we talking about? Does oe-core want sato? Should some
> >> of these go to meta-gnome and is that what we want? Or do we want all of
> >> sato there?
> >> 
> >> I was under the impression sato might not be wanted but I'm open to
> >> influence either way on that. Certainly there are some pieces "we" as in
> >> Yocto put into recipe-sato that could arguably be positioned elsewhere.
> >> 
> >> Are you also concerned about meta-demoapps or is that fine?
> > 
> > To me, sato should be however poky wants to deal with it.  But a lot
> > of the deps are common gnome things and so forth that others care 
> > about too and we should try for meta-oe.  Again, to me, this is how
> > we can reconcile the bits that poky has better than oe.dev (and vice
> > versa) so both parties win.
> 
> I added sato to OE years ago, but didn't update it, so I argue since
> it's already in OE we should put it in meta-oe :)

There is a very strong commitment to look after Sato from the Yocto
community so based on that, I'm ok with keeping it there.

I'm still not 100% convinced this is the right place for it but there is
no reason to rush to remove it either.

So I think we're agreed on the machine component of that commit above.
The distro component I think needs to go in, what about the other areas
I mentioned.

I'd really at least like the TSC members to comment on those different
pieces. I've already seen Chris comment that "poky-init-build-env"
shouldn't be in the core for example. What about the rest of the scripts
directory?

Cheers,

Richard



