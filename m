Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id E37B470057
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Oct 2017 16:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4F023208D4;
	Sun, 29 Oct 2017 16:47:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id nJbF9CNOM7cE; Sun, 29 Oct 2017 16:47:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 13A8A207BA;
	Sun, 29 Oct 2017 16:47:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 855C2162705; Sun, 29 Oct 2017 12:47:55 -0400 (EDT)
Date: Sun, 29 Oct 2017 12:47:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <20171029164755.GC9221@denix.org>
References: <20171026162106.21556-1-otavio@ossystems.com.br>
	<20171026163256.2784.63962@do.openembedded.org>
	<1509040287.11251.27@fm-out.intel.com>
MIME-Version: 1.0
In-Reply-To: <1509040287.11251.27@fm-out.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "Plascencia, Daniela" <daniela.plascencia@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGxpbnV4LWZpcm13YXJlOiBCdW1wIHRvIGJmMDQyOTEgcmV2aXNpb24=?=
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
X-List-Received-Date: Sun, 29 Oct 2017 16:47:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 26, 2017 at 12:51:27PM -0500, Leonardo Sandoval wrote:
> I believe the patchtest complain is valid, some brief explanation
> should be given.

FWIW, it was mentioned in the commit log:

> bf04291 WHENCE: Add new qed firmware
> d8fc990 WHENCE: Add new radeon firmware

Maybe the script needs to be smarter?


> But the way  it is present need some improvement. We should not be
> listing all licenses, just the ones that change.
> 
> Leo
> 
> 
> On Thu, Oct 26, 2017 at 11:32 AM, Patchwork
> <patchwork@patchwork.openembedded.org> wrote:
> >== Series Details ==
> >
> >Series: linux-firmware: Bump to bf04291 revision
> >Revision: 1
> >URL   : https://patchwork.openembedded.org/series/9498/
> >State : failure
> >
> >== Summary ==
> >
> >
> >Thank you for submitting this patch series to OpenEmbedded Core.
> >This is
> >an automated response. Several tests have been executed on the
> >proposed
> >series by patchtest resulting in the following failures:
> >
> >
> >
> >* Issue             LIC_FILES_CHKSUM changed on target
> >linux-firmware but there was no explanation as to why in the
> >commit message [test_lic_files_chksum_modified_not_mentioned]
> >  Suggested fix    Provide a reason for LIC_FILES_CHKSUM change in
> >commit message
> >  Current checksum
> >file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc
> >file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728
> >file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31
> >file://LICENSE.amdgpu;md5=0aa3c2f3e736af320a08a3aeeccecf29
> >file://LICENSE.amd-ucode;md5=3a0de451253cc1edbf30a3c621effee3
> >file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13
> >file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3
> >file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc
> >file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198
> >file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea
> >file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903
> >file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed
> >file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431
> >file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8
> >file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c29
> > 6720b7d3921
> >file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293
> >file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb
> >file://GPL-2;md5=b234ee4d69f5fce4486a80fdaf4a4263
> >file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444
> >file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36
> >file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570
> >file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b
> >file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062
> >file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8
> >file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88
> >file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f
> >file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a
> >file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261     file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed
> >file://LICENCE.Netronome;md5=cd2a3e6effe3cdf42731575b8e9477ed
> >     file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07
> >file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd     file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837
> >file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa
> >file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062
> >file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d
> >file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0     file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5      file://LICENSE.QualcommAtheros_ath10k;md5=cb42b686ee5f5cb890275e4321db60a8
> >file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498
> >file://LICENSE.radeon;md5=68ec28bacb3613200bca44f404c69b16     file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435      file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd
> >file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2
> > ad54a5
> >file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9
> >file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5     file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e
> >file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec
> >file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c     file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118
> >file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f
> >file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b
> >file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0
> >file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66
> >file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca
> >file://WHENCE;md5=08f6d4371353cac5f6fc271d5407c63e
> >  New checksum
> >file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc
> >file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728
> >file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31
> >file://LICENSE.amdgpu;md5=0aa3c2f3e736af320a08a3aeeccecf29
> >file://LICENSE.amd-ucode;md5=3a0de451253cc1edbf30a3c621effee3
> >file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13
> >file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3
> >file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc
> >file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198
> >file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea
> >file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903
> >file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed
> >file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431
> >file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8
> >file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c29
> > 6720b7d3921
> >file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293
> >file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb
> >file://GPL-2;md5=b234ee4d69f5fce4486a80fdaf4a4263
> >file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444
> >file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36
> >file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570
> >file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b
> >file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062
> >file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8
> >file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88
> >file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f
> >file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a
> >file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261     file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed
> >file://LICENCE.Netronome;md5=cd2a3e6effe3cdf42731575b8e9477ed
> >     file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07
> >file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd     file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837
> >file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa
> >file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062
> >file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d
> >file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0     file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5      file://LICENSE.QualcommAtheros_ath10k;md5=cb42b686ee5f5cb890275e4321db60a8
> >file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498
> >file://LICENSE.radeon;md5=68ec28bacb3613200bca44f404c69b16     file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435      file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd
> >file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2
> > ad54a5
> >file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9
> >file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5     file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e
> >file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec
> >file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c     file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118
> >file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f
> >file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b
> >file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0
> >file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66
> >file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca
> >file://WHENCE;md5=038edbc9e744171d8b6235e0224028ba
> >
> >
> >
> >If you believe any of these test results are incorrect, please
> >reply to the
> >mailing list (openembedded-core@lists.openembedded.org) raising
> >your concerns.
> >Otherwise we would appreciate you correcting the issues and
> >submitting a new
> >version of the patchset if applicable. Please ensure you
> >add/increment the
> >version number when sending the new version (i.e. [PATCH] ->
> >[PATCH v2] ->
> >[PATCH v3] -> ...).
> >
> >---
> >Guidelines:
> >https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> >Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> >Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> >
> >--
> >_______________________________________________
> >Openembedded-core mailing list
> >Openembedded-core@lists.openembedded.org
> >http://lists.openembedded.org/mailman/listinfo/openembedded-core

> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


