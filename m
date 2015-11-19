Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id B8A626010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 22:33:30 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZzXlj-0008W7-2V; Thu, 19 Nov 2015 23:33:31 +0100
Message-ID: <1447972404.4042.30.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Nov 2015 22:33:24 +0000
In-Reply-To: <9114985824d8abc4dc3e19a75dac51d3a5710264.1447952784.git.raj.khem@gmail.com>
References: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
	<9114985824d8abc4dc3e19a75dac51d3a5710264.1447952784.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/13] mtd-utils: Backport and create patches to support musl
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
X-List-Received-Date: Thu, 19 Nov 2015 22:33:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-11-19 at 17:10 +0000, Khem Raj wrote:
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 6 Oct 2015 23:51:34 +0000
> +Subject: [PATCH] Fix build with musl
> +
> +upstream status: Pending

I think that's meant to be "Upstream-Status".

Also, just as a general comment, this patch series adds quite a lot of
patches which are "Upstream-Status: Pending".  It'd be nice if the ones
that are suitable for upstreaming (which looks like it's most of them)
could be submitted there, and any inapplicable ones marked as such.

p.



