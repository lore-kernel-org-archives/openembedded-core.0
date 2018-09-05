Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 1865 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Sep 2018 07:18:38 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0045.outbound.protection.outlook.com [104.47.34.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8B874D2B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 07:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5H24wfZZAE7lGXOxWyz2jPPclNIclRQ5OQ5y6ufnGv8=;
	b=R1/TmxxQ+QMOUGmgMKQCNmr8xSSMfWolrO8lNJd/zNcc6iQ2ditL3T0rGc4N/HkSs7i9G/1vAq9CK3qlSzLTUG+au/QicoCnBWD/heFyrl5RbHuv3npHQ6NdHSPuRavyKzfKGVkLKfHgCbFCxXQ4Vf/aBSiNZZvKdT10gQkJxYY=
Received: from SN4PR0201CA0067.namprd02.prod.outlook.com
	(2603:10b6:803:20::29) by DM5PR02MB2681.namprd02.prod.outlook.com
	(2603:10b6:3:106::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1101.18;
	Wed, 5 Sep 2018 06:47:32 +0000
Received: from CY1NAM02FT037.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by SN4PR0201CA0067.outlook.office365.com
	(2603:10b6:803:20::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1101.14 via
	Frontend Transport; Wed, 5 Sep 2018 06:47:32 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT037.mail.protection.outlook.com (10.152.75.77) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1101.10
	via Frontend Transport; Wed, 5 Sep 2018 06:47:31 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:44306
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fxRb9-0001ZZ-8E for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2018 23:47:31 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fxRb4-0002DY-4n for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2018 23:47:26 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w856lH8c011951; Tue, 4 Sep 2018 23:47:17 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fxRav-0002CD-N6; Tue, 04 Sep 2018 23:47:17 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Sep 2018 23:45:43 -0700
Message-ID: <30694f3e12e60384249b5f3d650ee566caf6ff02.1536129787.git.alejandr@xilinx.com>
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
	SFS:(10009020)(346002)(376002)(136003)(39860400002)(396003)(2980300002)(438002)(189003)(199004)(76176011)(2906002)(476003)(2616005)(9786002)(50226002)(11346002)(51416003)(8676002)(7696005)(305945005)(36756003)(6916009)(486006)(126002)(6666003)(5660300001)(48376002)(356003)(81166006)(50466002)(81156014)(16586007)(316002)(336012)(106002)(186003)(26005)(8936002)(118296001)(36386004)(106466001)(446003)(2351001)(47776003)(77096007)(426003)(4326008)(478600001)(63266004)(107886003)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB2681; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT037;
	1:CkXu4n7Ha5iDj3TA/HNF/jA8iARJhpeED/9tSR/sFXU7xFoRUc7Qvr+ulQ6l8me5JIZm8wqSOyGmzY+VIdDPBaXzXdDSgshZfeFiXPr342/iUr2tMTXm5twp8N8qinAx
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef73e7ff-45b2-4c25-0673-08d612fb7468
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:DM5PR02MB2681; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2681;
	3:XNl44Vgenk8Cr/fk5Fr3GETJGZ3dafYZwWgoRPosj/KeRwOIhpcTVT/9wbChu8O8+nA4RknU9IBO+Po+P7utpUtMKpMrebuS74E5PX+j2Ko/9mP8t8uw4Iqa3gdiF/EnJI3DB7gG1mhi9ErSr7mj9frEim31Vr3JCDV3nPFQ+bZusCr5qGqajqifNC9wY2doJsgOZ3YpdYeiCqZyDFwq1xmPO0mkDeNhSI7FbGjDdKcMPCv8341jiWsq/TxU22Vx+V0XnMyOxRmvOUrYn8tkRzu4fDrRtGC46zo2Ss8e5l+qxx+cdlBqRIJe93lrkTo9HR8GnRQ8+Mv5oDIWjxGzzdN0YYbaOV79E+TIeUA7cyA=;
	25:tW2zsAUSCxRIc6ZlKKAUwVw1oEd/LkWXdJ/f3pYZVxmVpRJABifb2OIroewryd/G9WBHI/m870C32sQyuKkViB9VwXFG5msxgxglCoNVqh/C92XxCwtvqFRyqohwqo1roNigotVcA1MI/WzN9ZX+tf6nK84dbCNPlws4EE/P+fMUFL0mnbFBOaAHlvl3t2Z+NnSK3whn9yMo69xfzsTEtf6lRyxZXhfSBacW2E1F4Tv7Ynm2fSJ1mXB4b6rywvf75vJ5xj5/GMbb22RNWL2XlQaWFs3f0Dvpv6FNY+y3Lfx/DQi5isS0h6hXVkUnUFr+Be/8n30C5tDtLvMB4k/ZdQ==
X-MS-TrafficTypeDiagnostic: DM5PR02MB2681:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2681;
	31:k3QEY1MLcB1UFfgs1XfbJ6izgV7sIQWnrz4Ol9jtpa0zWH1wz1ZobpjOMnq8yM0VUMUbjqIuVlbV3vMdaTC/UV0sHbibq/cFANGWHwth0BOAj/x0Iz1CHWnzjsMHdMgpE3YkMkW164DPIp0F8ulRtaWL+oDvbrEtEdVsabEJzsM92J4TecdTJrD+KPFFeOUSkXltY6jhPm5tqmgE/gtj4yDvCu+zX+y49FQJFyYhVGQ=;
	20:sth9v89dFxPNAUu6aPEDYTrxqdtDZUwY1FmjuV0wtj/2ne4ZHvcE0wefFUKV1lAfL66nnpFeK0YmlLwIr0/ldDAclQPVL0D6K1zhtOyTwzpvDv18qG5TEtu2itHHSmV31e4EDaa6wTeeg78f9jZOn/rho7szUa5Qq8zFnJIROghnKFE5t6PiRbM4fnmSMhYToW3ShrjqC482p2PiAoqUdfdl65Lh9VKhHZy3+pAJVRt3L8VN4wJGukfsEa1SC/FPx/8pAFaaXLjOfFeNs53xycdrAwTQVFlfQ/rmqH33omgDVpAshAqinYAILYMCiLX+3vdm0G6U8b4byyeEBsAO13Djv4Zx+Qq5abYlcwoJOPjGca0R4FlR0AxmDOSq6lKKb1yBnpIvTYnZps/aHBL6ziMngsEmjqbCUtgTkxhcU82AOFBVWoy7W/0JHjsDZQdJ5gwkLgVHKgear0GRsi+YwqT3zaH6hU/Y9WZk4edjkTq7H/YuEJ39gzTf2+rqBLAn
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR02MB2681B4D98BC3F3BD9E322036AC020@DM5PR02MB2681.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592)(17755550239193); 
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231311)(944501410)(52105095)(93006095)(93004095)(3002001)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201708071742011)(7699016);
	SRVR:DM5PR02MB2681; BCL:0; PCL:0; RULEID:; SRVR:DM5PR02MB2681; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2681;
	4:ONSX0TRbKVTv02+IhnM5qvI18yGFQs3vSY8KepkcZeyUAl600FxS/Xt02lp0GC4bOsMS1lSgK1vlZK5iFLn4WiwjrkGcKox4cduvf/CXK1dsAxjBCbKTIfQ9jJ61+c5XIx5+TJf2huB6RipnmWjI7PoafrLSsftWYIKrCiOHiuPzD+B7Lz3AakMd2J6UvHJ7P5ZYVVXHIUxWh15iyqmPIKR9wW2JlgojNZWFPvihvtR40zMfFAbyDWzQ8GmRheOGHAkzSzDxDNKglibr4uQhoimkUdbeSLqOhKwv8Cx941BMt57g/pJfVLDf11jJFjcuqEZEuMyXqGk8f8lcUb7ipUoxHNWyabAvq0RuRYfndLRoq10I5s1SGIj/B3j8jtBu
