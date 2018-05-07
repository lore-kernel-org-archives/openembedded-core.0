Return-Path: <alejandr@xilinx.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0077.outbound.protection.outlook.com [104.47.33.77])
	by mail.openembedded.org (Postfix) with ESMTP id 9E4EE748CC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 22:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4qcgxYwNhs3Br3O95mCkGSajcXrVAa5wrFrK7yZkFXE=;
	b=1/W7jTz62CmhVLziDIjBASBELzH7H2/69lTSSSAkEyQTueemU88E4GyUADhPdb1JXVXHoEl6wUZkU5jRWr1OY63yx3URf/7sxpAwjEaZhR1zt4zUuyY/u+WXmk8uTV4BYqICY5bYoO8nQXsPOD9jHWo4qVf2Buvd9mJ3Qf6u+i4=
Received: from MWHPR0201CA0094.namprd02.prod.outlook.com
	(2603:10b6:301:75::35) by CY1PR02MB1675.namprd02.prod.outlook.com
	(2a01:111:e400:529a::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.735.20;
	Mon, 7 May 2018 21:50:47 +0000
Received: from BL2NAM02FT033.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::202) by MWHPR0201CA0094.outlook.office365.com
	(2603:10b6:301:75::35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.735.17 via
	Frontend Transport; Mon, 7 May 2018 21:50:47 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT033.mail.protection.outlook.com (10.152.77.163) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.735.16
	via Frontend Transport; Mon, 7 May 2018 21:50:46 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fFo1u-0002jU-B6; Mon, 07 May 2018 14:50:46 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fFo1p-0002UN-8O; Mon, 07 May 2018 14:50:41 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fFo1n-0002R5-9r; Mon, 07 May 2018 14:50:39 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 May 2018 14:50:14 -0700
Message-ID: <1525729814-24709-1-git-send-email-alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(396003)(39380400002)(376002)(39860400002)(2980300002)(438002)(199004)(189003)(54906003)(106002)(2906002)(478600001)(107886003)(486006)(1857600001)(5660300001)(36386004)(316002)(9786002)(36756003)(5890100001)(51416003)(77096007)(59450400001)(4326008)(6666003)(7696005)(6916009)(186003)(26005)(336012)(305945005)(106466001)(48376002)(50466002)(47776003)(356003)(2616005)(426003)(126002)(476003)(8936002)(63266004)(2351001)(81156014)(8746002)(81166006)(8676002)(50226002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1675; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT033;
	1:BgquCu7XBGLPJvN+D+YvQwapPgtbmMiqoVdi5FAAguHdyi7WAzpZlrJbZE8nc0T0VI7a90qUoVArEwhA54bKHV5WugaaceEPkyR4BOuGZTKQH1tyK9t/BmlZpo/g8mRQ
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:CY1PR02MB1675; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1675;
	3:qzZgKxgNtxIpJow06BNiLwwTC72WWgVM1oYOynNHfXtkfeLKjRHWWjkG+zETFjyeMWczr3bY6K5MLCVE2RrFL0biS1xRXaRkysQ4Q6NwknBnAVM+PVB9JK3Etk1aswRi+cN3iU42WFGfxaWGFzE2hCMCyi8Z+9jaPoEo5RBdqQkdy1Z0STtB2Cucnq7lJ9KfmyIP8vRzqh47yZ8l8P3BHuQJB7npFZoei8U14oKFzjhZXrmKbqN21SfVSibgVdhSJViUJz26TIjw+xwtO8n4RBw3P5AL2gOklwQvOZf63ptuAWMUFbXcRM0EGBEdNsrkzfol9OFwBEW3v8e21ebL63wSzxNMKd3oN74fXlv5rxI=;
	25:R6xRbd+kOe2jpcuBJuGXHkKZQA5P0cSIOQyNS6+t/EfL5a3kTCGXpCq2KTriILynzW7Po3PkQzX39nk0Qv0HwUKfQysNLV2HQyf0cmbBmJkVWpvLqbiebRBWxgms8N7GuSaICukOLWC6P8lrrPTGIs+aV21IyGXlWozgNSiq7QSrJQ/qGPE7ICzauDf7lWAUdWSTJKpCdAUZXFof1hOYQWGE3nk0Kup3t6e9xqt6jDE4iri2WH4OlLUkcqezqZNMw+bimsiSTwwvC4QWpkDJWtysMYEf1eBS7Pq5U0vyExY3S90vOE76eNiCG/3JJ4f4vvvVeNI9j5Pt/YkISSh2vA==
X-MS-TrafficTypeDiagnostic: CY1PR02MB1675:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1675;
	31:JTw8FZY3Te9GsUcJbfF4ZoQzvneW9yyqIYG+JceGNHzQTvpZkJMD2GYZrzA8dIiShTlIrGt3DoBs352Y3XybkNxnleD91hN131JyUmGE3Asna00Bm2yf7zC3v1ia9/BGNSr/mSzmNljqAcgc/A0W8bpQrk7vkFI07R8FJSCxl78id6pU5HJw6/sArgJClqpSk6h/4uB6mtajHjxsHP+SCqd3cTFZvsayosaNh42qUH0=;
	20:5id4vz9VRCUt6uTD9yPAc2/4sZLx6bpMAeKahhzPozLlUOFl8V7pYuMJwNrCSpu87sRLbAj6V8QjWVXjZJ6lkOwTVbXH6Ye2JvBy3YMjv8E0a7GAe1CU/kjvbxBUsv4N3ScRjWJ6dId8RMKwaTLxag9kgvZoMBM1sy9QcBXLQJq/O8Rv0axw1rUy10rC7DmwlYtrt/LYjEFRP7jfPz/vj2q0UAd1vxxmzKVJq0/c2JFLMdLwPkzYZJjdIEKsdTrQRVjDPwsT7VMnDwuGwua42DRq/F1qhyO8czD40LQOvzwbr6aiZ1r4ZC8QyV6RBVLQCSw1qwukGmYTi2bdpvXC1lfa9oU3wC22WAPZ55Lr0V8vRaaAQF6chIg603JPg3wneDsjNFWTwabqtmdUenLNqu3itb+G02nRS+HCvlIP6fADcuKxWXt5ntuCHmDc1+tgfYQnTovpyDhHjKsFm7vasODfyzF9yMmZQoa/0Fjb53S3RLFApxx9NxXdhhFdtHxE
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY1PR02MB1675AE4FE606DE59203B2CB9AC9B0@CY1PR02MB1675.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231254)(944501410)(52105095)(93006095)(93004095)(3002001)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123564045)(20161123558120)(6072148)(201708071742011);
	SRVR:CY1PR02MB1675; BCL:0; PCL:0; RULEID:; SRVR:CY1PR02MB1675; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1675;
	4:xglO/56cgSChddxApsbqZ6Pj6sXD8X9hxgYQ43i1TFqyCRqzs7r5bbSPGUA6yn7YmIsaTgGpXk33H6gQxRxY1uA1RYw7Y8Q2d0DyDxiUFR/6pJG1a+1q+A8PGjeOnuSi049GNxG4BXVMsTT7/Rjoji4JomEEW6V5L3sA/J+P5VGGi6e/PPVSFiGUNVYeTyLb+Ojtn4nF8P0CRSvahqx+zsT1Iepe9nHSLPswagwevt4wG4k/99U2T3lHsbgpFQX0+pO66shrQLQkRGwE7Bkt4Z9KMpVA6IOtQb4AkNpq56xMfRB2+1eCERtdyiB6FmXG
