Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T9lpQ-0005HT-Qo for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 01:49:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q86NbJ4t023544;
	Fri, 7 Sep 2012 00:37:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22770-08; Fri,  7 Sep 2012 00:37:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q86Nb9s7023538
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 7 Sep 2012 00:37:10 +0100
Message-ID: <1346974630.7493.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 07 Sep 2012 00:37:10 +0100
In-Reply-To: <20120906233413.GB3487@jama.jama.net>
References: <1346792317-26563-1-git-send-email-Martin.Jansa@gmail.com>
	<1346792317-26563-2-git-send-email-Martin.Jansa@gmail.com>
	<1346974199.7493.36.camel@ted> <20120906233413.GB3487@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] packagegroup-core-x11: split machine specific parts to separate recipe packagegroup-core-x11-server
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
X-List-Received-Date: Thu, 06 Sep 2012 23:49:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-07 at 01:34 +0200, Martin Jansa wrote:
> On Fri, Sep 07, 2012 at 12:29:59AM +0100, Richard Purdie wrote:
> > On Tue, 2012-09-04 at 22:58 +0200, Martin Jansa wrote:
> > > * add new packagegroup-core-x11-server to SIGGEN_EXCLUDERECIPES_ABISAFE,
> > >   so that recipes depending on it are not rebuilt after every machine
> > >   swtich
> > > * allows to remove task-x11-server and task-x11 from meta-oe without 
> > >   loosing any functionality
> > > * be carefull with default XSERVER value which does not have 
> > >   xf86-input-mouse and xf86-input-keyboard)
> > > * VIRTUAL-RUNTIME_xserver_common which defaults to x11-common in oe-core 
> > >   and xserver-common in meta-oe's task-x11
> > > 
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta/conf/layer.conf                               |  1 +
> > >  .../packagegroups/packagegroup-core-x11-xserver.bb | 24 ++++++++++++++++++++++
> > >  .../packagegroups/packagegroup-core-x11.bb         | 16 ++-------------
> > >  3 files changed, 27 insertions(+), 14 deletions(-)
> > >  create mode 100644 meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
> > 
> > This sneaked in with a load of other patches. I never meant to merge
> > this as I consider it broken.
> > 
> > Task packages are cheap and having them being machine specific imposes
> > little overhead. Splitting this into two just increases the parsing
> > overhead through the number of recipes and doesn't do much else since
> > there are still machine specific packages involved, all dependencies
> > still get built etc. so I really don't see the point of the added
> > complexity.
> 
> Yes task-* are cheap but if such recipe is in RDEPENDS of some other
> more expensive recipe then it's better when it's excluded from sstate.

Which expensive recipes RDEPEND on task/packagegroup recipes?

Cheers,

Richard



