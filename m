Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QocEK-0003Ml-EJ
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 16:15:28 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QocA8-0003uP-9P
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 16:11:08 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 03 Aug 2011 15:11:07 +0100
In-Reply-To: <201108031501.58796.paul.eggleton@linux.intel.com>
References: <cover.1312265186.git.dexuan.cui@intel.com>
	<1865303E0DED764181A9D882DEF65FB6B304414CE2@shsmsx502.ccr.corp.intel.com>
	<4E395235.9010709@linux.intel.com>
	<201108031501.58796.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312380668.4325.79.camel@phil-desktop>
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
X-List-Received-Date: Wed, 03 Aug 2011 14:15:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-03 at 15:01 +0100, Paul Eggleton wrote:
> On Wednesday 03 August 2011 14:50:45 Darren Hart wrote:
> > if [ "$BDIR" == "/" ]; then
> >         echo "ERROR: / is not supported as a build directory."
> >         exit 1
> > fi
> > BDIR=${BDIR%/}
> 
> Works fine here - the only thing I'd suggest is use "=" instead of "==" as I 
> think "==" is a bashism 

Yeah, it is.

>not that we support dash but we at least want the user to get past the
>setup script so they can get a proper error from sanity.bbclass).

Has anybody ever tried to quantify how much work would be involved in
making OE work within the constraints of POSIX sh (i.e. work with dash)?
It does seem fairly obnoxious/embarrassing that you're obliged to
make /bin/sh be bash on a systemwide basis; I can't think offhand of any
other piece of software I use that has this kind of requirement.

p.




