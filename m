Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id F0BBE600BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 21:49:32 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Oct 2017 14:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,321,1505804400"; 
	d="scan'208,217";a="915581388"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.134])
	([10.219.128.134])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Oct 2017 14:49:33 -0700
Date: Mon, 30 Oct 2017 15:59:41 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-Id: <1509400781.11251.47@fm-out.intel.com>
In-Reply-To: <20171029164755.GC9221@denix.org>
References: <20171026162106.21556-1-otavio@ossystems.com.br>
	<20171026163256.2784.63962@do.openembedded.org>
	<1509040287.11251.27@fm-out.intel.com>
	<20171029164755.GC9221@denix.org>
X-Mailer: geary/0.11.3
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 30 Oct 2017 21:49:33 -0000
Content-Type: multipart/alternative; boundary="=-BPzLCKhlerbjQ2bkLQsz"

--=-BPzLCKhlerbjQ2bkLQsz
Content-Type: text/plain; charset=utf-8; format=flowed



On Sun, Oct 29, 2017 at 10:47 AM, Denys Dmytriyenko <denis@denix.org> 
wrote:
> On Thu, Oct 26, 2017 at 12:51:27PM -0500, Leonardo Sandoval wrote:
>>  I believe the patchtest complain is valid, some brief explanation
>>  should be given.
> 
> FWIW, it was mentioned in the commit log:
> 
>>  bf04291 WHENCE: Add new qed firmware
>>  d8fc990 WHENCE: Add new radeon firmware
> 
> Maybe the script needs to be smarter?

Right, we need to improve this.

The current logic is quite simple: if LIC_FILES_CHECKSUM changes, then 
look for something related to it through the following regex

    licmark  = re.compile('%s|%s|CHECKSUM|CHKSUM' % (metadata, 
license), re.IGNORECASE)

where

    metadata = 'LIC_FILES_CHKSUM'
    license  = 'LICENSE'




