Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1FBFA6028B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 13:33:31 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id j5so5352764qtq.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 05:33:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=NiQORHDEceimY2dcU9267eeog5+3aJ48E5hhPEcKgM0=;
	b=fXtLKwCZ/pzs7EOHhbnAUnsSUX9SfwmVpM0aI4+juFG4lZ9RS8miBhoir3Lu+NI+jx
	HH0HvfglMfBC+b0HzsnaKban8rXoB5EstME335sMqpJ+vxWxALmRKHBHmAGeVdHRQVjk
	0PmHtec/RBg5APZVeZYfuLQp6e3QT5C8aub5Zrv9N7c0PF9Nm4H7NJAE3QJfa1Fw4c2R
	nfg5X7FpRpP9g+2N4YU68gOETWgzZe2KXUms/9PaZtZsilKPC29O2CqVteALjrLAn4gp
	6QvHu+gYP5qeZGCK0HKpEfsV4oopuoneWdhdmIIsIQAJ5JuUAeGpbpDOQMGjZ4w+v5q9
	Tx3g==
X-Gm-Message-State: APjAAAUuQjoxrIgFMh1aOuy7mtLFf8faJ0b0wu9hZlfWyZ1hRA1Fkiu2
	oqqe2WcEnS4TWf7WyYEB5GBXPm6x5pI=
X-Google-Smtp-Source: APXvYqxunsGFWJ8NnpOX0u67aR62qsFvXF29tWse9rcB4b8HpSWMJNSHbe+ViYdo0SslYNzSF1iZOg==
X-Received: by 2002:aed:3286:: with SMTP id z6mr10853254qtd.303.1580477612317; 
	Fri, 31 Jan 2020 05:33:32 -0800 (PST)
Received: from localhost ([177.194.196.4])
	by smtp.gmail.com with ESMTPSA id p50sm5063867qtf.5.2020.01.31.05.33.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 31 Jan 2020 05:33:31 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Jan 2020 10:33:24 -0300
Message-Id: <20200131133324.3791406-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200131133324.3791406-1-otavio@ossystems.com.br>
References: <20200131133324.3791406-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] linux-firmware: Update 20190815 -> 20200122
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
X-List-Received-Date: Fri, 31 Jan 2020 13:33:32 -0000
Content-Transfer-Encoding: 8bit

Following changes are included:

