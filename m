Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 3569 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 24 May 2018 00:40:55 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0060.outbound.protection.outlook.com [104.47.41.60])
	by mail.openembedded.org (Postfix) with ESMTP id 474B560107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 00:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=WavTolPbXJqeEah0plWTJtx+JOjtlcQDkXstQTra0LQ=;
	b=lKM3fOAZN3bRaXJvJ4U+yZ79c0ikPreciAe2pb6IfrOUCLdZGOfmdaxmMFj6GHza85HOzh2jV+TtANpq6vn6+BscmVZMYUu1rU9UvN0RnyuWiM57U9KEMp/cjc9N0PaguHlXMo4/rHGs8D/P3GrI7rjpdMQyZfKn7lSz+YGdZRQ=
Received: from MWHPR0201CA0104.namprd02.prod.outlook.com
	(2603:10b6:301:75::45) by DM6PR02MB4490.namprd02.prod.outlook.com
	(2603:10b6:5:20::15) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.797.11;
	Wed, 23 May 2018 23:09:41 +0000
Received: from CY1NAM02FT004.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::205) by MWHPR0201CA0104.outlook.office365.com
	(2603:10b6:301:75::45) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.797.11 via
	Frontend Transport; Wed, 23 May 2018 23:09:41 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT004.mail.protection.outlook.com (10.152.74.112) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.797.11
	via Frontend Transport; Wed, 23 May 2018 23:09:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:39477
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fLct1-00005z-Vq; Wed, 23 May 2018 16:09:39 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fLcsw-00050g-So; Wed, 23 May 2018 16:09:34 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fLcst-0004zo-VW; Wed, 23 May 2018 16:09:31 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 May 2018 16:09:27 -0700
Message-ID: <03e75b05ee51e181bb1518af0f581c9399ab4e64.1527114300.git.alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527114300.git.alejandr@xilinx.com>
References: <cover.1527114300.git.alejandr@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39860400002)(376002)(39380400002)(346002)(2980300002)(438002)(189003)(199004)(50226002)(356003)(54906003)(36756003)(36386004)(5890100001)(8676002)(9786002)(106002)(316002)(76176011)(6916009)(47776003)(59450400001)(5660300001)(4326008)(186003)(305945005)(51416003)(7696005)(26005)(77096007)(6666003)(575784001)(2616005)(486006)(126002)(476003)(48376002)(50466002)(336012)(2351001)(446003)(11346002)(106466001)(2906002)(6306002)(63266004)(107886003)(81156014)(81166006)(118296001)(426003)(478600001)(8936002)(8746002)(107986001)(2004002)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4490; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT004;
	1:I4uKGSiPngg2pxesyIqEz8ZeahY6VYSTUDkwnfsZy2HsW/3vghhXXEFkdiOlHuQaLLJRjXNOPftBo5TtKZc//j6d6k+yT7+YFWmNqvrZfQ7DC6JZEQAzzawZk/z1Vj2d
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:DM6PR02MB4490; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4490;
	3:0nloGXSl7jFeGQ6HQlIwi08ODE3Mr/LOc5fe3Q1ZpajyEDoUUAxfO3LlzNMDUeB4cRYVAdfOa7gk3EJ3dtD7l1SjyO47WXLn+tu1O/IfuxzsZ7R/KohNu0z7/jSwr7VHqrSYzvB+nnM87kK/z6mxyPaXK4eGry7Ha/85GkWOypJNbyD3UQH3jYv8flF3Hq6G/6q5udSkb/oodGxVJ7a/UF2TbcRXfKmqnkm/MMBg6QR5Wb+TdbI5znawvHhFAr7pE/itxVm45bLIIMi57FZ7T3F90VbGb/tgESesrlzy7qDzBF1JONOSEHAgR4jHs5sYP8a+V3wXF7VDHh1cmN3h1Hj66zCUsccmE1+rRBV93Is=;
	25:8ZcuVmwcuWIu3GKMGWyHEXn/BCurtE63AwKlKA5L7XOOjT8mT7OMgWlAo3gqyGnMWgIaFKQK/FTk3BIK5LThrPU5P+q+8y3HYdg5GMgL0Ls1eQ9WW/GfDQCwYuhyRnIjtanJCCFwwakmL8x1hz7L74vEfewzPPyEG3cbtDdXCUv66TZFU9iaj8Vk1s1wOXbjLgVzOqSbNBg4BBA09zDdTJ5SrfN9WqhqjP2eq2PdWqi0G+0KYWfnqVB0rThc1FOOBqShytB4M/auogMbSdEI+MFpUf8krZQ4NEiBvJeD7ZLpegy6yG1nfHsvguWCytHOvCrJFIwTuj2ZzP1gvOb/vA==
