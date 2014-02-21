Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id D16ED6B89F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 21:20:50 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WGxWb-0001ic-2J; Fri, 21 Feb 2014 22:20:49 +0100
Message-ID: <1393017641.2640.21.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: David Nystrom <david.c.nystrom@gmail.com>
Date: Fri, 21 Feb 2014 21:20:41 +0000
In-Reply-To: <CAAKB1h2Etg6DixU6fpO79GEhkV1mu5noDuXdzrjE9NmrnmPKvw@mail.gmail.com>
References: <1392991017-3524-1-git-send-email-david.c.nystrom@gmail.com>
	<53079ABF.2090204@linux.intel.com>
	<CAAKB1h2Etg6DixU6fpO79GEhkV1mu5noDuXdzrjE9NmrnmPKvw@mail.gmail.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Fri, 2014-02-21 at 20:40 +0100,
	David Nystrom wrote: >
	Perhaps you know this already, but e500v2 is a cpu arch,
	same as > armv5.
	Is that really true? I thought e500v2 was an actual core and the
	equivalent architecture was Power v2.03 or something. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x264: SPE is not compatible with Altivec
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Feb 2014 21:20:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-02-21 at 20:40 +0100, David Nystrom wrote:
> Perhaps you know this already, but e500v2 is a cpu arch, same as
> armv5. 

Is that really true?  I thought e500v2 was an actual core and the
equivalent architecture was Power v2.03 or something.

>For future reference, should all ppc related CPU-arch specific stuff 
>be directed to the FSL bsp ?

Since we do ship tune-ppce500.inc in oe-core, I think it makes sense to
also include the overrides necessary to make compilation work with SPE
enabled.  It doesn't seem unreasonable that users would expect that the
recipes in oe-core would work with a configuration that comes as
standard.

However, adding overrides for e500v2 specifically does seem like a bad
plan since we will then end up having to duplicate the thing for every
other non-altivec configuration.  Can you come up with some override
that will apply to all SPE configurations, or failing that a patch for
the configure script that will disable the altivec assembler if it
notices that ${CC} is configured for SPE?

p.