1eb2408 linux-firmware: Update firmware file for Intel Bluetooth AX200
0dc1611 linux-firmware: Update firmware file for Intel Bluetooth AX201
d03f79c linux-firmware: Update firmware file for Intel Bluetooth 9560
aab62bc linux-firmware: Update firmware file for Intel Bluetooth 9260
ed0aa3a nvidia: add TU102/TU104/TU106 signed firmware
9c340bd amdgpu: update navi10 firmware for 19.50
3b4a503 amdgpu: Add navi10 TA ucode
16cc13a Merge branch 'v1.1.3' of https://github.com/ruiwang-mtk/linux_fw_vpu_v1.1.3
7f3177d mediatek: update MT8173 VPU firmware to v1.1.3
67d4ff5 Mellanox: Add new mlxsw_spectrum firmware xx.2000.2714
f1c9e7b radeon: update oland rlc microcode from amdgpu
b1dafb7 amdgpu: update vega20 microcode for 19.50
c38789e amdgpu: update vega12 microcode for 19.50
5a141c1 amdgpu: update vega10 microcode for 19.50
a03173a amdgpu: update picasso microcode for 19.50
86e9a5f amdgpu: update raven2 microcode for 19.50
febe09a amdgpu: update raven microcode for 19.50
af76fd0 amdgpu: update navi10 microcode for 19.50
b5b176a amdgpu: update navi14 microcode for 19.50
ad90178 amdgpu: add TA microcode for Raven asics
379551b qed: Add firmware 8.42.2.0
58b4003 Merge branch 'RB3-wlan-firmware-1387-v2' of https://github.com/andersson/linux-firmware
5967a45 Adjust WHENCE entry to check_whence doesn't complain
d1e743d Merge branch 'master' of https://github.com/NXP/mwifiex-firmware
d6219ab qcom: Switch SDM845 WLAN firmware
e65245c linux-firmware: add NXP firmware licence file
6871bff Merge branch 'ath10k-20191220' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware
b142c2e ath10k: WCN3990 hw1.0: add firmware WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
8809b87 ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.9.0.2-00070
513d70c ath10k: QCA988X hw2.0: update firmware-5.bin to 10.2.4-1.0-00047
203435b ath10k: QCA9888 hw2.0: update firmware-5.bin to 10.4-3.9.0.2-00070
a66d2fc ath10k: QCA9887 hw1.0: update firmware-5.bin to 10.2.4-1.0-00047
6d19154 ath10k: QCA6174 hw3.0: update board-2.bin
c4586ff linux-firmware: Update AMD cpu microcode
eefb5f7 inside-secure: add new "mini" firmware for the EIP197 driver
dd1a12e Merge branch 'RB3-adsp-cdsp-mss-v4' of https://github.com/andersson/linux-firmware
c523dcd WHENCE: Add raspberry-pi4 SDIO file
99a15a4 Merge branch 'rpi4-fw' of https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux-firmware
2260cbd Merge branch 'master' of https://github.com/dikshitaagarwal/video_firmware_5.4
4c688be Merge branch 'for-upstream' of git://git.chelsio.net/pub/git/linux-firmware
e10ed21 qcom: update venus firmware files for v5.4
af4c4be cxgb4: Update firmware to revision 1.24.11.0
f93c7a1 brcm: Add BCM43455 NVRAM for Raspberry Pi 4 B
212e441 qcom: Add SDM845 Compute DSP firmware
ec84cf9 qcom: Add SDM845 Audio DSP firmware
62d0a1a qcom: Add SDM845 modem firmware
e8a0f4c rtl_nic: add firmware rtl8168fp-3
9581f15 Merge branch 'nxp_mc' of https://github.com/NXP/linux-firmware
978c04e linux-firmware: Update NXP Management Complex firmware to version 10.18.0
c62c3c2 linux-firmware: Update firmware file for Intel Bluetooth AX201
6272383 linux-firmware: Update firmware file for Intel Bluetooth AX200
84a7ca5 linux-firmware: Update firmware file for Intel Bluetooth 9560
96c3994 linux-firmware: Update firmware file for Intel Bluetooth 9260
7319341 amdgpu: update navi14 vcn firmware
b363d9d amdgpu: update navi10 vcn firmware
f1100dd Merge branch 'ehl_tgl_guc_huc' of git://anongit.freedesktop.org/drm/drm-firmware
4debf21 i915: Add HuC firmware v7.0.3 for TGL
1eb2ac4 i915: Add GuC firmware v35.2.0 for TGL
4b0a210 i915: Add HuC firmware v9.0.0 for EHL
610fe75 i915: Add GuC firmware v33.0.4 for EHL
11bdc57 rtw88: RTL8723D: add firmware file v48
9e194c7 qed: Add firmware 8.40.33.0
4065643 amdgpu: add new navi14 wks gfx firmware for 19.30
d4f88ea amdgpu: update navi14 firmware for 19.30
ea755b6 amdgpu: update raven firmware for 19.30
340e06e linux-firmware: Add firmware file for Intel Bluetooth AX201
ad7a8b2 Mellanox: Add new mlxsw_spectrum2 firmware 29.2000.2308
e756bf3 Mellanox: Add new mlxsw_spectrum firmware 13.2000.2308
b27d123 rtl_nic: add firmware files for RTL8153
180e2b4 rtl_bt: Update configuration file for BT part of RTL8822CU
0acd93e bnx2x: Add FW 7.13.15.0.
2b016af (tag: 20191022) linux-firmware: Update AMD cpu microcode
4c3e853 linux-firmware: Update firmware file for Intel Bluetooth AX200
7a79d22 linux-firmware: Update firmware file for Intel Bluetooth AX201
fdab23a linux-firmware: Update firmware file for Intel Bluetooth 9560
b68efd7 linux-firmware: Update firmware file for Intel Bluetooth 9260
aa95e90 amdgpu: add initial navi14 firmware form 19.30
c1ce20e rtlwifi: rtl8821ae: Add firmware for the RTL8812AE variant.
7d187ac ice: Fix up WHENCE entry and symlink
4c55b97 Merge branch 'dev-queue' of git://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/firmware
7c4db73 nvidia: Update Tegra210 XUSB firmware to v50.24
c054c53 nvidia: Add XUSB firmware for Tegra194
9cfefbd Remove duplicate symlinks
2de7abd copy-firmware: Create symlinks from WHENCE file
2116bcd Make symlinks consistent
c0590d8 amdgpu: update vega20 ucode for 19.30
43cc648 amdgpu: update vega12 ucode for 19.30
ffa0ed7 amdgpu: update vega10 ucode for 19.30
83e1b41 amdgpu: update picasso ucode for 19.30
7008617 amdgpu: update raven2 ucode for 19.30
9200baa amdgpu: update raven ucode for 19.30
f25a39c amdgpu: add new raven rlc firmware
9ae61e7 ice: Add package file for Intel E800 series driver
417a9c6 (tag: 20190923) amdgpu: add initial navi10 firmware
702cc63 Merge branch 'cml_tgl-icl-dmc_huc_updates' of git://anongit.freedesktop.org/drm/drm-firmware
3182b4b Merge branch 'gpu-845' of https://github.com/ndechesne/linux-firmware
3ea84e5 drm/i915/firmware: Add v9.0.0 of HuC for Icelake
60ddd0e drm/i915/firmware: Add v4.0.0 of HuC for Cometlake
c47d8f8 drm/i915/firmware: Add v4.0.0 of HuC for Geminilake
2cdb78c drm/i915/firmware: Add v2.0.0 of HuC for Broxton
38965af drm/i915/firmware: Add v4.0.0 of HuC for Kabylake
8d127af drm/i915/firmware: Add v2.0.0 of HuC for Skylake
e7b6fa7 drm/i915/firmware: Add v33 of GuC for CML
e4ea25f drm/i915/firmware: Add v2.04 of DMC for TGL
51deca6 drm/i915/firmware: Add v1.09 of DMC for ICL
88ea23e qcom: add firmware files for Adreno a630
6c6918a linux-firmware: Update firmware file for Intel Bluetooth AX201
6ddb9d9 Merge branch 'for-upstream' of git://git.chelsio.net/pub/git/linux-firmware
d45c950 nvidia: Add XUSB firmware for Tegra186
65c6595 Add symlinks for Tegra VIC firmware binaries
0b22bfc rtl_bt: Update RTL8723D BT FW to 0x828A_96F1
f667c00 rtl_nic: add firmware rtl8125a-3
fe1ae0d linux-firmware: Add firmware file for Intel Bluetooth AX201
2f885ba Chelsio driver loads firmware configuration file to allow firmware to distribute resources before chip bring up. Chelsio NIC driver, cxgb4 searches for firmware config file at /lib/firmware/cxgb4/ directory.
7307a29 brcm: Add 43455 based AP6255 NVRAM for the Minix Neo Z83-4 Mini PC
65d02cd brcm: Add 43340 based AP6234 NVRAM for the PoV TAB-P1006W-232 tablet
f38fb4f Merge tag 'iwlwifi-fw-2019-08-23' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware
40e4162 iwlwifi: update FWs to core45-152 release
c0fb3d9 check_whence: Add copy-firmware.sh to the list of ignored files
aa703aa rtl_bt: Update RTL8822C BT FW to V0x098A_94A4
665001a linux-firmware: Update firmware file for Intel Bluetooth AX200
c0ca980 linux-firmware: Update firmware file for Intel Bluetooth AX201
b6427bf linux-firmware: Update firmware file for Intel Bluetooth 9560
fe48882 linux-firmware: Update firmware file for Intel Bluetooth 9260
ebd40c6 Mellanox: Add new mlxsw_spectrum firmware 13.2000.1886

License-Update:
- WHENCE:
   - new firmware files
   - version updates
   - attribution of mwifiex to NXP
- LICENSE.amdgpu: copyright year update

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...inux-firmware_20190815.bb => linux-firmware_20200122.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20190815.bb => linux-firmware_20200122.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
index d83000b64f0..92a293ff703 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
@@ -66,7 +66,7 @@ LICENSE = "\
 LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
-                    file://LICENSE.amdgpu;md5=ab515ef6495ab5c5a3b08ab2db62df11 \
+                    file://LICENSE.amdgpu;md5=d357524f5099e2a3db3c1838921c593f \
                     file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
                     file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
@@ -123,7 +123,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=37a01e379219d1e06dbccfa90a8fc0ad \
+                    file://WHENCE;md5=c27d0c06cd5d376d8ab55860e65ba4e4 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -192,7 +192,7 @@ NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
 PE = "1"
 
-SRCREV = "07b925b450bfb4cf3e141c612ec5b104658cd020"
+SRCREV = "1eb2408c6feacccd10b02a49214745f15d1c6fb7"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
 
-- 
2.25.0


