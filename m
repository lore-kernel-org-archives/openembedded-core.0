Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SPAMI-0008SC-Q4 for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 12:31:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q41ALKIl013636
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 May 2012 11:21:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13387-01 for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2012 11:21:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q41ALBp7013630
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 May 2012 11:21:13 +0100
Message-ID: <1335867674.7415.76.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 01 May 2012 11:21:14 +0100
In-Reply-To: <20120430154823.3a4ea3ee@wrlaptop>
References: <cover.1335815704.git.peter.seebach@windriver.com>
	<1a15132d9ff316a53f58764aad35bb09c5fbcf0e.1335815704.git.peter.seebach@windriver.com>
	<4F9EF944.9080503@windriver.com> <20120430154823.3a4ea3ee@wrlaptop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] sanity.bbclass: Implement initial toolchain sanity checks
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
X-List-Received-Date: Tue, 01 May 2012 10:31:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-30 at 15:48 -0500, Peter Seebach wrote:
> On Mon, 30 Apr 2012 15:42:44 -0500
> Mark Hatle <mark.hatle@windriver.com> wrote:
> 
> > Is the above debugging?  (I suspect it is)  I suggest the following...
> 
> Actually, that one's intentional.  I originally did it for debugging,
> but I thought it was super convenient to actually get a list of the CPU
> feature set bitbake thought it was using.  We can't tell you whether
> you picked the right features, but we can tell you what they are.
> 
> So for instance, with a qemux86 and a core2 lib32:
> 
> NOTE: Sanity-checking tuning 'x86-64' (default) features:
> NOTE:   checking for conflicts: m64
> NOTE:   checking for conflicts with: m32
> NOTE:   m64: IA32e (x86_64) ELF64 standard ABI
> NOTE: Sanity-checking tuning 'core2' (lib32) features:
> NOTE:   m32: IA32 ELF32 standard ABI
> NOTE:   core2: Enable core2 specific processor optimizations
> 
> I found this really handy, and left it there on purpose.  I could take
> it out, and/or move it to somewhere else, but I really do like having
> that information appear.

I'd change these to debug messages. Users don't need this on the console
on every run. There is already a summary of the active tune options
displayed in the build configuration banner if I remember correctly.

Cheers,

Richard



