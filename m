Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qp0tO-0006Ce-0a
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 18:35:30 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qp0pA-0004n8-LJ
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 18:31:08 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 04 Aug 2011 17:31:07 +0100
In-Reply-To: <4E3AC81E.9070709@linux.intel.com>
References: <1255C164-37B1-4DE1-B95D-7BA7D0E20A39@kernel.crashing.org>
	<1312474412.14274.15.camel@rex> <4E3AC81E.9070709@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312475468.6733.6.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: do_rootfs failure for core-image-sato on mpc8315e-rdb
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
X-List-Received-Date: Thu, 04 Aug 2011 16:35:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-04 at 09:26 -0700, Saul Wold wrote:
> On 08/04/2011 09:13 AM, Richard Purdie wrote:
> > Was this a recent build from scratch? I suspect Koen's recent icon
> > bbclass change and we probably need to ensure hicolor-icon-theme is
> > added do DEPENDS (instead of RDEPENDS like it used to be).
> >
> It seems it's pulled in by gtk-icons.bbclass as an RDEPENDS, should that 
> be changed?

If it's an RDEPENDS that's being injected from a python task (other
perhaps than an anonfunc that runs immediately after parsing), it needs
to go in DEPENDS as well.  It sounds as though that's the case here.

p.




