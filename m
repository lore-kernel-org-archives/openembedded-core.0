Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qf63I-0005Eq-AP for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 10:04:44 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1Qf5za-0006pa-8D
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 10:00:54 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1310080368.20015.855.camel@rex>
References: <cover.1310070283.git.nitin.a.kamble@intel.com>
	<629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
	<CAMKF1srHWhp36iNaMPKBbkBNBQSSWCb7fbULP9efAsg3r29J=A@mail.gmail.com>
	<1310080368.20015.855.camel@rex>
Date: Fri, 08 Jul 2011 09:00:48 +0100
Message-ID: <1310112048.18564.11.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/7] binutils: upgrade from 2.21 to 2.21.1
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
X-List-Received-Date: Fri, 08 Jul 2011 08:04:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 00:12 +0100, Richard Purdie wrote:
> On Thu, 2011-07-07 at 14:39 -0700, Khem Raj wrote:
> > How about changing the recipe to fetch from binutils-2_21-branch and
> > call it binutils 2.21 as it is
> 
> I don't really see the benefits in fetching this from the SCM?

Agreed, seems like fetching it from CVS will just make it slower and not
really buy us anything.  I think sticking with the tarballs is the right
answer here.

p.