> 
> 
>>  But the way  it is present need some improvement. We should not be
>>  listing all licenses, just the ones that change.
>> 
>>  Leo
>> 
>> 
>>  On Thu, Oct 26, 2017 at 11:32 AM, Patchwork
>>  <patchwork@patchwork.openembedded.org> wrote:
>>  >== Series Details ==
>>  >
>>  >Series: linux-firmware: Bump to bf04291 revision
>>  >Revision: 1
>>  >URL   : https://patchwork.openembedded.org/series/9498/
>>  >State : failure
>>  >
>>  >== Summary ==
>>  >
>>  >
>>  >Thank you for submitting this patch series to OpenEmbedded Core.
>>  >This is
>>  >an automated response. Several tests have been executed on the
>>  >proposed
>>  >series by patchtest resulting in the following failures:
>>  >
>>  >
>>  >
>>  >* Issue             LIC_FILES_CHKSUM changed on target
>>  >linux-firmware but there was no explanation as to why in the
>>  >commit message [test_lic_files_chksum_modified_not_mentioned]
>>  >  Suggested fix    Provide a reason for LIC_FILES_CHKSUM change in
>>  >commit message
>>  >  Current checksum
>>  >file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc
>>  >file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728
>>  >file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31
>>  >file://LICENSE.amdgpu;md5=0aa3c2f3e736af320a08a3aeeccecf29
>>  >file://LICENSE.amd-ucode;md5=3a0de451253cc1edbf30a3c621effee3
>>  
>> >file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13
>>  >file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3
>>  
>> >file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc
>>  >file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198
>>  >file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea
>>  
>> >file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903
>>  >file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed
>>  >file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431
>>  >file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8
>>  >file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c29
>>  > 6720b7d3921
>>  >file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293
>>  >file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb
>>  >file://GPL-2;md5=b234ee4d69f5fce4486a80fdaf4a4263
>>  >file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444
>>  >file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36
>>  >file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570
>>  >file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b
>>  >file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062
>>  >file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8
>>  
>> >file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88
>>  >file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f
>>  >file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a
>>  >file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261     
>> file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed
>>  >file://LICENCE.Netronome;md5=cd2a3e6effe3cdf42731575b8e9477ed
>>  >     file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07
>>  >file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd     
>> file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837
>>  >file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa
>>  >file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062
>>  >file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d
>>  >file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0     
>> file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5 
>>      
>> file://LICENSE.QualcommAtheros_ath10k;md5=cb42b686ee5f5cb890275e4321db60a8
>>  >file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498
>>  >file://LICENSE.radeon;md5=68ec28bacb3613200bca44f404c69b16     
>> file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435 
>>      
>> file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd
>>  >file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2
>>  > ad54a5
>>  >file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9
>>  >file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5     
>> file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e
>>  >file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec
>>  >file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c    
>>  
>> file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118
>>  >file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f
>>  >file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b
>>  >file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0
>>  >file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66
>>  >file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca
>>  >file://WHENCE;md5=08f6d4371353cac5f6fc271d5407c63e
>>  >  New checksum
>>  >file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc
>>  >file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728
>>  >file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31
>>  >file://LICENSE.amdgpu;md5=0aa3c2f3e736af320a08a3aeeccecf29
>>  >file://LICENSE.amd-ucode;md5=3a0de451253cc1edbf30a3c621effee3
>>  
>> >file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13
>>  >file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3
>>  
>> >file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc
>>  >file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198
>>  >file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea
>>  
>> >file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903
>>  >file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed
>>  >file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431
>>  >file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8
>>  >file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c29
>>  > 6720b7d3921
>>  >file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293
>>  >file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb
>>  >file://GPL-2;md5=b234ee4d69f5fce4486a80fdaf4a4263
>>  >file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444
>>  >file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36
>>  >file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570
>>  >file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b
>>  >file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062
>>  >file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8
>>  
>> >file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88
>>  >file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f
>>  >file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a
>>  >file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261     
>> file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed
>>  >file://LICENCE.Netronome;md5=cd2a3e6effe3cdf42731575b8e9477ed
>>  >     file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07
>>  >file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd     
>> file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837
>>  >file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa
>>  >file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062
>>  >file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d
>>  >file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0     
>> file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5 
>>      
>> file://LICENSE.QualcommAtheros_ath10k;md5=cb42b686ee5f5cb890275e4321db60a8
>>  >file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498
>>  >file://LICENSE.radeon;md5=68ec28bacb3613200bca44f404c69b16     
>> file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435 
>>      
>> file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd
>>  >file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2
>>  > ad54a5
>>  >file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9
>>  >file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5     
>> file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e
>>  >file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec
>>  >file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c    
>>  
>> file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118
>>  >file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f
>>  >file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b
>>  >file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0
>>  >file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66
>>  >file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca
>>  >file://WHENCE;md5=038edbc9e744171d8b6235e0224028ba
>>  >
>>  >
>>  >
>>  >If you believe any of these test results are incorrect, please
>>  >reply to the
>>  >mailing list (openembedded-core@lists.openembedded.org) raising
>>  >your concerns.
>>  >Otherwise we would appreciate you correcting the issues and
>>  >submitting a new
>>  >version of the patchset if applicable. Please ensure you
>>  >add/increment the
>>  >version number when sending the new version (i.e. [PATCH] ->
>>  >[PATCH v2] ->
>>  >[PATCH v3] -> ...).
>>  >
>>  >---
>>  >Guidelines:
>>  >https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>>  >Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
>>  >Test suite:     
>> http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>>  >
>>  >--
>>  >_______________________________________________
>>  >Openembedded-core mailing list
>>  >Openembedded-core@lists.openembedded.org
>>  >http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
>>  --
>>  _______________________________________________
>>  Openembedded-core mailing list
>>  Openembedded-core@lists.openembedded.org
>>  http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

--=-BPzLCKhlerbjQ2bkLQsz
Content-Type: text/html; charset=utf-8



