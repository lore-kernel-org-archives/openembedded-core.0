Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id BE5CD780C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 17:41:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 26 Oct 2017 10:41:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,301,1505804400"; 
	d="scan'208,217";a="1235717060"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.134])
	([10.219.128.134])
	by fmsmga002.fm.intel.com with ESMTP; 26 Oct 2017 10:41:25 -0700
Date: Thu, 26 Oct 2017 12:51:27 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-Id: <1509040287.11251.27@fm-out.intel.com>
In-Reply-To: <20171026163256.2784.63962@do.openembedded.org>
References: <20171026162106.21556-1-otavio@ossystems.com.br>
	<20171026163256.2784.63962@do.openembedded.org>
X-Mailer: geary/0.11.3
MIME-Version: 1.0
Cc: "Plascencia, Daniela" <daniela.plascencia@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Thu, 26 Oct 2017 17:41:27 -0000
Content-Type: multipart/alternative; boundary="=-OFNIdg464/Dbuq/bBH37"

--=-OFNIdg464/Dbuq/bBH37
Content-Type: text/plain; charset=utf-8; format=flowed

I believe the patchtest complain is valid, some brief explanation 
should be given.

But the way  it is present need some improvement. We should not be 
listing all licenses, just the ones that change.

Leo


On Thu, Oct 26, 2017 at 11:32 AM, Patchwork 
<patchwork@patchwork.openembedded.org> wrote:
> == Series Details ==
> 
> Series: linux-firmware: Bump to bf04291 revision
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/9498/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This 
> is
> an automated response. Several tests have been executed on the 
> proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             LIC_FILES_CHKSUM changed on target linux-firmware 
> but there was no explanation as to why in the commit message 
> [test_lic_files_chksum_modified_not_mentioned]
>   Suggested fix    Provide a reason for LIC_FILES_CHKSUM change in 
> commit message
>   Current checksum     
> file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc     
> file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728     
> file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31     
> file://LICENSE.amdgpu;md5=0aa3c2f3e736af320a08a3aeeccecf29     
> file://LICENSE.amd-ucode;md5=3a0de451253cc1edbf30a3c621effee3     
> file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13  
>    file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3     
> file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc  
>    file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198     
> file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea     
> file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903  
>    file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed     
> file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431     
> file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8     
> file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c29
>  6720b7d3921     
> file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293     
> file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb     
> file://GPL-2;md5=b234ee4d69f5fce4486a80fdaf4a4263     
> file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444     
> file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36     
> file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570     
> file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b     
> file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062     
> file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8     
> file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88  
>    file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f     
> file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a     
> file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261     
> file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed 
>     file://LICENCE.Netronome;md5=cd2a3e6effe3cdf42731575b8e9477ed
>      file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07     
> file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd     
> file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837 
>     file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa     
> file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062     
> file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d     
> file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0     
> file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5 
>     
> file://LICENSE.QualcommAtheros_ath10k;md5=cb42b686ee5f5cb890275e4321db60a8 
>     file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498  
>    file://LICENSE.radeon;md5=68ec28bacb3613200bca44f404c69b16     
> file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435 
>     
> file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd 
>     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2
>  ad54a5     
> file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9     
> file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5     
> file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e 
>     
> file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec   
>   file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c     
> file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118 
>     file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f    
>  file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b     
> file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0     
> file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66     
> file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca     
> file://WHENCE;md5=08f6d4371353cac5f6fc271d5407c63e
>   New checksum         
> file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc     
> file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728     
> file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31     
> file://LICENSE.amdgpu;md5=0aa3c2f3e736af320a08a3aeeccecf29     
> file://LICENSE.amd-ucode;md5=3a0de451253cc1edbf30a3c621effee3     
> file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13  
>    file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3     
> file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc  
>    file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198     
> file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea     
> file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903  
>    file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed     
> file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431     
> file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8     
> file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c29
>  6720b7d3921     
> file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293     
> file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb     
> file://GPL-2;md5=b234ee4d69f5fce4486a80fdaf4a4263     
> file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444     
> file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36     
> file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570     
> file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b     
> file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062     
> file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8     
> file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88  
>    file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f     
> file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a     
> file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261     
> file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed 
>     file://LICENCE.Netronome;md5=cd2a3e6effe3cdf42731575b8e9477ed
>      file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07     
> file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd     
> file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837 
>     file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa     
> file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062     
> file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d     
> file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0     
> file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5 
>     
> file://LICENSE.QualcommAtheros_ath10k;md5=cb42b686ee5f5cb890275e4321db60a8 
>     file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498  
>    file://LICENSE.radeon;md5=68ec28bacb3613200bca44f404c69b16     
> file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435 
>     
> file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd 
>     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2
>  ad54a5     
> file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9     
> file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5     
> file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e 
>     
> file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec   
>   file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c     
> file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118 
>     file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f    
>  file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b     
> file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0     
> file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66     
> file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca     
> file://WHENCE;md5=038edbc9e744171d8b6235e0224028ba
> 
> 
> 
> If you believe any of these test results are incorrect, please reply 
> to the
> mailing list (openembedded-core@lists.openembedded.org) raising your 
> concerns.
> Otherwise we would appreciate you correcting the issues and 
> submitting a new
> version of the patchset if applicable. Please ensure you 
> add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH 
> v2] ->
> [PATCH v3] -> ...).
> 
> ---
> Guidelines:     
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=-OFNIdg464/Dbuq/bBH37
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<div>I believe the patchtest complain is valid, some brief explanation shou=
ld be given.</div><div><br></div><div>But the way &nbsp;it is present need =
some improvement. We should not be listing all licenses, just the ones that=
 change.</div><div><br></div><div>Leo</div>

