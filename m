Return-Path: <Adrian.Fiergolski@cern.ch>
X-Greylist: delayed 10736 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Dec 2017 03:38:08 UTC
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr20062.outbound.protection.outlook.com [40.107.2.62])
	by mail.openembedded.org (Postfix) with ESMTP id 8D4F07876D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 03:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.onmicrosoft.com; 
	s=selector1-cern-ch;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=TQ+W1Q8OHuM5oHXiwVMFfhum6hjYDEXN6zrgbmaD9Fg=;
	b=b6nsWU7eLbDdptq0Dy7kPs5Xrthco02aQywM45WNvGApstLCZ1hyOlFa/ZFAGS7Sr5bM9CE+ZmmqAqX28yCHqtbwF7jq6NBkwOH+MuRyt6etMRABopz8sYcWTBh25ywpWL7mIFTETCBZMvlmitCJoHDdXVSHDruH6E2w/TKayHI=
Received: from HE1PR0601CA0025.eurprd06.prod.outlook.com
	(2a01:111:e400:c513::35) by DB5PR0601MB1910.eurprd06.prod.outlook.com
	(2603:10a6:0:10::7) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.302.9;
	Mon, 11 Dec 2017 17:08:50 +0000
Received: from VE1EUR02FT013.eop-EUR02.prod.protection.outlook.com
	(2a01:111:f400:7e06::201) by HE1PR0601CA0025.outlook.office365.com
	(2a01:111:e400:c513::35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.302.9 via
	Frontend Transport; Mon, 11 Dec 2017 17:08:49 +0000
Authentication-Results: spf=pass (sender IP is 188.184.36.50)
	smtp.mailfrom=cern.ch; lists.openembedded.org;
	dkim=none (message not signed)
	header.d=none;lists.openembedded.org; dmarc=bestguesspass action=none
	header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
	188.184.36.50 as permitted sender) receiver=protection.outlook.com;
	client-ip=188.184.36.50; helo=cernmxgwlb4.cern.ch;
Received: from cernmxgwlb4.cern.ch (188.184.36.50) by
	VE1EUR02FT013.mail.protection.outlook.com (10.152.12.142) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.20.302.6 via Frontend Transport; Mon, 11 Dec 2017 17:08:48 +0000
Received: from cernfe02.cern.ch (188.184.36.47) by cernmxgwlb4.cern.ch
	(188.184.36.50) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Mon, 11 Dec 2017 18:08:43 +0100
Received: from adrian-laptop.cern.ch (128.141.234.113) by smtp.cern.ch
	(188.184.36.52) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Mon, 11 Dec 2017 18:08:44 +0100
From: Adrian Fiergolski <adrian.fiergolski@cern.ch>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Dec 2017 18:08:26 +0100
Message-ID: <20171211170826.9217-1-adrian.fiergolski@cern.ch>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-Originating-IP: [128.141.234.113]
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:188.184.36.50; IPV:NLI; CTRY:CH; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(376002)(39860400002)(2980300002)(438002)(189003)(199004)(3846002)(356003)(6116002)(86362001)(246002)(106466001)(1076002)(305945005)(2351001)(7736002)(7636002)(2906002)(8936002)(53416004)(6916009)(6666003)(8676002)(74482002)(50466002)(5660300001)(48376002)(50226002)(786003)(16586007)(66066001)(107886003)(316002)(47776003)(7696005)(4326008)(51416003)(106002)(36756003)(16526018)(478600001)(59450400001)(72206003)(551544002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR0601MB1910;
	H:cernmxgwlb4.cern.ch; FPR:; SPF:Pass; PTR:cernmx11.cern.ch;
	MX:1; A:1; LANG:en; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 609c5d84-fd65-4e8e-b1c2-08d540b9d8ba
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307);
	SRVR:DB5PR0601MB1910; 
