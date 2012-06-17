Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SgBUU-00043r-AU for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 11:09:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5H8x9hE027885
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2012 09:59:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17377-06 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2012 09:59:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5H8x0BZ027877
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2012 09:59:02 +0100
Message-ID: <1339923541.8481.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jun 2012 09:59:01 +0100
In-Reply-To: <b7bfb9b693cc592f081a3f42ef3f874a937d305d.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
	<b7bfb9b693cc592f081a3f42ef3f874a937d305d.1339911478.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Consolidated Pull 23/23] mdadm: add binutils to DEPENDS
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
X-List-Received-Date: Sun, 17 Jun 2012 09:09:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-06-16 at 22:40 -0700, Saul Wold wrote:
> mdadm requires ansidecl.h and therefore binutils needs to be completely
> installed before this compile can complete, so add the DEPENDS.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-extended/mdadm/mdadm_3.2.5.bb |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-extended/mdadm/mdadm_3.2.5.bb b/meta/recipes-extended/mdadm/mdadm_3.2.5.bb
> index 2d7e1d0..244777b 100644
> --- a/meta/recipes-extended/mdadm/mdadm_3.2.5.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_3.2.5.bb
> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
>  
>  PR = "r0"
> +DEPENDS = "binutils" 
>  
>  SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2 \
>  	    file://mdadm-3.2.2_fix_for_x32.patch \

I think we can likely just remove the use of the header:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=37cf162998b13d7d594c7ed68c47d440a3033ed5

Cheers,

Richard




