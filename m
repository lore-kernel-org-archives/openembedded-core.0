Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q2SI4-0004bm-RF for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 18:56:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2NHAnGU002894
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 17:10:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02108-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 17:10:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2NHAioE002886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 17:10:44 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1300730825.git.raj.khem@gmail.com>
References: <cover.1300730825.git.raj.khem@gmail.com>
Date: Wed, 23 Mar 2011 17:10:42 +0000
Message-ID: <1300900242.3018.33.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] Prune global compilation flags
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
X-List-Received-Date: Wed, 23 Mar 2011 17:56:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-21 at 11:10 -0700, Khem Raj wrote:
> This patch series is for removing the unneeded flags in SELECTED_OPTIMIZATIONS
> that gets passed to every recipe build by default. I have also introduced flags
> to remove duplicate debug information which will reduce the debug info sections
> 
> Tested by building and booting console-image/angstrom on ppc,arm,mips,x86-64,x86
> qemu machines.
> 
> Please apply
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: kraj/global-opts
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/global-opts
> 
> Thanks,
>     Khem Raj <raj.khem@gmail.com>
> ---
> 
> 
> Khem Raj (3):
>   bitbake.conf: Prune global OPTIMIZATION flags
>   machine/include/tune-atom.inc: Remove FULL_OPTIMIZATION_pn-gtk+
>   gcc-runtime_4.5.1.bb: Fix ICE in gcc-runtime with
>     -feliminate-dwarf2-dups

Merged into master, thanks.

Richard



