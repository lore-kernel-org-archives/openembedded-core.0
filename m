Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TOWqK-00010s-Ri
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 18:51:41 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TOWdU-0001cA-6b; Wed, 17 Oct 2012 18:38:24 +0200
From: Phil Blundell <philb@gnu.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Oct 2012 17:38:23 +0100
In-Reply-To: <CAJTo0Lb2gv_VJ5jzbfCcebkhUpgDVR-MsGq_74c1_SPJph_OpA@mail.gmail.com>
References: <1350481324.3259.185.camel@phil-desktop>
	<CAJTo0Lb2gv_VJ5jzbfCcebkhUpgDVR-MsGq_74c1_SPJph_OpA@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1350491904.3259.212.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] autotools: Don't install .la files if the distro doesn't want them
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
X-List-Received-Date: Wed, 17 Oct 2012 16:51:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-17 at 14:47 +0100, Burton, Ross wrote:
> On 17 October 2012 14:42, Phil Blundell <philb@gnu.org> wrote:
> > Also, perform at least a perfunctory cleaning of unified build directories
> > when reconfiguring since many packages don't have the right dependency
> > rules to cause a recompile when this happens.  Making distclean is not
> > practical since many packages either don't support it at all, or remove
> > too much (e.g. polkit blows away its documentation which causes the
> > subsequent license check to fail).
> 
> Would you consider splitting this into a separate commit?

Yes, no problem.

p.




