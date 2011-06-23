Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZjBq-0007la-4y for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 14:39:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5NCZWbw016834;
	Thu, 23 Jun 2011 13:35:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16300-09; Thu, 23 Jun 2011 13:35:28 +0100 (BST)
Received: from [192.168.1.45] (dynamic15.rpnet.com [192.168.1.45])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5NCZQYq016828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 23 Jun 2011 13:35:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308757294-21106-1-git-send-email-koen@dominion.thruhere.net>
References: <1308757294-21106-1-git-send-email-koen@dominion.thruhere.net>
Date: Thu, 23 Jun 2011 13:35:24 +0100
Message-ID: <1308832524.20015.120.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: dvhart@linux.intel.com, Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] kernel.bbclass: restore kernel-abiversion file
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
X-List-Received-Date: Thu, 23 Jun 2011 12:39:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-22 at 17:41 +0200, Koen Kooi wrote:
> This fixes external module recipes that need $KERNEL_VERSION. It got removed by
> 
>     commit a9d41062e24a6b99661b3a5256f369b557433607
>     Author: Darren Hart <dvhart@linux.intel.com>
>     Date:   Tue Mar 8 17:09:10 2011 -0800
> 
>         kernel/bbclass: rework kernel and module classes to allow for building out-of-tree modules
> 
> seemingly as an oversight.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/classes/kernel.bbclass |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)

Merged to master, thanks.

Richard



