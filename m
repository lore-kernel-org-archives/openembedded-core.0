Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TF3xO-0002Yl-KI for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 16:11:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8LDx7am026066;
	Fri, 21 Sep 2012 14:59:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25778-03; Fri, 21 Sep 2012 14:59:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8LDwvVb026058
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 21 Sep 2012 14:58:58 +0100
Message-ID: <1348235937.10108.78.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Florin Sarbu <florin.sarbu@windriver.com>
Date: Fri, 21 Sep 2012 14:58:57 +0100
In-Reply-To: <505C6C8A.9000800@windriver.com>
References: <505C6C8A.9000800@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: binutils fails to set ld.gold as default
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
X-List-Received-Date: Fri, 21 Sep 2012 14:11:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-21 at 16:32 +0300, Florin Sarbu wrote:
> Hi all,
> I am facing an issue trying to use ld.gold as the default ld on a poky 
> build. I've added to my build's conf/local.conf DISTRO_FEATURES_append = 
> "ld-is-gold" so I get in 
> tmp-eglibc-eglibc/sysroots/i686-linux/usr/bin/armv7a-vfp-neon-oe-linux-gnueabi 
> the following (amongst others):
> 
> arm-oe-linux-gnueabi-ld
> arm-oe-linux-gnueabi-ld.bfd
> arm-oe-linux-gnueabi-ld.gold
> 
> All good so far. But looking into 
> tmp-eglibc-eglibc/sysroots/i686-linux/usr/libexec/armv7a-vfp-neon-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.7.2 
> I see:
> 
> ld -> 
> ../../../../../bin/armv7a-vfp-neon-oe-linux-gnueabi/arm-oe-linux-gnueabi-ld
> 
>  From the binutils.inc recipe, in EXTRA_OECONF: 
> ${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default 
> --enable-threads', '', d)}
> Shouldn't that have made ld point to ld.gold?
> 
> Any thoughts/ideas on why this is happening?

Its probably not enabled. Try:

DISTRO_FEATURES_append = " ld-is-gold"

note the extra space.

Cheers,

Richard



