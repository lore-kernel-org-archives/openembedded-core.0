Return-Path: <BSREEKAN@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0040.outbound.protection.outlook.com
	[104.47.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id 8913E78924
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 20:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=JZiePjCVIwKFsh5UO/+epTOIHKdlt+KCPrmxM83qp2Y=;
	b=RgClcEU/kGdVHTr+ISUtvxAV26fl+V0cKlbuskbGfRJg50wqmXkLg0Wi0wjjWroOzhW1E33xBUGlwZEfr9u7fn4DEUdWQnDNdbW1c+/jOijqj0QOCWEIHZUaDSPeZyQdTDsoBHokNbSXN0i2xVT2lDjoG9ig38RWLh2R6NrpIC0=
Received: from MWHPR02CA0058.namprd02.prod.outlook.com (2603:10b6:301:60::47)
	by BY2PR02MB1297.namprd02.prod.outlook.com (2a01:111:e400:5854::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.609.10;
	Tue, 20 Mar 2018 20:25:43 +0000
Received: from SN1NAM02FT025.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by MWHPR02CA0058.outlook.office365.com
	(2603:10b6:301:60::47) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.588.14 via
	Frontend Transport; Tue, 20 Mar 2018 20:25:36 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; linuxfoundation.org;
	dkim=none (message not signed)
	header.d=none;linuxfoundation.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT025.mail.protection.outlook.com (10.152.72.87) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.567.18
	via Frontend Transport; Tue, 20 Mar 2018 20:25:36 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:60704
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eyNpA-0007SB-3n; Tue, 20 Mar 2018 13:25:36 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eyNp5-0003QN-0w; Tue, 20 Mar 2018 13:25:31 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w2KKPRvL009234; Tue, 20 Mar 2018 13:25:28 -0700
Received: from [172.19.3.10] (helo=xsjbsreekan50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eyNp1-0003P7-T8; Tue, 20 Mar 2018 13:25:27 -0700
From: Bhargava Sreekantappa Gayathri
	<bhargava.sreekantappa-gayathri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <manjukum@xilinx.com>
Date: Tue, 20 Mar 2018 13:25:19 -0700
Message-ID: <1521577519-32315-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(396003)(39380400002)(376002)(2980300002)(438002)(189003)(199004)(36756003)(1857600001)(186003)(63266004)(336012)(77096007)(26005)(106466001)(59450400001)(51416003)(7696005)(54906003)(106002)(107886003)(4326008)(478600001)(50466002)(48376002)(9786002)(2906002)(316002)(110136005)(72206003)(81166006)(8676002)(6636002)(6666003)(47776003)(305945005)(356003)(8936002)(5660300001)(36386004)(81156014)(50226002)(8746002)(5890100001)(426003)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1297; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT025;
	1:bIX7tnmJsB/tDX6yOJoqPwjzbJ99Amu5tNVOywZ0z5QWJrYmyEqZy6ovQ/OleLJwspVvuJdXRH0eLl1EMhWRqYrjELe89Pelxc6egMegGJ8kcw8Vg3gF1jm063bGXrDy
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e9d7883-5c15-481e-42d3-08d58ea0bd80
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:BY2PR02MB1297; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1297;
	3:kDE/LK1dcheiUQXAyCJfLxq5W8Pn3+pkjYgLIB9AON00VVCLKo/CUUm5Rj4ITamICKPyJXNGHlUyRl1sFCALOPDMmqXjW00xGxtcSBLkTk/pOJpHJFnnfLa25lsQhgCKYc5UsyEgS9r0To6sIMRTcXEN1tVqhZv1yYSoUyoAHpHCCGc2AMDZPIR5sd0kvMr2QqN0NXTatMN/6cbuU9CUcT31bNEXc8iE0fP23590NfaEa1rPfutBDEnqIfLrBABFu38pfGY+Qh6DLl4rqqZ7zCLHRJzpW6q60Ieb7gQcYk7IIE8v1tnR0jk4MmGYLVkAeF1dvYK9NNlRGVQzlgOmRU5bbsahw6PN7ydy7TQqwJo=;
	25:Q4mmf3fXfLDVNmR6TbgvjcQYHfhhlXzrloqY+3qpIqv/BaCXuAzFrXMj/++xkAYhnj5uf7y30yJAW18noz/tMmbW03HwqAYJjjbS7ndjoD80qZmjIj9zUOAry+5bCKLgEQW9yH+2v+3CczTic6+b0Ctk5+8XZzsU3RtHvL34psRmh/Ugg4/jlOybg2qLAA0VB+1lHUcatx8abaO1I3lHOSVphF1PrtUHZrXHyv0F+yMwHgEafYzSWDoc9OIMNlvp8Rvo1oZyEDBP1TMDXxRUIOX32BOegG18ZLr7an1P7HqWqkJhQ17sssLAMJSMWLqSWgIvedsvPFETTXnYbunkGQ==
X-MS-TrafficTypeDiagnostic: BY2PR02MB1297:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1297;
	31:TXKYYmTXQhFWmIGdsdUDxDtgAjtL3V7SWwg4FDU59CgNHoHS5VnQh1/+D00ImwsvMR+3C9QSNyCKbmILj8DWeFuI22uPVn/FC654fpLuk6LyJJvrHnZymZx46wLa7un4yyU3aLQVsGIlCWoGqEsvhPmWQTUAEATAB3n9VByWc5uITmUiEbiVj0RjVwlWgw0gSXGRBeVz0HVN+F8NhabM0T4KDBGY+0yN6dKpVyXOzLM=;
	20:qabnsK3yxV73eIRxLoTIkHoIO/VS7+QzHYyc6HbUP2acUY2rpwjFBK2h2PeB80y3SOdgAydcjiA8PELoEWSxH7yKUbucAGGgdk0yk3vD/q0ppe8hE4hu+8eC92flSQ1Mo4mMxcaoBsWT89aM7gNl6lZz/uit0Oge+ASLmM/PU7xAYvP367VKiyEaGBLUuE/QiVavEKfgXPHYidDXL1H7C1Esu5Cadxc9pD8opfccCwTw9D8cMNdWLsk49d2ZUVPusfngSipesONwD8eSSJjiHLtCcTeOJ9j6yWNiTLT3ItPV/KbFenLDRtLOHipIas+v+ytU95ld1Pktq3ABRECxTjrrqjwstRzj+wIGjEcXHB33OgS+SziVFd7q/vuY81ltF6xdeYUwMJ8HnsrJPcekouVBbFUJY4Cr1KnoNjn9WNssL1lmsQn8c4KrK5x5UZeuUxMCbEYQU+Dw6VhbhZzw/miw0QnODcawRRSDxQ5eDy2jqkLxLz5KVF5R8brqsXOT
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB129724A07D83C33D560029CAB0AB0@BY2PR02MB1297.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(3231221)(944501315)(52105095)(10201501046)(3002001)(6055026)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123562045)(6072148)(201708071742011);
	SRVR:BY2PR02MB1297; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB1297; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1297;
	4:Ad8OY9ZOdmCFXkK/Un4u6NVSZ8ojFgb310m9Wc8sTxZFSCCjxlYPjvJuoHKNnEXP3kfzROApoetun6IDTVDNv0HsBn99R4vPmiy2y/pPPmb7lejMsAuldq0jeb80Gr9KHXmsl7iGeBk9AS/GDZ9WJE+oAEv9mx2o5G1P4kBy6d0leI3/ulQeefoqLuObcRF7FSWPnM7FFgTS8h8Fp1HriyHkP2DEk8DFplOxEsdSqHGmm9IYwiehni9qR+MeMy7uD2E7quS8R0djrjwD33NQDM5CxwEsJEv33W+A+nZjU6rkeLRuo+ddAA9nwra3SJE3
X-Forefront-PRVS: 061725F016
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB1297;
	23:EbZ1rbsVEDR13Rts5Y4/CakROquQoNXa2xT6In9uS?=
	=?us-ascii?Q?06brIlG1Ay/JPaWbIJ4gn/rbqic5zmi+Z2/eBgTlEJCrDoujYtfCJdZhqTrO?=
	=?us-ascii?Q?LF8+rT5+jknslSMaTd50+y/FpyFgUmcW1QUvXq0T+CLkS2HB9a2/J4wRxwST?=
	=?us-ascii?Q?jy9UkRhj3u3PfQz2t74ZDQ+L+P7QBz8Dtu0Q1Zav8NuNvYmwZQTmoENuSkor?=
	=?us-ascii?Q?fas3b6YxXHAdjzoKiJ8zxduzkMFApn7zxfCAoxN/nYBq8n7uTDArARH/vu0s?=
	=?us-ascii?Q?FaXsafJWuj0LOsbSearznLAL+WYa6ibgRnqm6/E2Twf4syv+LAz1tISk96eK?=
	=?us-ascii?Q?MuggT38T5AY4cNPEfEeQ8+8I49Jw0GqQZHgoRZrL//mP7y/we4Jk4zrvOAiS?=
	=?us-ascii?Q?NdPWtHJtCZMusTD+g20oZYrDYj/jwd8jn04b4Uw5eM7c/HAsYNCiSvIwe3Xj?=
	=?us-ascii?Q?zIHx+RTwcoBFLONWSjAnWtpctVettyV/79jVMp56TjpLm3LFOJwCwiwnA5Rg?=
	=?us-ascii?Q?/jnLdrJ/ncTWbvPXzUPteMgI749QiDF4PYsLsbdADp+jJbKeG6YF17MJf1zI?=
	=?us-ascii?Q?PIoSamEJkgYUvopcTxQEP5oeP+aadG0xHig1CfUKHvLcaSe7L+qUSbNlEhWB?=
	=?us-ascii?Q?Om8t4fY/4dExwfPrpVvWgvz0d1s/IecZRL+Nk69xKrvFkjj3p64MYwQoq3j8?=
	=?us-ascii?Q?IwWek7QEtS/fSWnZKs+Qc3hgaQaL9Hqfmylp0+ceiOtJOXh8rPiXCS2dSE3p?=
	=?us-ascii?Q?/UY5y0HY+a7+5yu5/3lF/vB+SFm4BN6bHT5NnYZF+v5n+nLmkSkCiwN6hgOB?=
	=?us-ascii?Q?3aP8qc+Vzsa5F1BU5Lsb/2HPAJd0EZCXPjhhRu4mPSgT4uAOUgSpbTFvuOe+?=
	=?us-ascii?Q?67FPtfQU07GoDLoFSsPUNyAnLCFRCKpCD+bK0xZJay95izTjlzlWx8ljmZ2j?=
	=?us-ascii?Q?dfbFVYKWsMfs4Gy6vEa2Uc0um2NUNAFukr1TeNIb3VtTuc0psWiXbm73t9Io?=
	=?us-ascii?Q?ppnptvy1kJ8BMHyDmg8vKUsukEW9SULbYrFEFz3NXuiRIq9LEJPRtTv+QwYu?=
	=?us-ascii?Q?1nb6OdSdNrky2mhQID1xYYbCPgJ7ycJNBir04bMrXUPJ/5OBw1q1SpNgXhmR?=
	=?us-ascii?Q?8eQxenwfQ9PCl1BrLoqgeORfVW6jTAr?=
X-Microsoft-Antispam-Message-Info: SnixbnB2fH+UaXwE4S+DcCyzT3adVgZ9GRRMCPdfc8/BXnvENzasygVzJP4wRNq07MSXaDWZ7Q8MQQBDxwStVbOk/n6XIywZV2rRHqf7YvwX9QVaJnorGG7tV2WpT8P9yo1DUpuyW5MU9BOoap9h/xa9VbzD95wBAsdKv6OJ4JnWRf9eS7xtgcUrtMRmqUzx
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1297;
	6:b8IxBtRsG1UIZBJUDw8CTxR4fgtejfyPSBTfhdEXqOQBaj10b8dVD4LZ0EeUeOTyTMOpEGTjn8Kv7lmzsH2bnSA7bW13Zhy5TOL57zvNih8UYw68WJ8737SyjjWW/k+XHspdLEaqFRnMfqJTt1sbxyVCSISAPDpaQkBGlPf/yB6nvx0kN7it6lsljigbd1l6HWLAa0YSbO4JBg5TszYkPpRS/nkWTDP4Qt33/z6rGqp7XNCKwb1oIlnIqHVdEmPoYQYM3tkPfTgnjIT21QzZAlGP+vCA7/huEUxKgOxVPeinjxTCGOoHizRuxxXYgz6lEa4tO3J4tJ2jRGSqy3qSyLDLjhIBLkm8vlTKCGApTkhw+n3nLbLzjLU56zzk2MCmAeOGMs0IV20JVTDmtReXaAJRz1U/MYuJ//RM46rmNLSPzINqXqo7EUl9fSZJEVB+Nr9ob76i6nJePchlfvfJIw==;
	5:Tp3O+tOn7YuOkGguPGHVl8qvDw2JI6pULu5qrp0lGuHxhd+0Ctboblv6GE65ZtAoNNjAg1qubEX69YGzEtNp75KyCr384+wR1eRnuyCN85Wc6tR0xAb8K/y+mu4lZsjvjOH/UGBzLO5XVvEogDvS+TsPMSjkadJXAZor2vr0Iag=;
	24:ttfJOadwXy9lo+2PMWnMsFAyVYzhIwLRVcsWvl9EF4Nb1FMbn98h2dC3xKZSaIvkZbqn74iBMp2xpRFvstkigWg0nRlKEuOEOgDgwEfhdpw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1297;
	7:jInm0Xx3toyBMq3cPZhQ8Mp/hU1DSGbbH9ZuDEJ9S2IRlEPseak3dAjnwcl4Kdzl80VhhHvMiq6/HSGNMoIKXOVf7h4liSa01cMHw3nYDDteu2sS4qipS6o4YCD2eEJ9zjDmWFjtC/M36WA8QXLri75rYEC0AHX9Y9BgZQ85/PMl6xPkYEFZ6wjf2EUtEzWS3pU4E9mknOy7M5ZC5DzzNFskhEK/BuOgcF4LQHMs2WZcxM7iCTY/JiGlTd6r52tS
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2018 20:25:36.6754 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9d7883-5c15-481e-42d3-08d58ea0bd80
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1297
Cc: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
Subject: [PATCH] wget.py: handle BBFetchException
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
X-List-Received-Date: Tue, 20 Mar 2018 20:25:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

When BB_NO_NETWORK is set to 1 and the first mirror url needs network
access, then bitbake will just fail and report error instead of going
through the list of mirror urls. This is because BBFetchException is not
handled when wget is called.

This patch calls wget with a except blocks which returns to the previous
function instead of failing immediately.

Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayath=
ri@xilinx.com>
Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 bitbake/lib/bb/fetch2/wget.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget.py
index 7c49c2b..95970d1 100644
--- a/bitbake/lib/bb/fetch2/wget.py
+++ b/bitbake/lib/bb/fetch2/wget.py
@@ -118,7 +118,12 @@ class Wget(FetchMethod):
         else:
             fetchcmd +=3D d.expand(" -P ${DL_DIR} '%s'" % uri)

-        self._runwget(ud, d, fetchcmd, False)
+        try:
+
+            self._runwget(ud, d, fetchcmd, False)
+        except bb.fetch2.BBFetchException:
+            return False
+

         # Sanity check since wget can pretend it succeed when it didn't
         # Also, this used to happen if sourceforge sent us to the mirror p=
age
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

