Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id C1A4B7423D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 11:56:21 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZZdzA-0001kh-Cq; Wed, 09 Sep 2015 13:56:20 +0200
Message-ID: <1441799773.1680.102.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Nathan Rossi <nathan@nathanrossi.com>
Date: Wed, 09 Sep 2015 12:56:13 +0100
In-Reply-To: <1441791241-29328-1-git-send-email-nathan@nathanrossi.com>
References: <1441791241-29328-1-git-send-email-nathan@nathanrossi.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot.inc: Add host compiler flags and openssl-native dependency
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
X-List-Received-Date: Wed, 09 Sep 2015 11:56:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-09-09 at 19:34 +1000, Nathan Rossi wrote:
> Note: Only a few different board configurations use CONFIG_FIT_SIGNATURE,
> for 2015.07 this includes "ids8313", "am335x_boneback_vboot" as well as all the
> Xilinx Zynq boards.

Can you make the openssl dependency be a PACKAGECONFIG then (or, even
better, auto-detect it based on the actual configuration in use)?
Dragging it in for everyone doesn't seem all that great if the majority
of users don't actually need the feature.

p.



