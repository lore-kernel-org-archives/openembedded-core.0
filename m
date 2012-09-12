Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TBm4T-0002eC-0y for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 14:29:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CCGxJO019389;
	Wed, 12 Sep 2012 13:16:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19128-01; Wed, 12 Sep 2012 13:16:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CCGo73019383
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 12 Sep 2012 13:16:52 +0100
Message-ID: <1347452212.11710.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Date: Wed, 12 Sep 2012 13:16:52 +0100
In-Reply-To: <50507778.3000208@mentor.com>
References: <1347444916.2122.101.camel@ted> <50507778.3000208@mentor.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Feature Developement vs. Stablisation and Bug fixing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 12:29:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-12 at 14:52 +0300, Vladimir Zapolskiy wrote:
> Hi Richard,
> 
> On 12.09.2012 13:15, Richard Purdie wrote:
> > Hi,
> >
> > I know in the past this has taken some people by surprise. Both OE-Core
> > and the Yocto Project are aiming at release points every six months,
> > roughly October and April. In order to prepare for those there is a
> > period of 6-8 weeks beforehand which is aimed at stabilisation and bug
> > fixing.
> >
> > We are now entering that window where we need to heavily taper off new
> > features and concentrate on the quality and stability of the release
> > which is scheduled for mid October. I'm not saying no new feature
> > patches will get taken but I will be asking questions like "why is this
> > being worked on?" and "shouldn't this wait until after release?". I'd
> > really like to see effort being focused on bugs now, not enhancements.
> >
> > I know there are a couple of things which have been worked on for a
> > while and have been slightly delayed which I'd probably lean towards
> > taking (some offline postinstall work spring to mind). I was asked
> > whether I'd take a binutils update in a couple of weeks and the answer
> > is no, I'd very likely not as we're at the point we need to lock in on
> > the toolchain now (and major kernel version).
> >
> > Does anyone have any questions?
> >
> 
> do you expect to have a filed bug in Yocto's bugzilla to attract attention
> to a problem, or published patchset with problem description and a fix is
> sufficient?

It doesn't have to have a bug number to be a fix to a valid problem so
as long as the problem is described in the patchset, that should be ok.

Cheers,

Richard



