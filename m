Return-Path: <alejandr@xilinx.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0057.outbound.protection.outlook.com [104.47.42.57])
	by mail.openembedded.org (Postfix) with ESMTP id 0CEDB7481B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Apr 2018 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=V/gJQb7S5LOWuH/Uro8HXmBCulVJsv/OVGxFnv2+kHg=;
	b=XFQeSvtBgOTQ4idFqUFIUhTVJmGzXJ6MvTQ1Eh1luP5PXCQQTKW3BuAfGIAI/OysnzXCZd1G4eKJN7u9fRXo4W8i+jIk3ndpJDYw0jRnvkFSpMLdkgaVuQAOQGuh28J+PPaFwCyTr2R6aca76VwZAIF4HazftOSquqqv5DTwjyE=
Received: from BLUPR0201CA0038.namprd02.prod.outlook.com
	(2a01:111:e400:52e7::48) by BY2PR02MB1300.namprd02.prod.outlook.com
	(2a01:111:e400:5854::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.631.10;
	Mon, 2 Apr 2018 20:08:52 +0000
Received: from BL2NAM02FT029.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by BLUPR0201CA0038.outlook.office365.com
	(2a01:111:e400:52e7::48) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.631.10 via
	Frontend Transport; Mon, 2 Apr 2018 20:08:51 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT029.mail.protection.outlook.com (10.152.77.100) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.631.7
	via Frontend Transport; Mon, 2 Apr 2018 20:08:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:60799
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1f35l4-0005NV-Gb for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2018 13:08:50 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1f35kz-0003fT-Do for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2018 13:08:45 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w32K8hep002272; Mon, 2 Apr 2018 13:08:43 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1f35kx-0003fM-HF; Mon, 02 Apr 2018 13:08:43 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Apr 2018 13:08:41 -0700
Message-ID: <1522699721-2863-1-git-send-email-alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(39380400002)(396003)(346002)(2980300002)(438002)(199004)(189003)(8676002)(1857600001)(47776003)(36756003)(8746002)(5890100001)(106002)(81156014)(2351001)(50226002)(356003)(63266004)(305945005)(81166006)(8936002)(6916009)(51416003)(106466001)(48376002)(336012)(4326008)(9786002)(486005)(107886003)(36386004)(7696005)(2616005)(126002)(476003)(186003)(478600001)(26005)(316002)(77096007)(50466002)(426003)(2906002)(5660300001)(59450400001)(486005)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1300; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT029;
	1:ZnoO4hal10+UynqZ0po596u67vFvBiUGJQpa42ALaAi3FvJYWR2l4KA8SXRp6A5VpVFflTQb/L5EqPwEH/BWRL3my70oB1NyxrkKBgWLNelx7SQfZ2XU2X4M/Z7h6h9O
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d2fad78-24b6-466f-2c12-08d598d58d83
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:BY2PR02MB1300; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1300;
	3:G2Tpp0B8vcFKFivHSwnokktA9BGRiR/PPH8PiWKxglb1K74PlgoRt3Gjxm2T5ehjLOakUGFA28tDclX53Aaoai7DmjefzVj+42K+m7wMr1OX1QJFQmzz8Oh11ot2b+SBg5ptMvCIox1tRC0LI8UJ/2OGZfZKnbOkQD7CsR90BXL9oOivYMloGALTC1VCc5HlFDEUeG6PmMh5dEie5oYMOhXE2gtNBQs/G9GYx+qYU0v6VziSktr6/6guRT5HjR9NGm5sspF/e/mBZRkNH2E4ywKYB+VF5ZkMFzBe7Gg3mYT6fdNEVCN1wRpuZMnADh4Dw1Eu39sCSlXO17aGsoFhW1R/MRoteC9A/2jwQLXlgKc=;
	25:yEiqg/6+mzn1B8GDC5qlCHlSyiVru64jskXCQZr0/qm5XCUndfYB9v3d/mw6OVM6Z+CmvD8PqryYg17KS8KwO/GyapyG5XT8xBu43LNdXkcQrcOJVEeBEA5jbssg5LjKj9c1M6A7OTw5E5kyCE6tlgtbnqOKX3/oyqbPis2EpzFWxW53prqPe6ozDVD00rSnSliR+j9TZf8kmM2tcTLli+o1/Uq5Qf/aj7kVt66pCg5edKclHX+MTHzoXov9XsEi45c0kNzU6q0yjWfNn11kOV4H1o8YHjG4w/saObK881JIT/ijY+ntnIGbcL/KmzScqqTnBtfSbJTnOtG1i7eetw==
X-MS-TrafficTypeDiagnostic: BY2PR02MB1300:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1300;
	31:ZSHEAgf5zFbznOdIc1bL9s9RLqBWP7e7j7a4N/DB3TjZGWgQ6Z3SwacE9fEi5xLuxQRhRDXbA2lttzXXUR587egcxa6asnHUVDahviAbWIReGxtDYOPvHORWPa8izY4QeJiLN/i5Q2I+cCO7n3mJ47TnIcv6tjG0CTaK9F2l8URYymnfGNHT6HTrFCtl1/801RZE4slbAqig9dax1q8fqX17g9zSESVCWlqovX3ZRHA=;
	20:FXDAWbMFgHkTLdAdmJXpvA1gF86vIld345ydHJT93wYNInMDn9w+vH4c4Olxj9dJJW9WhaM+ID04S0V0hNiOPVHwZ4mybqpmPSzKf7LYo0BsNFRVZxNKs+29Qu503pZcrHr2OJD1Qm/JEPbUFa8K1h7mmfpP6i/N3hs8A9cG/0sIINJDjkCOnz+RB9o4po062qgr3HjWo0Y48lYme+7VNM60GmGiKr3+ugVpWekAo7IYzZrrLFEd/hcXruJ+8zF2AIq2KrtwdZkmD08a2ae++3aL6AnxKx9nU7j6F2tznHQIGuDuZjdQAIGM11AZBSgyg7AM4SXo1CbgKULzwRcV208DoBv3YxilbN8RtNnuwn3QXh4ebJgLeOehPvQVJJSoVZCs/Xg+iuXISwDsEm8u4WXUH5vQjYv0kZfoxcLn9K6Cl8v1ZOZ4hCI1EK+hz/68E8mvHmnspHVP5eFF5vruefkeFHcbTFufsEJPqENBGTkGK0d+nY70QnfQD3JwF6l5
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB1300265EE66C97CCAE39CD40ACA60@BY2PR02MB1300.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93004095)(3002001)(3231221)(944501327)(52105095)(6055026)(6041310)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(6072148)(201708071742011);
	SRVR:BY2PR02MB1300; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB1300; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1300;
	4:EmSAGQ54BkIt5/sLj/KMIV8RrYC2dIRkmiJh4XI/0/Z6IMM7zWtxRj1IXA+gTzzyupGaZiw6S4NA/xgfO7AqlLUxAsd6Qn8KPjjEup4yAxo1MjnYr5kN9I1Y9SROh2K8a4FsANL7/fVXFtqOypPeOoctewsYM+tHcbcuZW78uTc+p7ilIjaqeb48W+9oM9QBzUkoWcK7h9EArCi/FCLHoHIoTz0BHvca3CvOlO4Kly2rUqubhoK0VQzYXJ7G2lTK73cghCSYn8roU+bsnpZubklC3Iy+JtqqGMDtRDMRVw/F3qJkR5YeZPsa6NuYN2IV
