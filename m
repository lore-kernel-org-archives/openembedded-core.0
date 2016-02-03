Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id EE072771B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 20:58:06 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aR4V4-0004Cn-B2; Wed, 03 Feb 2016 21:58:06 +0100
Message-ID: <1454533078.7421.57.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 03 Feb 2016 20:57:58 +0000
In-Reply-To: <CAMKF1sqevO99mD2V1xxZEa7--LX9vctuFebLc59fOej3xnjkhA@mail.gmail.com>
References: <56B0AE88.3090103@siemens.com> <1454446338.7421.45.camel@pbcl.net>
	<46DD8494-2C7E-44B8-8793-12228FD56738@gmail.com>
	<1454532510.7421.54.camel@pbcl.net>
	<CAMKF1sqevO99mD2V1xxZEa7--LX9vctuFebLc59fOej3xnjkhA@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Default value for FULL_OPTIMIZATION
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
X-List-Received-Date: Wed, 03 Feb 2016 20:58:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-02-03 at 12:51 -0800, Khem Raj wrote:
> On Wed, Feb 3, 2016 at 12:48 PM, Phil Blundell <pb@pbcl.net> wrote:
> > On Tue, 2016-02-02 at 22:17 -0800, Khem Raj wrote:
> >> -pipe does speed up build time so its an optimization.
> >
> > How much does it really speed it up by?  I seem to recall the effect was
> > fairly negligible, but maybe I am remembering that wrong.
> 
> it does not create files for intermediate objects so if you have slow
> media it can be significant
> but if you have SSDs then it might be diminished.

The files go in /tmp though, right?  Even if that isn't a tmpfs, which I
think it is on almost all systems nowadays, they will almost certainly
just sit in the buffer cache and never actually get written to the
disk. 

p.



