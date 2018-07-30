Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 964 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 30 Jul 2018 21:54:12 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0075.outbound.protection.outlook.com [104.47.36.75])
	by mail.openembedded.org (Postfix) with ESMTP id 5E12D78D4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 21:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QhNtKOzW1XyE955PRiYERreujGyzjxOhX9SWAhO7oVw=;
	b=gMOkuKlrpzyY2eAtItV8IrnkGeCX5CjJyL4H5Cj8oFBtTh9DEPuJgATHWAYTem/R0bBzEWcJdaK7YU5MNBwWe3OFUptF/bYj1I1is10VrEYr15r1n4p/YjGhBY8qv+NCCXGkWSIHGtrUMXzw0VW6cvvJnBpj2lKxFCKWoCXgty4=
Received: from DM6PR02CA0008.namprd02.prod.outlook.com (2603:10b6:5:1c::21) by
	BYAPR02MB4453.namprd02.prod.outlook.com (2603:10b6:a03:57::26) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.995.19; Mon, 30 Jul 2018 21:22:21 +0000
Received: from BL2NAM02FT020.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by DM6PR02CA0008.outlook.office365.com
	(2603:10b6:5:1c::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.995.16 via
	Frontend Transport; Mon, 30 Jul 2018 21:22:20 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT020.mail.protection.outlook.com (10.152.77.162) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1038.3
	via Frontend Transport; Mon, 30 Jul 2018 21:22:19 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1fkFcQ-0007Ky-G6
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2018 14:22:18 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1fkFcL-00028t-C7
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2018 14:22:13 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1fkFcC-000274-7p; Mon, 30 Jul 2018 14:22:04 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Jul 2018 14:21:52 -0700
Message-ID: <1532985713-15283-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(396003)(39860400002)(376002)(136003)(2980300002)(438002)(189003)(199004)(426003)(6666003)(1857600001)(336012)(77096007)(186003)(26005)(6916009)(126002)(63266004)(47776003)(72206003)(478600001)(305945005)(36386004)(7696005)(486006)(51416003)(356003)(5660300001)(2351001)(2616005)(2906002)(14444005)(48376002)(50466002)(8676002)(36756003)(54906003)(106002)(316002)(16586007)(9786002)(106466001)(44832011)(4326008)(8936002)(50226002)(81166006)(81156014)(107886003)(476003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4453; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT020;
	1:manLuItFl1fmjpc3qpHMYUU/0JFPinO9wcSGUFmBMQWHzyuVlJ80JNK0zHERsiQGhI+NkOJO7jSuKxDwKWXGfQTZB0UJ2LDAYMGPuyVuZzzszVBnfKHHTkMl7TOn6uND
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e9e6e1a-b507-48db-d7ae-08d5f6628873
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600074)(711020)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060);
	SRVR:BYAPR02MB4453; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	3:zQOuzb/L5OyS0abV3kUCXrx890+lroRb9PwY7tpVIEcZDgUZDlfi4a3fbP8VEf5e+sFS02gPc8L3FlXXT2te22MM+v8SNDsWneB08w5FVCSd0GSvnnhjjCVLFFt1iEnYoJiSRmYwKsiizcYGA2ODDFIYPEFZWjsrblb6qrM3qSOPlvTieEQcmf20+ZAL2eGutJaXnnpMPzHaiQNnaaI/XislrKf6eO5ElOaJJPmPbNJwuB/yg5DpcxobFmFH4LY58AU0ytWCl4ywCSLlvxcfeH4I20Txg/p/bsrfztLzJVpLQ5ftN+QYCwv2O1F+SEmG4TunV2aMjCXCDBSE6bSxjcAiE8X9PnrRlz74LkIm5lU=;
	25:sLZCGlQxUFPZKYIS8bERe+J5SAledY03BlqMuIbrBovcWH4xTXvQa4BktQE6tS1Y0z+3mNITRDSS9Ygm6Dx68UEn1XgFE7lPza4F6iNkb38iwuZuYyg1SDEMTBrG10KFpwEe/ZIvyJ6nezn4dkskNpEBmK07mFN0LRRXKPkbRwIKDD0rTdNmE/hmRimSSTWbeDqhJ6lCvBy58MD7b19DhEU1TMiL1wembHLI9opcP5KUoaUnMvZytnOLZ3s1t8TloniedRm4f03CLxp6V9Di4qL6rvtrjrrQtdt/TEPEs6gO4e5hICqw++TX+quK7igkN9PGwbeRMEzC4vO84KVYvA==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4453:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	31:mA/7OBH7Fl9ZdOFyihWxGH2N4pX7WoMU9aVuCkRZhDf9+uuoxFsim3ie73LKhvTtOQbVHQ3bd1BRT6eSHGZNGgaGx51rM5Vg3+3edlNXKRJ0hWJqLOrg4l+ODztHkwlemzmAm+XYPF2OJeVwU5wYskZp4lq0WsFz8WoUIJf0UOp136WhOy+Xa9HJnIpXtIqRjx0Jql2g1K3MI8qRvSYkg44aaXYVQk2vbcvKXHJtyZo=;
	20:eROFpkFgu8K4q0zEmfWBxUSRYczzQVMjfc8OeZJGrFAzxzsFrX1/LmIn4QI70kMPOa8kKLr4NYoOVG5UdMagMCzKEsPG3NMBT06lvZtSfObIpoYioOeSXDxB6sROtYH8dQSqMBEb18tZzJokojd9bGsKEmMaKqZLs/UMEX8aZ/GoZdH+zjRt2sRpFwrss0+EZLZPz9GqHvinwkm4I19wDbnxo2zJhMZ86K9j2CY1vH6ZKHgeK95Yy6G5lgiLIw9SoWsv7L1oB+E6HFW/Ct4DZEKQBkVImxyskQRBxNPhVtW7gT4r+7ffQZGCGXPfHPCehFaQ6iN4Wsdwt2Nwf+XQ5kpP3buxBR06Sk0SekFpXMl9TFiKILNDy8p5Y1sAF3a2eIFRyMizduZsJhv3xQ6geVWzSzUERtEql/T6X+iATr1S95yePUDMZnMJK/7nWQoOWjdGLOHGuD4OHqIe2h1l7qn+4FShXzPPR2nClf1Uz0UK/IP0FofJ38j3+OHpLwnx
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB44532EE33D2DBFF0F59A3854AF2F0@BYAPR02MB4453.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231311)(944501410)(52105095)(10201501046)(3002001)(93006095)(93004095)(6055026)(149027)(150027)(6041310)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:BYAPR02MB4453; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4453; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	4:Vga76yG0jB+Ik0l70YOfLEZoOEFHRkx5W5WnTf5PNyt3Ci/ePYvKWyP4F16IefYGjXjoH/sqkVUiyUDhcW8r3RX0PjrbjaPW2W72rPoTSb7E/eypyaYmJGFfnkEyB8UX1uq+sxLPV9boAfFp3dbx0tRIbGthBIYbazEWtg+qkqQ4oGjNjO+5/eOfo1ZH3YqZ/w+W4givwLCwKZX62qoeoI2M9xSbPQz9yK3qjUyzRzbH3uSAKSo0dD28/7pVTPyPF8bb/ps6Kelace2jH2BdQJA3tEfsD8UKaXfesboT4zyXHf0mue7llxO0/fY4KsyY
X-Forefront-PRVS: 0749DC2CE6
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB4453;
	23:oQjvmvwnsy5CdHwb5TA89Ue6emdDzqWGup7uOhthZ?=
	=?us-ascii?Q?I6iIGaL3jRPZ2d5cNb72zIU5gYBV0ymc2z6RaJiPxoBKKXS6oxdGN/l0q7c/?=
	=?us-ascii?Q?B/8caHct7Ao6vxdIydFcWBhHoIwnOssHAekMFlorcv2gpqZAdr5/AHkhxrW4?=
	=?us-ascii?Q?oTnAcwEaTf1fmUS+WM9t/3sZ4epGBsIXaUGPhZC0vY3TMzB3cYT8AsrXDd9H?=
	=?us-ascii?Q?8O11UkB/9UBG792EukxtJiBQMmRQsU5iHqbNURnRYvcKGr95MH5xQ8kX2Eqe?=
	=?us-ascii?Q?3D6ZmTPMjrQTRVMY+8b7qdRrpEfEoMrO7/uVWcR4/Y/2ZfrabMoCRZq7h4oG?=
	=?us-ascii?Q?XxFpFi33/sombcbpf+jfBgCg+ECkkwX66vVRYNStaH6QOzMu1Xe7bQd0L9VW?=
	=?us-ascii?Q?89cZf61FyM83YbLCIY/6Z2RrHZ6mrqac+8370wgWW+7Zpe31pMj9Rzgms7W5?=
	=?us-ascii?Q?4RneVsaIbOfX9kk/kFUqwJdDB1b0cVorfeGG0IMukv5gockn6cuWhOFe+bvj?=
	=?us-ascii?Q?pDqu4kJe4QvtAhX/PlfxkdPodUaFrDBK5mf3hELfwMXI9NEtQykCxEXGfIkY?=
	=?us-ascii?Q?Yf0TAlAeivOtc4I7m2l37OViTlp5DgkfsQtVhEY8huq8IHVTHRBtGBzVzf3a?=
	=?us-ascii?Q?fYf+TXLES2jUCtzgbhi8x3e+faaNk0fY///RgKrlYveU9DA9rWPMBNNWeyHu?=
	=?us-ascii?Q?JTrqUENSdVt96F00bXvhFWWXxQIvppIS4Bwrheg4Ff8IId9axO3Ck7q+3Qmt?=
	=?us-ascii?Q?3xewAnMzMVFqczUWUNKerY1n6uF6SHxBvNaOckeL6pnsdc632e4F+KxFSjmZ?=
	=?us-ascii?Q?pO+Q0egWiwsU+WM8uS7i6+0Cc8Kd4EbvZnmlSS/LpFZigtUdz3HkOO2O64+y?=
	=?us-ascii?Q?0s0YTE6I51V77fZEn3l//OcaHlZCiSn2T7e0e9Nrqk2J5Z41DMoZ79StT1JZ?=
	=?us-ascii?Q?wTVJ2y0BEuyUYUi+HOjyqeT21V3jS/dhikhC+RWCzjDBAjfN8t2Id0yTjSpG?=
	=?us-ascii?Q?TNQItOMoFBaLZBb9j62ir8Ky7GBJYsAKYZtfVyLAZ/vyQX8qQRIa8ALyDfkh?=
	=?us-ascii?Q?jURPr89otnKCk5vKg/r65kF/1qIRZEGFNN88KEvcJ1zP7UsGlrfVijdp/rAT?=
	=?us-ascii?Q?FrHfN7zp5KDwPFWVJcQrdfjGu1/xKJn?=