<br><br>On Thu, Oct 26, 2017 at 11:32 AM, Patchwork &lt;patchwork@patchwork=
.openembedded.org&gt; wrote:<br>
<blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: pr=
e-wrap;">=3D=3D Series Details =3D=3D

Series: linux-firmware: Bump to bf04291 revision
Revision: 1
URL   : <a href=3D"https://patchwork.openembedded.org/series/9498/">https:/=
/patchwork.openembedded.org/series/9498/</a>
State : failure

=3D=3D Summary =3D=3D


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             LIC_FILES_CHKSUM changed on target linux-firmware but t=
here was no explanation as to why in the commit message [test_lic_files_chk=
sum_modified_not_mentioned]=20
  Suggested fix    Provide a reason for LIC_FILES_CHKSUM change in commit m=
essage
  Current checksum     <a href=3D"file://LICENCE.Abilis;md5=3Db5ee3f410780e=
56711ad48eadc22b8bc">file://LICENCE.Abilis;md5=3Db5ee3f410780e56711ad48eadc=
22b8bc</a>     <a href=3D"file://LICENCE.adsp_sst;md5=3D615c45b91a5a4a9fe04=
6d6ab9a2df728">file://LICENCE.adsp_sst;md5=3D615c45b91a5a4a9fe046d6ab9a2df7=
28</a>     <a href=3D"file://LICENCE.agere;md5=3Daf0133de6b4a9b2522defd5f18=
8afd31">file://LICENCE.agere;md5=3Daf0133de6b4a9b2522defd5f188afd31</a>    =
 <a href=3D"file://LICENSE.amdgpu;md5=3D0aa3c2f3e736af320a08a3aeeccecf29">f=
ile://LICENSE.amdgpu;md5=3D0aa3c2f3e736af320a08a3aeeccecf29</a>     <a href=
=3D"file://LICENSE.amd-ucode;md5=3D3a0de451253cc1edbf30a3c621effee3">file:/=
/LICENSE.amd-ucode;md5=3D3a0de451253cc1edbf30a3c621effee3</a>     <a href=
=3D"file://LICENCE.atheros_firmware;md5=3D30a14c7823beedac9fa39c64fdd01a13"=
>file://LICENCE.atheros_firmware;md5=3D30a14c7823beedac9fa39c64fdd01a13</a>=
     <a href=3D"file://LICENSE.atmel;md5=3Daa74ac0c60595dee4d4e239107ea77a3=
">file://LICENSE.atmel;md5=3Daa74ac0c60595dee4d4e239107ea77a3</a>     <a hr=
ef=3D"file://LICENCE.broadcom_bcm43xx;md5=3D3160c14df7228891b868060e1951dfb=
c">file://LICENCE.broadcom_bcm43xx;md5=3D3160c14df7228891b868060e1951dfbc</=
a>     <a href=3D"file://LICENCE.ca0132;md5=3D209b33e66ee5be0461f13d31da392=
198">file://LICENCE.ca0132;md5=3D209b33e66ee5be0461f13d31da392198</a>     <=
a href=3D"file://LICENCE.cavium;md5=3Dc37aaffb1ebe5939b2580d073a95daea">fil=
e://LICENCE.cavium;md5=3Dc37aaffb1ebe5939b2580d073a95daea</a>     <a href=
=3D"file://LICENCE.chelsio_firmware;md5=3D819aa8c3fa453f1b258ed8d168a9d903"=
>file://LICENCE.chelsio_firmware;md5=3D819aa8c3fa453f1b258ed8d168a9d903</a>=
     <a href=3D"file://LICENCE.cw1200;md5=3Df0f770864e7a8444a5c5aa9d12a3a7e=
