Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PzXET-00014q-Uv
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 17:36:30 +0100
Received: by wyb40 with SMTP id 40so684987wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 09:34:47 -0700 (PDT)
Received: by 10.227.32.69 with SMTP id b5mr9598218wbd.99.1300206881995;
	Tue, 15 Mar 2011 09:34:41 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id u9sm896825wbg.12.2011.03.15.09.34.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 09:34:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1300195841-21137-1-git-send-email-Chase.Maupin@ti.com>
Date: Tue, 15 Mar 2011 17:34:39 +0100
Message-Id: <077BC74A-B64F-44E1-8437-6D565D3D3737@dominion.thruhere.net>
References: <1300195841-21137-1-git-send-email-Chase.Maupin@ti.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH][angstrom-layers] u-boot.inc: allow variable make targets
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
X-List-Received-Date: Tue, 15 Mar 2011 16:36:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 15 mrt 2011, om 14:30 heeft Chase Maupin het volgende geschreven:

> * Later versions of u-boot sometimes have top level make targets
>  such as u-boot.imx, u-boot.kwb, and for upcoming TI devices
>  u-boot.ti.
> * These targets define different calls to the mkimage tool to
>  change the images created, such as changing the load address.
> * This change allows recipes to change the default make target
>  of "all" to something like u-boot.ti or u-boot.imx by setting
>  the UBOOT_MAKE_TARGET variable.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
> BSP/TI/recipes-bsp/u-boot/u-boot.inc |    3 ++-
> 1 files changed, 2 insertions(+), 1 deletions(-)

Thanks, pushed to angstrom-layers master.




