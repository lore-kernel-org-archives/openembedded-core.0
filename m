Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 35F696A413
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 16:28:37 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UhMlJ-0006tC-W2; Tue, 28 May 2013 18:28:38 +0200
Message-ID: <1369758517.8846.20.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 28 May 2013 17:28:37 +0100
In-Reply-To: <CAP9ODKpzC7hM54OQ3dBQ5fBs5D5Fo=vawo1xWWA_wLKY8cPv-w@mail.gmail.com>
References: <1369753475-22573-1-git-send-email-otavio@ossystems.com.br>
	<1369753938.8846.8.camel@phil-desktop.brightsign>
	<CAP9ODKqkoXrrYSyQJzRxmDfBKnQWYMUoCV8dhRvHGm2Y-sXp7g@mail.gmail.com>
	<1369755098.8846.16.camel@phil-desktop.brightsign>
	<CAP9ODKpzC7hM54OQ3dBQ5fBs5D5Fo=vawo1xWWA_wLKY8cPv-w@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Add COMPATIBLE_DISTRO_FEATURES support
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
X-List-Received-Date: Tue, 28 May 2013 16:28:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-05-28 at 13:08 -0300, Otavio Salvador wrote:

> I dislike the 'required' my idea here was each item of the 'compat
> distro features' would be as an OR. Like
> 
> 
> COMPATIBLE_DISTRO_FEATURE = "x11 wayland"

Oh, right, I see.  Sorry, I misunderstood the intent of your original
patch.

Well, then, how about making each item be a regex and having:

REQUIRED_DISTRO_FEATURES = "x11|wayland qt|gtk"

or some such?

All that said, before spending too much more time debating the minutiae
of this particular feature, I'd kind of like to get a better
understanding of what problem it's actually solving.  How many recipes
would actually need to use this mechanism and why?

p.