X-Microsoft-Antispam-Message-Info: bgHjaLYTPXncZAMgvgoihmcTATP8ey7BNup5m5tb24C091zfeM9V4j8/1DUmcMP98BfNNMTKBkJVMr3HecEw502DXVp+a/NXFb/6gLkT+F731ECZL3qM4Q3K94OlLHNHtDsSlbYenarCb6u7hF3marRgb25Wkb7CzOA7lrqCXRyuYhoFwejWzbpulnYhFVKBABvO3ATP2paG0ptA/xz8uOCwUgomLtd9fcVpSurXJs0VstHU/ru3UM2bcxm8KEssaKLuKoQLFn5UHAEp0gbB2qyeF66Se/YL5G5VaYcFfjOnFWLGN8LhN87gesMED1MAEsjcQ9M2q68g4ws/PX4kmGHAqgNRgvCImXEDf504RmE=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	6:TpAvUwvhhOJrP+hw6P/TgPN4J2U1IINfHajW5EvIQoHpRvHS8pRlm75t+eGK2LghSy2IwnfSCmh3itvN9pAAcja2Le6WDoWlP3i+5JY7bqJn5QmzbwGaF+qmz4uIpHBmmgOpghnuSt5BKgnAR7N/2LV+/k27k9zqjCDsyOWLE/9XgDqvyhlF/gJS260Eazk5FFXvWUuKGu4i30cVE6bW5ox5kZXx2XKCnp1Fevh2e/3iNWhFhrXhRBuZ5wo6FSotNufb2lpKqsnK84+1cIkDKVasZea1AExg64x567eITYrbSZtylmWHer928SMiGg9MYnjOOoKMqVuJXPGfQNCF74HYWN9DLqJ/hb1fOgme3JnFkkkt9E1flURoImREUexev947yQxtwQZhUCkBP+xqVMKlcXilhG6L4SeE0/Ghf7hKAUaCohriQt6Yu1Jia1EFwaNNk22gkXOPsu2DnbVLnA==;
	5:mFPgS39gjQ//ZjhD3P8puB9UcMZNypCbtoxTn+ltrKLE/cU0rawb8kVuc+Xn6PMPXiIp5AXnGVfgouxCNUrPmo1R9OKkMG+UMeedCovcpQhMI9NiQL8CdPWIj563UyCTNiHNbVsqueW16aJt1FPSDIPfX+qe+TmCF9y7xH3BD1M=;
	7:msTcCTO8rn3lKJInXvorfjE3g/K0Crm1udlO2yUzksKRUqHY2Gjr3uo3llCvZ7eWoVKWnyuGZEVpBegAUv+howCicuQQOki5XBZ+EmifO9It45c0+PgOy3c8a5VwccMAPFd2B0gchsy7pne2HT9hfxmknPPVsTrJoYipxzyrx+v6nGJWk5g2WXBmbe+6WC/CIYs0XwI3vD1fDAdgSmwJrFpEn5th7M0wtr+BZxZ5bqovtX/ZOUcDCnbd+yGGS/g8
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2018 21:22:19.4314 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e9e6e1a-b507-48db-d7ae-08d5f6628873
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4453
Subject: [PATCH] devtool-source.bbclass: Support kernel fragments not in SRC_URI
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
X-List-Received-Date: Mon, 30 Jul 2018 21:54:12 -0000
Content-Type: text/plain

