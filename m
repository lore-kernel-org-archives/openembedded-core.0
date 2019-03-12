Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 79161 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 14 Mar 2019 11:52:37 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr770079.outbound.protection.outlook.com [40.107.77.79])
	by mail.openembedded.org (Postfix) with ESMTP id 66D7A6C0EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 11:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wSsOHgrrMjZ5x+FgzPo9MTOk6wUFfx3dxBasAeV2Dlo=;
	b=tMP7DkOZuD+RT6vdzlDpGWQXqhzPf+q85jyd25I2AdT0MYdT2UDSxLIUXboGJIWProV1J8Rq1q5EwdVoYjkR/+kv6BEYl3BSnHp4qPNb15dABJyiy52A1Hjl7kvl028jIVXZfMeIqdkad6du4a9gaWN8QkRTPSzJV1oM+ZVpDDE=
Received: from SN4PR0201CA0071.namprd02.prod.outlook.com
	(2603:10b6:803:20::33) by MW2PR02MB3721.namprd02.prod.outlook.com
	(2603:10b6:907:2::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1686.19;
	Tue, 12 Mar 2019 23:21:10 +0000
Received: from CY1NAM02FT011.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::202) by SN4PR0201CA0071.outlook.office365.com
	(2603:10b6:803:20::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1709.13 via
	Frontend Transport; Tue, 12 Mar 2019 23:21:10 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT011.mail.protection.outlook.com (10.152.75.156) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1686.19
	via Frontend Transport; Tue, 12 Mar 2019 23:21:09 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1h3qhp-0008Nc-At
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2019 16:21:09 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1h3qhk-00078r-6t
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2019 16:21:04 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x2CNL2aS024098; Tue, 12 Mar 2019 16:21:03 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1h3qhi-00078A-Sw; Tue, 12 Mar 2019 16:21:02 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <manjukum@xilinx.com>
Date: Tue, 12 Mar 2019 16:21:02 -0700
Message-ID: <20190312232102.22291-1-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.18.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(346002)(376002)(396003)(2980300002)(189003)(199004)(106466001)(36756003)(51416003)(478600001)(44832011)(72206003)(336012)(15650500001)(2616005)(4326008)(305945005)(9786002)(486006)(356004)(36386004)(48376002)(110136005)(81166006)(54906003)(50466002)(81156014)(8676002)(476003)(7696005)(126002)(186003)(8936002)(14444005)(26005)(1076003)(316002)(47776003)(16586007)(5660300002)(63266004)(6636002)(107886003)(106002)(50226002)(426003)(77096007)(2906002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR02MB3721; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0650b03-5bcf-4331-74fb-08d6a741692b
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4608103)(4709054)(2017052603328)(7153060);
	SRVR:MW2PR02MB3721; 
X-MS-TrafficTypeDiagnostic: MW2PR02MB3721:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Exchange-Diagnostics: 1; MW2PR02MB3721;
	20:td45U6tWvcTpbNQBqsVlaKF1gNzkow1d6CkASpq+VgDSw37AjO/IlFOQj3JQPzC1gBEmec1nmBM64P3FEzUO3IvOsx1IhbtCBM0i3hAg7WXRmvCdMXouyiM7yz7QIsm9C8fLJtr5BAP93TriNbn4EkwiCjRv7UEuhpn71HhOnEJiOXuNDjYTs1D+v34lHPLJ0vXpLdiFeDgPummlOUAeyZ4Ts8Rlq43Mc6p6zu69bxH9Wqw1x81cD20Gul4m3iM+L1siOSCGu+CCDg4G8dD/mBvvk+MIxWsLVMBahBU8OQbBdvYim/nO8ja4M80ScmJHHnYmUfv7V8BYMj1C2jP11OXf6NWrsWpCF+aCMPvotmpKDrR2DFXmTnFRhaME7YFBiFw9MB+rKeoxyIWsRD7JKMe2HKkuUuRpXmFa7t+3mtX6cCxmb+ak82hhxHY06aS0N2b8nxboOVYK+XbwKlhaN4D8qOpC+hF+GocUTmqvwg6QXM1HgkRcIXLB7uljAT6R
X-Microsoft-Antispam-PRVS: <MW2PR02MB37217E2FBB4B6DD2FBE764AAAF490@MW2PR02MB3721.namprd02.prod.outlook.com>
X-Forefront-PRVS: 09749A275C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MW2PR02MB3721;
	23:JZ6QqBqZLONsEq2r7iIQz4aL+IVWLI7GuH05CckKK?=
	=?us-ascii?Q?TftDMjz71WTWyCLP+kz1SCFkGelT4njv3jrP4HgdeAn4u42DGZ20oaua3Ve9?=
	=?us-ascii?Q?6/Q+m+34TgH3E1Xo8CbKJA6+uyLdWJWLqVZtsjR1NPMejDV3ymAD4wR6CRYS?=
	=?us-ascii?Q?/UHlmDE6/WoT12ll2kGAd/GYHyTWGLGEVijWloRXnNyhZf1VfZS5/GlCe1Bn?=
	=?us-ascii?Q?3obDbCe11AIMqUKt7Q0KDbKMXvlkG3filJDzSP/L+IQNT9xwuaSlIzu6dheM?=
	=?us-ascii?Q?PSOs69zPvuyqF5hwM9mQyd7l0XQzc59+tt6XP+Af2SLk942L/TFcMvpcG9BS?=
	=?us-ascii?Q?Br1jRLVbf3iXeVPqelPWPm/84VO3BqBP4GzGZrGXt0MjYFlkG9THBLut9viM?=
	=?us-ascii?Q?AtRU5fp/yRKH24+xNwk8o4/pB16yNahJHfbNw7zlUdjmCCA1+8Do3hU4txfc?=
	=?us-ascii?Q?55Hb5oeH4i6ErHqXzfI8anEl4oA9RqkqJ18FdUmbuPCk4nVII5Aj5P17Hj89?=
	=?us-ascii?Q?04mTtyelDUNKt6+poQ5csbtIWDe024j6KrN695rFpEoVgfvuJlJ4BI4sYnRZ?=
	=?us-ascii?Q?cxrIBAb2cmcCzdl+DdHqR3BLWWDBJH84pBV4sld5BPTEs+r6KAqhTEk4Ks2F?=
	=?us-ascii?Q?BFjHxjd5L6k3dLDGdHKwZHyrJAx7p2nWuQVNg5CWC2B/yTvzYPle1oBw6k+I?=
	=?us-ascii?Q?sWHmkaqbAMeq+g5qJjO2eAY5Lh25WNlNrnhq1TQCj/gYOkbzIB56wmEvDXNk?=
	=?us-ascii?Q?vfPU489MjQPUt1KCRcfGEyxfq46xbdY4/36Bt/axiJVN1aegrmKVcrcxUWWN?=
	=?us-ascii?Q?hkR7q5DZT5/zM2VbuMb/8hxM3KvQ14elwzrobCChTXI19llcw5biGPcXeft1?=
	=?us-ascii?Q?g5Gn0YopRzIPhVdzRx7fVooZdPKFBd7CoSxEL+nFXlmXQH6VHCEWKAXPx/Pd?=
	=?us-ascii?Q?rcvhVPqYIAvdQ9ZKDkLUEq3gxaJUb3+8035mIfQkhkfJ09WpPn7Q5sw16N5w?=
	=?us-ascii?Q?KS3QVusrqgEkz/WSVTq2z64Ig2RIVEyOhbe4oITD0T3cldQXrd7YrEXM6ZPv?=
	=?us-ascii?Q?nlZTNwPF/10FSMlWFwQUJ8C+K9sbYru7b7KE6rWK6NyCsdbZCMAqBlNaebXQ?=
	=?us-ascii?Q?SWFGBkF1OE=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ZfRft9W6OZ+nAjPeDBkqFYGz3XgEbbXVeIi2i8k2lxSie+MOQdjxiwqqjK9YkoIAskKNTjlT/aWs0PeGtt+O2Q+RHpY0oVWLV+eyYZ1UyeEiURjnpd33Mq2Pbhzg1hX66+gHKrBU2J9HFk97pz9jey5HsESjft2EOhoDBJWYRFfp1EIouidI5q3xrSHu405Xx5tek0oinHwj9qAm2/71DLSBvxz1MXCKgfbimbETdSB+4oYIIaTpN+/+L9fAdPhM213IyK5+cTsF15bCoGIrnf2OE+duOUDIwfthwNdBgvpvK3KeDWC00gRDseFTYzhTzMZv99qaz35jl6rnPRHeR49hvaX5mrqicDGG7Hxz6kIVppbmWsvOMNxiJWBaAH3zmpE6J+POm+kTS+OxK7feCsSsz51owITMlX7I2S4072k=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2019 23:21:09.7421 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0650b03-5bcf-4331-74fb-08d6a741692b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3721
Subject: [PATCH] devtool sdk-update: unconditionally append updateserver to sstate mirrors
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
X-List-Received-Date: Thu, 14 Mar 2019 11:52:38 -0000
Content-Type: text/plain

The code in sdk.py which checks if SSTATE_MIRRORS is set before
appending the updateserver to SSTATE_MIRRORS was written before
it was being set in the eSDK's local.conf (OE-Core commit
6b9e8b780dcd8d5ffba3df35cfe41674413ee26d).
Unconditionally appending updateserver to SSTATE_MIRRORS as this is
pretty safe to do.

[YOCTO #12884]

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 scripts/lib/devtool/sdk.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 4616753797..37f2af3f5c 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -214,10 +214,9 @@ def sdk_update(args, config, basepath, workspace):
             shutil.rmtree(os.path.join(basepath, 'downloads', 'uninative'))
             shutil.move(os.path.join(tmpsdk_dir, 'downloads', 'uninative'), os.path.join(basepath, 'downloads'))
 
-        if not sstate_mirrors:
-            with open(os.path.join(conf_dir, 'site.conf'), 'a') as f:
-                f.write('SCONF_VERSION = "%s"\n' % site_conf_version)
-                f.write('SSTATE_MIRRORS_append = " file://.* %s/sstate-cache/PATH \\n "\n' % updateserver)
+        with open(os.path.join(conf_dir, 'site.conf'), 'a') as f:
+            f.write('SCONF_VERSION = "%s"\n' % site_conf_version)
+            f.write('SSTATE_MIRRORS_append = " file://.* %s/sstate-cache/PATH \\n "\n' % updateserver)
     finally:
         shutil.rmtree(tmpsdk_dir)
 
-- 
2.18.1


