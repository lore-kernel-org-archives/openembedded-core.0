Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id B95CE60118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 16:41:01 +0000 (UTC)
Received: from [2a00:14f0:e04c:1:e23f:49ff:fe47:b7fd] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1Zz5n3-0007F1-S1; Wed, 18 Nov 2015 17:41:02 +0100
Message-ID: <1447864860.1472.56.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 16:41:00 +0000
In-Reply-To: <d077573772d921ef2b26426ad0c434e02dcb1124.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
	<d077573772d921ef2b26426ad0c434e02dcb1124.1447757562.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Subject: Re: [PATCHv2 12/16] feature-arm-vfp.inc: respect vfpv4 when setting -mfloat-abi and ARMPKGSFX_EABI
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
X-List-Received-Date: Wed, 18 Nov 2015 16:41:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-11-17 at 11:58 +0100, Martin Jansa wrote:
> * without this change it wasn't possible to use call-convention hard
>   together with vfpv4
> * also use ' inside quoted values

Can you send those as two separate patches?  It is hard enough to read
the tune files without going cross-eyed at the best of times, and
having to play the game of guessing which lines are just quoting fixes
and which ones actually contain semantic changes makes a difficult task
even worse.

thanks

p.


