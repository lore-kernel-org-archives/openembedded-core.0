Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SojMJ-0001hT-Ku
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 00:56:43 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SojBW-0004Zr-Fx
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 00:45:34 +0200
Message-ID: <1341960238.2786.103.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 23:43:58 +0100
In-Reply-To: <CAK18fxH2w_0hSQscbm6sad-a+=kk2eyQkOtJLMnsZRe8jaf8KA@mail.gmail.com>
References: <9403579097d0430a5ce2cd3bb23925fe25917a0b.1341932186.git.andrei@gherzan.ro>
	<d7e0c2813e4002b9dfd8e2d681b93da9ddc5870f.1341932186.git.andrei@gherzan.ro>
	<1341936154.1294.3.camel@ted>
	<CAK18fxFDoHEpzDnVwJLdPHKL48Qo7ZuwnJsQDE78U6fbcULjKw@mail.gmail.com>
	<CAK18fxH2w_0hSQscbm6sad-a+=kk2eyQkOtJLMnsZRe8jaf8KA@mail.gmail.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 5/5] busybox.inc: Install hwclock init script only if rtc is present in MACHINE_FEATURES
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
X-List-Received-Date: Tue, 10 Jul 2012 22:56:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-11 at 01:15 +0300, Andrei Gherzan wrote:
> And to move a little further, busybox should be configured with
> CONFIG_HWCLOCK=y only if it makes sense for that MACHINE. In my
> opinion this is machine specific. 

That's a DISTRO decision.  I suspect most that have binary feeds would
prefer to have a single busybox binary per architecture, and accept the
few wasted bytes on machines without RTC, than to make it MACHINE
specific and end up building it multiple times.

Anyway, such policy belongs in your distro layer and not in oe-core.

p.