When using a recipe space kernel-meta, scc files are added through
SRC_URI, but they may include corresponding kernel fragments that are
not necessarily in SRC_URI.

For bitbake, this is not a problem because the kernel-yocto class adds
the path where the .scc file was found to includes which consequentially
makes the .cfg file available to the kernel build.

However, when using devtool, only files specified in SRC_URI are copied
to oe-local-files in devtool's workspace. So if the cfg file is not in
SRC_URI, it won't be copied, causing a kernel build failure when trying
to find it.

This fix parses local .scc files in SRC_URI, copies the corresponding .cfg
file to devtool's workdir, and also adds it to local_files so it is
available when doing a devtool build for the kernel.

[YOCTO #12858]

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/classes/devtool-source.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index 56882a4..c70fea2 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -90,11 +90,23 @@ python devtool_post_unpack() {
                         fname in files])
         return ret
 
+    is_kernel_yocto = bb.data.inherits_class('kernel-yocto', d)
     # Move local source files into separate subdir
     recipe_patches = [os.path.basename(patch) for patch in
                         oe.recipeutils.get_recipe_patches(d)]
     local_files = oe.recipeutils.get_recipe_local_files(d)
 
+    if is_kernel_yocto:
+      for key in local_files.copy():
+        if key.endswith('scc'):
+          sccfile = open(local_files[key], 'r')
+          for l in sccfile:
+            line = l.split()
+            if line and line[0] == 'kconf' and line[-1].endswith('.cfg'):
+              local_files[line[-1]] = os.path.join(os.path.dirname(local_files[key]), line[-1])
+              shutil.copy2(os.path.join(os.path.dirname(local_files[key]), line[-1]), workdir)
+          sccfile.close()
+
     # Ignore local files with subdir={BP}
     srcabspath = os.path.abspath(srcsubdir)
     local_files = [fname for fname in local_files if
-- 
2.7.4


