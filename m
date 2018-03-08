Return-Path: <VINEETHC@xilinx.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0089.outbound.protection.outlook.com [104.47.38.89])
	by mail.openembedded.org (Postfix) with ESMTP id E156278A03
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 04:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=WXZT32fMSdJlrqmu3O4zTVUtMNNdPC6CLkQOgOJgNuI=;
	b=L55Y4EtzA12qlFGMZ0Dep6/cz8kZDIM6IBDv/irslxUUxRAPNs7xWoBXTORpGvgWq+EnVBkj4psTzzf0vsv9XjoKVrtyoGHTFF8StfhkBMPBPm6EWXJqEh81qxxGXkDi4jwItSCJNUOOwIrFsLVDGYqm2wuzk86ivmT0D7LyjPA=
Received: from MWHPR0201CA0034.namprd02.prod.outlook.com
	(2603:10b6:301:74::47) by DM5PR02MB3815.namprd02.prod.outlook.com
	(2603:10b6:4:b0::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.548.13;
	Thu, 8 Mar 2018 03:31:24 +0000
Received: from CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::209) by MWHPR0201CA0034.outlook.office365.com
	(2603:10b6:301:74::47) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.548.13 via
	Frontend Transport; Thu, 8 Mar 2018 03:31:23 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT022.mail.protection.outlook.com (10.152.75.185) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.527.18
	via Frontend Transport; Thu, 8 Mar 2018 03:31:22 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:59688
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1etmH3-0008B2-DU; Wed, 07 Mar 2018 19:31:21 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1etmGy-0003n6-A8; Wed, 07 Mar 2018 19:31:16 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w283VArI015551; Wed, 7 Mar 2018 19:31:10 -0800
Received: from [172.23.37.95] (helo=xhdvineethc40.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1etmGr-0003kc-QD; Wed, 07 Mar 2018 19:31:10 -0800
From: Vineeth Chowdary Karumanchi <vineethchowz.chowdary@xilinx.com>
To: <ross.burton@intel.com>, <manjukum@xilinx.com>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 8 Mar 2018 09:00:51 +0530
Message-ID: <1520479851-22522-1-git-send-email-vineethchowz.chowdary@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39380400002)(39860400002)(346002)(376002)(396003)(2980300002)(438002)(189003)(199004)(2201001)(77096007)(1857600001)(26005)(7696005)(51416003)(63266004)(9786002)(36386004)(5660300001)(106002)(4326008)(316002)(59450400001)(106466001)(8746002)(478600001)(336012)(8936002)(110136005)(47776003)(8676002)(81166006)(6666003)(50226002)(305945005)(356003)(186003)(2906002)(36756003)(107886003)(5890100001)(48376002)(81156014)(72206003)(50466002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB3815; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT022;
	1:6QodJTlMAH1bMkj1evSoQdTFAkbocCrcFC3IxEwEYV4nAe27jXMW0KwGEYLNqk3QG3BTUH0QSFcnY2FoiqWi3bc95Xy8LBagLn1Awtvg6RH4W7HkPtCjAJmw9v+pIkgg
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4684de0e-56b6-4aa5-5d05-08d584a510ec
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:DM5PR02MB3815; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3815;
	3:j3sHVkIDnNjou1CQTR2UE4k+2r4yqqFfwPaUyu/1R71lHiSUTa2CIH3ERj0p+XJfKtoBEXDrP7KaUvTTdx+33t3LV+62w/avG/gnWksGcBsax1FekabAc3Z9XpYVYXpcYZd1ZkoINLCLmti1XOL3PJAgcLkKpU2WJXUyhNMjMn4xHVBbhfyiSlHlYYEtBQ54t8dMZ1TmFjnE4su3w+5ebfEYN3zoHcg1awMegN/NdgXXS5WAvUzT02IrHZTA0GrBkb5YrDkDGLs2W1rRQVX/Xev1oCt6D9CC12FSKcp0EGVY4Egnu6kax5U3t8TeFXbP/PsahS5wsY7vqf9K4nG2nh7O45p4T5GSACC+zkdJR74=;
	25:DgIPkIzRgzKUFgSmXzS43JDGHiZkfpPGVHJl2SClC5W7fv8TNkZZPkNt+Z6oO6sRxHfBhUIDMLPbkLeBRCPVCleJ5zB4OZHkSLwr11bNFk6DpehH6SqyKEw7MKtapyJLbqddH5U0y787B8SFICsl0sDJuFIv1zZDFiI6Gl0wSQX1Pwm4p++2tWNKf8jmTJ91zAiP07Y7wASdUhGmvbWVfjZcTygHt16Lu3WDdBihnQLQD0zSByYshI2BvocdeW3CqkgzeN7MxVOlRSI5W/oS0Nm+m+UAa1AOjpkkPDnPm5yEvCcSouh3v94tm/eqiCy6XZcyrQLhN+rM90HyXJVMNw==
X-MS-TrafficTypeDiagnostic: DM5PR02MB3815:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3815;
	31:GuFUkLXMyZxkj6bcZ8mXwLbP62myGMfL6kkGU3gpZI7Cdl+w8LdDAXZb52VpsN87OP+1gafhtTLmr6WLa41qlekT9QNcE8hn+JkPl40ek4wYyDgXhSeIuoyUuzx56qZuZO9ITWRPvaQemS7wHcjQhh5l4bwei03/U+olvUkTsD5U+j+PUW2dDgaMQlG150Ml8c8GRK91jyPu00JvEMfvFfMJBPZlMXelmNfot95C6yg=;
	20:JJBykoHZR7IVDkbUSDovOl9g0HxUAD6bOIwevIYayOl/dCLajyz1okODCTZspiSrUZdDNaSaCWm5pAhoU235BErILk5dqEgYJRZJNB3VfXCLxUmEJRBtVrk2KudTty41yFn7mRGenab/3mhEVZiaSkyP8Rs1axhZVhfprFMEpWY3ClXUnUNaVClDShRzRG9x8fJgCVdZRT+2x3WiQ1CylGGCvQN7bcICQvqwvq/EOWbMg4isdvGxzmXVg5F90XwyY9uIztNA3wI8V6+5U3PhbbMW8OlGX3Y/koH+eLo6nRCcra9uFTZsMD/pFnxF60HFoAipU809Y1xJKWPOAb4m9L7fVW6Rp18XyQALJvHWsojWI7Tqft1USiJ+thBTm4eTTkz+iiBmXYWPmW1X6WSXW9vkmIfaH24mHgAdBcxBeV9BuLV4WDmJ9cTvEUd98pUyzJd4VqPXbGwmdztBygPUv00zpMk2PwOJVxKGZq1/fUmHBFXvxpixygwmdmvXEE29
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR02MB38157094EE00A8C04F488507B9DF0@DM5PR02MB3815.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040501)(2401047)(5005006)(8121501046)(3002001)(93006095)(93004095)(10201501046)(3231220)(944501244)(52105095)(6055026)(6041288)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(6072148)(201708071742011);
	SRVR:DM5PR02MB3815; BCL:0; PCL:0; RULEID:; SRVR:DM5PR02MB3815; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3815;
	4:tF17VlyCclwXJ/Rwimh0rXMpvNxu/lYHNd6r9+5ZV4X+Xb+mLxGiHymJfsUQ9iY122pRmAPxvDbmGGtzXmV8wNCzXkdWCfGrChP3CCXZdXNaTqgBakZG2Xyjzxk0O3TUpPzi5du6Tkzptx0GHk9hIChPfq/CNMIw4bwMxaiqpjCj6cqzoTxNsP6MZa59Oy9C/nHFrjo0cZ80EgK7s+s6Mt5UMItpXJtL6v3fEhoZuxR8NHtzpXDhqqC4rmenVn+2JDOGPJPJpZw1NS4YtNoW0c7nfYyvdl0zwh7S4Xcp0sNh98rtgBAhbcj111LA+apO
