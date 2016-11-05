Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 19B3A71B0F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Nov 2016 00:01:45 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=tp13)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1c2oQZ-0006Hl-DJ; Sat, 05 Nov 2016 01:01:44 +0100
Message-ID: <1478304097.3662.25.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>, Li Zhou <li.zhou@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 05 Nov 2016 00:01:37 +0000
In-Reply-To: <3ceaa47d-7f30-4b0a-f554-eb193a10f82a@gmail.com>
References: <20161104090719.30795-1-li.zhou@windriver.com>
	<b3c8d5de-1d26-b37b-e28c-f8cca01c9ba3@gmail.com>
	<1478301288.3662.21.camel@pbcl.net>
	<3ceaa47d-7f30-4b0a-f554-eb193a10f82a@gmail.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Sat, 05 Nov 2016 00:01:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-11-04 at 16:55 -0700, Khem Raj wrote:
> 
> yes I meant <= v5, it should work usually, I am just thinking its a
> untested
> option, it may not be as bad as I think but some testing might be
> useful

Well, I admit I haven't looked at the actual code, but from the
comments in the patch I get the impression that it just causes db to
use the same code (i.e. pthread_mutex_xx) on ARM as it already was
doing on every other architecture.  I think it's safe to say that
pthread_mutex_lock() on ARM probably does work, otherwise any number of
programs would be broken, and db probably does work with
pthread_mutex_lock generically otherwise it would be broken on x86 and
so on.

You're right of course that this specific combination could do with
some testing but all in all it seems like a fairly low-risk change.

p.