<br><br>On Sun, Oct 29, 2017 at 10:47 AM, Denys Dmytriyenko &lt;denis@denix.org&gt; wrote:<br>
<blockquote type="cite"><div class="plaintext" style="white-space: pre-wrap;">On Thu, Oct 26, 2017 at 12:51:27PM -0500, Leonardo Sandoval wrote:
<blockquote> I believe the patchtest complain is valid, some brief explanation
 should be given.
</blockquote>
FWIW, it was mentioned in the commit log:

<blockquote> bf04291 WHENCE: Add new qed firmware
 d8fc990 WHENCE: Add new radeon firmware
</blockquote>
Maybe the script needs to be smarter?
</div></blockquote><div><br></div><div>Right, we need to improve this.&nbsp;</div><div><br></div><div>The current logic is quite simple: if LIC_FILES_CHECKSUM changes, then look for something related to it through the following regex</div><div><br></div><div><div>&nbsp; &nbsp; licmark &nbsp;= re.compile('%s|%s|CHECKSUM|CHKSUM' % (metadata, license), re.IGNORECASE)</div></div><div><br></div><div>where</div><div><br></div><div><div>&nbsp; &nbsp; metadata = 'LIC_FILES_CHKSUM'</div><div>&nbsp; &nbsp; license &nbsp;= 'LICENSE'</div><div><br></div></div><div><br></div><div><br></div><br><blockquote type="cite"><div class="plaintext" style="white-space: pre-wrap;">

