Return-Path: <alejandr@xilinx.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0046.outbound.protection.outlook.com [104.47.32.46])
	by mail.openembedded.org (Postfix) with ESMTP id A94E974D0C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 07:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PkQeBAgjHuP4xQJRiqRd5Dtt5GB6Wf4no1ATAQ4dTCM=;
	b=4MZPE1NYvbIhpY3825u3VD808AETAKt5kjdbMyle+P4pSHHdP9Y/YKRGp1zsnzB/LZ8ubytDHBwFieSsvP6tbNiizHVcM2VxKJRv8nB6W43znKp9HC73oko4tF0IrA9ebXQzK8w8AHVO2ZI3m/6pJ6+1YKas/szWUpSGr8k3iu4=
Received: from MWHPR0201CA0046.namprd02.prod.outlook.com
	(2603:10b6:301:73::23) by BN6PR02MB2675.namprd02.prod.outlook.com
	(2603:10b6:404:fa::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1122.15;
	Wed, 5 Sep 2018 06:47:33 +0000
Received: from BL2NAM02FT014.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::204) by MWHPR0201CA0046.outlook.office365.com
	(2603:10b6:301:73::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1101.13 via
	Frontend Transport; Wed, 5 Sep 2018 06:47:32 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT014.mail.protection.outlook.com (10.152.76.154) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1101.10
	via Frontend Transport; Wed, 5 Sep 2018 06:47:31 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:44322
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fxRb9-0001Za-Dr for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2018 23:47:31 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fxRb4-0002DY-AA for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2018 23:47:26 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w856lHvG011955; Tue, 4 Sep 2018 23:47:18 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fxRav-0002CD-Pc; Tue, 04 Sep 2018 23:47:17 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Sep 2018 23:45:45 -0700
Message-ID: <a21fd7fe4186996df54bb5135428cb3f9242306b.1536129787.git.alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1536129787.git.alejandr@xilinx.com>
References: <cover.1536129787.git.alejandr@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(136003)(376002)(396003)(346002)(2980300002)(438002)(189003)(199004)(4326008)(5660300001)(336012)(26005)(6666003)(77096007)(186003)(6916009)(76176011)(316002)(7696005)(36756003)(51416003)(9786002)(36386004)(16586007)(8936002)(106002)(50226002)(107886003)(426003)(11346002)(446003)(486006)(2616005)(476003)(126002)(478600001)(81156014)(81166006)(8676002)(2906002)(2351001)(47776003)(50466002)(106466001)(305945005)(63266004)(356003)(118296001)(48376002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB2675; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT014;
	1:VY4s4cI0Xl4xURCA9OoLF6BVJ025cgSPgge11ildsqrqqGE4pq5LNx09S5SlID+WE8UjcKSQfWBSF2snYZVwUN1R7/rIoUYmqxQELQyAMW26DtfSVBNf7U2MCarNuL3T
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36b8861e-07e1-4ba1-7139-08d612fb7499
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BN6PR02MB2675; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2675;
	3:8uoXVS5lm0oj81KFiugo0Vopoelk2jtCX0hfqRJsAuTCdrhLZ758pmTWqxb5mMz9VnceFXM8a7lDvJ1ajsm6m3SRGhes56BkTAViFieuH1Bq7gPNfn6wHTqLhI8uiMsDN04xwgQE9g1Apeicqs51smW2j+5S3YCQN1wdu1HUitRbzJB9goFK/g7gboSyt9stZl+ktBXs78yQRsWh/OOq3INyCKZQT99sQj6wjTm7SLcWaSvMj8amhvsHNYpkYfdnXhwV5Wd+aSi6eA99GgMRDC4wZt4wYQNHO02drgdDZP7dcfDhKQ8qXXpXvCaQp4J+XH3lBK/QrK3t0JjaYXFo9gBZbgLh59IL3rSkhfcFR+g=;
	25:xMmjkCmwc/ZDkzl7YHR1F4Np6zGoX65IE/yXooZ8EZdiCdxhaxs17NMY/rn1Ch9yWTwMJ/X5e7lWX84pKIDzY2N3VV0b60u00w4nOeTdU3i7tWWcanHHnngcIIC09AUm5ebJCd8C7DV/HcKgVYL+0XLVvURw7gt4Oc3uBbq5oAhxX5T4U++PdhbFfGG9/VWUmq+RSN3Xb78Du3s4xzSrUaEQCvbzDtMjPp8FMY2n9GC+NUCeeC3trJUwTBcx2+HS7rxvivACvMQKFxtQPn63HCgk297lTg4UdAKneOy7RNSPKorE+QkKUHK0JQngiFK/GB+5I5xcUwHz3EjgqhnIXg==
X-MS-TrafficTypeDiagnostic: BN6PR02MB2675:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2675;
	31:BMIDNk2zsZAoctuD13xAxEx1khtlpQhu7dmRcGFy9/4LZoL1t+obUfar5RDidin/FDy69A/tERcMGMIHBfa0BOPNzeDFt0vGz9HzQ3h0fU+WB4LOUI/6yAY2s6aXvhn8G+GUM/XEMZuMdcaa2cTY2ux+ymvzt4Nf9OCFBhkJ7P7O1JWXp8xEf/5yiDEqpjTcSHNkoiCetvXF1LmzVIht5NymPj7iM6hREthii843GK8=;
	20:AndMfw/oseO9gHG2YuS7WhKhsjI75YFA3HVG1LRbrv3WNAdYqO0xjQRdYNd7mhJ7wOP0mv19R9RYFRDEGPONJsm6GYVmMEhddMYgHkWA3PtUXOt16/8dIQjVxLX4plaUISGpXQY2sByR1ye39UniQp/ygQG8+iXKbhfKqCREEccgTUaLQq8F1lAfDDjylpYlrjYiGT2RVJWRt4WFMmmbEyh/DBxZUy2YxmGPnWJN3/iwGF98sZJG8WdZtDxQBjheA8v/s7uC9DnGatSA7ZOwZBk6ga9C8DG21dhBdL7I50fx5My4Ed9bm58G2vk5f0eqYsL+r+2aiGXKDbtIRrPLizCXxMksJlFe8DH7zYGH7xmZIts05LBTr2tw0BosGCe7wjXLWK3dNkwZkdiRjXJN1DBouIjQOjdVLCcF67CvPeY6Z7n/YNIuXmQTNuk03l4tdIKVy1riRrwA3RWCtVLNYIK1NR5MJHaGH4AIwqaugPGFP4dgrpg18uxeC4WY80xP
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN6PR02MB267521BC1AB59983DB983190AC020@BN6PR02MB2675.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(3002001)(3231311)(944501410)(52105095)(10201501046)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201708071742011)(7699016);
	SRVR:BN6PR02MB2675; BCL:0; PCL:0; RULEID:; SRVR:BN6PR02MB2675; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2675;
	4:ot7QuIND+cHLlM2UIOTp/12TqM2N8XKqscknEv/pC/sAyOpCJ5OsQZqEtd9+9cZfoB6FaE3o55tXvoky3fXPixzK23MXW4IVJQ10oFZU6QGsGGv2Ce2P5gZvhnPbaNtIv/BMFyVQHjsvNEUfVMNKKembFKEb5uvfPReavPzH21PK0RnpAsKuIZtBdxtJ/L2yZ9rrCdfIanUsS3M9cbhRfLMvmSJzvf/A4G0hWnnVl+GJzGSNLeKqPzUBeiju4PycFx9MQNvbKZzcMqZ8ZZkvCBm/tsi4hjGCc0i18orZUXQgnF/tpsUAgZ5+FDYRrLCR
X-Forefront-PRVS: 078693968A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB2675;
	23:7gjmLaMTCP1iLTnc5f0AQcAIDm2VF7/fPfJec17Nd?=
	=?us-ascii?Q?eRJyrjS2DcZoIgZj5DO2UvFEY5Mt4svfzGZJow9+2qcTflRfSGbcriDXblnF?=
	=?us-ascii?Q?o1apXcd4Dftm8TQib78aFmMthUEMi+g9esPw3dibGEeXZfLzlUvak0/ChbD4?=
	=?us-ascii?Q?6VUOJhUkryBW/BpF5h/gl6Exhb5E9V1Yu16SF9XsPaH9Qfy9+ky0hOBIn/gR?=
	=?us-ascii?Q?lJRS3t1j1dZhhOjqTXNf619jYQrvS9fJ3HZDUthFnLaCKyqOWpwcFiTND/IX?=
	=?us-ascii?Q?EM/axp6rysu+TtznJ3sLNz5Tr6vYxhygOAbApV7zZOPaowaPLjcZ1XPu2j3h?=
	=?us-ascii?Q?RoXCUzHG0mr4btVwiP2jEUuBv8xl7kac01gWnj7zpoykcO8HTSEjoL0+0QoN?=
	=?us-ascii?Q?7Q/TPb2ymSGXr5i6rpOQxXep5TUOGC9SKudAxZZCMnbbVy5vT0+uC+VvMUZn?=
	=?us-ascii?Q?X372LF+nqLMj1mF3pHVG2PlmUIbmvwWP9Ad0KaQNeTBmaudOW7f5iRqVkaM3?=
	=?us-ascii?Q?UevUqa/kbr6vGyrvuWAlF2wvEpp0KnycC64ySA8ff5HQtS2kD9lXZo++dDHL?=
	=?us-ascii?Q?H+AC95202SyITDg/uvIL/NHQ++N+kZekrFyfeYpTRFpHzNdfF/VqUWc3C17L?=
	=?us-ascii?Q?4HbYu58qR/RW5+IPXeZSx3+BdeT49raRYRPiV3Y/guh9APZ0BVdMR9dfmaA1?=
	=?us-ascii?Q?3lzJwXVnsdFhdRLNEuMK8HzEZ2vmrJjrwnzbKhJYkvvPy8E6IRRZmkL86mt+?=
	=?us-ascii?Q?4TLT250TaO6Wid5mq6EUA8z5fI6SMVaJbRVt8jxKHNxzMhHpA12N6AAjP7Yl?=
	=?us-ascii?Q?goPdPHcokcHQimylm+AA414UES9wWM2OPMZJeIhbCn/zmg8AD4WzajlMY8zH?=
	=?us-ascii?Q?ejOqxdtVujLPmJ7gZIVZdtRCnP5k6SFSkiPTxbQpDUptxpywUEdXmqialyLY?=
	=?us-ascii?Q?Bf+9ZHq8R9M3TnAsNN2VV6pgskS8L5mQ1Oz8qObQzBbwAwOBHECEh8W4AYmU?=
	=?us-ascii?Q?OsbQcIe633dQSNwPqKvyZQNfcwuuGfBOsGo7oY9vtXPGeUN1+TJfh0CkEoX4?=
	=?us-ascii?Q?nRYPuHEDbtjpqZ+qlc8hRhOnEEZ8tZSDOuCuIzq4yicmRyzqoW2EelBVOgkr?=
	=?us-ascii?Q?DfCLmZzthvavCd5nsKTmDb2ScwO9zyGb9IeG9wQRN8mX9ooH61HTQ=3D=3D?=
X-Microsoft-Antispam-Message-Info: Y50zmmFzA8kEHd+Ng8qDTol1LS+efRZePzUGa8FuBA/4S4K4ognseHTeJmyK19U3UTkpnZhUDeNnVrSI2X2UqqcBeLVSlo73Dy6AbzyeXUHONM5w5JA3Y0pMPAsX3baGW6vp6rgjFCI0gHdtoeY5fZ1zJmGrBV4zg3fwDO5eV2ZEQ8Vdi7qthymKlFHv72xIme2qAaUl7oI/fz5mZWas+ySRyQbnGPhgjK7UvAokr3OIyT2IH7qpzn+2amFvbm0DCvEcg6cndJxI+qxGh3wgmtuZP2Q1AqDDNfP5WN1Nh6uZc1lJIk18S18swiymSBlqTP5+syftwpbSUnf+ylTXuotn+hKbRWR1R7AXc9vOMfQ=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2675;
	6:fvXFNJkXugpyc2tITPTT+5cMSRp1UU2y+7s+/ReTURBHPvoANP9+4LPX56crPsA+IRX9usnOrUYum9Ystd4aXr7lcvYGb7bCUuIiy5c5J0IgNee5mAC6E3rqfLCvdJT65OK1cv5755gk0pCQ5RyNYlWIIHyufjI8UDD0BxcIywNckbzrwjlfmJzsMbEFVDiNE/66QIhifXTDd8voaD7ThxERWRAeMPTVBGgoFRppQrUcVDuIqJ1kony328HBcyNY+iBln66UHYZ7DQWjKuykcEQrtCzcXdeDsDJnxewIPQGg7s0uGEFednc5VG+rW4vsE10u4g4O2WyGOTTVc6FiGUcKInzlDwVoicpCpL7tFHOVO1XStYJicIi2qiz2uuLzVhIbkmKw9NFEqhs6ADR8Vg6S0wz8UIKF/Ilc6QxOO3yqSAzJFHBF1BSkhCvvxUzmayp/y15DSt+GaPW5HK1X4Q==;
	5:aNEltFmLatpO9mdeLlOfEgkmPPp7FCAr1gCP+8Vy41R8g07W3JZFM4DvNRaTaeqhIxd7Pa6Em6HbQKqRLaKGYICvrN9jUOitXBnVmfAhd4SM/tm3gDQNeytdlmtW1UwLMwqJo2lhMkkalBqSCNlbU3Jo5VTSic/VZBDsYSQHFnU=;
	7:2hga0ybMkAuTDeOHrQUIPsURc8PPUrth01jAfzYeC9FjbyNwsXrLfbz9OEzJENy9gTsbtoBmbvIqQUfA3EaXQe8QgC/I6E3UQhu11kJIpBuasJGs9fDtfFWfu6Q/ywfGUi6XtjFeBgcPlocGdbx8V6cC8dFC22PxxARbOxCMWqQifo4sDFtcXFPYd5DGdkKiBQthCeQWV79SlfBtTgK6nFSIbG3cKS5A/3JY+Kmlh7YAv7KZcSWmahcXT9oQFXRy
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2018 06:47:31.9933 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b8861e-07e1-4ba1-7139-08d612fb7499
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2675
Subject: [PATCH 4/4] python3-manifest: Avoid duplicate modules
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
X-List-Received-Date: Wed, 05 Sep 2018 07:19:34 -0000
Content-Type: text/plain

There was a bug where modules were being added twice to the
core package, this patches the manifest to reflect the fix on
the create_manifest script.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index e332078..90a41fb 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -197,10 +197,6 @@
         "files": [
             "${bindir}/python*[!-config]",
             "${includedir}/python${PYTHON_BINABI}/pyconfig*.h",
-            "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.py",
-            "${libdir}/python${PYTHON_MAJMIN}/collections",
-            "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py",
             "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
             "${libdir}/python${PYTHON_MAJMIN}/UserList.py",
             "${libdir}/python${PYTHON_MAJMIN}/UserString.py",
@@ -281,6 +277,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/selectors.py",
             "${libdir}/python${PYTHON_MAJMIN}/signal.py",
             "${libdir}/python${PYTHON_MAJMIN}/site.py",
+            "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py",
             "${libdir}/python${PYTHON_MAJMIN}/sre_compile.py",
             "${libdir}/python${PYTHON_MAJMIN}/sre_constants.py",
             "${libdir}/python${PYTHON_MAJMIN}/sre_parse.py",
-- 
2.7.4


