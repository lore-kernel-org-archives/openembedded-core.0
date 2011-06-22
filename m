Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZPdA-0003gO-7J for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 17:46:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MFggPq005362
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:42:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05329-01 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:42:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MFgYQs005355
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:42:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1308706511.git.raj.khem@gmail.com>
References: <cover.1308706511.git.raj.khem@gmail.com>
Date: Wed, 22 Jun 2011 16:42:17 +0100
Message-ID: <1308757337.20015.72.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] uclibc and related fixes
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
X-List-Received-Date: Wed, 22 Jun 2011 15:46:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 18:44 -0700, Khem Raj wrote:
> Fix uclibc build for x86_64
> gettext compile failed on uclibc so fix it and additionally
> remove unused patches
> Add required support for systemd to function with uclibc
> Quash a parse warning where uclibc-initial and uclibc
> both provided libsegfault
> 
> The following changes since commit 78de64f58b98101f5be5778e9ecbdaae5ba32997:
> 
>   binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_64 (2011-06-21 17:58:06 -0700)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib kraj/uclibc
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc
> 
> Khem Raj (4):
>   uclibc.inc: libsegfault is only RPROVIDED by uclibc
>   gettext-0.18.1.1: Remove unused patches
>   uclibc/x86_64/uClibc.machine: Enable ARCH_USE_MMU
>   uclibc: Add support for $ORIGIN

Merged to master, thanks.

I had reservations about the first one as hardcoding PN can have issues
with BBCLASSEXTEND but looking at the recipe, there are bigger issues if
we were ever to do that :/

Cheers,

Richard





