Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RGtCH-0007kW-2A for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 16:02:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9KDuMJ1018105
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 14:56:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17924-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 14:56:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9KDuCmF018099
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 14:56:13 +0100
Message-ID: <1319118970.2410.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 20 Oct 2011 14:56:10 +0100
In-Reply-To: <7D5D6BF3-6F21-4CE5-8A30-F9154CDB9449@dominion.thruhere.net>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<1316297897-698-2-git-send-email-dbaryshkov@gmail.com>
	<CADkTA4NxfSaEinraLQMsLT4ZWQKOPAZ76uNujFXg0zSrRvVnFA@mail.gmail.com>
	<0E901391-C9FC-48AE-88A4-C1064E57376E@dominion.thruhere.net>
	<1317221697.12332.13.camel@ted>
	<89CD0BCB-1457-4C76-87BA-5ED03454C343@dominion.thruhere.net>
	<1317239461.12332.55.camel@ted>
	<CAP9ODKopjm-bJY3WJriMiQDtwZcsOWeqZkqnm7F2PwiZvWY0bg@mail.gmail.com>
	<67E90C92-F94E-4FF2-ADA5-A5295C4F1279@dominion.thruhere.net>
	<1319109715.16061.4.camel@ted>
	<46567209-1B97-42F5-B5DF-E34B823F6BF7@dominion.thruhere.net>
	<1319114339.2410.5.camel@ted>
	<7D5D6BF3-6F21-4CE5-8A30-F9154CDB9449@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/5] kernel.bbclass: respect MACHINE_KERNEL_PR
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
X-List-Received-Date: Thu, 20 Oct 2011 14:02:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-20 at 14:54 +0200, Koen Kooi wrote:
> Op 20 okt. 2011, om 14:38 heeft Richard Purdie het volgende geschreven:
> 
> > On Thu, 2011-10-20 at 13:29 +0200, Koen Kooi wrote:
> >> Op 20 okt. 2011, om 13:21 heeft Richard Purdie het volgende geschreven:
> >> 
> >>> On Thu, 2011-10-20 at 08:23 +0200, Koen Kooi wrote:
> >>>> Op 28 sep. 2011, om 22:04 heeft Otavio Salvador het volgende geschreven:
> >>>> 
> >>>>> On Wed, Sep 28, 2011 at 16:50, Richard Purdie
> >>>>> <richard.purdie@linuxfoundation.org> wrote:
> >>>>>>> This patch improves the current situation and I don't foresee the
> >>>>>>> autoPR code working soon
> >>>>>> 
> >>>>>> Which is why we need to switch to that model and shake out the issues
> >>>>>> sooner than later. Enough is enough with the PR madness and we need to
> >>>>>> get to grips and fix it.
> >>>>> 
> >>>>> I fully agree this is the way to go but this doesn't mean we ought to
> >>>>> hold this patch until all this happens. This patch allows the removal
> >>>>> of the kernel.bbclass from meta-oe so reducing the delta between
> >>>>> oe-core and meta-oe.
> >>>> 
> >>>> So a month later and no sign of the mythical working
> >>>> auto-PR-incrementer or work on it.
> >>> 
> >>> A month where we were stabilising for a release. Its on the 1.2 feature
> >>> list and as it happens I've been hearing questions about what is needed
> >>> here.
> >>> 
> >>>> So can this patch go in? It would mean we can drop kernel.bbclass
> >>>> from meta-oe.
> >>> 
> >>> I *HATE* this PR bumping stuff. I've just been told we likely need to
> >>> bump the PR for anything using libGL which once again shows that build
> >>> system basically failing to automate building things.
> >>> 
> >>> So I'm drawing a line here and no, we can't take this. If its fine to
> >>> expect people to bump PR values manually for lib* changes, its fine for
> >>> kernels too. I'd suggest you do drop this from meta-oe and we start
> >>> building up pressure for the problem to get fixed properly rather than
> >>> letting people wallpaper over the cracks.
> >> 
> >> I have products to ship, so treating meta-oe as a plaything and break
> >> this for the sake of breaking it is unacceptable. I'll let oe-core
> >> have the monopoly on high-qualitily, but broken metadata.
> > 
> > Its not as if there isn't another way to handle this, it is a little
> > harder work I agree. This isn't breaking for the sake of breaking
> > either, its applying a bit of pressure to ensure we fix an underlying
> > problem we've had for a long time. I don't think fixing it will be easy,
> > I do think we need to though.
> > 
> > Also, the idea never was to have everyone using bleeding edge for
> > shipping products. This is what stable releases are for?
> 
> That's what stable releases are for, but I don't see a release for
> OE-core, do you? I see a poky release, but not an OE-core release.

As you are no doubt aware, that got discussed at the last TSC meeting.
Khem did volunteer to help with that, there is a branch there ready to
be tagged too and I was planning to raise progress with this at
tonight's TSC meeting.

Cheers,

Richard




