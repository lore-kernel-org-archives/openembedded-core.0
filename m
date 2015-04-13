Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B64FE6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 02:17:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3D2HKhr023814
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 19:17:21 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Sun, 12 Apr 2015 19:17:20 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Apr 2015 10:17:20 +0800
Message-ID: <109b30539abaad6dee47be2254feb6d213fbcc75.1428891074.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1428891074.git.jackie.huang@windriver.com>
References: <cover.1428891074.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] common-licenses: Add common license files for linux-firmware
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
X-List-Received-Date: Mon, 13 Apr 2015 02:17:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Jackie Huang <jackie.huang@windriver.com>

[YOCTO #7539]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/files/common-licenses/Firmware-Abilis         |  22 +
 meta/files/common-licenses/Firmware-Marvell        |  18 +
 meta/files/common-licenses/Firmware-OLPC           |  33 ++
 meta/files/common-licenses/Firmware-agere          |  77 ++++
 meta/files/common-licenses/Firmware-amd-ucode      |  64 +++
 .../common-licenses/Firmware-atheros_firmware      |  38 ++
 .../common-licenses/Firmware-broadcom_bcm43xx      |  65 +++
 meta/files/common-licenses/Firmware-ca0132         |  47 +++
 .../common-licenses/Firmware-chelsio_firmware      |  27 ++
 meta/files/common-licenses/Firmware-cw1200         |  35 ++
 meta/files/common-licenses/Firmware-dib0700        |  22 +
 meta/files/common-licenses/Firmware-ene_firmware   |  14 +
 meta/files/common-licenses/Firmware-fw_sst_0f28    |  40 ++
 meta/files/common-licenses/Firmware-go7007         | 457 +++++++++++++++++++++
 meta/files/common-licenses/Firmware-i2400m         |  43 ++
 meta/files/common-licenses/Firmware-ibt_firmware   |  39 ++
 meta/files/common-licenses/Firmware-it913x         |  17 +
 .../common-licenses/Firmware-iwlwifi_firmware      |  39 ++
 meta/files/common-licenses/Firmware-mwl8335        |  52 +++
 .../common-licenses/Firmware-myri10ge_firmware     |  28 ++
 meta/files/common-licenses/Firmware-phanfw         |  32 ++
 .../common-licenses/Firmware-qat_dh895xcc_firmware |  39 ++
 meta/files/common-licenses/Firmware-qla2xxx        |  31 ++
 meta/files/common-licenses/Firmware-r8a779x_usb3   |  26 ++
 meta/files/common-licenses/Firmware-radeon         |  51 +++
 .../files/common-licenses/Firmware-ralink-firmware |  39 ++
 .../Firmware-ralink_a_mediatek_company_firmware    |  39 ++
 .../common-licenses/Firmware-rtlwifi_firmware      |  39 ++
 .../common-licenses/Firmware-tda7706-firmware      |  48 +++
 .../files/common-licenses/Firmware-ti-connectivity |  46 +++
 .../common-licenses/Firmware-ueagle-atm4-firmware  |  39 ++
 meta/files/common-licenses/Firmware-via_vt6656     |  25 ++
 meta/files/common-licenses/Firmware-wl1251         |  59 +++
 meta/files/common-licenses/Firmware-xc4000         |  23 ++
 meta/files/common-licenses/Firmware-xc5000         |  23 ++
 meta/files/common-licenses/Firmware-xc5000c        |  23 ++
 36 files changed, 1759 insertions(+)
 create mode 100644 meta/files/common-licenses/Firmware-Abilis
 create mode 100644 meta/files/common-licenses/Firmware-Marvell
 create mode 100644 meta/files/common-licenses/Firmware-OLPC
 create mode 100644 meta/files/common-licenses/Firmware-agere
 create mode 100644 meta/files/common-licenses/Firmware-amd-ucode
 create mode 100644 meta/files/common-licenses/Firmware-atheros_firmware
 create mode 100644 meta/files/common-licenses/Firmware-broadcom_bcm43xx
 create mode 100644 meta/files/common-licenses/Firmware-ca0132
 create mode 100644 meta/files/common-licenses/Firmware-chelsio_firmware
 create mode 100644 meta/files/common-licenses/Firmware-cw1200
 create mode 100644 meta/files/common-licenses/Firmware-dib0700
 create mode 100644 meta/files/common-licenses/Firmware-ene_firmware
 create mode 100644 meta/files/common-licenses/Firmware-fw_sst_0f28
 create mode 100644 meta/files/common-licenses/Firmware-go7007
 create mode 100644 meta/files/common-licenses/Firmware-i2400m
 create mode 100644 meta/files/common-licenses/Firmware-ibt_firmware
 create mode 100644 meta/files/common-licenses/Firmware-it913x
 create mode 100644 meta/files/common-licenses/Firmware-iwlwifi_firmware
 create mode 100644 meta/files/common-licenses/Firmware-mwl8335
 create mode 100644 meta/files/common-licenses/Firmware-myri10ge_firmware
 create mode 100644 meta/files/common-licenses/Firmware-phanfw
 create mode 100644 meta/files/common-licenses/Firmware-qat_dh895xcc_firmware
 create mode 100644 meta/files/common-licenses/Firmware-qla2xxx
 create mode 100644 meta/files/common-licenses/Firmware-r8a779x_usb3
 create mode 100644 meta/files/common-licenses/Firmware-radeon
 create mode 100644 meta/files/common-licenses/Firmware-ralink-firmware
 create mode 100644 meta/files/common-licenses/Firmware-ralink_a_mediatek_company_firmware
 create mode 100644 meta/files/common-licenses/Firmware-rtlwifi_firmware
 create mode 100644 meta/files/common-licenses/Firmware-tda7706-firmware
 create mode 100644 meta/files/common-licenses/Firmware-ti-connectivity
 create mode 100644 meta/files/common-licenses/Firmware-ueagle-atm4-firmware
 create mode 100644 meta/files/common-licenses/Firmware-via_vt6656
 create mode 100644 meta/files/common-licenses/Firmware-wl1251
 create mode 100644 meta/files/common-licenses/Firmware-xc4000
 create mode 100644 meta/files/common-licenses/Firmware-xc5000
 create mode 100644 meta/files/common-licenses/Firmware-xc5000c

diff --git a/meta/files/common-licenses/Firmware-Abilis b/meta/files/common-licenses/Firmware-Abilis
new file mode 100644
index 0000000..9050d2b
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-Abilis
@@ -0,0 +1,22 @@
+Firmware provided by Pierrick Hascoet <pierrick.hascoet@abiliss.com> to Devin
+Heitmueller <dheitmueller@kernellabs.com> on January 15, 2010.
+
+The USB firmware files "dvb-as102_data1_st.hex" and "as102_data2_st.hex" for
+Abilis's AS10X, used together with the AS10X USB Kernel driver, is provided
+under the following licensing terms:
+
+Copyright (c) 2010, Abilis Systems Sarl
+
+Permission to use, copy, modify, and/or distribute this software for
+any purpose with or without fee is hereby granted, provided that the
+above copyright notice and this permission notice appear in all
+copies.
+
+THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
+WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
+WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
+AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
+DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
+PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
+TORTUOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
+PERFORMANCE OF THIS SOFTWARE.
diff --git a/meta/files/common-licenses/Firmware-Marvell b/meta/files/common-licenses/Firmware-Marvell
new file mode 100644
index 0000000..3224e1b
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-Marvell
@@ -0,0 +1,18 @@
+FIRMWARE LICENSE TERMS
+
+
+Copyright (c) Marvell International Ltd.
+
+All rights reserved.
+
+Redistribution. Redistribution and use in binary form, without modification, are permitted provided that the following conditions are met:
+
+* Redistributions must reproduce the above copyright notice and the following disclaimer in the documentation and/or other materials provided with the distribution.
+
+* Neither the name of Marvell International Ltd. nor the names of its suppliers may be used to endorse or promote products derived from this software without specific prior written permission.
+
+* No reverse engineering, decompilation, or disassembly of this software is permitted.
+
+Limited patent license. Marvell International Ltd. grants a world-wide, royalty-free, non-exclusive license under patents it now or hereafter owns or controls to make, have made, use, import, offer to sell and sell ("Utilize") this software, but solely to the extent that any such patent is necessary to Utilize the software alone, or in combination with an operating system licensed under an approved Open Source license as listed by the Open Source Initiative at http://opensource.org/licenses. The patent license shall not apply to any other combinations which include this software. No hardware per se is licensed hereunder.
+
+DISCLAIMER. THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/Firmware-OLPC b/meta/files/common-licenses/Firmware-OLPC
new file mode 100644
index 0000000..a740952
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-OLPC
@@ -0,0 +1,33 @@
+Copyright (c) 2006, One Laptop per Child and Marvell Corporation.
+All rights reserved.
+
+Redistribution.  Redistribution and use in binary form, without 
+modification, are permitted provided that the following conditions are 
+met:
+
+* Redistributions must reproduce the above copyright notice and the 
+  following disclaimer in the documentation and/or other materials 
+  provided with the distribution.
+* Neither the name of Marvell Corporation nor the names of its suppliers 
+  may be used to endorse or promote products derived from this software 
+  without specific prior written permission.
+* No reverse engineering, decompilation, or disassembly of this software 
+  is permitted.
+* You may not use or attempt to use this software in conjunction with
+  any product that is offered by a third party as a replacement,
+  substitute or alternative to a Marvell Product where a Marvell Product
+  is defined as a proprietary wireless LAN embedded client solution of
+  Marvell or a Marvell Affiliate.
+
+DISCLAIMER.  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND 
+CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, 
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND 
+FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE 
+COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
+BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS 
+OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND 
+ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR 
+TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE 
+USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH 
+DAMAGE.
diff --git a/meta/files/common-licenses/Firmware-agere b/meta/files/common-licenses/Firmware-agere
new file mode 100644
index 0000000..c11466c
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-agere
@@ -0,0 +1,77 @@
+agere_sta_fw.bin -- 9.48 Hermes I
+agere_ap_fw.bin  -- 9.48 Hermes I
+
+The above firmware images were compiled from the Agere linux driver
+wl_lkm_718_release.tar.gz, and dumped. The driver is coverred by the
+following copyright and software license.
+
+ * SOFTWARE LICENSE
+ *
+ * This software is provided subject to the following terms and conditions,
+ * which you should read carefully before using the software.  Using this
+ * software indicates your acceptance of these terms and conditions.  If you do
+ * not agree with these terms and conditions, do not use the software.
+ *
+ * COPYRIGHT © 1994 - 1995  by AT&T.                All Rights Reserved
+ * COPYRIGHT © 1996 - 2000 by Lucent Technologies.  All Rights Reserved
+ * COPYRIGHT © 2001 - 2004  by Agere Systems Inc.   All Rights Reserved
+ * All rights reserved.
+ *
+ * Redistribution and use in source or binary forms, with or without
+ * modifications, are permitted provided that the following conditions are met:
+ *
+ * . Redistributions of source code must retain the above copyright notice, this
+ *    list of conditions and the following Disclaimer as comments in the code as
+ *    well as in the documentation and/or other materials provided with the
+ *    distribution.
+ *
+ * . Redistributions in binary form must reproduce the above copyright notice,
+ *    this list of conditions and the following Disclaimer in the documentation
+ *    and/or other materials provided with the distribution.
+ *
+ * . Neither the name of Agere Systems Inc. nor the names of the contributors
+ *    may be used to endorse or promote products derived from this software
+ *    without specific prior written permission.
+ *
+ * Disclaimer
+ *
+ * THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
+ * INCLUDING, BUT NOT LIMITED TO, INFRINGEMENT AND THE IMPLIED WARRANTIES OF
+ * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  ANY
+ * USE, MODIFICATION OR DISTRIBUTION OF THIS SOFTWARE IS SOLELY AT THE USERS OWN
+ * RISK. IN NO EVENT SHALL AGERE SYSTEMS INC. OR CONTRIBUTORS BE LIABLE FOR ANY
+ * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+ * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ * ON ANY THEORY OF LIABILITY, INCLUDING, BUT NOT LIMITED TO, CONTRACT, STRICT
+ * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
+ * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
+ * DAMAGE.
+
+The following statement from Agere clarifies the status of the firmware
+
+---
+I would like to confirm that the two drivers; Linux LKM Wireless Driver
+Source Code, Version 7.18 and Linux LKM Wireless Driver Source Code,
+Version 7.22 comply with Open Source BSD License. Therefore the source
+code can be distributed in unmodified or modified form consistent with
+the terms of the license.
+
+The Linux driver architecture was based on two modules, the MSF (Module
+specific functions) and the HCF (Hardware Control Functions).  Included
+in the HCF is run-time firmware (binary format) which is downloaded into
+the RAM of the Hermes 1/2/2.5 WMAC.
+
+This hex coded firmware is not based on any open source software and
+hence it is not subject to any Open Source License.  The firmware was
+developed by Agere and runs on the DISC processor embedded within the
+Hermes 1/2/2.5 Wireless MAC devices. 
+
+Hope this helps.
+
+Sincerely,
+
+Viren Pathare
+Intellectual Property Licensing Manager
+Agere
+---
diff --git a/meta/files/common-licenses/Firmware-amd-ucode b/meta/files/common-licenses/Firmware-amd-ucode
new file mode 100644
index 0000000..9d4c425
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-amd-ucode
@@ -0,0 +1,64 @@
+Copyright (C) 2010-2013 Advanced Micro Devices, Inc., All rights reserved.
+
+Permission is hereby granted by Advanced Micro Devices, Inc. ("AMD"),
+free of any license fees, to any person obtaining a copy of this
+microcode in binary form (the "Software") ("You"), to install,
+reproduce, copy and distribute copies of the Software and to permit
+persons to whom the Software is provided to do the same, subject to
+the following terms and conditions.  Your use of any portion of the
+Software shall constitute Your acceptance of the following terms and
+conditions. If You do not agree to the following terms and conditions,
+do not use, retain or redistribute any portion of the Software.
+
+If You redistribute this Software, You must reproduce the above
+copyright notice and this license with the Software.
+Without specific, prior, written permission from AMD, You may not
+reference AMD or AMD products in the promotion of any product derived
+from or incorporating this Software in any manner that implies that
+AMD endorses or has certified such product derived from or
+incorporating this Software.
+
+You may not reverse engineer, decompile, or disassemble this Software
+or any portion thereof.
+
+THE SOFTWARE IS PROVIDED "AS IS" WITHOUT ANY EXPRESS OR IMPLIED
+WARRANTY OF ANY KIND, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
+MERCHANTABILITY, NONINFRINGEMENT, TITLE, FITNESS FOR ANY PARTICULAR
+PURPOSE, OR WARRANTIES ARISING FROM CONDUCT, COURSE OF DEALING, OR
+USAGE OF TRADE. IN NO EVENT SHALL AMD OR ITS LICENSORS BE LIABLE FOR
+ANY DAMAGES WHATSOEVER (INCLUDING, WITHOUT LIMITATION, DAMAGES FOR
+LOSS OF PROFITS, BUSINESS INTERRUPTION, OR LOSS OF DATA OR
+INFORMATION) ARISING OUT OF AMD'S NEGLIGENCE, GROSS NEGLIGENCE, THE
+USE OF OR INABILITY TO USE THE SOFTWARE, EVEN IF AMD HAS BEEN ADVISED
+OF THE POSSIBILITY OF SUCH DAMAGES. BECAUSE SOME JURISDICTIONS
+PROHIBIT THE EXCLUSION OR LIMITATION OF LIABILITY FOR CONSEQUENTIAL OR
+INCIDENTAL DAMAGES OR THE EXCLUSION OF IMPLIED WARRANTIES, THE ABOVE
+LIMITATION MAY NOT APPLY TO YOU.
+
+Without limiting the foregoing, the Software may implement third party
+technologies for which You must obtain licenses from parties other
+than AMD. You agree that AMD has not obtained or conveyed to You, and
+that You shall be responsible for obtaining the rights to use and/or
+distribute the applicable underlying intellectual property rights
+related to the third party technologies. These third party
+technologies are not licensed hereunder.
+
+If You use the Software (in whole or in part), You shall adhere to all
+applicable U.S., European, and other export laws, including but not
+limited to the U.S. Export Administration Regulations ("EAR"), (15
+C.F.R. Sections 730 through 774), and E.U. Council Regulation (EC) No
+1334/2000 of 22 June 2000. Further, pursuant to Section 740.6  of the
+EAR, You hereby certify that, except pursuant to a license granted by
+the United States Department of Commerce Bureau of Industry and
+Security or as otherwise permitted pursuant to a License Exception
+under the U.S. Export Administration Regulations ("EAR"), You will not
+(1) export, re-export or release to a national of a country in Country
+Groups D:1, E:1 or E:2 any restricted technology, software, or source
+code You receive hereunder, or (2) export to Country Groups D:1, E:1
+or E:2 the direct product of such technology or software, if such
+foreign produced direct product is subject to national security
+controls as identified on the Commerce Control List (currently found
+in Supplement 1 to Part 774 of EAR). For the most current Country
+Group listings, or for additional information about the EAR or Your
+obligations under those regulations, please refer to the U.S. Bureau
+of Industry and Security?s website at ttp://www.bis.doc.gov/.
diff --git a/meta/files/common-licenses/Firmware-atheros_firmware b/meta/files/common-licenses/Firmware-atheros_firmware
new file mode 100644
index 0000000..e0ebdac
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-atheros_firmware
@@ -0,0 +1,38 @@
+Copyright (c) 2008-2010, Atheros Communications, Inc.
+All rights reserved.
+
+Redistribution.  Redistribution and use in binary form, without
+modification, are permitted provided that the following conditions are
+met:
+
+* Redistributions must reproduce the above copyright notice and the
+  following disclaimer in the documentation and/or other materials
+  provided with the distribution.
+
+* Neither the name of Atheros Communications, Inc. nor the names of
+  its suppliers may be used to endorse or promote products derived
+  from this software without specific prior written permission.
+
+* No reverse engineering, decompilation, or disassembly of this
+  software is permitted.
+
+Limited patent license.  Atheros Communications, Inc. grants a
+world-wide, royalty-free, non-exclusive license under patents it
+now or hereafter owns or controls to make, have made, use, import,
+offer to sell and sell ("Utilize") this software, but solely to
+the extent that any such patent is necessary to Utilize the software
+in conjunction with an Atheros Chipset. The patent license shall not
+apply to any other combinations which include this software. No
+hardware per se is licensed hereunder.
+
+DISCLAIMER.  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
+CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
+FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
+THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
+BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
+OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
+TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
+USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/Firmware-broadcom_bcm43xx b/meta/files/common-licenses/Firmware-broadcom_bcm43xx
new file mode 100644
index 0000000..ff26fdd
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-broadcom_bcm43xx
@@ -0,0 +1,65 @@
+SOFTWARE LICENSE AGREEMENT
+
+The accompanying software in binary code form (“Software”), is licensed to you,
+or, if you are accepting on behalf of an entity, the entity and its affiliates
+exercising rights hereunder (“Licensee”) subject to the terms of this software
+license agreement (“Agreement”), unless Licensee and Broadcom Corporation
+(“Broadcom”) execute a separate written software license agreement governing
+use of the Software. ANY USE, REPRODUCTION, OR DISTRIBUTION OF THE SOFTWARE
+CONSTITUTES LICENSEE’S ACCEPTANCE OF THIS AGREEMENT.
+
+1.	License. Subject to the terms and conditions of this Agreement,
+Broadcom hereby grants to Licensee a limited, non-exclusive, non-transferable,
+royalty-free license: (i) to use and integrate the Software with any other
+software; and (ii) to reproduce and distribute the Software complete,
+unmodified, and as provided by Broadcom, solely for use with Broadcom
+proprietary integrated circuit product(s) sold by Broadcom with which the
+Software was designed to be used, or their successors.
+
+2.	Restrictions. Licensee shall distribute Software with a copy of this
+Agreement. Licensee shall not remove, efface or obscure any copyright or
+trademark notices from the Software. Reproductions of the Broadcom copyright
+notice shall be included with each copy of the Software, except where such
+Software is embedded in a manner not readily accessible to the end user.
+Licensee shall not: (i) use, license, sell or otherwise distribute the Software
+except as provided in this Agreement; (ii) attempt to modify in any way,
+reverse engineer, decompile or disassemble any portion of the Software; or
+(iii) use the Software or other material in violation of any applicable law or
+regulation, including but not limited to any regulatory agency. This Agreement
+shall automatically terminate upon Licensee’s failure to comply with any of the
+terms of this Agreement. In such event, Licensee will destroy all copies of the
+Software and its component parts.
+
+3.	Ownership. The Software is licensed and not sold.  Title to and
+ownership of the Software, including all intellectual property rights thereto,
+and any portion thereof remain with Broadcom or its licensors. Licensee hereby
+covenants that it will not assert any claim that the Software created by or for
+Broadcom infringe any intellectual property right owned or controlled by
+Licensee.
+
+4.     	Disclaimer. THE SOFTWARE IS OFFERED “AS IS,” AND BROADCOM PROVIDES AND
+GRANTS AND LICENSEE RECEIVES NO SUPPORT AND NO WARRANTIES OF ANY KIND, EXPRESS
+OR IMPLIED, BY STATUTE, COMMUNICATION OR CONDUCT WITH LICENSEE, OR OTHERWISE.
+BROADCOM SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A SPECIFIC PURPOSE, OR NONINFRINGEMENT CONCERNING THE SOFTWARE OR
+ANY UPGRADES TO OR DOCUMENTATION FOR THE SOFTWARE. WITHOUT LIMITATION OF THE
+ABOVE, BROADCOM GRANTS NO WARRANTY THAT THE SOFTWARE IS ERROR-FREE OR WILL
+OPERATE WITHOUT INTERRUPTION, AND GRANTS NO WARRANTY REGARDING ITS USE OR THE
+RESULTS THEREFROM INCLUDING, WITHOUT LIMITATION, ITS CORRECTNESS, ACCURACY, OR
+RELIABILITY. TO THE MAXIMUM EXTENT PERMITTED BY LAW, IN NO EVENT SHALL BROADCOM
+OR ANY OF ITS LICENSORS HAVE ANY LIABILITY FOR ANY DIRECT, INDIRECT,
+INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES, HOWEVER CAUSED AND ON ANY THEORY
+OF LIABILITY, WHETHER FOR BREACH OF CONTRACT, TORT (INCLUDING NEGLIGENCE) OR
+OTHERWISE, ARISING OUT OF THIS AGREEMENT OR USE, REPRODUCTION, OR DISTRIBUTION
+OF THE SOFTWARE, INCLUDING BUT NOT LIMITED TO LOSS OF DATA AND LOSS OF PROFITS,
+EVEN IF SUCH PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. THESE
+LIMITATIONS SHALL APPLY NOTWITHSTANDING ANY FAILURE OF ESSENTIAL PURPOSE OF ANY
+LIMITED REMEDY.
+
+5. 	Export Laws.  LICENSEE UNDERSTANDS AND AGREES THAT THE SOFTWARE IS
+SUBJECT TO UNITED STATES AND OTHER APPLICABLE EXPORT-RELATED LAWS AND
+REGULATIONS AND THAT LICENSEE MAY NOT EXPORT, RE-EXPORT OR TRANSFER THE
+SOFTWARE OR ANY DIRECT PRODUCT OF THE SOFTWARE EXCEPT AS PERMITTED UNDER THOSE
+LAWS. WITHOUT LIMITING THE FOREGOING, EXPORT, RE-EXPORT, OR TRANSFER OF THE
+SOFTWARE TO CUBA, IRAN, NORTH KOREA, SUDAN, AND SYRIA IS PROHIBITED.
+
diff --git a/meta/files/common-licenses/Firmware-ca0132 b/meta/files/common-licenses/Firmware-ca0132
new file mode 100644
index 0000000..411750a
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-ca0132
@@ -0,0 +1,47 @@
+Copyright (c) 2012, Creative Technology Ltd
+All rights reserved.
+
+Redistribution.  Redistribution and use in binary form, without
+modification, are permitted provided that the following conditions are
+met:
+
+* Redistributions must reproduce the above copyright notice and the
+  following disclaimer in the documentation and/or other materials
+  provided with the distribution.
+* Neither the name of Creative Technology Ltd or its affiliates ("CTL")
+  nor the names of its suppliers may be used to endorse or promote
+  products derived from this software without specific prior written
+  permission.
+* No reverse engineering, decompilation, or disassembly of this software
+  (or any part thereof) is permitted.
+
+Limited patent license. CTL grants a limited, world-wide,
+royalty-free, non-exclusive license under patents it now or hereafter
+owns or controls to make, have made, use, import, offer to sell and
+sell ("Utilize") this software, but strictly only to the extent that any
+such patent is necessary to Utilize the software alone, or in
+combination with an operating system licensed under an approved Open
+Source license as listed by the Open Source Initiative at
+http://opensource.org/licenses.  The patent license shall not be
+applicable, to any other combinations which include this software.
+No hardware per se is licensed hereunder.
+
+DISCLAIMER.  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
+CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
+FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
+COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
+BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
+OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
+TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
+USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
+DAMAGE.
+
+NO OTHER RIGHTS GRANTED. USER HEREBY ACKNOWLEDGES AND AGREES THAT USE OF
+THIS SOFTWARE SHALL NOT CREATE OR GIVE GROUNDS FOR A LICENSE BY
+IMPLICATION, ESTOPPEL, OR OTHERWISE TO ANY INTELLECTUAL PROPERTY RIGHTS
+(PATENT, COPYRIGHT, TRADE SECRET, MASK WORK, OR OTHER PROPRIETARY RIGHT)
+EMBODIED IN ANY OTHER CTL HARDWARE OR SOFTWARE WHETHER SOLELY OR IN
+COMBINATION WITH THIS SOFTWARE.
diff --git a/meta/files/common-licenses/Firmware-chelsio_firmware b/meta/files/common-licenses/Firmware-chelsio_firmware
new file mode 100644
index 0000000..5ae4607
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-chelsio_firmware
@@ -0,0 +1,27 @@
+Copyright (c) 2011 Chelsio Communications
+All rights reserved.
+
+Chelsio Communication Terminator 4/5 ethernet controller firmware
+
+Redistribution and use in binary form, without modification, are permitted provided
+that the following conditions are met:
+
+1. Redistribution in binary form must reproduce the above copyright notice, this
+   list of conditions and the following disclaimer in the documentation and/or
+   other materials provided with the distribution.
+2. The name of Chelsio Communications may not be used to endorse or promote products
+   derived from this software without specific prior written permission.
+3. Reverse engineering, decompilation, or disassembly of this firmware is not
+   permitted.
+
+DISCLAIMER.  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
+CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
+FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
+THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
+BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
+OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
+TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
+USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/Firmware-cw1200 b/meta/files/common-licenses/Firmware-cw1200
new file mode 100644
index 0000000..1016eca
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-cw1200
@@ -0,0 +1,35 @@
+Copyright (c) 2007-2013, ST Microelectronics NV.
+All rights reserved.
+
+Redistribution.  Redistribution and use in binary form, without modification, 
+are permitted provided that the following conditions are met:
+
+* Redistributions must reproduce the above copyright notice and the following 
+disclaimer in the documentation and/or other materials provided with the 
+distribution.
+
+* Neither the name of ST Microelectronics NV.  nor the names of its suppliers 
+may be used to endorse or promote products derived from this software without 
+specific prior written permission.
+
+* No reverse engineering, decompilation, or disassembly of this software is 
+permitted.
+
+Limited patent license.  ST Microelectronics NV. grants a world-wide, royalty-free,
+ non-exclusive license under patents it now or hereafter owns or controls to make, 
+ have made, use, import, offer to sell and sell ("Utilize") this software, but 
+ solely to the extent that any such patent is necessary to Utilize the software in 
+conjunction with an ST Microelectronics chipset. The patent license shall not 
+apply to any other combinations which include this software. No hardware per se 
+is licensed hereunder.
+
+DISCLAIMER.  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ANDCONTRIBUTORS 
+"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
+DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
+ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
+LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON 
+ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
+(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
+SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/Firmware-dib0700 b/meta/files/common-licenses/Firmware-dib0700
new file mode 100644
index 0000000..fdb6bde
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-dib0700
@@ -0,0 +1,22 @@
+Firmware provided by Patrick Boettcher <pboettcher@dibcom.fr> to Devin
+Heitmueller <dheitmueller@kernellabs.com> on October 8, 2009.
+
+The USB firmware file "dvb-usb-dib0700.1.20.fw" for DiBcom's DiB0700,
+used together with the Linux driver module dvb-usb-dib0700, is
+provided under the following licensing terms:
+
+Copyright (c) 2009, DiBcom
+
+Permission to use, copy, modify, and/or distribute this software for
+any purpose with or without fee is hereby granted, provided that the
+above copyright notice and this permission notice appear in all
+copies.
+
+THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
+WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
+WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
+AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
+DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
+PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
+TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
+PERFORMANCE OF THIS SOFTWARE.
diff --git a/meta/files/common-licenses/Firmware-ene_firmware b/meta/files/common-licenses/Firmware-ene_firmware
new file mode 100644
index 0000000..08f2b01
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-ene_firmware
@@ -0,0 +1,14 @@
+copyright (c) 2011, ENE TECHNOLOGY INC.
+
+Permission to use, copy, modify, and/or distribute this software for any purpose
+with or without fee is hereby granted, provided that the above copyright notice
+and this permission notice appear in all copies.
+
+THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
+WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT
+SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR
+CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
+LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
+NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION
+WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
diff --git a/meta/files/common-licenses/Firmware-fw_sst_0f28 b/meta/files/common-licenses/Firmware-fw_sst_0f28
new file mode 100644
index 0000000..247e35f
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-fw_sst_0f28
@@ -0,0 +1,40 @@
+Copyright (c) 2014 Intel Corporation.
+All rights reserved.
+
+Redistribution.
+
+Redistribution and use in binary form, without modification, are permitted
+provided that the following conditions are met:
+*    Redistributions must reproduce the above copyright notice and the
+     following disclaimer in the documentation and/or other materials provided
+     with the distribution.
+*    Neither the name of Intel Corporation nor the names of its suppliers may
+     be used to endorse or promote products derived from this software without
+     specific prior written permission.
+*    No reverse engineering, decompilation, or disassembly of this software is
+     permitted.
+
+
+Limited patent license.
+
+Intel Corporation grants a world-wide, royalty-free, non-exclusive license
+under patents it now or hereafter owns or controls to make, have made, use,
+import, offer to sell and sell ("Utilize") this software, but solely to the
+extent that any such patent is necessary to Utilize the software alone. The
+patent license shall not apply to any combinations which include this software.
+No hardware per se is licensed hereunder.
+
+
+DISCLAIMER.
+
+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
+LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/Firmware-go7007 b/meta/files/common-licenses/Firmware-go7007
new file mode 100644
index 0000000..3689f3b
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-go7007
@@ -0,0 +1,457 @@
+The README file from the original package from Micronas appears below. Only
+the part about the firmware redistribution in section 0 is relevant, all
+other sections are completely obsolete.
+
+---------------------------------------------------------------------------
+                     WIS GO7007SB Public Linux Driver
+---------------------------------------------------------------------------
+
+
+*** Please see the file RELEASE-NOTES for important last-minute updates ***
+
+
+  0. OVERVIEW AND LICENSING/DISCLAIMER
+
+
+This driver kit contains Linux drivers for the WIS GO7007SB multi-format
+video encoder.  Only kernel version 2.6.x is supported.  The video stream
+is available through the Video4Linux2 API and the audio stream is available
+through the ALSA API (or the OSS emulation layer of the ALSA system).
+
+The files in kernel/ and hotplug/ are licensed under the GNU General Public
+License Version 2 from the Free Software Foundation.  A copy of the license
+is included in the file COPYING.
+
+The example applications in apps/ and C header files in include/ are
+licensed under a permissive license included in the source files which
+allows copying, modification and redistribution for any purpose without
+attribution.
+
+The firmware files included in the firmware/ directory may be freely
+redistributed only in conjunction with this document; but modification,
+tampering and reverse engineering are prohibited.
+
+MICRONAS USA, INC., MAKES NO WARRANTIES TO ANY PERSON OR ENTITY WITH
+RESPECT TO THE SOFTWARE OR ANY DERIVATIVES THEREOF OR ANY SERVICES OR
+LICENSES AND DISCLAIMS ALL IMPLIED WARRANTIES, INCLUDING WITHOUT LIMITATION
+WARRANTIES OF MERCHANTABILITY, SUPPORT, AND FITNESS FOR A PARTICULAR
+PURPOSE AND NON-INFRINGEMENT.
+
+
+  1. SYSTEM REQUIREMENTS
+
+
+This driver requires Linux kernel 2.6.  Kernel 2.4 is not supported.  Using
+kernel 2.6.10 or later is recommended, as earlier kernels are known to have
+unstable USB 2.0 support.
+
+A fully built kernel source tree must be available.  Typically this will be
+linked from "/lib/modules/<KERNEL VERSION>/build" for convenience.  If this
+link does not exist, an extra parameter will need to be passed to the
+`make` command.
+
+All vendor-built kernels should already be configured properly.  However,
+for custom-built kernels, the following options need to be enabled in the
+kernel as built-in or modules:
+
+        CONFIG_HOTPLUG           - Support for hot-pluggable devices
+        CONFIG_MODULES           - Enable loadable module support
+        CONFIG_KMOD              - Automatic kernel module loading
+        CONFIG_FW_LOADER         - Hotplug firmware loading support
+        CONFIG_I2C               - I2C support
+        CONFIG_VIDEO_DEV         - Video For Linux
+        CONFIG_SOUND             - Sound card support
+        CONFIG_SND               - Advanced Linux Sound Architecture
+        CONFIG_USB               - Support for Host-side USB
+        CONFIG_USB_DEVICEFS      - USB device filesystem
+        CONFIG_USB_EHCI_HCD      - EHCI HCD (USB 2.0) support
+
+Additionally, to use the example application, the following options need to
+be enabled in the ALSA section:
+
+        CONFIG_SND_MIXER_OSS     - OSS Mixer API
+        CONFIG_SND_PCM_OSS       - OSS PCM (digital audio) API
+
+The hotplug scripts, along with the fxload utility, must also be installed.
+These scripts can be obtained from <http://linux-hotplug.sourceforge.net/>.
+Hotplugging is used for loading firmware into the Cypruss EZ-USB chip using
+fxload and for loading firmware into the driver using the firmware agent.
+
+
+  2. COMPILING AND INSTALLING THE DRIVER
+
+
+Most users should be able to compile the driver by simply running:
+
+        $ make
+
+in the top-level directory of the driver kit.  First the kernel modules
+will be built, followed by the example applications.
+
+If the build system is unable to locate the kernel source tree for the
+currently-running kernel, or if the module should be built for a kernel
+other than the currently-running kernel, an additional parameter will need
+to be passed to make to specify the appropriate kernel source directory:
+
+        $ make KERNELSRC=/usr/src/linux-2.6.10-custom3
+
+Once the compile completes, the driver and firmware files should be
+installed by running:
+
+        $ make install
+
+The kernel modules will be placed in "/lib/modules/<KERNEL VERSION>/extra"
+and the firmware files will be placed in the appropriate hotplug firmware
+directory, usually /lib/firmware.  In addition, USB maps and scripts will
+be placed in /etc/hotplug/usb to enable fxload to initialize the EZ-USB
+control chip when the device is connected.
+
+
+  3. PAL/SECAM TUNER CONFIGURATION (TV402U-EU only)
+
+
+The PAL model of the Plextor ConvertX TV402U may require additional
+configuration to correctly select the appropriate TV frequency band and
+audio subchannel.
+
+Users with a device other than the Plextor ConvertX TV402U-EU should skip
+this section.
+
+The wide variety of PAL TV systems used in Europe requires that additional
+information about the local TV standards be passed to the driver in order
+to properly tune TV channels.  The two necessary parameters are (a) the PAL
+TV band, and (b) the audio subchannel format in use.
+
+In many cases, the appropriate TV band selection is passed to the driver
+from applications.  However, in some cases, the application only specifies
+that the driver should use PAL but not the specific information about the
+appropriate TV band.  To work around this issue, the correct TV band may be
+specified in the "force_band" parameter to the wis-sony-tuner module:
+
+     TV band           force_band
+     -------           ----------
+     PAL B/G                B
+     PAL I                  I
+     PAL D/K                D
+     SECAM L                L
+
+If the "force_band" parameter is specified, the driver will ignore any TV
+band specified by applications and will always use the band provided in the
+module parameter.
+
+The other parameter that can be specified is the audio subchannel format.
+There are several stereo audio carrier systems in use, including NICAM and
+three varieties of A2.  To receive audio broadcast on one of these stereo
+carriers, the "force_mpx_mode" parameter must be specified to the
+wis-sony-tuner module.
+
+     TV band           Audio subcarrier       force_mpx_mode
+     -------           ----------------       --------------
+     PAL B/G            Mono (default)               1
+     PAL B/G                  A2                     2
+     PAL B/G                 NICAM                   3
+     PAL I              Mono (default)               4
+     PAL I                   NICAM                   5
+     PAL D/K            Mono (default)               6
+     PAL D/K                 A2 (1)                  7
+     PAL D/K                 A2 (2)                  8
+     PAL D/K                 A2 (3)                  9
+     PAL D/K                 NICAM                  10
+     SECAM L            Mono (default)              11
+     SECAM L                 NICAM                  12
+
+If the "force_mpx_mode" parameter is not specified, the correct mono-only
+mode will be chosen based on the TV band.  However, the tuner will not
+receive stereo audio or bilingual broadcasts correctly.
+
+To pass the "force_band" or "force_mpx_mode" parameters to the
+wis-sony-tuner module, the following line must be added to the modprobe
+configuration file, which varies from one Linux distribution to another.
+
+     options wis-sony-tuner force_band=B force_mpx_mode=2
+
+The above example would force the tuner to the PAL B/G TV band and receive
+stereo audio broadcasts on the A2 carrier.
+
+To verify that the configuration has been placed in the correct location,
+execute:
+
+        $ modprobe -c | grep wis-sony-tuner
+
+If the configuration line appears, then modprobe will pass the parameters
+correctly the next time the wis-sony-tuner module is loaded into the
+kernel.
+
+
+  4. TESTING THE DRIVER
+
+
+Because few Linux applications are able to correctly capture from
+Video4Linux2 devices with only compressed formats supported, the new driver
+should be tested with the "gorecord" application in the apps/ directory.
+
+First connect a video source to the device, such as a DVD player or VCR.
+This will be captured to a file for testing the driver.  If an input source
+is unavailable, a test file can still be captured, but the video will be
+black and the audio will be silent.
+
+This application will auto-detect the V4L2 and ALSA/OSS device names of the
+hardware and will record video and audio to an AVI file for a specified
+number of seconds.  For example:
+
+        $ apps/gorecord -duration 60 capture.avi
+
+If this application does not successfully record an AVI file, the error
+messages produced by gorecord and recorded in the system log (usually in
+/var/log/messages) should provide information to help resolve the problem.
+
+Supplying no parameters to gorecord will cause it to probe the available
+devices and exit.  Use the -help flag for usage information.
+
+
+  5. USING THE DRIVER
+
+
+The V4L2 device implemented by the driver provides a standard compressed
+format API, within the following criteria:
+
+  * Applications that only support the original Video4Linux1 API will not
+    be able to communicate with this driver at all.
+
+  * No raw video modes are supported, so applications like xawtv that
+    expect only uncompressed video will not function.
+
+  * Supported compression formats are: Motion-JPEG, MPEG1, MPEG2 and MPEG4.
+
+  * MPEG video formats are delivered as Video Elementary Streams only.
+    Program Stream (PS), Transport Stream (TS) and Packetized Elementary
+    Stream (PES) formats are not supported.
+
+  * Video parameters such as format and input port may not be changed while
+    the encoder is active.
+
+  * The audio capture device only functions when the video encoder is
+    actively capturing video.  Attempts to read from the audio device when
+    the encoder is inactive will result in an I/O error.
+
+  * The native format of the audio device is 48Khz 2-channel 16-bit
+    little-endian PCM, delivered through the ALSA system.  No audio
+    compression is implemented in the hardware.  ALSA may convert to other
+    uncompressed formats on the fly.
+
+The include/ directory contains a C header file describing non-standard
+features of the GO7007SB encoder, which are described below:
+
+
+  GO7007IOC_S_COMP_PARAMS, GO7007IOC_G_COMP_PARAMS
+
+    These ioctls are used to negotiate general compression parameters.
+
+    To query the current parameters, call the GO7007IOC_G_COMP_PARAMS ioctl
+    with a pointer to a struct go7007_comp_params.  If the driver is not
+    set to MPEG format, the EINVAL error code will be returned.
+
+    To change the current parameters, initialize all fields of a struct
+    go7007_comp_params and call the GO7007_IOC_S_COMP_PARAMS ioctl with a
+    pointer to this structure.  The driver will return the current
+    parameters with any necessary changes to conform to the limitations of
+    the hardware or current compression mode.  Any or all fields can be set
+    to zero to request a reasonable default value.  If the driver is not
+    set to MPEG format, the EINVAL error code will be returned.  When I/O
+    is in progress, the EBUSY error code will be returned.
+
+    Fields in struct go7007_comp_params:
+
+        __u32                        The maximum number of frames in each
+          gop_size                   Group Of Pictures; i.e. the maximum
+                                     number of frames minus one between
+                                     each key frame.
+
+        __u32                        The maximum number of sequential
+          max_b_frames               bidirectionally-predicted frames.
+                                     (B-frames are not yet supported.)
+
+        enum go7007_aspect_ratio     The aspect ratio to be encoded in the
+          aspect_ratio               meta-data of the compressed format.
+
+                                     Choices are:
+                                        GO7007_ASPECT_RATIO_1_1
+                                        GO7007_ASPECT_RATIO_4_3_NTSC
+                                        GO7007_ASPECT_RATIO_4_3_PAL
+                                        GO7007_ASPECT_RATIO_16_9_NTSC
+                                        GO7007_ASPECT_RATIO_16_9_PAL
+
+        __u32                        Bit-wise OR of control flags (below)
+          flags
+
+    Flags in struct go7007_comp_params:
+
+        GO7007_COMP_CLOSED_GOP       Only produce self-contained GOPs, used
+                                     to produce streams appropriate for
+                                     random seeking.
+
+        GO7007_COMP_OMIT_SEQ_HEADER  Omit the stream sequence header.
+
+
+  GO7007IOC_S_MPEG_PARAMS, GO7007IOC_G_MPEG_PARAMS
+
+    These ioctls are used to negotiate MPEG-specific stream parameters when
+    the pixelformat has been set to V4L2_PIX_FMT_MPEG.
+
+    To query the current parameters, call the GO7007IOC_G_MPEG_PARAMS ioctl
+    with a pointer to a struct go7007_mpeg_params.  If the driver is not
+    set to MPEG format, the EINVAL error code will be returned.
+
+    To change the current parameters, initialize all fields of a struct
+    go7007_mpeg_params and call the GO7007_IOC_S_MPEG_PARAMS ioctl with a
+    pointer to this structure.  The driver will return the current
+    parameters with any necessary changes to conform to the limitations of
+    the hardware or selected MPEG mode.  Any or all fields can be set to
+    zero to request a reasonable default value.  If the driver is not set
+    to MPEG format, the EINVAL error code will be returned.  When I/O is in
+    progress, the EBUSY error code will be returned.
+
+    Fields in struct go7007_mpeg_params:
+
+        enum go7007_mpeg_video_standard
+          mpeg_video_standard        The MPEG video standard in which to
+                                     compress the video.
+
+                                     Choices are:
+                                        GO7007_MPEG_VIDEO_MPEG1
+                                        GO7007_MPEG_VIDEO_MPEG2
+                                        GO7007_MPEG_VIDEO_MPEG4
+
+        __u32                        Bit-wise OR of control flags (below)
+          flags
+
+        __u32                        The profile and level indication to be
+          pali                       stored in the sequence header.  This
+                                     is only used as an indicator to the
+                                     decoder, and does not affect the MPEG
+                                     features used in the video stream.
+                                     Not valid for MPEG1.
+
+                                     Choices for MPEG2 are:
+                                        GO7007_MPEG2_PROFILE_MAIN_MAIN
+
+                                     Choices for MPEG4 are:
+                                        GO7007_MPEG4_PROFILE_S_L0
+                                        GO7007_MPEG4_PROFILE_S_L1
+                                        GO7007_MPEG4_PROFILE_S_L2
+                                        GO7007_MPEG4_PROFILE_S_L3
+                                        GO7007_MPEG4_PROFILE_ARTS_L1
+                                        GO7007_MPEG4_PROFILE_ARTS_L2
+                                        GO7007_MPEG4_PROFILE_ARTS_L3
+                                        GO7007_MPEG4_PROFILE_ARTS_L4
+                                        GO7007_MPEG4_PROFILE_AS_L0
+                                        GO7007_MPEG4_PROFILE_AS_L1
+                                        GO7007_MPEG4_PROFILE_AS_L2
+                                        GO7007_MPEG4_PROFILE_AS_L3
+                                        GO7007_MPEG4_PROFILE_AS_L4
+                                        GO7007_MPEG4_PROFILE_AS_L5
+
+    Flags in struct go7007_mpeg_params:
+
+        GO7007_MPEG_FORCE_DVD_MODE   Force all compression parameters and
+                                     bitrate control settings to comply
+                                     with DVD MPEG2 stream requirements.
+                                     This overrides most compression and
+                                     bitrate settings!
+
+        GO7007_MPEG_OMIT_GOP_HEADER  Omit the GOP header.
+
+        GO7007_MPEG_REPEAT_SEQHEADER Repeat the MPEG sequence header at
+                                     the start of each GOP.
+
+
+  GO7007IOC_S_BITRATE, GO7007IOC_G_BITRATE
+
+    These ioctls are used to set and query the target bitrate value for the
+    compressed video stream.  The bitrate may be selected by storing the
+    target bits per second in an int and calling GO7007IOC_S_BITRATE with a
+    pointer to the int.  The bitrate may be queried by calling
+    GO7007IOC_G_BITRATE with a pointer to an int where the current bitrate
+    will be stored.
+
+    Note that this is the primary means of controlling the video quality
+    for all compression modes, including V4L2_PIX_FMT_MJPEG.  The
+    VIDIOC_S_JPEGCOMP ioctl is not supported.
+
+
+----------------------------------------------------------------------------
+                   Installing the WIS PCI Voyager Driver
+---------------------------------------------------------------------------
+
+The WIS PCI Voyager driver requires several patches to the Linux 2.6.11.x
+kernel source tree before compiling the driver.  These patches update the
+in-kernel SAA7134 driver to the newest development version and patch bugs
+in the TDA8290/TDA8275 tuner driver.
+
+The following patches must be downloaded from Gerd Knorr's website and
+applied in the order listed:
+
+	http://dl.bytesex.org/patches/2.6.11-2/i2c-tuner
+	http://dl.bytesex.org/patches/2.6.11-2/i2c-tuner2
+	http://dl.bytesex.org/patches/2.6.11-2/v4l2-api-mpeg
+	http://dl.bytesex.org/patches/2.6.11-2/saa7134-update
+
+The following patches are included with this SDK and can be applied in any
+order:
+
+	patches/2.6.11/saa7134-voyager.diff
+	patches/2.6.11/tda8275-newaddr.diff
+	patches/2.6.11/tda8290-ntsc.diff
+
+Check to make sure the CONFIG_VIDEO_SAA7134 option is enabled in the kernel
+configuration, and build and install the kernel.
+
+After rebooting into the new kernel, the GO7007 driver can be compiled and
+installed:
+
+	$ make SAA7134_BUILD=y
+	$ make install
+	$ modprobe saa7134-go7007
+
+There will be two V4L video devices associated with the PCI Voyager.  The
+first device (most likely /dev/video0) provides access to the raw video
+capture mode of the SAA7133 device and is used to configure the source
+video parameters and tune the TV tuner.  This device can be used with xawtv
+or other V4L(2) video software as a standard uncompressed device.
+
+The second device (most likely /dev/video1) provides access to the
+compression functions of the GO7007.  It can be tested using the gorecord
+application in the apps/ directory of this SDK:
+
+	$ apps/gorecord -vdevice /dev/video1 -noaudio test.avi
+
+Currently the frame resolution is fixed at 720x480 (NTSC) or 720x576 (PAL),
+and the video standard must be specified to both the raw and the compressed
+video devices (xawtv and gorecord, for example).
+
+
+--------------------------------------------------------------------------
+RELEASE NOTES FOR WIS GO7007SB LINUX DRIVER
+---------------------------------------------------------------------------
+
+Last updated: 5 November 2005
+
+ - Release 0.9.7 includes new support for using udev to run fxload.  The
+   install script should automatically detect whether the old hotplug
+   scripts or the new udev rules should be used.  To force the use of
+   hotplug, run "make install USE_UDEV=n".  To force the use of udev, run
+   "make install USE_UDEV=y".
+
+ - Motion detection is supported but undocumented.  Try the `modet` app
+   for a demonstration of how to use the facility.
+
+ - Using USB2.0 devices such as the TV402U with USB1.1 HCDs or hubs can
+   cause buffer overruns and frame drops, even at low framerates, due to
+   inconsistency in the bitrate control mechanism.
+
+ - On devices with an SAA7115, including the Plextor ConvertX, video height
+   values of 96, 128, 160, 192, 256, 320, and 384 do not work in NTSC mode.
+   All valid heights up to 512 work correctly in PAL mode.
+
+ - The WIS Star Trek and PCI Voyager boards have no support yet for audio
+   or the TV tuner.
diff --git a/meta/files/common-licenses/Firmware-i2400m b/meta/files/common-licenses/Firmware-i2400m
new file mode 100644
index 0000000..263167f
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-i2400m
@@ -0,0 +1,43 @@
+Copyright (c) 2008, Intel Corporation.
+
+All rights reserved.
+
+Redistribution.  
+
+Redistribution and use in binary form, without modification, are
+permitted provided that the following conditions are met:
+
+ * Redistributions must reproduce the above copyright notice and the
+   following disclaimer in the documentation and/or other materials
+   provided with the distribution.
+
+ * Neither the name of Intel Corporation nor the names of its
+   suppliers may be used to endorse or promote products derived from
+   this software without specific prior written permission.
+
+ * No reverse engineering, decompilation, or disassembly of this
+   software is permitted.
+
+Limited patent license.
+
+Intel Corporation grants a world-wide, royalty-free, non-exclusive
+license under patents it now or hereafter owns or controls to make,
+have made, use, import, offer to sell and sell (“Utilize”) this
+software, but solely to the extent that any such patent is necessary
+to Utilize the software alone.  The patent license shall not apply to
+any combinations which include this software.  No hardware per se is
+licensed hereunder.
+
+DISCLAIMER.  
+
+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/Firmware-ibt_firmware b/meta/files/common-licenses/Firmware-ibt_firmware
new file mode 100644
index 0000000..f878c6a
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-ibt_firmware
@@ -0,0 +1,39 @@
+Copyright © 2014, Intel Corporation.
+All rights reserved.
+
+Redistribution.  Redistribution and use in binary form, without
+modification, are permitted provided that the following conditions are
+met:
+
+* Redistributions must reproduce the above copyright notice and the
+  following disclaimer in the documentation and/or other materials
+  provided with the distribution.
+* Neither the name of Intel Corporation nor the names of its suppliers
+  may be used to endorse or promote products derived from this software
+  without specific prior written permission.
+* No reverse engineering, decompilation, or disassembly of this software
+  is permitted.
+
+Limited patent license.  Intel Corporation grants a world-wide,
+royalty-free, non-exclusive license under patents it now or hereafter
+owns or controls to make, have made, use, import, offer to sell and
+sell ("Utilize") this software, but solely to the extent that any
+such patent is necessary to Utilize the software alone, or in
+combination with an operating system licensed under an approved Open
+Source license as listed by the Open Source Initiative at
+http://opensource.org/licenses.  The patent license shall not apply to
+any other combinations which include this software.  No hardware per
+se is licensed hereunder.
+
+DISCLAIMER.  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
+CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
+FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
+COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
+BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
+OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
+TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
+USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
+DAMAGE.
diff --git a/meta/files/common-licenses/Firmware-it913x b/meta/files/common-licenses/Firmware-it913x
new file mode 100644
index 0000000..ec8f56c
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-it913x
@@ -0,0 +1,17 @@
+Copyright (c) 2014, ITE Tech. Inc.
+
+The firmware files "dvb-usb-it9135-01.fw" and "dvb-usb-it9135-02.fw"
+are for ITEtech it9135 Ax and Bx chip versions.
+
+Permission to use, copy, modify, and/or distribute this software for
+any purpose with or without fee is hereby granted, provided that the
+above copyright notice and this permission notice appear in all copies.
+
+THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
+WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE
+FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY
+DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
+WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
+ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
+SOFTWARE.
diff --git a/meta/files/common-licenses/Firmware-iwlwifi_firmware b/meta/files/common-licenses/Firmware-iwlwifi_firmware
new file mode 100644
index 0000000..b168a60
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-iwlwifi_firmware
@@ -0,0 +1,39 @@
+Copyright (c) 2006-2014, Intel Corporation.
+All rights reserved.
+
+Redistribution.  Redistribution and use in binary form, without
+modification, are permitted provided that the following conditions are
+met:
+
+* Redistributions must reproduce the above copyright notice and the
+  following disclaimer in the documentation and/or other materials
+  provided with the distribution.
+* Neither the name of Intel Corporation nor the names of its suppliers
+  may be used to endorse or promote products derived from this software
+  without specific prior written permission.
+* No reverse engineering, decompilation, or disassembly of this software
+  is permitted.
+
+Limited patent license.  Intel Corporation grants a world-wide,
+royalty-free, non-exclusive license under patents it now or hereafter
+owns or controls to make, have made, use, import, offer to sell and
+sell ("Utilize") this software, but solely to the extent that any
+such patent is necessary to Utilize the software alone, or in
+combination with an operating system licensed under an approved Open
+Source license as listed by the Open Source Initiative at
+http://opensource.org/licenses.  The patent license shall not apply to
+any other combinations which include this software.  No hardware per
+se is licensed hereunder.
+
+DISCLAIMER.  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
+CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
+FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
+COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
+BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
+OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
+TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
+USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
+DAMAGE.
diff --git a/meta/files/common-licenses/Firmware-mwl8335 b/meta/files/common-licenses/Firmware-mwl8335
new file mode 100644
index 0000000..0b82452
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-mwl8335
@@ -0,0 +1,52 @@
+FIRMWARE LICENSE TERMS
+
+
+Copyright (c) Marvell International Ltd.
+
+All rights reserved.
+
+Redistribution. Redistribution and use in binary form, without modification, are
+permitted provided that the following conditions are met:
+
+* Redistributions must reproduce the above copyright notice and the following
+disclaimer in the documentation and/or other materials provided with the
+distribution.
+
+* Neither the name of Marvell International Ltd. nor the names of its suppliers
+may be used to endorse or promote products derived from this software without
+specific prior written permission.
+
+* No reverse engineering, decompilation, or disassembly of this software is
+permitted.
+
+Limited patent license. Marvell International Ltd. grants a world-wide,
+royalty-free, non-exclusive license under patents it now or hereafter owns or
+controls to make, have made, use, import, offer to sell and sell ("Utilize")
+this software, but solely to the extent that any such patent is necessary to
+Utilize the software alone, or in combination with an operating system licensed
+under an approved Open Source license as listed by the Open Source Initiative at
+http://opensource.org/licenses. The patent license shall not apply to any other
+combinations which include this software. No hardware per se is licensed
+hereunder.
+
+DISCLAIMER. THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
+THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
+FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
+SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
+CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
+TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
+THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+----
+
+NOTE: this firmware was generated from img_cb35_fw_duplex.h contained in the
+GPL source release of the Maxtor Shared Storage II product available here:
+
+http://www.seagate.com/staticfiles/maxtor/en_us/downloads/MSSII_3.1.2.src.tgz
+
+Explicit permission from Marvell was obtained to upload this firmware to the
+linux-firmware git repository under the Marvell firmware license above.
+
diff --git a/meta/files/common-licenses/Firmware-myri10ge_firmware b/meta/files/common-licenses/Firmware-myri10ge_firmware
new file mode 100644
index 0000000..8184023
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-myri10ge_firmware
@@ -0,0 +1,28 @@
+/*******************************************************************************
+
+Copyright (c) 2006-2010, Myricom Inc.
+All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions are met:
+
+ 1. Redistributions of source code must retain the above copyright notice,
+    this list of conditions and the following disclaimer.
+
+ 2. Neither the name of the Myricom Inc, nor the names of its
+    contributors may be used to endorse or promote products derived from
+    this software without specific prior written permission.
+
+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
+LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGE.
+
+***************************************************************************/
diff --git a/meta/files/common-licenses/Firmware-phanfw b/meta/files/common-licenses/Firmware-phanfw
new file mode 100644
index 0000000..8f7782f
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-phanfw
@@ -0,0 +1,32 @@
+Copyright ©  2003-2013 QLogic Corporation
+QLogic Linux Intelligent Ethernet (3000 and 3100 Series) Adapter Firmware
+
+Redistribution and use in binary form, without modification, for use in
+conjunction with QLogic authorized products is permitted provided that the
+following conditions are met:
+
+1. Redistribution in binary form must reproduce the above copyright notice, this
+   list of conditions and the following disclaimer in the documentation and/or
+   other materials provided with the distribution.
+2. The name of QLogic Corporation may not be used to endorse or promote products
+   derived from this software without specific prior written permission.
+3. Reverse engineering, decompilation, or disassembly of this firmware is not
+   permitted.
+
+REGARDLESS OF WHAT LICENSING MECHANISM IS USED OR APPLICABLE,THIS PROGRAM IS
+PROVIDED BY QLOGIC CORPORATION "AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES,
+INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
+FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR
+BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
+GOODS OR SERVICES; LOSS OF USE,DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+LIABILITY,OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
+DAMAGE.
+
+USER ACKNOWLEDGES AND AGREES THAT USE OF THIS PROGRAM WILL NOT CREATE OR GIVE
+GROUNDS FOR A LICENSE BY IMPLICATION, ESTOPPEL, OR OTHERWISE IN ANY INTELLECTUAL
+PROPERTY RIGHTS (PATENT, COPYRIGHT, TRADE SECRET, MASK WORK, OR OTHER
+PROPRIETARY RIGHT) EMBODIED IN ANY OTHER QLOGIC HARDWARE OR SOFTWARE EITHER
+SOLELY OR IN COMBINATION WITH THIS PROGRAM.
diff --git a/meta/files/common-licenses/Firmware-qat_dh895xcc_firmware b/meta/files/common-licenses/Firmware-qat_dh895xcc_firmware
new file mode 100644
index 0000000..d4f1609
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-qat_dh895xcc_firmware
@@ -0,0 +1,39 @@
+Copyright (c) 2014, Intel Corporation.
+All rights reserved.
+
+Redistribution.  Redistribution and use in binary form, without
+modification, are permitted provided that the following conditions are
+met:
+
+* Redistributions must reproduce the above copyright notice and the
+  following disclaimer in the documentation and/or other materials
+  provided with the distribution.
+* Neither the name of Intel Corporation nor the names of its suppliers
+  may be used to endorse or promote products derived from this software
+  without specific prior written permission.
+* No reverse engineering, decompilation, or disassembly of this software
+  is permitted.
+
+Limited patent license.  Intel Corporation grants a world-wide,
+royalty-free, non-exclusive license under patents it now or hereafter
+owns or controls to make, have made, use, import, offer to sell and
+sell ("Utilize") this software, but solely to the extent that any
+such patent is necessary to Utilize the software alone, or in
+combination with an operating system licensed under an approved Open
+Source license as listed by the Open Source Initiative at
+http://opensource.org/licenses.  The patent license shall not apply to
+any other combinations which include this software.  No hardware per
+se is licensed hereunder.
+
+DISCLAIMER.  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
+CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
+FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
+COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
+BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
+OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
+TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
+USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
+DAMAGE.
diff --git a/meta/files/common-licenses/Firmware-qla2xxx b/meta/files/common-licenses/Firmware-qla2xxx
new file mode 100644
index 0000000..df67a9b
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-qla2xxx
@@ -0,0 +1,31 @@
+Copyright (c) 2003-2010 QLogic Corporation
+QLogic Linux Fibre Channel Adapter Firmware
+
+Redistribution and use in binary form, without modification, for use in conjunction
+with QLogic authorized products is permitted provided that the following conditions
+are met:
+
+1. Redistribution in binary form must reproduce the above copyright notice, this
+   list of conditions and the following disclaimer in the documentation and/or
+   other materials provided with the distribution.
+2. The name of QLogic Corporation may not be used to endorse or promote products
+   derived from this software without specific prior written permission.
+3. Reverse engineering, decompilation, or disassembly of this firmware is not
+   permitted.
+
+REGARDLESS OF WHAT LICENSING MECHANISM IS USED OR APPLICABLE,THIS PROGRAM IS
+PROVIDED BY QLOGIC CORPORATION "AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES,
+INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
+FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR
+BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
+GOODS OR SERVICES; LOSS OF USE,DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+LIABILITY,OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+USER ACKNOWLEDGES AND AGREES THAT USE OF THIS PROGRAM WILL NOT CREATE OR GIVE
+GROUNDS FOR A LICENSE BY IMPLICATION, ESTOPPEL, OR OTHERWISE IN ANY INTELLECTUAL
+PROPERTY RIGHTS (PATENT, COPYRIGHT, TRADE SECRET, MASK WORK, OR OTHER PROPRIETARY
+RIGHT) EMBODIED IN ANY OTHER QLOGIC HARDWARE OR SOFTWARE EITHER SOLELY OR IN
+COMBINATION WITH THIS PROGRAM.
diff --git a/meta/files/common-licenses/Firmware-r8a779x_usb3 b/meta/files/common-licenses/Firmware-r8a779x_usb3
new file mode 100644
index 0000000..e2afcc9
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-r8a779x_usb3
@@ -0,0 +1,26 @@
+Copyright (c) 2014, Renesas Electronics Corporation
+All rights reserved.
+
+Redistribution and use in binary form, without modification, are permitted
+provided that the following conditions are met:
+
+1. Redistribution in binary form must reproduce the above copyright notice,
+   this list of conditions and the following disclaimer in the documentation
+   and/or other materials provided with the distribution.
+2. The name of Renesas Electronics Corporation may not be used to endorse or
+   promote products derived from this software without specific prior written
+   permission.
+3. Reverse engineering, decompilation, or disassembly of this software is
+   not permitted.
+
+THIS SOFTWARE IS PROVIDED "AS IS" AND RENESAS ELECTRONICS CORPORATION DISCLAIMS
+ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, AND
+NONINFRINGEMENT OF THIRD PARTY RIGHTS. IN NO EVENT SHALL RENESAS ELECTRONICS
+CORPORATION BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
+OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/Firmware-radeon b/meta/files/common-licenses/Firmware-radeon
new file mode 100644
index 0000000..fe3780b
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-radeon
@@ -0,0 +1,51 @@
+Copyright (C) 2009-2014  Advanced Micro Devices, Inc. All rights reserved.
+
+REDISTRIBUTION: Permission is hereby granted, free of any license fees,
+to any person obtaining a copy of this microcode (the "Software"), to
+install, reproduce, copy and distribute copies, in binary form only, of
+the Software and to permit persons to whom the Software is provided to
+do the same, provided that the following conditions are met:
+
+No reverse engineering, decompilation, or disassembly of this Software
+is permitted.
+
+Redistributions must reproduce the above copyright notice, this
+permission notice, and the following disclaimers and notices in the
+Software documentation and/or other materials provided with the
+Software.
+
+DISCLAIMER: THE USE OF THE SOFTWARE IS AT YOUR SOLE RISK.  THE SOFTWARE
+IS PROVIDED "AS IS" AND WITHOUT WARRANTY OF ANY KIND AND COPYRIGHT
+HOLDER AND ITS LICENSORS EXPRESSLY DISCLAIM ALL WARRANTIES, EXPRESS AND
+IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.
+COPYRIGHT HOLDER AND ITS LICENSORS DO NOT WARRANT THAT THE SOFTWARE WILL
+MEET YOUR REQUIREMENTS, OR THAT THE OPERATION OF THE SOFTWARE WILL BE
+UNINTERRUPTED OR ERROR-FREE.  THE ENTIRE RISK ASSOCIATED WITH THE USE OF
+THE SOFTWARE IS ASSUMED BY YOU.  FURTHERMORE, COPYRIGHT HOLDER AND ITS
+LICENSORS DO NOT WARRANT OR MAKE ANY REPRESENTATIONS REGARDING THE USE
+OR THE RESULTS OF THE USE OF THE SOFTWARE IN TERMS OF ITS CORRECTNESS,
+ACCURACY, RELIABILITY, CURRENTNESS, OR OTHERWISE.
+
+DISCLAIMER: UNDER NO CIRCUMSTANCES INCLUDING NEGLIGENCE, SHALL COPYRIGHT
+HOLDER AND ITS LICENSORS OR ITS DIRECTORS, OFFICERS, EMPLOYEES OR AGENTS
+("AUTHORIZED REPRESENTATIVES") BE LIABLE FOR ANY INCIDENTAL, INDIRECT,
+SPECIAL OR CONSEQUENTIAL DAMAGES (INCLUDING DAMAGES FOR LOSS OF BUSINESS
+PROFITS, BUSINESS INTERRUPTION, LOSS OF BUSINESS INFORMATION, AND THE
+LIKE) ARISING OUT OF THE USE, MISUSE OR INABILITY TO USE THE SOFTWARE,
+BREACH OR DEFAULT, INCLUDING THOSE ARISING FROM INFRINGEMENT OR ALLEGED
+INFRINGEMENT OF ANY PATENT, TRADEMARK, COPYRIGHT OR OTHER INTELLECTUAL
+PROPERTY RIGHT EVEN IF COPYRIGHT HOLDER AND ITS AUTHORIZED
+REPRESENTATIVES HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.  IN
+NO EVENT SHALL COPYRIGHT HOLDER OR ITS AUTHORIZED REPRESENTATIVES TOTAL
+LIABILITY FOR ALL DAMAGES, LOSSES, AND CAUSES OF ACTION (WHETHER IN
+CONTRACT, TORT (INCLUDING NEGLIGENCE) OR OTHERWISE) EXCEED THE AMOUNT OF
+US$10.
+
+Notice:  The Software is subject to United States export laws and
+regulations.  You agree to comply with all domestic and international
+export laws and regulations that apply to the Software, including but
+not limited to the Export Administration Regulations administered by the
+U.S. Department of Commerce and International Traffic in Arm Regulations
+administered by the U.S. Department of State.  These laws include
+restrictions on destinations, end users and end use.
diff --git a/meta/files/common-licenses/Firmware-ralink-firmware b/meta/files/common-licenses/Firmware-ralink-firmware
new file mode 100644
index 0000000..18dd038
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-ralink-firmware
@@ -0,0 +1,39 @@
+Copyright (c) 2007, Ralink Technology Corporation 
+All rights reserved.
+
+Redistribution.  Redistribution and use in binary form, without 
+modification, are permitted provided that the following conditions are 
+met:
+
+* Redistributions must reproduce the above copyright notice and the 
+  following disclaimer in the documentation and/or other materials 
+  provided with the distribution. 
+* Neither the name of Ralink Technology Corporation nor the names of its
+  suppliers may be used to endorse or promote products derived from this
+  software without specific prior written permission. 
+* No reverse engineering, decompilation, or disassembly of this software 
+  is permitted.
+
+Limited patent license. Ralink Technology Corporation grants a world-wide, 
+royalty-free, non-exclusive license under patents it now or hereafter 
+owns or controls to make, have made, use, import, offer to sell and 
+sell ("Utilize") this software, but solely to the extent that any 
+such patent is necessary to Utilize the software alone, or in 
+combination with an operating system licensed under an approved Open 
+Source license as listed by the Open Source Initiative at 
+http://opensource.org/licenses.  The patent license shall not apply to 
+any other combinations which include this software.  No hardware per 
+se is licensed hereunder.
+
+DISCLAIMER.  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND 
+CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, 
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND 
+FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE 
+COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
+BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS 
+OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND 
+ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR 
+TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE 
+USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH 
+DAMAGE.
diff --git a/meta/files/common-licenses/Firmware-ralink_a_mediatek_company_firmware b/meta/files/common-licenses/Firmware-ralink_a_mediatek_company_firmware
new file mode 100644
index 0000000..fef16b6
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-ralink_a_mediatek_company_firmware
@@ -0,0 +1,39 @@
+Copyright (c) 2013, Ralink, A MediaTek Company 
+All rights reserved.
+
+Redistribution.  Redistribution and use in binary form, without 
+modification, are permitted provided that the following conditions are 
+met:
+
+* Redistributions must reproduce the above copyright notice and the 
+  following disclaimer in the documentation and/or other materials 
+  provided with the distribution. 
+* Neither the name of Ralink Technology Corporation nor the names of its
+  suppliers may be used to endorse or promote products derived from this
+  software without specific prior written permission. 
+* No reverse engineering, decompilation, or disassembly of this software 
+  is permitted.
+
+Limited patent license. Ralink Technology Corporation grants a world-wide, 
+royalty-free, non-exclusive license under patents it now or hereafter 
+owns or controls to make, have made, use, import, offer to sell and 
+sell ("Utilize") this software, but solely to the extent that any 
+such patent is necessary to Utilize the software alone, or in 
+combination with an operating system licensed under an approved Open 
+Source license as listed by the Open Source Initiative at 
+http://opensource.org/licenses.  The patent license shall not apply to 
+any other combinations which include this software.  No hardware per 
+se is licensed hereunder.
+
+DISCLAIMER.  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND 
+CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, 
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND 
+FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE 
+COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
+BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS 
+OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND 
+ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR 
+TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE 
+USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH 
+DAMAGE.
diff --git a/meta/files/common-licenses/Firmware-rtlwifi_firmware b/meta/files/common-licenses/Firmware-rtlwifi_firmware
new file mode 100644
index 0000000..d70921f
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-rtlwifi_firmware
@@ -0,0 +1,39 @@
+Copyright (c) 2010, Realtek Semiconductor Corporation 
+All rights reserved.
+
+Redistribution.  Redistribution and use in binary form, without 
+modification, are permitted provided that the following conditions are 
+met:
+
+* Redistributions must reproduce the above copyright notice and the 
+  following disclaimer in the documentation and/or other materials 
+  provided with the distribution. 
+* Neither the name of Realtek Semiconductor Corporation nor the names of its
+  suppliers may be used to endorse or promote products derived from this
+  software without specific prior written permission. 
+* No reverse engineering, decompilation, or disassembly of this software 
+  is permitted.
+
+Limited patent license. Realtek Semiconductor Corporation grants a world-wide, 
+royalty-free, non-exclusive license under patents it now or hereafter 
+owns or controls to make, have made, use, import, offer to sell and 
+sell ("Utilize") this software, but solely to the extent that any 
+such patent is necessary to Utilize the software alone, or in 
+combination with an operating system licensed under an approved Open 
+Source license as listed by the Open Source Initiative at 
+http://opensource.org/licenses.  The patent license shall not apply to 
+any other combinations which include this software.  No hardware per 
+se is licensed hereunder.
+
+DISCLAIMER.  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND 
+CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, 
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND 
+FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE 
+COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
+BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS 
+OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND 
+ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR 
+TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE 
+USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH 
+DAMAGE.
diff --git a/meta/files/common-licenses/Firmware-tda7706-firmware b/meta/files/common-licenses/Firmware-tda7706-firmware
new file mode 100644
index 0000000..6d81594
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-tda7706-firmware
@@ -0,0 +1,48 @@
+FIRMWARE LICENSE TERMS
+
+
+Copyright (c) ST Microelectronics
+
+All rights reserved.
+
+Redistribution. Redistribution and use in binary form, without modification, are
+permitted provided that the following conditions are met:
+
+* Redistributions must reproduce the above copyright notice and the following
+disclaimer in the documentation and/or other materials provided with the
+distribution.
+
+* Neither the name of ST Microelectronics nor the names of its suppliers
+may be used to endorse or promote products derived from this software without
+specific prior written permission.
+
+* No reverse engineering, decompilation, or disassembly of this software is
+permitted.
+
+Limited patent license. ST Microelectronics grants a world-wide,
+royalty-free, non-exclusive license under patents it now or hereafter owns or
+controls to make, have made, use, import, offer to sell and sell ("Utilize")
+this software, but solely to the extent that any such patent is necessary to
+Utilize the software alone, or in combination with an operating system licensed
+under an approved Open Source license as listed by the Open Source Initiative at
+http://opensource.org/licenses. The patent license shall not apply to any other
+combinations which include this software. No hardware per se is licensed
+hereunder.
+
+DISCLAIMER. THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
+THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED.
+
+STMicroelectronics has made every effort possible to ensure that this software is free of any bugs or
+errors; however, in no way is the software to be considered error or bug free. You assume all
+responsibility for any damages or lost data that may result from any errors or bugs in the software.
+IN NO EVENT WILL STMicroelectronics BE LIABLE TO YOU FOR ANY GENERAL, SPECIAL,
+INDIRECT, CONSEQUENTIAL, INCIDENTAL OR OTHER DAMAGES ARISING OUT OF THIS
+LICENSE.
+----
+
+Note
+Explicit permission from ST Microelectronics was obtained to upload this firmware to the
+linux-firmware git repository under the ST Microelectronics firmware license above.
+
diff --git a/meta/files/common-licenses/Firmware-ti-connectivity b/meta/files/common-licenses/Firmware-ti-connectivity
new file mode 100644
index 0000000..91a1516
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-ti-connectivity
@@ -0,0 +1,46 @@
+TECHNOLOGY AND SOFTWARE PUBLICLY AVAILABLE
+SOFTWARE LICENSE
+
+Copyright (c) 2011, Texas Instruments Incorporated.
+
+All rights reserved.
+
+Redistribution.
+
+Redistribution and use in binary form, without modification, are
+permitted provided that the following conditions are met:
+
+ * Redistributions must preserve existing copyright notices and reproduce
+   this license (including the above copyright notice and the disclaimer below)
+   in the documentation and/or other materials provided with the distribution.
+
+ * Neither the name of Texas Instruments Incorporated nor the names of
+   its suppliers may be used to endorse or promote products derived
+   from this software without specific prior written permission.
+
+ * No reverse engineering, decompilation, or disassembly of this
+   software is permitted.
+
+Limited patent license.
+
+Texas Instruments Incorporated grants a world-wide, royalty-free,
+non-exclusive license under patents it now or hereafter owns or controls
+to make, have made, use, import, offer to sell and sell ("Utilize") this
+software, but solely to the extent that any such patent is necessary
+to Utilize the software alone.  The patent license shall not apply to
+any combinations which include this software.  No hardware per se is
+licensed hereunder.
+
+DISCLAIMER.
+
+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/Firmware-ueagle-atm4-firmware b/meta/files/common-licenses/Firmware-ueagle-atm4-firmware
new file mode 100644
index 0000000..333675d
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-ueagle-atm4-firmware
@@ -0,0 +1,39 @@
+This license applies to eagle4 firmware & DSPcode
+namely, the files eagleIV.fw  DSP4p.bin*
+
+| Copyright (2006) Ikanos Communications, Inc. 
+| 
+| Redistribution and use in source and binary forms, with or without 
+| modification, are permitted provided that the following 
+| conditions are met: 
+| 
+| * Redistribution of source code must retain the above copyright 
+| notice, this list of conditions and the following disclaimer. 
+| 
+| * Redistribution in binary form must reproduce the above 
+| copyright notice, this list of conditions and the following 
+| disclaimer in the documentation and/or other materials provided 
+| with the distribution. 
+| 
+| * The name of Ikanos Corporation may not be used to endorse         
+|   or promote products derived from this source code without specific     
+|   prior written consent of Ikanos Corporation. 
+| 
+| THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
+| "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
+| LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR 
+| A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
+| OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
+| SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
+| LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, 
+| DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY 
+| THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
+| (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
+| OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
+| USER ACKNOWLEDGES AND AGREES THAT THE PURCHASE OR USE OF THIS SOFTWARE WILL 
+| NOT CREATE OR GIVE GROUNDS FOR A     
+|  LICENSE BY IMPLICATION, ESTOPPEL, OR OTHERWISE IN ANY INTELLECTUAL         
+|  PROPERTY RIGHTS (PATENT, COPYRIGHT, TRADE SECRET, MASK WORK, OR OTHER   
+|  PROPRIETARY RIGHT) EMBODIED IN ANY OTHER IKANOS HARDWARE OR SOFTWARE         
+|  EITHER SOLELY OR IN COMBINATION WITH THIS SOFTWARE. 
+
diff --git a/meta/files/common-licenses/Firmware-via_vt6656 b/meta/files/common-licenses/Firmware-via_vt6656
new file mode 100644
index 0000000..f231f98
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-via_vt6656
@@ -0,0 +1,25 @@
+The following license applies to the binary-only VT6656 firmware
+as contained in the file "vntwusb.fw"
+================================================================
+Copyright 1998-2010 VIA Technologies, Inc. All Rights Reserved.
+
+Permission is hereby granted, free of charge, to any person
+obtaining a copy of this software and associated documentation
+files (the "Software"), to deal in the Software without
+restriction, including without limitation the rights to use,
+copy, modify, merge, publish, distribute, sublicense, and/or sell
+copies of the Software, and to permit persons to whom the
+Software is furnished to do so, subject to the following
+conditions:
+
+The above copyright notice and this permission notice shall be
+included in all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+OTHER DEALINGS IN THE SOFTWARE.
diff --git a/meta/files/common-licenses/Firmware-wl1251 b/meta/files/common-licenses/Firmware-wl1251
new file mode 100644
index 0000000..bd0f5f1
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-wl1251
@@ -0,0 +1,59 @@
+Copyright (c) 2000 – 2013 Texas Instruments Incorporated
+
+All rights reserved not granted herein.
+
+Limited License.
+
+Texas Instruments Incorporated grants a world-wide, royalty-free, non-exclusive
+license under copyrights and patents it now or hereafter owns or controls to
+make, have made, use, import, offer to sell and sell ("Utilize") this software
+subject to the terms herein.  With respect to the foregoing patent license,
+such license is granted  solely to the extent that any such patent is necessary
+to Utilize the software alone.  The patent license shall not apply to any
+combinations which include this software, other than combinations with devices
+manufactured by or for TI (“TI Devices”).  No hardware patent is licensed
+hereunder.
+
+Redistributions must preserve existing copyright notices and reproduce this
+license (including the above copyright notice and the disclaimer and (if
+applicable) source code license limitations below) in the documentation and/or
+other materials provided with the distribution
+
+Redistribution and use in binary form, without modification, are permitted
+provided that the following conditions are met:
+
+*	No reverse engineering, decompilation, or disassembly of this software
+	is permitted with respect to any software provided in binary form.
+
+*	any redistribution and use are licensed by TI for use only with TI
+	Devices.
+
+*	Nothing shall obligate TI to provide you with source code for the
+	software licensed and provided to you in object code.
+
+If software source code is provided to you, modification and redistribution of
+the source code are permitted provided that the following conditions are met:
+
+*	any redistribution and use of the source code, including any resulting
+	derivative works, are licensed by TI for use only with TI Devices.
+
+*	any redistribution and use of any object code compiled from the source
+	code and any resulting derivative works, are licensed by TI for use
+	only with TI Devices.
+
+Neither the name of Texas Instruments Incorporated nor the names of its
+suppliers may be used to endorse or promote products derived from this software
+without specific prior written permission.
+
+DISCLAIMER.
+
+THIS SOFTWARE IS PROVIDED BY TI AND TI’S LICENSORS "AS IS" AND ANY EXPRESS OR
+IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
+EVENT SHALL TI AND TI’S LICENSORS BE LIABLE FOR ANY DIRECT, INDIRECT,
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
+OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
+ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/Firmware-xc4000 b/meta/files/common-licenses/Firmware-xc4000
new file mode 100644
index 0000000..e3cd261
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-xc4000
@@ -0,0 +1,23 @@
+The following XC4000 firmware file "dvb-fe-xc4000-1.4.1.fw" was
+created based on version 1.4 of "xc4000_firmwares.h".
+
+Firmware provided as part of an XC4000 Linux developers kit by Brian
+Mathews <bmathews@xceive.com> to Devin Heitmueller
+<dheitmueller@kernellabs.org> on July 1, 2009.
+
+The code was released by Xceive under the following license:
+
+// Copyright (c) 2009, Xceive Corporation <info@xceive.com>
+//
+// Permission to use, copy, modify, and/or distribute this software, only
+// for use with Xceive ICs, for any purpose with or without fee is hereby
+// granted, provided that the above copyright notice and this permission
+// notice appear in all source code copies.
+//
+// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
+// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
+// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
+// ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+// WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+// ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+// OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
diff --git a/meta/files/common-licenses/Firmware-xc5000 b/meta/files/common-licenses/Firmware-xc5000
new file mode 100644
index 0000000..0ac8557
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-xc5000
@@ -0,0 +1,23 @@
+The following XC500 firmware file "dvb-fe-xc5000-1.6.114.fw" was
+created based on "xc5000_firmwares_32000Khz.h".
+
+Firmware provided as part of an XC5000 Linux developers kit by Brian
+Mathews <bmathews@xceive.com> to Devin Heitmueller <dheitmueller@linuxtv.org>
+on July 1, 2009.
+
+The code was released by Xceive under the following license:
+
+// Copyright (c) 2009, Xceive Corporation <info@xceive.com>
+//
+// Permission to use, copy, modify, and/or distribute this software, only
+// for use with Xceive ICs, for any purpose with or without fee is hereby
+// granted, provided that the above copyright notice and this permission
+// notice appear in all source code copies.
+//
+// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
+// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
+// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
+// ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+// WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+// ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+// OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
diff --git a/meta/files/common-licenses/Firmware-xc5000c b/meta/files/common-licenses/Firmware-xc5000c
new file mode 100644
index 0000000..23b81e7
--- /dev/null
+++ b/meta/files/common-licenses/Firmware-xc5000c
@@ -0,0 +1,23 @@
+The following XC500C firmware file "dvb-fe-xc5000C-4.1.30.7.fw" was created
+based on "Xc5200_firmwares_32000Khz.h".
+
+Firmware provided as part of an XC5000C Linux developers kit by Ramon Cazares
+<Ramon.Cazares@CrestaTech.com> to Devin Heitmueller dheitmueller@linuxtv.org
+on July 25, 2012.
+
+The code was released by Cresta Technology under the following license:
+
+// Copyright (c) 2012, Cresta Technology Corporation <info@crestatech.com>
+//
+// Permission to use, copy, modify, and/or distribute this software, only
+// for use with Cresta Technlogy ICs, for any purpose with or without fee is
+// hereby granted, provided that the above copyright notice and this
+// permission notice appear in all source code copies.
+//
+// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
+// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
+// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
+// ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+// WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+// ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+// OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
-- 
1.9.1


