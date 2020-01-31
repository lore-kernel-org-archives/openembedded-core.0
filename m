Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 98FCB6028B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 13:45:47 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id x123so4377966vsc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 05:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ht4qgkdrehYHBVYKCH0htic8LYHEh4ToTnbh/OuWcVs=;
	b=mn1HzmxpqPCqxiJssyJeqlOe/y7SxoFMhyJBb9ofGsFumV29hVsuZvN5YALwO5PGMK
	2h9VcD5j9XDYp/j+MwM+wbjGgwZhMlFW7vGESRDp9EVQOSwYQLoZQNrS7SxoOPJAUYnS
	pinJdPQGMBTu+jZT70g+mBjAZkAFDp/aveCsaUUKb4Siap9OUyBaAwmDGZqUgXyweCJC
	IW40cvZ7mH7dOozeZLoOg4Idvz1jTfHP9SnY11wrTvbyyZnQns6+8bd5ud2uSQO1SPCa
	7RHUj9sj3GLa84VuLHZFpueIdtXzLT+7780QjayiGCcG3WDefc6WPCrNotyhx/fszzCG
	wSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ht4qgkdrehYHBVYKCH0htic8LYHEh4ToTnbh/OuWcVs=;
	b=qPLHZVMMjY2ozZJ4Gi3gFChfSVGgov6vRMHYLVU+7xE8nu8L5RKCNFYfR4xpVMqp7R
	ZneWToywUpE2fz6C+wNhw3/KhPePV9qzRRj6QGultzK2mcVfroWHHDXilv/s7dv67xQJ
	OawMLkd+tF4lMWIDUEX/skQyHj8KSM0DF8TllRYDQdh12kjJ3QeNg4oc6UZldJXtIxgK
	Sq0OnYlR4JCwx7i8DLIxcCiJofRq5Bl07wAR0RoNBJzY0ZcYjKDoLHHQ/640J95wv8hn
	4eGtvOfcSS4ZF6i8cDajDCByQHoEVd1jB6w0TEja6dRy4ugGWHzCwa55GUN3IfrYi/+P
	bCUQ==
X-Gm-Message-State: APjAAAVsurbmgzkFZslMa/xrs0GuYmb0DAVS1A+tisyvJyzVWULk7Vm+
	DZcG+cWxaNQ228Uee9tlVyDoq7s2sruWlFmBGgIBKQ==
X-Google-Smtp-Source: APXvYqzI67idC6bRaLjA0fkOexAP2w9FfBdEfudusHW83nFqrcCjZpFCM0b7EqRwyMLw52konJEJyvaHX9Uk0Gd8ks8=
X-Received: by 2002:a67:7987:: with SMTP id u129mr6961397vsc.83.1580478348297; 
	Fri, 31 Jan 2020 05:45:48 -0800 (PST)
MIME-Version: 1.0
References: <20200131133324.3791406-1-otavio@ossystems.com.br>
	<20200131133324.3791406-2-otavio@ossystems.com.br>
In-Reply-To: <20200131133324.3791406-2-otavio@ossystems.com.br>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Jan 2020 14:45:36 +0100
Message-ID: <CANNYZj8C6JNTypMzoVSheVfCt78bxh_RdDmjjijsGhSXGB1gFg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] linux-firmware: Update 20190815 -> 20200122
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
X-List-Received-Date: Fri, 31 Jan 2020 13:45:47 -0000
Content-Type: multipart/alternative; boundary="000000000000868b87059d6fcacd"

--000000000000868b87059d6fcacd
Content-Type: text/plain; charset="UTF-8"

Hello Otavio,

I have sent a patch for the same, and I think my patch might be a bit
better as it adds the two newly added license files?
(there's been a problem with oe-core list for the past couple of days so
you may not have received it)

Alex

