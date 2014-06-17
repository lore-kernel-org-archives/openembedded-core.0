Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 5D6436FFD0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 13:18:43 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WwtHf-0001Vl-AH; Tue, 17 Jun 2014 15:18:43 +0200
Message-ID: <1403011121.15037.82.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Tue, 17 Jun 2014 14:18:41 +0100
In-Reply-To: <5258152.VaR4PfleNb@peggleto-mobl5.ger.corp.intel.com>
References: <1402013345-24930-1-git-send-email-sgw@linux.intel.com>
	<53971878.5090300@linux.intel.com>
	<1402411999.28622.3.camel@phil-desktop.brightsign>
	<5258152.VaR4PfleNb@peggleto-mobl5.ger.corp.intel.com>
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
	Content preview:  On Mon, 2014-06-16 at 15:47 +0100,
	Paul Eggleton wrote: >
	a) There are a bunch of recipes that don't currently do that,
	and you'll only
	> find out there's a problem at do_rootfs time (or worse,
	if we went a step
	> further and didn't even dynamically add the RDEPENDS,
	at runtime when the > service fails to start). [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] update-rc.d/useradd: Add additional dependecies
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
X-List-Received-Date: Tue, 17 Jun 2014 13:18:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-06-16 at 15:47 +0100, Paul Eggleton wrote:
> a) There are a bunch of recipes that don't currently do that, and you'll only 
> find out there's a problem at do_rootfs time (or worse, if we went a step 
> further and didn't even dynamically add the RDEPENDS, at runtime when the 
> service fails to start).

Ah, true.  It doesn't seem that it should be beyond the wit of man to
add a QA check for that, though.

p.



