Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id EF04D60821
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 10:17:14 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UoWUs-0002yL-KB; Mon, 17 Jun 2013 12:17:14 +0200
Message-ID: <1371464233.6580.3.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Qi.Chen@windriver.com
Date: Mon, 17 Jun 2013 11:17:13 +0100
In-Reply-To: <fd86333f362b5ce34f7d2f2e60d03a4477ff8eeb.1371447869.git.Qi.Chen@windriver.com>
References: <cover.1371447869.git.Qi.Chen@windriver.com>
	<fd86333f362b5ce34f7d2f2e60d03a4477ff8eeb.1371447869.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 9/9] tinylogin: remove recipe
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
X-List-Received-Date: Mon, 17 Jun 2013 10:17:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-06-17 at 13:49 +0800, Qi.Chen@windriver.com wrote:
> tinylogin has been deprecated and the functionality ported into busybox.
> We now use busybox as the login manager, so the tinylogin recipe could
> be deleted.

I'm not entirely sure who "we" is in this context, but the choice of
login manager has, historically, been a distro decision.  

Reading between the lines I assume what you're actually saying here is
that Poky has decided to switch from tinylogin to busybox, which
obviously is fine.  It's not entirely obvious to me that this is a very
compelling reason to remove tinylogin from oe-core, though equally I
guess there is no reason it couldn't live in some other layer instead.

p.