X-MS-TrafficTypeDiagnostic: DM6PR02MB4490:
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4490;
	31:tI55CEM21mjTZB9Fv2HDeyRs1cIS/82wg3hWZuO4VbxkFPG7fIxg8lCnnPn3AFU/IOPNDP/q9WQiC6d5J8gBTnyyu6frBA0VcURzjjAJpjQjyKmvhnukZQ695Jq3T9DdGIi/nLlZBXaCge5YUE3R2n9XRIea/4CFvFHBPd7k30KsS2udaMBD4r9IO1G2vUiXvII5A3dNbhJrpte0dLL06wnyfHToo28GmKpG4s4h1l8=;
	20:Emg9UvwUvLdw9mHKYCrAG3twKKO6YFRNW2YQ39NZMkap6qXT9rLppLlWwVJwQpueE+6sewAGHuFym9Xab83hDgkPXLY19RiS1ELL7LOvntMoLPYutjtgV6mK7vcezFmQ3CH12zInntdM6P+O3V0L2r0RlhWqaHvZjPccpS6wuLNMlv9HPUh4WUl3bTsfk+q2XVXrpcO5cT18YXFxVmyuJS1gUa7dQeAt+XLZnBRoLPagM42maDH3h8zc5PfBfxjZLOAGg9GmNcwUttQQOj+sXGVQvtpXfwMyNJp8CNlOApN8sI5gvEmKJEllSwTJ5w3wTsvFlJewyBOY0uDY9bMAU9R9MaDyY/RIWoDGJoOBEW+z8jNxlN6EHgwOI9L3PShVKnrW8Zvy5/JFLPhEqBWlF2QYBZYElHBI78fOakhrNxrx503YtCV91Rso4Q7iv1X8TBMBuAHMsEhOIpqwrcEaCMtRf+O+gjRy0TqrDO9jW8sCB8bWHNbze8wLcVhg32OB
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB4490C335C1D5934167D7BABEAC6B0@DM6PR02MB4490.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(10201501046)(3231254)(944501410)(52105095)(3002001)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123558120)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:DM6PR02MB4490; BCL:0; PCL:0; RULEID:; SRVR:DM6PR02MB4490; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4490;
	4:V06aC0uNglqr2F/NP6ACxpUz09rXKlJo9bSNMH/27eL6HbJtOJKsjb4t7eDbSMBdsMo4AQKKnNngBRj6UU1eSrnRhEJSDszKNGkkpaEjdkvDexjrztTHwXbwsc2J6vJP+buOLpMog/MW606c+/n1Ynmb76HjqDsoXkH794TW1/q6DMY9qDWqH5SFyR5M7FYDzHo6JhucfX2k5pn2qyTEoPtgaQ16KejDM4hYhD2rrJBim6Shg+HuVhw5pkmsSngma8mH6VAp7pP8PGwaEYL+j/xkcU/Yp0WActrr1B30r/vP0FzXwGAxruDT0MrLAxV1
