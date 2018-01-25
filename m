Return-Path: <BSREEKAN@xilinx.com>
X-Greylist: delayed 3657 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 25 Jan 2018 04:00:36 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0053.outbound.protection.outlook.com [104.47.38.53])
	by mail.openembedded.org (Postfix) with ESMTP id 53BF078667
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 04:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=uQkYYAIYUbruKvYOkXwaX5d/PJVqA5/uoajJlgFIL90=;
	b=2lEA0LPonbtMUZckK+HF0WZFBuawZaHrihZKlGdDCXyy5b+N8j/LQFaWuXiSia1dyOvhWAjO/D1FqoR5MlWHCUg1b4+VuHmIIJ8AJvyBNarZWgYH3pWz0eayXuyNUsuUl+D+rjQVlbzqAz15BKF7EVo3iQTMPnsgyv2ow4OHzxI=
Received: from MWHPR0201CA0016.namprd02.prod.outlook.com (10.167.160.157) by
	SN1PR02MB1344.namprd02.prod.outlook.com (10.162.0.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.444.14; Thu, 25 Jan 2018 02:26:39 +0000
Received: from BL2NAM02FT038.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::202) by MWHPR0201CA0016.outlook.office365.com
	(2603:10b6:301:74::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.428.17 via
	Frontend Transport; Thu, 25 Jan 2018 02:26:39 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT038.mail.protection.outlook.com (10.152.77.25) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.444.13
	via Frontend Transport; Thu, 25 Jan 2018 02:26:38 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:55461
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eeXFN-0001Gt-T8 for openembedded-core@lists.openembedded.org;
	Wed, 24 Jan 2018 18:26:37 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eeXFN-00039m-RD for openembedded-core@lists.openembedded.org;
	Wed, 24 Jan 2018 18:26:37 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w0P2QYNH016009; Wed, 24 Jan 2018 18:26:34 -0800
Received: from [172.19.3.10] (helo=xsjbsreekan50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eeXFK-00039W-GN; Wed, 24 Jan 2018 18:26:34 -0800
From: Bhargava Sreekantappa Gayathri
	<bhargava.sreekantappa-gayathri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <manjukum@xilinx.com>
Date: Wed, 24 Jan 2018 18:26:27 -0800
Message-ID: <1516847187-6081-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23616.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(39380400002)(346002)(396003)(39860400002)(2980300002)(438002)(199004)(189003)(36386004)(81156014)(47776003)(356003)(63266004)(4326008)(2906002)(8676002)(51416003)(50466002)(5660300001)(316002)(186003)(36756003)(77096007)(48376002)(336011)(106466001)(72206003)(50226002)(8936002)(305945005)(106002)(478600001)(5890100001)(6306002)(26005)(59450400001)(81166006)(110136005)(9786002)(8746002)(107886003)(6636002)(6666003)(7696005)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB1344; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT038;
	1:6wsk0RHbWjFso/4la0A8C5l8Myrhe5r5R3d8QEjmkPjRqY/MmVO6pfJRGKtaRxLsLzWE3793z6GxcHp5GijHJOLSg55CM7kG98tV0Ol0ulj6LzG8mhGlnRNb2Zhe+HYs
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fc381db-92d0-4c0e-b54e-08d5639b1041
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:SN1PR02MB1344; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1344;
	3:AeO2Ed9P7Gm70X3S7vU8xbEDWA+X9IEfd3NJPjENNWiSjXU44a138fRV9L61bu5pbtf5MMheRwxAW8IylW/IOgSPfUS+QjNjorZVnE6jk+tWVVupxZ2Bgr+73m5pX7td2LGSEHVyFz2VYl3BmzEqpSrl/9pHC1xbMtglFY/gVYBfCNPydOYbdydNUJ8+rHlvjd4WyfvnmFWR7MQmkF3/hEKP9gfR8y0HMIoZ4saIS7O12bRXyLVYS1n1Pcu6ENzArNYIMaOUZBvQ2UvaGOCbiysEpkuo2IFS87zEEbpZlxrIg226hq7M4N+y/1s1ZkQ7G9xsEFA+7DcXfSTCb/5LAE3WAn4E1G/ZyVUZfEwd4mw=;
	25:KqODSnQMLI7xEicHI+yLzDOovELNEfPOQOciDrL/LHVebN/zWkWeBcAUkAWGUtJ4EEo2d4/57QmFpgZwp1+b+yzQdlF6jtCh0KqW9qjh6JvuSUNiuGTiSc+a8G9ivyGk2Q296eG97jtDVouTUuHEX8q2XoLXYcQAVjLWVfQLeH3eH2rFNH6wsytxvP2+JToLWnNhp7u3XtLLLTD+rcwQGOUeSBmJRcgs+QauFBn4p8Dt9OhU1Sp6IChe4XsKTv2dFvLBuI+hFMmvrcawKUoiKzhfRama5TgyZxcEYNKEvLyNkcrwlz1ouOkZmi4wpWD9maXOlmKkcxftKX6Mp7i1OQ==
X-MS-TrafficTypeDiagnostic: SN1PR02MB1344:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1344;
	31:nyOiO3P4aTfDd4lYrL8rv4i6GKl/bjiTOjSYGlvN90e2tfZXTrLZFm0/vcUfQByUWH+3IKco6bKdml4uOheA4C2rUqzxGXtQ0Flw9Rsl/0zG7E8KfUCS71CxczK7d2WTedjgfZu9eQOjMUoBqEMBLbvA2LLsJdHvaTW8ZC5viWbVLCj37T5e1ogiSpZe9gbgSQnxJXb1qY2RsOPbjWdt0brQ4M/8+DkyRHCzhv18CDE=;
	20:7gRMoA6WGD+vY3dOxWhsjN/ANAhcZzJmPMsyaBu7DptwUqhq/pXI/3A+ueZ1ZWbELonw0t+27P8lQ+qTi/fWsY1QuVlPhehnQykXO/gezshfa4dN+Xb/FJ1TqZzSmc8Igb2vsa5V5mLrADu3lRtw3dpQtvgTXDALBRNbiLiBtqIedOE94IrsH5Y4Br2H9XXgbp3Oj192H2MvpUR5FVDbxEa2J4zoLzeUZCrpvolq6fAwSmle99/XwQySFXV9uxJs8ZCEekqsFs6v+FT+8fjp4YS9k+qrNBat8BWcj7aZ0DAntmD9dU3G5I9yXbliu6hlK4Q9JF8pPfWUA2t7F1uzJE+b1vK3S/RPt1YVORqh00oxdB1x8AdL++wSNSTmCGcHfLcZaloO5lApOiDgS0wUzm7z4IT/alpGTaRB17MS7VNM16+CSubtyUkl5JJDKQ4UFM6QcsICoY8DXo569szTkM9PC0Ol4FIMgohqmMnNLaIV8Po1OKHIXuFckxN8AFr8
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN1PR02MB13441FC8E59E6942E338DBC0B0E10@SN1PR02MB1344.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(251646265452963)(192813158149592); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3002001)(3231023)(2400081)(944501161)(93006095)(93004095)(10201501046)(6055026)(6041288)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:SN1PR02MB1344; BCL:0; PCL:0; RULEID:; SRVR:SN1PR02MB1344; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1344;
	4:A5nzyeWbflPz7sPfFTBd3fpEbwyP2CiWNtIGJS2I/e4c8UHGSCOsspnUXGjSUbUrMFgfoXaP0Y86mwZT88Joa3W8LqtkkuJgnlO0O9OTMRVPEVgYu79FxxgeotKynWSLXxHTEC3v9yrg6hfAlIaXWm4RKxxHmCiOAofz5eqyhJg2UeFqmx3Y/nDQodfU4cJEQOTvqXpbpp+joGyqdHf9ueKkKS65kpBqDFxvK7GUWdZIvzswUsq3KLi2pu04ctROEuJicL01zNt/zMIhTqr9hjASeEnTNGrtJOkAwU1Rcbf1gUj8eL2ymVhLieZNGVdeEYuFlicxzGHk9TxcfvDtumJ/Syx8o4CL0xGUaKQQtcdfyGIvaMEJAfFBqGbVJR6a
X-Forefront-PRVS: 0563F2E8B7
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1344;
	23:8gONz+3d/5qsA3f+Oaflc0SDc9/W/xo5HbJhKAYo0?=
	=?us-ascii?Q?lKFva8G3i9JduVsAyZ0K4x/mcagd1WyOeL0W0OU9lwzAKxUE22jf24I7DmBL?=
	=?us-ascii?Q?mD7ot8quCO4DHyldRhb25L30U2t3nYKtSHpOvRpDSvf7CdXOWbaS74zKalya?=
	=?us-ascii?Q?20jUgu06janw2lPGk1bRn1I3z9lnGfwqmhojFTH9w6TlYeYbJ+dP1NHkn4yO?=
	=?us-ascii?Q?4512Gke+uWo+FglaE7CqdXB4+uMXYC12pW2XVKvYDJ23WV3N5FuZEdMCsk2M?=
	=?us-ascii?Q?MSCcgvad1ak3TmQyPq7ilZHS7DUlDm2kiqsPSouLM037NPO2dSiiwUYKx7I8?=
	=?us-ascii?Q?cTwHlbMGjj+N7tbWiFFQs2vVh+suj7c0p3avPr6tixJr35sgmqIAxp6w6HWJ?=
	=?us-ascii?Q?pb+WcVp6WF9KA+7eXY1jFU7fM+8Up6NxcNde0eUnaGV0loqx8COOYqPNf3Ep?=
	=?us-ascii?Q?uNElVj4H1Ye1h7x7TBqZjqRxayq04XKPG0G1FC8IUfCSa2I1g/rvRgMEFLYX?=
	=?us-ascii?Q?9cYH2tJNAkjyvPUzWxXod8TG/V9gpZJPOeB8zSliBE8ziYygXBnd2UkDhBrJ?=
	=?us-ascii?Q?uRiBi4r220sRU86bkY6LB+IgKfKB6G/zYf+/IkPsvpxpEctid12phMJ9Rj+U?=
	=?us-ascii?Q?XfK3vCA9swGq26c32wxkLAk59ogtasqGMOf5gvtSq+ekFtXF8NO3K5K/DRO4?=
	=?us-ascii?Q?MANkSHCBtZmALhJXcXS2ttYeCsMT0ZSWqgqjBzOna0XeteTF9gpN3WWEfoJk?=
	=?us-ascii?Q?/f4pwOr+CfqskgEi/5FUviT0lMCG02FvQ7S0AmjGbcDwWutGYO4FtmAQmkig?=
	=?us-ascii?Q?kMskMMyrvW+1Uz2LxthtOJhZWCvkGl0MdawV6eHCYb5oNuxAcMVgB1IMP/oF?=
	=?us-ascii?Q?o/sVNoixX2vhBrRac1yVfugBWCLOX1+FpuZuwsZdIAlD4iz8QKoWq0FZCiRM?=
	=?us-ascii?Q?WTMwFDSZV2zPijO5O4DXHLR9hacn+IUIyRleacOufOQrbRSJh0o8JGs+F8eI?=
	=?us-ascii?Q?iabyGjPS0rDEcUGF13q/TY3TLnDu06QlmIFwFk8tFjYBzjvVp8lCtd8e+A9J?=
	=?us-ascii?Q?/N0J/cSDABRsJCm3e0k41I7I2aciFq2t6NDkuEQ2037RPGcNg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1344;
	6:M9n/nZj7kMwPzDYdotaW1JH96deWDPUJIqVuv13LN3UrdOoSekrX43X4qR9eLlKSDSxtFBoNjiaA7TgFnd8O+57AoQSrB3oPXPgwIg1XquBEqwv9bbir7Ta2KutXdunuU5kCp4yn6JiSpIKwh9P1sDcVsJ/neDM4uLXt4XyaeRoKYZAjJGN1fXASuH6UQDkcEslw6OYZNewY+DK7q/YC1puJy3GmdnJ4T02Jafc5/j/FxniEdsi97ngT40BcieeSYtDh2IVYfXE4ocj7OoFOOA0cDeNBM891+AuhY+zDUt7Sw7aICNebgB7rsd9COGmZf+3bJy8QTU4KdAL+USvPTo4Dq3NK6PAoHKQ0wLHit3M=;
	5:TXivpXBxEeA/AAo1/IUdA0JeCG9fRAw7D4wvH8jyZ56m4vYJ1AWEPZIf1jN0Q6fPgpB9lHQlr78qmuqPF0PPt+cBnkpeGIrCZuSxgAssjReFMOCWC9Zk2z7WzqgpTITNuMmZZkrBZBAtLJqC3KZSYn+8jb7FI6fVBDrWWAF0BGk=;
	24:prv7IbT9KS3WdfsDdLSZTkaDomMd4UpB35vmldUPUqCOYI4cDLnFKEA1Ho2Tiokyr9k0Do1IF0gzjnssJvDl2Hx+PqKWtLIISptz+j+2sO0=;
	7:tLR0UPgaGNMGhrA123Mpx0bJj9AsoyB8QsTkhS3/KXf+8VyPVTxbIadOmzfq1bkOoot5aYHWc9xM9YboemYo9D/73KT2vi4PtDITvj4MPNPR2Pft9GPb6AyQwGZditerlMJ+GXrz+67RgBgpQAnu+sgjVWN+ro2obBOEXGYZgWn6V7pPHwkUVLxOD8C8tyfj9phwcSEyuDLv/S07f7KY+KTwXoWUgJz/7xy0B6+56b20CSqpWQai4eBAt6kU6tq1
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2018 02:26:38.4709 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc381db-92d0-4c0e-b54e-08d5639b1041
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB1344
Cc: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
Subject: [PATCH]] python-oauthlib_2.0.6.bb: Add python-oauthlib
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
X-List-Received-Date: Thu, 25 Jan 2018 04:00:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This patch adds python-oauthlib recipe.

Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayath=
ri@xilinx.com>
---
 .../python/python-oauthlib_2.0.6.bb                | 27 ++++++++++++++++++=
