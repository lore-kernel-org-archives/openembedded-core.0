Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QrHQJ-000180-JK for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 00:38:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7AMYLA7025367
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 23:34:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24982-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 23:34:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7AMYDO5025361
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 23:34:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <6FBBF7C4-8FB0-4F64-9C6E-47D402D924C8@kernel.crashing.org>
References: <6FBBF7C4-8FB0-4F64-9C6E-47D402D924C8@kernel.crashing.org>
Date: Wed, 10 Aug 2011 23:33:37 +0100
Message-ID: <1313015617.14274.407.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: multilib warnings?
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
X-List-Received-Date: Wed, 10 Aug 2011 22:38:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-10 at 13:04 -0500, Kumar Gala wrote:
> I feel like I have something not configured correctly.  The setup is as follows:
> 
> base is ppc64 with 'lib64'.
> 
> # Uncomment the following lines to enable multilib builds
> require conf/multilib.conf
> MULTILIBS = "multilib:lib"
> DEFAULTTUNE_virtclass-multilib-lib = "powerpc"
> 
> And I get:
> 
> NOTE: Resolving any missing task queue dependencies
> NOTE: multiple providers are available for libusb (lib-libusb-compat, libusb-compat)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match libusb
> NOTE: Preparing runqueue
> ERROR: Multiple .bb files are due to be built which each provide virtual/libc (/local/home/galak/git/poky/meta/recipes-core/eglibc/eglibc_2.13.bb virtual:multilib:lib:/local/home/galak/git/poky/meta/recipes-core/eglibc/eglibc_2.13.bb).
>  This usually means one provides something the other doesn't and should.
> ERROR: Multiple .bb files are due to be built which each provide virtual/libiconv (/local/home/galak/git/poky/meta/recipes-core/eglibc/eglibc_2.13.bb virtual:multilib:lib:/local/home/galak/git/poky/meta/recipes-core/eglibc/eglibc_2.13.bb).
>  This usually means one provides something the other doesn't and should.
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks

I did suggest using a more unique string like "lib32" for a reason...

Whilst "lib" should really work, I suspect that we have some code which
might not function correctly with it and you seem to be confirming that
suspicion ;-).

Cheers,

Richard



