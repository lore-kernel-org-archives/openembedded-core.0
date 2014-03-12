Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id B83076E36F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 17:37:34 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WNn5y-00073s-9O; Wed, 12 Mar 2014 18:37:34 +0100
Message-ID: <1394645853.6805.214.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Wed, 12 Mar 2014 17:37:33 +0000
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B18163B@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B18163B@post.tritech.se>
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software, running on the system "hetzner.pbcl.net", has
 identified this incoming email as possible spam.  The original message
 has been attached to this so you can view it (if it isn't spam) or label
 similar future email.  If you have any questions, see
 @@CONTACT_ADDRESS@@ for details.
 
 Content preview:  On Wed, 2014-03-12 at 15:30 +0000, Mats Kärrman wrote: >
   Does anyone know if this is a known "feature" of eglibc or know any other
   reason > for this difference? Does eglibc's own libm testsuite pass on your
    platform? I wonder if oe-core is accidentally building eglibc without "big"
    libm for you, or something like that. Might be worth checking your option-groups.config
    to make sure. [...] 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: libm accuracy, eglibc compared to glibc
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
X-List-Received-Date: Wed, 12 Mar 2014 17:37:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2014-03-12 at 15:30 +0000, Mats Kärrman wrote:
> Does anyone know if this is a known "feature" of eglibc or know any other reason
> for this difference?

Does eglibc's own libm testsuite pass on your platform?  I wonder if
oe-core is accidentally building eglibc without "big" libm for you, or
something like that.  Might be worth checking your option-groups.config
to make sure.

p.



