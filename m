Return-Path: <DEVARSHT@xilinx.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0045.outbound.protection.outlook.com [104.47.41.45])
	by mail.openembedded.org (Postfix) with ESMTP id D3FB278972
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 06:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=e7MzJ7CJdXJmLOuX9RPUi1nIEiso0FSctp3ed0pptQs=;
	b=TWnbqW3mAJUBAsuAgiIOyDKlFXafYj3+y0SMLSuNR/PB+tveCav7tIeBcioz10EB/LT/wWRZl5Y6kuuv70P2FA5igudIwVXW8Q6HCz34QGED16CeqRqy3eqeAaQiK2FvOcNkbvTS7mQxWWMgJBVTPNaLJrpAl6Pd1OhEQxlVDlg=
Received: from CY4PR02CA0047.namprd02.prod.outlook.com (2603:10b6:903:117::33)
	by DM6PR02MB4953.namprd02.prod.outlook.com (2603:10b6:5:11::22) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.841.19;
	Mon, 11 Jun 2018 06:22:54 +0000
Received: from SN1NAM02FT023.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by CY4PR02CA0047.outlook.office365.com
	(2603:10b6:903:117::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.841.14 via
	Frontend Transport; Mon, 11 Jun 2018 06:22:54 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT023.mail.protection.outlook.com (10.152.72.156) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.863.11
	via Frontend Transport; Mon, 11 Jun 2018 06:22:53 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:37279
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <devarsh.thakkar@xilinx.com>) id 1fSGE9-0004yE-AN
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Jun 2018 23:22:53 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <devarsh.thakkar@xilinx.com>) id 1fSGE4-0003Zj-6m
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Jun 2018 23:22:48 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w5B6Mg58006187; Sun, 10 Jun 2018 23:22:42 -0700
Received: from [172.19.10.63] (helo=xsjmrinals50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <devarsht@xilinx.com>)
	id 1fSGDy-0003ZN-25; Sun, 10 Jun 2018 23:22:42 -0700
From: Devarsh Thakkar <devarsh.thakkar@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <devarsht@xilinx.com>
Date: Sun, 10 Jun 2018 23:22:24 -0700
Message-ID: <1528698144-25780-1-git-send-email-devarsht@xilinx.com>
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(346002)(376002)(39380400002)(39860400002)(2980300002)(438002)(189003)(199004)(126002)(486006)(36386004)(305945005)(106002)(106466001)(63266004)(72206003)(81166006)(8676002)(2906002)(478600001)(8746002)(7049001)(51416003)(7696005)(50466002)(1857600001)(77096007)(26005)(59450400001)(48376002)(50226002)(81156014)(8936002)(47776003)(356003)(5890100001)(15650500001)(186003)(9786002)(6346003)(44832011)(426003)(2616005)(316002)(476003)(6666003)(110136005)(5660300001)(575784001)(6636002)(36756003)(336012)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4953; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT023;
	1:0smv2JnnQylwcFfHtaHEQEEgllePWfKCCqEyALYHkcnv7JRMMftUu7UFUOLmzgx9SzODdImArXI9qiFpUmFH3yfPvPE57CkE+MPM2chFp9ektjFOvhuY6CoFWll72KWX
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:DM6PR02MB4953; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4953;
	3:qdH39OyrLojYySFMWfvEZ9x7Ogg+b6gNX/ISrXFm0+yFl3v2hmrxrlt/yvetbI2b9XZjIpY95pJFKKjlqKTkcmxW+Cx9P1gGb0fb983ZmvNyekB10Sdejs59AlTEUWBB+wTbrbHCGd0SdwbERTSgApHJxqCd32SREW4DmUnAmJGqP/4B05e8PaMT6AGtgIsRk8JCXwpwTpo1Cqi9p25/KmvfrVKnP4BZBF5JSl5UfqwLKhA1A70otJwYE/iJdFMQd7CQ5g95DmZmYypQkF8rYG9bk8rtGV09MwrU60Cy7PF7qLL3LZZOKRn92WJntMUFLY0vH5Ut8dVw5eGe8GL+YZxIW18xf9Hl9qkMaToGanM=;
	25:tBgZMb+wf3AIEwH/5XyFdF8Zr5H2M+cPX6xWMPKAR8omGqEGv+g592q2aPNLNACFD46KpUfM3MWiznGUue6r1LDBwHt30JzhL6r4fz4J3h8ggjFurRglkyrLlgD5h+FDrg4rJC9XSRVdfU9Fvn4hM6M2DoY8WYlDbjsv8IAfdsiqe6xQrVjL2ms0JBuUGynlRpg2AbkClPsBnP/wYEfhSTxjxyCqFzOPUlP1rsS3kU4TUrL5EcthuU+ksvitchVvKCq8W1vusATVwhhZcKrUfcyI4vGlyOOJ4FQgQczMjCDMUIG7QlRoqPBt8MKVjsva6Jhf+UvEisG3HZEPTXZxIA==