d">file://LICENCE.cw1200;md5=3Df0f770864e7a8444a5c5aa9d12a3a7ed</a>     <a =
href=3D"file://LICENSE.dib0700;md5=3Df7411825c8a555a1a3e5eab9ca773431">file=
://LICENSE.dib0700;md5=3Df7411825c8a555a1a3e5eab9ca773431</a>     <a href=
=3D"file://LICENCE.e100;md5=3Dec0f84136766df159a3ae6d02acdf5a8">file://LICE=
NCE.e100;md5=3Dec0f84136766df159a3ae6d02acdf5a8</a>     <a href=3D"file://L=
ICENCE.ene_firmware;md5=3Ded67f0f62f8f798130c29">file://LICENCE.ene_firmwar=
e;md5=3Ded67f0f62f8f798130c29</a>
 6720b7d3921     <a href=3D"file://LICENCE.fw_sst_0f28;md5=3D6353931c988ad5=
2818ae733ac61cd293">file://LICENCE.fw_sst_0f28;md5=3D6353931c988ad52818ae73=
3ac61cd293</a>     <a href=3D"file://LICENCE.go7007;md5=3Dc0bb9f6aaaba55b05=
29ee9b30aa66beb">file://LICENCE.go7007;md5=3Dc0bb9f6aaaba55b0529ee9b30aa66b=
eb</a>     <a href=3D"file://GPL-2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263">=
file://GPL-2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263</a>     <a href=3D"file=
://LICENSE.hfi1_firmware;md5=3D5e7b6e586ce7339d12689e49931ad444">file://LIC=
ENSE.hfi1_firmware;md5=3D5e7b6e586ce7339d12689e49931ad444</a>     <a href=
=3D"file://LICENCE.i2400m;md5=3D14b901969e23c41881327c0d9e4b7d36">file://LI=
CENCE.i2400m;md5=3D14b901969e23c41881327c0d9e4b7d36</a>     <a href=3D"file=
://LICENSE.i915;md5=3D2b0b2e0d20984affd4490ba2cba02570">file://LICENSE.i915=
;md5=3D2b0b2e0d20984affd4490ba2cba02570</a>     <a href=3D"file://LICENCE.i=
bt_firmware;md5=3Dfdbee1ddfe0fb7ab0b2fcd6b454a366b">file://LICENCE.ibt_firm=
ware;md5=3Dfdbee1ddfe0fb7ab0b2fcd6b454a366b</a>     <a href=3D"file://LICEN=
CE.IntcSST2;md5=3D9e7d8bea77612d7cc7d9e9b54b623062">file://LICENCE.IntcSST2=
;md5=3D9e7d8bea77612d7cc7d9e9b54b623062</a>     <a href=3D"file://LICENCE.i=
t913x;md5=3D1fbf727bfb6a949810c4dbfa7e6ce4f8">file://LICENCE.it913x;md5=3D1=
fbf727bfb6a949810c4dbfa7e6ce4f8</a>     <a href=3D"file://LICENCE.iwlwifi_f=
irmware;md5=3D3fd842911ea93c29cd32679aa23e1c88">file://LICENCE.iwlwifi_firm=
ware;md5=3D3fd842911ea93c29cd32679aa23e1c88</a>     <a href=3D"file://LICEN=
CE.kaweth;md5=3Db1d876e562f4b3b8d391ad8395dfe03f">file://LICENCE.kaweth;md5=
=3Db1d876e562f4b3b8d391ad8395dfe03f</a>     <a href=3D"file://LICENCE.Marve=
ll;md5=3D9ddea1734a4baf3c78d845151f42a37a">file://LICENCE.Marvell;md5=3D9dd=
ea1734a4baf3c78d845151f42a37a</a>     <a href=3D"file://LICENCE.moxa;md5=3D=
1086614767d8ccf744a923289d3d4261">file://LICENCE.moxa;md5=3D1086614767d8ccf=
744a923289d3d4261</a>     <a href=3D"file://LICENCE.myri10ge_firmware;md5=
=3D42e32fb89f6b959ca222e25ac8df8fed">file://LICENCE.myri10ge_firmware;md5=
=3D42e32fb89f6b959ca222e25ac8df8fed</a>     <a href=3D"file://LICENCE.Netro=
nome;md5=3Dcd2a3e6effe3cdf42731575b8e9477ed">file://LICENCE.Netronome;md5=
=3Dcd2a3e6effe3cdf42731575b8e9477ed</a>=20
     <a href=3D"file://LICENCE.nvidia;md5=3D4428a922ed3ba2ceec95f076a488ce0=
