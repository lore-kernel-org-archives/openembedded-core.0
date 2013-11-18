Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD086D74F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 16:51:03 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1ViS21-0005BZ-RT; Mon, 18 Nov 2013 17:51:05 +0100
Message-ID: <1384793437.23724.51.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Robert Calhoun <rcalhoun@shotspotter.com>
Date: Mon, 18 Nov 2013 16:50:37 +0000
In-Reply-To: <CEAF8F07.1E9235%rcalhoun@shotspotter.com>
References: <CEAF8F07.1E9235%rcalhoun@shotspotter.com>
X-Mailer: Evolution 3.4.4-4+b1 
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
	Content preview:  On Mon, 2013-11-18 at 16:21 +0000,
	Robert Calhoun wrote: >
	From: Richard Purdie <richard.purdie@linuxfoundation.org> > > >opkg is
	in
	svn but its one of the few remaining > >components we use from svn. It
	means
	we have to build subversion-native > >which has a fairly long
	dependency
	chain. It would be nice if we didn't > >need to so is there any chance
	we
	can move opkg to git? > > I'm one of the great unwashed who still use
	subversion
	internally. For > these users, removing subversion SRC_URIs from oe-core
	will not remove the > need to build subversion-native. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg in svn?
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
X-List-Received-Date: Mon, 18 Nov 2013 16:51:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-11-18 at 16:21 +0000, Robert Calhoun wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> >opkg is in svn but its one of the few remaining
> >components we use from svn. It means we have to build subversion-native
> >which has a fairly long dependency chain. It would be nice if we didn't
> >need to so is there any chance we can move opkg to git?
> 
> I'm one of the great unwashed who still use subversion internally. For
> these users, removing subversion SRC_URIs from oe-core will not remove the
> need to build subversion-native.

True.  On the other hand, anybody who is enthusiastic enough about svn
to use it internally probably has a good enough copy on their system
already that they could add it to ASSUME_PROVIDED.

p.



