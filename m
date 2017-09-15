Return-Path: <samuli.piippo@qt.io>
X-Greylist: delayed 15399 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 15 Sep 2017 14:38:29 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0122.outbound.protection.outlook.com [104.47.0.122])
	by mail.openembedded.org (Postfix) with ESMTP id CC79D7864A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 14:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=qGtqKhAT4uHk2LUaWROafO6xBZ3tujTDGnbKysqLh88=;
	b=DSzTAx3gZ8k3pmUmkcQ7wLJimKvsLKxxgvx9F6Bwzv8ihCtibCerfmTMmnmBRqyPEA0BWEXTo+GMxlCDXr6OF/cX+Mi6pgnOOXSjk7MbSeUHSV1UeniVMQ7IPx00YpxPpOI97+xjN0fGmcatoW6RogjK/GbpVI5wknYaaXbJyZw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from piippo.intra.qt (192.89.120.53) by
	DB6PR0202MB2582.eurprd02.prod.outlook.com (2603:10a6:4:1b::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.11;
	Fri, 15 Sep 2017 10:07:14 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 13:07:07 +0300
Message-Id: <1505470027-5180-1-git-send-email-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: HE1PR0202CA0022.eurprd02.prod.outlook.com
	(2603:10a6:3:8c::32) To DB6PR0202MB2582.eurprd02.prod.outlook.com
	(2603:10a6:4:1b::16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b379ca6-42f3-42f1-27ef-08d4fc218a43
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DB6PR0202MB2582; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2582;
	3:pNFgehkPWrZfmveXi4elK+fWNmoFQ/2+sEPr/7mIIUj3gmVBOm5BP5afwGEBCPiG5cXopByZYiIFE+hUJrJk8eiPRiWhlguhYfiMIoaQVU5L2/M95PxeitSEAc7ASCnQzqw1fVVDZ8yBltbMm5rzIWzUKWAeDde/bhWgw41oqwqxmrxaFE1/3jztL46+/7qDz3Xop9S4THmisKL9nQbA5caT0QIn7CtLkQtQcJ0X+wscsUY27imHQT/FeX2AMsR+;
	25:ff6DT6gDedTaJRzQhjwsTxszOvfQBLBWVG0ptKbA4myIkKCTZQqQloV0W1ZPFMGMUE3cHWgU+n0hgna68WaHMHZNwbXtWIaTAdSsNZcqrKHxku4rl0edz4zcaizVw7tqW+Cu7lmhCOtSm7R/MQseKbgb6RVThO+/Q4a2Lm+NaBe7Cvpe1wObsWoLdc/Q02V6akioMb0R4YjoYHxPsYbHhj043mKrNJ/RAmYyFX+hH3PYuajdD8Pc2NwRn7q+zCvl0oHjTRo6OVi0jmjXtcUAKeR4mFuWYXbRrpZI3MHQQhTwBI6XF7QGhS6dguD5J/vM9+cSU6p19Z/+8ut/m5NlQw==;
	31:0fuwF6f2+VTldHtXweMDLwkXnWZkbqDpe1rhYy+B5GBl5CzU4XH2y5yNRP8+W2WOiOoEwSM4fZznApHk9zWhMdpjovxmM098tjswKVxsYMNAa5WuLpZ37r1MZH1Y9QYBxqKPld+9cKlnyUPK1Fpbw6QnDHWRvTkVbZKordaTfY1j3368c+cgca/J48NUIcg++8GunTtyPvseRVE2Dui5tqbUQi8CawDGzj/1GcVTRrE=
X-MS-TrafficTypeDiagnostic: DB6PR0202MB2582:
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2582;
	20:MaekAAPyLsqq7R0CR15h1WUkReZLPxMtYbNTLy32ZtPIdfDnk5PPJUqOfiEogvdbeOl/cEE8p7FisWA7anqk5BybXKPzspUVYQFRK4bhh49A+BB1wm/p0mOM6DWmjWC6r2cnWTG6GSkNxNnH4UI6tJ0ouTWzoSnmZ6SllPSLTsRz6JpjxMzO6FCq2IMQ5cmA00WoyZ4Gf2iiNvuQr05jJUAM/tMgT8UnAHqZgaZDRJBJjEgHnHewpIj+pxw41Id5GdwgsyI1fGleXWeCxpnfzFWUhkEz9yV6bPhFefo3cjesmTAP/eDNNqfLbDDbiVQomTjgFnMaOlneiv97m10vie7PJmLX1Zv1aE/A/MKFOBukObaZnMVMyT58LsWfVC6YmPwTpy4Su5CpOX9JHerAvwzPBNgZLqQcA4K18GWb6Uz+jDkR1oaz2c0JKNd2VSII7Xyz8FqGc9UxQyUdle4NAcdMwkHtDL/wqvcp33lT77ntoC4oWw1sfr+TVSDujs8l;
	4:cZwYXF8sNvg6WlW3nXNM/Ah+6WwgoMo/7vsj7nkMrvRkyY2d6yj4+Huync2a5I8wD4AeXnOdkhXcJEz052xmOgtRosatVwAFkjsQeGs/JYgZuOczr/JWIuojRd7AjoKCDOrxGn4k0x5LYlDuurm0akWodNGdaef/zAjN6Bqv+90frYF+uRojuaBH+c+ZL5wSzJlDJaBYFE7MFJFZaOwaXOwm55ariLzoROaIetrGSdCVrFn0s0uTaMqIklcyZBqw
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <DB6PR0202MB2582E6E1AE92F264EE7E4B28E96C0@DB6PR0202MB2582.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(100000703101)(100105400095)(6041248)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123560025)(20161123555025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DB6PR0202MB2582; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DB6PR0202MB2582; 
X-Forefront-PRVS: 0431F981D8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(7370300001)(4630300001)(6009001)(346002)(39830400002)(376002)(199003)(189002)(6486002)(6506006)(189998001)(68736007)(53416004)(69596002)(66066001)(2906002)(106356001)(47776003)(105586002)(50986999)(316002)(478600001)(101416001)(16586007)(7350300001)(110136004)(2361001)(33646002)(97736004)(2351001)(86362001)(16526017)(25786009)(50226002)(7736002)(81166006)(50466002)(48376002)(305945005)(8676002)(81156014)(36756003)(5003940100001)(230783001)(5660300001)(6666003)(6916009)(6512007)(6116002)(53936002)(74482002)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0202MB2582;
	H:piippo.intra.qt; FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB6PR0202MB2582;
	23:QZNmKDqg7cg3f04F8BxvKKYnU4U/sev+QrjaLFS?=
	=?us-ascii?Q?GEKO+uIBRk0QF+YzQSKKRPOZXSr0mQOE+fi/jI323LxK1Ke8hpx2ePCuKTHF?=
	=?us-ascii?Q?u03dtAzAZOV2O+FADwL7hmYcXKC4P8Vc5hTzNyjYJKPda+MlxiiTJxk1bTsL?=
	=?us-ascii?Q?dxSjIZJ+2kYVp2u4J46X3+sytR4r0FtjI7X+vOA+NCmy51pVS9xP2DLQ4lp4?=
	=?us-ascii?Q?CHtQ4he9NrGL3H90sDXQS+UTB48gO+FHu7KgcfbFTHDBk8n0I+PQr1R6Ul6X?=
	=?us-ascii?Q?ebea+ly919QFtJuLyuzYBnc3sCfFuqqk8FjuNfXM60COsdQ6e8waYP45U2o3?=
	=?us-ascii?Q?cHYhNqMG3Iyb07d4kpPGpgjSNs19Izzi8pVO0ydX0oFAuh6NW2u3ZAssjSbU?=
	=?us-ascii?Q?KnndIq1uxSwG2hkDEJ71QxM2P5b8ZQhAAoXwtcecmuFOupjrx26iRpkGoLrs?=
	=?us-ascii?Q?YlR+AfIxfZfyhXUXdII6pTkJrsJT5iTB+ixPyV5Km1LH5r56vETh5trdxznG?=
	=?us-ascii?Q?Q4Bj1ZbTVcF7/llY9D2XksF01tHNPWlRRe75Lv3MpcDYWIKx6SM/sFcPghT/?=
	=?us-ascii?Q?Nqx7uonvs/ayT9cquE7Mu9B8mBPe52ijhhz6lZ/hPb3cXlSKSorKvhDWUZGJ?=
	=?us-ascii?Q?JvfM+WzrywAIlWwC4o3AJRuxVbRv7VHeh4OKqZBwvortBmUIOpBqaQ1wIRaQ?=
	=?us-ascii?Q?TUjb2QeRlEvDeMwIyMW8p+AY6hBJReKc0GsZtYVdE4mHvd3DjtTSGDakGAPY?=
	=?us-ascii?Q?CfrBU3ttXxSbqJFWoQ1QEG3N9MkzJBAJqyiAhSZ6gu5F59O/+Vb3x1R49J0J?=
	=?us-ascii?Q?xh1IVWt02jUZUhoAqR8m+2NJfxY7kCi2FySqzlD0U0CRIPtAcxMn29guljps?=
	=?us-ascii?Q?xtSX81MdsiKBLdp00av9TxV0I5CTthjSlpd9uTAqhEUbAGLSujgmk5NsY9KL?=
	=?us-ascii?Q?Nhm1B/n8ugrCCYnXeLudroxCGTz+HEU46JNpBf1Ot7p1y+LoBLXrNdGWSS5v?=
	=?us-ascii?Q?JEbRubCdVxJ4i28ZtqvRmo+tSVDUBsW5zy8XDONo0mz1PkoA6WJmDUOpcs3B?=
	=?us-ascii?Q?g/YRDnyWAVZCFg0EhJUcnNT+ZuTz2bc5401OUD3T4FtESVvJNQkg0CnyHsUH?=
	=?us-ascii?Q?yMBpUv8HJHjdSt4iA4+v+p1sBsE3TFVBNBR7juniZtOGvr8YcePCElX6+s4I?=
	=?us-ascii?Q?ojyDEl2kB7ZhEEroEWr6dsrw1wrsdZHFKSLxZwaD0X1qb/afvdLxzadOWAA?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2582;
	6:AJmQ8/wjsWnio2ft/Lnfgeg67vS0P92F3zKgCpwELbcK3sPXd9oHGs/iGrEUd415/3EJtAPe1VP61dWnIz5/E9UpubXrHMMSZVkM7dVVP5moizz62bKlfefbNZ85mErJ4kJ7zeqn19hTXhu3qm4Isbjdkm4KnqEcjxhh988bmdnvIZqEJMmuGzCmswb6auu0Qe32jSELxFu6BN6C8PJM0iIzKZ2kqppMJDFzDp0Hwh1HCm5cEZt80CaKFk/p158dve3q6NI0HnTlLSPMnioUbM20Ggnk8ufOTA9gOWyNjZaSmHAr2pRZGaOX0CyuhrFgcBYZfvldJl0dUytSg84XZQ==;
	5:X7IgnpFKv98BqHxoYKOk9QGGoHmU9aCnmBjDnTHIBU6smVWbJFKYonEJrCt9XMuWqysIVw+GSt8Gw3h/6XGGU0NI0wovt+fjkEung67cZxqa9kAmP3ohxHQgSG6xEf6zjBpNaEJBq6/XbhQUjP9INg==;
	24:kKwmFrtO4BMZQl+HtoUSXD9rHdFjNxF7zylvKOlc/ri2q7yUY/7e7t7YnrlCKfP/9vGUpR6t/VZZ5VGQjGCus3Vzb2F3/UEuTECU4kfQ8pw=;
	7:FiE9ebA7Ul4Q11lpXlO7IXhrCJsJVHBy+i+qbZsLBxfsHCDwm+G2BESllbR0YoUieNd7lx06xGyZn/fqBhvYOG1Gh6E2OxBK7R2Lvxg7gadPB1NoyeS7ibShVt+O7AER1FGfNEiIzPuKxhQ8+/fL+IEXvZgafW2MiXh0cNQ4tgDPzejlRjxtp08MdmSoN73+ZAreXaXto312eWVLKTrCAL/3z9SL/YjVl/BL/No97/Y=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2017 10:07:14.7984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2582
Subject: [PATCH] binutils: apply mingw fix only for binutils-cross-canadian
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
X-List-Received-Date: Fri, 15 Sep 2017 14:38:30 -0000
Content-Type: text/plain

Whenever SDKMACHINE is set to mingw32, sdkmingw32 override is defined
everywhere. This meant that value of LDGOLD was different also for
binutils and binutils-cross depending whether SDKMACHINE was set or not.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 2 ++
 meta/recipes-devtools/binutils/binutils.inc                | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index b3d591e..e98f31f 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -13,6 +13,8 @@ EXTRA_OECONF += "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VEND
 # e.g. we switch between different machines with different tunes.
 EXTRA_OECONF[vardepsexclude] = "TUNE_PKGARCH"
 
+LDGOLD_sdkmingw32 = ""
+
 do_install () {
 	autotools_do_install
 
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 7efe13f..37813dd 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -78,7 +78,6 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
 
 LDGOLD_class-native = ""
 LDGOLD_class-crosssdk = ""
-LDGOLD_sdkmingw32 = ""
 LDGOLD ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '--enable-gold --enable-ld=default --enable-threads', d)}"
 
 # This is necessary due to a bug in the binutils Makefiles
-- 
2.7.4