X-Forefront-PRVS: 060503E79B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB3815;
	23:fH60dNdnUpaMRzlpddfknLCELt+KdtRY56tvITUG1?=
	=?us-ascii?Q?wKk+bAq2d2TWMOmhInP02gNZDatX1QB+hkXDgBIgTBvu/M+dMHaXqmg300XB?=
	=?us-ascii?Q?JNpxet0ObGXVHTGcX9QP8t64fMH1WFUzp5rrBLaX85lfD9Dd/QguiG/5Tdo7?=
	=?us-ascii?Q?OwMuByUUvDDLdhUiHdIwCSk9wyYozN5/ZeLQuirO83153DlyJgGkJx6riwJd?=
	=?us-ascii?Q?SoxlKiLLmy+Y7qqWUzQxPb++LU/QrnplrgP/9DqrZNFF7OCW7P7DKbjsro70?=
	=?us-ascii?Q?IpxXCbJJPTdwuI6KQ2s6TD5nFrx5T45YmYIhP+A/Ms7Wvor7K0mgIkbYiU2z?=
	=?us-ascii?Q?+nTD0eDU5SG/E7KJUAj4Oa2M6sNUdjQYYs/QmLKgUOic1Q4BW52nRr2YQRL9?=
	=?us-ascii?Q?zCWEd4tCM8y2IYRPMvSW2lufzoUPGmZDQR+5nvq/QvAklHQxoMT5CzAqwKEB?=
	=?us-ascii?Q?1oM0/Rc1WXF9TRacwJ+z8zcAtt1C/SoqdaB16OmmzppRBiRQXStUBWl+OJ3N?=
	=?us-ascii?Q?SZ+Z6o3kZ5O8XTJk+NYJMtxG0fpcDFddNGcC/pNt4wt94UgwHGmtamKa+gmv?=
	=?us-ascii?Q?fsvvBysuIQ7mPvNPt+ti9WBPPta0zryYkna0f21P2IgaDrD6d662VP+fujeN?=
	=?us-ascii?Q?DA98TF1OFkw4EDncN0cYoGcAAp6S0DBqzLCRyftETA+n7MHwXh9DdOyYKgDH?=
	=?us-ascii?Q?q1M2gsLMCTpyVRbnd/dHSh5fZMmWa0X3+41COtEiIjOHOgBp/BQKx56gZS0I?=
	=?us-ascii?Q?5eO6ai8//povXnTwMk4jvaGPOEYwaUuxPFo3Dx1AFDxKM+k+NFSLees7hBzQ?=
	=?us-ascii?Q?vR34QgrmnAqXO+SxVw4UiaicKxTdb89zs5DgnyBy5G7g16txo3dYr2KtV8cQ?=
	=?us-ascii?Q?Y6akN+S9wc8FdhrTW3obJoxN28hblK2e9HbkfjMjzwGG2AZqGea2uykrI5Ch?=
	=?us-ascii?Q?6s7kqur5JUFKN7PgKb3GNy5bwGU0eewVA/884OvtnIo5kwcamw4RYhV6YW7t?=
	=?us-ascii?Q?pZSaMEjCSuMcw6KZ4gngjwGm1ceIHeZ+D0jxzVTgb9L5rs1KmoqPU/TySea8?=
	=?us-ascii?Q?CXcscy+BIhW4SQkzL7Bohn5BHvjuu8DKYDFbHIoI2ZFB4C8MQ=3D=3D?=
