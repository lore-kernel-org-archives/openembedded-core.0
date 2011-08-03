Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QocS1-0003nc-BH
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 16:29:37 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QocNp-0003v7-79
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 16:25:17 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 03 Aug 2011 15:25:16 +0100
In-Reply-To: <201108031521.07596.paul.eggleton@linux.intel.com>
References: <cover.1312265186.git.dexuan.cui@intel.com>
	<201108031501.58796.paul.eggleton@linux.intel.com>
	<1312380668.4325.79.camel@phil-desktop>
	<201108031521.07596.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312381517.4325.83.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] oe-init-build-env, scripts/oe-buildenv-internal: add error detecting for $BDIR
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
X-List-Received-Date: Wed, 03 Aug 2011 14:29:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-03 at 15:21 +0100, Paul Eggleton wrote:
> On Wednesday 03 August 2011 15:11:07 Phil Blundell wrote:
> > Has anybody ever tried to quantify how much work would be involved in
> > making OE work within the constraints of POSIX sh (i.e. work with dash)?
> > It does seem fairly obnoxious/embarrassing that you're obliged to
> > make /bin/sh be bash on a systemwide basis; I can't think offhand of any
> > other piece of software I use that has this kind of requirement.
> 
> Would that not entail fixing everything we build that contains shell scripts 
> with bashisms that claim "#!/bin/sh"?

Yes, but anything that builds on current Ubuntu (etc) will presumably be
OK in that respect, and any shell scripts which are installed on the
target ought to be getting fixed anyway since bash is unlikely to be
available there.  If you assume that those two groups of things are
going to have to be solved anyway (by someone) then it isn't obvious to
me that the remaining problem set will be all that large.

If it were to become a real issue then one could write a class which
searched for shell scripts inside ${S} and reprocessed them to use
#!/bin/bash, or alternatively write an LD_PRELOAD sort of shim to detect
such scripts at exec() time and redirect them to bash rather than sh.

p.




