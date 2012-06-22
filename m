Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Si4xD-0004SZ-FK for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 16:35:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5MEOTKg002348;
	Fri, 22 Jun 2012 15:24:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01132-08; Fri, 22 Jun 2012 15:24:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5MEOLfI002340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 22 Jun 2012 15:24:21 +0100
Message-ID: <1340375063.394.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jun 2012 15:24:23 +0100
In-Reply-To: <25294393.hmh001VYMW@helios>
References: <alpine.DEB.2.02.1206210454080.17361@oneiric>
	<25294393.hmh001VYMW@helios>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: superfluous download locations in oe-core's bitbake.conf
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
X-List-Received-Date: Fri, 22 Jun 2012 14:35:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-22 at 14:34 +0100, Paul Eggleton wrote:
> On Thursday 21 June 2012 04:56:51 Robert P. J. Day wrote:
> >   given that oe-core is defined as being a really minimal
> > configuration with no extraneous cruft, there seems to be a number of
> > unnecessary download locations in the shipped bitbake.conf, things
> > like:
> > 
> > ADOBE_MIRROR =
> > FREEBSD_MIRROR =
> > 
> > and so on.  obviously, they're not doing any harm but there seems to
> > be little value in defining download locations that aren't used by
> > anything actually in oe-core.
> 
> These are present for largely historical reasons - namely in OE-Classic we had 
> a number of recipes needing this same mirror defined and it was deemed that it 
> was easier to edit it in one place if it needed to change. Some of them are 
> even completely useless now as the sites to which they point are now gone, 
> e.g. HANDHELDS_CVS.
> 
> I think the way to approach this would be to just submit a patch removing the 
> more extraneous ones and see if anyone complains. Note that some of them that 
> aren't used in OE-Core might be used within meta-oe or other OE community 
> layers, so those might need to stay at least for the time being.

Agreed, we should clean some of these up.

I would also add that we do have things in OE-Core without direct users
(at least by default), particularly things like classes but also
variables. OE-Core is a collaboration and where it makes sense to have
something defined in one location rather than in many, I'm not adverse
to that. Some of the mirror definitions do fit into that category.

Cheers,

Richard



