Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 9152 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 30 Jul 2018 23:54:52 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0085.outbound.protection.outlook.com [104.47.34.85])
	by mail.openembedded.org (Postfix) with ESMTP id 4544C60778
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 23:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Dd4sCD7XNYvUqWSZ8do6QHep8aJewmj8RKNZPz2NXY4=;
	b=0stuKOEM/gyapcTsWSkQHay2aBC3ovpy7UavRzQXibZ2FXNZRTKiQ0yiZ4Pn36ZLZ4mwLcgQHx8tUAZOeR4PrQ2iK+/cJYm/kL/yI5xvzQbLz0X9XVdObM6WDPLqEJUT6esQLMK1ps2iHLkHYCGYQFeQZFwX14oywCo1U2FFcjw=
Received: from BL0PR02CA0088.namprd02.prod.outlook.com (2603:10b6:208:51::29)
	by BL0PR02MB4322.namprd02.prod.outlook.com (2603:10b6:208:40::27)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.995.19;
	Mon, 30 Jul 2018 21:22:20 +0000
Received: from SN1NAM02FT022.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by BL0PR02CA0088.outlook.office365.com
	(2603:10b6:208:51::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.995.17 via
	Frontend Transport; Mon, 30 Jul 2018 21:22:20 +0000
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
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1038.3
	via Frontend Transport; Mon, 30 Jul 2018 21:22:19 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1fkFcQ-0007Kz-NP
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2018 14:22:18 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1fkFcL-00028t-E3
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2018 14:22:13 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1fkFcC-000274-9q; Mon, 30 Jul 2018 14:22:04 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Jul 2018 14:21:53 -0700
Message-ID: <1532985713-15283-2-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1532985713-15283-1-git-send-email-jaewon.lee@xilinx.com>
References: <1532985713-15283-1-git-send-email-jaewon.lee@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(346002)(396003)(376002)(2980300002)(438002)(189003)(199004)(186003)(446003)(8676002)(11346002)(81166006)(2906002)(50226002)(107886003)(5660300001)(81156014)(6916009)(4326008)(8936002)(6666003)(50466002)(48376002)(106466001)(478600001)(36756003)(72206003)(47776003)(9786002)(63266004)(1857600001)(356003)(2616005)(16586007)(2351001)(316002)(486006)(77096007)(26005)(106002)(305945005)(44832011)(76176011)(476003)(126002)(54906003)(36386004)(426003)(51416003)(7696005)(336012)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4322; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT022;
	1:i8TQsq0T5d1SVF8/k0qkuozny8Bn06EE+bmYC29Kc019KOXuGHknw1J5S2ipwreRHfAlYUCsJlI0bbdh5oPrIG6liL9WZgmAX8bTPK3YN2Z561P4yj5wRZvXwYgSbpt5
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15e88520-9697-4f4d-158c-08d5f6628871
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BL0PR02MB4322; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4322;
	3:P0Y7aXuETfqYSD8/rpHMI6c49VG6UuEfvVkXCl64Fbx3OKoIQgS4UFPD0Z1DzqbPLXASxFRW8jCdPXzcoaQj7dJtciVnJcYYBnyEAamw61cjB/rJP5JObthzaQS4hF8Y2mCwo11C/TXrV3hcEhSby0F0JGZxLrgmTrQCTM1ZW/pSwiL4xfNha0aJuMvjCvnCK4dZ1/WXNUAhBRMtEDERMGFB2CLiT02H56UH2P/8lCkQ3+APG5S67vY9QaRhegRYoqp2D6SM/hxYEoVnPZ3UCIokRV1L6ODExXmPm/BtPKdUBYxrDt4+zRIvNJwAvPGjnT3EoMzic1LvkSYhFvHGr8g5CHQF3fC/DpM20w3H00Q=;
	25:D5yRkUftcZ49gjfZpm7w0d9b3Q8JR7mLeBPcwKBKnkHbZHVmgBAvGxdiNQNU474Z6YxEjPp6ItgWq3gAZki3/VUhLJM/jcPzzzeQpCBMnuN+dbjBmse/qYB9eGt0u9jUkN0cLmyXtZbBzPS3KPG1LlHqaFvd1YbMmgPKCLHV0i7NtpTfvadd5IVoyDmD5400AexyI4+Umd0rWg8NGLCKA3JAjnIz+Fc3LwcnkFSQN5yWXEgtzaNrlvEtx961Nnfe8woxO/uNW2YFomvZBrOjHLNQEJz+wjtRzLbayAWBVLkM3I3yaJTISL3ciJCRA9fx/jwbuLkiZ37Pr2PYoPr/Qw==
X-MS-TrafficTypeDiagnostic: BL0PR02MB4322:
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4322;
	31:1EZbSC/VtQ5FkStOcmml+b1e9BlAGNl9qqcTDYe8xo1RwCtvqWaUPYOLQtoaMRk5AoxRF3HaeLXhjRgKVYmPDuCw9sN1BX7ND2jcSkRlL7zNJTZfEr5/ctDXFBUnTRoygHFzarFS+lAewUNHKX/RBC8WanpMSv8YTBN4Tvq2v0gDIjm8raTzRb/8Ow+qbif0J+CVe6JiATZ7TyE6tfLT4hPIESSruMfhsokCzdFHBqU=;
	20:o800Q0jbjxQ9VmuZWSzyORcvd0Fq56XUY42zsVxcLquyL6g6INxZgnnLTMD/HZ+c1AedjSBzDDIF9+o0iufsBd7te7nCri2U4VvHyLgmamfhU/XJrmJ06BtxvV2PCESZkQ178reuKcaE9Y00bO9rYkYDC4d82m+x3NSGpfYtfD2oa7C6Y7PucvaCdNvGfxi3FfMm23gRJAbPsZhWDuJfJl1CYvos4U8MXDMkT+TxuLZL3y2v1mIfsIXrHreRyulH6oFzXJDPcfwef4JCjivZlUvNFCinakfo49cJr/oA0/yx/9vvgsBA71fRLw/lbEZleCbf+1TJoQeiiIxAGCRXw5mIFcI+vSJ1K1nwv1FXSxf08jTAiKHt9qgOe4A86XoZuIGoRg+UEjTqJwkPiI0iMt4XHvqg7dRFDRyQsDPyospP2uKtYIPNf3f9wZY1L6wUyeLMnLktVxNmcgyo/UCZwbSzkB0ZvNj6aRTqAaaXHyzjP/7wX9jzDSz2flSL9u5i
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL0PR02MB4322A5FCCE40D3C7A621BA23AF2F0@BL0PR02MB4322.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231311)(944501410)(52105095)(10201501046)(3002001)(93006095)(93004095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:BL0PR02MB4322; BCL:0; PCL:0; RULEID:; SRVR:BL0PR02MB4322; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4322;
	4:GRTKaQj2SQOUt3KuqudQrdpaUZjrmVsO8/i3Z4bQSszUAtlUoigJD6UytOEp3mjxDMsjeUqARjvow9CBd7qgnbn7RzVUrZ4K07h2AbQAkZVAX2FcWo8CbNqJcQTyL7z7fXunc0V0sJUVMtFdDRXuJ9nXlBrTVdo9KHdCvkhCiJK6O56y0NRKJUEzcexRUqxXqk/pof+pNyVpP9KEzI2ebeb1aWDXDLGfhflcQaXT9C7Av0LaVm42keZvk3WBo0XBac5EBVOT81eo3dI2qhnNEcPobsyhnDC7mFBvLQIkCnU9MM6EWee5I2jz1TjrDtUG
X-Forefront-PRVS: 0749DC2CE6
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL0PR02MB4322;
	23:y6AtHZxa90Ys6j86eeSI0zAlvATlBs3a6Cp6rFZcZ?=
	=?us-ascii?Q?osQQucjVO1GmBWybN+CrNtcY8oTj2YqF/lfguU+LQ5fRJSlitPEYFGHEyt8J?=
	=?us-ascii?Q?94D+ItDTRRMbtAi5XJapn8IYSTs096xPSPlMQwHv49H09ZDXHaNMLPmU6Auk?=
	=?us-ascii?Q?QjFqiB0FlqkmU45TH+wcqJY/sj68lQ+N9jlULwE3nkhzmUpKidoachqePDwz?=
	=?us-ascii?Q?HmY7zcZ2svyKQMFnfOcIVEtQhnU8SQjNfQ8TuRXSSIETxMpwM8vvLJKHOzBk?=
	=?us-ascii?Q?goPAlyK8t2BnyE6wXR2SPeQ7xGiVhK/J9Q/KVaj/mbAoEt2NSDOxMwijbrX0?=
	=?us-ascii?Q?U9NU9sIaIoih3Djxjll22QEAqqje1BqFb7NA12yeCYKbiTYdKeiXg8Jb2Goc?=
	=?us-ascii?Q?7okV14ebsbeISwAkKs9EWYQxJUE8AsAAIuHy2oAKgWHp/vU7Qm8GeP3QZ8ig?=
	=?us-ascii?Q?tv6Ysh5XzFs9oe/86PS1Dk6lFc6T62CP8QS/ZOmqzzM5mRtN2lZZ2djouc+3?=
	=?us-ascii?Q?Rp7q7EP8x0bY6dfhuhynmMeWgOmuQG5D+g5UDOEzqGOGlPgYWqXC5mKN5yIm?=
	=?us-ascii?Q?L0koJNllhOLOZa3EM7he4UqK2UQ56uM1mR3e5sx9Fez1lT+9n2ZmcWc6Ea9A?=
	=?us-ascii?Q?dK/ZK5PSfdyFMdreGVXxHWLjD7rc2i+ycvx+VOuajJHxKN0Vaz8YM8j+YKTA?=
	=?us-ascii?Q?L+6WLXiwLdXMjBqnfNCQSKNuM8FfiN6CnE77HI92AqeQnA6xMFVx1UfEMFbO?=
	=?us-ascii?Q?4lVpXsppOUs946WJuwb/7iyCf+MFDaW/xnAKMRmAaMTW8zpOOQiNNwZi7o8X?=
	=?us-ascii?Q?KLZu18SsGtYDpGFl5J4txyZS/1Z6L7RqwgCPlPKfpBNlElLXBio2KoAvlrzA?=
	=?us-ascii?Q?yPUkPfQOJlyCN5nHdBFMlDuegr9PgaI32Z4QiL1j5k+QjHzH6rjFHMUrUozM?=
	=?us-ascii?Q?JLwk5aZCeQJC/I4J0cm90Fb/Wg8fKGk3biBdQYTStH7jXbM8Z7cT6c7oCEon?=
	=?us-ascii?Q?V6KnXCcTJ4MIyU7M4REVxJihLU72NcCGR+cS1+3QZ09u0t/oeOrbJBXSvhzN?=
	=?us-ascii?Q?Il+jRTHfuyEb2H3KbGf1AmzmRkfommYnQigyG//b8V//VH+9DXvxSGaxaaKF?=
	=?us-ascii?Q?8WtKShz8UH1JV/wb532owPez5NLcJlqHg/pdBOsfztk2M9vyogqUZHQcIpx1?=
	=?us-ascii?Q?tcLvvcbl8eG6rI=3D?=
X-Microsoft-Antispam-Message-Info: 3rdGvuTmVeOtyJyk4IBm9kWHbMD31SGtcuha1BLM6eiuqj3CIUUmLvrAIIdVh6esSgfdQy7bqdUp46AJkh5ZYbHbJTz8Ww2OzPb4ka9zbkzG0LrhibKk0EdwMtJJt7HJQPnKcX26BSFayG7a4CcoXy/a4q+uYSdWzyaduH0tpjdamL68YSR1YR5XlIMbVM//ulc9llNKVQU8CEqaaKnmIkQVx1/12zPH1j7143jGTi8CDTvNnw7v3k+di9NToEC9TPqtBzvBwdiHlAmOMViqHt/UEt2p1wxL8flkimLqszOzIJkinJzSzaXYz+M/xfFsNRlT0vvkHpgDjGtEjZNpVhJtuS2z7oHzE11s8kqt56Y=
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4322;
	6:ESUJDWFOlV7Bs3TzaDeGtuznIkxYLPvTzBg/orin6I8psNHra9QWJkCdnBW7j/a40U3oB570NNzNKtmcrCGsagc4k3uusk3CoFXl4+g57o+s/jmSsYnRpv+3XA3aBfVG7SKqZuM9Ojwr0Q4zgxPz+ZzJ/v+wMY588S1YA8fd+91z5kDqmZkZGjogll01vo0pSqHmTgPTAL4hqgML2YNZTGBCvFhwu8nd0kdeoXyfHjspkvkAJjUf9wkW+tEtd7hphlzkHECZpz+cfMk7/ko1hT1+uiTM1MxWNlLNjBkd5vW+m5ZS20Tuo7qgEO5DYySDSBR3Zv0vNR7L+lANvhyz4C+lj6rc0YlQL4W4tHqc/bL/X84nZoAbKSRk/aSeAWqEjftCKn3qwXSoBntLBvBX24yJHwZ8+PMcUSUcQC6/QKIuSL8wKTf0sPJKUln7J1d69T0xKruuKfZr1B5zjmofLg==;
	5:llDcpDpRkmAQBEe/oI+luGYIyk5yWgVDDHNyPAU8pTJChnBVNkfAPDtaFK2NBD7vEyzhhEv5ifIcceK9w9BhQ0tPFTrI+aWmfIWUVyU6DBK6VzL1ygO17uKZKOlIyB+qwyipAHOWfJX5DW8cyXKxiCVQNwp5DXdLPJd/xm/vUfc=;
	7:mPpp4kQkmXV429gnw6/y6bFyZa2+meSop9zqkfBHxcO4b4nLIsGkm+KB4aNFoOivVwtazN52nXptFzf0EoHAqdqvb08Iv3326meyOQGTshCmCtK7vbe8oZf8RZyZM449SWZ7RgSaXcLA1SwAGZip0W38ErK0FA1stMaaTxB7xakBstfLiApxFQ+nPzqwRxftBoR2COH9BZf7Wt0nnmmq/xOmy3BdtsmMfecn8EeR/3IImMxus67GuIbHaxo+SfEB
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2018 21:22:19.4758 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e88520-9697-4f4d-158c-08d5f6628871
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4322
Subject: [PATCH] kernel-yocto.bbclass: Adds oe-local-files path (devtool) to include directives
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
X-List-Received-Date: Mon, 30 Jul 2018 23:54:52 -0000
Content-Type: text/plain

The devtool-source class moves all local files specified in SRC_URI to
an oe-local-files directory. When using devtool and a recipe space kernel-meta,
devtool modify throws an error because the paths the kernel-yocto class
is looking for feature directories in, don't include the oe-local-files
directory which devtool is using.

This patch checks for feature directories in oe-local-files,
and if present, adds that path to include directives.

[YOCTO #12855]

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/classes/kernel-yocto.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 82d8074..077a1ab 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -140,6 +140,8 @@ do_kernel_metadata() {
 			includes="$includes -I${WORKDIR}/$f/kernel-meta"
 	        elif [ -d "${WORKDIR}/$f" ]; then
 			includes="$includes -I${WORKDIR}/$f"
+		elif [ -d "${WORKDIR}/../oe-local-files/$f" ]; then
+			includes="$includes -I${WORKDIR}/../oe-local-files/$f"
 		fi
 	done
 	for s in ${sccs} ${patches}; do
-- 
2.7.4


