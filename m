Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Se4S6-0000ew-2r for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 15:14:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5BD45UU015007
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 14:04:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13603-09 for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 14:04:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5BD3uVm015001
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 14:03:57 +0100
Message-ID: <1339419838.30460.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jun 2012 14:03:58 +0100
In-Reply-To: <cover.1339259893.git.raj.khem@gmail.com>
References: <cover.1339259893.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/16 V2] Prelink/ld bug and rpm compilation on uclibc
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
X-List-Received-Date: Mon, 11 Jun 2012 13:14:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-06-09 at 09:42 -0700, Khem Raj wrote:
> This patch now can compile a uclibc sato image using rpm as packaging backend
> Introduces variables into cmake class to control linker flags which was
> not available
> Adds npth recipe. npth is next gen pth soon gnupg 2.1 will drop pth
> and move on to use npth, right now its only used in uclibc case
> conditionalize use of pth using libc overrides since pth is not
> compatible with uclibc
> 
> The following changes since commit 75a973328d50ef3c007edb7a471ea77fb97911ea:
> 
>   kern-tools: anchor KMACHINE test (2012-06-08 11:56:21 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib kraj/misc-updates
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-updates
> 
> Khem Raj (16):
>   binutils_2.22: Backport to fix bogus textrels
>   pth: Mark incompatible with uclibc
>   libtool: Let -fstack-protector passed to link step
>  augeas: Fix compilation failure
>   cmake.bbclass: Add OECMAKE_C_LINK_FLAGS and OECMAKE_CXX_LINK_FLAGS
>     variables
>   task-self-hosted.bb,task-core-lsb.bb: Conditionalize pth inclusion
>   npth: Add recipe
>   gpgme: Depend on npth for uclibc
>   gnupg-2.0.19: Depend on npth for uclibc

I took the above patches.

>  rpm: Fix compilation on uclibc
>   rpm: Use link time check for libssp
>   sat-solver: Fix build on uclibc
>   libzypp: Fix build with uclibc
>   rpm: pass lrt and lpthread to link step explicitly for uclibc
>   zypper: Fix build on uclibc
>   libzypp: Define OECMAKE_CXX_LINK_FLAGS when compiling for uclibc

I haven't taken these yet as I want to get Mark's rpm update in, then
see where we stand. I also was a little worried about the extra
OECONF/TUNE pieces in the sat-solver patch. There wasn't any mention of
that in the commit message...

Cheers,

Richard