7">file://LICENCE.nvidia;md5=3D4428a922ed3ba2ceec95f076a488ce07</a>     <a =
href=3D"file://LICENCE.OLPC;md5=3D5b917f9d8c061991be4f6f5f108719cd">file://=
LICENCE.OLPC;md5=3D5b917f9d8c061991be4f6f5f108719cd</a>     <a href=3D"file=
://LICENCE.open-ath9k-htc-firmware;md5=3D1b33c9f4d17bc4d457bdb23727046837">=
file://LICENCE.open-ath9k-htc-firmware;md5=3D1b33c9f4d17bc4d457bdb237270468=
37</a>     <a href=3D"file://LICENCE.phanfw;md5=3D954dcec0e051f9409812b561e=
a743bfa">file://LICENCE.phanfw;md5=3D954dcec0e051f9409812b561ea743bfa</a>  =
   <a href=3D"file://LICENCE.qat_firmware;md5=3D9e7d8bea77612d7cc7d9e9b54b6=
23062">file://LICENCE.qat_firmware;md5=3D9e7d8bea77612d7cc7d9e9b54b623062</=
a>     <a href=3D"file://LICENCE.qla1280;md5=3Dd6895732e622d950609093223a2c=
4f5d">file://LICENCE.qla1280;md5=3Dd6895732e622d950609093223a2c4f5d</a>    =
 <a href=3D"file://LICENCE.qla2xxx;md5=3D505855e921b75f1be4a437ad9b79dff0">=
file://LICENCE.qla2xxx;md5=3D505855e921b75f1be4a437ad9b79dff0</a>     <a hr=
ef=3D"file://LICENSE.QualcommAtheros_ar3k;md5=3Db5fe244fb2b532311de1472a3bc=
06da5">file://LICENSE.QualcommAtheros_ar3k;md5=3Db5fe244fb2b532311de1472a3b=
c06da5</a>     <a href=3D"file://LICENSE.QualcommAtheros_ath10k;md5=3Dcb42b=
686ee5f5cb890275e4321db60a8">file://LICENSE.QualcommAtheros_ath10k;md5=3Dcb=
42b686ee5f5cb890275e4321db60a8</a>     <a href=3D"file://LICENCE.r8a779x_us=
b3;md5=3D4c1671656153025d7076105a5da7e498">file://LICENCE.r8a779x_usb3;md5=
=3D4c1671656153025d7076105a5da7e498</a>     <a href=3D"file://LICENSE.radeo=
n;md5=3D68ec28bacb3613200bca44f404c69b16">file://LICENSE.radeon;md5=3D68ec2=
8bacb3613200bca44f404c69b16</a>     <a href=3D"file://LICENCE.ralink_a_medi=
atek_company_firmware;md5=3D728f1a85fd53fd67fa8d7afb080bc435">file://LICENC=
E.ralink_a_mediatek_company_firmware;md5=3D728f1a85fd53fd67fa8d7afb080bc435=
</a>     <a href=3D"file://LICENCE.ralink-firmware.txt;md5=3Dab2c269277c454=
76fb449673911a2dfd">file://LICENCE.ralink-firmware.txt;md5=3Dab2c269277c454=
76fb449673911a2dfd</a>     <a href=3D"file://LICENCE.rtlwifi_firmware.txt;m=
d5=3D00d06cfd3eddd5a2698948ead2">file://LICENCE.rtlwifi_firmware.txt;md5=3D=
00d06cfd3eddd5a2698948ead2</a>
 ad54a5     <a href=3D"file://LICENSE.sdma_firmware;md5=3D51e8c19ecc2270f4b=
