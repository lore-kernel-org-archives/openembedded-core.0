Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q1jXp-0007eE-Du for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 19:09:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2LI7kV8026312
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 18:07:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26155-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 18:07:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2LI7cIf026306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 18:07:39 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1300387701.git.raj.khem@gmail.com>
References: <cover.1300387701.git.raj.khem@gmail.com>
Date: Mon, 21 Mar 2011 18:07:13 +0000
Message-ID: <1300730833.30423.3993.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] Upgrade qemu to 0.14.0
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
X-List-Received-Date: Mon, 21 Mar 2011 18:09:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-17 at 11:52 -0700, Khem Raj wrote:
> This patchset upgrades qemu in oe-core to 0.14.0
> The script fixes are done to cope for a bug in 0.14.0
> as well as to get past a console spawning problem for non-nfs image
> boots
> 
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: kraj/qemu-update
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemu-update
> 
> Thanks,
>     Khem Raj <raj.khem@gmail.com>
> ---
> 
> 
> Khem Raj (5):
>   qemu: Upgrade 0.13.0 -> 0.14.0

With this change, I'm just doing some checks that certain things work,
its still in my pending queue.

>   qemu.inc: Add sh4,sh4eb,mips64,mips64el targets

For this, I'd like to make the list of targets a separate variable. I'm
happy with your default for OECore, I might take out some of the arches
for Yocto/Poky.

>   lib/oe/patch.py: Cosmetic change to avoid bitbake warning
>   scripts/poky-qemu-internal: Pass -m <mem_size> always on commandline
>   scripts/poky-qemu-internal: Add rw to KERNCMDLINE for non nfs boots

I merged these, thanks.

Cheers,

Richard