On Fri, 31 Jan 2020 at 14:34, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> Following changes are included:
>
> 1eb2408 linux-firmware: Update firmware file for Intel Bluetooth AX200
> 0dc1611 linux-firmware: Update firmware file for Intel Bluetooth AX201
> d03f79c linux-firmware: Update firmware file for Intel Bluetooth 9560
> aab62bc linux-firmware: Update firmware file for Intel Bluetooth 9260
> ed0aa3a nvidia: add TU102/TU104/TU106 signed firmware
> 9c340bd amdgpu: update navi10 firmware for 19.50
> 3b4a503 amdgpu: Add navi10 TA ucode
> 16cc13a Merge branch 'v1.1.3' of
> https://github.com/ruiwang-mtk/linux_fw_vpu_v1.1.3
> 7f3177d <https://github.com/ruiwang-mtk/linux_fw_vpu_v1.1.37f3177d>
> mediatek: update MT8173 VPU firmware to v1.1.3
> 67d4ff5 Mellanox: Add new mlxsw_spectrum firmware xx.2000.2714
> f1c9e7b radeon: update oland rlc microcode from amdgpu
> b1dafb7 amdgpu: update vega20 microcode for 19.50
> c38789e amdgpu: update vega12 microcode for 19.50
> 5a141c1 amdgpu: update vega10 microcode for 19.50
> a03173a amdgpu: update picasso microcode for 19.50
> 86e9a5f amdgpu: update raven2 microcode for 19.50
> febe09a amdgpu: update raven microcode for 19.50
> af76fd0 amdgpu: update navi10 microcode for 19.50
> b5b176a amdgpu: update navi14 microcode for 19.50
> ad90178 amdgpu: add TA microcode for Raven asics
> 379551b qed: Add firmware 8.42.2.0
> 58b4003 Merge branch 'RB3-wlan-firmware-1387-v2' of
> https://github.com/andersson/linux-firmware
> 5967a45 <https://github.com/andersson/linux-firmware5967a45> Adjust
> WHENCE entry to check_whence doesn't complain
> d1e743d Merge branch 'master' of https://github.com/NXP/mwifiex-firmware
> d6219ab <https://github.com/NXP/mwifiex-firmwared6219ab> qcom: Switch
> SDM845 WLAN firmware
> e65245c linux-firmware: add NXP firmware licence file
> 6871bff Merge branch 'ath10k-20191220' of git://
> git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware
> b142c2e
> <http://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmwareb142c2e>
> ath10k: WCN3990 hw1.0: add firmware WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
> 8809b87 ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.9.0.2-00070
> 513d70c ath10k: QCA988X hw2.0: update firmware-5.bin to 10.2.4-1.0-00047
> 203435b ath10k: QCA9888 hw2.0: update firmware-5.bin to 10.4-3.9.0.2-00070
> a66d2fc ath10k: QCA9887 hw1.0: update firmware-5.bin to 10.2.4-1.0-00047
> 6d19154 ath10k: QCA6174 hw3.0: update board-2.bin
> c4586ff linux-firmware: Update AMD cpu microcode
> eefb5f7 inside-secure: add new "mini" firmware for the EIP197 driver
> dd1a12e Merge branch 'RB3-adsp-cdsp-mss-v4' of
> https://github.com/andersson/linux-firmware
> c523dcd <https://github.com/andersson/linux-firmwarec523dcd> WHENCE: Add
> raspberry-pi4 SDIO file
> 99a15a4 Merge branch 'rpi4-fw' of
> https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux-firmware
> 2260cbd
> <https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux-firmware2260cbd>
> Merge branch 'master' of
> https://github.com/dikshitaagarwal/video_firmware_5.4
> 4c688be <https://github.com/dikshitaagarwal/video_firmware_5.44c688be>
> Merge branch 'for-upstream' of git://
> git.chelsio.net/pub/git/linux-firmware
> e10ed21 <http://git.chelsio.net/pub/git/linux-firmwaree10ed21> qcom:
> update venus firmware files for v5.4
> af4c4be cxgb4: Update firmware to revision 1.24.11.0
> f93c7a1 brcm: Add BCM43455 NVRAM for Raspberry Pi 4 B
> 212e441 qcom: Add SDM845 Compute DSP firmware
> ec84cf9 qcom: Add SDM845 Audio DSP firmware
> 62d0a1a qcom: Add SDM845 modem firmware
> e8a0f4c rtl_nic: add firmware rtl8168fp-3
> 9581f15 Merge branch 'nxp_mc' of https://github.com/NXP/linux-firmware
> 978c04e <https://github.com/NXP/linux-firmware978c04e> linux-firmware:
> Update NXP Management Complex firmware to version 10.18.0
> c62c3c2 linux-firmware: Update firmware file for Intel Bluetooth AX201
> 6272383 linux-firmware: Update firmware file for Intel Bluetooth AX200
> 84a7ca5 linux-firmware: Update firmware file for Intel Bluetooth 9560
> 96c3994 linux-firmware: Update firmware file for Intel Bluetooth 9260
> 7319341 amdgpu: update navi14 vcn firmware
> b363d9d amdgpu: update navi10 vcn firmware
> f1100dd Merge branch 'ehl_tgl_guc_huc' of git://
> anongit.freedesktop.org/drm/drm-firmware
> 4debf21 <http://anongit.freedesktop.org/drm/drm-firmware4debf21> i915:
> Add HuC firmware v7.0.3 for TGL
> 1eb2ac4 i915: Add GuC firmware v35.2.0 for TGL
> 4b0a210 i915: Add HuC firmware v9.0.0 for EHL
> 610fe75 i915: Add GuC firmware v33.0.4 for EHL
> 11bdc57 rtw88: RTL8723D: add firmware file v48
> 9e194c7 qed: Add firmware 8.40.33.0
> 4065643 amdgpu: add new navi14 wks gfx firmware for 19.30
> d4f88ea amdgpu: update navi14 firmware for 19.30
> ea755b6 amdgpu: update raven firmware for 19.30
> 340e06e linux-firmware: Add firmware file for Intel Bluetooth AX201
> ad7a8b2 Mellanox: Add new mlxsw_spectrum2 firmware 29.2000.2308
> e756bf3 Mellanox: Add new mlxsw_spectrum firmware 13.2000.2308
> b27d123 rtl_nic: add firmware files for RTL8153
> 180e2b4 rtl_bt: Update configuration file for BT part of RTL8822CU
> 0acd93e bnx2x: Add FW 7.13.15.0.
> 2b016af (tag: 20191022) linux-firmware: Update AMD cpu microcode
> 4c3e853 linux-firmware: Update firmware file for Intel Bluetooth AX200
> 7a79d22 linux-firmware: Update firmware file for Intel Bluetooth AX201
> fdab23a linux-firmware: Update firmware file for Intel Bluetooth 9560
> b68efd7 linux-firmware: Update firmware file for Intel Bluetooth 9260
> aa95e90 amdgpu: add initial navi14 firmware form 19.30
> c1ce20e rtlwifi: rtl8821ae: Add firmware for the RTL8812AE variant.
> 7d187ac ice: Fix up WHENCE entry and symlink
> 4c55b97 Merge branch 'dev-queue' of git://
> git.kernel.org/pub/scm/linux/kernel/git/jkirsher/firmware
> 7c4db73
> <http://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/firmware7c4db73>
> nvidia: Update Tegra210 XUSB firmware to v50.24
> c054c53 nvidia: Add XUSB firmware for Tegra194
> 9cfefbd Remove duplicate symlinks
> 2de7abd copy-firmware: Create symlinks from WHENCE file
> 2116bcd Make symlinks consistent
> c0590d8 amdgpu: update vega20 ucode for 19.30
> 43cc648 amdgpu: update vega12 ucode for 19.30
> ffa0ed7 amdgpu: update vega10 ucode for 19.30
> 83e1b41 amdgpu: update picasso ucode for 19.30
> 7008617 amdgpu: update raven2 ucode for 19.30
> 9200baa amdgpu: update raven ucode for 19.30
> f25a39c amdgpu: add new raven rlc firmware
> 9ae61e7 ice: Add package file for Intel E800 series driver
> 417a9c6 (tag: 20190923) amdgpu: add initial navi10 firmware
> 702cc63 Merge branch 'cml_tgl-icl-dmc_huc_updates' of git://
> anongit.freedesktop.org/drm/drm-firmware
> 3182b4b <http://anongit.freedesktop.org/drm/drm-firmware3182b4b> Merge
> branch 'gpu-845' of https://github.com/ndechesne/linux-firmware
> 3ea84e5 <https://github.com/ndechesne/linux-firmware3ea84e5>
> drm/i915/firmware: Add v9.0.0 of HuC for Icelake
> 60ddd0e drm/i915/firmware: Add v4.0.0 of HuC for Cometlake
> c47d8f8 drm/i915/firmware: Add v4.0.0 of HuC for Geminilake
> 2cdb78c drm/i915/firmware: Add v2.0.0 of HuC for Broxton
> 38965af drm/i915/firmware: Add v4.0.0 of HuC for Kabylake
> 8d127af drm/i915/firmware: Add v2.0.0 of HuC for Skylake
> e7b6fa7 drm/i915/firmware: Add v33 of GuC for CML
> e4ea25f drm/i915/firmware: Add v2.04 of DMC for TGL
> 51deca6 drm/i915/firmware: Add v1.09 of DMC for ICL
> 88ea23e qcom: add firmware files for Adreno a630
> 6c6918a linux-firmware: Update firmware file for Intel Bluetooth AX201
> 6ddb9d9 Merge branch 'for-upstream' of git://
> git.chelsio.net/pub/git/linux-firmware
> d45c950 <http://git.chelsio.net/pub/git/linux-firmwared45c950> nvidia:
> Add XUSB firmware for Tegra186
> 65c6595 Add symlinks for Tegra VIC firmware binaries
> 0b22bfc rtl_bt: Update RTL8723D BT FW to 0x828A_96F1
> f667c00 rtl_nic: add firmware rtl8125a-3
> fe1ae0d linux-firmware: Add firmware file for Intel Bluetooth AX201
> 2f885ba Chelsio driver loads firmware configuration file to allow firmware
> to distribute resources before chip bring up. Chelsio NIC driver, cxgb4
> searches for firmware config file at /lib/firmware/cxgb4/ directory.
> 7307a29 brcm: Add 43455 based AP6255 NVRAM for the Minix Neo Z83-4 Mini PC
> 65d02cd brcm: Add 43340 based AP6234 NVRAM for the PoV TAB-P1006W-232
> tablet
> f38fb4f Merge tag 'iwlwifi-fw-2019-08-23' of git://
> git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware
> 40e4162
> <http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware40e4162>
> iwlwifi: update FWs to core45-152 release
> c0fb3d9 check_whence: Add copy-firmware.sh to the list of ignored files
> aa703aa rtl_bt: Update RTL8822C BT FW to V0x098A_94A4
> 665001a linux-firmware: Update firmware file for Intel Bluetooth AX200
> c0ca980 linux-firmware: Update firmware file for Intel Bluetooth AX201
> b6427bf linux-firmware: Update firmware file for Intel Bluetooth 9560
> fe48882 linux-firmware: Update firmware file for Intel Bluetooth 9260
> ebd40c6 Mellanox: Add new mlxsw_spectrum firmware 13.2000.1886
>
> License-Update:
> - WHENCE:
>    - new firmware files
>    - version updates
>    - attribution of mwifiex to NXP
> - LICENSE.amdgpu: copyright year update
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  ...inux-firmware_20190815.bb => linux-firmware_20200122.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20190815.bb =>
> linux-firmware_20200122.bb} (99%)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
> b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> similarity index 99%
> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> index d83000b64f0..92a293ff703 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> @@ -66,7 +66,7 @@ LICENSE = "\
>  LIC_FILES_CHKSUM =
> "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
>
>  file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
>
>  file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
> -
> file://LICENSE.amdgpu;md5=ab515ef6495ab5c5a3b08ab2db62df11 \
> +
> file://LICENSE.amdgpu;md5=d357524f5099e2a3db3c1838921c593f \
>
>  file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
>
>  file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
>
>  file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
> @@ -123,7 +123,7 @@ LIC_FILES_CHKSUM =
> "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
>
>  file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
>
>  file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
>
>  file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
> -                    file://WHENCE;md5=37a01e379219d1e06dbccfa90a8fc0ad \
> +                    file://WHENCE;md5=c27d0c06cd5d376d8ab55860e65ba4e4 \
>                      "
>
>  # These are not common licenses, set NO_GENERIC_LICENSE for them
> @@ -192,7 +192,7 @@ NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
>
>  PE = "1"
>
> -SRCREV = "07b925b450bfb4cf3e141c612ec5b104658cd020"
> +SRCREV = "1eb2408c6feacccd10b02a49214745f15d1c6fb7"
>
>  SRC_URI = "git://
> git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
>
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000868b87059d6fcacd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Otavio,</div><div><br></div><div>I have sent a =
patch for the same, and I think my patch might be a bit better as it adds t=
he two newly added license files?</div><div>(there&#39;s been a problem wit=
h oe-core list for the past couple of days so you may not have received it)=
<br></div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 31 Jan 2020 at 14:34, O=
tavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_bl=
ank">otavio@ossystems.com.br</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Following changes are included:<br>
<br>
1eb2408 linux-firmware: Update firmware file for Intel Bluetooth AX200<br>
0dc1611 linux-firmware: Update firmware file for Intel Bluetooth AX201<br>
d03f79c linux-firmware: Update firmware file for Intel Bluetooth 9560<br>
aab62bc linux-firmware: Update firmware file for Intel Bluetooth 9260<br>
ed0aa3a nvidia: add TU102/TU104/TU106 signed firmware<br>
9c340bd amdgpu: update navi10 firmware for 19.50<br>
3b4a503 amdgpu: Add navi10 TA ucode<br>
16cc13a Merge branch &#39;v1.1.3&#39; of <a href=3D"https://github.com/ruiw=
ang-mtk/linux_fw_vpu_v1.1.37f3177d" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/ruiwang-mtk/linux_fw_vpu_v1.1.3<br>
7f3177d</a> mediatek: update MT8173 VPU firmware to v1.1.3<br>
67d4ff5 Mellanox: Add new mlxsw_spectrum firmware xx.2000.2714<br>
f1c9e7b radeon: update oland rlc microcode from amdgpu<br>
b1dafb7 amdgpu: update vega20 microcode for 19.50<br>
c38789e amdgpu: update vega12 microcode for 19.50<br>
5a141c1 amdgpu: update vega10 microcode for 19.50<br>
a03173a amdgpu: update picasso microcode for 19.50<br>
86e9a5f amdgpu: update raven2 microcode for 19.50<br>
febe09a amdgpu: update raven microcode for 19.50<br>
af76fd0 amdgpu: update navi10 microcode for 19.50<br>
b5b176a amdgpu: update navi14 microcode for 19.50<br>
ad90178 amdgpu: add TA microcode for Raven asics<br>
379551b qed: Add firmware 8.42.2.0<br>
58b4003 Merge branch &#39;RB3-wlan-firmware-1387-v2&#39; of <a href=3D"http=
s://github.com/andersson/linux-firmware5967a45" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/andersson/linux-firmware<br>
5967a45</a> Adjust WHENCE entry to check_whence doesn&#39;t complain<br>
d1e743d Merge branch &#39;master&#39; of <a href=3D"https://github.com/NXP/=
mwifiex-firmwared6219ab" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/NXP/mwifiex-firmware<br>
d6219ab</a> qcom: Switch SDM845 WLAN firmware<br>
e65245c linux-firmware: add NXP firmware licence file<br>
6871bff Merge branch &#39;ath10k-20191220&#39; of git://<a href=3D"http://g=
it.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmwareb142c2e" rel=3D"=
noreferrer" target=3D"_blank">git.kernel.org/pub/scm/linux/kernel/git/kvalo=
/linux-firmware<br>
b142c2e</a> ath10k: WCN3990 hw1.0: add firmware WLAN.HL.2.0-01387-QCAHLSWMT=
PLZ-1<br>
8809b87 ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.9.0.2-00070<=
br>
513d70c ath10k: QCA988X hw2.0: update firmware-5.bin to 10.2.4-1.0-00047<br=
>
203435b ath10k: QCA9888 hw2.0: update firmware-5.bin to 10.4-3.9.0.2-00070<=
br>
a66d2fc ath10k: QCA9887 hw1.0: update firmware-5.bin to 10.2.4-1.0-00047<br=
>
6d19154 ath10k: QCA6174 hw3.0: update board-2.bin<br>
c4586ff linux-firmware: Update AMD cpu microcode<br>
eefb5f7 inside-secure: add new &quot;mini&quot; firmware for the EIP197 dri=
ver<br>
dd1a12e Merge branch &#39;RB3-adsp-cdsp-mss-v4&#39; of <a href=3D"https://g=
ithub.com/andersson/linux-firmwarec523dcd" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/andersson/linux-firmware<br>
c523dcd</a> WHENCE: Add raspberry-pi4 SDIO file<br>
99a15a4 Merge branch &#39;rpi4-fw&#39; of <a href=3D"https://git.kernel.org=
/pub/scm/linux/kernel/git/matthias.bgg/linux-firmware2260cbd" rel=3D"norefe=
rrer" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/mat=
thias.bgg/linux-firmware<br>
2260cbd</a> Merge branch &#39;master&#39; of <a href=3D"https://github.com/=
dikshitaagarwal/video_firmware_5.44c688be" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/dikshitaagarwal/video_firmware_5.4<br>
4c688be</a> Merge branch &#39;for-upstream&#39; of git://<a href=3D"http://=
git.chelsio.net/pub/git/linux-firmwaree10ed21" rel=3D"noreferrer" target=3D=
"_blank">git.chelsio.net/pub/git/linux-firmware<br>
e10ed21</a> qcom: update venus firmware files for v5.4<br>
af4c4be cxgb4: Update firmware to revision 1.24.11.0<br>
f93c7a1 brcm: Add BCM43455 NVRAM for Raspberry Pi 4 B<br>
212e441 qcom: Add SDM845 Compute DSP firmware<br>
ec84cf9 qcom: Add SDM845 Audio DSP firmware<br>
62d0a1a qcom: Add SDM845 modem firmware<br>
e8a0f4c rtl_nic: add firmware rtl8168fp-3<br>
9581f15 Merge branch &#39;nxp_mc&#39; of <a href=3D"https://github.com/NXP/=
linux-firmware978c04e" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/NXP/linux-firmware<br>
978c04e</a> linux-firmware: Update NXP Management Complex firmware to versi=
on 10.18.0<br>
c62c3c2 linux-firmware: Update firmware file for Intel Bluetooth AX201<br>
6272383 linux-firmware: Update firmware file for Intel Bluetooth AX200<br>
84a7ca5 linux-firmware: Update firmware file for Intel Bluetooth 9560<br>
96c3994 linux-firmware: Update firmware file for Intel Bluetooth 9260<br>
7319341 amdgpu: update navi14 vcn firmware<br>
b363d9d amdgpu: update navi10 vcn firmware<br>
f1100dd Merge branch &#39;ehl_tgl_guc_huc&#39; of git://<a href=3D"http://a=
nongit.freedesktop.org/drm/drm-firmware4debf21" rel=3D"noreferrer" target=
=3D"_blank">anongit.freedesktop.org/drm/drm-firmware<br>
4debf21</a> i915: Add HuC firmware v7.0.3 for TGL<br>
1eb2ac4 i915: Add GuC firmware v35.2.0 for TGL<br>
4b0a210 i915: Add HuC firmware v9.0.0 for EHL<br>
610fe75 i915: Add GuC firmware v33.0.4 for EHL<br>
11bdc57 rtw88: RTL8723D: add firmware file v48<br>
9e194c7 qed: Add firmware 8.40.33.0<br>
4065643 amdgpu: add new navi14 wks gfx firmware for 19.30<br>
d4f88ea amdgpu: update navi14 firmware for 19.30<br>
ea755b6 amdgpu: update raven firmware for 19.30<br>
340e06e linux-firmware: Add firmware file for Intel Bluetooth AX201<br>
ad7a8b2 Mellanox: Add new mlxsw_spectrum2 firmware 29.2000.2308<br>
e756bf3 Mellanox: Add new mlxsw_spectrum firmware 13.2000.2308<br>
b27d123 rtl_nic: add firmware files for RTL8153<br>
180e2b4 rtl_bt: Update configuration file for BT part of RTL8822CU<br>
0acd93e bnx2x: Add FW 7.13.15.0.<br>
2b016af (tag: 20191022) linux-firmware: Update AMD cpu microcode<br>
4c3e853 linux-firmware: Update firmware file for Intel Bluetooth AX200<br>
7a79d22 linux-firmware: Update firmware file for Intel Bluetooth AX201<br>
fdab23a linux-firmware: Update firmware file for Intel Bluetooth 9560<br>
b68efd7 linux-firmware: Update firmware file for Intel Bluetooth 9260<br>
aa95e90 amdgpu: add initial navi14 firmware form 19.30<br>
c1ce20e rtlwifi: rtl8821ae: Add firmware for the RTL8812AE variant.<br>
7d187ac ice: Fix up WHENCE entry and symlink<br>
4c55b97 Merge branch &#39;dev-queue&#39; of git://<a href=3D"http://git.ker=
nel.org/pub/scm/linux/kernel/git/jkirsher/firmware7c4db73" rel=3D"noreferre=
r" target=3D"_blank">git.kernel.org/pub/scm/linux/kernel/git/jkirsher/firmw=
are<br>
7c4db73</a> nvidia: Update Tegra210 XUSB firmware to v50.24<br>
c054c53 nvidia: Add XUSB firmware for Tegra194<br>
9cfefbd Remove duplicate symlinks<br>
2de7abd copy-firmware: Create symlinks from WHENCE file<br>
2116bcd Make symlinks consistent<br>
c0590d8 amdgpu: update vega20 ucode for 19.30<br>
43cc648 amdgpu: update vega12 ucode for 19.30<br>
ffa0ed7 amdgpu: update vega10 ucode for 19.30<br>
83e1b41 amdgpu: update picasso ucode for 19.30<br>
7008617 amdgpu: update raven2 ucode for 19.30<br>
9200baa amdgpu: update raven ucode for 19.30<br>
f25a39c amdgpu: add new raven rlc firmware<br>
9ae61e7 ice: Add package file for Intel E800 series driver<br>
417a9c6 (tag: 20190923) amdgpu: add initial navi10 firmware<br>
702cc63 Merge branch &#39;cml_tgl-icl-dmc_huc_updates&#39; of git://<a href=
=3D"http://anongit.freedesktop.org/drm/drm-firmware3182b4b" rel=3D"noreferr=
er" target=3D"_blank">anongit.freedesktop.org/drm/drm-firmware<br>
3182b4b</a> Merge branch &#39;gpu-845&#39; of <a href=3D"https://github.com=
/ndechesne/linux-firmware3ea84e5" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/ndechesne/linux-firmware<br>
3ea84e5</a> drm/i915/firmware: Add v9.0.0 of HuC for Icelake<br>
60ddd0e drm/i915/firmware: Add v4.0.0 of HuC for Cometlake<br>
c47d8f8 drm/i915/firmware: Add v4.0.0 of HuC for Geminilake<br>
2cdb78c drm/i915/firmware: Add v2.0.0 of HuC for Broxton<br>
38965af drm/i915/firmware: Add v4.0.0 of HuC for Kabylake<br>
8d127af drm/i915/firmware: Add v2.0.0 of HuC for Skylake<br>
e7b6fa7 drm/i915/firmware: Add v33 of GuC for CML<br>
e4ea25f drm/i915/firmware: Add v2.04 of DMC for TGL<br>
51deca6 drm/i915/firmware: Add v1.09 of DMC for ICL<br>
88ea23e qcom: add firmware files for Adreno a630<br>
6c6918a linux-firmware: Update firmware file for Intel Bluetooth AX201<br>
6ddb9d9 Merge branch &#39;for-upstream&#39; of git://<a href=3D"http://git.=
chelsio.net/pub/git/linux-firmwared45c950" rel=3D"noreferrer" target=3D"_bl=
ank">git.chelsio.net/pub/git/linux-firmware<br>
d45c950</a> nvidia: Add XUSB firmware for Tegra186<br>
65c6595 Add symlinks for Tegra VIC firmware binaries<br>
0b22bfc rtl_bt: Update RTL8723D BT FW to 0x828A_96F1<br>
f667c00 rtl_nic: add firmware rtl8125a-3<br>
fe1ae0d linux-firmware: Add firmware file for Intel Bluetooth AX201<br>
2f885ba Chelsio driver loads firmware configuration file to allow firmware =
to distribute resources before chip bring up. Chelsio NIC driver, cxgb4 sea=
rches for firmware config file at /lib/firmware/cxgb4/ directory.<br>
7307a29 brcm: Add 43455 based AP6255 NVRAM for the Minix Neo Z83-4 Mini PC<=
br>
65d02cd brcm: Add 43340 based AP6234 NVRAM for the PoV TAB-P1006W-232 table=
t<br>
f38fb4f Merge tag &#39;iwlwifi-fw-2019-08-23&#39; of git://<a href=3D"http:=
//git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware40e4162" re=
l=3D"noreferrer" target=3D"_blank">git.kernel.org/pub/scm/linux/kernel/git/=
iwlwifi/linux-firmware<br>
40e4162</a> iwlwifi: update FWs to core45-152 release<br>
c0fb3d9 check_whence: Add copy-firmware.sh to the list of ignored files<br>
aa703aa rtl_bt: Update RTL8822C BT FW to V0x098A_94A4<br>
665001a linux-firmware: Update firmware file for Intel Bluetooth AX200<br>
c0ca980 linux-firmware: Update firmware file for Intel Bluetooth AX201<br>
b6427bf linux-firmware: Update firmware file for Intel Bluetooth 9560<br>
fe48882 linux-firmware: Update firmware file for Intel Bluetooth 9260<br>
ebd40c6 Mellanox: Add new mlxsw_spectrum firmware 13.2000.1886<br>
<br>
License-Update:<br>
- WHENCE:<br>
=C2=A0 =C2=A0- new firmware files<br>
=C2=A0 =C2=A0- version updates<br>
=C2=A0 =C2=A0- attribution of mwifiex to NXP<br>
- LICENSE.amdgpu: copyright year update<br>
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
---<br>
<br>
=C2=A0...<a href=3D"http://inux-firmware_20190815.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">inux-firmware_20190815.bb</a> =3D&gt; <a href=3D"http://lin=
ux-firmware_20200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmwar=
e_20200122.bb</a>} | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta/recipes-kernel/linux-firmware/{<a href=3D"http://linux-fi=
rmware_20190815.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_201=
90815.bb</a> =3D&gt; <a href=3D"http://linux-firmware_20200122.bb" rel=3D"n=
oreferrer" target=3D"_blank">linux-firmware_20200122.bb</a>} (99%)<br>
<br>
diff --git a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-fir=
mware_20190815.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_2019=
0815.bb</a> b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-fi=
rmware_20200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_202=
00122.bb</a><br>
similarity index 99%<br>
rename from meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firm=
ware_20190815.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_20190=
815.bb</a><br>
rename to meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmwa=
re_20200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_2020012=
2.bb</a><br>
index d83000b64f0..92a293ff703 100644<br>
--- a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_2=
0190815.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_20190815.bb=
</a><br>
+++ b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_2=
0200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_20200122.bb=
</a><br>
@@ -66,7 +66,7 @@ LICENSE =3D &quot;\<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENCE.Abilis;md5=3Db5ee3f410780e5=
6711ad48eadc22b8bc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENCE.adsp_sst;md5=3D615c45b91a5a4a9fe046d6ab9a2df728 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENCE.agere;md5=3Daf0133de6b4a9b2522defd5f188afd31 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSE.amdgpu;md5=3Dab515ef6495ab5c5a3b08ab2db62df11 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSE.amdgpu;md5=3Dd357524f5099e2a3db3c1838921c593f \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENSE.amd-ucode;md5=3D3c5399dc9148d7f0e1f41e34b69cf14f \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENSE.amlogic_vdec;md5=3Ddc44f59bf64a81643e500ad3f39a468a \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENCE.atheros_firmware;md5=3D30a14c7823beedac9fa39c64fdd01a13 \=
<br>
@@ -123,7 +123,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENCE.Abilis;md5=3D=
b5ee3f410780e56711ad48eadc22b8bc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENCE.xc4000;md5=3D0ff51d2dc49fce04814c9155081092f0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENCE.xc5000;md5=3D1e170c13175323c32c7f4d0998d53f66 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENCE.xc5000c;md5=3D12b02efa3049db65d524aeb418dd87ca \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://WHENCE;md5=3D37a01e379219d1e06dbccfa90a8fc0ad \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://WHENCE;md5=3Dc27d0c06cd5d376d8ab55860e65ba4e4 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;<br>
<br>
=C2=A0# These are not common licenses, set NO_GENERIC_LICENSE for them<br>
@@ -192,7 +192,7 @@ NO_GENERIC_LICENSE[WHENCE] =3D &quot;WHENCE&quot;<br>
<br>
=C2=A0PE =3D &quot;1&quot;<br>
<br>
-SRCREV =3D &quot;07b925b450bfb4cf3e141c612ec5b104658cd020&quot;<br>
+SRCREV =3D &quot;1eb2408c6feacccd10b02a49214745f15d1c6fb7&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/linu=
x/kernel/git/firmware/linux-firmware.git" rel=3D"noreferrer" target=3D"_bla=
nk">git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git</a>=
&quot;<br>
<br>
-- <br>
2.25.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000868b87059d6fcacd--
