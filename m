Return-Path: <daiane.angolini@nxp.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0070.outbound.protection.outlook.com
	[104.47.37.70])
	by mail.openembedded.org (Postfix) with ESMTP id C163B6093D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 13:42:44 +0000 (UTC)
Received: from BN6PR03CA0059.namprd03.prod.outlook.com (10.173.137.21) by
	CY1PR0301MB0713.namprd03.prod.outlook.com (10.160.159.143) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.629.8;
	Mon, 26 Sep 2016 12:08:16 +0000
Received: from BL2FFO11FD006.protection.gbl (2a01:111:f400:7c09::151) by
	BN6PR03CA0059.outlook.office365.com (2603:10b6:404:4c::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.639.5 via
	Frontend Transport; Mon, 26 Sep 2016 12:08:16 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD006.mail.protection.outlook.com (10.173.161.2) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.629.5
	via Frontend Transport; Mon, 26 Sep 2016 12:08:15 +0000
Received: from b19406-2.am.freescale.net (b19406-2.am.freescale.net
	[10.29.244.3])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id u8QC8De8009798;
	Mon, 26 Sep 2016 05:08:14 -0700
From: Daiane Angolini <daiane.angolini@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2016 09:08:06 -0300
Message-ID: <1474891687-17665-1-git-send-email-daiane.angolini@nxp.com>
X-Mailer: git-send-email 2.7.4
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131193652961299280;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(2906002)(77096005)(50986999)(47776003)(105606002)(106466001)(36756003)(97736004)(4326007)(104016004)(2351001)(229853001)(33646002)(19580405001)(19580395003)(5003940100001)(87936001)(586003)(189998001)(85426001)(5660300001)(8936002)(626004)(356003)(7846002)(110136003)(50226002)(11100500001)(81166006)(81156014)(68736007)(8666005)(575784001)(6916009)(92566002)(48376002)(50466002)(69596002)(86362001)(305945005)(8676002)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0301MB0713;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD006;
	1:B31WzyznFPf016POrbXO4wpQ/H+Tn6+3ruPAueEQZh0KW3V8xAs3xfVpIdzDuICWhez25kjzou+FmJvh+7gmmqAg+FebB8FpmoLzH0zXpeT0+GczGW9AYpY+xABaq8SlPwyWRInLYSfr/CcKdbNuhth5Xy6GlPa6HP5Joj7X1KBt0FBr0dOUbxOx8lncHkhcNb6AUvm2AtWGnM7ml9aY/n/Y0kRw9vCWoLdN5ToIYY8mW7AQjd2mTtc6Kp5qrw7/AyAN6wXrSXZ8/XQ6l4W/wlbr7PhM5e+IxiK7adAHYNiNVD8rbw63Rc1m+ADe9z0YThEgn67j9HoljGnFMK4YDOpctIG7G2VNanXW80gCVb/8N8sRWE07B++AijC0P1VFUdx5ZxeKYOXbjfA4op1W/zLuNh+jAAJ7OVzW80WtrOHkjxQL0pmg5ZokL2mo5axdSchBKZKP79U8Vt2m8ihbqmG6CKIFdIMmf9Z0uD/HSQArIdE6ZD+xhOUs1hkPmQ6gcnSozQHkCdVwbV+Uc/12LbOlM2FFX/l7v7Vpeaj8Yd73r1nbP4xJ2g6+2mCvOdmnzQeEdAugkAOS1otwfhg2YpBjKXt5G8xupkYSak95zDNUE8zKTrm7pvsEAhZdR1EI7pOehPKIDtr3ESs8zvpLAeNYB7quie5vqAGS2TfpJ0NCWUqT6zgMI6Gdf5s4HUqWMD2DKfGdZmA+mM9cujS9XZeJstIXfbCFifIfAki+uNM=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: d636d062-d252-408b-e9ef-08d3e605cbff
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0713;
	2:GQd7/3qLmc8hL4zNdkIzGFGBbe6cyNns04j5BGCeEbudUVAK+5p2+ZHw3smjsVYSZUOKYw17O9WJOiUdCDI/K4Dm0Zv+qFVu8MdzFIBIbCTu4iBQz6WwkO+RMPa1n6RRz/e85LzvaQ3oIpKLcrsHvFi9ZpLFqopYWZAix7QTNQMVu65XOKJ7EeLI5oSoSgIt;
	3:14OPgZj1zVyUpF71INfoiK0WBXPWDlhyL03m3GjqGwZUuyId3s2R0i0TrYSWKSsxiq5o3pF5dsUQbjcg7ZCk8lpbq4O7d8v1DIyIk9nTdsCgxw48AiCaEYfADGI5UMYxNFkdNEKScnrMZ4g/7yrTTUys4eNn0OevwF2Ys+agWgA5ZLFk8cVVxnwcoiv06G+2xwGicG3YKmZD4wetsaU0xMDQH296/3b8LEZ5kT0bKLM=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB0713;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0713;
	25:z2+qdCuLHghlf3fc9hWM6x3VCjC96aAKET27C/PbHdstxks/kIS7P7c7EoU6vKVla/lnZn+EDtGpWOT2+aFJZd16GnOSXEaNtGpctxziv9c1pq+mFU+xhYt1fDm3G5myJv+SQ0f0WdAM5vPzS/DRgyLTHjMAbuNIww8iT9iVq/OqdHrYPozAkhPQWNho11A1GB56pSZDM1l1n3uqR7PBYW2HkRqJFs/USAnV6TpaM0z/T/T1xoVkuBWe9zY+ju3ZRjJZgFhZEKzyXAlOvOpGt4o/TWGsONNcu0+Gn1UWKCHGzuTnosb4TBGk4cG7XpkXqf3i04j/KJDobuBjUUugExjOcAIOWshJmyQGB8WDqVIdZ0hlMrYMM+LW+BNW9QXOFr1FP13giP2jpuA0tMyveL/eSvakMwD1H3D+qsdL1UEo+0BjM7KgiGi/y1gYwRb498+2asOMmukxZ1FaL4QWoYRqjZz5taWepmzM7uZ4utqIKWeW3rIyfCzxY0hUmXPHWeqB5ab2WJJNXgvS2AlsJ/VjR0D8dU2KGgYG9oM88wNkA36N9yRh2+bakFmsHQnOnV1xOL62De9Yn2ZWlhnnKNlegdjyiGcdN98v5R2zOhA5YEjb5gjES3BkvWx+GPpF0mrUlyxQI9w/QsGICH8mJuznu7cFefK1C/TD+vfV7H37uez4Tu7ONjrh5gBbQaVeYvKmS1U43Hx7r8vGz+jezXhtJ/xfyz7xuFjz07h90Udlfc2zSYiWnYLrQmQ56weNxW1eDYlh5ldEcd1zNXq3tQ==
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0713;
	31:miA23wBTKApLP4srGubEaZEvHUhsO5KAVSy6uEHHy+Z8aHMKYuauTpxFfBwMiX41dEtiXNbVYVMQ81lUKnKpbj/S1PJoliZMHgcc7wXpDOMoqnTbBRoVlw8xPNMxKv2cuIkAcKgyrnS6DOxAxhBtIMrsvdCB4+sClPjizzTivd9eAiD4V+VFG5HrNWuR0DzbcoHtKZ6wAoVts2lUZJzU7KpSwcdaZQF7ZnjUYSr5gdw=;
	4:YLDlsAFUiXysolMd+mXFHkBy96yWr3aDRR/F12s18ftNjZED7GQHYctLXSaDYddlSL5Q7fj78QVU48NnKRHEgiOXpw0T6AKIejo9oG5n5eU1uWvuibI/6SgoAbbIH7ceeyVY4gQafMUeJGmAMDy73vNopchqS2hVoZ/Onrr2LiQdL5Xxr24L8Or/unPK4HpAIlVrHBYXFKgnZ2jC2Yq0W+QI2ueJzluMBMt0GG73T3Q9dkjuuyJ/Ouen+ekmm4RfnRNY5QXewWGOQM80j695hMSF+9Xmr5dwCiVeatO0kp1vQQcb5OujUWnTMkyQZNWC+lDWeYcnvx5AngVmR1Hil5paRrR2IF8KytZeDLwzg7KCjzUvSfdNuz3IWzhT8D6ZyP+xBjcb68qlBM/KzCAeMb5wsBAgG13v6CLmDCkrMnH8w6Tv8R8ZM41y5dWO/mLw5s58DYVACCweA4NK1eMkOY2Cp6dNKQVE9zHkTC3/KWPc3SQbCCirU0/atLPkXqMAlBGP4JwVchkrbhDESAKtK16c7Xa70chFTmSaqTGxLlG6L04M3gCCFYg4uzyi2HJsd0Xbtib/wE+hgk5B218zUA==
X-Microsoft-Antispam-PRVS: <CY1PR0301MB071314EA26ABDBD020F42487FECD0@CY1PR0301MB0713.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(166494164430575);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13024025)(13023025)(13015025)(13017025)(13018025)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:CY1PR0301MB0713; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY1PR0301MB0713; 
X-Forefront-PRVS: 00770C4423
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB0713;
	23:pNpLIXJBWUgNKn3Nxc/vdf30f9VBeyS3eNfEEfW?=
	=?us-ascii?Q?DbldzM7SqLqXVfIPp5bOhQQzFQ+vPsPF8S8Mx5jObxuS38jAW4U2OIo7wIVl?=
	=?us-ascii?Q?L2N53Nx7yZMSkD6LxfcDajLCT96tsXimc7zfcMmWSI2uAmKN48+pWQekrofL?=
	=?us-ascii?Q?Q0xqFlxYekl90I/MUs3zOwjPvGqNJQxUVMIRm5H6my9M5yJZyez16nd5R4gu?=
	=?us-ascii?Q?UO/+YLlwrvTXAEe5TlJhp1quPNI4CrBnr9yV/S0WJIhZ/Ju6dmz49+J2kj+l?=
	=?us-ascii?Q?pYPeTxT89KsBcP4ZhwYEzUIeW0jyI9itEtijcBNkhQinweljmiTY4ebxtn2l?=
	=?us-ascii?Q?skvavEFgWNIE7L2QcsxgHUHoCF7/0pibdG59GESAZxdemkAxcyhTe8Q1imMC?=
	=?us-ascii?Q?knPC6BDYwZBcYE7txxPYCrcJcVFr1YIaqs9wp/IFGBs8oCtYr1Qa+CN2eDBO?=
	=?us-ascii?Q?f0eOP94URY1MvNgJNCTT63Er2xKLePR67e1Xtq12B3Z9oLW5vNxuoaTud14P?=
	=?us-ascii?Q?xTOts27/S+Lo+hV8j4TaBvEXH0etSOiHFLWDq5JfQ+/gfU85UF7PZo7nUzO9?=
	=?us-ascii?Q?RlSZKxDWbIm0rJY7L/Dd+WF9mT1xNENKTE8cZlSzLcwgweKFRJBBxPvRtY0O?=
	=?us-ascii?Q?iW/Z/MPBwOyhrGsU7JKwK3wI+TSmK5YibOtn/0lu0AmbKEp1OagcmelGAZ5s?=
	=?us-ascii?Q?JTs3XS6vxxY2U9jldBRvUhiYHGfqUGraMpONlcRT0GXzkuYme8nDg3/oBi2z?=
	=?us-ascii?Q?+5wRiBMVZKkmZw8qbG0LXUTwstjxRs/iydV6i45yDotcywS8sK6++mN7i2k9?=
	=?us-ascii?Q?iPAyWzCoPps8T7bpTRHU0kovSOGWaRDcOk4F4rm/MPQdOcnjOPoW7UUpvz6D?=
	=?us-ascii?Q?QglJATVkMjubc3jT1aw0ytnJ+SwDeUV6k7L7dqaRocQm29DyT/WjWPEGDoGd?=
	=?us-ascii?Q?NQorgD/OQDUwq4GeVv9QaoXjoH0XbaqtEXmfHdCO4V4eVhzpnKg9hzoko43Z?=
	=?us-ascii?Q?4Z9MqGvW3nVSZ2LnaRUOZo/IV9gl7B2pXAXYUHZtYwI1vRIZIIE/p5sJtI7L?=
	=?us-ascii?Q?jd0kzOXtp0XTj0qdBeML8VIr4KZlzZwC9M2AIPE7hrtMMoKJcecgfoB4Yymj?=
	=?us-ascii?Q?aqJjwvD8mB4iNUbudOtOhX5XGwWTYrht9g1UpQTNz/TbmzZk8tWGaTj4n7nq?=
	=?us-ascii?Q?3SEokeLXbKGnEp5w=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0713;
	6:mfb4TLHpJPgk2yFUMNBxhQ9T/3BQe/UQ0nnRW37dNlJW/sNwHGKMM+kVI2ffnWu8bSinz4J2VxJxgWP/J+1hPrCKKmvCpqj5u7j6l9U+HIpCl5YUhSHr918uoWzCqFNliCB8MPBbuYOQA8HQ+xj4VA2aBaT6q+MHy6jPJCnOIyRMgUtdnPs9t57k+LHb3S5eug35BXd4tZyCCFivfFCxOxMA/EWa158KGvsqQ/tVwXFRW0DhgYMHVolN/VmQHKwMtS5lJ5YEVHtdtAivLbYYnJcZDgq4cLc9vLNRdaZToY0=;
	5:MP1QzWdo29B/WgIxypcL90ap7PTBFQwNHSXCCFijvrJNsUqbhnOIhFsA6ktauIKII0AhBnZHcgkQHJyeuA9JcLgf8zZszD75lnREX1xvxL1j2wQs1RhlW+Cuq0fc1A85XQCOysw1HOa7qSgYjCR/EXfoz2Dai7Q/y0yUyenyrKI=;
	24:g9Sw7wLctTPXXSBW2bTIA4dsamxmHzseYQ+fR3QsvcaYpW6W1dY8aJ6jNrk9P5TaFy3JtbVROkoxgj9BrgYzWGzyqPY7dnMjQXqaM98H0rE=;
	7:NyIrYFNagnAz7aFXpsPX05N81lwbRmJPeTk1LLEuipdRJXjs/jr8MRGgolm6ziF3pxskO9fipMO78sM69L5g/LA+e+6JTMKXXZYtcYYj2y5ORpAtNo3zsTwPbpSh/BJ/7ISJutcSEYs9EhZRSWPAf5AWeEB31o1EINIg1LCoS0e4LCyr9/EgplpU6iQUYSf+UYZ6xxTDsk+xZDQ1dHb/No1jtPOOjf1jWa1Dpqzr28lEapSSomAXuf0WLgTFIPMTEmBvooC4rkOVJI9E8WeUSfgz6kRpNwnZXpRaQkjbGHlcyxpXzKAMCX9+uxshgHP4
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2016 12:08:15.8647 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB0713
Cc: Daiane Angolini <daiane.angolini@nxp.com>
Subject: [PATCH 1/2] linux-firmware: update to revision 42ad5367
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
X-List-Received-Date: Mon, 26 Sep 2016 13:42:45 -0000
Content-Type: text/plain

Signed-off-by: Daiane Angolini <daiane.angolini@nxp.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 2421da0..6d0bc71 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -112,7 +112,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=fc7f8a9fce11037078e90df415baad71 \
+    file://WHENCE;md5=f514a0c53c5d73c2fe98d5861103f0c6 \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -172,7 +172,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "cccb6a0da98372bd66787710249727ad6b0aaf72"
+SRCREV = "42ad5367dd38371b2a1bb263b6efa85f9b92fc93"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.7.4


