Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Tbesj-0001Mr-Pr
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 23:04:25 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1Tbef7-0003mN-2z; Thu, 22 Nov 2012 22:50:21 +0100
Message-ID: <1353621014.2000.16.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 22 Nov 2012 21:50:14 +0000
In-Reply-To: <1353620179.10459.59.camel@ted>
References: <1353620179.10459.59.camel@ted>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross: Explicitly depend on linux-libc-headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2012 22:04:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-11-22 at 21:36 +0000, Richard Purdie wrote:
> -DEPENDS = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc ${NATIVEDEPS}"
> +DEPENDS = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc linux-libc-headers ${NATIVEDEPS}"

gcc-cross isn't particularly specific to linux targets and ideally we
don't want to be adding more linuxisms to the recipe.  It is,
admittedly, not entirely obvious how we could conveniently get that
dependency added only for linux targets (since I don't think there's any
existing OVERRIDE that's helpful here) but perhaps we should find a way
to address that problem rather than just sticking it in unconditionally.

p.




