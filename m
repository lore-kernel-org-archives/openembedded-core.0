Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 7796460F21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 20:53:02 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VLfn4-0003ea-Lj; Mon, 16 Sep 2013 22:53:02 +0200
Message-ID: <1379364756.4770.20.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Sep 2013 21:52:36 +0100
In-Reply-To: <CAMKF1srExVG5j4t+LdSnD3cJNJftNmykhUCRBz9wXQrv6-qH9w@mail.gmail.com>
References: <1379071094.3484.245.camel@ted>
	<CAMKF1so0f+8uJnqTxK0b+gkhhQAcjsAsVYZp8E_V5pEiL1heuQ@mail.gmail.com>
	<1379143167.4071.100.camel@x121e.pbcl.net>
	<CAMKF1srExVG5j4t+LdSnD3cJNJftNmykhUCRBz9wXQrv6-qH9w@mail.gmail.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: Add big warning about antisocial behaviour
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
X-List-Received-Date: Mon, 16 Sep 2013 20:53:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-09-16 at 09:24 -0700, Khem Raj wrote:
> On Sat, Sep 14, 2013 at 12:19 AM, Phil Blundell <pb@pbcl.net> wrote:
> > On Fri, 2013-09-13 at 21:24 -0700, Khem Raj wrote:
> >> There are cases where we have bsps with 2.6.3x kernels and libc
> >> compiled against 3.10 assumes syscalls
> >
> > That is a bug in glibc.  It should not be doing that unless configured
> > --enable-kernel=3.10.x (and this is the whole point of the
> > --enable-kernel option).  If it's assuming 3.10.x syscalls under
> > --enable-kernel=2.6.x then it is broken and should be fixed.
> >
> 
> we have OLDEST_KERNEL = "2.6.16" and thats not a problem. However one
> case where it showed up was when building udev > 164 with kernels
> where accept4 call was not wired for arm e.g. since udev looked up
> definition of SOCK_CLOEXEC which it found but that 2.6.32 kernel
> really did not support it.

That sounds slightly different to the problem you were originally
describing ("libc compiled against 3.10") but I think the answer is
basically still the same: it is a bug in udev, and udev ought to be
fixed.

p.



