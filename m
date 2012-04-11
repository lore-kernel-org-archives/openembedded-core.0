Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SHviY-0007oM-He for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 13:28:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3BBIn8S007140
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 12:18:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06405-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 12:18:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3BBIdp3007133
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 12:18:40 +0100
Message-ID: <1334143119.10826.149.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Apr 2012 12:18:39 +0100
In-Reply-To: <cover.1334107957.git.sgw@linux.intel.com>
References: <cover.1334107957.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL (for RC3) 0/5] Please review and pull this morning
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
X-List-Received-Date: Wed, 11 Apr 2012 11:28:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-10 at 18:33 -0700, Saul Wold wrote:
> Richard,
> 
> This is a set of fixes for RC3, there is a pending set for
> meta-yocto to review.
> 
> Sau!
> 
> The following changes since commit bde1744018afd4616e114b20ffdc21b9abddcedc:
> 
>   hello-mod: Move hello-mod from meta to meta-skeleton (2012-04-10 13:16:00 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Lianhao Lu (1):
>   connman: add ofono dependency.
> 
> Nitin A Kamble (1):
>   tclibc-eglibc.inc: make locale packages dependency conditional

Added missing PR bump

> Saul Wold (2):
>   boot-directdisk: remove the default setting of SYSLINUXCFG and
>     SYSLINUXMENU
>   task-self-hosted: Add vte and eglibc-gconv-ibm850
> 
> Yang Shi (1):
>   initrdscripts: fix init-live.sh and use unionfs

Marked as machine specific due to added kernel dependency.

I merged the above with the tweaks mentioned. I'm not exactly thrilled
to be having to do this at this point :/.

Cheers,

Richard



