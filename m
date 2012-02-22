Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1S0EkU-0006Uu-1U
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 17:08:58 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1S0EcR-0007Ad-V8
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 17:00:40 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2012 16:00:38 +0000
In-Reply-To: <CAP9ODKp9uc7UajJYHNZ_QJ_R+YOXmPt_ZU2phHWFQvG-2CnOng@mail.gmail.com>
References: <cover.1329916583.git.liezhi.yang@windriver.com>
	<287F5295-D8E2-4540-A20D-28D934EAEA88@dominion.thruhere.net>
	<1329920131.20261.148.camel@ted>
	<9FF37BD6-73C7-4056-B38F-BCC8740C5A95@dominion.thruhere.net>
	<1329923198.20261.160.camel@ted>
	<CAP9ODKp9uc7UajJYHNZ_QJ_R+YOXmPt_ZU2phHWFQvG-2CnOng@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1329926439.14363.260.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 0/1] A script to clean obsolete sstate cache files
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
X-List-Received-Date: Wed, 22 Feb 2012 16:08:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-22 at 13:47 -0200, Otavio Salvador wrote:
> On Wed, Feb 22, 2012 at 13:06, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Or why can't people just cherry-pick the patch in, or apply the patch
> > manually? The latter is no different to people who just supply the
> > patches manually the the list with no corresponding git tree after all.
> 
> Because this mean to have and maintain a full clone of the repository
> and I don't want and I won't do that.

Applying the patch manually (either with "git am" or directly with
"patch") doesn't require you to have a copy of poky on hand.  That
doesn't seem like such a hardship, particularly given that the patch in
question here is just creating a single new file and doesn't touch any
existing content at all.

p.




