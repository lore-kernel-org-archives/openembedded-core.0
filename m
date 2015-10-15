Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id D6D877702A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 10:02:42 +0000 (UTC)
Received: from cpc5-cmbg17-2-0-cust97.5-4.cable.virginm.net ([86.30.112.98]
	helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZmfMw-0005Ad-5j; Thu, 15 Oct 2015 12:02:42 +0200
Message-ID: <1444903356.5251.58.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>, Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 15 Oct 2015 11:02:36 +0100
In-Reply-To: <4CDE18CB-CAC5-4BE6-9361-89750B612EB1@gmail.com>
References: <CAJ86T=U7+d4niZ=hLgQywS6utiL5YJqw1r0E-+_friceOMm4ZQ@mail.gmail.com>
	<4CDE18CB-CAC5-4BE6-9361-89750B612EB1@gmail.com>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: syslinux + gcc 5.2 build error
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
X-List-Received-Date: Thu, 15 Oct 2015 10:02:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2015-10-14 at 23:37 -0700, Khem Raj wrote:
> > On Oct 14, 2015, at 2:38 PM, Andre McCurdy <armccurdy@gmail.com>
> > wrote:
> > 
> > I'm seeing what looks like a gcc bug when building syslinux with
> > certain combinations of TUNE_CCARGS. A specific combination which
> > fails is:
> > 
> >  TUNE_CCARGS = " -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
> > -fschedule-insns”
> 
> 
> and why would you use -fschedule-insns on something like ia32 with so
> few general purpose regs
> at disposal ?

-fschedule-insns is enabled by default at -O2 anyway so I'm slightly
surprised that this is making a difference.  As far as I know it is
entirely reasonable to use that option on x86: there is still scope for
instruction reordering even though the number of GP regs is small.

> applying any insn schedule opts before machine registers are assigned
> may not always work.

I don't really understand this comment.  Are you saying that you think
only -fschedule-insns2 should be used, not -fschedule-insns?

p.


