Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TB6Zm-0003ms-Dd for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 18:11:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8AFwZtJ001241;
	Mon, 10 Sep 2012 16:58:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00404-03; Mon, 10 Sep 2012 16:58:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8AFwPCL001234
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 10 Sep 2012 16:58:26 +0100
Message-ID: <1347292707.29562.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 10 Sep 2012 16:58:27 +0100
In-Reply-To: <1347285878-14778-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120910124518.GB3502@jama.jama.net>
	<1347285878-14778-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc-initial-2.16: add kconfig-frontends-native to depends
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2012 16:11:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-10 at 16:04 +0200, Martin Jansa wrote:
> * fixes:
>   | make[1]: Entering directory `/OE/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/eglibc-initial-2.16-r8+svnr20393/eglibc-2_16/libc'
>   | make[1]: *** No rule to make target `/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/conf', needed by `config'.  Stop.
>   | make[1]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/eglibc-initial-2.16-r8+svnr20393/eglibc-2_16/libc'
> 
> * it's because, eglibc-initial.inc overwrites DEPENDS from eglibc_2.16.bb
>   $ grep DEPENDS eglibc_2.16.bb
>   DEPENDS += "gperf-native kconfig-frontends-native"
>   $ grep DEPENDS eglibc-initial.inc
>   DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
> 
>   and it's included after eglibc_2.16.bb
>   $ head -n 3 eglibc-initial_2.16.bb
>   require eglibc_${PV}.bb
>   require eglibc-initial.inc
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/eglibc/eglibc-initial_2.16.bb | 2 ++
>  1 file changed, 2 insertions(+)

Merged to master, thanks.

Richard