X-Forefront-PRVS: 06818431B9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM6PR02MB4490;
	23:br8MfazMYmNUTfQcHUMekwELgVajrVvoIur2/oB0x?=
	=?us-ascii?Q?Fg/50Q25ysXtTEGEDb8fGXXWxEEgYHK/a6Znw1TiXzPLSBPAAvoavPEUmDTY?=
	=?us-ascii?Q?PqVCWSqZfnM0QWZ3a71a53w6woMkDzIVX0ncr5Nd5cdPIy6XS7/Q1nMMNzoN?=
	=?us-ascii?Q?ZCHWIp0EIMxArA11Q1rq5XKFs6kQo+RBzojNy8n7DN6ngBFbAPYHsd1ooA4/?=
	=?us-ascii?Q?LP/W+4hVHVy/MwuhiwStpIKNkpuCvM7cU2whRkv+FVxu4k3hbFcSzgxTnno5?=
	=?us-ascii?Q?s7ShNTDHlH2JDSPiByZnfZ/6a0yJ6mvRgpoGI39S7tC1FPxSiVFvL4Mla6UJ?=
	=?us-ascii?Q?hwCRMJbRCqSkQj/QtpzkdyJKfVRhT6zxiEszKmtQ+g6eBj79Fb8taxWADu8T?=
	=?us-ascii?Q?O07SrzgnFDZG65fyk9Pxmw2Wa01Gqw5Z+QWTuHh1dB2XYD1BV3Y5r37X3vam?=
	=?us-ascii?Q?3Tr+D7j2DgAUy19m7fvSKSe0UHFYKFSD+mZISvQT/QgETzsSLFwAK16wJbMw?=
	=?us-ascii?Q?NXXaPKtj8B0YtOB80IgoosMSl6BIShK9d44Z8qrHtJm4q1IOt5lzACXM92lA?=
	=?us-ascii?Q?C+o7+4Er0Uxu+TeQf4CzCD+ue/r+HfgkLxVjla/seSHJYiyeLf6/oVL06qW0?=
	=?us-ascii?Q?J4Ok1upuY3t3qQjTf27cB51lZDybv7yIasa1Wl+8/mFduShQnZrxc7nNsnRd?=
	=?us-ascii?Q?IdPGoUzOuGb7vQohNLHQca269F1PpDj9rjljNg4O0f/lJg7mGzSuV9I1z1Rx?=
	=?us-ascii?Q?8AqbuJTsGBkA4Mcajci0+dMU1s7udrnhQpG1uCtWJPpM5cG1/TQhzfhUBDVD?=
	=?us-ascii?Q?tmA4sV2xjADpBn8yVrISS7mEb+ia0eXLGlY1q5wFP2BQNMJU+D5LgyyIFAtZ?=
	=?us-ascii?Q?0LxTd4p9EfRYPtAWkodmr8+0TioRKWBm6WpnTB1J/UGc4e81/g+Y/sM+G7n2?=
	=?us-ascii?Q?VL3RRY3LFTZQBq3so6u1ZL5YyvJ/QZm1xs7Kvaz+dHYFVTl9dnCbGYzeAxvp?=
	=?us-ascii?Q?/CiLB6/f+/Osf2jpkkmmeHilTgpISQnhQt9GNQCiJMEW3oTA0xS3ruULbKWQ?=
	=?us-ascii?Q?NMHhtxecAX7PshDoi557UCQNV+dezfsSCylLHRctLJ5JqTi0MWdF86WI19iF?=
	=?us-ascii?Q?4WPVryZGYcOnQqOdkThRSAj6GA+rFL/Xc799sQwwwrNkINBajIzIwwg8Avsw?=
	=?us-ascii?Q?GEkmb6UXDnycrWfvOGNGdcyYi7xjSZ3XX4h0mw8lJAR9f+O2Yhoo9Z85Ruph?=
	=?us-ascii?Q?4CaswkqzhxOrbjMlcTUmHZ6yyynf8CRfE2lP0JW/hi2rYY2tpGL6u6CD0swW?=
	=?us-ascii?B?QT09?=