X-Forefront-PRVS: 066517B35B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1675;
	23:LFUE/i5fqYRO9Pz7zQAcYp+PespuH+UZTHmb/PjwU?=
	=?us-ascii?Q?NljZI/cQ7ODPqYqihTxdRooMwkfGCwhT+r+frC6yE5pjFKzzGwXG7CHly4m4?=
	=?us-ascii?Q?/ZgaOCONfEpladLZOA6F/3hx1uHlwjMNYipnsVRpE0qT1rqM45Iv89Sz0zcH?=
	=?us-ascii?Q?2jizcFFtMyphGeKdStoZpVWnE2nL+i5qBtfOrc+gFN6itG0xAUvJpFZa/Evs?=
	=?us-ascii?Q?RKa/Uu5iiBEPwNPVJYu6Fyxe366bzvgMRmgjs672h5Utmxv5CutloOSi2WV3?=
	=?us-ascii?Q?OmuhRqwCVY4oJOvD3siV1FdvXTx49WBEBXlw9oiv6ethA+plggpOTeQREKyK?=
	=?us-ascii?Q?0M0EH42kVlD43yZQZXNdnOk8ylooa1lqyANnPyukOLWmPQ+basn6xKRHY3cC?=
	=?us-ascii?Q?osgaheGJGn5CriGoxuZ54P/E/g2ZjHbG9CA0ZALBE4NwbrjhxJH+6VaAIf/v?=
	=?us-ascii?Q?fs6pxISO8o/YjyXWw53Qa/I+2v0vAEeRr7F+0K9X4aWuURzrx1Qar1Tz3dhf?=
	=?us-ascii?Q?003hqbWhuoffIyt00Ln38pnRtMSaOlXjf7otgSJ7w7B0OoDdEDwAO6BcY3Qr?=
	=?us-ascii?Q?eY/AzeYT9dgZJCEHHYorn7FMFIlT2QlUTHNlk8Yr3Ta4CwJRqE4SQAJ2maBp?=
	=?us-ascii?Q?TRtpva+p4MNqNhYF1IoA3BYlcNcSGZK2modpiLiugYbIZwQ5QOV5JkdBwqfN?=
	=?us-ascii?Q?XpepXFazyPdMxLNrrFqwCB2QQKnFCUHxiKh91V6FtoJf8Ddc56vZcP0CFdsV?=
	=?us-ascii?Q?ohnsP9qlSyBOHFpGfhEm04BNH73lKD5pBx1i9Bog3CFMiamQsC6qhkiengq7?=
	=?us-ascii?Q?9iZbnJVvEFAJZ6jV4EbTKdb+aZmK+0QsPB+eRqtmQ3tWBjZZLvU+2ow6xK4s?=
	=?us-ascii?Q?IEzO2DcBg5+R5FPejIZoT+0n38ohWIEB9FyM4UfI+n6lh+s3R+Ky9Y9duc3f?=
	=?us-ascii?Q?SrhEAsbB3xtD+3iPLG17PC4cp7c92hEkvR7Un75PK3pZiakUuKaWJ5bPqDTc?=
	=?us-ascii?Q?n3PiWgfOA6oOEN8JCGBxhFl4GMPkdGuwa+z2tskGj1kNSE1qSeM1dIoiCpE+?=
	=?us-ascii?Q?f4gVP2ajGgZxt60PgDAlig9Qw307TIo1JStXncqWn8/IGblos5j3QMeHacc1?=
	=?us-ascii?Q?VvqVMTJ+lZCtuxqtRy6eZJPi2VHItkJnCYw1ZY6qRGuzBObWUUBlA=3D=3D?=