X-Forefront-PRVS: 078693968A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB2681;
	23:pBpCzXwfCTej69XhkedgZ+cA0ukt29OVodASHxW8w?=
	=?us-ascii?Q?xUaXc9Ds6Jutv5ucBq8ZIT1Y6X5Secpr29wvsbzyuPoronzuEZCYHfQm3ECW?=
	=?us-ascii?Q?94FgS9ZkkYllmKM351thOcbfRGCCFZCUcfurQvgAUTYW0CFBHwMoNvgv33fu?=
	=?us-ascii?Q?mDHRNdIrV56Sm6IlmBiNIaZTFf/BBTY2GHVhc/0nmlL8lOGy4FYjiBUj7ebs?=
	=?us-ascii?Q?HE0WhSoJyA9kRPjQ7Lt6Ab3NnbQT1zD/8CrH730rl/dtipzR3P2OpoDs12Ph?=
	=?us-ascii?Q?Wqe53zGrdxCqxJI4p98m/ZWInWq9ID+Rk7enE/KQOP2FaRPCSDYEUZgiXGaL?=
	=?us-ascii?Q?kcQztDoDQLsAB6hMAMrHQHRDpSTO6HpAqKaogn/Qku9Z3cnGNBBR8/aD2HJY?=
	=?us-ascii?Q?uixhle4jkzNH5SA1hcDSC3HPWBQFIhvCvQfNYTZJkx5z8C0NmlTF7cmt1VKb?=
	=?us-ascii?Q?M3rROZV1zcMn9DTSNU2eIhJBtEqfkoGTJ3Q73S0rWE7rVmaXUQAf1ap5ajkX?=
	=?us-ascii?Q?cA8+LyxUlSsxS+rS4SdctW4otAeJIywhZ8Ygltr64N65FMWPaZlXqp7rAzrG?=
	=?us-ascii?Q?kOBECUGpGGNO9Z9kkqMmCTPzr47WWTyPuMpqf0wb1n9x48MzFIocVvm+wxK8?=
	=?us-ascii?Q?xa8iCSILIfZ//4aisCxJM/DHQkBBxE9oPcGFQu6dTVQoN1uTV0xYeFa0fMPG?=
	=?us-ascii?Q?fh5lDTNbIJHRRUAwkArQPUiMOzC0GXvt5Iqj9EXrcNzGM9F1RhoZmRZJqeJb?=
	=?us-ascii?Q?LXJQNSJNxkcLIawc7sNDLdkZLpQd74WxRRvpoEx/kGCijB0wfybwkXQ/LySz?=
	=?us-ascii?Q?qttIw5NW9PTmaKXxlLJuBoEylouUWBTlhP29ZAWICiMqm6TdnHSPabpq6ZCK?=
	=?us-ascii?Q?DulvWjxLFSOe9TORwoXLjwCIC0rxkJj9z5KMhnw8PUUQeGviNnNHMXBB5ooj?=
	=?us-ascii?Q?cJ3NQJZ7pb2rIU9sY9Djpdcl3ObrDRd005tubmIm3bpGAkVTEXefq6DH7Q0H?=
	=?us-ascii?Q?25oeX3C6oNaHhb0y+snMGWvB/1Xu6h+UhKt8DX1NBE4VXJ7haAVQYTetW+Xq?=
	=?us-ascii?Q?v7baGloAwtD0vfizUEpWHxwY8t0yTuajnxvm4KrmLZ8az/tABf5p91qYsfY/?=
	=?us-ascii?Q?g4rh1BqVkzE++hplOqu/ShVXPbnk96iRQF3MOsJYvlqshMY5SieVQ=3D=3D?=
