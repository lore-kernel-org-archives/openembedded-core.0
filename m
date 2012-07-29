Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SvPsP-0001tM-3l for openembedded-core@lists.openembedded.org;
	Sun, 29 Jul 2012 11:33:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6T9Ltf5026906
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 10:21:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26851-01 for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 10:21:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6T9LkqN026900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2012 10:21:47 +0100
Message-ID: <1343553706.16998.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 29 Jul 2012 10:21:46 +0100
In-Reply-To: <cover.1343389943.git.ross.burton@intel.com>
References: <cover.1343389943.git.ross.burton@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] drm updates
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
X-List-Received-Date: Sun, 29 Jul 2012 09:33:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-27 at 12:53 +0100, Ross Burton wrote:
> Forwarding some patches to libdrm.  More mesa-related changes later.
> 
> The following changes since commit fb53d69d9c726e6a663ea276cc440676e20f8326:
> 
>   documentation/dev-manual/dev-manual-intro.xml: typo fixed. (2012-07-26 18:53:04 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib ross/mesa
> 
> for you to fetch changes up to cae0f7ba7693529116ae5e21cdddc35bf96aa8fe:
> 
>   libdrm: Bump libdrm_git to 2.4.37 (2012-07-27 12:51:29 +0100)
> 
> ----------------------------------------------------------------
> Damien Lespiau (3):
>       libdrm: libdrm does not depend on xcb any more
>       libdrm: Put the license md5sum in the common include
>       libdrm: Bump libdrm_git to 2.4.37
> 
> Ross Burton (1):
>       drm: move to PR/INC_PR, starting at r1 as libdrm_git was at r1
> 
>  meta/recipes-graphics/drm/libdrm.inc       |    5 ++++-
>  meta/recipes-graphics/drm/libdrm_2.4.35.bb |    4 +---
>  meta/recipes-graphics/drm/libdrm_git.bb    |    7 ++++---
>  3 files changed, 9 insertions(+), 7 deletions(-)
> 
> Damien Lespiau (3):
>   libdrm: libdrm does not depend on xcb any more
>   libdrm: Put the license md5sum in the common include
>   libdrm: Bump libdrm_git to 2.4.37
> 
> Ross Burton (1):
>   drm: move to PR/INC_PR, starting at r1 as libdrm_git was at r1

Merged to master, thanks.

Richard



