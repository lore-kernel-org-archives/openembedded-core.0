Return-Path: <alejandr@xilinx.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0067.outbound.protection.outlook.com [104.47.42.67])
	by mail.openembedded.org (Postfix) with ESMTP id 39F5F74C3E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 22:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GP9I/EstYB4I7vx52Y0zYqqKJDSuKJLQf49I4XQKeYg=;
	b=ich5KEomEnA56ROV57/rIcw+freFjDb8j9UTdZC+NPcP0p1mgh//YnJrzQ9yhHxDuyPOLkIQlvAGlrjUyHkNMOhqzynM/ccHKP5iBFkX8tBIn190tBvM2YDQTI4xmUcI88gW1/+8a+1cCyPCX1qm3ZDXjvzgHYGAWD6OXSSWviY=
Received: from BL0PR02CA0030.namprd02.prod.outlook.com (2603:10b6:207:3c::43)
	by SN6PR02MB4144.namprd02.prod.outlook.com (2603:10b6:805:2e::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.797.11;
	Tue, 29 May 2018 22:38:55 +0000
Received: from BL2NAM02FT006.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::207) by BL0PR02CA0030.outlook.office365.com
	(2603:10b6:207:3c::43) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.797.11 via
	Frontend Transport; Tue, 29 May 2018 22:38:55 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; linuxfoundation.org;
	dkim=none (message not signed)
	header.d=none;linuxfoundation.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT006.mail.protection.outlook.com (10.152.76.239) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.820.8
	via Frontend Transport; Tue, 29 May 2018 22:38:54 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:43745
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fNnGY-0003ar-7B; Tue, 29 May 2018 15:38:54 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fNnGS-0002Rk-TR; Tue, 29 May 2018 15:38:48 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w4TMch21032034; Tue, 29 May 2018 15:38:43 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fNnGN-0002Qw-3n; Tue, 29 May 2018 15:38:43 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 May 2018 15:38:41 -0700
Message-ID: <bfee8b1cb069601b1e0c216a1221174bde2cefaa.1527633402.git.alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527633402.git.alejandr@xilinx.com>
References: <cover.1527633402.git.alejandr@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(376002)(346002)(39860400002)(39380400002)(2980300002)(438002)(189003)(199004)(486006)(8676002)(8746002)(118296001)(356003)(8936002)(36756003)(2906002)(106466001)(316002)(36386004)(81166006)(63266004)(81156014)(5890100001)(4326008)(305945005)(50226002)(54906003)(5660300001)(336012)(59450400001)(478600001)(6916009)(48376002)(107886003)(186003)(47776003)(50466002)(77096007)(476003)(126002)(51416003)(76176011)(106002)(2351001)(26005)(2616005)(426003)(11346002)(446003)(7696005)(9786002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4144; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT006;
	1:jJ5KC/92/Al8XXMExlv9+AyS5HmT6LQBoXrLIh7vAlRWmiJtGX75PSoRKcHnOYNyY44ian8HfOA0Ip+jBCVVEdna27Ft3H+vOP8KlOBNHjudVsmP/MdnBZSkAeyPKt+d
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:SN6PR02MB4144; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4144;
	3:ZFJyTbpxFOvx4aWzU0QIB0QssmnWPqBmQwjbrxV7FGgg9ZX8RE4FKzlGKgcDkj/AAQuBhV47CLGjJ6SvBRnbI5v6gDuRwUZX2L0vAJ1WsiGDgURrM+Z64YLacfrX0e4IG5L+BxjoJMc6ZBu2XUU4oZUGnqZM1egqXDz9yN2TLNekPdqZhFhtOQBJmtmuWMryubbSTH+lJpHISnMutRPma7m6sHY6EkviSPLUrMpE9f/zMO0DBKNbDz07JlQUfTSBDqgoGy/cKrJAuCRmEPqGPhnZlvDGTdcQxo42b//zNOLu01EHaL+pdB9gfwrAcbp2+CZ1ei63vJCLtZ6zL8FukRV2Rseejy0XpBf8HGFn5Zs=;
	25:CgTxkZMUyU9LbtG32fu1Ok54qEBI31w9/Vn1jJ+1IKssge9qf3XIcrJz8jqTQGYtKgECe6f2OUv86vgUCOTp9EpcAMRcHGgMPfpCj/BZeNt6Qlrxd+Ivu/6jeATjPiXAwLMqroUGg/pzXu7/NbmdGoAeBL18dCTHPy9y8MHLATO7t2Yg7dLrjDtcn0SoVbFG1mbf4qmfCXkcypPR6oo8fkaExj0A/tIs0jibEu5XnAHUfCcxGu3X6QGJ9d4nm/874WHviSWI3CqbFYzLMzOQ43n1zL9v01en6+DoeGsHkFuZOCmVFe3gPKuZSuPGq46IDnl7jE7h4DeSTls6p4L14A==
X-MS-TrafficTypeDiagnostic: SN6PR02MB4144:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4144;
	31:Q33Y1rx8UmEs0zCln7uinAKi1m9dDl16ybW+IhT9CgplqT5+OXcWcYA099eXn18qIePzvMGqV0bkoChi+44n8baxheVYgOQVrE2TNXh/dierFgwqp9syivH3hsKQHAVwBHyEiTp0sadyQ4+H4z2WU76U5GW4KxcgN4DRDSi9JMHn9i4e2VtNHYc7ItbijtuccSe5nTljH9BNQxvSCGc0gE/PSfAzYrCZEv4JvmyxtCs=;
	20:893WeG/A+eLawyGmvmuwlJAIGX1BNG3TrFEUNrvkB0HL0Vq/Ej63FsVu9EQBXdZ2zPfzfTrME5T+Fd6bvu3kuNczHk19DgWMhofqTDVTr8nLkdzYRpkLNH2MyCDe1+MlNhCU3+eiey4C0wePK4eErNve1RDojtEqtM7O106UhPpY1Vc1gfrHVYJchLvAOBY2EDI5BiBZaX+E6eNvkssAPhVJ92BgQu5WzNxWGO+I+YiNB/cGuGmuvNzgvmSEV+rHBF30kFSJnwjQXXz2uLjEcQKDUDvXljm/qnC6j5e0Y7twOdF+qY/6Aa0KH4OlRsGLtMJ9dDEG5MVq7SmT9KlFWkUes/c4IbJwyYD2nXocK+cxLtH3dp3T22f3gXqojJVpI8OJb8fCvTW7nK25TEzCVLOoBUQ8oqYHS6mGv7JJbqkRH2s9X4ypTh8h3oySUyNBbBX3Z9ssINvQxKcfmhx4AaLf6/x8cIhAzfQbvEnWLi7l85wiHuV6Kw/RtIe1x092
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB4144908ECED9277C750173FEAC6D0@SN6PR02MB4144.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(278428928389397)(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231254)(944501410)(52105095)(3002001)(93006095)(93004095)(6055026)(149027)(150027)(6041310)(20161123564045)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:SN6PR02MB4144; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB4144; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4144;
	4:tyJDmGSwsO5ZXzKJ4sDewn49cHd84lh0KglKCv1tail5nb8VRPCIr6cn6t79Kr04uO713niuzSQ1sPlJp1j365dCF8bfEXA42R8epGbwhxgzsFVLAW2znC3qv5ese9rYMibXDThZ4wbEbKLHT4ZvnaMm5+vUzmpaszaiSNHPW0RgQbKexQ2RrTbwlcIr0hcECkm4gQUSCE8HT1q8rVuGxa32X78vbdoDtcP3Z/N9KW4aP72OaGm2gkLB8UYomGAFdehQ+bsCbgZ+5eLc7uAlZ1kSucFB2OZDlNheEK/EEn7VjPnPY37mYk54euRf+zjlevn7xRbbRWwZvWLE3bIEAhLnf17Q1zj+F/piuiRlU30=
X-Forefront-PRVS: 0687389FB0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR02MB4144;
	23:e4u0EpPjgUNQlJFw5jExwTVZCc+UPYWPhjv+2Yect?=
	=?us-ascii?Q?BdnBtLZgSbkAIjSljW6PSCBEh4qwnEBoT1teTWAO8Vhv/dw9H8rejrwNRhTx?=
	=?us-ascii?Q?utiXHKVEL0Wmi3gjBSETwLe6WLWRbcVo4x2lcSgfBuRSQF0NIhWOBtIyNFDQ?=
	=?us-ascii?Q?zI6N6E+w4aCyMRzsVxGsZBpQ95GUNatNU8LbL7ijfmo1MFTlWtiwJNxliHek?=
	=?us-ascii?Q?0GmyOycOcHzDYugf5t8gg47YEu0rdwl8cL0BsnnxNGs0rAFJIwpl9A7Mvici?=
	=?us-ascii?Q?bQlSV+bE33Ff0/cLVJgo0kW9TrYRJgJ3wvkEn/iZDWYaH8/eHxuPiVDs5W7m?=
	=?us-ascii?Q?Ow1INCFgq6tyCvrRlV2Nf1we2ci29QtDpuBmKdXzIorRTQ8M05ofhldYJfMh?=
	=?us-ascii?Q?2HAa13wLHVOYK+PPqMhY4usb0XhoX4LxijA9Pexlkb1Qi5br5C6CRghMakXs?=
	=?us-ascii?Q?9r3hCh2Tb9uoDZFFnSgGSIpiOr6N33Zkk0hiLzM80dh47p3DZgUdDzlB3hAW?=
	=?us-ascii?Q?uUU1IK0/5o9rR7E/KZgytMQF7L/QpzXtenU4bbdTLblstjSK4324mCTZjjhj?=
	=?us-ascii?Q?XhlYb+qcJMtVtb9WMAmsBG3SYSYDHR3mdyxdk82kSgQ3IhVm+Z+cQoT3hJpx?=
	=?us-ascii?Q?wq6nHOx1uHxpujVDWtmWAIYidXXzSoV8H9Ev1oW7//+uoI0+QS+VsjA8O6Lc?=
	=?us-ascii?Q?7Kd12GapE75dFQf6zKyL+OZGY1ggwIN9O3t17Ieh+NTwpoACWhTGAGjIzNwl?=
	=?us-ascii?Q?Z8Z8OhBe2pL5P3sGK82UPIvd4UNMIoGG9GaE1r8M+eP8t6sdbI9Kx1BHd2SL?=
	=?us-ascii?Q?fAaFb138O22y5hAa4OdaDQBVgIaX4dFEo7zFDzgG1/DNZLZZzCqyiGqyJXWX?=
	=?us-ascii?Q?HtjxxTE5Wnxy3pDp+jQEQWA6VsmMRWAXOuC5B7WrPayxOZaPUtjP+0M0Zm5a?=
	=?us-ascii?Q?o4hvt8pOVFePtnun+xN/DI7OBmf6QIW8oE209NaJDkDNXzDNT9wCwBHNg24l?=
	=?us-ascii?Q?bjreKfPEP8Brjfq6MgBQQbLLIWKtAULBobD83NPmotNuf8IXKLBSPOE0lbYP?=
	=?us-ascii?Q?sF/R3cC5W3lqGXw867vMySlANlWnayvybRkH3dQMr0KYycpD38WJ7eWOsCJC?=
	=?us-ascii?Q?N7XHdnY/9djliw03F9TB18s5URLbrCmchF6xGjNkSJtSgDmM7xu5fTxZUQqu?=
	=?us-ascii?Q?y7q0/CWfrVUhptiO4EyBf14LM1RLlDFdiHLUkurtZtmDQ/k+97LHr3KSA=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: C/lkQ6D5S9mXIsCx+ncM3lmrZDIUN3JLMilCRa9TGwfL8dKU7TO/oynzrzwcsHnVdc5KOrxsOv7V84nschtxbl9QFmmagqqsDzl7hrppYZx0UBgrImFRiSeJVk1upXQsV0mmD175A7/YyYTMZmm1+vvu9v9WsAyeZw2KcVRR4mylZg5CpKECrHT4dEeuURlT
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4144;
	6:8lURm1HYCS5ek1bLP1B3fIPvHHle7Tl1mEbf0hkY6+XXaX7OGJRaVMBQui5Py83/IuRB4ak3srWjl1dgbGuUdLeiGWLY8KfJWzd/kfJG0UnrFmFrAgN9Jr4SBySZBh1jDCEn/vK9wwQsv0+D+W70dyCkZ4Cbvq/RVgGucUr7254zBKgBghlvRAFUwnrOi2vr8Uo46XfBTZIxsANPPZ1GoLLBZWEgYlIs1omxVudblsXSHsiJpPSmUK4OFTA/rY5qrbzr4aMOafjt0edfroNtGyv0WKYDV1zpP5DnSI/TADbuwWXLAxNOcwE08NekLarc6Luui+YYIoRpBwZPbVqrri029hZPc5IJo4ySUSPTrucw2UWJz0Q5MwaVtN0WJaNr+4b4MWRBPOhSAHGF4AAPfm6qNd6t4/8ijOoKF12txhpTHlxJVEUCjAyT0vXbPT9dBqEnyBXtcVAqtkBXbdqAEQ==;
	5:q0mYcVSqkqP3GWh5pHFKODh+bhncJLcv9dKa29uVVai6mO5tF6EO4Vr5ywTIYfgXi+HmwSWEblZxZQWcorMq9RpICZCr0SWJhep7I7rqL+BCTOFeL6mywOfAmIpndVnLJ95THY7sDS094T0dQLQE9nTRoKrXRregwLmo29HTAWc=;
	24:B7Jt5NlGI2cnVPUsmw9TsREtyshKnq5c7vk0hCgkpasmla6Oj+dXmyx/sGAquh0GPeDOZNileQ+DWIhMQxtEx2KLHbfl0D8aLOGYUDYIjqs=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4144;
	7:tYm1qNY/aW4jMPCKwmDf2hBaBkjI7VJbSH9dQX2cTY2cf6Pgenm46OFtQfW6NqXQe2jtqvKYfOxasAHqdtXkc/S35WWOQA/rKZeEiG6yosyjrrstzfkPavA7enpNd2Ym8rBr+gcF+HP4aVhJppCvzm1+1WhaqnggvoCLCDrBz0gIr9bjodUZkvPDVH7W2+sVN+VnwwaW2OTfL/TfMih5l2YOhez7lqWK90uOl0hWaLRqUXzdak1nEufuy1qDuj2v
X-MS-Office365-Filtering-Correlation-Id: 6af69166-cf31-4d01-5b78-08d5c5b4f5dc
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2018 22:38:54.9937 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af69166-cf31-4d01-5b78-08d5c5b4f5dc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4144
Subject: [PATCH v2 3/3] tclibc-newlib: Adds a new TCLIBC variant to build with newlib as C library
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
X-List-Received-Date: Tue, 29 May 2018 22:38:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This patch adds the posibility to build using TCLIBC=3Dnewlib.

It allows users to build baremetal applications with the use of a
C library.

Newlib is a lightweight C library meant to be used on embedded systems,
it is meant to be easily portable for new platforms and to provide
basic functionality on them, by design, it provides stubs for some of
these core functions declared as weak, so they can be built correctly
and then linked against some other library which provides specifics
about the platform being used if need be, libgloss takes care of these
in some cases, but it can also be extended, this patch also allows the
user to easily add other libraries to it by adding them to
NEWLIB_EXTENDED for this specific reason.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/classes/cross-canadian.bbclass         |  2 +-
 meta/conf/distro/include/tclibc-newlib.inc  | 44 +++++++++++++++++++++++++=
++++
 meta/recipes-core/newlib/newlib_3.0.0.bb    |  3 ++
 meta/recipes-devtools/gcc/libgcc-common.inc |  5 ++++
 4 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/conf/distro/include/tclibc-newlib.inc

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canad=
ian.bbclass
index ee8aa61..acde331 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -30,7 +30,7 @@ python () {
     if d.getVar("MODIFYTOS") !=3D "1":
         return

-    if d.getVar("TCLIBC") =3D=3D "baremetal":
+    if d.getVar("TCLIBC") in [ 'baremetal', 'newlib' ]:
         return

     tos =3D d.getVar("TARGET_OS")
diff --git a/meta/conf/distro/include/tclibc-newlib.inc b/meta/conf/distro/=
include/tclibc-newlib.inc
new file mode 100644
index 0000000..dc631d8
--- /dev/null
+++ b/meta/conf/distro/include/tclibc-newlib.inc
@@ -0,0 +1,44 @@
+#
+# Newlib configuration
+#
+
+LIBCEXTENSION =3D "-newlib"
+LIBCOVERRIDE =3D ":libc-newlib"
+
+PREFERRED_PROVIDER_virtual/libc ?=3D "newlib"
+PREFERRED_PROVIDER_virtual/libiconv ?=3D "newlib"
+PREFERRED_PROVIDER_virtual/libintl ?=3D "newlib"
+PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-glibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-glibc"
+
+DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "ldconfig"
+
+#USE_NLS ?=3D "no"
+
+IMAGE_LINGUAS =3D ""
+
+LIBC_DEPENDENCIES =3D "\
+    newlib-dbg \
+    newlib-dev \
+    libgloss \
+    libgloss-dev \
+    libgloss-dbg \
+    libgcc-dev \
+    libgcc-dbg \
+    "
+
+# compilerlibs defaults to gcc-runtime, but we get runtime from libgloss
+# we set ASSUME_PROVIDED because we cant set PREFERRED_PROVIDER
+# for compilerlibs since its overridden by tcmode-default
+ASSUME_PROVIDED +=3D "virtual/${TARGET_PREFIX}compilerlibs virtual/crypt"
+
+# Its useful to be able to extend newlib, but we dont provide a native var=
iant of libgloss
+NEWLIB_EXTENDED ?=3D  "libgloss libgcc"
+BASE_DEFAULT_DEPS_append_class-target =3D " ${NEWLIB_EXTENDED}"
+
+TARGET_OS =3D "elf"
+TARGET_OS_arm =3D "eabi"
+
+TOOLCHAIN_HOST_TASK ?=3D "packagegroup-cross-canadian-${MACHINE}"
+TOOLCHAIN_TARGET_TASK ?=3D "${LIBC_DEPENDENCIES}"
+TOOLCHAIN_NEED_CONFIGSITE_CACHE_remove =3D "zlib ncurses"
diff --git a/meta/recipes-core/newlib/newlib_3.0.0.bb b/meta/recipes-core/n=
ewlib/newlib_3.0.0.bb
index 3380576..09238fe 100644
--- a/meta/recipes-core/newlib/newlib_3.0.0.bb
+++ b/meta/recipes-core/newlib/newlib_3.0.0.bb
@@ -14,3 +14,6 @@ do_install_append() {
        # Remove original directory
        rmdir ${D}${prefix}/${TARGET_SYS}
 }
+
+# No rpm package is actually created but -dev depends on it, avoid dnf err=
or
+RDEPENDS_${PN}-dev_libc-newlib =3D ""
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-dev=
tools/gcc/libgcc-common.inc
index 848a476..d959566 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -47,8 +47,13 @@ do_install () {
 do_install_append_libc-baremetal () {
        rmdir ${D}${base_libdir}
 }
+do_install_append_libc-newlib () {
+       rmdir ${D}${base_libdir}
+}

+# No rpm package is actually created but -dev depends on it, avoid dnf err=
or
 RDEPENDS_${PN}-dev_libc-baremetal =3D ""
+RDEPENDS_${PN}-dev_libc-newlib =3D ""

 BBCLASSEXTEND =3D "nativesdk"

--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