<blockquote> But the way  it is present need some improvement. We should not be
 listing all licenses, just the ones that change.
 
 Leo
 
 
 On Thu, Oct 26, 2017 at 11:32 AM, Patchwork
 &lt;<a href="mailto:patchwork@patchwork.openembedded.org">patchwork@patchwork.openembedded.org</a>&gt; wrote:
 &gt;== Series Details ==
 &gt;
 &gt;Series: linux-firmware: Bump to bf04291 revision
 &gt;Revision: 1
 &gt;URL   : <a href="https://patchwork.openembedded.org/series/9498/">https://patchwork.openembedded.org/series/9498/</a>
 &gt;State : failure
 &gt;
 &gt;== Summary ==
 &gt;
 &gt;
 &gt;Thank you for submitting this patch series to OpenEmbedded Core.
 &gt;This is
 &gt;an automated response. Several tests have been executed on the
 &gt;proposed
 &gt;series by patchtest resulting in the following failures:
 &gt;
 &gt;
 &gt;
 &gt;* Issue             LIC_FILES_CHKSUM changed on target
 &gt;linux-firmware but there was no explanation as to why in the
 &gt;commit message [test_lic_files_chksum_modified_not_mentioned]
 &gt;  Suggested fix    Provide a reason for LIC_FILES_CHKSUM change in
 &gt;commit message
 &gt;  Current checksum
 &gt;<a href="file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc">file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc</a>
 &gt;<a href="file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728">file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728</a>
 &gt;<a href="file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31">file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31</a>
 &gt;<a href="file://LICENSE.amdgpu;md5=0aa3c2f3e736af320a08a3aeeccecf29">file://LICENSE.amdgpu;md5=0aa3c2f3e736af320a08a3aeeccecf29</a>
 &gt;<a href="file://LICENSE.amd-ucode;md5=3a0de451253cc1edbf30a3c621effee3">file://LICENSE.amd-ucode;md5=3a0de451253cc1edbf30a3c621effee3</a>
 &gt;<a href="file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13">file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13</a>
 &gt;<a href="file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3">file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3</a>
 &gt;<a href="file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc">file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc</a>
 &gt;<a href="file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198">file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198</a>
 &gt;<a href="file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea">file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea</a>
 &gt;<a href="file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903">file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903</a>
 &gt;<a href="file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed">file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed</a>
 &gt;<a href="file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431">file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431</a>
 &gt;<a href="file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8">file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8</a>
 &gt;<a href="file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c29">file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c29</a>
 &gt; 6720b7d3921
 &gt;<a href="file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293">file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293</a>
 &gt;<a href="file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb">file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb</a>
 &gt;<a href="file://GPL-2;md5=b234ee4d69f5fce4486a80fdaf4a4263">file://GPL-2;md5=b234ee4d69f5fce4486a80fdaf4a4263</a>
 &gt;<a href="file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444">file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444</a>
 &gt;<a href="file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36">file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36</a>
 &gt;<a href="file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570">file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570</a>
 &gt;<a href="file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b">file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b</a>
 &gt;<a href="file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062">file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062</a>
 &gt;<a href="file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8">file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8</a>
 &gt;<a href="file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88">file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88</a>
 &gt;<a href="file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f">file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f</a>
 &gt;<a href="file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a">file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a</a>
 &gt;<a href="file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261">file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261</a>     <a href="file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed">file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed</a>
 &gt;<a href="file://LICENCE.Netronome;md5=cd2a3e6effe3cdf42731575b8e9477ed">file://LICENCE.Netronome;md5=cd2a3e6effe3cdf42731575b8e9477ed</a>
 &gt;     <a href="file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07">file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07</a>
 &gt;<a href="file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd">file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd</a>     <a href="file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837">file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837</a>
 &gt;<a href="file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa">file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa</a>
 &gt;<a href="file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062">file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062</a>
 &gt;<a href="file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d">file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d</a>
 &gt;<a href="file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0">file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0</a>     <a href="file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5">file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5</a>      <a href="file://LICENSE.QualcommAtheros_ath10k;md5=cb42b686ee5f5cb890275e4321db60a8">file://LICENSE.QualcommAtheros_ath10k;md5=cb42b686ee5f5cb890275e4321db60a8</a>
 &gt;<a href="file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498">file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498</a>
 &gt;<a href="file://LICENSE.radeon;md5=68ec28bacb3613200bca44f404c69b16">file://LICENSE.radeon;md5=68ec28bacb3613200bca44f404c69b16</a>     <a href="file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435">file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435</a>      <a href="file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd">file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd</a>
 &gt;<a href="file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2">file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2</a>
 &gt; ad54a5
 &gt;<a href="file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9">file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9</a>
 &gt;<a href="file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5">file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5</a>     <a href="file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e">file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e</a>
 &gt;<a href="file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec">file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec</a>
 &gt;<a href="file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c">file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c</a>     <a href="file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118">file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118</a>
 &gt;<a href="file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f">file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f</a>
 &gt;<a href="file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b">file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b</a>
 &gt;<a href="file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0">file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0</a>
 &gt;<a href="file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66">file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66</a>
 &gt;<a href="file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca">file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca</a>
 &gt;<a href="file://WHENCE;md5=08f6d4371353cac5f6fc271d5407c63e">file://WHENCE;md5=08f6d4371353cac5f6fc271d5407c63e</a>
 &gt;  New checksum
 &gt;<a href="file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc">file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc</a>
 &gt;<a href="file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728">file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728</a>
 &gt;<a href="file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31">file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31</a>
 &gt;<a href="file://LICENSE.amdgpu;md5=0aa3c2f3e736af320a08a3aeeccecf29">file://LICENSE.amdgpu;md5=0aa3c2f3e736af320a08a3aeeccecf29</a>
 &gt;<a href="file://LICENSE.amd-ucode;md5=3a0de451253cc1edbf30a3c621effee3">file://LICENSE.amd-ucode;md5=3a0de451253cc1edbf30a3c621effee3</a>
 &gt;<a href="file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13">file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13</a>
 &gt;<a href="file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3">file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3</a>
 &gt;<a href="file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc">file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc</a>
 &gt;<a href="file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198">file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198</a>
 &gt;<a href="file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea">file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea</a>
 &gt;<a href="file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903">file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903</a>
 &gt;<a href="file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed">file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed</a>
 &gt;<a href="file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431">file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431</a>
 &gt;<a href="file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8">file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8</a>
 &gt;<a href="file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c29">file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c29</a>
 &gt; 6720b7d3921
 &gt;<a href="file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293">file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293</a>
 &gt;<a href="file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb">file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb</a>
 &gt;<a href="file://GPL-2;md5=b234ee4d69f5fce4486a80fdaf4a4263">file://GPL-2;md5=b234ee4d69f5fce4486a80fdaf4a4263</a>
 &gt;<a href="file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444">file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444</a>
 &gt;<a href="file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36">file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36</a>
 &gt;<a href="file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570">file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570</a>
 &gt;<a href="file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b">file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b</a>
 &gt;<a href="file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062">file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062</a>
 &gt;<a href="file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8">file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8</a>
 &gt;<a href="file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88">file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88</a>
 &gt;<a href="file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f">file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f</a>
 &gt;<a href="file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a">file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a</a>
 &gt;<a href="file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261">file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261</a>     <a href="file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed">file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed</a>
 &gt;<a href="file://LICENCE.Netronome;md5=cd2a3e6effe3cdf42731575b8e9477ed">file://LICENCE.Netronome;md5=cd2a3e6effe3cdf42731575b8e9477ed</a>
 &gt;     <a href="file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07">file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07</a>
 &gt;<a href="file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd">file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd</a>     <a href="file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837">file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837</a>
 &gt;<a href="file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa">file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa</a>
 &gt;<a href="file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062">file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062</a>
 &gt;<a href="file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d">file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d</a>
 &gt;<a href="file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0">file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0</a>     <a href="file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5">file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5</a>      <a href="file://LICENSE.QualcommAtheros_ath10k;md5=cb42b686ee5f5cb890275e4321db60a8">file://LICENSE.QualcommAtheros_ath10k;md5=cb42b686ee5f5cb890275e4321db60a8</a>
 &gt;<a href="file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498">file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498</a>
 &gt;<a href="file://LICENSE.radeon;md5=68ec28bacb3613200bca44f404c69b16">file://LICENSE.radeon;md5=68ec28bacb3613200bca44f404c69b16</a>     <a href="file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435">file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435</a>      <a href="file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd">file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd</a>
 &gt;<a href="file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2">file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2</a>
 &gt; ad54a5
 &gt;<a href="file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9">file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9</a>
 &gt;<a href="file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5">file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5</a>     <a href="file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e">file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e</a>
 &gt;<a href="file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec">file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec</a>
 &gt;<a href="file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c">file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c</a>     <a href="file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118">file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118</a>
 &gt;<a href="file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f">file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f</a>
 &gt;<a href="file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b">file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b</a>
 &gt;<a href="file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0">file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0</a>
 &gt;<a href="file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66">file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66</a>
 &gt;<a href="file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca">file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca</a>
 &gt;<a href="file://WHENCE;md5=038edbc9e744171d8b6235e0224028ba">file://WHENCE;md5=038edbc9e744171d8b6235e0224028ba</a>
 &gt;
 &gt;
 &gt;
 &gt;If you believe any of these test results are incorrect, please
 &gt;reply to the
 &gt;mailing list (<a href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>) raising
 &gt;your concerns.
 &gt;Otherwise we would appreciate you correcting the issues and
 &gt;submitting a new
 &gt;version of the patchset if applicable. Please ensure you
 &gt;add/increment the
 &gt;version number when sending the new version (i.e. [PATCH] -&gt;
 &gt;[PATCH v2] -&gt;
 &gt;[PATCH v3] -&gt; ...).
 &gt;
 &gt;---
 &gt;Guidelines:
 &gt;<a href="https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines">https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines</a>
 &gt;Test framework: <a href="http://git.yoctoproject.org/cgit/cgit.cgi/patchtest">http://git.yoctoproject.org/cgit/cgit.cgi/patchtest</a>
 &gt;Test suite:     <a href="http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe">http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe</a>
 &gt;
 &gt;--
 &gt;_______________________________________________
 &gt;Openembedded-core mailing list
 &gt;<a href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
 &gt;<a href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</blockquote>
<blockquote> -- 
 _______________________________________________
 Openembedded-core mailing list
 <a href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
 <a href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</blockquote>
</div></blockquote>

--=-BPzLCKhlerbjQ2bkLQsz--
