Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 0B04C6D2EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 17:44:23 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VjYI9-0002Dc-VY; Thu, 21 Nov 2013 18:44:17 +0100
Message-ID: <1385055824.15760.9.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 21 Nov 2013 17:43:44 +0000
In-Reply-To: <1385044552.16887.135.camel@ted>
References: <1385019198-24458-1-git-send-email-mark.hatle@windriver.com>
	<1385019198-24458-2-git-send-email-mark.hatle@windriver.com>
	<1385043945.23724.158.camel@phil-desktop.brightsign>
	<1385044552.16887.135.camel@ted>
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
	Content preview:  On Thu, 2013-11-21 at 14:35 +0000,
	Richard Purdie wrote: >
	I have to admit at this point, this may look better as an include file >
	along the lines of: > > SELECTED_OPTIMIZATION = "-O0" >
	SELECTED_OPTIMIZATION_pn-eglibc
	= "-O2" > SELECTED_OPTIMIZATION_pn-perf = "-O2" > > since clutter the
	recipes
	with anonymous python fragments isn't > particular desirable. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][dora][PATCH 1/2] perf: disallow debug optimization.
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
X-List-Received-Date: Thu, 21 Nov 2013 17:44:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-11-21 at 14:35 +0000, Richard Purdie wrote:
> I have to admit at this point, this may look better as an include file
> along the lines of:
> 
> SELECTED_OPTIMIZATION = "-O0"
> SELECTED_OPTIMIZATION_pn-eglibc = "-O2"
> SELECTED_OPTIMIZATION_pn-perf = "-O2"
> 
> since clutter the recipes with anonymous python fragments isn't
> particular desirable.

Right, exactly.  This is what I already do in my distro configuration to
deal with a similar situation involving -fasynchronous-unwind-tables and
it works fine. 

p.