X-Forefront-PRVS: 0630013541
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB1300;
	23:5lv/8Ypih9WMlxTEoEZh/axYz6vKHVw2uFQpAfGhM?=
	=?us-ascii?Q?oG5GOun4FNHOHvNOrEDLkf8yT2t9nb/6Lftaqkzs9m6cCXKOaQyHqltUKalr?=
	=?us-ascii?Q?HDNwz0d4r3JdysDrWc0Eg7WR4Fses7LyN8UnQYbDDve8q7Se4e2gXx/53BD/?=
	=?us-ascii?Q?v7qao6SoGiyzty78kdpSdaeSz80BZwQG52Hh4/IrcTzHhSVRULVqPtPdYw0k?=
	=?us-ascii?Q?qobYkI2JCtGbClPd96H1YF5YKJNMTO0g+An8BD7YDj++6+4IJvaXGrBRhw1k?=
	=?us-ascii?Q?X0yQOxwhvs5iCxDIZjh2n+KecZkgdysqXhc2CfdUDJ4vUnVYNLUMpA9qyC3q?=
	=?us-ascii?Q?dolWYx7EWk4mNLVdqdJhKfPJrgOvEvXvVXrclfSETTNhazTEifwBlPGyqjgH?=
	=?us-ascii?Q?HOt3tVlNLRnYUQqXoEqzvByszG254AKlJTm3L6Kw+bhfRbL6lgWorT87gMQY?=
	=?us-ascii?Q?BMTyo/c2MV71PLoa5mlBQEocghtwOEjtrlxwIIyqPRmvIXLaO1QPSXayVHau?=
	=?us-ascii?Q?3CmQk+bENi6neRhAAN1/z7mK67BVtApSr1Iu+Z3snrdqeld/YDkUB+2xDSUk?=
	=?us-ascii?Q?I0mzgr0PVZgjkH9w7A3H9ImtjrUP8seK+tPpnwuy46mOgDSd9U9RN3wmJ3BV?=
	=?us-ascii?Q?e+yvVfsYU8FsPbVe9JXCIcHY5h3f32rziz+WSQ5rND3s/+tzAE3ytIYAr9O1?=
	=?us-ascii?Q?4EzYvZj+yBsQvyMNZCpAm8KELE4jLaCThBdDaRE2fzB9/QPmu5aQjuzKhDLj?=
	=?us-ascii?Q?eDJ97n+IKEdrJywnILgXmvTjM50jzBEf634dbwVi/W8vtBaLw5oLls2UVsbb?=
	=?us-ascii?Q?+W/F82u5KZ3jUgIt0Q476it0ziGo4UG9JrHxeXHAMkVLqPTzzGLHrEFyVxyt?=
	=?us-ascii?Q?glKJRrkCVl9HPv2WF55eH4cVRlPfHsPlYeFreU7ItTu+W7E8JVUmuTOL+dzO?=
	=?us-ascii?Q?sRTeECmNdxRAyg1CeWpzaew88d+FHpzROUGrId/+KV+9Vj4lRWhGs3pBlepL?=
	=?us-ascii?Q?46RdDCwTxZRqvqg3SM++OrH4m6kOL71BzNX8Wg3fCh+ICCer9f6/AIh4ZNPt?=
	=?us-ascii?Q?ghkHexi28cjL/HtrKroNxjhaqV9O7ROgrfDuhn3aoTlH8WoY7Dvm3PHT3BXw?=
	=?us-ascii?Q?qLw6OT9F/+XQGpVN7K2/iRopFMviHsp/CIaIRV5/eqknhPd1spyqQ=3D=3D?=
