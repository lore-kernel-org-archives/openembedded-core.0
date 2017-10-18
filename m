Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 3578 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 18 Oct 2017 09:25:53 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0122.outbound.protection.outlook.com [104.47.36.122])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3636FF69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 09:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=D0JDikNdhU4P53tbDZujn9aJtn1T0WnaK0Fj239a15s=;
	b=B5zaSk/GyZ4ECBwgorQnsvgMMH4htBzyFKD/+6zPCNCfCkAEvkGyNbBjSnV32xeqAZXBo/LJSLa6Md6VbzWS69URprXv/dLrBMpe/NFV6EyZATVD4Xhgbi/RbKqOk+pGvU5xG1dBQ5gZvMxnXy+VTzdrRoRnSmnnt/xDise4QHQ=
Received: from MWHPR03CA0011.namprd03.prod.outlook.com (2603:10b6:300:117::21)
	by BN1PR0301MB0771.namprd03.prod.outlook.com (2a01:111:e400:4c::28)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.77.7;
	Wed, 18 Oct 2017 07:53:16 +0000
Received: from BY2FFO11FD009.protection.gbl (2a01:111:f400:7c0c::135) by
	MWHPR03CA0011.outlook.office365.com (2603:10b6:300:117::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.77.7 via
	Frontend Transport; Wed, 18 Oct 2017 07:53:15 +0000
Received-SPF: Neutral (protection.outlook.com: 192.88.158.2 is neither
	permitted nor denied by domain of freescale.com)
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD009.mail.protection.outlook.com (10.1.14.73) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.77.10
	via Frontend Transport; Wed, 18 Oct 2017 07:53:15 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id v9I7rCYF006083;
	Wed, 18 Oct 2017 00:53:13 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Oct 2017 15:53:06 +0800
Message-ID: <1508313186-12851-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(346002)(39860400002)(376002)(2980300002)(189002)(199003)(8936002)(48376002)(105606002)(5660300001)(50226002)(50466002)(4326008)(53936002)(2351001)(8676002)(16586007)(81166006)(8656005)(8656005)(81156014)(106466001)(316002)(77096006)(498600001)(68736007)(2906002)(47776003)(6916009)(356003)(305945005)(69596002)(97736004)(189998001)(42882006)(6666003)(50986999)(5003940100001)(104016004)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR0301MB0771;
	H:az84smr01.freescale.net; FPR:; SPF:Neutral;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD009;
	1:JcP4/adtR40wlqWi2Y+QXt+Dr3NzV17iNAUjQANIjKrEdaRGVyA+WNjb8uvdSWqQQbB6hVKnocJuGV4EY4i9zkclEIHxJHy4Tqb9mE13mMfYV+pn+yLVkopkGfHsSNJs
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e3920d4-1e84-4f86-c60c-08d515fd49d1
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:BN1PR0301MB0771; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0301MB0771;
	3:BuOLYks9ee9XLzWWZQvsLAt3MHXb6AzDfNyo9FZXCnkiFyFEgU3+JsAw+/0k7kcIddYuWwhqiKgNCahHjBAgxFOcaYDIUb4COXIVZpH7cp5K5k2AMPGx507qVSw7rZW8EfqdBZQsXJ1I9mII5Iik1VrpkjoIYSkMoNDXTfxvrXSnaAgE9cWbM7ux4qeQVPMOc9kRG+oYD+eB5wS/yicLaRn1OWhLR5Do/ZQ7MfnVQOJ1zkIQjff6PPzgMOrsdEycIBTxO9sKP4qLYPKcBeHZQPC1853qC7mmkA2TgXesx21a29h+hr/lFjdl8q328kRFrGbe1wjdkz6a7rgs/OtuGw==;
	25:sFPOU9q+mcUKc2Fp+XZu32KtS0paj9DYhCmcfcaHGLCWmwCGZryxbJOTqtN7PVHhH0hACBysbUGyZ7Vjr1Bv9yJd4Kag5SiVWsnLBTEW5IpZ5NbQnIdcLbfEu2ZiTrIO5BOndmKYUNr9PIYe2HkJSZnMcgqdNOGAL5Jb/4nLz/4FbyLHNvDc8antf0W24sh2WTxOyU5ILhRFHE0135OiGQux1VH+kXBNDji2qSP/NzdxoqbURqa1pmdcK1sMxlgPGUaQT0iQe5ARzldfV6NJciZLu/Vr/8toKDEZE3jzuFibuA6tyNg63VKIa9MUZPQG/zNu6r7Lj6lfYNJHVGYGJXfyqcPU/xFhy3d5aBYE+Ik=
X-MS-TrafficTypeDiagnostic: BN1PR0301MB0771:
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0301MB0771;
	31:a5p0uiqFMg09kb0asO6BXoTd2gmuytKIboQnaMUKp6YJGpNrc/58FDgt7GraHZGbg0xhiWnQT/o4ZiIrsZI2eEsRYXHg62kDvZb+TTbEsHx9J4j/RRor3c6lSSLDZ63xvY5FiHOZ4aYZFCyYp5ysiV3MnNrKNgDTWVhyHGpguFjp2PGyWYojzxSNFPzJBVJlwzxTsrB/QLZhpcJe4S3VGEbs14QqCqW345EJigFF8rQ=;
	20:78R+Ff1NjClOTfrsNZWnGyfL+/Q3gyKmjxhLUNc8Nq/YdEHwyCjUDX8kcmDb0kM9BboK6XsjXBPJcf27QDkPMX09n6RdzKznbc1QIsriy3c+SUSrZI6Ndy6bRamWWktZJefBdCFAGCxZmLBnzx1PueA7j6WhPNpMYcbRITgShBPWgoqCiyUpcUexDbeqUuiuFCaBRhDFaerxu//Ao0RwWYzJKKp18QUuxgeaefTfSj/He8WMwopI9kEXo4STF0hase6JpeWnyKA8nT95dIq0ih4eeXj6v8/Dazoo9I0QFFhgX4Yp1LyNI/+RVY7sfrtUhtvxUVGc/sMMf0r4vIe6zmZVVhp5wzQJck3bQjApQ+t39Nphwl+3le5J9ltm1pG/n0KZtTI/h9xKmuthy21moBfbeQ2HYW1K6NZ+kguuqSlvcLwsQ8kCgEcIHEqTAGs8MVlYo6gHxNpMMlFecSJwYa6MSmZntoq+0qWiIQH7fKTA5l1WvrUFnY2GXuJYTVUDXpgRCSnrtx8pa5J9H+zK5isyYfH5mDNE5YwW34kBnSmDo7AVDoZPBNijwcl6vyDsQ68B4ex/W8qAc4z5PKPWIdLoDbOXnx1n8GTyuQ1Dmlc=
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Microsoft-Antispam-PRVS: <BN1PR0301MB0771AC727D7674C5E1B8B85F844D0@BN1PR0301MB0771.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(93006095)(10201501046)(3002001)(6055026)(6041248)(20161123562025)(20161123560025)(20161123558100)(20161123564025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061750153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN1PR0301MB0771; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN1PR0301MB0771; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0301MB0771;
	4:P+VXr7XIAwtuzdXby3k8BmHQ8SNnaI9TDJJgvZOJBC+DWU7I3JcAI4FBAw46/IxqcHcyUPHN154HFIFsAaLcogpNeTMSFC9DJmdGs7vUsxlQc19fBPEaKf//HY6ea18nrrWpfdWd2179dUkQ955DTAwPFIetw09EXZVyCd7dGpV3OOVrexjTlhut68+rs9e6POcuZk6bC68cwl9HY8G80b6FhXfMFoQb3Oina1UQrwpf9nn+KkNKn48cIyjxnE86xe6UjchToEu+/OCOFjQDRbpjAcTfXyCpWuMjAnHH+Z8=
X-Forefront-PRVS: 0464DBBBC4
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR0301MB0771;
	23:OWFuFPAISgjSDjC8jZpm5R51mvOvmNG4b5C9rdT?=
	=?us-ascii?Q?zVtFgowXeJ/iHw+xp0dCD36e1AfrcixYHjVnLStSiTib88o6PHHZ9yFzdNmT?=
	=?us-ascii?Q?yF47WI0t7sjS81p9gtbLG2u3DHSBwZtzVV4kucga1VQYK7Ectul+XK7XFXPd?=
	=?us-ascii?Q?RU0w3qIwK3+dI+Cs+eTZE65z0JzrViDahP/Bm6R605SBvaDqW8rsi/0AR/2V?=
	=?us-ascii?Q?ILSlhVm0NS4A5rQmCcyOLzbfiV2N27S1xiAHpvlVETsc4GowQ5RS+j3HTwAV?=
	=?us-ascii?Q?ix5sHv8uGg9sARrAhyyX2RaNvkXssUjNrwkbM/VP0tLPr2HubYi79FFGO73p?=
	=?us-ascii?Q?sr6Lfqb9Ty0rdSxcKyGwYCuL0rqxc8PIKwaIdl4wKT+N0rYeHg7lpjMnl6/J?=
	=?us-ascii?Q?j8Mnoa7BS7egccHMwXtKW8rZ9bhpzPNC4S0ihLS+4n07zY1tGt8+AwCzS5h9?=
	=?us-ascii?Q?pHQ/G/OgFFHOlQl2m0Hik6fanW0bXARLkOY7rc0p/xyJYUoI9ll17pu4fyZM?=
	=?us-ascii?Q?RvJcF21HMCc3GDHfdiKIx75NeUaIXAmdxnbUViB1MvPzJFxf3wpIxdysnpp4?=
	=?us-ascii?Q?6dCq9wthvERdwSbLLKoThRgeenrDETC6lYBGetCFuu+wNYZYFVyPFFwuZYrw?=
	=?us-ascii?Q?lEkOD9QWqb1LyrwyTRJJ66p6bOehhy+pVrkbQZY5mSK+X6D/tEevvudT29Kp?=
	=?us-ascii?Q?Si7mAiARyRCTHtFxuSWRKkr1uXWFxLkvAL3WxviXiL+z2IByGSR0KUGvIgvo?=
	=?us-ascii?Q?i989RPIUX8QVqKvop2AoPIfJDVzLW99SZUyclsMhdEL3242d8O/wRoDv8YIS?=
	=?us-ascii?Q?mA93Cxnt4WJHDrpchUK+bl51t0x4hd+yCbvtsX1IrXEgTqkACobibaY4Hd5W?=
	=?us-ascii?Q?VHph9y+ecA1WhaxM7ZyumA3NtPIKkKh4jP+UdLo1kcDPpTxX1rz0aI/gCthl?=
	=?us-ascii?Q?SKvrNmN3up0CLGgUoI7WXGJ3SAuL/sy4cYedD6T4LWpOx76COFE5WnwgmFdS?=
	=?us-ascii?Q?kUbc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0301MB0771;
	6:GwU6kzLDUZU6+mj12WAWs03G9GH+nqYC7ENqk4T0//2GUMCN+KHVOCdaIPN0QSP51whOF7NsOpsC6dxLEE7gfAN5pJyFFn6hiSgb4Re4QqUVgprRh60SkC9gCsXu6VCBV2MtMUUCRr3WqYnpr4vcm6k0JOoNKk4tJtaUrm5WyESuHmE7lO9BnvPq+lhxoDKAew4drSJJZLcgNm8xlOIQmoVF/jSwajO8gSwzfDkiYoVVKkHWLieFx+w51ZU1HQPoxOk7Z/W54R4Mvq05XmjySVZBecQ8DFBIGc/b2MyAJearF3DbO6L6hf7LWhIRFHQEdOF2fp8pA5pCl6YagsQO3A==;
	5:ldZVcwoq1OP833foKgcvkJjDCmJ5LcumfbCGzUvdEutvjfOBt2VN0Dbbrdagb3DHBk29yReKbDxcqAkngVyK/OqpcaSVv6d0QtdZBq3D2KG8lOfXKYQituqD0sFY5EBsEskBqnxSUsELoqPEPLmglg==;
	24:adkUTdV28ir7BbKgfrzRoRlemEb3ehfcC2crU/z2Z5XLwSEOFskbrh7Bph5FwHSi3RKzngovUUyUKDvA0xBY55x0dMLcPqIFyzgewdVSgDI=;
	7:TJT7hG0UfvAMlsz32kVf5d0aIyV2IH+wiC7EeEjw0LlqFS61zHtv3JsVhKMGWjtTPppCFseGBjFcM1bZB3ubMB9UCOmbWCa9jNLTrgLe+NjRyxw376K1QGbSqJHPRZnmvcr7HCJv7a+jWQgO+c2Ct+TnXty8wy+o9/2rCu/yKzJH7k8LgQ649XjSNS+K4aWGl7HAshgjHUASYx28tSBH8F1J2cZxZX9JR+2jXxkwiy8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2017 07:53:15.0314 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR0301MB0771
Cc: chunrong.guo@nxp.com
Subject: [PATCH] kernel-fitimage: support ARM64 On arm64, the kernel image target is Image
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
X-List-Received-Date: Wed, 18 Oct 2017 09:25:53 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 179185b..53d9f4a 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -9,6 +9,8 @@ python __anonymous () {
 
         if d.getVar("UBOOT_ARCH") == "mips":
             replacementtype = "vmlinuz.bin"
+        elif d.getVar("UBOOT_ARCH") == "arm64":
+            replacementtype = "Image"
         elif d.getVar("UBOOT_ARCH") == "x86":
             replacementtype = "bzImage"
         else:
-- 
1.9.0


