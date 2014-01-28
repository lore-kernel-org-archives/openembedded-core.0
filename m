Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 7E5E36E6F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 09:20:08 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1W84py-0003z2-Vy; Tue, 28 Jan 2014 10:20:07 +0100
Message-ID: <1390900799.3068.5.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Tue, 28 Jan 2014 09:19:59 +0000
In-Reply-To: <1413594.S4HepKQVoQ@peggleto-mobl5.ger.corp.intel.com>
References: <1390479065-24299-1-git-send-email-otavio@ossystems.com.br>
	<52E6D52D.4070908@windriver.com>
	<1413594.S4HepKQVoQ@peggleto-mobl5.ger.corp.intel.com>
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
	Content preview:  On Tue, 2014-01-28 at 08:59 +0000,
	Paul Eggleton wrote: >
	So I think this is mostly a good change, however,
	we don't want those -> if > the file isn't a symlink. Otavio,
	can you fix that? Isn't that what the
	sed 's/ -> $//' in the original patch is dealing with? [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory.bbclass: Improve robustness in image file listing
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
X-List-Received-Date: Tue, 28 Jan 2014 09:20:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-01-28 at 08:59 +0000, Paul Eggleton wrote:
> So I think this is mostly a good change, however, we don't want those -> if 
> the file isn't a symlink. Otavio, can you fix that?

Isn't that what the sed 's/ -> $//' in the original patch is dealing
with?

p.