X-Microsoft-Antispam-Message-Info: 5sshIKKxM1QY+/i1m510boR6bhvI1VFR3eKSGn2Chi6J9GJ3AYRl9Nb8/epJ59hdCkw/uauFHN9jbLVD1PH/sxrFaPJ8RtyYxBFvCTiSAe1hUQHBRlkA0JVh9dHlnusJIDvEUd2Nq+wNp94M6BZYO7+NyJmhXz9GfG1PF5tLKZ/aPItObg4Tp5wF0uOGO117
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1300;
	6:OwCwkzl3G2sI+aPR31UqYppO5VqkB4b5UwXOxf7n+X69PWrv4EyfEYGxNNps7veYyPs1cAJLQxekyf3lvWzD/DIHQlaXJWDwqPI5oI5Wpn2JTXSQcJsJ7hht89i3r+/fjDX/s1LuX8p24iihUkJUTLrkW1/iZXdUBNJIbJpaIFiLTwfeSrYDTP2H2TbasYfirkKhP0q9I9qWh/JYryGDhmH9pRAlbM7NbOkVHUwm1fGLl6IZU2NbvVAXZMuFTcWeS6Z/OoDCMqqqew4oaarLw1bXMm9Nd4K0TN2tbr4pwufsi9mHZIVOSMTcN4UZNho+jGHjW/Uf5wWARdctscAqFTFuonxVxiTodO9aL16dEwptUwGstp7A+kco1fSRPabWbsRXjct6rPQpgetUmiWZZkB956eqoaqtZcyZH0g4xCatBNXj2OiBU5iYyyJmGH9G3OVEjcBEgZ0YVhRua7hYLA==;
	5:79rb4lGfqB7OHSbjgPOnyJTqJvwl3q/k+mtV9E4yBMvXN+BHHm3m1DP/2PC+fym9iY2Mgnun7o8g78Y/gfstvBsyTDgzzGuurpMsUp61Fvgquaea3GM6ymbWBFXt3RhxtNNSmaG7nlO7zGfJFA84mlD+oeCRa6PVg55oxn8kUDo=;
	24:Un80IwTjXwjTaMVEgr5XdeOpMCosAbxajAiyKGkKd5Ek3nk/eKStmv0bz7G9vuR+Y0R7FfdUXJ+hsTVdEGpr6BIuSpQp75Ke3DSBVWIZmR0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1300;
	7:GDz0AZQ+0oHJmGxdMpixJf9eV7ITfJPHgy3EXdYa0Fi+2gCOQyiXju6hsnVmRGO3G3rLaiOlmWw1G9CXBR7Twhf9y6Kyjo4Zi/1gkApzOc+LcYdgA20TRKD96mubkcjQ8VER+Vq6J2WBs6oAu44FWBmYLUpJzV28FpH4DgZ0jcAVsPCVuKCpi9uJDHx0bBEXy/LN6WRhV84BdBfnzc9NwComYHa/ztzcet9HYPbxK+rV6ouD5jhNKtE1U+KnMLuu
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2018 20:08:50.9620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2fad78-24b6-466f-2c12-08d598d58d83
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1300
Subject: [PATCH] python3: Improve logging capabilities for do_create_manifest
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
X-List-Received-Date: Mon, 02 Apr 2018 20:42:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Adds a couple of prints to get a nicer log, and creates a
small summary or report after checking every module, it
makes it more feasible for adoption, easier to debug why
a module ended at a certain package and see how the
manifest was created.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 .../python/python3/create_manifest3.py             | 34 +++++++++++++++++-=
----
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/met=
a/recipes-devtools/python/python3/create_manifest3.py
index 212ddd4..44f3454 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -80,7 +80,7 @@ with open('python3-manifest.json') as manifest:

 # First pass to get core-package functionality, because we base everything=
 on the fact that core is actually working
 # Not exactly the same so it should not be a function
