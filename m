Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D86AD6AD1A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 10:05:59 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Jul 2013 03:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,973,1363158000"; d="scan'208";a="324942734"
Received: from unknown (HELO helios.localnet) ([10.252.121.225])
	by azsmga001.ch.intel.com with ESMTP; 01 Jul 2013 03:05:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 01 Jul 2013 11:05:29 +0100
Message-ID: <2792708.QFB8vqRtCT@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <20130628195100.GO3261@jama>
References: <cover.1372442170.git.paul.eggleton@linux.intel.com>
	<e50493eabf21983d1c6755c0dfa8552a8e5cfa83.1372442170.git.paul.eggleton@linux.intel.com>
	<20130628195100.GO3261@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] linux-firmware: be consistent with license package naming
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
X-List-Received-Date: Mon, 01 Jul 2013 10:06:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 28 June 2013 21:51:00 Martin Jansa wrote:
> On Fri, Jun 28, 2013 at 06:56:47PM +0100, Paul Eggleton wrote:
> > Much as I prefer en_GB spelling, we need to be consistent with the other
> > package names in this recipe. Thanks to Trevor Woerner for pointing this
> > out.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb index
> > f586321..81795f2 100644
> > --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > @@ -58,7 +58,7 @@ PACKAGES =+ "${PN}-ralink ${PN}-sd8686 ${PN}-wl12xx
> > ${PN}-vt6656 \> 
> >               ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce
> >               ${PN}-rtl8192su \
> >               ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330
> >               ${PN}-bcm4334 \
> >               ${PN}-atheros-license ${PN}-ar9170 ${PN}-ar3k ${PN}-ath6k
> >               ${PN}-ath9k \
> > 
> > -             ${PN}-iwlwifi-licence ${PN}-iwlwifi-6000g2a-5
> > ${PN}-iwlwifi-6000g2b-6" +             ${PN}-iwlwifi-license
> > ${PN}-iwlwifi-6000g2a-5 ${PN}-iwlwifi-6000g2b-6"> 
> >  FILES_${PN}-atheros-license = "/lib/firmware/LICENCE.atheros_firmware"
> > 
> > @@ -170,10 +170,10 @@ RDEPENDS_${PN}-bcm4334 += "${PN}-broadcom-license"
> > 
> >  ALTERNATIVE_linux-firmware-bcm4334 = "brcmfmac-sdio.bin"
> >  ALTERNATIVE_TARGET_linux-firmware-bcm4334[brcmfmac-sdio.bin] =
> >  "/lib/firmware/brcm/brcmfmac4334.bin"> 
> > -RDEPENDS_${PN}-iwlwifi-6000g2a-5 = "${PN}-iwlwifi-licence"
> > -RDEPENDS_${PN}-iwlwifi-6000g2b-6 = "${PN}-iwlwifi-licence"
> > +RDEPENDS_${PN}-iwlwifi-6000g2a-5 = "${PN}-iwlwifi-license"
> > +RDEPENDS_${PN}-iwlwifi-6000g2b-6 = "${PN}-iwlwifi-license"
> > 
> > -FILES_${PN}-iwlwifi-licence =   "/lib/firmware/LICENCE.iwlwifi_firmware"
> > +FILES_${PN}-iwlwifi-license =   "/lib/firmware/LICENCE.iwlwifi_firmware"
> > 
> >  FILES_${PN}-iwlwifi-6000g2a-5 = "/lib/firmware/iwlwifi-6000g2a-5.ucode"
> >  FILES_${PN}-iwlwifi-6000g2b-6 = "/lib/firmware/iwlwifi-6000g2b-6.ucode"
> 
> FWIW there is also -lic suffix in license.bbclass:
> LICENSE_CREATE_PACKAGE ??= "0"
> LICENSE_PACKAGE_SUFFIX ??= "-lic"
> 
> I don't know if it would cause some collision between package created
> here and automatically by license.bbclass, but I guess not as the later
> creates only ${PN}-lic.

There's even a comment in the recipe itself that this recipe is a bit of a 
mess because of all of the different licenses. I suspect a more automated 
approach for this recipe specifically might be better (although upstream file 
naming makes this a bit more difficult).

For the moment I just wanted to clean up the more obvious issues.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

