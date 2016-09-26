Return-Path: <daiane.angolini@nxp.com>
X-Greylist: delayed 2034 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 26 Sep 2016 12:42:10 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0068.outbound.protection.outlook.com
	[104.47.37.68])
	by mail.openembedded.org (Postfix) with ESMTP id E288F6093D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 12:42:10 +0000 (UTC)
Received: from DM5PR03CA0023.namprd03.prod.outlook.com (10.175.104.33) by
	CO2PR03MB2230.namprd03.prod.outlook.com (10.166.92.135) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.639.5; Mon, 26 Sep 2016 12:08:17 +0000
Received: from BL2FFO11FD028.protection.gbl (2a01:111:f400:7c09::143) by
	DM5PR03CA0023.outlook.office365.com (2603:10b6:3:118::33) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.639.5 via Frontend Transport; Mon, 26 Sep 2016 12:08:17 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD028.mail.protection.outlook.com (10.173.161.107) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.629.5 via Frontend Transport; Mon, 26 Sep 2016 12:08:16 +0000
Received: from b19406-2.am.freescale.net (b19406-2.am.freescale.net
	[10.29.244.3])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id u8QC8De9009798;
	Mon, 26 Sep 2016 05:08:15 -0700
From: Daiane Angolini <daiane.angolini@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2016 09:08:07 -0300
Message-ID: <1474891687-17665-2-git-send-email-daiane.angolini@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1474891687-17665-1-git-send-email-daiane.angolini@nxp.com>
References: <1474891687-17665-1-git-send-email-daiane.angolini@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131193652972104839;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(189998001)(81166006)(81156014)(76176999)(68736007)(50986999)(50466002)(97736004)(4326007)(47776003)(5003940100001)(19580405001)(2906002)(11100500001)(5660300001)(626004)(77096005)(48376002)(8676002)(19580395003)(110136003)(2351001)(33646002)(69596002)(92566002)(106466001)(229853001)(87936001)(85426001)(7846002)(86362001)(305945005)(575784001)(8666005)(36756003)(356003)(6916009)(105606002)(104016004)(8936002)(50226002)(2950100002)(586003)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO2PR03MB2230;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD028;
	1:pbnz55RHwkD+Qz03XpDPBsHkg2Dr3e/pCBcCkvSPCUEzXbahhmzZU3ls+klmjugHdVOsHOUB56xXTOiEQ22gbX++RMCnovi3aUFQ/VcMR12huU6tki35XBG0ZvQQkqtjkBhf6hTaHq/I7A1a/DDPLnL3pCzmK/ndBzUMa193nsjiBrzDmNhWmlTWkd3NKivdzkobotvvLm/HrMU8EAdzWtl8DjS8mvFZkcGiOZ0FMHN7jQCeRpVHS1L/+p8c/OiDBXq0h0NFd8J8Jxe0TUH8/2XdEk05axwNNLf30BoYxZQcg+Cei3rWewSYaI5Jzaq58L8vpbq2tNvcwpgC8C/BUcj59AGooOD0aPYJ4xcI3Gi+UqcKq4ojFJEr5oFuJ1UzfAc23plUMv1IoTvLfJtNLJsSs2gvlcxvA2qzeW24R0uOYw2RUR+8SHUQ+U7amw4mvGijkGrhnuUk1ANQxzhyAAhxmTKuB6wlL0G75GKTdVyhui5UAm0NPtf+aUECcvMBCqcrVicPvRkgH3TfYvYua/hNTIP/479QSA4lOL+9p7BV9OeJrGO27FB8ssOLkCjHBmEey/s+uwxZDQj7QA6nqILhaaFXYbKCm9R1emQWcorlCVLVz6RzUiQDSvRHp0Z1MEGytiO+V9nPeAkHgUsIGOQEV9ODJI7pquyp9iFxuEGxjiu2mImhIc7t8vay5hPPW/Nro1Qd35xP/dCFBpzofjYPEShtWyuuERZi6nMWqgs=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 9872b8c9-951e-4d2b-2c87-08d3e605cca7
