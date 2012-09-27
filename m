Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1THLie-00029I-6e
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 23:34:04 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1THLWD-0008DS-Us; Thu, 27 Sep 2012 23:21:14 +0200
Message-ID: <1348780727.4422.12.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 27 Sep 2012 22:18:47 +0100
In-Reply-To: <1348480442.4486.3.camel@ted>
References: <1348467993.4444.252.camel@x121e.pbcl.net>
	<1348476693.10108.221.camel@ted>
	<1348479655.31293.19.camel@phil-desktop>
	<1348480442.4486.3.camel@ted>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] staging: Avoid staging the same binaries again and again
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
X-List-Received-Date: Thu, 27 Sep 2012 21:34:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-24 at 10:54 +0100, Richard Purdie wrote:
> sysroot_stage_* are symmetrical so I can't imagine this happening.
> 
> The main worry would be something happening before sysroot_stage_all.
> SYSROOT_PREPROCESS_FUNCS happen afterwards so there is at least a hook
> used in most cases that would avoid the issue.
> 
> I'm torn whether its better to be simple or less fragile in this case.
> Or simply do some tests (if ${bindir} != ${sbindir}) and so on.

I'm not quite sure what the conclusion was from this previous
discussion.  Did you want me to redo the patch to work in some other
way?

p.



