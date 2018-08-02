Return-Path: <JAEWON@xilinx.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0077.outbound.protection.outlook.com [104.47.36.77])
	by mail.openembedded.org (Postfix) with ESMTP id 1D2A471A0F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 01:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=cxwtPaPF/8UFZAeuJdIyB1ClM0JkixXgHQAzz1GfdII=;
	b=BdsEIWehfWL/ErCF5C11qR6MiX1aHILmNCxEMFoq80mW9S4LlwuJUKK5iTshcd3EjlyWBQ+Au26GJZie7amBJMcDsK7miAwzmyQ+crbdjZun+UfzWwSSWLuSJ85wiKmH+OySYzgN8x0eD15ihSt9s+TksO/lxYTnug0kS4VqO+A=
Received: from SN4PR0201CA0001.namprd02.prod.outlook.com
	(2603:10b6:803:2b::11) by DM5PR0201MB3511.namprd02.prod.outlook.com
	(2603:10b6:4:77::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.995.20;
	Thu, 2 Aug 2018 00:33:19 +0000
Received: from BL2NAM02FT040.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::204) by SN4PR0201CA0001.outlook.office365.com
	(2603:10b6:803:2b::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1017.15 via
	Frontend Transport; Thu, 2 Aug 2018 00:33:18 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT040.mail.protection.outlook.com (10.152.77.193) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1038.3
	via Frontend Transport; Thu, 2 Aug 2018 00:33:17 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:59312
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1fl1YK-0005gb-Uw; Wed, 01 Aug 2018 17:33:16 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1fl1YF-000890-Qf; Wed, 01 Aug 2018 17:33:11 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1fl1Y7-00087g-6A; Wed, 01 Aug 2018 17:33:03 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2018 17:33:01 -0700
Message-ID: <1533169981-15402-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(136003)(39860400002)(376002)(346002)(396003)(2980300002)(438002)(189003)(199004)(81156014)(81166006)(486006)(316002)(336012)(8936002)(51416003)(305945005)(50466002)(48376002)(356003)(126002)(476003)(478600001)(14444005)(36756003)(44832011)(36386004)(54906003)(16586007)(72206003)(6916009)(2616005)(106002)(8676002)(186003)(7696005)(9786002)(50226002)(63266004)(77096007)(106466001)(2351001)(107886003)(4326008)(2906002)(47776003)(426003)(1857600001)(26005)(5660300001)(107986001)(5001870100001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0201MB3511;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT040;
	1:gtu7o43vtu+1IAyXK2Q4wNp2IGoVqtTjWCjeQfjbkk1CBesNnGpF/WmDIcC0GJ7VhAXjNPsMq1F9/hjazKJpS784lelC8AyBYzM1RcZ+V7fmri2b3cOzfNAlQd9mCs8l
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a40695f3-cfea-44ec-d9bf-08d5f80f8ace
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600074)(711020)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060);
	SRVR:DM5PR0201MB3511; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3511;
	3:TBD4Bi9S2CWzZGpg009dMcPxeEmiFCRGDedBTZwbuIz5CqNmSUePL1Pkdkb0q1TO4mxnXlgDMbD4m7cl1D3cqgDY1oTsl2QrEwPhFbEX7m/RnbjxkaBNYqsmLAko8M+IfKhCApUDbqfBxSJny4mS/5A9RkQo7u07Fi5lMWTI6Da0i6gzrm76NolHKyzqthHZex0s8+KI1hYGz+RqdK4vz6OVeUpObkEV5uGR946yg/4UpchRDGHl/EYrbG+lW56ptri8gn3dOl9Gt55X00ElrHTNCJeydad/+I9wlk5gsK6wG925VbrSit/AhaBPuxsZy+fnoajgn/oDCbtdvHjYlq/wUK+tkwEkOSM2y7XGi+E=;
	25:6sokTMU94mGrAIUXtf0wT/8gTAxkAy7hwMCHhhGRsL9FAdGJEoDDr0sjBk3InrgO3gGPnioGYDHpgM9oAk+DoQCocgVn2MBptLbfqrQT0sxpE9yQVL5Zc/rWVUd0DvT0tcPz4OsCwZy5u0vXu62Fwn0ZQUDnWesqR89gk0qWFa9Uv1wjP9Wkz+9nsRXMwYll0ZyuanCbybkHCaZgdB3hf1wGzROdrSQanyDMephzz8FwkZduyp7CfBwBcTf690EXgSKIEQYI669keEPyvRMbKgWxwGx2isTt7kb+D/aY1bKFsgx/klEtxePOBKLPIdtUtfgk0MkxQ45o3Kev7CRV2Q==
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3511:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3511;
	31:YzUceJqLmjZmCZ0hwPmKISEzaVtbVT1yZWxEIBySLWELfWSd8A1G9tn6AGUbNKoZmBZ9oFlihc31kLsvLMY9nwgWxt9K+ybaOdvJ+X2b2YV/xK/vuQJgkid0C79ziwbp0csBeJeT/cNvkDY0VcGhbEoPOHQxKdsD0HNEK42xwJBvhmbU4YDEJ0DkgboTeBXXfY71bRaPULAWlThbmPgIrvICfewMZ+HyT8oJNVgRWZc=;
	20:WV03loi7P56a+KegqbxAQNrlV0sDEU4iHo8kCYA4xAqsf8Y97O4Fx9izG228stneGFtkO7kHas2b9cfolhhhXLrvqnRrJVni3fmj4IEQ+0LmnrJncVU6mds7tr70VU/22IZjxwSCISd1Bj/ux+1Y9XQCVVDsbp9qq6fJWa/RtriW8mQcEZhZIQIeJvuxO0uEh9s8F7iGorkw3U/5wHzmuhSwA+la4x30tOUbdI2usd2QxqC+khV/4nnKaF78TuJea1dP9xNPoyvMh26iRPaRsofszOGM891awQD8tvm60vVFhU9FlTrhWDUW3blP+CgscF2CR/8zaCL0OLuGgFP9QKr2AYIt+ail/tvkXg8uP7YHgrQLiC+1UjydLNK1nyTqh1pkkDWDL+DNDuXE3pQ7aZ8T2iBtwr6gvgeZHX8P7RQp9s0ct4+je1sH3+Zm5sRD1sih3gg2dMM+MTe7bHndM1wL67qiKRSIz8lzuhI3S7flRXo6Ce8GjxOEnA/nMCZS
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR0201MB3511CE1FA77878AA44CF99BAAF2C0@DM5PR0201MB3511.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231311)(944501410)(52105095)(93006095)(93004095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR0201MB3511; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0201MB3511; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3511;
	4:+5cHDz2F8nUzVl3ksWACWKUAppSNMBKqPayjePjPa+ka7GGaKzHpTA10SzyP0y/jLC6xMm2BpuEPY6M+AwBnqrP8et2WBky44RqRZCsj2ds/i88dDdLcJFj7ovaO1HvJVaJLiWxbTQt3lJfzu3YpvT6rAhj0e8GktfV6i/Nh4MOhm0xs4JrtVwJ7LnosAMu+Yp2CzK4AfwVcz2Bnk4lC6hEK6YbiBuUhf9k+8+TPncVUHTcbIn3z/1CGPnflupNzq7WECyYNrAMnj8BUXEllf+8eY0Hgo4NPfTiz0F8v5pGvhyNLWjigxu/jAz/bWRYq
X-Forefront-PRVS: 07521929C1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0201MB3511;
	23:B7Kd7qdYuRsTBbVRGfNNzipdO6n2fpUu7C07ARM?=
	=?us-ascii?Q?+cyf1g9OtVgWv5g+NokhrivoPLUYNWr8xakvB03HTwoocx3bHPigWbv6fPoF?=
	=?us-ascii?Q?IO56ENlH58XUtE2YtW/oA8ZJDEKaDl8fBCS4YWdiC351IWnuqXu4sdOPDReT?=
	=?us-ascii?Q?5kCb6tAx0lhneGah7LEDfqWRxrF4rlaMCQdGs2obGO2c27o44oNv6b4SxBjr?=
	=?us-ascii?Q?rV9jfm3s2pSOCgrn0d4HqLI7j13U+fGgG7y0JQdhIN9JJdAj+LVCSWUyggew?=
	=?us-ascii?Q?Z0+0Sa0n1Fe1kO6dJxy7rNkVj0W30WtndK6O0WqqoJ4cBx1g8HbueLr4ol+L?=
	=?us-ascii?Q?KoAT8JTrqL2zqvdcmTBMt5OTsuJas5icpAgJUjZ5PTXIj1ZoL1Ocaz2LkbHP?=
	=?us-ascii?Q?MG++NgbjoM17jSaXIll5X4ITJzQwael/sOq+lZmFyfpav5b0Q9L9/oYyuWTr?=
	=?us-ascii?Q?gPMBwoVsCkblfWignLOR5sNoLrZELU7awINBSNx3tW+KI1SYx3Mb9Tf8tvyj?=
	=?us-ascii?Q?aUjVpXSV3msC/9r08Pjd/5Wrovi/XU4t+6NpI4SrdXSvfe5uktaj0k/3Y39I?=
	=?us-ascii?Q?PV1Bpv3OjDmpoVXTRnGJ1p/fFDr3sU7VvXf1+Sf9eD3qO67puhv5kkPN8Y2V?=
	=?us-ascii?Q?e/mFHYs/VBWL669I3ljdK+WyIrkgCgXnPWIYXis7pCRa/qmDub0w+ZXpHNap?=
	=?us-ascii?Q?QDhLkPv0TZcHQi2Q/VVwiifpyuQ7CTSYYjF8XHh58oK0jkY7fqRb/l5Tf+mp?=
	=?us-ascii?Q?36bUtUiSNVIgxHf0lDaiZoJvNFUE0CZ/OFQORnRTRJb5VT6lG5c11YJEwFwb?=
	=?us-ascii?Q?CwdIe3R+CoWYsgYeVNU1SDmFGjQFlVYJPys7fXyqTQK61JkA9jiEoxaK7lE/?=
	=?us-ascii?Q?N4hW7T/XDPiIs3nRKIOw9txrmY62aF6ScQlzM2+bW9UBcIVCQLjeRzhnYmWp?=
	=?us-ascii?Q?QRfLYsJnul7LBdxXESVOtEIY/N9M9NSe00J5dIumwdDU1OzBwg9JO1gtiGtD?=
	=?us-ascii?Q?TKaW7LNZt17m3Wkjr8bKELHlfuERlEiAvaAUOIq6C1diRDRIIO1MxIQR0O94?=
	=?us-ascii?Q?cf3FrGSQnne5CqxZUwtwWa3Mm4SpAI+Jch8qSaSb8y8hljGqq1G+L54jR/MO?=
	=?us-ascii?Q?wFUHTqkEFW3P82AFBxfYhMUBxVeEeQWvLYxWk62sE+EH6WPndwYcx9JzTUw/?=
	=?us-ascii?Q?E1yJZZfkSNMhwI3Iic6IjCG6kNuoaWHQmWh38WsVnw872pWB/N3rK9dfWAFu?=
	=?us-ascii?Q?qI/bLmLohnY42Wde1s/qfAgA9Xa3qw+3H+/DeaTqk?=
X-Microsoft-Antispam-Message-Info: CDKFEuZXV/4QKKmv4RV0PvllPOrD/LTKIiG8069W6ZvHJgvlL0i/bssR9bfR8XnTMF85u4I8y/OmU4EBevrqjL7DOoYd/v26Rh44N2nBJe+5FB3ZrqESUZWNYIwMgxdTm0cLJmpodeaCUVvx4pgqOlq+tKN3ImSJ71DI0C7mYW7esNnjjlGk1hce9GhgAGqANfcOvKfMlAN6Vnex10kjZxfvu94X5Ee11mMmbbhKSW/cyamyUWuu3l9W3vwc6o2psfa0sss+PxqFCNWRgVWpUcXut8MK/f5dJoYrQKNxCXzeZFNH9RcUFNsfcjVHj0ut84KLjyxL90sMgZKf0J6ucfKjrs0bxwqW0YkbQoa8Oxk=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0201MB3511;
	6:aaDXwy8GHpIYrs1Mdt33hExZYsg3u+VwIFk+kHqTA7zqa+BbHktmqskWbOWUg6etTsvIQThQbYcreky7MmPi8zkzUx0QCQFEr1dM+4lkv6FhUzXIwP6CnQCxUlYma0J7eTVWL8x3oRK6n9GzeJMgiuzxSqCxckLztRo4ivFVbm7P7rHu6AxfaikKg7J1ryEsUtS38dZRa9XjPwLp8+mWLNmvkGNVTSXRfdJcYna/tpWEmAn92LHpjWlSy/Mf0gMLJFqpnwzBR/ET+gW4ZlmlieCWdyZjP6wcj7zlEuxO2y1WkYLyfqgaQSf1nQnVsonovZaxmwPKlbE9pEVsCgrgdx34KPW6mnKyzt8rfZZ3Qraamrnf0mwGm9N6d4IpTBsDrHCxD6Ixluz+7jDUrkK5rN2o+ZaenfSkQz7Ymb2Cx1TT6ZttA4t5L1PcjyTUTiGEZtERLO3575duSNL/vhTmVg==;
	5:Ky38sTyMjThJ7PGrf42keVlVyO8p5McxjP7QD1J1FrzS4RYMbMcbV0ykJxrp/XkmHsQYhQADHJa4fFXzmgxUUKKbJ6bPdIbgBrXiQiACQnTFtqd4KtzAZ0Ne7UeaK0sjqu8BTv9P7o4Yoybgh8rjgHGkZFDt+pxtP6HE9Oubzh4=;
	7:IUqheej/oFcaotyuDJWKzhZ5wowVhlmsftf/M6L9Ekc4VJ4XlB5Aj20A/8iSpFybP1bbZ+5bf7PqtVujGqZhpKqIJTTMESYb3fMrILqNSimt+hUV8lXRAe1ME9oUfcRFisyO33KpMGCEx+eDWZVEDXhiOpTH7PE5e05LdV95jNIJu3ziKrMmqBQZZ9GAa8+DPQB9M/i9FVtJd76Vr6DkI41eF+DMAKlKzCggamJVlpUs+1MSFtsTmF/F9BaW2N3w
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2018 00:33:17.6209 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a40695f3-cfea-44ec-d9bf-08d5f80f8ace
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3511
Subject: [PATCH v2] devtool-source.bbclass: Support kernel-fragments/patch not in SRC_URI
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
X-List-Received-Date: Thu, 02 Aug 2018 01:07:21 -0000
Content-Type: text/plain

When using a recipe space kernel-meta, scc files are added through
SRC_URI, but they may include corresponding kernel fragments or patches
that are not necessarily in SRC_URI.

For bitbake, this is not a problem because the kernel-yocto class adds
the path where the .scc file was found to includes which consequentially
makes the .cfg, .patch file available to the kernel build.

However, when using devtool, only files specified in SRC_URI are copied
to oe-local-files in devtool's workspace. So if the cfg/patch file is not in
SRC_URI, it won't be copied, causing a kernel build failure when trying
to find it.

This fix parses local .scc files in SRC_URI, copies the corresponding
.cfg/.patch file to devtool's workdir, and also adds it to local_files
so it is available when doing a devtool build for the kernel.

[YOCTO #12858]

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/classes/devtool-source.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index 56882a4..623b335 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -90,11 +90,23 @@ python devtool_post_unpack() {
                         fname in files])
         return ret
 
+    is_kernel_yocto = bb.data.inherits_class('kernel-yocto', d)
     # Move local source files into separate subdir
     recipe_patches = [os.path.basename(patch) for patch in
                         oe.recipeutils.get_recipe_patches(d)]
     local_files = oe.recipeutils.get_recipe_local_files(d)
 
+    if is_kernel_yocto:
+      for key in local_files.copy():
+        if key.endswith('scc'):
+          sccfile = open(local_files[key], 'r')
+          for l in sccfile:
+            line = l.split()
+            if line and line[0] in ('kconf', 'patch'):
+              local_files[line[-1]] = os.path.join(os.path.dirname(local_files[key]), line[-1])
+              shutil.copy2(os.path.join(os.path.dirname(local_files[key]), line[-1]), workdir)
+          sccfile.close()
+
     # Ignore local files with subdir={BP}
     srcabspath = os.path.abspath(srcsubdir)
     local_files = [fname for fname in local_files if
-- 
2.7.4