X-Microsoft-Antispam-Message-Info: rOPtlJyqIZkYQF0Gj7yjXfdKwNq/V/Ew1YkLgenm5EgQVNab02nsKitUdl0HXqL5TGAvL8uSIQdPG8F0ztfu6j14TTmcbVTfG75G83NOqHvcVLMQtRSKmF85sf4XJWbHYrTn3e6gRF6hgXQoNBwrlLQwciqHKaVl6Q88MEncl3MuGkwBewIsOS8Q68CJTPNq
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1675;
	6:Sw1JMDiA4ZYBe7yOw4Ho6BDHlpWxhCZT/G5JPTIHSkyRObZA3I07kWBXvWkpUlCUgKlCLkdWn9SEto++ZMrIz6KVXRATk3X7Jjz32kWjMa3ZCrH3rZpMnuQLDsgCcrF6w9T5jIRcmvrLAUuCS+p4kH2fQwBZ9aBSNdW6xIibSl/ibo1cnGfG9it86kqyZumpe2X/FxLPLiiqSUIGRslPrbeQv78lgjMcoVp3FITeuRGmG8gaLswLvSfvmTdFax/oW82zqFOXQ1D9PH59mQhoHplAtQ8cmjz0TgGzF/FMKMuHkTYmnXuGca6gbbbLGmv9v41k6q5lwcBYTYD7vdyJ9irWRJjNTM90rE8TME3QBFmzZRiW5a9eqo11czVi/IuvY6P+THKzcYn9+cwtFbG0bj6HnYu7o+DEOhj2lDKe45uwrxmERmp8YkdgO7dj92Q95tQQ3511cxd+S1ips8ki4A==;
	5:ptO55NQJC23EWuXUJISsdbXUxbutbMv/feywC2euS3FoDT+7wn5B185B/drHUPO9RKgz97D/V1xZOX/9Yq0/zWTJ/7jjI+ivT41EVKdBsSgbAhhrOhiKWAlNu+nX2PY675sLR7BNQkUu6fwAfsIocd2a3VFD78p6vC+oqJ3ZHFA=;
	24:x6KYisPzl6d8OQYu4UEAYa6s85CjvaUaWc413UCGmFd/hW1UECrzdHMJhh+JWGwaBvrIG9XZQhCHIJx3QEXfi7rUxnCtoLR5n7xT0F8GMJ8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1675;
	7:jKjPCfbJIucRKy8qbceWf/DF9CyXS9DCNjb/NU28TmOcPvr4BkjaeKIJnwjxl+1DMJTkiqJpYgn1cuawYMfunaocQYkUYVaI62ejGAGSLWioLrptmkeN/sJPiD+rWrLUyWA9qtUv7FZuGqZGx7JRVwsAiREiu0m2iCZm0jgBqtjEuuT2TFGRIDBXExXXq/4KMzrdsKl2nFKT/+aGmyUyJvndRea1ZUZMAfSxnKdxPuB/BHhWI/No0yp09fuNUdCz