X-Microsoft-Antispam-Message-Info: BF15QmxAS5Zdskn+n5krJUUqI03ipu3DSGo4WhUTOca3So+SBN2osMo7Fdbt7XdLI4XfzF3ugYHeQ8MkMRYKkJVXce7PCVwDfJ9Wi5iH5943lbPb9LtA6V25ECc1OfFtl2IHfM0zHKorl1+4ps5lwVTWGNGIuXXauLF/iggm5nzHRbURPu1EG0zG3MM2aTQS
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4490;
	6:vY4XQPC5vI0f7+yCUpFr4v8VpgqlX/6z9do/hIS16GZFXAQpdVBKD+UauZGgORCeKFfWYPO/Z8mDmRU5wLsHszxUnR3ewCucDm5aLl37PtkJMAojYXKjSHN74VGLC1ogWKkc1Xi1j7fmZ/6ynjnh2893udeyhVE75gUuEy+RJN7uIupalJOk5RFbvzDAHi6eycUUh6C18EQfgwDLJTBP6iBjtWGzcjoHhdJvudcv5+HXYLQejOef8yI/ev+8DV/4OcAwc8V32eOGBF2ieneiQUvgpKIzNv480k7YnDGB/G718fOgfG8YJEr4qJVEttETXcZodWym0reS6wGKbA5XUTP3ZEWavx1HhLyEOjgBky/LFOWSzOi0ZFHGZKtQ367TFnK6ExXXfuzysQvOFLvYiRO++dXNuKZUvujcI2iA9buuZTCQFBzDuZYZlezBjxW2kVLJ+uvUlpHkiJZPrNdDOw==;
	5:tKnyntNmGhwpAm/geebjwwCjohxWGqh9dnJ87Il8yIgj5vxTlV1K2N5XNApn7vq4NWbH0mnHoqmk2FkDIDYm8WB+gOJ+fkcWZMGpTc7/2jTbPNBXwzoJS6eoNCGNtev4kgD/gd3ZeeYKFWXYKxHMoYidYdjKUPkONfxuXGGo8tI=;
	24:kkNDKv1LI+913Dv+z36Qg+xRFzKRqbjlFBPn3nwFmQUAYs02EladAMYmJvz1evGr+2sb9N3RrIsAcxig1dDkISM0GQO3V6f1dlmA5yDJTrI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4490;
	7:5zDReLEKT+CkkwazS2S7G+HmJSo+PsvV2m1EmQskpA6hQiz8X+LFHCEApnXx4S0ieDVfhHGumTjjXhUvdUurnx6gV0XkZRGBMQur2gtWqt6woFWDwrCgfi88frnfuNWfQrGk4oTqHsOmwYzNDGjF5I+qzFLrDhMifl28Xeb8tLA7jpe2fpBDHkp8nXJhg6odPsg1ih4OOiXPZP53h2ZiSL164y55BOLwItNplF0I08jRiojxELwa9sUHHOQS1KLq
X-MS-Office365-Filtering-Correlation-Id: 31784a28-7af1-4ae1-416e-08d5c102435b
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2018 23:09:40.4129 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31784a28-7af1-4ae1-416e-08d5c102435b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4490
Subject: [PATCH 1/3] newlib: Adds newlib and libgloss recipes
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
X-List-Received-Date: Thu, 24 May 2018 00:40:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Newlib is a C library that is intended to be used on embedded systems.
It is a conglomeration of several library parts, all under free software
licenses that make them easily usable on embedded products.

Newlib provides a C library alternative that can run on baremetal, mainly
for resource constrained devices.

Libgloss is the BSP part of the C library, which can be easily modified
to port for new hardware platforms.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 .../newlib/libgloss/fix-rs6000-crt0.patch          | 41 +++++++++++++++
 .../libgloss/fix_makefile_include_arm_h.patch      | 30 +++++++++++
 meta/recipes-core/newlib/libgloss_3.0.0.bb         | 32 ++++++++++++
 meta/recipes-core/newlib/newlib.inc                | 58 ++++++++++++++++++=
++++
 meta/recipes-core/newlib/newlib_3.0.0.bb           | 16 ++++++
 meta/recipes-devtools/gcc/gcc-cross.inc            |  1 +
 6 files changed, 178 insertions(+)
 create mode 100644 meta/recipes-core/newlib/libgloss/fix-rs6000-crt0.patch
 create mode 100644 meta/recipes-core/newlib/libgloss/fix_makefile_include_=