X-MS-TrafficTypeDiagnostic: DB5PR0601MB1910:
X-Microsoft-Exchange-Diagnostics: 1; DB5PR0601MB1910;
	20:MZWClzVYgUP1h+he7AvubtT1vws5vqBUYMLj5QwxB018UMqj58+JYC19txXTMR4iO0MMUQTTdgZn5/tdySe2HB0RnbSDZqb+0jj/J02XxPcv6T+K/+lIBFgssODNIRsk72nHoMxXWgDDChiWD8qtlCwByFEdS0HX0VrEKBvWx7ckx5rh9B3Oy5l1/Gpo8qHGKYYAbXU4ajN2BxXiEzWPQAmBVFabv6O6KwIbHmCsgDMYgBLD7CkgX/shCQ/ivZ1MgKtBBPbPMmKYwMmd0Bofb8vwLlvdiUEqzPAd2YTAPd0cC0W47F3994ig0Ud6c0vsUKEwFZuJZTNOogHK/LKrV4jpuXWTzn0Qdd8k6jD3nlVVjgSiqHMbbTiAjF5DFFaJ3uxOClp0U7Yr239ZimiKJJde0HRBFl2aoDrhEtqGq58FblnuL+3166WRdfMp8HW+pz2SIEVqf0ZnjM2+FGsK/4ojhdXwHDvyfz18oLOng5A0e1BoKv8tA2ic5zdGzDwG;
	4:/rmPCw14H9xi7DLtcm1FO2Ne7e+psHtkHjANeaOdxKMvNgt5XueFOrhW8EerJ7876+41/URuG40nS6+kTpWavZEu3GCaOTSl2HLlhPydT3BGF1+vKg6WeMY2z/Zo1Izk67asG3EWh02BJZpZEoBkcrObnge8QzELin2kptlf3kgdhdeaNZtxAeAEKDXyjDddaKGktpz4jMNNCajylAPpny9kCM+vWix52b0jQhDKTWGKztfVrkoDJdw42g7g2f5FSMDE5Fd8IR3qXr28MlzvJg==
X-Microsoft-Antispam-PRVS: <DB5PR0601MB19104B48F59850A05C11DB37F7370@DB5PR0601MB1910.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(3231022)(93006095)(93004095)(10201501046)(3002001)(6041248)(20161123555025)(201703131423075)(201702281529075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123560025)(20161123564025)(6072148)(201708071742011);
	SRVR:DB5PR0601MB1910; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DB5PR0601MB1910; 
