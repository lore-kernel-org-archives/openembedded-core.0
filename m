Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QlkPR-0000Km-H2 for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 18:23:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QGInit023065
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 17:18:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22177-10 for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 17:18:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QGIfx0023059
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 17:18:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <627CF4AB-F07D-4285-B31C-3C5631270420@kernel.crashing.org>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
	<969FA904-0086-42FA-B605-07B74FB728B4@kernel.crashing.org>
	<1311688752.2344.238.camel@rex>
	<627CF4AB-F07D-4285-B31C-3C5631270420@kernel.crashing.org>
Date: Tue, 26 Jul 2011 17:18:33 +0100
Message-ID: <1311697113.2344.268.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/3] Add basic PowerPC core tune config
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
X-List-Received-Date: Tue, 26 Jul 2011 16:23:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-26 at 10:22 -0500, Kumar Gala wrote:
> On Jul 26, 2011, at 8:59 AM, Richard Purdie wrote:
> 
> > On Tue, 2011-07-26 at 08:47 -0500, Kumar Gala wrote:
> >> On Jul 26, 2011, at 7:44 AM, Richard Purdie wrote:
> >> 
> >>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>> ---
> >>> meta/conf/machine/include/powerpc/arch-powerpc.inc |   45 +++++++++++++++++++-
> >>> meta/conf/machine/include/tune-ppc603e.inc         |   12 ++++-
> >>> meta/conf/machine/include/tune-ppce300c2.inc       |   12 ++++-
> >>> meta/conf/machine/include/tune-ppce500.inc         |   13 ++++--
> >>> meta/conf/machine/include/tune-ppce500mc.inc       |   12 ++++-
> >>> meta/conf/machine/include/tune-ppce500v2.inc       |   12 ++++-
> >>> 6 files changed, 88 insertions(+), 18 deletions(-)
> >> 
> >> One thing I'm wondering about as we do this is the ability to pass
> >> --with-cpu to gcc & [e]glibc configure to pickup proper optimized cfgs
> >> & libs for a given target.
> > 
> > As far as I can tell, gcc 4.x has no --with-cpu option. We pass the
> > correct march and mtune options to the compiler at runtime through
> > CFLAGS and friends.
> 
> Hmm, gcc still supports this:
> 
> http://gcc.gnu.org/install/configure.html
> 
> --with-cpu=cpu
> --with-cpu-32=cpu
> --with-cpu-64=cpu
> Specify which cpu variant the compiler should generate code for by default. cpu will be used as the default value of the -mcpu= switch. This option is only supported on some targets, including ARM, i386, M68k, PowerPC, and SPARC. The --with-cpu-32 and --with-cpu-64 options specify separate default CPUs for 32-bit and 64-bit modes; these options are only supported for i386, x86-64 and PowerPC. 
> 
> http://gcc.gnu.org/install/specific.html
> 
> powerpc-*-*
> You can specify a default version for the -mcpu=cpu_type switch by using the configure option --with-cpu-cpu_type.

I couldn't find that looking at the configure script :/.

Anyhow, according to that page, its to "Specify which cpu variant the
compiler should generate code for by default. cpu will be used as the
default value of the -mcpu= switch". Since we always specify -mcpu when
needed, I don't believe this is an issue for us as far as the build
system goes.

If you're talking about the gcc we build for the target, we should
really encode all the cpu/tune options in there, not just part of the
config so again, I don't think its appropriate to the way we use gcc.

> > You're already found the way to pass configuration to *libc using values
> > in TARGET_FPU to pickup the right configuration.
> > 
> > Is there a use case we're missing?
> 
> Yes, for [e]glibc we have optimized libc functions for a given /
> specific PPC processor.  So we need someway to tell configure this.

I'd do this by looking for flags in TUNE_FEATURES as Mark has also
mentioned.

Cheers,

Richard






