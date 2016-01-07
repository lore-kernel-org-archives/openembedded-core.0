Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id D63B16FFD8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 12:16:47 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:e23f:49ff:fe47:b7fd] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aH9Uj-0000lb-Rd; Thu, 07 Jan 2016 13:16:46 +0100
Message-ID: <1452169004.3116.29.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 07 Jan 2016 12:16:44 +0000
In-Reply-To: <228ce5dac7d96467f7165add45a39cfcd12c7bfc.1452152689.git.liezhi.yang@windriver.com>
References: <cover.1452152689.git.liezhi.yang@windriver.com>
	<228ce5dac7d96467f7165add45a39cfcd12c7bfc.1452152689.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] liberation-fonts: can't be allarch
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
X-List-Received-Date: Thu, 07 Jan 2016 12:16:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-01-06 at 23:45 -0800, Robert Yang wrote:
> liberation-fonts inherit fontcache which would depend on fontconfig, 
> and fontconfig is not allarch, so that liberation-fonts can't be
> allarch.

This doesn't make any sense.  I don't think allarch is, or ever has
been, contagious in that way.  There is no good reason I can think of
to require that all the dependencies of an allarch package should
themselves be allarch.  Indeed, if we did require this then it would
probably mean that virtually no packages could legitimately be allarch.

p.


