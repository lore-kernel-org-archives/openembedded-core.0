Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QOWNb-0005Rv-Hq for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 16:45:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4NEg6ve018570;
	Mon, 23 May 2011 15:42:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12569-09; Mon, 23 May 2011 15:42:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4NEfxGO018554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 23 May 2011 15:41:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306151894-27522-1-git-send-email-koen@dominion.thruhere.net>
References: <1306151894-27522-1-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 23 May 2011 15:41:57 +0100
Message-ID: <1306161717.3424.855.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] qemu machines: drop MACHINE_ESSENTIAL_EXTRA_RDEPENDS = "qemu-config"
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
X-List-Received-Date: Mon, 23 May 2011 14:45:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-23 at 13:58 +0200, Koen Kooi wrote:
> Things like 'distcc' and 'bash' are not essential to booting a qemu machine.

Agreed, although it largely depends on the context of what you believe
the qemu machines are for. Its policy so it belongs in the distro at
least so I'll change this back to something in poky.conf...

Cheers,

Richard

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/conf/machine/include/qemu.inc |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
> index 40723eb..4122a88 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -17,4 +17,3 @@ PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
>  #PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers-yocto"
>  
>  EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
> -MACHINE_ESSENTIAL_EXTRA_RDEPENDS = "qemu-config"