arm_h.patch
 create mode 100644 meta/recipes-core/newlib/libgloss_3.0.0.bb
 create mode 100644 meta/recipes-core/newlib/newlib.inc
 create mode 100644 meta/recipes-core/newlib/newlib_3.0.0.bb

diff --git a/meta/recipes-core/newlib/libgloss/fix-rs6000-crt0.patch b/meta=
/recipes-core/newlib/libgloss/fix-rs6000-crt0.patch
new file mode 100644
index 0000000..c220fb8
--- /dev/null
+++ b/meta/recipes-core/newlib/libgloss/fix-rs6000-crt0.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Inappropriate  [OE-Specific]
+
+Make install tries to perform install for all variants, but some of them u=
se the same
+name for crt0 in specific, so performing all of them results in an error d=
uring
+do_install, we simply modify the name of the objects so the installation c=
an proceed
+and leave it to the user to select which object files to use.
+
+Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
+
+Index: newlib-3.0.0/libgloss/rs6000/Makefile.in
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- newlib-3.0.0.orig/libgloss/rs6000/Makefile.in
++++ newlib-3.0.0/libgloss/rs6000/Makefile.in
+@@ -358,7 +358,7 @@ install-sim:
+       set -e; for x in ${SIM_CRT0} ${SIM_BSP} ${SIM_SCRIPTS}; do ${INSTAL=
L_DATA} $$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
+
+ install-mvme:
+-      set -e; for x in ${MVME_CRT0} ${MVME_BSP} ${MVME_SCRIPTS}; do ${INS=
TALL_DATA} $$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
++      set -e; for x in ${MVME_CRT0} ${MVME_BSP} ${MVME_SCRIPTS}; do ${INS=
TALL_DATA} $$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/mvme-$$x; done
+
+ install-solaris:
+       set -e; for x in ${SOLARIS_CRT0} ${SOLARIS_BSP} ${SOLARIS_SCRIPTS};=
 do ${INSTALL_DATA} $$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
