Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id AF7A2755F4;
	Thu, 29 Oct 2015 16:45:25 +0000 (UTC)
Received: from [2a00:14f0:e04c:1:e23f:49ff:fe47:b7fd] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZrqKJ-0005xM-NT; Thu, 29 Oct 2015 17:45:24 +0100
Message-ID: <1446137120.5251.111.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-devel@lists.openembedded.org, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Oct 2015 16:45:20 +0000
In-Reply-To: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
References: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Subject: Re: [oe] State of libcs in OE-Core glibc/uclibc/musl
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
X-List-Received-Date: Thu, 29 Oct 2015 16:45:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-10-29 at 08:42 -0700, Khem Raj wrote:

> I would like to make a proposal for 2.1 release where
> 
> 1. Drop kconfig support in glibc and we become inline with upstream
> 2. Move musl support to OE-Core from meta-musl
> 3. Drop uclibc or leave it in current broken state, I would like to
> pull it out into a layer in meta-openembedded and we can leave the
> core plumbing as it is in OE-Core
> 4. Poky-tiny switches to use musl

I have no opinion on point 4, but the first three things sound like an
excellent plan to me.

p.


