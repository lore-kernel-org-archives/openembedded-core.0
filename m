Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SVONl-0001H4-Ch for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 16:42:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4IEWDsE017515
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 15:32:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02906-10 for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 15:32:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4IEW5QR017509
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 15:32:07 +0100
Message-ID: <1337351524.28145.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 May 2012 15:32:04 +0100
In-Reply-To: <cover.1337298285.git.peter.seebach@windriver.com>
References: <cover.1337298285.git.peter.seebach@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] sanity.bbclass: Fix typo
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
X-List-Received-Date: Fri, 18 May 2012 14:42:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-17 at 18:45 -0500, Peter Seebach wrote:
> So, somehow in the the cleanup, I dropped the "% tune" following a
> %s.  Re-added in this patch.  And because I know how typo-prone I am,
> I tested that this really does produce the right results now.  :)
> 
> The following changes since commit 7163ebd92a799b8f000b2b6f303b20de468b5f90:
>   Koen Kooi (1):
>         Revert "kmod: Use base_libdir for installing libkmod"
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib seebs/toolchains
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/toolchains
> 
> Peter Seebach (1):
>   sanity.bbclass:  Attach the missing value to a format string.

Merged to master, thanks.

Richard



