Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SV7YN-0004Lk-AW for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 22:44:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4HKY41t031301
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 21:34:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30695-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 21:34:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4HKXuKC031293
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 21:33:57 +0100
Message-ID: <1337286835.7473.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 17 May 2012 21:33:55 +0100
In-Reply-To: <cover.1337273095.git.sgw@linux.intel.com>
References: <cover.1337273095.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/12] Updated and Fixes
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
X-List-Received-Date: Thu, 17 May 2012 20:44:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-17 at 19:51 +0300, Saul Wold wrote:
> Richard,
> 
> Pull in the backlog of changes from this week.  Bigest change
> that need looking at are Chris's.
> 
> Sau!
> 
> The following changes since commit 2cf6e7cf81c0b864b5d51be60094a6eb3e584383:
> 
>   fotowall: Add #include ui_wizard.h to ExportWizard.cpp (2012-05-16 07:33:15 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Alexandru DAMIAN (1):
>   xf86-video-vmware: update package to 12.0.2
> 
> Bogdan Marinescu (1):
>   gnutls: update to 2.12.19
> 
> Christopher Larson (3):
>   csl-versions: fix bb.process.CmdError reference
>   oe.types: give the regex type more sane semantics
>   kernel.bbclass: add deploy link to KERNEL_IMAGETYPE
> 
> Joshua Lock (2):
>   meta/classes/sstate.bbclass: ensure sstate files have group R/W
>   sanity.bbclass: check user can read and write to SSTATE_DIR
> 
> Laurentiu Palcu (1):
>   gnupg: Update to upstream version 2.0.19
> 
> Marko Lindqvist (1):
>   dpkg: update to upstream version 1.16.3
> 
> Martin Jansa (1):
>   xserver-xorg-lite: disable xmlto like full xserver-xorg does
> 
> Saul Wold (1):
>   xinetd: Update to 2.3.15
> 
> Xiaofeng Yan (1):
>   archiver.bbclass: Add two default set for avoiding error when missing
>     assignment

I've merged these apart from the dpkg upgrade which I'd like to double
check doesn't break the deb backend. I've seen conflicting emails about
this so would appreciate confirmation this upgrade works well.

Cheers,

Richard



