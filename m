Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QliEV-0005Ls-Uo for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 16:03:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QDxRME021943
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 14:59:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21143-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 14:59:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QDxLB0021937
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 14:59:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <969FA904-0086-42FA-B605-07B74FB728B4@kernel.crashing.org>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
	<969FA904-0086-42FA-B605-07B74FB728B4@kernel.crashing.org>
Date: Tue, 26 Jul 2011 14:59:12 +0100
Message-ID: <1311688752.2344.238.camel@rex>
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
X-List-Received-Date: Tue, 26 Jul 2011 14:03:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-26 at 08:47 -0500, Kumar Gala wrote:
> On Jul 26, 2011, at 7:44 AM, Richard Purdie wrote:
> 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > meta/conf/machine/include/powerpc/arch-powerpc.inc |   45 +++++++++++++++++++-
> > meta/conf/machine/include/tune-ppc603e.inc         |   12 ++++-
> > meta/conf/machine/include/tune-ppce300c2.inc       |   12 ++++-
> > meta/conf/machine/include/tune-ppce500.inc         |   13 ++++--
> > meta/conf/machine/include/tune-ppce500mc.inc       |   12 ++++-
> > meta/conf/machine/include/tune-ppce500v2.inc       |   12 ++++-
> > 6 files changed, 88 insertions(+), 18 deletions(-)
> 
> One thing I'm wondering about as we do this is the ability to pass
> --with-cpu to gcc & [e]glibc configure to pickup proper optimized cfgs
> & libs for a given target.

As far as I can tell, gcc 4.x has no --with-cpu option. We pass the
correct march and mtune options to the compiler at runtime through
CFLAGS and friends.

You're already found the way to pass configuration to *libc using values
in TARGET_FPU to pickup the right configuration.

Is there a use case we're missing?

Cheers,

Richard