X-Microsoft-Antispam-Message-Info: A75r4R6W1Xi4CAjSmg8gml/kSZQlPxHx9uPmM1ViUx5d7wUpBPaIAQGCdHu3/pTbGNcZ69ZUepCjFAhzSX5Q2rv3yC4r6ftpX//tniceSjaRr+JJNlvhhblc4sDSkcjYQgTaBhDleoShnuVezlsyTT1aXFReY4dy2GMLruQTgrjeNIpc1hXHYewDjDYlEhAxxwvmZuOtJ3KPZvK5Nd4XBktUIyCPRcqZu4XNWvB1AHtRjHZWYh7JQgc5vkj8N1Y8+eqf9Hk0a8zfSIulppq7JpPrFvheQ4Y6FIDqzCkHo+XHbDazKzQWWDcYf3K7GPiYefGJ5eRKWqGqVn7lItiIlIkpWwXhRBDiwC2/fkTyXaE=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2681;
	6:7yJIUbiYxAaja5ZzGWYdUBZqvyqg6/1iuFtMWbBbFWepOvbQVHXUcjDpeygxEumqhZeQkWsThRHIsmxLs1SP2Bsr9lkGhtYsEGzgnmGxuPwcryj7SYNNeYyJLE/dRNGfpXTcbQk4f0/hTWHze9Kclerf5UiUo9ve43W4iThh+amGdG3GVS3z6dOa0DqTS1+Gw90fyfzVIC38aibxoMxc8fXCfv1WWhGwvv7zPAymKxenN9KWkSCc4/2pOC0M8kP9YfHhDWhO1DMnYwxG6doY5e/LvUMi6UghVb5RIadXVfj3CQlMu6a5S9cBTDLOU1GDhwU6bxAZkj8xAV3awiofnhAM2f1CaAvsLSypAbziGzcrojTgQvCl86zgd26B5c4G+f0kJSBb6reaaMFYVMzAHWL0Hsh5x41xcXT0NuLuz62k1fgxou+4B19hcAbITPltrzNop14GlUAeTsf0Eq0sGQ==;
	5:j5BUwNhCzIlbZ9Pr2YJsbC7wVWL2GgUO8QVb8iul6PlGcNNp1oHpjIZ+L8DbQ2kSm+ffL+jGOQENWgGDkWwr3SdMYcuBQyTPbGnkHaVAHnbD44NAeYSttogHtf+4fRwJmEISh/zTMz4bngw/eGyh4irVsMh8zuQ4OasuaJVc/eY=;
	7:LP/iunTh/LTazN9I5YUNXYKrrvUpDhpLWUc9QuxFO7w29plzzSsaKjwvxAdVSFch60T2kDDxulEy0z+V0iZqTgXpBlniKiHwVnvqXtBdpRA1lZ0fgK7gENHZfAduJ7ul/gF7jBCNheIeA+7Q+iI724Ar06uTDLdYgef0VYNrfM0sshzIL746Ar4aJS8Nq8ovQD+qVWZWubNkFNWsG+1OfIR+g7kbfXTWTRaal1E2sPzXJ0SgzlsX2kJdFPJWXz47
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2018 06:47:31.6694 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef73e7ff-45b2-4c25-0673-08d612fb7468
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2681
Subject: [PATCH 2/4] python3: Modify create_manifest to make it versionless
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
X-List-Received-Date: Wed, 05 Sep 2018 07:18:38 -0000
Content-Type: text/plain

