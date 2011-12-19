Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RccJf-0006JI-Po for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 13:27:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBJCKaNS013688
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 12:20:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08999-06 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 12:20:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBJCKSYA013682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 12:20:29 GMT
Message-ID: <1324297230.4568.169.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 Dec 2011 12:20:30 +0000
In-Reply-To: <cover.1324074518.git.raj.khem@gmail.com>
References: <cover.1324074518.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] Add gcc cross test driver and improve eglibc testing
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
X-List-Received-Date: Mon, 19 Dec 2011 12:27:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-12-16 at 14:33 -0800, Khem Raj wrote:
> Add cross testing driver for gcc-cross
> Replaces the patch to relocate gxx headers with upstream submitted one
> Drop shorten-build-commands eglibc patch since it hinders testing
> Add a patch to eglibc so it can accomodate gxx headers the way OE installs them
> Improve the eglibc testing since we needed to override more
> variables to point to final sysroot
> 
> 
> The following changes since commit 3e05acab1c119a3b2a4703ea8729cc768935d36e:
> 
>   license.bbclass: remove bashism (2011-12-16 16:50:39 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib kraj/gcc-cross-testing
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/gcc-cross-testing
> 
> Khem Raj (4):
>   eglibc-testing: Clean the test before running them
>   gcc-cross: Add cross testing driver for running regression testsuites
>   gcc-4.6: Let G++ relocate gxx-include-dir when using --sysroot option
>   eglibc: Fixes for running regression tests

I merged this to master. I'm still not convinced there is *any* change n
behaviour from the g++ relocation patch but it makes sense to keep more
in line with upstream.

Cheers,

Richard