8ea30341ad63ce9">file://LICENSE.sdma_firmware;md5=3D51e8c19ecc2270f4b8ea303=
41ad63ce9</a>     <a href=3D"file://LICENCE.siano;md5=3D4556c1bf830067f12ca=
151ad953ec2a5">file://LICENCE.siano;md5=3D4556c1bf830067f12ca151ad953ec2a5<=
/a>     <a href=3D"file://LICENCE.tda7706-firmware.txt;md5=3D835997cf5e3c13=
1d0dddd695c7d9103e">file://LICENCE.tda7706-firmware.txt;md5=3D835997cf5e3c1=
31d0dddd695c7d9103e</a>     <a href=3D"file://LICENCE.ti-connectivity;md5=
=3Dc5e02be633f1499c109d1652514d85ec">file://LICENCE.ti-connectivity;md5=3Dc=
5e02be633f1499c109d1652514d85ec</a>     <a href=3D"file://LICENCE.ti-keysto=
ne;md5=3D3a86335d32864b0bef996bee26cc0f2c">file://LICENCE.ti-keystone;md5=
=3D3a86335d32864b0bef996bee26cc0f2c</a>     <a href=3D"file://LICENCE.ueagl=
e-atm4-firmware;md5=3D4ed7ea6b507ccc583b9d594417714118">file://LICENCE.ueag=
le-atm4-firmware;md5=3D4ed7ea6b507ccc583b9d594417714118</a>     <a href=3D"=
file://LICENCE.via_vt6656;md5=3De4159694cba42d4377a912e78a6e850f">file://LI=
CENCE.via_vt6656;md5=3De4159694cba42d4377a912e78a6e850f</a>     <a href=3D"=
file://LICENCE.wl1251;md5=3Dad3f81922bb9e197014bb187289d3b5b">file://LICENC=
E.wl1251;md5=3Dad3f81922bb9e197014bb187289d3b5b</a>     <a href=3D"file://L=
ICENCE.xc4000;md5=3D0ff51d2dc49fce04814c9155081092f0">file://LICENCE.xc4000=
;md5=3D0ff51d2dc49fce04814c9155081092f0</a>     <a href=3D"file://LICENCE.x=
c5000;md5=3D1e170c13175323c32c7f4d0998d53f66">file://LICENCE.xc5000;md5=3D1=
e170c13175323c32c7f4d0998d53f66</a>     <a href=3D"file://LICENCE.xc5000c;m=
d5=3D12b02efa3049db65d524aeb418dd87ca">file://LICENCE.xc5000c;md5=3D12b02ef=
a3049db65d524aeb418dd87ca</a>     <a href=3D"file://WHENCE;md5=3D08f6d43713=
53cac5f6fc271d5407c63e">file://WHENCE;md5=3D08f6d4371353cac5f6fc271d5407c63=
e</a>=20
  New checksum         <a href=3D"file://LICENCE.Abilis;md5=3Db5ee3f410780e=
56711ad48eadc22b8bc">file://LICENCE.Abilis;md5=3Db5ee3f410780e56711ad48eadc=
22b8bc</a>     <a href=3D"file://LICENCE.adsp_sst;md5=3D615c45b91a5a4a9fe04=
6d6ab9a2df728">file://LICENCE.adsp_sst;md5=3D615c45b91a5a4a9fe046d6ab9a2df7=
28</a>     <a href=3D"file://LICENCE.agere;md5=3Daf0133de6b4a9b2522defd5f18=
8afd31">file://LICENCE.agere;md5=3Daf0133de6b4a9b2522defd5f188afd31</a>    =
 <a href=3D"file://LICENSE.amdgpu;md5=3D0aa3c2f3e736af320a08a3aeeccecf29">f=
ile://LICENSE.amdgpu;md5=3D0aa3c2f3e736af320a08a3aeeccecf29</a>     <a href=
=3D"file://LICENSE.amd-ucode;md5=3D3a0de451253cc1edbf30a3c621effee3">file:/=
/LICENSE.amd-ucode;md5=3D3a0de451253cc1edbf30a3c621effee3</a>     <a href=
=3D"file://LICENCE.atheros_firmware;md5=3D30a14c7823beedac9fa39c64fdd01a13"=
>file://LICENCE.atheros_firmware;md5=3D30a14c7823beedac9fa39c64fdd01a13</a>=
     <a href=3D"file://LICENSE.atmel;md5=3Daa74ac0c60595dee4d4e239107ea77a3=
