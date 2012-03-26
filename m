Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SCIMK-00089J-J0 for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 00:25:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QMGq0i001569
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 23:16:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32762-10 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 23:16:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QMGhjf001563
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 23:16:44 +0100
Message-ID: <1332800203.28414.142.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Mar 2012 23:16:43 +0100
In-Reply-To: <20120326203256.GB3368@denix.org>
References: <CA+b4E8yygK0_d1YkXn3_DdbkOb-L6-8pC1h9ojVTi3m8UasRzg@mail.gmail.com>
	<20120326203256.GB3368@denix.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Stable release of oe-core
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
X-List-Received-Date: Mon, 26 Mar 2012 22:25:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-03-26 at 16:32 -0400, Denys Dmytriyenko wrote:
> On Mon, Mar 26, 2012 at 04:25:19PM -0400, Brandon Stafford wrote:
> > Hi all,
> > 
> > I don't see an RC branch or anything like that in the git repo. I'm
> > about to make the leap from the oe classic 2011.03-maintenance branch
> > to oe-core, so I'm trying to figure out the right place to land.
> > 
> > In the March 13, 2012, OE TSC minutes, I noticed this text:
> >   c. oe-core release
> >       feature freeze in 1 week
> >       final freeze 2-3 weeks from 18 Mar
> > 
> > Do I just need a little patience?
> 
> Correct, OE-Core (and some other layers) follows the 6-month release schedule of
> the Yocto Project (which is October and April) that is getting ready for v1.2:
> 
> http://www.yoctoproject.org/blogs/davest/2012/progress-yocto-project-v1.2

We're due a -rc1 right around now, the deadline was actually midnight
Sunday but I'm still trying to sort out various patches.

We've also not branched yet as if we do, people tend to start developing
against master and I'd like to focus people on the stabilisation, at
least for a short while :).

Cheers,

Richard