X-MS-TrafficTypeDiagnostic: DM6PR02MB4953:
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4953;
	31:UCE8wbu+eAUMeFZAbFCYIetCjhzqK9iaWRkZGViuVucPbpdfq3Deahhitiet02ocgxAJS3sGZGHC+4pdMWzGVkjhxwb2l0B4RBo5Tfu2TqUEpBSNrezy4NjyYPiWoqk7NKKGeKwNr1Hp84qGIpkOWHgYKncFCsSv3ZmOFk5iBNzvaqq/zNNqunrKvH5w1aSFtsRepti1chVA5TN3DB2d4TGzCD+ZteUmec/PzJ3hfyw=;
	20:ClZFe0xxvXO0mXLhJviNlKYaYtn+57kgduKCa4S4KfkKgEiEe4zg4zF6vBH/+xNQSmFj7q92fI1Wxpk8+Dgak3AKYJVZ/VcsGKTHXKG/RM4pGbBnHS3qLx6ibRZZ6ksm8IsaOl3mEXuj37u0ZU1MdzBIo7FmTuaWxjJ3LQlEWW1WJAfWO3x73WIH0QFnQeOCzOlVdWyFkDJwDmFjzwu+LHqYt7RrjaurCn/N3nm85CSh/Zl5IgfoRqBsTOa6aplciS8W6+aplvNM0n65ZTP9kF3JRG2q0qIzXw3JO4mbL0I9/mpXO/GxkV8nTQ0LirXZTRzsjkC9ZQlNJAlzSrh3S2LZw1AILIhVMBt0RUFZQWIkiTKwDAueEG3PbJipuZ4BuhD1XmDY9o3wCK/GAjIArD2IWWzmhVPt8P7Lhzp6NYRszmpsbihug7AgsvxnJEtdpfUeD0qiVbG9QCgptjhbPBy5cdd5mQceaHUyMFkW498SC8LRfv2bM1ItNMhTbjEa
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB4953F5F2A600CC7F1A6F36C3BC780@DM6PR02MB4953.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231254)(944501410)(52105095)(10201501046)(93006095)(93004095)(3002001)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DM6PR02MB4953; BCL:0; PCL:0; RULEID:; SRVR:DM6PR02MB4953; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4953;
	4:9SOdFveEf9slDKAVVsXuXEH9L9iXq8M6PGTe/6dlJETGF+M0CpAJ6whBwgnoZvp/0+hvK8w8XiJEOu0JCSfPtlwK2cfxGDetfJOmVCpjDFVFlSojqxq4HAhq/2+p+6c0ckdn293mkE3NZ95K8FOP80hikwNZNb6VraWcRX8R4/hGYdW0WLiMVaYjyMbd7hlAH1+tSp/nQ/5R4oUU7Yb/IflpVFpmxv4xQ65Zedfx7W9zDePGRVw/5dTIqcpFDSOqHycZyl5O48nBUIs+vW06qVKSETGCQSgx2yusoQ/McMzIQ8b669hc6Sm0VYeu0khv
