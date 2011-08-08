Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QqRJT-0007oa-E9 for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 17:00:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78EtqRc003546
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 15:55:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03344-02 for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2011 15:55:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78Etk9F003540
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 15:55:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <F410F4D8-44AB-45D2-9DB5-1122C8F47077@kernel.crashing.org>
References: <F410F4D8-44AB-45D2-9DB5-1122C8F47077@kernel.crashing.org>
Date: Mon, 08 Aug 2011 15:55:14 +0100
Message-ID: <1312815314.14274.213.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: how to pass or set specific gcc flags?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2011 15:00:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-08-07 at 12:08 -0500, Kumar Gala wrote:
> We'd like to pass:
> 
> --enable-targets=all
> 
> on ppc when we target a 64-bit platform but happen to build a 32-bit
> toolchain & rootfs, its useful to still have 64-bit support in the
> compiler to build a 64-bit kernel if desired in this scenario.  Also,
> this seems useful for the multilib situation.
> 
> Wondering what the best way of doing this.  Adding something into the
> tune-ppcFOOBAR file but not sure how to do that so it gets picked up
> by the right toolchain pass.  And what do we even override?  I
> suggested adding a GCC_EXTRA_OECONF.

I'd caution against this since we don't currently handle packaging of
toolchains directly using multilibs and I suspect the compiler wouldn't
bootstrap properly either.

Its not the compiler itself I worry about but pieces like libc and
libgcc.

Cheers,

Richard