+@@ -367,15 +367,15 @@ install-linux:
+       set -e; for x in ${LINUX_CRT0} ${LINUX_BSP} ${LINUX_SCRIPTS}; do ${=
INSTALL_DATA} $$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
+
+ install-yellowknife:
+-      set -e; for x in ${YELLOWKNIFE_CRT0} ${YELLOWKNIFE_BSP}; do ${INSTA=
LL_DATA} $$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
++      set -e; for x in ${YELLOWKNIFE_CRT0} ${YELLOWKNIFE_BSP}; do ${INSTA=
LL_DATA} $$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/yellowknife-$$x; done
+       set -e; for x in ${YELLOWKNIFE_SCRIPTS}; do ${INSTALL_DATA} $(srcdi=
r)/$$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
+
+ install-ads:
+-      set -e; for x in ${ADS_CRT0} ${ADS_BSP}; do ${INSTALL_DATA} $$x $(D=
ESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
++      set -e; for x in ${ADS_CRT0} ${ADS_BSP}; do ${INSTALL_DATA} $$x $(D=
ESTDIR)${tooldir}/lib${MULTISUBDIR}/ads-$$x; done
+       set -e; for x in ${ADS_SCRIPTS}; do ${INSTALL_DATA} $(srcdir)/$$x $=
(DESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
+
+ install-mbx:
+-      set -e; for x in ${MBX_CRT0} ${MBX_BSP}; do ${INSTALL_DATA} $$x $(D=
ESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
++      set -e; for x in ${MBX_CRT0} ${MBX_BSP}; do ${INSTALL_DATA} $$x $(D=
ESTDIR)${tooldir}/lib${MULTISUBDIR}/mbx-$$x; done
+       set -e; for x in ${MBX_SCRIPTS} ${MBX_SPECS}; do ${INSTALL_DATA} $(=
srcdir)/$$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
+
+ install-xil:
diff --git a/meta/recipes-core/newlib/libgloss/fix_makefile_include_arm_h.p=
atch b/meta/recipes-core/newlib/libgloss/fix_makefile_include_arm_h.patch
new file mode 100644
index 0000000..7645be7
--- /dev/null
+++ b/meta/recipes-core/newlib/libgloss/fix_makefile_include_arm_h.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Inappropriate  [OE-Specific]
+
+When trying to build libgloss for an arm target, the build system
+complains about missing some include files:
+
+| fatal error: acle-compiat.h: No such file or directory
+|  #include "acle-compat.h"
+|           ^~~~~~~~~~~~~~~
+| compilation terminated.
+
+These include files come from the newlib source, but since we
+are building libgloss separately from newlib, libgloss is unaware
+of where they are, this patch fixes the INCLUDES so the build system
+can find such files.
+
+Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
+
+Index: newlib-3.0.0/libgloss/config/default.mh
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- newlib-3.0.0.orig/libgloss/config/default.mh
++++ newlib-3.0.0/libgloss/config/default.mh
+@@ -1,7 +1,7 @@
+ NEWLIB_CFLAGS =3D `if [ -d ${objroot}/newlib ]; then echo -I${objroot}/ne=
wlib/targ-include -I${srcroot}/newlib/libc/include; fi`
+ NEWLIB_LDFLAGS =3D `if [ -d ${objroot}/newlib ]; then echo -B${objroot}/n=
ewlib/ -L${objroot}/newlib/; fi`
+
+-INCLUDES =3D -I. -I$(srcdir)/..
++INCLUDES =3D -I. -I$(srcdir)/.. -I$(srcdir)/../newlib/libc/machine/arm
+ # Note that when building the library, ${MULTILIB} is not the way multili=
b
+ # options are passed; they're passed in $(CFLAGS).
+ CFLAGS_FOR_TARGET =3D -O2 -g ${MULTILIB} ${INCLUDES} ${NEWLIB_CFLAGS}
diff --git a/meta/recipes-core/newlib/libgloss_3.0.0.bb b/meta/recipes-core=
/newlib/libgloss_3.0.0.bb
new file mode 100644
index 0000000..664a922
--- /dev/null
+++ b/meta/recipes-core/newlib/libgloss_3.0.0.bb
@@ -0,0 +1,32 @@
+require newlib.inc
+
+DEPENDS +=3D "newlib"
+
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/libgloss:"
+
+SRC_URI_append_powerpc =3D " file://fix-rs6000-crt0.patch"
+SRC_URI_append_arm =3D " file://fix_makefile_include_arm_h.patch"
+
+do_configure() {
+       ${S}/libgloss/configure ${EXTRA_OECONF}
+}
+
+do_install_prepend() {
+       # install doesn't create this itself, avoid install error
+       install -d ${D}${prefix}/${TARGET_SYS}/lib
+}
+
+do_install_append() {
+       # Move libs to default directories so they can be picked up later
+       mv -v ${D}${prefix}/${TARGET_SYS}/lib ${D}${libdir}
+
+       # Remove original directory
+       rmdir ${D}${prefix}/${TARGET_SYS}
+}
+
+# Split packages correctly
+FILES_${PN} +=3D "${libdir}/*.ld ${libdir}/*.specs"
+FILES_${PN}-dev +=3D "${libdir}/cpu-init/*"
+
+INHIBIT_PACKAGE_STRIP =3D "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib=
/newlib.inc
new file mode 100644
index 0000000..c97c7c2
--- /dev/null
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -0,0 +1,58 @@
+SUMMARY =3D "Newlib is a C library intended for use on embedded systems"
+HOMEPAGE =3D "https://sourceware.org/newlib/"
+DESCRIPTION =3D "C library intended for use on embedded systems. It is a c=
onglomeration of several library parts, all under free software licenses th=
at make them easily usable on embedded products."
+SECTION =3D "libs"
+
+LICENSE =3D "GPLv2 & LGPLv3 & GPLv3 & LGPLv2"
+LIC_FILES_CHKSUM =3D " \
+               file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
+               file://COPYING3.LIB;md5=3D6a6a8e020838b23406c81b19c1d46df6 =
\
+               file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504 \
+               file://COPYING.LIBGLOSS;md5=3D73f5c98779aea7dba4a6c94a74ab0=
ae2 \
+               file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
+               file://COPYING.NEWLIB;md5=3D956a4b1487f7677cdcceeee8f05a21f=
0 \
+               file://newlib/libc/posix/COPYRIGHT;md5=3D103468ff1982be840f=
df4ee9f8b51bbf \
+               file://newlib/libc/sys/linux/linuxthreads/LICENSE;md5=3D736=
40207fbc79b198c7ffd4ad4d97aa0 \
+               "
+
+SRC_URI =3D "ftp://sourceware.org/pub/newlib/newlib-${PV}.tar.gz"
+SRC_URI[md5sum] =3D "81ec873108b8593c586f91ca65963952"
+SRC_URI[sha256sum] =3D "c8566335ee74e5fcaeb8595b4ebd0400c4b043d6acb3263ecb=
1314f8f5501332"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-initial"
+
+PATH_prepend =3D "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
+STAGINGCC =3D "gcc-cross-initial-${TARGET_ARCH}"
+STAGINGCC_class-nativesdk =3D "gcc-crosssdk-initial-${SDK_SYS}"
+
+S =3D "${WORKDIR}/newlib-${PV}"
+B =3D "${WORKDIR}/build"
+
+## disable stdlib
+TARGET_CC_ARCH_append =3D " -nostdlib"
+
+EXTRA_OECONF =3D " \
+                --build=3D${BUILD_SYS}  \
+                --target=3D${TARGET_SYS} \
+               --host=3D${HOST_SYS} \
+                --prefix=3D${prefix}  \
+                --exec-prefix=3D${exec_prefix} \
+                --bindir=3D${bindir} \
+                --libdir=3D${libdir} \
+                --includedir=3D${includedir} \
+               --enable-languages=3Dc \
+               --with-newlib \
+               --with-gnu-as \
+               --with-gnu-ld \
+               --disable-multilib \
+               "
+
+do_configure[cleandirs] =3D "${B}"
+
+do_install() {
+       oe_runmake install DESTDIR=3D'${D}'
+}
+
+COMPATIBLE_HOST_libc-musl_class-target =3D "null"
+COMPATIBLE_HOST_libc-glibc_class-target =3D "null"
diff --git a/meta/recipes-core/newlib/newlib_3.0.0.bb b/meta/recipes-core/n=
ewlib/newlib_3.0.0.bb
new file mode 100644
index 0000000..3380576
--- /dev/null
+++ b/meta/recipes-core/newlib/newlib_3.0.0.bb
@@ -0,0 +1,16 @@
+require newlib.inc
+
+PROVIDES +=3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc virtual/l=
ibiconv virtual/libintl"
+
+do_configure() {
+       ${S}/configure ${EXTRA_OECONF}
+}
+
+do_install_append() {
+       # Move include files and libs to default directories so they can be=
 picked up later
+       mv -v ${D}${prefix}/${TARGET_SYS}/lib ${D}${libdir}
+       mv -v ${D}${prefix}/${TARGET_SYS}/include ${D}${includedir}
+
+       # Remove original directory
+       rmdir ${D}${prefix}/${TARGET_SYS}
+}
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtool=
s/gcc/gcc-cross.inc
index 1e184a6..95f5968 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -35,6 +35,7 @@ EXTRA_OECONF +=3D "\
 DEPENDS_remove_libc-baremetal :=3D "virtual/${TARGET_PREFIX}libc-for-gcc"
 EXTRA_OECONF_append_libc-baremetal =3D " --without-headers"
 EXTRA_OECONF_remove_libc-baremetal =3D "--enable-threads=3Dposix"
+EXTRA_OECONF_remove_libc-newlib =3D "--enable-threads=3Dposix"

 EXTRA_OECONF_PATHS =3D "\
     --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/${BINV} \
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

