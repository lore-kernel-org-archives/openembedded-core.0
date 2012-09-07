Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TA2Lf-0003rU-1b
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 19:28:07 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TA29f-0006N9-1J; Fri, 07 Sep 2012 19:15:43 +0200
From: Phil Blundell <philb@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 07 Sep 2012 18:15:36 +0100
In-Reply-To: <1347037772.8619.24.camel@ted>
References: <1347033943.8619.0.camel@ted> <504A21A5.7000309@windriver.com>
	<CAJTo0LYnG1BdZ=UkKPWju7UwBZWjEJhQ_svmO4bVwaSL1ZGGkA@mail.gmail.com>
	<1347037772.8619.24.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1347038143.2673.226.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a distclean when reconfiguring
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
X-List-Received-Date: Fri, 07 Sep 2012 17:28:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-07 at 18:09 +0100, Richard Purdie wrote:
> The key places people get bitten are eglibc and gcc so those should be
> straight forward to test, the question is how widely to deploy this
> initially. I think the mechanism is good, its now just a question of the
> implementation detail.

Eglibc and gcc, at least, support building with ${B} != ${S} so it might
be easier/quicker to just blow away the whole ${B} tree rather than
trying to distclean it.

I imagine that most modern-ish autotools-based packages will also build
fine in that configuration, though there are bound to be some that
don't.  It's hard to say whether there are likely to be more or fewer of
those than there are ones where "make distclean" fails.

p.




