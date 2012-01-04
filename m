Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RiQ0L-0004on-PF
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 13:31:41 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1RiPtG-00029r-6I; Wed, 04 Jan 2012 13:24:22 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Date: Wed, 04 Jan 2012 12:24:21 +0000
In-Reply-To: <1325678787.3555.134.camel@ted>
References: <1325612539.28005.16.camel@phil-desktop>
	<1325678787.3555.134.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325679862.28005.44.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: weird exports in bitbake.conf
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
X-List-Received-Date: Wed, 04 Jan 2012 12:31:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 12:06 +0000, Richard Purdie wrote:
> On Tue, 2012-01-03 at 17:42 +0000, Phil Blundell wrote:
> > Does anybody know why these vars are exported (or, in the case of
> > STAGING_IDLDIR, there at all)?
> > 
> > export QMAKE_MKSPEC_PATH = "${STAGING_DATADIR_NATIVE}/qmake"
> > export STAGING_SIPDIR = "${STAGING_DATADIR_NATIVE}/sip"
> > export STAGING_IDLDIR = "${STAGING_DATADIR}/idl"
> 
> These are very old, I remember looking at them at various times but
> there was always something else to distract me. I'd be happy to take a
> patch removing them. If anything does break, there are better ways to
> fix it.

Okay, I'll send a patch for that presently.

There's also a bunch of historical Opie stuff which is currently getting
exported globally:

export QTDIR = "${STAGING_DIR_HOST}/qt2"
export QPEDIR = "${STAGING_DIR_HOST}"
export OPIEDIR = "${STAGING_DIR_HOST}"
export palmtopdir = "${libdir}/opie"
export palmqtdir = "${palmtopdir}"

Paul, do you know if these variables are still necessary, whether they
all need to be exported, and/or whether they could go in some opie class
rather than bitbake.conf?

p.