X-MS-Office365-Filtering-Correlation-Id: 765015ab-4e6b-455e-c0bb-08d5b464973d
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2018 21:50:46.8054 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 765015ab-4e6b-455e-c0bb-08d5b464973d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1675
Subject: [PATCH] tclibc-baremetal: Adds virtual/crypt to ASSUME_PROVIDED
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
X-List-Received-Date: Mon, 07 May 2018 22:06:47 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

When trying to build meta-toolchain using TCLIBC =3D "baremetal"
bitbake throws an error due to a mising dependency:

ERROR: Nothing PROVIDES 'virtual/crypt'

glibc PROVIDES virtual/crypt but was skipped:
PREFERRED_PROVIDER_virtual/libc set to musl, not glibc
musl PROVIDES virtual/crypt but was skipped:
PREFERRED_PROVIDER_virtual/i586-poky-elf-libc-for-gcc set to baremetal,
not musl
libxcrypt PROVIDES virtual/crypt but was skipped: Recipe only applies in
nativesdk case for now

This is caused by the changes on commit:
29f65bda6d2c9fea4adb125c4857ee64f9312b9f
nativesdk-glibc: Split glibc and libcrypt to use libxcrypt instead

This is where the concept of virtual/crypt was introduced.

This patch adds virtual/crypt to ASSUME_PROVIDED on tclibc-baremetal,
providing the missing wiring to build meta-toolchain on baremetal
correctly.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/conf/distro/include/tclibc-baremetal.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/dist=
ro/include/tclibc-baremetal.inc
index a8ce6d3..8d570f0 100644
--- a/meta/conf/distro/include/tclibc-baremetal.inc
+++ b/meta/conf/distro/include/tclibc-baremetal.inc
@@ -8,7 +8,7 @@ LIBCEXTENSION =3D ""
 LIBCOVERRIDE =3D ":libc-baremetal"
 OVERRIDES .=3D "${LIBCOVERRIDE}"

-ASSUME_PROVIDED +=3D "virtual/libc virtual/libiconv"
+ASSUME_PROVIDED +=3D "virtual/libc virtual/libiconv virtual/crypt"

 PREFERRED_PROVIDER_virtual/libc ?=3D "musl"
 PREFERRED_PROVIDER_virtual/libiconv ?=3D "musl"
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

