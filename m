Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 3F96676AC5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Sep 2015 20:45:42 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZYgon-0006Kq-6P; Sun, 06 Sep 2015 22:45:41 +0200
Message-ID: <1441572334.1680.77.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Sun, 06 Sep 2015 21:45:34 +0100
In-Reply-To: <55EA8F5B.408@dresearch-fe.de>
References: <55E949A4.9050805@dresearch-fe.de>
	<CAP71Wjzcr_ByLfCnAgQ3t2MYv+D88iTL5_VJ4Cdn23iAnyHfhg@mail.gmail.com>
	<55EA8F5B.408@dresearch-fe.de>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] "sub" machine types?
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
X-List-Received-Date: Sun, 06 Sep 2015 20:45:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2015-09-05 at 08:44 +0200, Steffen Sledz wrote:
> What we wish is one image containing one kernel and device tree files for each product.

If these devices all use the same kernel and the same rootfs then it
sounds like, as far as OE is concerned, they are the same MACHINE.  If
you need to build device trees and different bootloaders for particular
variants then you can do that easily enough with custom recipes.

p.



