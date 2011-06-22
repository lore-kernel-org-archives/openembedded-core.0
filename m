Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZPsL-0004oI-Ez for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 18:01:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MFwNo7005505
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:58:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05329-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:58:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MFwGtY005498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:58:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1308706423.git.raj.khem@gmail.com>
References: <cover.1308706423.git.raj.khem@gmail.com>
Date: Wed, 22 Jun 2011 16:57:59 +0100
Message-ID: <1308758279.20015.79.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] eglibc 2.14 upgrade
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
X-List-Received-Date: Wed, 22 Jun 2011 16:01:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 18:43 -0700, Khem Raj wrote:
> This patchset upgrades eglibc 2.13 -> 2.14                                             
> Needed a binutils fix for x86_64                                                       
> Package sotruss which is new in eglibc 2.14                
> 
> The following changes since commit 78de64f58b98101f5be5778e9ecbdaae5ba32997:
> 
>   binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_64 (2011-06-21 17:58:06 -0700)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-2.14
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/eglibc-2.14
> 
> Khem Raj (4):
>   eglibc: Upgrade recipes from 2.13 -> 2.14
>   eglibc-package.inc: Package newly added sotruss and supporting
>     libraries
>   binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_64
>   tcmode-default.inc: Bump EGLIBCVERSION to 2.14

Merged to master, thanks.

Richard



