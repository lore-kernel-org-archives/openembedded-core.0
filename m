Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPw22-0003KU-54 for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 14:20:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RCHgi8002037
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 13:17:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01472-10 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 13:17:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RCHZQ3002030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 13:17:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306486749-17889-1-git-send-email-Martin.Jansa@gmail.com>
References: <1306486749-17889-1-git-send-email-Martin.Jansa@gmail.com>
Date: Fri, 27 May 2011 13:17:29 +0100
Message-ID: <1306498649.27470.261.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] libcap: add native BBCLASSEXTEND to fix gnutls-native after ffc32d6436bcd11bd9a431affb9d2508fdb3992e
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
X-List-Received-Date: Fri, 27 May 2011 12:20:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-27 at 10:59 +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-support/libcap/libcap.inc |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
> index 292fa78..1b4c0bc 100644
> --- a/meta/recipes-support/libcap/libcap.inc
> +++ b/meta/recipes-support/libcap/libcap.inc
> @@ -6,6 +6,8 @@ LICENSE = "BSD | GPL"
>  LIC_FILES_CHKSUM = "file://License;md5=731de803c1ccbcb05a9b3523279c8d7f"
>  
>  DEPENDS = "libpam attr perl-native"
> +# attr and pam are disabled by EXTRA_OEMAKE_virtclass-native
> +DEPENDS_virtclass-native = "perl-native"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/libcap2/${BPN}-${PV}.tar.bz2"
>  
> @@ -32,3 +34,5 @@ do_install() {
>  # pam files
>  FILES_${PN} += "${libdir}/security/*.so"
>  FILES_${PN}-dbg += "${libdir}/security/.debug/*.so"
> +
> +BBCLASSEXTEND = "native"

Applied to master, thanks.

Richard