-print ('Getting dependencies for core package:')
+print ('Getting dependencies for package: core')

 # Special call to check for core package
 output =3D subprocess.check_output([sys.executable, 'get_module_deps3.py',=
 'python-core-package']).decode('utf8')
@@ -128,6 +128,7 @@ for value in old_manifest['core']['files']:
   # Each module will only import what is necessary for it to work in speci=
fic
   print ('Getting dependencies for module: %s' % value)
   output =3D subprocess.check_output([sys.executable, 'get_module_deps3.py=
', '%s' % value]).decode('utf8')
+  print ('The following dependencies were found for module %s:\n' % value)
   print (output)
   for item in output.split():
     # We append it so it doesnt hurt what we currently have:
@@ -170,7 +171,10 @@ for key in old_manifest:

     # Handle special cases, we assume that when they were manually added
     # to the manifest we knew what we were doing.
+    print('\n')
+    print('--------------------------')
     print ('Handling package %s' % key)
+    print('--------------------------')
     special_packages=3D['misc', 'modules', 'dev']
     if key in special_packages or 'staticdev' in key:
         print('Passing %s package directly' % key)
@@ -219,11 +223,16 @@ for key in old_manifest:

         # Launch separate task for each module for deterministic behavior
         # Each module will only import what is necessary for it to work in=
 specific
-        print ('Getting dependencies for module: %s' % value)
+        print ('\nGetting dependencies for module: %s' % value)
         output =3D subprocess.check_output([sys.executable, 'get_module_de=
ps3.py', '%s' % value]).decode('utf8')
         # We can print dependencies for debugging purposes
+        print ('The following dependencies were found for module %s:\n' % =
value)
         print (output)
         # Output will have all dependencies
+
+        reportFILES =3D []
+        reportRDEPS =3D []
+
         for item in output.split():

             # Warning: This first part is ugly
@@ -255,7 +264,7 @@ for key in old_manifest:
                             #print('Checking folder %s on package %s' % (i=
tem,keyfolder))
                             for file_folder in old_manifest[keyfolder]['fi=
les'] or file_folder in old_manifest[keyfolder]['cached']:
                                 if file_folder=3D=3Dfolder:
-                                    print ('%s found in %s' % (folder, key=
folder))
+                                    print ('%s folder found in %s' % (fold=
er, keyfolder))
                                     folderFound =3D True
                                     if keyfolder not in new_manifest[key][=
'rdepends'] and keyfolder !=3D key:
                                         new_manifest[key]['rdepends'].appe=
nd(keyfolder)
@@ -267,6 +276,7 @@ for key in old_manifest:
             if inFolders:
                 continue

+
             # We might already have it on the dictionary since it could de=
pend on a (previously checked) module
             if item not in new_manifest[key]['files'] and item not in new_=
manifest[key]['cached']:
                 # Handle core as a special package, we already did it so w=
e pass it to NEW data structure directly
@@ -287,6 +297,7 @@ for key in old_manifest:

                 else:

+
                     # Check if this dependency is already contained on ano=
ther package, so we add it
                     # as an RDEPENDS, or if its not, it means it should be=
 contained on the current
                     # package, so we should add it to FILES
@@ -298,19 +309,19 @@ for key in old_manifest:
                                 if(newkey!=3Dkey):
                                     if newkey not in new_manifest[key]['rd=
epends']:
                                        # Add it to the new manifest data s=
truct
-                                       # Debug
-                                       print('Adding %s to %s RDEPENDS, be=
cause it contains %s' % (newkey, key, item))
+                                       reportRDEPS.append('Adding %s to %s=
 RDEPENDS, because it contains %s\n' % (newkey, key, item))
                                        new_manifest[key]['rdepends'].appen=
d(newkey)
                                     break
                     else:
                       # A module shouldn't contain itself (${libdir}/pytho=
n3/sqlite3 shouldnt be on sqlite3 files)
                       if os.path.basename(item) !=3D key:
-                        print('Adding %s to %s FILES' % (item, key))
+                        reportFILES.append(('Adding %s to %s FILES\n' % (i=
tem, key)))
                         # Since it wasnt found on another package, its not=
 an RDEP, so add it to FILES for this package
                         if isCached(item):
                             new_manifest[key]['cached'].append(item)
                         else:
                             new_manifest[key]['files'].append(item)
+
                         if item.endswith('*'):
                             wildcards.append(item)
                         if item not in allfiles:
@@ -318,6 +329,15 @@ for key in old_manifest:
                         else:
                             repeated.append(item)

+        print('\n')
+        print('#################################')
+        print('Summary for module %s' % value)
+        print('FILES found for module %s:' % value)
+        print(''.join(reportFILES))
+        print('RDEPENDS found for module %s:' % value)
+        print(''.join(reportRDEPS))
+        print('#################################')
+
 print ('The following files are repeated (contained in more than one packa=
ge), please check which package should get it:')
 print (repeated)
 print('The following files contain wildcards, please check they are necess=
ary')
@@ -334,4 +354,4 @@ for key in new_manifest:
 # Create the manifest from the data structure that was built
 with open('python3-manifest.json.new','w') as outfile:
     json.dump(new_manifest,outfile,sort_keys=3DTrue, indent=3D4)
-    outfile.write("\n")
+    outfile.write('\n')
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