This patch improves the create_manifest script by making it
use PYTHON_MAJMIN instead of hard coded paths containing the
version number when looking at the necessary modules for
every package, the script should now be independent of the
python(3) version on which were working

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/recipes-devtools/python/python3/create_manifest3.py | 10 +++++++++-
 meta/recipes-devtools/python/python3_3.5.5.bb            |  2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
index 2f944f9..41a6bb0 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -44,6 +44,9 @@ import subprocess
 import json
 import os
 
+# Get python version from ${PYTHON_MAJMIN}
+pyversion = str(sys.argv[1])
+
 # Hack to get native python search path (for folders), not fond of it but it works for now
 pivot='recipe-sysroot-native'
 for p in sys.path:
@@ -62,6 +65,7 @@ hasfolders=[]
 allfolders=[]
 
 def isFolder(value):
+  value = value.replace('${PYTHON_MAJMIN}',pyversion)
   if os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib')) or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib64')) or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib32')):
     return True
   else:
@@ -85,6 +89,7 @@ print ('Getting dependencies for package: core')
 # Special call to check for core package
 output = subprocess.check_output([sys.executable, 'get_module_deps3.py', 'python-core-package']).decode('utf8')
 for item in output.split():
+    item = item.replace(pyversion,'${PYTHON_MAJMIN}')
     # We append it so it doesnt hurt what we currently have:
     if isCached(item):
         if item not in old_manifest['core']['cached']:
@@ -98,6 +103,7 @@ for item in output.split():
             old_manifest['core']['files'].append(item)
 
 for value in old_manifest['core']['files']:
+  value = value.replace(pyversion,'${PYTHON_MAJMIN}')
   # Ignore folders, since we don't import those, difficult to handle multilib
   if isFolder(value):
     # Pass it directly
@@ -131,6 +137,8 @@ for value in old_manifest['core']['files']:
   print ('The following dependencies were found for module %s:\n' % value)
   print (output)
   for item in output.split():
+    item = item.replace(pyversion,'${PYTHON_MAJMIN}')
+
     # We append it so it doesnt hurt what we currently have:
     if isCached(item):
         if item not in old_manifest['core']['cached']:
@@ -250,6 +258,7 @@ for key in old_manifest:
             #   is folder_string inside path/folder1/folder2/filename?, 
             #   Yes, it works, but we waste a couple of milliseconds.
 
+            item = item.replace(pyversion,'${PYTHON_MAJMIN}')
             inFolders=False
             for folder in allfolders:
                 if folder in item:
@@ -265,7 +274,6 @@ for key in old_manifest:
                                     folderFound = True
                                     if keyfolder not in new_manifest[key]['rdepends'] and keyfolder != key:
                                         new_manifest[key]['rdepends'].append(keyfolder)
-                                    
                         else:
                             break
 
diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index bfe91fb..8223160 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -334,7 +334,7 @@ do_create_manifest() {
 
     cd ${WORKDIR}
     # This needs to be executed by python-native and NOT by HOST's python
-    nativepython3 create_manifest3.py
+    nativepython3 create_manifest3.py ${PYTHON_MAJMIN}
     cp python3-manifest.json.new ${THISDIR}/python3/python3-manifest.json
 }
 
-- 
2.7.4


