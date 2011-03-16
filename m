Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PzqeO-0008NQ-Uq for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 14:20:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2GDInmD002582;
	Wed, 16 Mar 2011 13:18:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02452-03; Wed, 16 Mar 2011 13:18:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2GDIgW5002576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 16 Mar 2011 13:18:43 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1300195862-23448-1-git-send-email-Chase.Maupin@ti.com>
References: <1300195862-23448-1-git-send-email-Chase.Maupin@ti.com>
Date: Wed, 16 Mar 2011 13:18:32 +0000
Message-ID: <1300281512.30423.1866.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH] u-boot.inc: allow variable make targets
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
X-List-Received-Date: Wed, 16 Mar 2011 13:20:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-15 at 08:31 -0500, Chase Maupin wrote:
> * Later versions of u-boot sometimes have top level make targets
>   such as u-boot.imx, u-boot.kwb, and for upcoming TI devices
>   u-boot.ti.
> * These targets define different calls to the mkimage tool to
>   change the images created, such as changing the load address.
> * This change allows recipes to change the default make target
>   of "all" to something like u-boot.ti or u-boot.imx by setting
>   the UBOOT_MAKE_TARGET variable.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  meta/recipes-bsp/uboot/u-boot.inc |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