">file://LICENSE.atmel;md5=3Daa74ac0c60595dee4d4e239107ea77a3</a>     <a hr=
ef=3D"file://LICENCE.broadcom_bcm43xx;md5=3D3160c14df7228891b868060e1951dfb=
c">file://LICENCE.broadcom_bcm43xx;md5=3D3160c14df7228891b868060e1951dfbc</=
a>     <a href=3D"file://LICENCE.ca0132;md5=3D209b33e66ee5be0461f13d31da392=
198">file://LICENCE.ca0132;md5=3D209b33e66ee5be0461f13d31da392198</a>     <=
a href=3D"file://LICENCE.cavium;md5=3Dc37aaffb1ebe5939b2580d073a95daea">fil=
e://LICENCE.cavium;md5=3Dc37aaffb1ebe5939b2580d073a95daea</a>     <a href=
=3D"file://LICENCE.chelsio_firmware;md5=3D819aa8c3fa453f1b258ed8d168a9d903"=
>file://LICENCE.chelsio_firmware;md5=3D819aa8c3fa453f1b258ed8d168a9d903</a>=
     <a href=3D"file://LICENCE.cw1200;md5=3Df0f770864e7a8444a5c5aa9d12a3a7e=
d">file://LICENCE.cw1200;md5=3Df0f770864e7a8444a5c5aa9d12a3a7ed</a>     <a =
href=3D"file://LICENSE.dib0700;md5=3Df7411825c8a555a1a3e5eab9ca773431">file=
://LICENSE.dib0700;md5=3Df7411825c8a555a1a3e5eab9ca773431</a>     <a href=
=3D"file://LICENCE.e100;md5=3Dec0f84136766df159a3ae6d02acdf5a8">file://LICE=
NCE.e100;md5=3Dec0f84136766df159a3ae6d02acdf5a8</a>     <a href=3D"file://L=
ICENCE.ene_firmware;md5=3Ded67f0f62f8f798130c29">file://LICENCE.ene_firmwar=
e;md5=3Ded67f0f62f8f798130c29</a>
 6720b7d3921     <a href=3D"file://LICENCE.fw_sst_0f28;md5=3D6353931c988ad5=
2818ae733ac61cd293">file://LICENCE.fw_sst_0f28;md5=3D6353931c988ad52818ae73=
3ac61cd293</a>     <a href=3D"file://LICENCE.go7007;md5=3Dc0bb9f6aaaba55b05=
29ee9b30aa66beb">file://LICENCE.go7007;md5=3Dc0bb9f6aaaba55b0529ee9b30aa66b=
eb</a>     <a href=3D"file://GPL-2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263">=
file://GPL-2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263</a>     <a href=3D"file=
://LICENSE.hfi1_firmware;md5=3D5e7b6e586ce7339d12689e49931ad444">file://LIC=
ENSE.hfi1_firmware;md5=3D5e7b6e586ce7339d12689e49931ad444</a>     <a href=
=3D"file://LICENCE.i2400m;md5=3D14b901969e23c41881327c0d9e4b7d36">file://LI=
CENCE.i2400m;md5=3D14b901969e23c41881327c0d9e4b7d36</a>     <a href=3D"file=
://LICENSE.i915;md5=3D2b0b2e0d20984affd4490ba2cba02570">file://LICENSE.i915=
;md5=3D2b0b2e0d20984affd4490ba2cba02570</a>     <a href=3D"file://LICENCE.i=
bt_firmware;md5=3Dfdbee1ddfe0fb7ab0b2fcd6b454a366b">file://LICENCE.ibt_firm=
ware;md5=3Dfdbee1ddfe0fb7ab0b2fcd6b454a366b</a>     <a href=3D"file://LICEN=
CE.IntcSST2;md5=3D9e7d8bea77612d7cc7d9e9b54b623062">file://LICENCE.IntcSST2=
;md5=3D9e7d8bea77612d7cc7d9e9b54b623062</a>     <a href=3D"file://LICENCE.i=
t913x;md5=3D1fbf727bfb6a949810c4dbfa7e6ce4f8">file://LICENCE.it913x;md5=3D1=
fbf727bfb6a949810c4dbfa7e6ce4f8</a>     <a href=3D"file://LICENCE.iwlwifi_f=
irmware;md5=3D3fd842911ea93c29cd32679aa23e1c88">file://LICENCE.iwlwifi_firm=
ware;md5=3D3fd842911ea93c29cd32679aa23e1c88</a>     <a href=3D"file://LICEN=
CE.kaweth;md5=3Db1d876e562f4b3b8d391ad8395dfe03f">file://LICENCE.kaweth;md5=
=3Db1d876e562f4b3b8d391ad8395dfe03f</a>     <a href=3D"file://LICENCE.Marve=
ll;md5=3D9ddea1734a4baf3c78d845151f42a37a">file://LICENCE.Marvell;md5=3D9dd=
ea1734a4baf3c78d845151f42a37a</a>     <a href=3D"file://LICENCE.moxa;md5=3D=
1086614767d8ccf744a923289d3d4261">file://LICENCE.moxa;md5=3D1086614767d8ccf=
744a923289d3d4261</a>     <a href=3D"file://LICENCE.myri10ge_firmware;md5=
=3D42e32fb89f6b959ca222e25ac8df8fed">file://LICENCE.myri10ge_firmware;md5=
=3D42e32fb89f6b959ca222e25ac8df8fed</a>     <a href=3D"file://LICENCE.Netro=
nome;md5=3Dcd2a3e6effe3cdf42731575b8e9477ed">file://LICENCE.Netronome;md5=
=3Dcd2a3e6effe3cdf42731575b8e9477ed</a>=20
     <a href=3D"file://LICENCE.nvidia;md5=3D4428a922ed3ba2ceec95f076a488ce0=