++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-oauthlib_2.0.6.bb

diff --git a/meta/recipes-devtools/python/python-oauthlib_2.0.6.bb b/meta/r=
ecipes-devtools/python/python-oauthlib_2.0.6.bb
new file mode 100644
index 0000000..0bcb7b8
--- /dev/null
+++ b/meta/recipes-devtools/python/python-oauthlib_2.0.6.bb
@@ -0,0 +1,27 @@
+SUMMARY =3D "A generic, spec-compliant, thorough implementation of the OAu=
th request-signing logic"
+HOMEPAGE =3D "https://github.com/idan/oauthlib"
+
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5ba9ce41463615e082609806255bce1=
b"
+
+SRC_URI =3D "https://pypi.python.org/packages/a5/8a/212e9b47fb54be109f3ff0=
684165bb38c51117f34e175c379fce5c7df754/oauthlib-${PV}.tar.gz"
+SRC_URI[md5sum] =3D "277a9a966cc8c72e492b4eeb41332445"
+SRC_URI[sha256sum] =3D "ce57b501e906ff4f614e71c36a3ab9eacbb96d35c24d1970d2=
539bbc3ec70ce1"
+
+S =3D "${WORKDIR}/oauthlib-${PV}"
+
+inherit setuptools
+
+# The following configs & dependencies are from setuptools extras_require.
+# These dependencies are optional, hence can be controlled via PACKAGECONF=
IG.
+# The upstream names may not correspond exactly to bitbake package names.
+#
+# Uncomment this line to enable all the optional features.
+#PACKAGECONFIG ?=3D "test signedtoken signals rsa"
+PACKAGECONFIG[test] =3D ",,,python-blinker python-cryptography python-nose=
 python-pyjwt"
+PACKAGECONFIG[signedtoken] =3D ",,,python-cryptography python-pyjwt"
+PACKAGECONFIG[signals] =3D ",,,python-blinker"
+PACKAGECONFIG[rsa] =3D ",,,python-cryptography"
+
+RDEPENDS_${PN} +=3D "python-core python-crypt python-datetime python-json =
python-lang python-logging python-math python-netclient python-re python-un=
ittest"
+
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

