Return-Path: <manjukumar.harthikote-matha@xilinx.com>
X-Greylist: delayed 1078 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 27 Jul 2016 22:56:26 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0054.outbound.protection.outlook.com [104.47.36.54])
	by mail.openembedded.org (Postfix) with ESMTP id BE5FE606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 22:56:26 +0000 (UTC)
Received: from SN1NAM02FT022.eop-nam02.prod.protection.outlook.com
	(10.152.72.53) by SN1NAM02HT193.eop-nam02.prod.protection.outlook.com
	(10.152.73.126) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Wed, 27 Jul 2016 22:24:12 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT022.mail.protection.outlook.com (10.152.72.148) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Wed, 27 Jul 2016 22:24:12 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bSXFG-0004gM-Kl for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2016 15:24:06 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bSXFL-0007Gc-9z for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2016 15:24:11 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6RMO6kp028492; Wed, 27 Jul 2016 15:24:06 -0700
Received: from [172.19.74.183] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bSXFG-0007CD-Jr; Wed, 27 Jul 2016 15:24:06 -0700
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2016 15:21:09 -0700
Message-ID: <1469658069-20128-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22476.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(189002)(199003)(189998001)(81166006)(9786002)(7696003)(356003)(47776003)(8676002)(92566002)(5003600100003)(50986999)(50226002)(36386004)(305945005)(81156014)(4001430100002)(8936002)(7846002)(110136002)(63266004)(107886002)(2906002)(106466001)(5003940100001)(86362001)(50466002)(36756003)(586003)(229853001)(450100001)(19580395003)(19580405001)(77096005)(4326007)(11100500001)(2351001)(48376002)(87936001)(33646002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT193; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT022;
	1:ZxSI3WPk2dWztedXNE8TZTuWyrfT2XGRMlM2q2nVjeH9aGZFUC2TauXS6u3Y4vKE2T77OOjY6r2/ank/T0nreUK1ptq+M0yX2nmZz63ivY9IpktWzF2SUPIqjyeWl/0f8GvHGP3RPpRDLJIBdLEl0d3GjklyM8ZEwCGdF91OBVBInEx77SnkFfhzs4Fd84FEhOCLVCqUOLWUp/vuYC/Z6Mcfs+GAvcOcenPlx/EEGhu7NjAdRLIGhVCtqw+cVllohpFi5yvHBcetVORHYwY8E+astiRs5Qe9RBnifp2Zq+E/jeMU767Q44gliqBQeUq8xQQImRlomPw/+Cp79nYB4ZNKgD3Jr7eojRAk3hBb2bug5z7A6x/oxhyNVUYlK6ONYRzmGPiZbjAx+gOUKZRx2r7Et+ZexnLxoNEtgnNOtrQhORlpssNlSQ52PNaQRNnweQwkLy/sHMs6Be+rR8NtBHz609Z8SXCvrUrledTDNWh/2vBzFEwO3yJqq732GFyrn+7XYsrR8VTXhafxODtzR45+bQgZfo1k2g7AFSmzF9DaNUxCnEUZhyjFc3QnRLwr
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 43898392-7246-4f4a-eeab-08d3b66cbc54
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT193;
	2:Lht+uvBgbDMMY7H9feFn08MFMXM3JhxaZbOFuduhl1DQ8SLV1/aJ/qycOn+Ge3mlV3Sk/RblBHuKWcPLzXn63Qvg0A71XWoyQocsuioDXWXpsRNqmOSmBbfTYA+XpbXOyfU8cxF73RGqx18pYEknw0qdt6QxzPAAatOEeMORK955JJu0u4w35M1J7tfX/IQJ;
	3:iqXTNCkBpKDyMOAMggQDcKMn1R55HpWoi82N0UomxQbNcm/OAOtixHVgJ0MTiOv3nVyiChi94Goe8o0B6yOYNzvH1P9kBmv2Qy/i2aIi4lMj99pd9Ym6yOSIJWDNaYWNDIHZZeV1bpZSPzMx2w16f/tNeAahoXILcVC4jB2Mnh2TXSEnqavpn2CcWZ1t/5PD39KNqLZL1+bAhuPsAjfXtWRftEbvjPaW0s4TtWvMgezglQnYiwvXftMhyLanMQyon7NILhiF7NxjQ3ilOdkv1A==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:SN1NAM02HT193; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT193;
	25:+aUnCn1iUm1WWg9yxGQZzmG6gFQ/k2LVJI5tCKHwPHfw7zCkPiG3fZTkgfRNyyXoaa2kZo8IbMaa1C5LhvtyMuvLFeFYomwyNvKJcY5Ok1kcYn7cC1S7wI0WRn6wL2ajlk0C2PBqN3LpRSPV7vF1z0ZB0xeZ+u7qXgGCfKboU5YtgnhzSwA8H3KFJKKELQ5GhFtFGl3djpFfwy4nbR8DGJuVEwGynVQCt8hLj5fhMJgzkttM5ecS7iAfChyWIBa7vYyX0sZDEcg88xyN/YgosNmOsrZ4QQPpOG5QOUPFzVt7pKSkJWi0YpsYww6F5o4lxtHyD36ioWoqzALnHJxkmzreSlFp1W9sI2Rvy8eKY4RdttxfYGE5cfl+i1Xaivtfrzwv2uTpjrmOzgIZZ+b//NssncfinRk4r9AtSTOK12z5L5PI0n27AC6PvBQyRnKf+setc+5lIegJN2y2OgAG0c7aPfG+Irwy0hRtMpG5BKynA8LR/B0J6msAItEhTtkgf+YWafzzw2qFngKXnAIVYEBJ6YIFQcnTfh7RQiWwqiCKHyHky97FoOctUVizU8C+t7K4dPghHwnxzRHllTg+SQqdGtUK7FKXKb+FLcYi62AW8HzYJwyY9ccD0KJ6nNPQURd5ljGXhXDEvZIihEC7LF3fwWBjxsOIYIzgRjCvPD7BvDi0lB3yoramYAE1G1e70+UQeQQJpbJyDlD55hlazhVihIWVj9oTFCbBheak1nvUKKa7AtOgWzNTp7cvDAjVFjXZn0KinU00eML+wKrzf9XIbx2TjnzoBAewLH2ythg=
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT193;
	31:lKutMTRAsPkdee2nPqnIh/cJ1jNCFZQ3tvK7DIWhlRQ1yxI7/TCD+p6u0WgPgQvLb6lvie4oJk168kDnowftetWeYfNrK2H9DQH137A1v7A/L/wnrbwZ2fBiMX/HVpQ9OlsThNt4FLbyQyrfu/ABuQYdUvJ0eCrV6R/x2RUlR5qkeG0IeuENqxl914UL5UiWt8uQLyRmcsQAa/2spn+w60FBIu+i7LD+q1PkbZW0llE=;
	20:6bjaX0lILIApE0ZN+j/JTm28+JMsMxMkjf7QdbprFX/gxGFxcfBH2T3iFqqFpCXZc36+4dFimPgrx1rzAXeyPUifvpFL09P+L6o1hJvntw7pOmCRoGvqMX3NI6LcWTjf/M74kSH4JiAhlhnijxfZRefaZPLFWy8/obHoYHF4cciAibHrAJxb+pzuNeHAH24e5bHT8i/ZQrnYLO1bUYBTmvWPlxfcsN/B9+t/s/DcrLZUuszaItcMNpucwe6ot2+sjBLoDMQ3RUre4CzxXLBLbcBuWlgJZs/tdMy+BNu98oPB6iRZTLfBO9dSFf/dcJYa4B79GlMG02G0yRoxRx0ORge0E4ULuKnrG41XX8W0xw62uFhcGFkzW1HIRVgwhAOncKlO+SiBaAlKWfE1mSuYjjx6D1a9HwuGjIeDVAcC3dtUu2f583FR8A3uGGvnX27V7GwQPHeVcAPzcpg7+P1idQNWPPtDK1R3VdDKTdqIhayu2jKjR2CzDkJAJ2gMq4Yf
X-Microsoft-Antispam-PRVS: <f998fb1124f2422fa0d8bb5ba67a8705@SN1NAM02HT193.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(13023025)(13024025)(13017025)(13015025)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:SN1NAM02HT193; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT193; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT193;
	4:FBSpAQJ0iYXO/115eK3ZjpikOtidEwv7RoBbt967uXmfyxzHpbf0tfPIgN0KkS6GuHCqtE6vApyrIJlwjtdHoakAyq+hQ87XPPN0ygKPr/R+4dZKB3XZ0uAifPmzP41q0XUpBTAn8MtQ6VyFVczDDhtsvtahCBue7TU/unwNR6re7GOz4Swx8iiiy1zedXpi8RczZz47mUHnpwn2JTIxPrurqmKBNhda9TergWyhVO1orUWlUzkD6PDgHQUnHMMqIdTRe77VV2VbcghnC5XgReumMESw1QuOZvWMZxqwk+eflCtPZ8gacXKcoEsrhhyk+CvvaeCk2RLl7XCMUXrewgO5Jqrty9DrxdI9hmhv5VGEdeSSekfeZMx3TD5zv3v2+sz/GohSJwDFZZhpNcB9QSvKrR7Tfc9wx494hN1EL16heGQA0sz2/j12agEGM7BhmfgXL81dQpL+Uouc0A00ooA2MxV6RIv7Cf1HPXZ+jCFPJis1SXejm55BIiU5oQ2FvZQ6H7tgj7Vcaj5WGIgRoA==
X-Forefront-PRVS: 0016DEFF96
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1NAM02HT193;
	23:7kSjG7ZQ9yA8klGk20EgOYnSggCFBHgZrI2I0Ttb1?=
	=?us-ascii?Q?m78OmWHYr9XnhHK5yPiJOUn1bbR/pJaB4+VLz5WS9YGTu7dOwv3a27rIEKK9?=
	=?us-ascii?Q?1FVsBBsclkzfAu6yXVSZ/1D/eOOhu9s+YpbQaOXMpMf3p3JgWxHCkIhuUDey?=
	=?us-ascii?Q?c6c8K6NcCz4Qi1XyKQWRTiJkD3DQ6RrOdb5qb5uwOf4+N4pKBE+4+03qo6Oa?=
	=?us-ascii?Q?IzHQaRwX9TEHeZ4dvfgF3xrFs5spSDixvs3yw6dN7hnnOdJHJ0GXiV4DrOLt?=
	=?us-ascii?Q?jUJNTKDiztXTYGdODVxsGt1e5/fl9YRd7CWzjCjh4qmEwDedIn94MUDFJ846?=
	=?us-ascii?Q?przCjUujRMFWZSWheOnD8Hm9r4ZBbPiALPm66G2DEnJv+9C2lDhvE5QZO8P3?=
	=?us-ascii?Q?+5d81fMBYgfzbww/eEJppMjyGwnkwGSeX1Hmzn6LzM6XWb0WcTejor+eabCV?=
	=?us-ascii?Q?yg/GzdjNHaGQThhQq1/Uxydl1Onn1tx1Q6qZwznYEwE7Ae22LqA8Z23NpkDE?=
	=?us-ascii?Q?ITJ74NXdcJ3SkNHmpBVSJ8/y/oTwuNyUcbgavVMytIi0wupD8YBmvkltqMvn?=
	=?us-ascii?Q?HaczEUwdnVLGTqIuyX0njbLTyCO4PUAKfRN1vgnny7nCVu2sv2wqXWN0QQy4?=
	=?us-ascii?Q?782dl0A0XJcb1BM1YBMb5Th5JF/ipVfggJLynnjRm4/2EYrh7Ouuu2TaaRcY?=
	=?us-ascii?Q?8gPEa2J1JD2hzofyrDLYrgoVN7YaxpXGkyj7P9LoQzZFmFu0Fw8YXR2rKGyF?=
	=?us-ascii?Q?yINCjvTy4TdTrwxLq5l3NYbKjndpOP5q9AQTz0iX0gzi3+hT/+Kp1u4T8Ybb?=
	=?us-ascii?Q?Yrn5HHYjL54BVELs7S+we8EIfJvmRLGKxPwheZU6EkLVtJBTw2/mlgvEQZrf?=
	=?us-ascii?Q?sdkK6l5t3wNTAhBlFuSlNWnlykXtKrrV2274qHJ5mWyskQuwM4t62rpLAmVQ?=
	=?us-ascii?Q?VQTd5UeMoiVmva/RMgsp1yhLwtzVKvUvaoQu4UP+zWZchAr3nYx2XW+j5QcW?=
	=?us-ascii?Q?wtowt9KCy8OKp5CCjp2rUmmHPUDenNyVmEyScB69C8R1Btu4ZCKLwgp0jHyj?=
	=?us-ascii?Q?CuRk5bwRrAgLZgq0EEr1cGY6N2UbA0QTuyXmvixawPGeWXBA/Pu8P/1yhlRq?=
	=?us-ascii?Q?MQ0u1fzcAVD6RemR0JQqrYXxGYqD+EV?=
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT193;
	6:+94qbOcLJL2Dx40TvECp4OlT0h1nFSLf1GOeX2kZCWTlSjZYo/GRQzJsBWbUhVTR19Xuopl5bPworrkgrbvQJEWdYyFZhAS7kOeJ9X7jcyZsZK49CJ1TPu1VwVvRAarHXlqqfwvraPRYcf/c/USRk/+SS0NAf4urkbYLCBQazty0YaJP3gVj/XiMALymSAorTAlP5/g5rbyNJgHGnbHu3dgJYy7+jx7O6SRbVEz+L7iC9l/fwVgcOCtjAVf1K+Oq+rcijxmd1Wo8Mogx7eoyKVK8K2vZMsrxY/264zVq6Ckz5Uct7eHb0QLF/hHWcNdRMmZzuEyTIbjR3yZoRNjBCg==;
	5:NeWjvvTKzlcusk4SwmmTcxhEShbxmE755mHtzt9+guLiGtn3mBw6uCMItZgJ/g2awGUEnY5vygSYoxOznyvDg0jlFcpgO/y1A05EVT5SKJrrZTTS2qeb9DH+thHlFVM5DZZ89xdOpVD18gqKKZrynA==;
	24:scJwi2hh/ikYSmo4VCMgAWVl5dzFF6x0ZnKNA5yK6uHyemcQ6LmikziZP7XecWE/Q2tawECZSNsuFBBgioDEKwCB96Xh0569h6wulUcHTEk=;
	7:+qBsQyhbcXGn/yKj8e24zcUO1Kjq5gXGoMwK+lwjt7Sp/ZBuLTEJvvAAoGYE1TDWdCKaNNC9qXiCDKBWvaKwzKfrotauBv4W8VtY8TGwQVAVSp9duL3S9b0dbHx06Zx71yoNcRx/rAbcf4KufuDSWGUCwqmJZG69WI4trw3NW6af345YLAKpcfGVnL6dHgdpPiakZGsp99fpLa2yocZsLa6Extzkt2ggM6u9uIyb3eJkFI2kMxZgwfe7rTf1YqDM
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2016 22:24:12.0059 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT193
Subject: [PATCH] u-boot.inc: Enable EXTERNALSRC build
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
X-List-Received-Date: Wed, 27 Jul 2016 22:56:29 -0000
Content-Type: text/plain

This patch enables building u-boot using externalsrc

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 1f64faa..9e19c4f 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
 S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -88,12 +89,12 @@ do_compile () {
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
-                    oe_runmake O=${config} ${config}
-                    oe_runmake O=${config} ${UBOOT_MAKE_TARGET}
+                    oe_runmake -C ${S} O=${B}/${config} ${config}
+                    oe_runmake -C ${S} O=${B}/${config} ${UBOOT_MAKE_TARGET}
                     for binary in ${UBOOT_BINARIES}; do
                         k=$(expr $k + 1);
                         if [ $k -eq $i ]; then
-                            cp ${S}/${config}/${binary} ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
+                            cp ${B}/${config}/${binary} ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
                         fi
                     done
                     unset k
@@ -103,8 +104,8 @@ do_compile () {
         done
         unset  i
     else
-        oe_runmake ${UBOOT_MACHINE}
-        oe_runmake ${UBOOT_MAKE_TARGET}
+        oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
+        oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
     fi
 
 }
@@ -119,7 +120,7 @@ do_install () {
                 if [ $j -eq $i ]
                 then
                     install -d ${D}/boot
-                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+                    install ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
                 fi
@@ -129,7 +130,7 @@ do_install () {
         unset  i
     else
         install -d ${D}/boot
-        install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+        install ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
         ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
     fi
 
@@ -143,7 +144,7 @@ do_install () {
                     j=$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                        install ${S}/${config}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
+                        install ${B}/${config}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}
                     fi
@@ -152,7 +153,7 @@ do_install () {
             done
             unset i
         else
-            install ${S}/${UBOOT_ELF} ${D}/boot/${UBOOT_ELF_IMAGE}
+            install ${B}/${UBOOT_ELF} ${D}/boot/${UBOOT_ELF_IMAGE}
             ln -sf ${UBOOT_ELF_IMAGE} ${D}/boot/${UBOOT_ELF_BINARY}
         fi
     fi
@@ -172,7 +173,7 @@ do_install () {
                     j=$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                         install ${S}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}-${PV}-${PR}
+                         install ${B}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}-${PV}-${PR}
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARYNAME}-${type}
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARYNAME}
                     fi
@@ -181,7 +182,7 @@ do_install () {
             done
             unset  i
         else
-            install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
+            install ${B}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
             ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARYNAME}
         fi
     fi
@@ -205,7 +206,7 @@ do_deploy () {
                 if [ $j -eq $i ]
                 then
                     install -d ${DEPLOYDIR}
-                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+                    install ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
                     cd ${DEPLOYDIR}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
@@ -218,7 +219,7 @@ do_deploy () {
         unset  i
     else
         install -d ${DEPLOYDIR}
-        install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+        install ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
         cd ${DEPLOYDIR}
         rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
         ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
@@ -235,7 +236,7 @@ do_deploy () {
                     j=$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                        install ${S}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
+                        install ${B}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}-${type}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}-${type}
@@ -246,7 +247,7 @@ do_deploy () {
             done
             unset i
         else
-            install ${S}/${UBOOT_ELF} ${DEPLOYDIR}/${UBOOT_ELF_IMAGE}
+            install ${B}/${UBOOT_ELF} ${DEPLOYDIR}/${UBOOT_ELF_IMAGE}
             ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
             ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
         fi
@@ -263,7 +264,7 @@ do_deploy () {
                      j=$(expr $j + 1);
                      if [ $j -eq $i ]
                      then
-                         install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}-${PV}-${PR}
+                         install ${B}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}-${PV}-${PR}
                          rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_BINARYNAME}
@@ -275,7 +276,7 @@ do_deploy () {
              done
              unset  i
          else
-             install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
+             install ${B}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
              rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/${SPL_SYMLINK}
              ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARYNAME}
              ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
-- 
2.7.4


