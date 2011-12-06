Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RXw2T-000174-Hg for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 15:30:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB6ENjAi003827;
	Tue, 6 Dec 2011 14:23:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03337-03; Tue,  6 Dec 2011 14:23:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB6ENaX0003821
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 6 Dec 2011 14:23:37 GMT
Message-ID: <1323181427.19363.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 06 Dec 2011 14:23:47 +0000
In-Reply-To: <1323167941-25751-1-git-send-email-koen@dominion.thruhere.net>
References: <1323167941-25751-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] omap3-sgx-modules: drop from oe-core, it lives in the meta-ti BSP nowadays
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
X-List-Received-Date: Tue, 06 Dec 2011 14:30:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-06 at 11:39 +0100, Koen Kooi wrote:
> OE-core only support qemu based machines, so BSP type recipe should be moved to their respective BSPs
> 
> omap3-sgx-modules can be found in the meta-ti BSP: http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../omap3-sgx-modules_1.3.13.1397.bb               |   17 -----------------
>  1 files changed, 0 insertions(+), 17 deletions(-)
>  delete mode 100644 meta/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb

Merged to master, thanks.

Richard