X-Microsoft-Antispam-Message-Info: JF+Y2o8aY8u1vfrszdyIncMqEeIEvMlIjXMu6Yudscmk31gQDrClvWYmGGN+rrueXCl+tu0YARUSQOW8ZmkJQoF9kRA30xuZ0uZi8gCRgblAXmvhRVH4PGNjRAZraRSiqn2aKoCGXjg1TLDFfRwHU7EUSR01kWxD4z/tXrR99SgsKyTiIWSvgbK2dUqPyah5
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3815;
	6:ZDMKaQ8M0KEGqyk7e/9MtFGMRYmKJZs6VdGhtW9JRvNlDpwybZlcmZsHkzotlGnb6wymgloSo9Uf7GrbymVeqOUp2PVomou3tsvU2LWSF9aru4soVlaouUCsbdy/Gk8CSWcwbkOY0Ct9p3BFz+cK24HA1qdXtwQ6JZ64r/GSEFZeYQGo+wXbJ3DgINlQqrFudkl+HnR152qxeb3UgTvB92gDxUnZUsyft7OTvq+8jD32GDlRPJwoALPv8vZgLukhWu9wJAmHgjZeFlOW1e+o7S11H71eWKX7HViTzKLrqyRk2coMIfTn5CtFToZ9oetd2skJtplAegUHm72O0iS/Oizh8gTBaq0b+L2EEsU1Jag=;
	5:jqe2+8Vp+rBYTktQyOr6fv/pqtp6yPL9HeoQdnq/7B/9lK9fRc5u5CbWCkJ0sgAffgNhS3wXAujvcRB9gKtULZkNmCjbmyafaMhtfffv2M9Rzqb4VqGaMciZ1yaKwS5WGsVjbouOvpgHI0VRpSVcc+dsqjkEJ6hridhVctyIztA=;
	24:4oJ15z5xJcdxjkxyBwp6hlGvcaoApVh1CX4jzLAABiULU8Pp36Fx+1/8a1W8SGP/Wrl89nEKyEJpORwVZyAQxwmijjWjRVV0d8S+lQ807tU=;
	7:b2TD78pgE61I3iNlgJHPL0al+hggNk/Dq5YniAbWcFX6Opi6ruelekgNw2Bfg/WUZ6oKEkkOqqKjOjMFHbdgPpyMpcEJIG6vA4KKgtDY4XZd+bAzVtTv45v4vtDXSnT70ms/MpeZAjig+tHqss3ML3MiHxI7miOzsJk112Ae95ngFLZc/KCXS72CZi1zu/pM+uzaxPtjC9GtzXy8dVLW1ty4+2fCEZbJy1PYIIH+ySAc/jq+xJrjMe2MEG4Jvt90
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2018 03:31:22.3064 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4684de0e-56b6-4aa5-5d05-08d584a510ec
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3815
Cc: Vineeth Chowdary Karumanchi <vineethchowz.chowdary@xilinx.com>
Subject: [PATCH v2] kernel-fitimage.bbclass: Deploy fitImage without Initramfs
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
X-List-Received-Date: Thu, 08 Mar 2018 04:04:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This patch deploys fitImage (linux.bin + dtb ).
The use case is to have 2 partioned sd card, with
FAT partition having bootloader + fitImage and
ext4 partion having rootfs.

