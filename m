Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 5367F6D665
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 22:38:48 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VgMbD-0007nZ-N5; Tue, 12 Nov 2013 23:38:46 +0100
Message-ID: <1384299445.3828.31.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 12 Nov 2013 23:37:25 +0000
In-Reply-To: <1384295428.6460.71.camel@ted>
References: <1383839993-21102-1-git-send-email-ml@communistcode.co.uk>
	<527C34A3.6050708@linux.intel.com>
	<52812C68.4020701@communistcode.co.uk>
	<52829660.4060507@linux.intel.com> <1384295428.6460.71.camel@ted>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
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
	Content preview:  On Tue, 2013-11-12 at 22:30 +0000,
	Richard Purdie wrote: >
	> + rm -rf ${S}/config.status ${S}/config.log ${S}/configure > >
	${S}/config.h ${S}/config.h.in~ > > of these,
	config.status should get overwritten by gnu-configize
	> (timestamp issue?), [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: Jack Mitchell <jmitchell@cbnl.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv4] libjson: update to 0.11 and rename to json-c
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
X-List-Received-Date: Tue, 12 Nov 2013 22:38:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-12 at 22:30 +0000, Richard Purdie wrote:
> > +       rm -rf ${S}/config.status ${S}/config.log ${S}/configure 
> > ${S}/config.h ${S}/config.h.in~
> 
> of these, config.status should get overwritten by gnu-configize
> (timestamp issue?), 

I don't think gnu-configize overwrites config.status.  Are you mixing it
up with config.sub?

> Equally, if you were doing out of tree builds, autoconf might detect
> that and error, maybe on the presence of config.log or config.h? 

The "already configured" error is triggered by the existence of
${S}/config.status.  So yes, this seems like a plausible theory.

p.



