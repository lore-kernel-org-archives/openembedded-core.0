Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZQTJ-0006K2-3F for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 18:40:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MGaYGi005995
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 17:36:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05646-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 17:36:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MGaPJx005989
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 17:36:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1308677220.git.paul.eggleton@linux.intel.com>
References: <cover.1308677220.git.paul.eggleton@linux.intel.com>
Date: Wed, 22 Jun 2011 17:36:07 +0100
Message-ID: <1308760567.20015.86.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] Fix for bitbake freeze due to git fetch during parse
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
X-List-Received-Date: Wed, 22 Jun 2011 16:40:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 18:29 +0100, Paul Eggleton wrote:
> Addresses [YOCTO #1186]. See patch for further details. (Sending against
> poky-contrib since OE git is currently experiencing issues.)
> 
> The following changes since commit 2163461ec94528ecf046a04edc5db3d2dd3a6b8b:
> 
>   systemtap: remove non-core COMPATIBLE_MACHINES (2011-06-16 22:14:06 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib paule/fix-uboot-srcrev
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=paule/fix-uboot-srcrev
> 
> Paul Eggleton (1):
>   u-boot: set SRCREV to a git revision instead of a tag reference
> 
>  meta/recipes-bsp/uboot/u-boot_2011.03.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

I've merged Paul's updated version of this. Its a hard problem given
git's way of handling tags/branches etc. so its probably the best we can
do in the circumstances...

Cheers,

Richard