Signed-off-by: Vineeth Chowdary Karumanchi <vineethchowz.chowdary@xilinx.co=
m>
---
v2: Proper signed off
---
 meta/classes/kernel-fitimage.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fit=
image.bbclass
index 50a91e1..25884d5 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -464,6 +464,10 @@ kernel_do_deploy_append() {
                linux_bin_base_name=3D"fitImage-linux.bin-${PV}-${PR}-${MAC=
HINE}-${DATETIME}"
                linux_bin_symlink_name=3DfitImage-linux.bin-${MACHINE}
                install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_nam=
e}.bin
+               fitimage_base_name=3D"fitImage-${PV}-${PR}-${MACHINE}-${DAT=
ETIME}"
+               fitimage_symlink_name=3DfitImage-${MACHINE}
+               install -m 0644 arch/${ARCH}/boot/fitImage ${DEPLOYDIR}/${f=
itimage_base_name}.bin
+

                if [ -n "${INITRAMFS_IMAGE}" ]; then
                        echo "Copying fit-image-${INITRAMFS_IMAGE}.its sour=
ce file..."
@@ -478,6 +482,7 @@ kernel_do_deploy_append() {
                cd ${DEPLOYDIR}
                ln -sf ${its_base_name}.its ${its_symlink_name}.its
                ln -sf ${linux_bin_base_name}.bin ${linux_bin_symlink_name}=
.bin
+               ln -sf ${fitimage_base_name}.bin ${fitimage_symlink_name}.b=
in

                if [ -n "${INITRAMFS_IMAGE}" ]; then
                        ln -sf ${its_initramfs_base_name}.its ${its_initram=
fs_symlink_name}.its
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