X-Forefront-PRVS: 070092A9D3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM6PR02MB4953;
	23:Ln81fFK9LAvqo7tCCy57vGRHiAHaYvLMAYoy3MLJP?=
	=?us-ascii?Q?Ht98NEd/cj0HDh9QHF46TvaJuXERmi9S0GY8O+Xnmd0EwibnzaKOe8vONIOl?=
	=?us-ascii?Q?322/yz4da18faik1BQidOGUWYDMpfIJzezbIwVUun2VsB14pqOHvE+JUAQNM?=
	=?us-ascii?Q?svzdWnbWUa5106eHOpywVzadUQBc9A36ftOfl5SeQKabrg2czLCo+g/zFkry?=
	=?us-ascii?Q?/GoO16JyCmm/ry2pABNmf4gy0bKpXpF+UKYaJDEe2H03+5ERpHpYleUkBuF+?=
	=?us-ascii?Q?7aXbnHiuKgjr0wgAXsjmF3ITaFEVixw1lAUUPzx8wuIuoW40yhwvSezUirSG?=
	=?us-ascii?Q?3lAl0EVIGxlTyqe9MqTdt6aFWpBsR9Lw3LK+AUZufA4mvcM///u68cf7mIES?=
	=?us-ascii?Q?GICQ3EsoOM8AsfAzmJJkJ4ffmbHtWe3QPjbRRnySUPMNd5A/XXqWC6LRbeqc?=
	=?us-ascii?Q?rbPF9exPOGsBnrUWsNWUlU8IIcEZEwWA6SZfML53T6Oltoyr2yXV94D5Pk8Q?=
	=?us-ascii?Q?tlA9tELrqOWJsSThsK0/LhwkTlI5YnVIWLNRO79kzbt80VyHI26qyNEZOssM?=
	=?us-ascii?Q?Ebxx1rDFSdhtHUT3YNJmIDfKL/UuD6nbMWjHQs0XDbYFhHtgYm1QeNGLwjEd?=
	=?us-ascii?Q?VDrsCCU4cBTXUkvLMaOrDWgfU0VVVmA2kTBpQfPc9aXa5fmCZZhXlwqV3VWX?=
	=?us-ascii?Q?wXoAb/Dx7e8+YxWIGDBZgoBdLKnu5xUGumYL79YxRMSc9nQXR1va8KhVs/bR?=
	=?us-ascii?Q?yb/82fUenKD/os+ItVzS7RxbzDXFiEZEFcMENbFjJfmF994pmNNfz0j0f/eU?=
	=?us-ascii?Q?gJaKvVd+mBOPi3SMWtDtZ1fC6QofZCRTO+S4dXmNEJmpURzh/XCxJu2/+nwL?=
	=?us-ascii?Q?FWnT4/3DemKgb/RpmxTaJg1flZTkB3AOR7kqyLC19fI3PooLsGxb0P8SggvK?=
	=?us-ascii?Q?kNTF+wpsD5I3dqyNF1OobxRpVQEYe2P6KGa1/Iltxw0bPnECJBGOKw3AAyVN?=
	=?us-ascii?Q?2Hj+yb1ezCiyNZZRHoVcExLVpHpRqsjTB7NQONNtE3RkpLijux24MLrNruEd?=
	=?us-ascii?Q?bqaqmXEdYmVeL4WbOti9zMGWL44Wi55fD5rhipucS3Sq7oaNKagH6l4Wckgx?=
	=?us-ascii?Q?1+U9TxsHb6++ZpGAV9NV21gFxNnEjbnE1kqL7MZa6eJ0MReHRlqRWJQ4s1He?=
	=?us-ascii?Q?6jKsmQvPzRE9QTeEQY7kI7R+UnxeqMCewiwPocZeODtpMj24vDTc6jpOTUJa?=
	=?us-ascii?Q?XUhIQLAn2/1L3WOYJY=3D?=
