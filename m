Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q5J6n-0007IW-35 for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 16:44:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2VEgOxt027092
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 15:42:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26603-09 for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 15:42:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2VEgH7f027085
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 15:42:17 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1301095943.git.raj.khem@gmail.com>
References: <cover.1301095943.git.raj.khem@gmail.com>
Date: Thu, 31 Mar 2011 15:42:13 +0100
Message-ID: <1301582533.24596.112.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] Call stty sane always and expand qemu target list
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
X-List-Received-Date: Thu, 31 Mar 2011 14:44:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-03-25 at 16:35 -0700, Khem Raj wrote:
> This patch series has two patches, one calls stty sane always before exit
> previously it was only called if qemu crashed
> 
> Second patch introduces a new variable called QEMU_TARGET which
> can be set by distributions or appended in layers to select
> reduced set of targets to build in qemu-native
> It weakly assigned and list is expanded to include SH and MIPS64
> to help oe distros.
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: kraj/qemu
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemu
> 
> Thanks,
>     Khem Raj <raj.khem@gmail.com>
> ---
> 
> 
> Khem Raj (2):
>   scripts/poky-qemu-internal: call stty sane before exit
>   qemu.inc: Add sh4,sh4eb,mips64,mips64el targets

Merged to master, thanks.

Richard



