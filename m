Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAVd3-0006aO-NC for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 01:11:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2M02qNM007821
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 00:02:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07350-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 00:02:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2M02fZn007815
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 00:02:42 GMT
Message-ID: <1332374564.9740.228.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Mar 2012 00:02:44 +0000
In-Reply-To: <20120321235049.GA4010@jama.jama.net>
References: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
	<f21ffad75e377042ebb9d59a01d6b424c6bba711.1332365336.git.Martin.Jansa@gmail.com>
	<1332371476.9740.218.camel@ted> <20120321235049.GA4010@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 06/13] gtk+: import native support from meta-oe
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
X-List-Received-Date: Thu, 22 Mar 2012 00:11:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-22 at 00:50 +0100, Martin Jansa wrote:
> On Wed, Mar 21, 2012 at 11:11:16PM +0000, Richard Purdie wrote:
> > On Wed, 2012-03-21 at 22:36 +0100, Martin Jansa wrote:
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta/recipes-gnome/gtk+/gtk+.inc |    4 ++++
> > >  1 files changed, 4 insertions(+), 0 deletions(-)
> > 
> > I really don't like the message having a gtk+-native around sends out.
> > Why do we need this?
> 
> See cover letter if you haven't already.

Sorry, I'd looked at it but I'd missed the key bit. I think I thought
the URL was a pull URL and my eyes skimmed it.

To be honest I don't think the update-icon-cache is good enough reason
to build a full gtk+-native. If we let these pieces in the dependencies
have a tendency to grow and people have no incentive to try and fix
these issues.

I'd like to better understand why there is no other way to avoid this.

Cheers,

Richard





