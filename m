Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 4869 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 17 Nov 2018 06:27:39 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740089.outbound.protection.outlook.com [40.107.74.89])
	by mail.openembedded.org (Postfix) with ESMTP id 7EBEA6BC15
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 06:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ONTVYWadPcmcUGWqSyCYYTXManmIwR5KYHmwk8xuVMg=;
	b=xAYS0SkoDnSvYOaJ2HJ0YXNUCLhtKr3WMQLPipHc2Vs+xI60wvXHfnUsu3+Lu//2IisNRPfDl/FUhbPUzdJ+3wB5T5WfRsbtvrGArmtzmfE43EdKjII6vkQUGHz16igP2DartaP6lfDDKTcBvLdUeNHoOHA6vChu2SsVcr4Wxkk=
Received: from BL0PR02CA0082.namprd02.prod.outlook.com (2603:10b6:208:51::23)
	by BYAPR02MB4453.namprd02.prod.outlook.com (2603:10b6:a03:57::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.23;
	Fri, 16 Nov 2018 19:32:01 +0000
Received: from CY1NAM02FT063.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::206) by BL0PR02CA0082.outlook.office365.com
	(2603:10b6:208:51::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1339.20 via
	Frontend Transport; Fri, 16 Nov 2018 19:32:00 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT063.mail.protection.outlook.com (10.152.75.161) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Fri, 16 Nov 2018 19:31:58 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gNjqQ-0005vY-0X for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2018 11:31:58 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gNjqK-0006L6-Rt for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2018 11:31:52 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAGJVmvn028906; Fri, 16 Nov 2018 11:31:48 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1gNjqG-0006Kf-LX; Fri, 16 Nov 2018 11:31:48 -0800
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Nov 2018 11:31:46 -0800
Message-ID: <52b03fa019281ff4d937887275e2411f7d31e67f.1542396610.git.alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1542396610.git.alejandr@xilinx.com>
References: <cover.1542396610.git.alejandr@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(346002)(376002)(136003)(2980300002)(438002)(54014002)(189003)(199004)(106466001)(9786002)(316002)(8676002)(16586007)(5660300001)(2351001)(81166006)(81156014)(63266004)(50226002)(126002)(36756003)(446003)(6916009)(8936002)(305945005)(106002)(50466002)(4326008)(107886003)(48376002)(118296001)(478600001)(2906002)(426003)(356004)(47776003)(66574009)(51416003)(186003)(2616005)(36386004)(76176011)(7696005)(336012)(26005)(14444005)(476003)(486006)(77096007)(11346002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4453; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT063;
	1:SXAHYeT3x4o9Zoj74C+BH1Jxv0sggQTDAz/x0/kQJIQbdvkjaxlmYaqokB27oT8jHalsjQ1wgB8KsW8XXhl318hdMxhVGnABKfZh2pyIH818QS06W+aOH/3zO4sZfZfw
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a13b9e7e-e538-4bbf-8060-08d64bfa2d45
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BYAPR02MB4453; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	3:M5fydZbEO2hPn2lGgqlhr41gUGoj1E2DnQOgrGJ9FAQVBWGti5/K+ggN0OByzr0r6TKT/dJayaKbXWzOAo6TyhifHEICW+hz2NEdCJMl5KH4sMgTDPfSNJ1GcgwgyksrwNg1DfABoLHIpK1Zo6lVhhNIfWNRAUDCaMTw2WozhaLZNIF4DIcuQJ+UH9tOUUkBptKDyjSPvjQ0CUSWrFapOl+RdYDb6DazmEzVNm+3kuQ+P+Hk6tHWebBXIm46EauaxQA93ULlLbxn/Ekx62p5hrSw22NqbA4i4DnNiWvfG47sZ4ye6OBr+rQIZBn7lbQFYd9LwDFyecOGRlL8gDZmRd66r6q71qyyy6oxPFGr7JY=;
	25:V3FAW2BuO4CWO6y7FRlbWOKuLU0RJz1CDU6welulnUGpV8PqxC8/88v/fWhjobvGey5MDNzRdKgCxY/6W524sopXmIsBno1SqL+ToD4E5MTPEGNnQrmdjbyHDTgyiQLs7oUptKPXmPlyJtfueZ4egHSJnbn+Wt7dxBbF41H0w4FUV2K5LbLOdfLEDmv8XYmuQTWTt5knALbUuPhL7dy9VZynqH4vTzDrWv+/cSJz2ZSO/c/+FxpmMHjvJLiyh/6lnZXCqe5NK+fLPjN3Tls5WmsWbOgGqEuS1Rp0xBqx0YDa1VR6nt1ObnkLju4SlF7JnydCQvcTgPzjHzzsvGPgUQ==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4453:|BYAPR02MB4453:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	31:A6dsDEVw9/nQMC6cAffgSU3zZcOCK6Is5xl2JB/lXiWLW9Bi+416VWpdFXdXF/qy5mWPA/w5C7Kd/db97Es6UFnkXZwwraL917HsRhv8H43DgbD7gIO7CWi5z/crlyj2snRXdSo1gFY7OmLufTLZIa9ZM5VL5cuGaHLsUVamMBeycq3gdAf1kFIBPukc8ZXwB9YqR5Xa6nYatD1oKCFeQg32kAQRzKBIePwUsb9vIaU=;
	20:YpREZuRO2WwBdBZ0Qz+FDZ0H3KnjrAuDL0adGMbZwstMk/oxRe/s8t+MX4eieBn6TfrIurjQqzD38jdnI9NC/QGLRoifI8Tw4Ip48FnZlAYFFTCg9HcgV/i8rKavvfDzg1u03Soewmt8gKFvYZUjjeVULt7dWtlt4jxrEazCzeBqh0FTmS+daUFv0J8IL1jmrxH3AmAP+hi/VHhsnQB98Z30DL15ItzLcYI5lyPIVd7YPU8C1RsC1xgGQ8aw82J6V7yJ5XuxE2z0acF2Z8xw2GTN6rxGzQjrBvwDB03aAmVmFgsYF7sNzIDi35te3RK9qb6bsS4AO3w9dXffCOWrI76DhhRYHBhhSTKKh7PM21H0c1DymtN+rY3oq8KTLcEzWjRuecjWV2/tBKHumMFl7TvcLnVdwDxcQu3M/CeXgyMO0y1y3lhzSxqwfvJ2QW6VBXYzj3l+DPfugZsj5y4C+fpth0jbr09wNB6YE2B1N0V1XxaNqoasCeULEQkETIvI
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB44539FB4178624AF8A48709CACDD0@BYAPR02MB4453.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(85827821059158)(788757137089); 
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231415)(944501410)(52105112)(93006095)(93004095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:BYAPR02MB4453; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4453; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	4:t9EVxiDYDkAUR9ElI/prI426mm2Qql/vNcFqPO8dmSjI/w0Hqj/sKZF27GBReOZfrFDQCFnmhpydZilPBtfQmJ2HDXA+AkGipXHEqAPB1ah80zmS+ck5JuAFlPM+0oUFzKU/dxFcp3CDAw/XvgLlglVxyVZt9AXKlUgYUy6QhFOurwXJxzahtxzQiabxpVLa6e4Gx2KSzmef9LU0EkAXb+h5FaU+f/BIT/y0+AtAkjF+G1uY4cb2bqOACq3nEWpObP8KaZ5x6lfW8akPFlhGd6RaYZ1aVccjkLhA9a2eZH184rvgXheZ1e/tp2zvLew6++5mpevbtGjMcpgpRSUgeSZoR8R1PQhOKL3e12RDeYZZfVD+R0tFiufDU89ejmXb
X-Forefront-PRVS: 0858FF8026
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB4453;
	23:2SJdYGSsvlTFauYs/i/5iQhScVr18K6kw5CFg1bft?=
	=?us-ascii?Q?tFDKfq3lQxj+dNiMhIJsumyQ31J6/vDxJtFYMd1GvHnWLEwMxcF2g/I5yUo2?=
	=?us-ascii?Q?mU4EKmyHDA9drAWB7rG3LPg4j/eCJqlzYCswj5j7Yd6nqDcd7mCgzDXnL2Nh?=
	=?us-ascii?Q?MTc5kmyaaC1bIUqH1vLbIpkNRQOfobY9X8EVPS70+B5d12cr/1sLS6jovxTb?=
	=?us-ascii?Q?7uASpOH8ELi0TlLoZnxu+KJWrCLvRDaxfsjBD6r7+BB1KNKq+7hPrc2uGtNA?=
	=?us-ascii?Q?ENUS8qr39YRYI6CxEekfUwQVu8zS5F2q24tAcVspyQgbljJtGVyCL+k2zKDv?=
	=?us-ascii?Q?m9f/GkctSYLu0xh/894DL0bF5CVXq8yK/DGMe+cTn4MwR9BksLBCNkaRPkvK?=
	=?us-ascii?Q?042FkOqMtKLoTPcSLLxvGwGQGdXHWL0pG+nKFYjjuNbCuEAMcFMrlb7okOdu?=
	=?us-ascii?Q?phXylUYOUn6jKnIBYpdpD01Vjn2gdgsMvh49Lqmoczm45g/Da6iwb4hFhgCf?=
	=?us-ascii?Q?aLRxMwackqM96Y2MvBga4q2HU/HdxuMa3cq13BoHW87LHPYsCqrP+Q85nIDc?=
	=?us-ascii?Q?NQByc4CGUdaHT0B3ZQlovRwrfEUAVyEMS/Ceh5YA2GI44alD/JLQMbskdnKJ?=
	=?us-ascii?Q?T6CWu2s/YLIutzJbeUzUDeQmamZou6p39VRaU1PhdMtS7IDGH+my236tKApg?=
	=?us-ascii?Q?VQj7qyyJmkg3dp1R3SCxTJd8J5t6V+yOWONcXHhOWWjpOCFaEfqMEXgU6Q8/?=
	=?us-ascii?Q?XtN6L3j2FlFzf/nvs+t5WlfGF7movkgzKsBioozyDynK+bfcbgIZkqMgft1J?=
	=?us-ascii?Q?GzxLzZFH86xBkNyvomzekcv/ngiuhiad4J8bwLZzvqoV2HcMNK8NDYNQeLPc?=
	=?us-ascii?Q?JO39GHYzFUxnVPVUkhNfcP8+WAgJUSrtEf7wbZ6h/P+c5A6CLSYW5UYaf0g5?=
	=?us-ascii?Q?gvZcm0Q1lv1ky93MUjE0RfCcFwjzO1luG/Xa7za2idr7PArO0Lg60JlHfx7O?=
	=?us-ascii?Q?M0n0AHmkV/H2bMRb2AIsZ2vYuviUSQPvPi8tnJ6ssG9huGObB34DwlOFsLXl?=
	=?us-ascii?Q?M/B9sL1nsZLJDuVy4Q0bilqvHOR85LWM04SyaN+jJiE7yoU+OSgK2CYGX4oV?=
	=?us-ascii?Q?iAlcl7AS0VpE5mtbYAYIygsgdTwmJGYr8SaUOXVw77nwFvtJ2C2oA=3D=3D?=
X-Microsoft-Antispam-Message-Info: NVd5i6UhsEpHyx/gwlpI1pn4NDsqdrOHtmcfKw7l/YrVQ/WvT+jKbTI9Z727xo6a5Tn1FHU6lLgZOnfVNYAVFAFreDi0Lmzqs7sKdxH9QqCCKCxNJ0MeovUjjK/qgNC0TMAnw3w1ds2wQr3mLjCfMgs9xF39b/w7e+Q2rtqjD3VDJ7kfty42WynhNTar2B5SC2SgUFOuJxVI1GcOYjwiO/TzSF3jih+I38OaoGWeb+6Vy1Gi8xLJXb6tcZL9q6BlanQsMeySCNmfPlMPeY+RkLzQ3b0DLNYtJl7wYUvHvMUZFPyASJpVmn5Innac71DDA9kKWDEWfXvrKX9EYr9LI0LWv2a3UipeVqhOysK/Ydk=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	6:Ym7jKQPJ0EMmurWERHjXwDY6V5xJCupfkZOS0WP0bgCcQ0Xa/15Cpx9arppDR159Pnb61ebAir6aRJEW4LrHBbIk+iRQ1Kq2VLVmusk7WNJTyMDzait/KJ5xnBLoewNP8DFKZI/CfcbuMz/+dNDplFpvxo6PX1Ix8VWUxtnCvLPblu7CgRKPDSAE7/Tq9UcBqYYR5gWS+2txg3gBJeMGQnB9XAw1Fda3I9TdLeEnvRDZs6CeYUFGm41LTpnb/4oBEFOfmibTOpDU+yPpnvWCmfEsUxJHh+BPjXxmvnoS8p81vAVApAmJQoaxhzdwFRsArA5S40GNXJwkDW5WLfwYV+pQ4L4/8GfkOtEpcelVle6T5wmTw+b7u3GZVJs7bXeRcyVwmGoQ1b7kO7hF6hVeCtTO1YJaMgO0l4dYC+SFkfOcQu5bbel90DhclKy9zy9ZfNNjUoEg7/ojis1jwllFvQ==;
	5:X5RttGSWRnYm3VueAxQLI25ewlwVS769+42z4esXtxdb5itJzNuNjTMILq2VVXxReHehDom/zX/d5PD1f2uHswT6+kIcEYCzEgsqWWu+KHcuZJgg+zr3lIBybcXpR2B3NVpfQ0m2Rmxm+zjyn+vOFcfImN2c1EUyOTKAThR5w6E=;
	7:Q+YEwwXcLkwzTZmlw71yInGWUVAwi/u8RUhD1zVe4E9tqvUzJVPQL0FjuNQHQe9gMjBWnzr639fU/gGeq+qVVO7bUevgBfCbYtuUzLJSZPmBeN7f8pdcZdhr/ybjscDTyf4wMSVFROQO70vQuugfeg==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2018 19:31:58.7628 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a13b9e7e-e538-4bbf-8060-08d64bfa2d45
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4453
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4453;
	23:UUVLa3sKhxYgE0J2FFzRF9k45JMAC0VWOX4l+br1SCoJBKngUDnpqoOwVxu7gV0o0k0hY2CD6lO653/cH/26Bap5maAkoagZXq3mGJ9XPohM+lQUGBoQhtdX0N4juC/KGKn8JIjb1yfb+mVCKQiUyQ==
X-OriginatorOrg: xilinx.com
Subject: [PATCH 2/2] python: Adds instructions to the manifest file
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
X-List-Received-Date: Sat, 17 Nov 2018 06:27:40 -0000
Content-Type: text/plain

While there is a bit of documentation regarding building a new
manifest file for python, it seems that users usually only read
the manifest file.

The manifest file is in JSON format which doesn't allow comments,
hence why instructions were initially put elsewhere.

This patch hacks the call to open the JSON manifest file by using a
marker to trick it into reading only part of the file as the manifest
itself, and keep the other part as comments, which contain instructions
for the user to run the create_manifest task after an upgrade or
when adding a new package.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 .../python/python-native_2.7.15.bb                 |  6 +-
 .../python/python/create_manifest2.py              | 21 ++++-
 .../python/python/python2-manifest.json            | 92 +++++++++++++++++++++-
 meta/recipes-devtools/python/python_2.7.15.bb      |  6 +-
 4 files changed, 118 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native_2.7.15.bb b/meta/recipes-devtools/python/python-native_2.7.15.bb
index 7c491fa..de35104 100644
--- a/meta/recipes-devtools/python/python-native_2.7.15.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.15.bb
@@ -69,7 +69,11 @@ python(){
     import json
     pythondir = d.getVar('THISDIR',True)
     with open(pythondir+'/python/python2-manifest.json') as manifest_file:
-        python_manifest=json.load(manifest_file)
+        manifest_str =  manifest_file.read()
+        json_start = manifest_str.find('# EOC') + 6
+        manifest_file.seek(json_start)
+        manifest_str = manifest_file.read()
+        python_manifest = json.loads(manifest_str)
 
     rprovides = d.getVar('RPROVIDES').split()
 
diff --git a/meta/recipes-devtools/python/python/create_manifest2.py b/meta/recipes-devtools/python/python/create_manifest2.py
index 8799999..b674865 100644
--- a/meta/recipes-devtools/python/python/create_manifest2.py
+++ b/meta/recipes-devtools/python/python/create_manifest2.py
@@ -22,7 +22,7 @@
 #
 #
 # This way we will create a new manifest from the data structure that was built during
-# this process, ont this new manifest each package will contain specifically only
+# this process, on this new manifest each package will contain specifically only
 # what it needs to run.
 #
 # There are some caveats which we try to deal with, such as repeated files on different
@@ -30,7 +30,7 @@
 # Its also important to note that this method only works for python files, and shared
 # libraries. Static libraries, header files and binaries need to be dealt with manually.
 #
-# Author: Alejandro Enedino Hernandez Samaniego "aehs29" <aehs29@gmail.com>
+# Author: Alejandro Enedino Hernandez Samaniego "aehs29" <aehs29 at gmail dot com>
 
 
 import sys
@@ -62,10 +62,21 @@ def isFolder(value):
   else:
     return False
 
+def prepend_comments(comments, json_manifest):
+    with open(json_manifest, 'r+') as manifest:
+        json_contents = manifest.read()
+        manifest.seek(0, 0)
+        manifest.write(comments + json_contents)
+
 # Read existing JSON manifest
 with open('python2-manifest.json') as manifest:
-  old_manifest = json.load(manifest, object_pairs_hook=collections.OrderedDict)
-
+    # The JSON format doesn't allow comments so we hack the call to keep the comments using a marker
+    manifest_str =  manifest.read()
+    json_start = manifest_str.find('# EOC') + 6 # EOC + \n
+    manifest.seek(0)
+    comments = manifest.read(json_start)
+    manifest_str = manifest.read()
+    old_manifest = json.loads(manifest_str, object_pairs_hook=collections.OrderedDict)
 
 # First pass to get core-package functionality, because we base everything on the fact that core is actually working
 # Not exactly the same so it should not be a function
@@ -277,3 +288,5 @@ for key in new_manifest:
 # Create the manifest from the data structure that was built
 with open('python2-manifest.json.new','w') as outfile:
     json.dump(new_manifest,outfile, indent=4)
+
+prepend_comments(comments,'python2-manifest.json.new')
diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index 260fa6f..3d1cf59 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -1,3 +1,93 @@
+# DO NOT (entirely) modify this file manually, please read.
+#
+# IMPORTANT NOTE:
+# Please keep in mind that the create_manifest task relies on the fact the the
+# target and native Python packages are the same, and it also needs to be executed
+# with a fully working native package (with all the PACKAGECONFIGs enabled and all
+# and all the modules should be working, check log.do_compile), otherwise the script
+# will fail to find dependencies correctly, this note is valid either if you are
+# upgrading to a new Python version or adding a new package.
+#
+#
+# If you are adding a new package please follow the next steps:
+#     How to add a new package:
+#     - If a user wants to add a new package all that has to be done is:
+#     Modify the python2-manifest.json file, and add the required file(s) to the FILES list,
+#     fill up the SUMMARY section as well, the script should handle all the rest.
+#
+#     Real example:
+#     We want to add a web browser package, including the file webbrowser.py
+#     which at the moment is on python-misc.
+#     "webbrowser": {
+#         "files": ["${libdir}/python2.7/lib-dynload/webbrowser.py"],
+#         "rdepends": [],
+#         "summary": "Python Web Browser support"}
+#
+#     * Note that the rdepends field was left empty
+#
+#     We run $ bitbake python -c create_manifest and the resulting manifest
+#     should be completed after a few seconds, showing something like:
+#     "webbrowser": {
+#         "files": ["${libdir}/python2.7/webbrowser.py"],
+#         "rdepends": ["core","fcntl","io","pickle","shell","subprocess"],
+#         "summary": "Python Web Browser support"}
+#
+#
+# If you are upgrading Python to a new version please follow the next steps:
+#     After each Python upgrade, the create_manifest task should be executed, because we
+#     don't control what changes on upstream Python, so, some module dependency
+#     might have changed without us realizing it, a certain module can either have
+#     more or less dependencies, or could be depending on a new file that was just
+#     created on the new release and for obvious reasons we wouldn't have it on our
+#     old manifest, all of these issues would cause runtime errors on our system.
+#
+#     - Upgrade both the native and target Python packages to a new version
+#     - Run the create_manifest task for the target Python package as its shown below:
+#
+#     $ bitbake python -c create_manifest
+#
+#     This will automatically replace your manifest file located under the Python directory
+#     with an new one, which contains the new dependencies (if any).
+#
+#     Several things could have gone wrong here, I will try to explain a few:
+#
+#     a) A new file was introduced on this release, e.g. sha3*.so:
+#        The task will check what its needed to import every module, more than one module would
+#        would probably depend on sha3*.so, although only one module should contain it.
+#
+#        After running the task, the new manifest will have the sha3*.so file on more than one
+#        module, you need to manually decide which one of them should get it and delete it from
+#        the others, for example sha3*.so should likely be on ${PN}-crypt.
+#        Once you have deleted from the others you need to run the create_manifest task again,
+#        this will populate the other module's rdepends fields, with ${PN}-crypt and you should be
+#        good to go.
+#
+#     b) The native package wasn't built correctly and its missing a certain module:
+#        As mentioned before, you need to make sure the native package was built with all the modules
+#        because it is used as base to build the manifest file, you need to manually check log.do_compile
+#        since it won't error out the compile function if its only missing a couple of modules.
+#
+#        e.g. missing the _uuid module, log.do_compile would show the following:
+#        Python build finished successfully!
+#        The necessary bits to build these optional modules were not found:
+#        _uuid
+#
+#        What will happen here is that the new manifest would not be aware that the _uuid module exists, so
+#        not only we won't know of any dependencies to it, but also, the _uuid* files will be packaged on
+#        the misc package (which is where any file that doesn't belong anywhere else ends up).
+#
+#        This will eventually cause runtime errors on our system if we don't include the misc package on
+#        on our image, because the _uuid files will be missing.
+#        If we build the _uuid module correctly and run the create_manifest task the _uuid files will be
+#        detected correctly along with its dependencies, and we will get a working manifest.
+#
+#        This is the reason why it is important to make sure we have a fully working native build,
+#        so we can avoid these errors.
+#
+#
+#
+# DO NOT MODIFY THE NEXT LINE!, IT IS USED AS A MARKER FOR THE ACTUAL JSON MANIFEST
+# EOC
 {
     "tests": {
         "summary": "Python test suite", 
@@ -1043,4 +1133,4 @@
             "${libdir}/python2.7/lib-dynload/zlib.so"
         ]
     }
-}
\ No newline at end of file
+}
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index dd969d8..c22c762 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -198,7 +198,11 @@ python(){
     bb.parse.mark_dependency(d, filename)
 
     with open(filename) as manifest_file:
-        python_manifest=json.load(manifest_file, object_pairs_hook=collections.OrderedDict)
+        manifest_str =  manifest_file.read()
+        json_start = manifest_str.find('# EOC') + 6
+        manifest_file.seek(json_start)
+        manifest_str = manifest_file.read()
+        python_manifest = json.loads(manifest_str, object_pairs_hook=collections.OrderedDict)
 
     include_pycs = d.getVar('INCLUDE_PYCS')
 
-- 
2.7.4


