Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcQv8-0004vR-Bz for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 01:45:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UNfZSn004346
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 00:41:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00360-08 for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2011 00:41:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UNfRm5004340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 00:41:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTim6Qvrc1K8788QMHCZArRvZ=MZ0WA@mail.gmail.com>
References: <cover.1309420894.git.raj.khem@gmail.com>
	<1309473020.20015.478.camel@rex>
	<BANLkTim6Qvrc1K8788QMHCZArRvZ=MZ0WA@mail.gmail.com>
Date: Fri, 01 Jul 2011 00:41:07 +0100
Message-ID: <1309477267.20015.501.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/6] uclibc config cleanup
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
X-List-Received-Date: Thu, 30 Jun 2011 23:45:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 16:36 -0700, Khem Raj wrote:
> On Thu, Jun 30, 2011 at 3:30 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2011-06-30 at 01:06 -0700, Khem Raj wrote:
> >> We do not need machine configs or even arch configs since we construct the bits
> >> in .inc files. Once anamoly is mips where we do not use default ARCH for o32
> >> which is mips1 but we use mips32 so thats the reason we have a separate config
> >> for mips.
> >>
> >> Additionally fix boot issue found on mips which were exposed by udev 171
> >>
> >> These patches have been tested with builds from scratch for all supported qemu machines
> >> and incrmental too (for qemumips)
> >> and angstrom/console-image is booted on all supported qemu machines
> >>
> >> The following changes since commit ae4c2b8834dc4d88be7207ea5c45c596bb46fded:
> >>
> >>   uclibc: Fix bug exposed by udev 168+ for mips architecture (2011-06-30 00:52:32 -0700)
> >>
> >> are available in the git repository at:
> >>   git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-cleanup
> >>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-cleanup
> >>
> >> Khem Raj (6):
> >>   uclibc: Remove redundant machine/arch configs
> >>   uclibc-config.inc: Fix regexp to determine big-endian arm
> >>   uclibc.inc: Use ARCH_WANTS_{LITTLE|BIG}_ENDIAN to denote endian
> >>   uclibc_git.bb: Untether UCLIBC_HAS_FPU from UCLIBC_HAS_FLOATS
> >>   uclibc: Add UCLIBC_HAS_FLOATS=y to uClibc.distro
> >>   uclibc: Fix bug exposed by udev 168+ for mips architecture
> >
> > Merged to master, thanks.
> 
> Hi Richard
> 
> Somehow first patch that got merged was older version I guess from the
> one I posted to ml
> before the pull request got in. So I have sent a follow up patch which
> adds the missing
> parts. The patch is here
> 
> http://patches.openembedded.org/patch/6769/
> 
> Please install

Sorry about that, I think things got confused. I've pulled the update,
thanks.

Richard