7">file://LICENCE.nvidia;md5=3D4428a922ed3ba2ceec95f076a488ce07</a>     <a =
href=3D"file://LICENCE.OLPC;md5=3D5b917f9d8c061991be4f6f5f108719cd">file://=
LICENCE.OLPC;md5=3D5b917f9d8c061991be4f6f5f108719cd</a>     <a href=3D"file=
://LICENCE.open-ath9k-htc-firmware;md5=3D1b33c9f4d17bc4d457bdb23727046837">=
file://LICENCE.open-ath9k-htc-firmware;md5=3D1b33c9f4d17bc4d457bdb237270468=
37</a>     <a href=3D"file://LICENCE.phanfw;md5=3D954dcec0e051f9409812b561e=
a743bfa">file://LICENCE.phanfw;md5=3D954dcec0e051f9409812b561ea743bfa</a>  =
   <a href=3D"file://LICENCE.qat_firmware;md5=3D9e7d8bea77612d7cc7d9e9b54b6=
23062">file://LICENCE.qat_firmware;md5=3D9e7d8bea77612d7cc7d9e9b54b623062</=
a>     <a href=3D"file://LICENCE.qla1280;md5=3Dd6895732e622d950609093223a2c=
4f5d">file://LICENCE.qla1280;md5=3Dd6895732e622d950609093223a2c4f5d</a>    =
 <a href=3D"file://LICENCE.qla2xxx;md5=3D505855e921b75f1be4a437ad9b79dff0">=
file://LICENCE.qla2xxx;md5=3D505855e921b75f1be4a437ad9b79dff0</a>     <a hr=
ef=3D"file://LICENSE.QualcommAtheros_ar3k;md5=3Db5fe244fb2b532311de1472a3bc=
06da5">file://LICENSE.QualcommAtheros_ar3k;md5=3Db5fe244fb2b532311de1472a3b=
c06da5</a>     <a href=3D"file://LICENSE.QualcommAtheros_ath10k;md5=3Dcb42b=
686ee5f5cb890275e4321db60a8">file://LICENSE.QualcommAtheros_ath10k;md5=3Dcb=
42b686ee5f5cb890275e4321db60a8</a>     <a href=3D"file://LICENCE.r8a779x_us=
b3;md5=3D4c1671656153025d7076105a5da7e498">file://LICENCE.r8a779x_usb3;md5=
=3D4c1671656153025d7076105a5da7e498</a>     <a href=3D"file://LICENSE.radeo=
n;md5=3D68ec28bacb3613200bca44f404c69b16">file://LICENSE.radeon;md5=3D68ec2=
8bacb3613200bca44f404c69b16</a>     <a href=3D"file://LICENCE.ralink_a_medi=
atek_company_firmware;md5=3D728f1a85fd53fd67fa8d7afb080bc435">file://LICENC=
E.ralink_a_mediatek_company_firmware;md5=3D728f1a85fd53fd67fa8d7afb080bc435=
</a>     <a href=3D"file://LICENCE.ralink-firmware.txt;md5=3Dab2c269277c454=
76fb449673911a2dfd">file://LICENCE.ralink-firmware.txt;md5=3Dab2c269277c454=
76fb449673911a2dfd</a>     <a href=3D"file://LICENCE.rtlwifi_firmware.txt;m=
d5=3D00d06cfd3eddd5a2698948ead2">file://LICENCE.rtlwifi_firmware.txt;md5=3D=
00d06cfd3eddd5a2698948ead2</a>
 ad54a5     <a href=3D"file://LICENSE.sdma_firmware;md5=3D51e8c19ecc2270f4b=
