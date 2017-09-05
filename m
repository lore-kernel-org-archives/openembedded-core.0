Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 12762 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Sep 2017 12:29:28 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0124.outbound.protection.outlook.com [104.47.40.124])
	by mail.openembedded.org (Postfix) with ESMTP id E2EC778038
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 12:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Ynb4GHfVSNCAHETxOx9k45cV8XTLZnXYt4M7ztr74X0=;
	b=SSSX1hThsHyvhSyv52pKRf9qqHNmr1LSTx0raw31VRQVOK1Q3A0nLUBMGMyIwMp7yApEZk4x2VZ3V0LCZDxeiejA0fKITI6YirSyMUpCWAldxpbtzPyWWN9VfkouK8sBtXsob9m7Ez3VSrNqgIxqOnbtDnCPZMZEqIbi9U/h9H4=
Received: from BN3PR03CA0069.namprd03.prod.outlook.com (10.167.1.157) by
	BLUPR03MB1459.namprd03.prod.outlook.com (10.163.81.156) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.13.10; Tue, 5 Sep 2017 08:56:47 +0000
Received: from BL2FFO11FD018.protection.gbl (2a01:111:f400:7c09::144) by
	BN3PR03CA0069.outlook.office365.com (2a01:111:e400:7a4d::29) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.13.10 via
	Frontend Transport; Tue, 5 Sep 2017 08:56:47 +0000