X-Microsoft-Antispam-Message-Info: GEa8Pg6SsahfCVz0FatqY2uG6pfyKvYvlycA30hfdK3KM17rhYWlBUBZddpyY0nmGi0b1thBBujOMEG3922bfUSkB6+VFw9TjALPTxxZcwNy0sihVqr4qFVEhGFT7I2Y+dy6yZKE7lzhc3gknub2dCL5LNLKPfduiBp+ByOY7+GuXuK0ERLK0X8hLPOAL0Tv
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4953;
	6:5C02HuEFzQGpcQuKqo+YzO8qQVvbUtthVuy+mrUvE8FZHQtHOcuKxeOB0pzi10kFrXu+FuRK2o82TKCN4wWyn1o/Vtz21QJKA9PpoEEagRyIzyui6OiLKm+K3pQmNxGwvkTAg+IUP1HVTfJBOadrSyHGFE3gbOBJtK0wLhnB0Xc04i92/O1DcfaJa5+4QlHIgY2lKP4RzI8maK3iRwioro57B7j7LKZtWo4cQm+5fc5vSLt3/rwFAmFuDVCv04Nok9a/a779tWHf5IqXYxidlXaI9gp7ubFbBfBi+wTh9kNRcDArsWEqHVs8Wbra0T4PvOTu751W2lljyRGmMoukuHRo7ETmU20LE5HP87FrTaTl/vpA+6bB7C0evihlSGwqdR2I0ueGonsC4ygUoEPY4LetN/Mhttl1d8HOXl9tz409AXq+0uHDuuEKpnk0IA5+YlWiith70AkflDB6Aj8zzA==;
	5:90XBydwBSdGAaxn1y1LQALqi4cfJlJrqsKOVCdu+s8v2A8HtwmQhRd3eX7AKfaw/DfjtC84LAtu13pvgJERUntvSxZH0bkvDLcrCQkuEBCCSm+koU7TlBSV2pqhAW+DanwKlO3stD3gjUqM/LcDO94XU7Uw/7WKfvjmlv78fcjM=;
	24:NkSFX2A9uBTnynWngNe/w/Bu+fXhnkbCru7/Plu4O1g1Fk9WnrIw6u2Xgrl87Kr59ik+ndMmfB6i71nc8kGMwtIBXFAPR33OlXHyyL0EwN4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4953;
	7:qLwCHK043zCIH5LUB2Q37EAdCo3hc+HkezNUEEc5Sx+/qQPOSi9nZHKtPandH5t3UruuLnmQzI/CFQLpqfbfDBQVFwMawgwqzt2vQA61CZooToBoWz+LSPLFfdhFhmj2NxwkeRaZaFOaYMWi6MX7aeWPPdrptV1bsybHGZiWPi/neRiHd7twZz8YOtIWD9Fy6DrQkkHorOpKy687TH2dQIWHvPYr1SzKGou0jzw3SsYI3zLPqF18bst8W/HIzoGX
X-MS-Office365-Filtering-Correlation-Id: 442fca00-5324-4218-d114-08d5cf63c3e4
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2018 06:22:53.6807 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 442fca00-5324-4218-d114-08d5cf63c3e4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4953
Subject: [PATCH] matchbox-terminal: Update commitID
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
X-List-Received-Date: Mon, 11 Jun 2018 06:22:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Pull in change which adds support for command line
options (-e and --command) which can be used for
launching programs or running commands in matchbox-terminal
via command line.

Signed-off-by: Devarsh Thakkar <devarsht@xilinx.com>
---
 meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb b=
/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
index 4488191..b7fbee7 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
@@ -10,7 +10,7 @@ DEPENDS =3D "gtk+3 vte"
 SECTION =3D "x11/utils"

 #SRCREV tagged 0.1
-SRCREV =3D "3ad357db2302760b8a8817b5f4478dd87479442f"
+SRCREV =3D "ccbc3c70946b04313c6166ab0dfef21e5e83c289"
 SRC_URI =3D "git://git.yoctoproject.org/${BPN}"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"

--
2.1.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

