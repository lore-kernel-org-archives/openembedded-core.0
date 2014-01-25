Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id E098A6E7A5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2014 19:30:52 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1W78wM-0000yP-I6; Sat, 25 Jan 2014 20:30:50 +0100
Message-ID: <1390678245.24755.51.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Kang Kai <Kai.Kang@windriver.com>
Date: Sat, 25 Jan 2014 19:30:45 +0000
In-Reply-To: <52DF8A1E.9050306@windriver.com>
References: <1390360372-10947-1-git-send-email-kai.kang@windriver.com>
	<1390374490.24755.2.camel@e130.pbcl.net>
	<52DF8A1E.9050306@windriver.com>
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
	Content preview:  On Wed, 2014-01-22 at 17:06 +0800,
	Kang Kai wrote: > Use glib-dbg
	does work. But if I use it in a recipe, when uclibc is > used, I have to
	edit the recipe. Isn't that still true of "libc6-dbg"? Worse,
	it isn't even
	guaranteed that the eglibc-debug package will be named libc6-dbg on all
	targets; 
	it would probably end up as libc6.1-dbg on alpha-linux or ia64-linux
	for
	example. Encouraging people to hardcode "libc6" doesn't seem very
	wholesome. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc-dbg: provides libc6-dbg
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
X-List-Received-Date: Sat, 25 Jan 2014 19:30:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-01-22 at 17:06 +0800, Kang Kai wrote:
> Use glib-dbg does work. But if I use it in a recipe, when uclibc is
> used, I have to edit the recipe.

Isn't that still true of "libc6-dbg"?  Worse, it isn't even guaranteed
that the eglibc-debug package will be named libc6-dbg on all targets; it
would probably end up as libc6.1-dbg on alpha-linux or ia64-linux for
example.  Encouraging people to hardcode "libc6" doesn't seem very
wholesome.

p.



