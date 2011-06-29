Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbuvC-00037x-Gl for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 15:35:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TDVTc8004536;
	Wed, 29 Jun 2011 14:31:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04497-01; Wed, 29 Jun 2011 14:31:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TDVJWR004530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 29 Jun 2011 14:31:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309348823-29217-1-git-send-email-koen@dominion.thruhere.net>
References: <1309348823-29217-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 29 Jun 2011 14:31:02 +0100
Message-ID: <1309354262.20015.373.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@www.linuxtogo.org, Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH v2] libc locale split: fix some remaining problems
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
X-List-Received-Date: Wed, 29 Jun 2011 13:35:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 14:00 +0200, Koen Kooi wrote:
> * libc-{common,package}.bbclass: fix shlib renaming for the C library
> 	Without this you'd end up with eglibc_2.12.ipk instead of libc6_2.12.ipk as before
> 
> * eglibc-locale: don't make versions go backwards after split from eglibc
> 	eglibc was way beyond PR = "r1" at the time of the split, so increase PR to make package upgrades work
> 
> This still doesn't fix:
> 
> $ dpkg-deb -I ipk/armv7a/libc6_2.12-r16_armv7a.ipk
>  Package: libc6
> 	[..]
>  Depends: libc6-dev (>= 2.12)
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/classes/libc-common.bbclass           |    7 +++++++
>  meta/classes/libc-package.bbclass          |    5 +----
>  meta/recipes-core/eglibc/eglibc-locale.inc |    2 +-
>  3 files changed, 9 insertions(+), 5 deletions(-)

Merged to master along with a couple of other libc-locale fixup patches
to address issues (including the -dev package issues mentioned above).

Cheers,

Richard



