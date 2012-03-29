Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDF9H-0000ko-Ir for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 15:12:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TD3EMA031534
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 14:03:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30304-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 14:03:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TD2tKO031508
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 14:02:59 +0100
Message-ID: <1333026175.17502.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Mar 2012 14:02:55 +0100
In-Reply-To: <20120329121646.GK4004@jama.jama.net>
References: <4b37a73d52ca39e73b4d8230269af5d9e2d88c52.1333001415.git.Martin.Jansa@gmail.com>
	<49e5bc38bdd5b01d3fb35b4d26a2d189ad2c2c44.1333001415.git.Martin.Jansa@gmail.com>
	<1333015547.14983.11.camel@ted> <20120329121646.GK4004@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] kernel.bbclass: unify white spaces
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
X-List-Received-Date: Thu, 29 Mar 2012 13:12:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-29 at 14:16 +0200, Martin Jansa wrote:
> On Thu, Mar 29, 2012 at 11:05:47AM +0100, Richard Purdie wrote:
> > On Thu, 2012-03-29 at 08:24 +0200, Martin Jansa wrote:
> > > * indentation was with spaces and tabs, unify to use tabs instead of
> > >   spaces, because "python populate_packages" expects tabs (or 8 spaces)
> > >   and we're doing populate_packages_preppend here
> > > 
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta/classes/kernel.bbclass |   38 +++++++++++++++++++-------------------
> > >  1 files changed, 19 insertions(+), 19 deletions(-)
> > 
> > FWIW, we're supposed to be using tabs for shell code and spaces (4) for
> > python. Unfortunately populate_package() is special due to the number of
> > places we append/prepend it and the need to be consistent with
> > whitespace.
> > 
> > I'm therefore not sure it makes sense to re-indent the anonymous python.
> 
> Agreed, but that anonymous python used spaces and tabs in the same
> function which is ugly.

I'm fine with cleaning that up but lets continue to use tabs for shell
and spaces for python where at all possible, then we're consistent :)

Cheers,

Richard