X-Microsoft-Exchange-Diagnostics: 1; CO2PR03MB2230;
	2:HMhwGgbrApFWJJ0Omvbt3zudKbSjhWnSVx+yeJzP1koFNHFXxaqJ5s78lDY0leWQUYGtMjUZ69ZTgsmd5XafsjUv9cxenZjk9i0w1NXeTji7X5M0hVyGOMlxIDPKzzdf3NufugnMbxpNNhlHMtDTngdkTT1M7p/yvbQc4oqeOOJDEpMEkmiG28Ofx6GPcGHV;
	3:cBztEcBHaUHrtp40973HAbXHDQEEwUUbloIErFGSFj9HilL/8eJwfUAqwznN1irA90RYX0/IWGoaDN/SW90Ytf5NtW+tSApk5G8HeczbOhAWxNGYaKpq/xQluHq26pBRBn+vGsSsue35FNacGp76gTiNx44fd9YCnGfXbVx6ItDbeT2RsyWwmXdQx4yaD6XFUfi5rYK9JgfJNoelPAbF1LzCWQ0QR6Z/usHLMU2vXi4=;
	25:vojLzBbU40h0aDIYLoYYCD/KX48Rg2cWiF7lJf+U5SGiprBtBG76CMh1eT+r9qoz1U16qhzF4Rz0fRRJCUEY0x5z0NUg8yPqWljuciyQ1ckH6i8JEBkMEr7w8eCsR711/buKss3FaYd0NINz9zC2/SbAzM+VhrfONpvrOh4UKtm1OF6Ck5AUPPijAJFAoOKbRyUL4jNZuYnv280mjSDS7CsusQFxuYUgRCNGjJALVTM34q9SEFjfpudZbZBBUXLLnvqwLySnM3fnrDMRbsfKlEEtkv52wOJOVTX2NpwnTLVaJu4SMZUGFdFDWzkD/fw4xeaT4EKPAA3lAKuRSDRbFzi+bcYBXQJ/+ogR6qfy5N87caQ2cuZIcYecVj0xsQQHVjtBAOU9fn8oLY8+dQ3HHgrGIthwjKjsmbmHkIdzZFA=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CO2PR03MB2230;
X-Microsoft-Exchange-Diagnostics: 1; CO2PR03MB2230;
	31:VnYwZ7bFNV+/kpyo6iwbfpFKbY/vyB2W+BtNV0bElcGLNRnLcszphJ8XRUJkb4B8HJSliG5+NuWn+Z1P9pDfP69FQtSjvdkeaSlxcuK5EESVITVN3xfgfa2MULKGWtw1OTVmC1yxq7vR72R+qrJaQO5CfjJI0FRYBduQiuNk5Xc3SEywqEVMDv7gUmhe8yLFyxAt6ndR2v6tj7bH8XSRt/J/OlubRpyH8D5vhxJStw0=;
	4:nqPofQ1IR+lhBFFW08Jb5RyR5UNg+JsyOLZ/StgoeNkw6NjYggSVGltq0r8uzeYFmKBl19oZK3lc5oji30VhcDTuzipz7edJggfgMu25NuZBQ/aHRsSSi9/HjT2v7dh3qyvW/tG7zVGC7NHgLxfrKmylHP1WPh3uQ+EmeaaU5PFZSt44+u7J8SVNnS82j3LRLcwo9b6Wh7tmbf495XCbUchJsffaenhwaoozTd4G8ZYv3+JKwOwWlQL0jGRC4mVz0tClw5FlEbVkJYtGLP6nVp1mawFKLZGYQl+zj1yNsT6Dz2eSYfUfPWk4T5Z3Cp3AgJvAwp5uS096ZAtCk3vJlFzoov8rgK/0mPU20GQXu1yWGH4N+cIHg5sdEmYD7da2+2Cx/Kd4+M7HxoSIB5fkcgYJZQWBx6kkQQfltwQh72TUgBMaBiPfQfmWzPPqKJ6U6yp889iWFdlZi1/xu4GBMTYV8MileMy74rqqU29V3DG8rG2wz18xBQkEDJunnfTalnUBeRPJljxLjqmp1qqeE/ZX1Ac/q9gV9vF0WfhU2C2o76DhEODB3m1EaikuKPvtP567lIZI3RlRAcNQYDBUzg==
