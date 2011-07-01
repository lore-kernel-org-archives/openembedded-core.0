Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcmGX-0008BY-3n for openembedded-core@lists.openembedded.org;
	Sat, 02 Jul 2011 00:32:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61MT3U1021709
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 23:29:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21610-03 for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2011 23:28:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61MSs2m021703
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 23:28:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309515892.2633.42.camel@phil-desktop>
References: <1309513280.2633.28.camel@phil-desktop>
	<1309515335.20015.516.camel@rex>
	<1309515892.2633.42.camel@phil-desktop>
Date: Fri, 01 Jul 2011 23:28:32 +0100
Message-ID: <1309559312.20015.564.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: PRIORITY
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
X-List-Received-Date: Fri, 01 Jul 2011 22:32:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 11:24 +0100, Phil Blundell wrote:
> On Fri, 2011-07-01 at 11:15 +0100, Richard Purdie wrote:
> > On Fri, 2011-07-01 at 10:41 +0100, Phil Blundell wrote:
> > > We had some discussion of this a few weeks ago but I'm not sure it ever
> > > reached a firm conclusion.
> > > 
> > > Is everyone agreed that the PRIORITY variable does not serve any useful
> > > purpose in oe-core and can/should be removed from the recipes?
> > 
> > I think that was the conclusion, yes. I'll take a patch (or a
> > commandline I guess).
> 
> I did:
> 
> $ find . -regex ".*\.\(bb\|inc\)$" | xargs sed -i '/^PRIORITY = ".*"$/d'
> 
> which seemed to produce the desired results.  I can send a patch if you
> like but it would be somewhat large and fairly uninteresting.

I've gone ahead and pushed such a commit, thanks!

Richard