X-Forefront-PRVS: 0518EEFB48
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR0601MB1910;
	23:8XipCtfBXAUr6dlN+hbm9/98rC5qVVYCfe/z2Pl?=
	=?us-ascii?Q?VcyPMoCrOBGKUMbpKkU9i7CO2IF5tj5Q2v3oXJ4TimQPExL8LpQkZ8WKVzu3?=
	=?us-ascii?Q?Y0VLuds53RbupQC/Lp3D/IvyBiM91NKulbDQFETowOmovJelTE/oRayT2gPb?=
	=?us-ascii?Q?b3LNguSDGUTfkQA7GVEdHzo0+DrvPsZ2LwmG7+OXMhm61pZ+QQ/vMIfn2YPV?=
	=?us-ascii?Q?OjGxT9/N5U6i8SHA9p28eVGzBL2ExTbeXNpcyCRAKKtJi81xvOWI4pblFtPi?=
	=?us-ascii?Q?IfiqwKAB3I4FGl7VPyCSMTSp9RUTYNx8A78hJCySSsdjCHy8BQi2imo54MYe?=
	=?us-ascii?Q?3ONZ6A4pvNjDzP/HiEEclNsEeA+32kyUp74WWdUYrrp9YmAENWxjTcP324mg?=
	=?us-ascii?Q?L3810osU/M0gtHd4eAWpF9rBvtlJGSiKwooUb26pF+gJ0smQBt7YH4/ED8b4?=
	=?us-ascii?Q?+0IdOCghq1vMNKrnAIW4S5PCgf01tX6sRvkVWZ5MSO5DzYUBPW3+lTZnqqwW?=
	=?us-ascii?Q?M1fh28kYhpPiA14uiEyXpk0ztCZWxxcGXiQ+NbRKzKiWEcn4OgrlE9Irloer?=
	=?us-ascii?Q?XYAG0tVbTtS+f7ch5mU6tNx0XLy8VlM6QN69KvL9AHKGa2ZuNGzD74gX3KYt?=
	=?us-ascii?Q?WFqHWtbyemXYFaCMOohIxu4RMf7Gg23hdd1IXgWOn+2c2/pe0z4iq2S3RBdl?=
	=?us-ascii?Q?dV2iE5pX79OrO5wBj5RKOV4bSvJuhIibcoGDEbvW4XKnKRLRTLH12tlJJAgJ?=
	=?us-ascii?Q?tn4d8swwVZsmmhEf+QF/Zn+bpZW115UfGGCk2K1r94PHamHn9d/tfe4pjo2w?=
	=?us-ascii?Q?i3hUeJ+/zl6AK+20hC6d4guaPeTDg5DDfVeMieNV3uBXDaeGjY5tGf+Z3UiH?=
	=?us-ascii?Q?VJZhrYs5i9IK1/locM/zMdcOsj0f6pH+i6gCGlkzVOwt9rp5qZ1n+lwHcKw4?=
	=?us-ascii?Q?+txTd4rOIrw6jY+thKBbHQeJ7bwCfsnT86XR+yc/X/PMW5IttR43XumaKMx/?=
	=?us-ascii?Q?b5A3ACxSf+k+9rJv/8cqgYXlOP9R2uPio8gXviQTLq87ZVw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR0601MB1910;
	6:gJKPKTRmoiDwjm7bAoCHE8HjO1QgFHlFN6JYTGiBrDcvuxGwBPiV4ao/3XBZWyqNbK8EVgVHHTpXM89y9NE3QIveGuJn7KpLJEX0SRymEGBiu2Z436i6gpw2FvSTPnJAECJhSMFUNjfG/mejppfxSAkakL8jyKXh+kFO0GhogD8+dAX/3Ajekzzcf7UC0fQlYJzP7ld9DjYOxON0ja3n1LrvCH17lC49LfctC1fl1/JDMfBpDElPGsqZqeWLxqupXvjTeSCmixJ5cuFGn8zF3dAQh/o5sEa3l19uiSzypB0wRrFF0pNKhGKp2IzE05ArNlcVmJfBfFWWCNoD5IlWeJ9Zw4BA1Lm4DHVf+55nZQQ=;
	5:y4heek2htVM1V3B/MgaBLRS252v0G85j1ee+z9hbEnVkcmgq4Q0wZT6hGv/ZdWZr3gi44IhEHHtIZENELHrgkhFZPWMmPPTPHCShSG0s9K7Ol0Gi2j3fleJYm05pmP/qXxW4GjCzpkmubBy4jD/MDVkn6ORybsDjMnRmitM60hM=;
	24:cHG6bCZNf/ubpe8V3dfyvezRrpaKFtstZB4ifvJ6UCxvT9Azrhy6DjeVc1UJKpiwqzJSnzqftgtEWBu7xXyv5Aj3o/pSuqf2FJxjgZOURss=;
	7:9Grx7APZ4keC9Tzzoua+/vsfOMTaDQh0kAvuynjmTZp4rfbGrkOq3bJsBSzyg/g9j/y1/C8bEvEOFNQDnT7XQIS9+JJ/KpT1BTqKvVS4ixl2+wbnN6N088lIUwzulRvRGL8FKWSJ24hz99cjrC9mMuUnFLEB/Q4OBY6rul1OyDn+raKTFhxLhyOCZwt4KT39hA51A2VOlAadJHN9vfdVYtrE7R/ZrzRH3DK0VHNA9DrPnG90r3B4St91uCGbvnmx
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2017 17:08:48.4534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 609c5d84-fd65-4e8e-b1c2-08d540b9d8ba
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;
	Ip=[188.184.36.50]; Helo=[cernmxgwlb4.cern.ch]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR0601MB1910
Cc: Adrian Fiergolski <adrian.fiergolski@cern.ch>
Subject: [PATCH] wic: Fix a path to a psuedo state directory (PSEUDO_LOCALSTATEDIR).
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
X-List-Received-Date: Tue, 12 Dec 2017 03:38:09 -0000
Content-Type: text/plain

In case of 'new_rootfs' the psuedo directory is not copied. Thus
PSEUDO_LOCALSTATEDIR should still point to the dsa
'native_sysroot'/../pseudo. Otherwise PSEUDO_LOCALSTATEDIR points to a not
existing director ('new_rootfs'/../pseudo) and UID and GUID attributes are not
applied to files of the image.

Signed-off-by: Adrian Fiergolski <adrian.fiergolski@cern.ch>
---
This patch should be allso applied in the rocko branch.

 scripts/lib/wic/partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index b623bb9e6d..6903d0634f 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -205,7 +205,7 @@ class Partition():
         """
         p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" % native_sysroot)
         p_localstatedir = os.environ.get("PSEUDO_LOCALSTATEDIR",
-                                         "%s/../pseudo" % rootfs_dir)
+                                         "%s/../pseudo" %  get_bitbake_var("IMAGE_ROOTFS"))
         p_passwd = os.environ.get("PSEUDO_PASSWD", rootfs_dir)
         p_nosymlinkexp = os.environ.get("PSEUDO_NOSYMLINKEXP", "1")
         pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
-- 
2.14.1


