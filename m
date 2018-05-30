Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 9096 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 31 May 2018 01:46:12 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0067.outbound.protection.outlook.com [104.47.41.67])
	by mail.openembedded.org (Postfix) with ESMTP id A7D22747E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 01:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=X/uIQo+L5zZogxzjkbl0cejMvoeQAxENvtIx++Dq0Ms=;
	b=pMPE+u/E3pQTh8pi/h4MG3VG/YpUBW9eWl871G55kBVgj08GIiQETzfjuMjey3XK2+WSct8WJbsNzTQT/l0tyLRvZjGmZl0qsVUFaeKrd0/BKB/yTfUkto3kvzYyHxXFbpgVMVjJl0bznPTp1Mg3BP1VxpcW+vJ3D5k1RcJC3dg=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MW2PR0102MB3419.prod.exchangelabs.com (2603:10b6:302:3::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.797.11;
	Wed, 30 May 2018 23:14:39 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2018 16:14:01 -0700
Message-Id: <20180530231407.19759-2-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180530231407.19759-1-mkelly@xevo.com>
References: <20180530231407.19759-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR15CA0072.namprd15.prod.outlook.com
	(2603:10b6:301:4c::34) To MW2PR0102MB3419.prod.exchangelabs.com
	(2603:10b6:302:3::12)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:MW2PR0102MB3419; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	3:ocmnuoYcRKKQk2jWLfSIyi/ChOS7CY/16y1pQNfpX1qTRQyrvi06AXXnhmXuRJLeaTq9dW0ohQDUMCulsiKCA/Fx41zOYYCQzZTvF+8g8rb4lggIk5x3ogS1ZqvlvAr06rx4vARXhFcIO60tpbCUIXGRaNOZz8fzNfshVoq6v+cip8avbLqc2DVUbZ3qJ6OT9KzSi7qO6D91OMwVEQ0Ixcmc6AE5f4yXqtPjKjgATMC0RQFUrcyoLEFNLrcmRZ35;
	25:gZ5LI6kAGvQaic0Iuvsqj/aabb/KGBrNj/ysQ/8V3eQ6xdUbitxo8Uj1jJreuaKmy4S4ZOUj4Twun/FuGlIRB3cjANPy7qWNByZ/Nlj7zvzQmJPON8RKEk1HHZ6aDg2Fw8yQ0KTCSepQ+U2l2CvaAzggUz2eHKmwcUlrd1IlavAYip5jJ8OoZtSv+WcUnMKpDZEsSkXezSg+uNuqOBLxRxmJ1c1elZggr4OX2wG6Cav7WWArGDHCH48y1PIlu/dXOF9NAe4SgnLEgUVOzQqU/CygCoq3vQbklAPouy5xm7/DGnFIS+kIWtc7dYHJGSMhiU1Xr0dP4T6Kjv/JFcixVQ==;
	31:uua2De5np3S7VgxRYI8jgwtJICUPgql/M2M9Tp6rBXzTjFJ2LZLZtiaQ4nSvOuvqVhC/z/sOeRhHj54LNRFFNTYd42LMLTiCxWVptRXQURQTMUz6Qavwxon5E4eBD4C0JfpvP4sbghqzusrBZ2DbNnLvCFtKmrFSqPR02pnFWq5uWsbwshm4xIxK1/ZVO61c9AkOVFs/k3JSVEUt1EzgNt5UxrEvpYPZtySKd+3p4cc=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3419:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	20:VuM1orYJXbV78sVpXTBneHWXrlvIrWNU3ShduPu1l/16L3CvSJSxbygwWI04onsfFQNonE9LZ0xYbL11qgArbrp7rrll92pF5WQHkWMJzAaPDPF1qGxTFx1wHnebf9rD1kEskE8fd/aTwdTp/03yGft3K5if1LKfOGcsnDvHqLLjPY5h0HbgitdqDjje/kAn6i36E+Eo62BphEUzc1lqkTWXjrRCt9AnuDJWa8ArbepazkBKEy/BtWiaa+sHO0WFlRK5m8TaeNPmKLLSHqqnMtSDWM2tWhhF5Pg3IzSQmh7j/St0y3ifJOSA+WIA3+hhHWl9c/pXRCevaGusc0UBDoN0x0CGCR8uGVWoBF6kra4zhGikLG7e7QAqrjT4bAi7VapFr5ry3x98UqqZVeRHXcX+ANsMdFDLljusFo+4lLyG4kYW9D1jsCqDTFygQ3FXBEeL3xcmT/FOOnTufrqp42UNRyGf6ysSUrBrU7Z85hbiL60qcEIcNhK9loy7TKM/;
	4:ks92v2945GPM33RjwGBbeFS+lgBbC5pg86w0jQUJWRYMqmlNaAQPfe/JEacZ/TEKMOl3MPQvss1CqQitPrfT32PF1N+24xzvtkLiF0lq5FwT9kN7fnDC+ClzRORHZ2UH0aAhyIEQFbK6k/r3W7d8OfrMxgiAR645bWvaTkInWFnizdoVAqTg3knQm1cuCRQ1nGQ7pi3a1EuYQB6P63S5b9EGlCxTlc6uhl4AAu7yKZLiqTWPiuDc5BwQGmNl1hCo3RjijWGrrVEzX1BNiIexnw==
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3419F79083F9323433DCD1DEAB6C0@MW2PR0102MB3419.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231254)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3419; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3419; 
X-Forefront-PRVS: 0688BF9B46
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(979002)(39850400004)(396003)(39380400002)(366004)(376002)(346002)(199004)(189003)(11346002)(1076002)(486006)(36756003)(16526019)(6916009)(186003)(47776003)(2616005)(956004)(50226002)(3846002)(476003)(6116002)(7696005)(305945005)(86362001)(4326008)(39060400002)(386003)(53936002)(52116002)(51416003)(478600001)(7736002)(26005)(6666003)(107886003)(76176011)(6486002)(48376002)(68736007)(81166006)(54906003)(81156014)(50466002)(8936002)(25786009)(16586007)(8676002)(66066001)(316002)(5660300001)(2906002)(446003)(106356001)(105586002)(97736004)(2351001)(2361001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3419;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MW2PR0102MB3419;
	23:nsfvrxN64/T6dLylqAj68QFuFRenKq9sw8tDVld?=
	=?us-ascii?Q?3RDCorTHSLDwZuVyCNc8tzxkYGg1V7ddlD+zzK74DX4nAx1O+t20uwht8Rb3?=
	=?us-ascii?Q?qHovEvl7HyaGxgpMdA32cCUp5eXWbKQYk1AOBud+BuHzbr/G/IkMXeU9aRyG?=
	=?us-ascii?Q?jcWfUV6uPOeOVkfE1nCKAQBZlJq3g7KmSUD02uc8FsbLvXGXXC8SFpNSOKvG?=
	=?us-ascii?Q?l/V3i7LqQ4NH8IQGWx9FjfReHD5Od4Kv3rWx4eBM9lhsaxTXytzbKZE34WJi?=
	=?us-ascii?Q?xAW0xRkaweOudnmA0aeyxg6zKBaonEQTr4q1AcmuGiYXBaCkIuCk8MimXkl5?=
	=?us-ascii?Q?ro4B7XV824Kytd+6o+tgOvy/Z9YGHTOnPb0onk2PwKHY3tZbkpLR9ETjCKvw?=
	=?us-ascii?Q?eTkKBYalj25zqjQ+tFR05UZREyJp/1QV3EdrM9ZB7CD/VHiCLvgvBIxbsZXa?=
	=?us-ascii?Q?j5L6bXV8R2yhaKhdEWEudn5AZhwyiZqwrGnZVwXofHXsuY0NY6ZumydyEdVj?=
	=?us-ascii?Q?KbuuDMhdqwJIe5inL3A3CFCJmw3cQfNoW2kj1ea8FWX0Gex6VIA8b1FmCxVf?=
	=?us-ascii?Q?UqnSL3gaxgkbpfoRoAVOTgYaayWFQTuvNgJP0QRw/tZ9g83X4KYhJhI9UfGe?=
	=?us-ascii?Q?aA2iP0UZNbzjeYHdvQQyVC5w2XXIgsWRqpvz2fUeiib+t3sB5ipFJ76qOkOh?=
	=?us-ascii?Q?z3kSStuwYjYb7vj7OeLYF9Hqm2k4ZD5v83VorGibcs5+hswoLSu7yZsPYqKz?=
	=?us-ascii?Q?WrpvYNRD+trh0xmQdTSJyvApjL91whvWfGB6nqNqK+cVoRjW6SUxxdHqqkSX?=
	=?us-ascii?Q?igPD+ra+q5BlVLOcnvrW4WDUcOtYWk1NNPbgkclV8VMLpG8GOM8DQlZCid71?=
	=?us-ascii?Q?6DhdCpHLvuHMDGQYVqkTub4q6rgdSEZ8isoaCLdc2KcI4sHBIDP21PgBV76S?=
	=?us-ascii?Q?ABqveKnyuPdwCMmtIBoxJpFVMZy+mL6ic0c3vcqh58TdDeWYs7xVEK6ykf2P?=
	=?us-ascii?Q?B+v59lo1qAqdbX9llIt0+ht2Vwapufq8Qty4Dh49/oSX7cGiMnTHMZUJ+aNd?=
	=?us-ascii?Q?maECyRdtfh90YR/3ZkJTIk/gQG5EmFP/srneuiGmzuqikM6gfYmQBdtIrdFY?=
	=?us-ascii?Q?OSwtuCF2eUolv2S6KR5YNrpzfB9EVTj+AqjYlIUWIvzqRz6MJELyRPz7wVVs?=
	=?us-ascii?Q?awG5qAM3s3xNAOHM/wN7XwYggFSwGS+4lED1YhFCB0mvI3fK74i/jo5jF0bw?=
	=?us-ascii?Q?6p0PSSrU0ypznDppvaSsrUPgWxo98bPS6xBNaNdjvSNynHlGnkVlSItpMKkn?=
	=?us-ascii?Q?vdCe6RCXHV/YECvorTSI/W/nfBoU2Bu3E+vxW8Af5WI+QgmPJa3R0xppjS0B?=
	=?us-ascii?Q?AxNCmzUry9/mmw5NyGiPPI7rkxps=3D?=
X-Microsoft-Antispam-Message-Info: 6cJ5FUNSOlJqlMeGzD3TlnkUdrYPwj7APUnPPNLdXFsHi/D43C1FkOOxOT9yjHHyuTskXikxBToUvcyluAA4OWFLcGv2U2ODUhFlQPhmadSTEE2DmhzKg4gTjirzBDooynkoa68Lvmr/g4MHlkEhjMDZySBlJjiL4OBfj0F83A1Fygabdlk+SKxZT/ooIOl7
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	6:MSbPpx4YkDVOke5mML0HtBAqPeguGp6aowlYYo0mAVnTzM/X7C/jMrLLompwvWZRaQv31VGAq5G8DXDE5S8t4cuDUh9iBKDrKBURl+8Rq0IAIyPF0Pl8Ovo0WLYyQTCLtJ3hFaf511q3FYZubok8y77s+3TuxMWMGr99FLbQwJRR6pwI7GVudB0l2WJUpwF4hNqagIZsm3XPrl8P9NXO7ShFl2CZKG5cELR7jvhXBt2hQ/WWAyCuRvl2n9QDBXCMSvCWp1W+X42eJQXaof4+S90L+uIgvlPMFr+xAx3oPMP9eRdC9ijHUP5GIqyp6I0190VOHswypEZcJtN8UjFwe3FtA4aUjJ001yDpYcSeEPWYxhKZI2V1mFK8p+fDupjFz9VVWsRAXQG8FIPOhGnCe3Z5l160ab3j9/cxKhtElO3sGWkNSpHWeURvHCUXhyvId5gnfEdyivOgyYsxMYUffg==;
	5:K3xPAkRZ/K6m0W0qeWl/OHxuctkyDzi6ErbBewpvB3bJwaEufrusU+X4Vbc8zcp4HJBqFljKzrnSoF+epcBU+gKn0nJ7vRdJTiLpK75+8KoVZ+S1QDXpOSmMJBbVFTNyfGyn1Lkuh5x+wos2Z6haz05hNjytDnGCQXM8/Hwv4YA=;
	24:tVX7w216gfsiAk98RQ82bUNz1H774aiqWsoZaew7BoAVM0tMbb6fR6r9H65NRkJJH/JpLABL2BH8wdrt/KchqFZNuH7z/2NmG0+ltzWeOhg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	7:bhz43DwCsh6AF3BiXwD6O2H9/CMy9hjo8Ja03yHlOtWgZMV7mCfaqGCCiWl9sLLBxz5vB0Tr5Frz4q1w4eZujRTE6suRvOg4DuKxX3qD5UtaYJLz9NE6iZANSs8sLRkNETxPQLsbfW++tfvULI5GUQ8gWxxiU3dwLlQsm61xompfO2qQ0T+ww2320ENFVYu5bokJffBumtmszXyLuGDO2kslN2cZwx6QnfEs2iHKICONfx//mRfdN6TErxnfbjpl
X-MS-Office365-Filtering-Correlation-Id: 4f660fa5-fbe9-4bde-8d70-08d5c6831e3f
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2018 23:14:39.2977 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f660fa5-fbe9-4bde-8d70-08d5c6831e3f
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3419
Subject: [PATCH 1/7] meson.bbclass: refactor native override
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
X-List-Received-Date: Thu, 31 May 2018 01:46:13 -0000
Content-Type: text/plain

The native override is specified in two different places, so let's move
it into a function to reduce code duplication.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/classes/meson.bbclass | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 2d7ee4fffc..5881765abb 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -90,7 +90,7 @@ meson_do_configure() {
     fi
 }
 
-meson_do_configure_prepend_class-target() {
+override_native_tools() {
     # Set these so that meson uses the native tools for its build sanity tests,
     # which require executables to be runnable. The cross file will still
     # override these for the target build. Note that we do *not* set CFLAGS,
@@ -100,18 +100,15 @@ meson_do_configure_prepend_class-target() {
     export CXX="${BUILD_CXX}"
     export LD="${BUILD_LD}"
     export AR="${BUILD_AR}"
+
+}
+
+meson_do_configure_prepend_class-target() {
+    override_native_tools
 }
 
 meson_do_configure_prepend_class-nativesdk() {
-    # Set these so that meson uses the native tools for its build sanity tests,
-    # which require executables to be runnable. The cross file will still
-    # override these for the nativesdk build. Note that we do *not* set CFLAGS,
-    # LDFLAGS, etc. as they will be slurped in by meson and applied to the
-    # nativesdk build, causing errors.
-    export CC="${BUILD_CC}"
-    export CXX="${BUILD_CXX}"
-    export LD="${BUILD_LD}"
-    export AR="${BUILD_AR}"
+    override_native_tools
 }
 
 meson_do_configure_prepend_class-native() {
-- 
2.11.0


