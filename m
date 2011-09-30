Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9bAZ-0005fR-07 for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 13:22:19 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UBNEcD013258 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:23:14 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8auJ0I2qEhBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:23:14 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UBNBrU013244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:23:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2011 12:16:45 +0100
In-Reply-To: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
	<06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317381411.12332.159.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 01/13] xserver-xf86: upgrade to 1.11.0 and move shared definitions to .inc files
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
X-List-Received-Date: Fri, 30 Sep 2011 11:22:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-30 at 09:27 +0200, Martin Jansa wrote:
> * also improve packaging a bit
> * motivated by xserver-xorg from meta-oe (which is IMHO named better -
>   closer to upstream)
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../xorg-xserver/xserver-xf86-1.11.0.inc           |    7 ++
>  .../xorg-xserver/xserver-xf86-common.inc           |  114 +++++++++++++++++---
>  .../xorg-xserver/xserver-xf86-dri-lite.inc         |   34 +-----
>  .../xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb   |   20 ----
>  .../xorg-xserver/xserver-xf86-dri-lite_1.11.0.bb   |    4 +
>  .../xorg-xserver/xserver-xf86-dri-lite_git.bb      |    8 +--
>  .../xorg-xserver/xserver-xf86-lite.inc             |   32 +-----
>  .../xorg-xserver/xserver-xf86-lite_1.10.1.bb       |   12 --
>  .../xorg-xserver/xserver-xf86-lite_1.11.0.bb       |    2 +
>  9 files changed, 123 insertions(+), 110 deletions(-)
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-1.11.0.inc
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.11.0.bb
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.11.0.bb

I'm afraid I can't even begin to separate out all the pieces in this
(version changes from packaging fixes from code layout changes). Please
can you split it up.

Cheers,

Richard




