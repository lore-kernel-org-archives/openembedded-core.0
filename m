Return-Path: <heinold@inf.fu-berlin.de>
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
	[130.133.4.66])
	by mail.openembedded.org (Postfix) with ESMTP id 663F16B26A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 14:53:34 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
	by outpost1.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1UzT6i-001biI-Ks>; Wed, 17 Jul 2013 16:53:32 +0200
Received: from g225147203.adsl.alicedsl.de ([92.225.147.203]
	helo=mail.zedat.fu-berlin.de)
	by inpost2.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-core@lists.openembedded.org with esmtpsa
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1UzT6h-001MUe-54>; Wed, 17 Jul 2013 16:53:32 +0200
Date: Wed, 17 Jul 2013 16:53:21 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <20130717145321.GA24542@mail.zedat.fu-berlin.de>
References: <cover.1374050133.git.sen.zhang@windriver.com>
	<c95d46b97c8167bddcffb4495438227b668e87cb.1374050133.git.sen.zhang@windriver.com>
	<1374057911.2651.118.camel@phil-desktop.brightsign>
	<CANyK_8fG5LJRBVzRQZG6BVbn-AjTgY0CMwStL47qgu0eVvMcig@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANyK_8fG5LJRBVzRQZG6BVbn-AjTgY0CMwStL47qgu0eVvMcig@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: 92.225.147.203
Subject: Re: [PATCH 2/2] libatomics-ops: force omit frame pointer for x86 builds
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
X-List-Received-Date: Wed, 17 Jul 2013 14:53:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 17, 2013 at 12:08:51PM +0100, Paul Barker wrote:
> On 17 July 2013 11:45, Phil Blundell <pb@pbcl.net> wrote:
> > On Wed, 2013-07-17 at 16:40 +0800, Jesse Zhang wrote:
> >> Fix failures when building with -fno-omit-frame-pointer (and without
> >> optimization, i.e. -O0):
> >>
> >>     In file included from atomic_ops.h:212:0,
> >>                      from atomic_ops_stack.h:32,
> >>                      from atomic_ops_stack.c:23:
> >>     atomic_ops/sysdeps/gcc/x86.h: In function 'AO_compare_double_and_swap_double_full':
> >>     atomic_ops/sysdeps/gcc/x86.h:148:3: error: 'asm' operand has impossible constraints
> >>        __asm__ __volatile__("xchg %%ebx,%6;" /* swap GOT ptr and new_val1 */
> >
> > This seems like it must be a bug in either GCC or the libatomic-ops
> > source code, and whichever one has the bug ought to be fixed.  Forcing
> > -fomit-frame-pointer might be ok as a temporary measure but it doesn't
> > seem like a very good long-term solution.
> >
> 
> If this is on x86, standard Linux desktop/server distros may have ran
> into the same problem. Maybe worth having a look if/how they handle
> this.

This makes we wonder which software on x86 relies on libatomic-ops anymore?
gcc buildins should be good enough now.

Bye Henning

