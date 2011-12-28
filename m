Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1RfhpG-0001Rg-Gq
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 01:57:02 +0100
Received: from WX-EXCHMB2.insigma.com.cn (10.0.1.203) by
	WX-Edge.insigma.com.cn (10.0.1.205) with Microsoft SMTP Server (TLS) id
	8.1.436.0; Wed, 28 Dec 2011 08:49:40 +0800
Received: from [192.168.0.98] (122.224.76.38) by Wx-ExchMB2.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.436.0; Wed, 28 Dec 2011
	08:49:33 +0800
Message-ID: <1325033289.4637.23.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Dec 2011 08:48:09 +0800
In-Reply-To: <1325018118-30223-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1325018118-30223-1-git-send-email-fransmeulenbroeks@gmail.com>
Organization: Insigma
X-Mailer: Evolution 3.2.2 
MIME-Version: 1.0
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Subject: Re: [PATCH 1/2] u-boot: improved DESCRIPTION, fixed HOMEPAGE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: niqingliang@insigma.com.cn,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 28 Dec 2011 00:57:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I have just done a seperate env tools bb for my project, but use the
config file to assign the env size and address (which is generated on
booting from /proc/mtd). 

in the fdt, the u-boot env has a seperate partition identified by it's
name "u-boot environment"

and have some problem:
1. the fw_printenv will exit with 0 even though can't read the env (CRC
error).

2. the default env vars in fw_printenv(used when CRC error) are not same
as it in the u-boot.

On Wed, 2011-12-28 at 04:35 +0800, Frans Meulenbroeks wrote:
> HOMEPAGE pointed to an sf.net page that said that the
> page did not exist any more and after that it redirected
> to the denx.de page; updated HOMEPAGE to point to that page
> Also improved the description to use the official capitalisation
> 
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 544acd2..a3f50bc 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -1,3 +1,5 @@
> +DESCRIPTION = "U-Boot - the Universal Boot Loader"
> +HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
>  DESCRIPTION = "U-boot bootloader"
>  HOMEPAGE = "http://u-boot.sf.net"
>  SECTION = "bootloaders"
> --
> 1.7.8.1
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



