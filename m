Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 21561 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 06 Jan 2019 07:49:05 UTC
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr700066.outbound.protection.outlook.com [40.107.70.66])
	by mail.openembedded.org (Postfix) with ESMTP id B64CA6C3AD
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Jan 2019 07:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4sqjfmgqM8a0TLxe7dyAZFHu+aNEmSF1+Sc8I2AM0V4=;
	b=jYcMjCcF8uVb8wXHA4sDoz67uiBQ0+ed60cImr31RH2fMeEUZzRgDkZMpNEX2bnuuXrxcMlFE/IniOvxt6LLcVMzph4Qj5USelXE+17Tv8Mkr25zEVs+EEzw6Jr0GHxdHnshBCdaHizcyJP5LRsIOBRvepaVz8xtPpTiEb5mKFQ=
Received: from BYAPR02CA0015.namprd02.prod.outlook.com (2603:10b6:a02:ee::28)
	by BN7PR02MB5218.namprd02.prod.outlook.com (2603:10b6:408:2a::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1495.6;
	Sat, 5 Jan 2019 21:18:37 +0000
Received: from CY1NAM02FT010.eop-nam02.prod.protection.outlook.com
	(104.47.37.52) by BYAPR02CA0015.outlook.office365.com (52.135.206.28)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1495.6 via
	Frontend Transport; Sat, 5 Jan 2019 21:18:36 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT010.mail.protection.outlook.com (10.152.75.50) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1471.13
	via Frontend Transport; Sat, 5 Jan 2019 21:18:35 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:46154
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gftL0-0001hw-AF for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2019 13:18:34 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gftKv-0001r6-6n for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2019 13:18:29 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x05LINbg025648; Sat, 5 Jan 2019 13:18:23 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1gftKp-0001q2-MX; Sat, 05 Jan 2019 13:18:23 -0800
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 5 Jan 2019 13:18:22 -0800
Message-ID: <1546723102-28031-1-git-send-email-alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(189003)(199004)(107886003)(5660300001)(336012)(50226002)(4326008)(106002)(8676002)(81156014)(81166006)(47776003)(8936002)(6916009)(16586007)(316002)(51416003)(36386004)(7696005)(426003)(9786002)(305945005)(2906002)(63266004)(2351001)(106466001)(478600001)(356004)(36756003)(186003)(486006)(2616005)(476003)(50466002)(77096007)(126002)(48376002)(26005)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR02MB5218; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT010;
	1:AFni0OBpCI7OtGdsuqAsckaiPBsojzM7dGslt1CbmQA+4sO2YJdIKdLv+US4FqCjKl5+Sran6zczjunS73ompRnguOuNiNUhYhmQsX6Ij9If4bFk0J+lAFHYVnJC7VAh
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29898afb-91ee-40f0-ff88-08d673535a57
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:BN7PR02MB5218; 
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB5218;
	3:/7jmknic4Cc5INeJ4LVY2c3kuenG4+TxAMJ0x+bu47csWWD0dSZIlcce0namiWSL+ziIEAGbr9tPLmEysGdQRKAdJ8QyxZO0DlZb9vM56HMzhGsPZat8SYTBcVVxqU6quawzfhiyb5O+9lge9xECfy8WQHHvwd7gvgmpatjALu4it8CO0PBIorr6n7hNZoBbN2CCHnpOcd9g0dkppioroNuHVvazWvTT9bv92oq3t2dh7h1JFvSHIX+N7do0V7lwOdVq/Fxu04yTyRJ/9/66N1ELXd7W2/sIh7gmI/PR66uKd65/Y7MmPTETJ/+akrwijWytcLipz2mlUMfc0c9TwnTO7jl59Ouxk4z/u7kCCty0dzTtpLamN/iWrLcQAHLu;
	25:dPDs6eMSYPdEkPmyz/jaiTdLQWQV1OuVjaW80HLwY24wewtk6OpphO+xfp+OfxNGBtSdiveTd0xp+j+5VVepciNeKBwgOdeSWwDHi9+8vflZeHrhJtGGiLLW168hTQ2UPrk+WPUhfOcN3IUzmXRmEW7kIrIvmFF4r4de/kT30csuN3jWy1/0MLAlvWiIzNpdPdWLyb3XyNGRc1UvJVc0MWNViwGhLW+U80LMyYyoLx8yyxh9NDkSGJoYFAqbtXigOiPJZaw5jqVka5r3a5E3r6XqvZjdBMpuqVyO7Snxq1YdW5D92A7X6Y/JGANAVQ/c86YKfEcPDGUEPIsR8Kc+HA==
X-MS-TrafficTypeDiagnostic: BN7PR02MB5218:
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB5218;
	31:y76qRI1QLGtfSrpU22Ziu8wdXV0sIITXjb76vRErVah1nmldBWJ8zr/LdcrHYAltJJbWkUIiwd6DQcepUIJHymur8fuZ6idDXT7UHuLFSQaFr19qHmpEsRkBRt4qHj67QMS0RBSi8bFih1Hs0Y/YnL7xcBDuI2jh1lQeHF+N96a+4MJ7Af27thPTlxf51MlzIu2uwN+1k8z1nEWyEPfW+c3qPs+806tFDZemO0m9ek8=;
	20:u7nYH9/f7ihdxf5mrLR9WLyac0h7FPqSriAV8Y6+Pid1YH8+Us9lIpOKsg8yPFDe2Dk6VooUYSavLPKrl4VinFQJpzFHYdtMegXjtuDB0JEIFW54bJ8FjTE3z8i4uRzAsZcewktMjBcMHPaU95Bg1FSALCZNJLPF0yA5xHzqGkQnXqC7i9rXd+Mi2ysYXSB8rebcXPUH4pYOencSe09xG0p5B6+doA/EeYBZ6DCfteO5qBRyEHtdkcZe1wcP1zzUKb+9jfvYOUgjI27DdIXXQONts/guS+gTUXAGoczGjpyWUtw8hmoXamZsHbEZGXJeNMwNvxueXssWtcVSrfmoI5QAI+wIlQ5su/tPVVM1/hDZ2rLbcLkihVkjK1uAKgX5iiCrxFgCpBkrquVSFEDItfoMRw6Lhl8qqQ5k4vam9NKE8GlIweosOgCxsgVVDQBsy4YZFcXROlJMr6rpFtrvNgpMZv0gNueWVPO71zyZ5f7upKjsfFeSXVmiHlhvFg/e
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN7PR02MB521887A6AB80A3EBFCF274FEAC8F0@BN7PR02MB5218.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(3231475)(944501520)(52105112)(3002001)(10201501046)(93006095)(93004095)(6055026)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:BN7PR02MB5218; BCL:0; PCL:0; RULEID:; SRVR:BN7PR02MB5218; 
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB5218;
	4:2EAKpTUug6DG1yY9WL2QDfZcn1/tgINQ8PEAj91vYFkjpjtxb/NQ3hGqoBHJa7paKBlc/6wxIO9gcTSdV0s60ZzGbKxWCXW13J7xUQ+vUEO7DFtzkNRoUJnKdnQsg5WjR7+gr2QtChFR2OsbWuMTqlrE2/xXRwnyFd6sIogMWNG0wKdOof2XbYKbI576xMTx84bkrIdIT2Fksa8CUeRFr3CY+a8XhAdSHU1wz+VPcYEJts1zRvbTBeMatOmqGdoyXyGtEjBCrwqRg+RRND5TDTb7MePNTq7ypNd/sNgF/YU=
X-Forefront-PRVS: 09086FB5C5
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN7PR02MB5218;
	23:dFM+0b66Rg7+WRA2WHMYA/vgcSovQh6rKs2muMc1q?=
	=?us-ascii?Q?U2b96bAlTcaFUF3fvD9mHvWEcgGKiIyjPC0nb7BCbjMt7pdbyYyMCAVjUvjz?=
	=?us-ascii?Q?dQ3F4j67hVzot079PUifPRwSHdw6aqJnM+6MQ0ngZmQgrTUEZCrUZ/fp2iQ9?=
	=?us-ascii?Q?x65/k8Yq3ev1PpMODaS7/T3d83p42QopJSqO6RDP47oyCsnXTwlwG/tBEODI?=
	=?us-ascii?Q?NbZeHc2863JMTwoZxX/Uf9hzJI5v1e37nPsRtdxCWiSLCxd71CyP044fX+fd?=
	=?us-ascii?Q?z/ezj8xJ8FtG6GjmiJmYOe/wGrizm0iIuHb0FIKgsMVrPaa9/3PQjAwnMVt5?=
	=?us-ascii?Q?XpkwA9CRN321OY04JluSTwDRg0CRIDk4NRe78ZrqrCBfvUERejR++ULpvA1+?=
	=?us-ascii?Q?gkQaJVht8xyoihsIvn9no6cbaOR3Mf4qHxIukWvs1NzBrj0m7U+qyQSZ3oUz?=
	=?us-ascii?Q?m3I8vG1W8voaVjYj7QB+5RaTVmSrR001R/pkFvnOwbkbJdLARlBQn8Zx0HgK?=
	=?us-ascii?Q?R73eum4eYKE8y/DoBuyGgJyDfuW5JYrZ/FrY4Neg2JuEcoR4MQ7mwlTLCt71?=
	=?us-ascii?Q?X1yRM52qmnx6sxVTCzk+IZpxplxGJre0cLOsfjBJxvOERBDGbuwaEJPoVvQ9?=
	=?us-ascii?Q?Z4eafnLnXgaoP/Rkd3I1Tn2hOjyKrJqT7k8cftBTN5frt3a6NYDJqNsBo3Qr?=
	=?us-ascii?Q?vAc8/Zj1bcp38SYVtzEhVH6c6OjnkfovOR1fDB1gfG7LSzZsW8KPDxwrPRRd?=
	=?us-ascii?Q?AfQeRS+UG8bP9tWe0rn8QMyfoNWmn09DTj8/GkUZQjtBHD6vGbdwAargRbda?=
	=?us-ascii?Q?xZ9lCvL06NB2f/7fpqYE4Mkkr5yzQmQEnRWlfAAyac1ojQ5cDOO7eSgMm5dZ?=
	=?us-ascii?Q?u6NkjVit/s3h3ZQ+xjC18tmHSYWYhwjfc1Selx/f+/ydqgjhsMmQa9p3Ftly?=
	=?us-ascii?Q?UZt2oPG6ezus0vJqrzjuuFHU9e3fji8wVRWKGQ8m05uWpz6N3o2vrnkYrU67?=
	=?us-ascii?Q?6c/+5pvSfOBwgpDcmET697k7OiDiQ89UeECaLLrbLTrXw=3D=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: z+vPVmy42uastyn2XG9bkNPHw55xkZzEWGYiDn7MeHwOSsQR37CVeXONjigO2E9hJo29/2rsAXCCf1uUJRDCnbizvR1qG8rYynouvk6yP9H35dzSTKMpl+cRtsj5eQjhtWYA6pZFb+0wk4DLVqRmxF3ZNWJPsdKnFpYnjV9FHdP+VxyFtz/eJ7a78z6yvq4B810BDeaNQKLJRnZdTjrHSu6Jv1nZapW1KjpqUf52BiiMlK+A5Fk/fiJ3V7dKr9XJyhyZgvzIcAfWvYT08GdnQe6e3KBl7dx76Cl4fJmVU8vEJ2qjFLjG40h+xyn9xbsT
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB5218;
	6:LK4TrFLXGMmRVsnc/rZmHFEADywpwZKw+VsrKfF6oUtwTpaWXsc1AAkKUhGbtc9eqWju9XDfeBX5yJAt0XBmwYm3UEb0JLGR5lyByKGzDTst7IG50WIlZzh+VCNf6S2RsKYOzVHdHM8qLuD6fP8Ck7BqtmO7ULkhbIPgRovhfo3i2YTJiwSiBX8Zh5wmREBZjJNOyMU75tISWI23auE5adfyQOwk61QTa5R7RaafQyE/GSM3F/6OnqCE0h6imPn59lmzJSccO7bukNEBfdsnVfj0Atk3M268YLrsnQ84wxAX/r8WPHjHioHBXi8m70PuYAbEYcZfxT8uUYIdKX9Kftd4sQe9konABJd6GVAYq8piQWaYXUOlCk2LvKJp31pkqP4OMahQMxjhLMPKI0pnyi4DCJnGh9GXLfPhPZAVbLhEdHgEAK0LbgBbcwcsN2IJ81pwjwzHhGnnzP5aHyndWg==;
	5:QfV7C1CEOzzLazUB4b+ttPTCbKMoCN+fTHtk158FsbiSf8DfkhPuqBbWXa0d9CKdaahsZr0dBRjR/BeAhdyjNMTy73K3Qm6HN1CwI2Xo4HkDMnoMzo6ObTNkYrcP7Jj8Irl+JxRk+HFDFk2txc7ZRl4AgfcClI/2Hp9jh/eGqZSghL3WadopFNzgI+o/SUJwn1U/xjwNU5we31TXofcLXg==;
	7:Az52Qw8tS9+VKzQM5qICK1CTYDXeYBdZJ6GUbl4agDM2L/kC+om0T14X3t1qmtna5e+1rBam15NHdWVbYyfSSDYHOG6ojlY4qejCuzMVbOSlMwRj/R3mInBEtVvMtK8wBHi/lNDbndDC9+q8cJ5rJA==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2019 21:18:35.0325 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29898afb-91ee-40f0-ff88-08d673535a57
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5218
Subject: [PATCH 2/2] staging.bbclass: Avoid looking at other multiconfigs on extend_recipe_sysroot
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
X-List-Received-Date: Sun, 06 Jan 2019 07:49:06 -0000
Content-Type: text/plain

On extend_recipe_sysroot we only compare taskname and pn, but if we have
some dependency to a recipe from another multiconfig, these two will
still match if it is the same recipe, causing an error since the build
system believes it has already proccesed that dependency.

Check if this is a multiconfig build, if it is, make sure the current
dependency is coming from the same multiconfig as the one we are
building.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/classes/staging.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 84e13ba..2dbe65a 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -277,6 +277,10 @@ python extend_recipe_sysroot() {
     for dep in taskdepdata:
         data = taskdepdata[dep]
         if data[1] == mytaskname and data[0] == pn:
+            if mc != 'default':
+                depmc = dep.split(':')[1]
+                if depmc != mc:
+                    continue
             start = dep
             break
     if start is None:
-- 
2.7.4


