Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8G9l-0003sx-Hf for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 20:43:57 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QIinXR008235; Mon, 26 Sep 2011 19:44:49 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hAoyVZespJ7Q; Mon, 26 Sep 2011 19:44:49 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QIigfY008230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 26 Sep 2011 19:44:43 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@beagleboard.org>
Date: Mon, 26 Sep 2011 19:38:18 +0100
In-Reply-To: <08AD80C4-64FE-47E9-ACAD-4E0141007113@dominion.thruhere.net>
References: <1316161201-769-1-git-send-email-koen@dominion.thruhere.net>
	<1316167797.25993.70.camel@ted> <20110916101935.GG7445@jama.jama.net>
	<1316170848.25993.71.camel@ted> <1316171181.3510.23.camel@phil-desktop>
	<1316180329.20858.26.camel@ted>
	<08AD80C4-64FE-47E9-ACAD-4E0141007113@dominion.thruhere.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317062305.26109.86.camel@ted>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 1/2] gstreamer: sync packaging with OE .dev
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
X-List-Received-Date: Mon, 26 Sep 2011 18:43:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-22 at 13:32 +0200, Koen Kooi wrote:
> Op 16 sep 2011, om 15:38 heeft Richard Purdie het volgende geschreven:
> 
> > On Fri, 2011-09-16 at 12:06 +0100, Phil Blundell wrote:
> >> On Fri, 2011-09-16 at 12:00 +0100, Richard Purdie wrote:
> >>> On Fri, 2011-09-16 at 12:19 +0200, Martin Jansa wrote:
> >>>> On Fri, Sep 16, 2011 at 11:09:49AM +0100, Richard Purdie wrote:
> >>>>> On Fri, 2011-09-16 at 10:20 +0200, Koen Kooi wrote:
> >>>>>> some text here
> >>>>>
> >>>>> It took all my restraint to not just reply with:
> >>>>> """
> >>>>> NAK
> >>>>>
> >>>>> <insert reason for NAK here, I can't be bothered to type it>
> >>>>> """
> >>>>>
> >>>>> We've been around in a few circles with this. The problem is  
> >>>>> that if we
> >>>>> apply this patch we have no clue which gst-plugin from the good,  
> >>>>> the bad
> >>>>> and the ugly provides something you're after to include in an  
> >>>>> image.
> >>>>> This results in bitbake being pretty clueless about whether a  
> >>>>> given
> >>>>> build will succeed or not. In general I'm not a fan of having
> >>>>> non-deterministic builds as they tend to annoy users.
> >>>>>
> >>>>> If this position isn't acceptable then we'll probably have to  
> >>>>> move to a
> >>>>> situation where we list which plugins each of the packages  
> >>>>> builds and
> >>>>> drop the dyanmic provides. That is a maintenance pain and I  
> >>>>> don't take
> >>>>> that step lightly but I don't see any other options. I'm open to
> >>>>> suggestions though.
> >>>>
> >>>> Something like:
> >>>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/031739.html
> >>>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/031740.html
> >>>> ?
> >>>
> >>> Yes. I'd probably have written separate .inc files to simplify the
> >>> script but I'm thinking along those lines. I'm not particularly  
> >>> happy
> >>> about it but I don't see many other options.
> >>
> >> Last time this issue came up we talked about simply merging the - 
> >> good,
> >> -bad and -base plugins into a single recipe (since there appears to  
> >> be
> >> no very compelling reason to keep them separate) and just leaving the
> >> -ugly ones on their own.  That still seems to me as though it is the
> >> best way of making a lot of that complexity just go away.  Then
> >> something like Martin's script could be used to figure out the  
> >> (mostly
> >> static, with a bit of luck) split between -ugly and the rest.
> >
> > When put like this it doesn't sound so attractive since you need the
> > scripts for ugly anyway. Keeping them separate does actually help  
> > build
> > time at least since the plugins are one of the last things to get  
> > built
> > and if merged, you also have to merge all the dependencies,  
> > compounding
> > the build time.
> 
> If someone can tell me which solution is preferred I can start working  
> on patches :)

I'm preferring the script generating the list of provides for the
gstreamer recipe...

Cheers,

Richard