Authentication-Results: spf=neutral (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Neutral (protection.outlook.com: 192.88.168.50 is neither
	permitted nor denied by domain of freescale.com)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD018.mail.protection.outlook.com (10.173.161.36) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1385.11
	via Frontend Transport; Tue, 5 Sep 2017 08:56:47 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v858uibH019103; Tue, 5 Sep 2017 01:56:45 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Sep 2017 16:56:39 +0800
Message-ID: <1504601799-14566-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39860400002)(2980300002)(189002)(199003)(53936002)(48376002)(50466002)(47776003)(5003940100001)(110136004)(6666003)(68736007)(77096006)(97736004)(42882006)(54906002)(5660300001)(6916009)(305945005)(50986999)(50226002)(189998001)(8656003)(36756003)(2351001)(105606002)(106466001)(626005)(8676002)(4326008)(8936002)(356003)(2906002)(81156014)(81166006)(498600001)(104016004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR03MB1459;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Neutral;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD018;
	1:yvK0qEGADPVZu1GFD8kny7+oN2RPx3mydLyr5R1CH4nIYRYsNfcDkPk+NXtzC5wAhXDhz7aBybkO0nf11zFTqluBobM2w9UfUfjYvHHP3yvsrCWrYLioUciZ0uXS7wrl
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6d3b865-2bad-4305-4ac4-08d4f43c0a3f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BLUPR03MB1459; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB1459;
	3:3ZkS6kFgaaJqlqqGBVirQpEx+j/2UOP1qp+Q6KVxFVY9Rn8XeBSbf1mJhTYwDefYjXbD+pAmlBILt3ApVd2FBHOeC1Ot/J5kMQqZCD007XsfP5yXpPxArbaPtMeqml/MHtfwuT35TE4myfeKRoATSlTRwYIKcAeUeAT8k8i+4jiAzJS7NJt7RJUov0dz9p260cYK6ln3zZYiPEbM2yVrrxdh/gTwgadHxWpGRdf8JYSLytxMSws/OPtRRh6JorzjMy0Azgcs+T92UgRw9zRcuHSIqAHeUiNjHiAIyHuPQ48MgAPiPeCIRD+eYmARCyXf2I4widXjs6gCSwzfmhfl0pq0FAD2B0lMQAVvFhNclao=;
	25:5+zAeS8IVcTOkHPCBLzlYpWgB80OKKyGugEZMHIKdFGgmPGMkGuC0DipC+gCsznKPHZp0y8xC/S4x8DLpFhfCsIV+X/3QbHo5Ii13mTeUzR5T+0v8701vOwiNFr4QwGljlP3Zn8dD/9aI9FsVPMfKXQaFK7yVCpkxJvnD5jXhuTKYWuc4wkofpa7HpyGgHgKhoI2arGiObxNGcKcMRbgkofVzvK7swupigQEEz9zYbs+kx0AlyUkFWM6ACmFUI4ClRAcweQRF8ylhw7LxsjoNi5bEvFZKEUsKTi4008GvGkAR0nVPG1ow8ThYgkIB/VGfFTmA77JXdo8FfFmZeieCw==
X-MS-TrafficTypeDiagnostic: BLUPR03MB1459:
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB1459;
	31:hFFx4VS0f64l4tevelgVPiUDQzft12UYjlxR3sjuzjnqxU0MoLV8dekDhlCTIgP26UAUqPPXDMgYtJv1duPHrVKrAW+C4hBus1/4+M0P+Q51zg0RbyYlIkqgo1MqgTh1QSnsTQtEF4Kb7bMwAa6ExYRFM8Zd7FU6hjohmhY17GVI2zqCStwazRiaSUxaYz79vk+laT+HPKuz6ZPUqbvN2RFKOg48AV7DDMBJ2/qQMkU=;
	20:yH3mi3MoVBV0fERs1fQvumESKcqZuz67iZfCDmfkyquMrXNmyVEsrJd2ADPTam9lk7lTQ1vxoJrIUH8WtumpvoP9aQayzi/VTTDC4Wje5IpLmeER74fquxwMFJSPsyBK6QY2wGGzDRQETUFWKwYiuGD/hLeCZq/TyiwMxcPAix28jadoh8AUHqF1CU1vr4COta/8weqNPVG+NrbraoxHTwqci61q8v8x/GpSmhtZGkc7KRR0tRLeY6i9NcrFs7aZd5UaAlkG8Lem4blqbwTPFPxirXNGtYDSQwLd9fZmTITee3aZVAdhTnyWD9vLiE6WxP0jaCStu2Ygk46f7tlB4CnB5cFcfPL7n9kVQaYtAqFz/aqmMDwFI4A3EKsZB8pA1TY4toSGErY7zNfyX3+aAlVPTBXAk/UAZX0FewU8xBw812vqNWZ1WCBuD21rGD/AfA7TY8LnUynDOVMJ7Xe2IOmmfn7ETyqAPUm0xKf1FVatfRLwSnTUOGt4EBH9k/n/epSssK+aV0VG8ifVXOEMkUn7PjsElUhKaC07FAkaSVDEMQy6o2+0rgHzbsTnL/qSy/kYkGkQuyq60iRPCpkkRoxP5JKSqrBArS5NLArxXc0=
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Microsoft-Antispam-PRVS: <BLUPR03MB145933359D35F90CE9DBE4FE84960@BLUPR03MB1459.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(10201501046)(100000703101)(100105400095)(3002001)(93006095)(6055026)(6041248)(20161123564025)(20161123562025)(20161123555025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061750153)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BLUPR03MB1459; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BLUPR03MB1459; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB1459;
	4:vCJZoMPFMPKJagF7/buiZ0pT3jXzZMTaEd780sHhFQ9vSfTW8lEQE0K9C4HIhB+EljOwbje1WC0cpM4II5bdR0IIAS2Tpjr71MYj+/rR6ykLkGN6pkQo7cABLU9jjRIHzVObGLeRmTkNUl1d+6jCnr3aLjPrkUNZOc+2890oqRffVHwfBn0kLQaQ2puz7AlQsEX9GxfIVHLqV26+08nEEOpklj/j4PRLnnRToApL1LTesBHe/PbA9/ymhGkPFADO2dRHWg6bav0tR1ZZc4b7b+yQj0sBwsl9XFv+rYv1e5A=
X-Forefront-PRVS: 0421BF7135
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB1459;
	23:feYZvn7RffE2+++Mw1KuPh8QgaAs23VWHWqMZ6qmMigmKZq0bhN0//RshDafwZ4P9nURS6wutVdYKRNJh+hDtNfORVrz0XguhON59GDaxMMkMy5f681Q6gvy19B9VNpTRyQlEr7JXEJbVb5JNMSPiWHtL6Hn8cQI9fGcG0Ume949ebfWrP8KjsrCBJ/mugE/vOiVS6AuvQ4Hic4UiAS/JZ/XOHw7iAvgBGXRZte8MZTN4pdIgUKABwdLE2HFge8sBW0R9r8EwayZKfB45CY/udv0Q67FAICfHbCG1KjbnszIOr3naOKg4Y4/na2Cy0ARiWGUDiU8TMn1yjfeCVGK5ggjrpPWMqeLannaZZdfnAyfX47onYDs2UmDhcGsUX6OTuuqW+GLtOMVRGlQesz4zHeAw/VaOizB/t3flPxATlpVSksPYBPGR8XQnNaUgZjZsDjLeNqHV6PJ02oG/mSMYuK8rnrD0j1bJ94P3wzUtaKsVP9Inz5kmqySEEByRhMajKGkiAsAev4RwtDxKAxrqRrTBRGqnmA98OJ66RJ3o3MiHbgW1j9opEhUX84nlxB9wf7hG5sQgrgDu7Q3eYLG6IPkfX5OFwG56/rLqDmKiYKsm5lwRQW8XZQYZt34t0g9hpuHx0Sa4pX8JljEpjv5fsM5qvY43rb7uiAullgfocko7R3idOleluFILTMfZRi9ELUnuMyuOJYDdWCmEMwTWVNb5wpxjeXBtWdm04iTg7WnnAiEhz0ZTPn856ClHfTzRdi6cX6YFtygXI3N41wMhO6p/N+YMnXTQ1o8n60iX5q6QGqS0v4dRB1Wbkzr3kiLsCIbyPZT/TFbKhMYghQlGZDLNH7btdoaNmkGBJK5uUmQvIShbekBXIHvznK4sENkFL175aTnIcPy5WU6pdCYJf3Ryc9TwclRi0k8RL63Ixg83FprdG4Etnx7hnc56nj2
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB1459;
	6:gk0PbY1P5LjUCWixC1KnkwwYhPrYI13HT9CBNvRilFkQiXxf9v2V4sK8iFl2JEl/pnyvL9ahXLUROo+z4T6Z8IoVR8KxRA98JAbg4oNt879OtG8XwPl59O1+iqKUYbd1eHRmm1V9Yqr+qQ6AHrb02O9RESztCk3OlyFBxT/O1eU2VV3cUuCknuudvhd3My6jqN6EX8stYWLgrO7lNcpyqjn0pOutE1qv4sK5JDqJCg8MzynQLLPbTW/X5arB3Hee4jPbxYpi97/fxpMWraLMHTlRA38EG876O+1L6ymMdEkvBTfiHqcFr7hKUHFau1VudEdgpGe9U4nSokEYqapQiQ==;
	5:6wn4Hd+kHD1fuVioIwQJNLX5w26ffkWbAsfA5OeZXQfB7bmX9qVpq3/E65uXddLNhMqJ9I7boMVEBnVISOSHquAXkvscbZTsPMR7oIZLMBhkdaiC8UeJw385a+0kxlTrOCUT6URGkbu4ChexUr8+9w==;
	24:Iag0MXE191Mi6OcK2clChfIIazJLquKJuaGfwIi+2QpQRtnsfl1gAN2/ZXqUc7H59Mm2C9XpiIRnii7gdQbJO3oue2GhMykZuH7WZv01iis=;
	7:7mjhQJ7YTK2CNkHonJdm4aPBLq6iwpmS2gFc2KG4Tmg0alBSOs5+We24iSWnyHidErZrjXITU3KUT0lj6lN3KP4aCftFfeXwzE1lJfU0P9L07kpSoTMP2izw9WFu0aCpJDLIezQMDP1gOA2qJzWODAyTtKs6RjAa/Ig3z8jo2uS10m/naFaOLWWGgLpRR4m/23GKlfqqnhtyMBiBkiQAdjr3lk6S3Lj0smvVTr+62ZI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2017 08:56:47.1501 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB1459
Cc: chunrong.guo@nxp.com
Subject: [PATCH] glibc: Drop obsoleted bits/pthreadtypes-arch.h from multilibbing
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
X-List-Received-Date: Tue, 05 Sep 2017 12:29:29 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index a291148..df3db2c 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -138,7 +138,7 @@ do_install_append_armeb () {
 do_install_armmultilib () {
 
 	oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h bits/wordsize.h
-	oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/pthreadtypes.h  bits/sem.h  bits/semaphore.h bits/setjmp.h
+	oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/pthreadtypes.h bits/pthreadtypes-arch.h  bits/sem.h  bits/semaphore.h bits/setjmp.h
 	oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h bits/typesizes.h
 
 	oe_multilib_header fpu_control.h gnu/lib-names.h gnu/stubs.h ieee754.h
-- 
1.9.0