8ea30341ad63ce9">file://LICENSE.sdma_firmware;md5=3D51e8c19ecc2270f4b8ea303=
41ad63ce9</a>     <a href=3D"file://LICENCE.siano;md5=3D4556c1bf830067f12ca=
151ad953ec2a5">file://LICENCE.siano;md5=3D4556c1bf830067f12ca151ad953ec2a5<=
/a>     <a href=3D"file://LICENCE.tda7706-firmware.txt;md5=3D835997cf5e3c13=
1d0dddd695c7d9103e">file://LICENCE.tda7706-firmware.txt;md5=3D835997cf5e3c1=
31d0dddd695c7d9103e</a>     <a href=3D"file://LICENCE.ti-connectivity;md5=
=3Dc5e02be633f1499c109d1652514d85ec">file://LICENCE.ti-connectivity;md5=3Dc=
5e02be633f1499c109d1652514d85ec</a>     <a href=3D"file://LICENCE.ti-keysto=
ne;md5=3D3a86335d32864b0bef996bee26cc0f2c">file://LICENCE.ti-keystone;md5=
=3D3a86335d32864b0bef996bee26cc0f2c</a>     <a href=3D"file://LICENCE.ueagl=
e-atm4-firmware;md5=3D4ed7ea6b507ccc583b9d594417714118">file://LICENCE.ueag=
le-atm4-firmware;md5=3D4ed7ea6b507ccc583b9d594417714118</a>     <a href=3D"=
file://LICENCE.via_vt6656;md5=3De4159694cba42d4377a912e78a6e850f">file://LI=
CENCE.via_vt6656;md5=3De4159694cba42d4377a912e78a6e850f</a>     <a href=3D"=
file://LICENCE.wl1251;md5=3Dad3f81922bb9e197014bb187289d3b5b">file://LICENC=
E.wl1251;md5=3Dad3f81922bb9e197014bb187289d3b5b</a>     <a href=3D"file://L=
ICENCE.xc4000;md5=3D0ff51d2dc49fce04814c9155081092f0">file://LICENCE.xc4000=
;md5=3D0ff51d2dc49fce04814c9155081092f0</a>     <a href=3D"file://LICENCE.x=
c5000;md5=3D1e170c13175323c32c7f4d0998d53f66">file://LICENCE.xc5000;md5=3D1=
e170c13175323c32c7f4d0998d53f66</a>     <a href=3D"file://LICENCE.xc5000c;m=
d5=3D12b02efa3049db65d524aeb418dd87ca">file://LICENCE.xc5000c;md5=3D12b02ef=
a3049db65d524aeb418dd87ca</a>     <a href=3D"file://WHENCE;md5=3D038edbc9e7=
44171d8b6235e0224028ba">file://WHENCE;md5=3D038edbc9e744171d8b6235e0224028b=
a</a>=20



If you believe any of these test results are incorrect, please reply to the
mailing list (<a href=3D"mailto:openembedded-core@lists.openembedded.org">o=
penembedded-core@lists.openembedded.org</a>) raising your concerns.
Otherwise we would appreciate you correcting the issues and submitting a ne=
w
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -&gt; [PATCH v2] =
-&gt;
[PATCH v3] -&gt; ...).

---
Guidelines:     <a href=3D"https://www.openembedded.org/wiki/Commit_Patch_M=
essage_Guidelines">https://www.openembedded.org/wiki/Commit_Patch_Message_G=
uidelines</a>
Test framework: <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/patcht=
est">http://git.yoctoproject.org/cgit/cgit.cgi/patchtest</a>
Test suite:     <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/patcht=
est-oe">http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe</a>

<div>--=20
</div>_______________________________________________
Openembedded-core mailing list
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</div></blockquote>=

--=-OFNIdg464/Dbuq/bBH37--
