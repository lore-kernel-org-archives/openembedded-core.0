Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id E938277D21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 19:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 71CCD20BCC;
	Mon, 10 Jul 2017 19:14:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fAVl3poTyDer; Mon, 10 Jul 2017 19:14:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3F52520645;
	Mon, 10 Jul 2017 19:14:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C06AB162525; Mon, 10 Jul 2017 15:14:30 -0400 (EDT)
Date: Mon, 10 Jul 2017 15:14:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20170710191430.GI28053@denix.org>
References: <20170710183657.12885-1-otavio@ossystems.com.br>
	<1d8dd351-0d96-0766-1beb-6ac621a6bfe4@denx.de>
MIME-Version: 1.0
In-Reply-To: <1d8dd351-0d96-0766-1beb-6ac621a6bfe4@denx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.07 release (WIP)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jul 2017 19:14:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2017 at 08:47:23PM +0200, Marek Vasut wrote:
> On 07/10/2017 08:36 PM, Otavio Salvador wrote:
> > This patch upgrades the U-Boot to the 2017.07 release.
> > 
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> > 
> >  .../u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc}     | 2 +-
> >  .../u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb}   | 0
> >  .../u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb}     | 0
> >  meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb}        | 0
> >  4 files changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc} (88%)
> >  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb} (100%)
> >  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb} (100%)
> >  rename meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb} (100%)
> > 
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> > similarity index 88%
> > rename from meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
> > rename to meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> > index 0e52f27df8..f27989daa1 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> > @@ -7,7 +7,7 @@ PE = "1"
> >  
> >  # We use the revision in order to avoid having to fetch it from the
> >  # repo during parse
> > -SRCREV = "64c4ffa9fa223f7ae8640f9c8f3044bfa0e3bfda"
> > +SRCREV = "d85ca029f257b53a96da6c2fb421e78a003a9943"
> 
> Where did you get this hash from, it's not in the U-Boot repo ...

As it happens, git://git.denx.de/u-boot.git hasn't been updated yet, so this 
patch will fail!


> >  SRC_URI = "git://git.denx.de/u-boot.git \
> >      file://MPC8315ERDB-enable-DHCP.patch \
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.07.bb
> > similarity index 100%
> > rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
> > rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.07.bb
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.07.bb
> > similarity index 100%
> > rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.05.bb
> > rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.07.bb
> > diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot_2017.07.bb
> > similarity index 100%
> > rename from meta/recipes-bsp/u-boot/u-boot_2017.05.bb
> > rename to meta/recipes-bsp/u-boot/u-boot_2017.07.bb
> > 
> 
> 
> -- 
> Best regards,
> Marek Vasut
> 