X-Microsoft-Antispam-PRVS: <CO2PR03MB2230E8DA084B2B6CB9E71676FECD0@CO2PR03MB2230.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(166494164430575);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13024025)(13023025)(13015025)(13017025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:CO2PR03MB2230; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CO2PR03MB2230; 
X-Forefront-PRVS: 00770C4423
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CO2PR03MB2230;
	23:cc3V8PRkAVdJLGUQaWIO/euYYKVUgVC+Yt/fXmXJj?=
	=?us-ascii?Q?EP7yTemEzg71Q8rAT4WuzUA69PDDS+1Dmh0UtviKmUuHrjDSfEZsUgij/tJq?=
	=?us-ascii?Q?MRjbhcr5Yq4GhWEgEe+AntCyCBn0jwZazfe0j1o9/oXq292rKUVYBZy3Ior/?=
	=?us-ascii?Q?MVgjkwQDQhmor+wjpR+nG8f8O223g27yIEzQQ0bNlicfuEkK8HVWj0sJrOSp?=
	=?us-ascii?Q?p0dSg7NKgrUfS5xEsHij2PajNgwOVUFBCuU/EwfATk4p8WB+bujnxM4YSByE?=
	=?us-ascii?Q?8YdXNneT9j+ro3J3W1lH+YkSt1Iyfot9qRRqojFISR50FAyDqjQLrs3A7o7j?=
	=?us-ascii?Q?RBsp+QHM58lSbJBU7VvuRIl8VJTLXhv98LPPNgMLSq4sN6RtpD/AHQLvvtMQ?=
	=?us-ascii?Q?axUj6xZl68HcHpInV3t+kbGAI3JQTtTMXyPBBsH0hYU/X5Ivv8a36kPinBNr?=
	=?us-ascii?Q?OOaEGBW80cuszBHQhTpRgPo3VmVxXV8ke3G7T2Cca2cwD/bBv+t4wnqmA8/8?=
	=?us-ascii?Q?1py/K133hBS38CokdvZZNA41DNkCZt5i1yXG9eM/9ynPBUt7gBJYF9E7GQ8Z?=
	=?us-ascii?Q?magZCdfgvBBANKcGqBxbVjIVVYDUV8J0K/LpgaazuDh6GRwrNBEySSd6qplq?=
	=?us-ascii?Q?xuUccXo67EsOyCFrla1du2EaIMcvoYAZI6sUNzxEfVHS6NAoWpROg4lCRxr2?=
	=?us-ascii?Q?//IQZBduxsv90V/d+1xDjUXIFscD3Jzgn2pCZ2BcotUL1anyTkGtaJuLc6XP?=
	=?us-ascii?Q?OBImZkR7d4sgMWFG/0bJDZ7yfmCKX5aMmmxxU3KJitgQJY42+jqYuaC8W2bL?=
	=?us-ascii?Q?qgc+va/B5CpQcWrsDzT6bRAZSFLIy/BNR0OP2/uRrOlawvLbfnCXnpKjV6j3?=
	=?us-ascii?Q?FNan3zS1X+XS0HHSNQ2Of8c+hU6PxMGXg4/rehruixoclJOq9lO+shy2QVQA?=
	=?us-ascii?Q?2+oBZTkNtjlcUWO0TLanBD1hVl3vLGYTvcrelpE/MvFaS2YABzdD4I0g+W+2?=
	=?us-ascii?Q?1yb6xmsa5XsxqXHfKPjOjRKxf8uleho3wPi7rT0Y4wt2RdWeuVl8NpLJp2E4?=
	=?us-ascii?Q?mYCBgG8swBn+kO05zcTAYZHGcb5dbp2AqcHLi7aIjQn/vdnxBa4kQnBUaE7V?=
	=?us-ascii?Q?XyJbq+yy6bAIYO80bWNHr9iVM8nsTla9y27FropfY96XcJEz80iBwGNWMOoa?=
	=?us-ascii?Q?+NBEg3JzCKEiD4+rb3m4cOLWGwNes1wyYATwYjn2z9tlkZ3aX6mbcFg2fKbH?=
	=?us-ascii?Q?Au7ypoGD7xk6fPNAwc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CO2PR03MB2230;
	6:JPBFgREfB3bF4K7fpKgGF3yFeuGqxUdpjRrb96Djmh3V6wVhJ4QKN4PBnKwO0SHhFgPmK5ppXGSifclj1MjNzeoS/HGqqJFUOR1ZIHZKY5YZDHhEScsCPWvPHaCmTnGquOgBsqF/yEbS9MUGR6LIxktLgsyJaVQjH1kh6J9mh99iSGFbKL6RHrnjTUY+ZpgAHbk3DrCRt5wZcsKSItS52hyfrFv+jdDe2p26kMJDte0kRBDhO4yqcjamL+2TNKLawRhlSBjBKDy8z3oSPDcpkty6+7JfqrgiNel91Cu0WNY=;
	5:o850Po8XmUhJ1gPJqyXfV678oB8gO8TJBskPWYhFgWQQXgVYX3RSI2jP8eLD2r9+rSaWfQG6KJufGKnL758M1vAop3jQhV5sUMeCIEZ0SL0cRd7KIWwC2ocdDBErkDhkZc11g9HZhEl5nYR5oF2pTVhrMqpdD45UUCstXJnXRyI=;
	24:mxUKmyAHYUGOkgrsOgyy09+ZDCCyrnSP6VFkjxzVOe5Y7G1TYD376XF3s5gwNIMaRghe33Dx4/A/QEEt2Nt5DiIdCgSk7Oaduk73ev3QgLU=;
	7:iZzFGLIFWfV8Yh6f0mTYnngxvaq1XIjrD/jfe/J7Gke/Bn6xB1BSyxX+NH0066UY/ERO0P5RO3YnBxU+xIi7+5LLLYJLmcXbpgBhHKMOYdlwGibemIDnuxCFJLROOCKy61kpjjUHlA3NANeCQyFh+BKBWfYsoMu9BrJXvut7Z3hREqltWLTssCP5KtXbg+XcdSapJ9f3el/+8IPZWjZNT2Yz+ZkTJCVc8UMeD+RzEmXISy8blwCN4h8KIoE8uEbXo0xF7JUPutBhLmSl5PXg2e0BlCOrcbuQmwuymy7VmF4Pk05bJOC2fLxPzWLav00J
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2016 12:08:16.9920 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2230
Cc: Daiane Angolini <daiane.angolini@nxp.com>
Subject: [PATCH 2/2] linux-firmware: package Broadcom BCM43430 firmware
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
X-List-Received-Date: Mon, 26 Sep 2016 12:42:12 -0000
Content-Type: text/plain

Signed-off-by: Daiane Angolini <daiane.angolini@nxp.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 6d0bc71..8e68ae8 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -225,7 +225,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-ti-connectivity-license ${PN}-wl12xx ${PN}-wl18xx \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
-             ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 ${PN}-bcm43340 ${PN}-bcm4339 ${PN}-bcm4354 \
+             ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 ${PN}-bcm43340 ${PN}-bcm4339 ${PN}-bcm43430 ${PN}-bcm4354 \
              ${PN}-atheros-license ${PN}-ar9170 ${PN}-carl9170 ${PN}-ath6k ${PN}-ath9k \
              ${PN}-ar3k-license  ${PN}-ar3k  ${PN}-ath10k-license  ${PN}-ath10k  \
              \
@@ -408,6 +408,7 @@ LICENSE_${PN}-bcm4330 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4334 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm43340 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4339 = "Firmware-broadcom_bcm43xx"
+LICENSE_${PN}-bcm43430 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4354 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-broadcom-license = "Firmware-broadcom_bcm43xx"
 
@@ -429,6 +430,9 @@ FILES_${PN}-bcm43340 = " \
 FILES_${PN}-bcm4339 = " \
   /lib/firmware/brcm/brcmfmac4339-sdio.bin \
 "
+FILES_${PN}-bcm43430 = " \
+  /lib/firmware/brcm/brcmfmac43430-sdio.bin \
+"
 FILES_${PN}-bcm4354 = " \
   /lib/firmware/brcm/brcmfmac4354-sdio.bin \
 "
@@ -448,12 +452,15 @@ ALTERNATIVE_TARGET_linux-firmware-bcm4330[brcmfmac-sdio.bin] = "/lib/firmware/br
 ALTERNATIVE_linux-firmware-bcm4339 = "brcmfmac-sdio.bin"
 ALTERNATIVE_TARGET_linux-firmware-bcm4339[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4339-sdio.bin"
 ALTERNATIVE_PRIORITY_linux-firmware-bcm4339[brcmfmac-sdio.bin] = "20"
+ALTERNATIVE_linux-firmware-bcm43430 = "brcmfmac-sdio.bin"
+ALTERNATIVE_TARGET_linux-firmware-bcm43430[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac43430-sdio.bin"
 
 RDEPENDS_${PN}-bcm4329 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4330 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4334 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm43340 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4339 += "${PN}-broadcom-license"
+RDEPENDS_${PN}-bcm43430 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4354 += "${PN}-broadcom-license"
 
 # For Broadcom bnx2-mips
-- 
2.7.4


