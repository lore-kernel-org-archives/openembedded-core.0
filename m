Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0115.outbound.protection.outlook.com [207.46.100.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7E5897638A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 15:50:08 +0000 (UTC)
Received: from BY2PR03CA005.namprd03.prod.outlook.com (10.255.93.22) by
	CY1PR0301MB1178.namprd03.prod.outlook.com (10.160.165.21) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Wed, 29 Jul 2015 15:50:07 +0000
Received: from BL2FFO11OLC001.protection.gbl (10.255.93.4) by
	BY2PR03CA005.outlook.office365.com (10.255.93.22) with Microsoft SMTP
	Server (TLS) id 15.1.225.19 via Frontend Transport;
	Wed, 29 Jul 2015 15:50:07 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11OLC001.mail.protection.outlook.com (10.173.161.185) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Wed, 29 Jul 2015 15:50:07 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6TFo41u032166; Wed, 29 Jul 2015 08:50:05 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jul 2015 07:49:46 +0800
Message-ID: <1438213787-19374-1-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC001;
	1:HuEzyMlfTXdJDv0BniEcnnYmK1ve1w2UM06c+HoYgzXaWFq/l3KkZvVaOTQag7zl6fel4JqsBsPnTxXjOandi+XNwL0iOCRJC3/g3POuxJcuV3coGnozre3A4ESe3f14A87PSg6ocv/vTyIbZZe7cVoeEFeJ8GoEpc09Qqu/Z4jkJB3CHXnqJuXzMkhZvn+Fu26ZdN893RfCP/Y88OOAvJuzk5dlXD82G5bo/4N8rQTMjAtSntMVwDI3JUOxImbY+MPoz7g0sMA1yZ+d25NVGeB/Ovg6HHRExiIj6oUBN2otyu6Kz6FiQvBvjZKNEyPvR5fXsks3bqYrG6c+yPjiOA==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(5001960100002)(105606002)(106466001)(87936001)(6806004)(48376002)(189998001)(110136002)(50466002)(85426001)(36756003)(107886002)(92566002)(47776003)(50226001)(104016003)(50986999)(33646002)(229853001)(2351001)(450100001)(77096005)(86362001)(77156002)(575784001)(46102003)(62966003)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1178;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	2:5sndBlLu/o7NYFZMYs/h13XRohRysZcDqLeDvKDlZSsNB4Y3niYVg7T4lWwChUk5/WyrfleVOwgGXfUa7+23EnEmE37r7L1VG02OBI7QfgW2FcRaKwPv9UaIyVudbMR0B8o/NMOLI4I0mu49kd4kRTpyBLeCgGuHoa+NLURFPbc=;
	3:mW0P5sqhyUHCmppcorLuNJqb0RZXtAT74WjY2Qbglm7Dr+GarYXhoEjpeRGduM2QfriPBVMuN0ob1TYOX1i3hCPi4APjZV0U5ZTtFDvMbH7ABRiT7j22GzPY1iBFNdqoi/kVteGd9szdK5qRrdhVr5518wJYsjsaY7O8o3Ga1mvM7uBVZM9qZEX+6RaaBiIDiY/viYXIfKwkIYePCDJMQNOJ0oQoK9z3MOIMgU/0DRs=;
	25:SYUSEQjZr02ECl9x0VkKZhdVTU9NBxUkpHjR5EZm2m6zL+kUO3v9GeMHXwZ1NXSw7USiGpL0osbp53KmWTDks7XN9dOVVqzMcWLg6zBzI+Xdc7K/04rfDRIKnDemTqi6sC/b1+eeA0rdV5vEilL2AG22/TLk7xBoT1bK9jF55xoJkYGE6kHIwaGJSxJot1XvxVLvY5MQ3RPG703H7T9r8Rish8xSznSr8QGDpjbPSso6tOp88Gx3PIaAWuP2w3YcftM76BnYXWsvD55wWKua4A==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1178;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	20:8mIfrdMw7EmlHjaFb6+t/pbm3zzkYpFwMr71qApaapocZBW3liWVOT3tW1wNPZH5b1XJ+hqPPai1v5Sh4prb/mBiVzn9RUbQoAGCWsMpBdmWAq04aSxpHAwZ88gh8SpL9GiUdNssogzI2GgKvVQhiPAIgOZXYGT3Dw0MLTi7DTiFodLemyw5v4cEjniRycF5Dd89OGD9HWejr5sWhOiuo5JG7X5yAXXVgk5HUANOBKMBtc7GO7mrjR354UAE5DG65iq9U61hmy5HjOrRSMa0WndOT6Nzmhb3gpU1vmDSaJ3cxVTwqlGxcwNbxg080pQ+iMIZSNCFOKuIn1hnWuwKGnqEh7Qs1fEbcy5VZmHTZZg=;
	4:/X/UIyT8wqf99w+SIKbFzF+DYqMLbhr3etbnUlT8voxXdAyd3yMtcd8+KYgAniBSD3nUZU+rvZua7yGRAklIUbw5LWZuyqg4RdG5bcRRyoEGyMJVe3Da3hs6Q2IW9Eth9kcYZSwgitCJc0ZpugjAbbjUd0vW23juU4rrCrFUqkOwWBnBPQkK8pfUJeyZaFkz6dVt91QmZ+Ko+JgsTYmX8F5Xxs5MPFV9TwyW/6kaCumx0nmf+9duKQhpOmPNuqL3qqfBa4HCzQyNp5HpA5L/39BrSNPxYQESIVOd9yyNZjc=
CY1PR0301MB1178: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <CY1PR0301MB1178116D96761076744C92DA868C0@CY1PR0301MB1178.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:CY1PR0301MB1178; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0301MB1178; 
X-Forefront-PRVS: 0652EA5565
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	23:pinYPuc0KfIYBWQRqXv5t7Ygm7zPUkqinH51/o5A8/WRIejJ8kryaKzq/Ytz/06DkN2u1cc65b6OoWKrAciZI62J8RHade749SK3uh69QX+udVZIPLxoiPCFVmRoJ+3SxUz3wH/W2hhCP0qzAMv5qPCg8GmIpabGotl12qdChzCnlYZjhCHZP8TM3SnLIyeRGpPTNLTXAggeI5H0NtJWXqTZvVJ34JqD/Q9JwB9CHGLYdshJTZ2h+wQUqSOdwgWWvLJ7+i8xP4/cbOGrSQrUKxqDeoWUDfsKXgRKBrS9jd2c/D/qlv3sDhRMr3xCkFEIyyTd4DymL1RlAd2lRL2UlU5RYaZUn4ER55KNTxoYz88GnRbExk4GEs1kvX+Vy2A3YUkY9jQGiBSQEgCiQLfpTCUttOUb50hZxVn6Um/GuQOs0eZl8m6PDj3XPdXgjWSs2aKvgrcLDgZGgd3iva2JCKHkTOClEaBTyM0dYjfMRWiBB50KRgGlhiMVyxNn8fdn0Mtw0DC2iZdbGstYd50riIISXt2zmSRsKL9V6v0VLjkElIcgufqDg6g0p+2tjkKnxlXKIPIu8u9RQPIL2cBq3BoYx0frneTMqzsFa1janTjirKUJ+/xiIKHuiWYtz+VTL0eOv8PLqliknk4WZWqQywffKOpsJMuE95GgdfgUy9duLM2n4x6T3y2+hieU7HJ5UgFRQ8B6GVBobl3CyeLYc3pKaMBrEQgDrhtjeafy30E6Do9yMKT4oIFSni4kt30Js2fjOZNSkUvEvWrB7CQ1b/ikcU0CKjyjvW+fexdB735HnJ99JAm5GSdKj9gn/37MnfW10wetpG/dWuLNuyAV9rrhtXrWQFmgizi/uDUfkztTA/tfRHluhj/sOeTEeDNf
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	5:hC0dDBeB47FmiXaPTWkftD6jwueZTmeugvqVH3UuC1GpWOuMlGSERkTcXEzO3kmdbqt5SSppWJh93f0bz2dLqedTVCMsM4u/6icLRZRdFa9ys0ZOHoKtFkGy1iAqaVbO3wCGleuk7gPJFFZUwuiCxw==;
	24:Ome//WqWqmMyyspoL9e/meflnT/fETGYZsJevWE39Fqjp1OXrVCqSVXRE1H5VnhKhLvG0TxnLUcDIexPLvEUeLEGC8Oe4ViUpqcG2pAdrO0=;
	20:gKBcg25zdV0Kn+EKtUTXwMoTieggPnJjKm0kHkMwyezgaIs/IvZDkwzfcKJInwC6ag2e3RcU3GmHE22KisFpqQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2015 15:50:07.0540 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1178
Subject: [poky][PATCH v4] pulseaudio
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
X-List-Received-Date: Wed, 29 Jul 2015 15:50:10 -0000
Content-Type: text/plain

Fix no process to open pulseaudio in yocto. 

Yuqing Zhu (1):
  pulseaudio: revert commit 42156d2b5ac797e5f28f8d0d38b691053f3f6fc7

 ...ch-Avoid-specifically-starting-PA-and-rel.patch | 31 ++++++++++++++++++++++
 .../pulseaudio/pulseaudio_6.0.bb                   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0002-Revert-launch-Avoid-specifically-starting-PA-and-rel.patch

-- 
1.9.1


