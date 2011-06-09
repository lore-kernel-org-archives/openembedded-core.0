Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QUgYL-0001NT-1K for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 16:49:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p59EkNov013956;
	Thu, 9 Jun 2011 15:46:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13378-10; Thu,  9 Jun 2011 15:46:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p59EkBZF013945
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 9 Jun 2011 15:46:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307607409-20393-1-git-send-email-koen@dominion.thruhere.net>
References: <1307607409-20393-1-git-send-email-koen@dominion.thruhere.net>
Date: Thu, 09 Jun 2011 15:46:03 +0100
Message-ID: <1307630763.15712.165.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH v3] sysvinit: split inittab into it's own recipe
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
X-List-Received-Date: Thu, 09 Jun 2011 14:49:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-09 at 10:16 +0200, Koen Kooi wrote:
> A proper fix for
> 
> [YOCTO ##1131]
> 
> Signed-off-by: <koen@dominion.thruhere.net>
> ---
>  .../recipes-core/sysvinit/sysvinit-inittab/COPYING |  339 ++++++++++++++++++++
>  .../recipes-core/sysvinit/sysvinit-inittab/inittab |   30 ++
>  .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   58 ++++
>  meta/recipes-core/sysvinit/sysvinit/inittab        |   30 --
>  meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   41 +---
>  5 files changed, 428 insertions(+), 70 deletions(-)
>  create mode 100644 meta/recipes-core/sysvinit/sysvinit-inittab/COPYING
>  create mode 100644 meta/recipes-core/sysvinit/sysvinit-inittab/inittab
>  create mode 100644 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
>  delete mode 100644 meta/recipes-core/sysvinit/sysvinit/inittab

Merged to master, thanks.

Richard



