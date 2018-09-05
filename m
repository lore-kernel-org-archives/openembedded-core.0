Return-Path: <alejandr@xilinx.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0062.outbound.protection.outlook.com [104.47.40.62])
	by mail.openembedded.org (Postfix) with ESMTP id 24B5376EBF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 10:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dE8NrsHM2PRoKXYJxyLzqWOftxh7Np13ugydYg6PLWw=;
	b=NlXexLifUj07DIThZkrGtH6RzBnrQ6AWtjjGmk0+XM/W0+n1HbaunwR8VgvjCVPElL4DWV8qmp1BBZgUo3wBlV0F/ghhb3iJPtRzboO/dZ0uG9kLH5mBk9wRKybqLFcRxHnMM0i0EnSu4U/zQksoKsmTesgabPvV1ZfP7IY+cs8=
Received: from MWHPR02CA0035.namprd02.prod.outlook.com (2603:10b6:301:60::24)
	by DM5PR02MB2684.namprd02.prod.outlook.com (2603:10b6:3:106::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1101.17;
	Wed, 5 Sep 2018 06:47:33 +0000
Received: from SN1NAM02FT038.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::206) by MWHPR02CA0035.outlook.office365.com
	(2603:10b6:301:60::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1101.14 via
	Frontend Transport; Wed, 5 Sep 2018 06:47:32 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT038.mail.protection.outlook.com (10.152.72.69) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1101.10
	via Frontend Transport; Wed, 5 Sep 2018 06:47:31 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fxRb9-0008V9-FL for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2018 23:47:31 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fxRb4-0002DY-Cu for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2018 23:47:26 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w856lHJi011953; Tue, 4 Sep 2018 23:47:18 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fxRav-0002CD-NW; Tue, 04 Sep 2018 23:47:17 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Sep 2018 23:45:44 -0700
Message-ID: <8d1a8b6f47c3f69abc472ff0fe44231c1ef6e1b3.1536129787.git.alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1536129787.git.alejandr@xilinx.com>
References: <cover.1536129787.git.alejandr@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39850400004)(136003)(396003)(346002)(376002)(2980300002)(438002)(189003)(199004)(2906002)(305945005)(51416003)(106002)(36756003)(356003)(76176011)(7696005)(478600001)(50226002)(16586007)(316002)(48376002)(36386004)(50466002)(9786002)(6666003)(486006)(186003)(8936002)(26005)(77096007)(118296001)(2616005)(4326008)(11346002)(336012)(426003)(81156014)(81166006)(5660300001)(126002)(6916009)(446003)(106466001)(476003)(8676002)(63266004)(2351001)(47776003)(107886003)(14444005)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB2684; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT038;
	1:/BzTKjEiNRp5E/NA2oyl8DC2bXmvf/f8zGW1EriIc8W4gEJkAKb4nwl2ZQhmawZ8XIbuu0iztWZF8Lx85+KIfwNocNP0B2zgDn/D9l+/etm2kekAkR4QJ3n8TAxfB0sZ
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdd49e29-6813-4bf3-a09b-08d612fb748a
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:DM5PR02MB2684; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2684;
	3:D8Nt34THjbRlu7RXCDTRbUfrApB8eIBUekSGnrOkhihI1nSuui0mMG5plpBLxPt7D0nEYX7bIiafPvMLtI7ADGgiCkUtTBx03/ximyO2edN7NeSyR+F0mXO/WBDXITMWZgCje7NIs7cZZ0+gC+JV16IK6/aJDrTDQ/fT/OVYzMCT+TQerNiFgx3ZyjVbZcIu3JXx0z6W2+5laJZ0jeZ3JaXaZVbUr65/oIcZt7Qv/HLKqYCwvIPlv2pGryTMOim2tcEw/QuzrvdvVusITjBRZY/XceRA8vnzSm43DshNM+K6NV42wFr9WSiyXv7mDwklkI4sHI9jCTINK/BC/i4XIgqSSq4re4pKGdxH3Bd9EWg=;
	25:hPmHPT4L3Jmff/vv5ujpg5Z3q4q8pf889m3V6jtwWP7LFGO8nNkh0XUD3hI1OP3+DmSJFYLMHjkZKaWVWr2ga4qJwijo3qZuE4vVNgMfb+COFIjq+WmNsr2JLBXASUpa6pbb4REcOGlFAr+Xz6bAWHibGtEywz3RvD5dcJVSS5scjptP+4Yz8Ey21cf2aYUfZL+deEG0g4vrUAAdQ2UenW7acANa8dr7gOcay/tB2ey6h7J0vVOrHI96Q9AbCOLsyKiRAwixTvZ0HPmWy5BfTMqDsflS0uUUWDPRW9oxGss3j88O+cf1UIVYq0O5zlsGD8GzxAr+rQrY+2jvxXw3Ag==
X-MS-TrafficTypeDiagnostic: DM5PR02MB2684:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2684;
	31:T0JZHR2PQrOpzQPVX0Jg+15AdfDW6Y16i6xjyJ6cY2dB1hHbif52UWe20cEMUTd99Zzth41eTv1IjrY3pc1JKjjdE2CWXdsdEz7RUA8P8xW6C6YFtyCbAkQJdwtN4120SgYmk+WWZ00Ar42RvJAL1pPbjyREm/2omF+4uSVc4KLvVGoNqyU+47JeXaps99JU2SkZt5DRMK2sbYRKpO7Qrqei2E5+GgmmKbXWj4jqdIY=;
	20:3hvsF5k8nl/ln1FgC/6Gb0k6inbzs60dgxpM7S3sVQp3PYZP5xsqyBJ/i8+HEd7XtRzZLdEZG1M1TQjDK8OPLPWPSKO6HXR9ih9VUDeBdJaeq12/0+iJMas90+qRR4PubFjRt7fG6WEEHT1wGqN6PmdRK+sGHwkrustp39XHjDKq9N8pX88/fqOEWqYnwsri/a75SRAT3eRcMrRcbqARbVgfCAUTHc5rdWy+Bboyeiq834Bdn4w9dbCWx8Rhmrpfrfr6FszoKy1FflYX5YPKYiLWF4JkGQKM8W5xCbIbTNJcTa8jwTG8cks3U7E7WW/4q/Nwda6s58fU4c5K3srwNVoGMcR+Od6+fMMqSuMZChLtVoitUaF8cI9FkVzbW5I/Qs7/S+VE/8Gox6M1SCtlytq0hVHpgle2STO+eIxX6QuFOhEUBAmOZBmvQpE71xenv9cC2g/A1I4g9YY88WOK45gul7yzlnAM5kWz/2HOSVLh2D7Wx8KwXfWzPXjSyDvj
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR02MB26842FB5E2B80ED01E95662EAC020@DM5PR02MB2684.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592)(17755550239193); 
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(3002001)(3231311)(944501410)(52105095)(10201501046)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123564045)(20161123562045)(201708071742011)(7699016);
	SRVR:DM5PR02MB2684; BCL:0; PCL:0; RULEID:; SRVR:DM5PR02MB2684; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2684;
	4:hflGoMgn0UK3bXnhdDQdwi9Rilv2X1MbK/F59xCEyQWLpkH8p+jEZcxIw73KLswsPhqSU2Py0kMnL/dhcbRGs+U9l9UoHVqyWJAfOtjjmIoOOouL0CRLY1Paw5VbWbAUYQf27ASUlZtye6DiESBuWNQluOV3pcmWaU3XlJ2rI7D/fj2dp3KheMAVH5LJFz5YWRLyB0VUWQtbP6ZJh7gHMHPZCR4KdKNFIKJBaACKPkciJS2I4b/6qtU/s0EAlMTQTDy7MDYNckQ7GzK/L0AhgqkPgGLq0Jdqh3rwonvLZ/kkTDQrJPKbXwr447R3hVbVoYXjmtdLWxW+Ak0GaYoPWxsPgkmNb87ajA/lzKwhQWqciOsLMrOvHLk3P5hDWc6R
X-Forefront-PRVS: 078693968A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB2684;
	23:smoqjImR1twu6idGMRwSPt+oTctdYAi6zX+VKT1Vf?=
	=?us-ascii?Q?yF+tMLA0a+FuQWLpkio74dt6EdbW3PiOEIDOLQNixC4DYUbrNc1znZ9gECkA?=
	=?us-ascii?Q?s4yMOHGJYbKUzvO2f1TIi+C/RtrZKK+jrbmecQq8Br++wCXekbgfvkbFydO0?=
	=?us-ascii?Q?sV2Rex3Qu/H4wid3UHJ7AojtSCWVSiFw6wEVaJm8ReHf8GdRi3RB1aC+9zBU?=
	=?us-ascii?Q?DnvxenFa0J9qcf8lGEFi7g5Q8G1EqiO6d3piMZ2VgDscbPOkwVTyfhUhW42b?=
	=?us-ascii?Q?T04MejFJ6Zq4gnuQPkg1WCOIPuAVL/4eA+i9mBtdib/PdJ3C9QXFY/X9srCq?=
	=?us-ascii?Q?vhW/cOlhyJ0YiejCDd9uh0CKE+unhmtCH0euQC+TIyYUhzSRJBBycZ4oB3mt?=
	=?us-ascii?Q?sbz16OzabtF6FTiI8+cSRsS81Gi9KCwi2QPosnl74QClkFrkFyfyuELIu/lk?=
	=?us-ascii?Q?V6HIvpzIHb7hM7ctWoGddqjl+MyDL/fjlV3q1vzPummy8ylEH9nGnBoWvV7/?=
	=?us-ascii?Q?S6GLQO2NQbPWOSraZSmby0fLTb+zNW55bVIGdIxCWYScwlC/kgWSIBNlmbLh?=
	=?us-ascii?Q?iVGu6AjjGQknpy/IBbJyCTlT0MXy6JlMyKWyXmOGDWM9vcKud6v9tiIiP2+q?=
	=?us-ascii?Q?MQELPv8+hZwfmICSlvSiT4TYi+3anCZrLCKgfQvhFw8d7dRv4bP6h5z3N6E/?=
	=?us-ascii?Q?mtjEFyDZF7BilQIuomCMxDPLWnpSaTMU2jzKzAFDfJD2pTaQgcNsW7mUzzBd?=
	=?us-ascii?Q?sHZ2W3m+vVmu4QmZY6gOX3kBgybBUAkPo+pyOooK2jsip5bjOuRo/P94edI2?=
	=?us-ascii?Q?mDpQML7lTbqOWgHIdZnpieg6+x9D0v1ECAvFWcN9dYKgWjpPenu99PEKPW5T?=
	=?us-ascii?Q?ufPRmNs0QNVl1j6dv4uofU8jr9nBYaG0RcomcNeKw6uYEXaA8i6YR8whbWe2?=
	=?us-ascii?Q?F3W5lDgGwdZtIu9VVscgTYtHGUHwwC3gy8xGxg74NMeURKzox7AeEbpZuo+K?=
	=?us-ascii?Q?lz2YwXGe/kxW198YP2I0kbhfcZ+klETMiLdlrMWQZU+AaUfbP6ClUuDzrgkA?=
	=?us-ascii?Q?cOIPYC7h+Z7h/eCfZLA6yW5G2Qf7G26+c1/vwbQKBs7TpyMKAXoehaxGIR9C?=
	=?us-ascii?Q?KvKLnG/hr8Wj53aFlAw9osO/j/QF20D?=
X-Microsoft-Antispam-Message-Info: XcADADHU5rkNyZ+A+L7ClFKxwH0/VgeY7dLweO502LkWllg8Fzla8KD2THiltiGMUrJI8UfYRASq3icoetElDb0okMrsoYpsruYmNClwyMDpYBU5JNEUR7h6uhv18YWvcxBn9iQvZH96r9dkDkV9f12jmb/pvL9AU7xKqzMBQYHz7zNDKAf0GfcsGTnwH9/0/UIFACvlwxKi9yoahXz+OwBKBUGViHuLcCDc92cRh1aZr/2DO6Irec7FATDgQA1DBqkLVFvHOcJnj73aeIYlKVH5EQt9SfhNOrfgN8uYuvb2oe749brARdtJazryQHU/7M1IlO6LnfKdWV6RJyp8Qab5jyS8B7lWNvfysuqFCVs=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2684;
	6:mJhTMn57Vu0QwGAcdCxyPsBYe6CThUXfC4uQLi/p7s3U+vgr4ABkOSre3q+MjJgYxCBnrECkdcIhUT3hCFqILxnT8JoYdIqaa8rudzA0bOWYPEnuQMJyI2sjp4WDWTZhI9NOY6/0IHIWN2vMslXsFTwY4beaqbNCpTzs2KRA5T89iq6qLsBFqXqQ3mL9jukMfAd91XpME+eh/+iR+YRtvEQF5oLDgpKec8ypA98KrAzRk4UnWGc3wtU8SEboxLqog4eQaoycVmlKZvEzvmhvjcwQ0N5bpyPaD16LsavGSw6NZI1VN61HnPJexJ43j0nAvCrfXo0GkjCJdm0s9a0SVfhIPL+pB03f1jLr70i1M2eJntMv1JBB71VfcokXGRylDfUGOb2SBiCrr0oL7dQN/FHS6V+9cz/oyPuoonjhgE/ZYp9PWOxYnv1tj3jIxLSFiWnLIiLJF80GmUNzBtGD1w==;
	5:D90thrpWl29sWEZSTGneuFWhAMlkBCe9+PtOvcyEu00HFV5tScapb09WzaG8jtHs2knsBKnSu/kgWBsumtCjDGhaxad8gyscu3uXejg6spY+qlPSGq41/Hn7b8ZXyLXPyubqK88mwdtbfL7YXiA2j3PLfiBIrjQR2+gORtkIS6Q=;
	7:X4wHxDYFyFurp6HN4pULawNBh3FnvnUDnIBghNXnfGQiGvovYHyObXF+RWflKo1NftxNf4045FWuzOvuh9uVEL22gfveT8FJmDV5q0W8L5ACR8f7r0X7NePyyhnERc6btW/FSlbQ1BtRfGNpvIl8sffOubZIEre+uYYXV7PNvFy6jnKRW8J2NKQ3P0YU/YNzq8EzLDz9KrIkAl1V2jtEllnSlt1pJRc2tFTtDpj4kvQLwOtdiRE/DvOoOlINzpeH
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2018 06:47:31.8337 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd49e29-6813-4bf3-a09b-08d612fb748a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2684
Subject: [PATCH 3/4] python3: Clean up create manifest script
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
X-List-Received-Date: Wed, 05 Sep 2018 10:19:27 -0000
Content-Type: text/plain

This patch intends to clean up the whole create_manifest script/task
for python3.

This is an effort to make the code more human friendly and facilitate
adoption, it not only cleans up the code but it also improves comments,
it should also be easier to upgrade the manifest after each python3
upgrade now, with these fixes the transition to python 3.7 should be
seamless.

It fixes a rather harmless bug where module dependencies were being
added twice to the core package and adds tests and sqlite3-tests
as special packages since we want specific dependencies on those.
It also fixes a bug that happened on a few packages that
contained a directory with the same name as the module itself
e.g. asyncio, where the script avoided checking that module for
dependencies.

Lastly, it improves the output, it errors out if a module is found
on more than one package, which is what usually happens when
python upstream introduces a new file, hence why the current
manifest is unaware of, it is better to exit with an error because
otherwise the user wouldnt know if anything went wrong unless the output
of the script was checked manually.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 .../python/python3/create_manifest3.py             | 432 ++++++++++++---------
 1 file changed, 242 insertions(+), 190 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
index 41a6bb0..1849152 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -48,21 +48,21 @@ import os
 pyversion = str(sys.argv[1])
 
 # Hack to get native python search path (for folders), not fond of it but it works for now
-pivot='recipe-sysroot-native'
+pivot = 'recipe-sysroot-native'
 for p in sys.path:
   if pivot in p:
-    nativelibfolder=p[:p.find(pivot)+len(pivot)]
+    nativelibfolder = p[:p.find(pivot)+len(pivot)]
 
 # Empty dict to hold the whole manifest
 new_manifest = {}
 
 # Check for repeated files, folders and wildcards
-allfiles=[]
-repeated=[]
-wildcards=[]
+allfiles = []
+repeated = []
+wildcards = []
 
-hasfolders=[]
-allfolders=[]
+hasfolders = []
+allfolders = []
 
 def isFolder(value):
   value = value.replace('${PYTHON_MAJMIN}',pyversion)
@@ -79,166 +79,204 @@ def isCached(item):
 
 # Read existing JSON manifest
 with open('python3-manifest.json') as manifest:
-  old_manifest=json.load(manifest)
-
+  old_manifest = json.load(manifest)
 
+#
 # First pass to get core-package functionality, because we base everything on the fact that core is actually working
 # Not exactly the same so it should not be a function
+#
+
 print ('Getting dependencies for package: core')
 
-# Special call to check for core package
+
+# This special call gets the core dependencies and
+# appends to the old manifest so it doesnt hurt what it
+# currently holds.
+# This way when other packages check for dependencies
+# on the new core package, they will still find them
+# even when checking the old_manifest
+
 output = subprocess.check_output([sys.executable, 'get_module_deps3.py', 'python-core-package']).decode('utf8')
-for item in output.split():
-    item = item.replace(pyversion,'${PYTHON_MAJMIN}')
-    # We append it so it doesnt hurt what we currently have:
-    if isCached(item):
-        if item not in old_manifest['core']['cached']:
-            # We use the same data structure since its the one which will be used to check
-            # dependencies for other packages
-            old_manifest['core']['cached'].append(item)
+for coredep in output.split():
+    coredep = coredep.replace(pyversion,'${PYTHON_MAJMIN}')
+    if isCached(coredep):
+        if coredep not in old_manifest['core']['cached']:
+            old_manifest['core']['cached'].append(coredep)
     else:
-        if item not in old_manifest['core']['files']:
-            # We use the same data structure since its the one which will be used to check
-            # dependencies for other packages
-            old_manifest['core']['files'].append(item)
-
-for value in old_manifest['core']['files']:
-  value = value.replace(pyversion,'${PYTHON_MAJMIN}')
-  # Ignore folders, since we don't import those, difficult to handle multilib
-  if isFolder(value):
-    # Pass it directly
-    if isCached(value):
-        if value not in old_manifest['core']['cached']:
-            old_manifest['core']['cached'].append(value)
+        if coredep not in old_manifest['core']['files']:
+            old_manifest['core']['files'].append(coredep)
+
+
+# The second step is to loop through the existing files contained in the core package
+# according to the old manifest, identify if they are  modules, or some other type 
+# of file that we cant import (directories, binaries, configs) in which case we
+# can only assume they were added correctly (manually) so we ignore those and 
+# pass them to the manifest directly.
+
+for filedep in old_manifest['core']['files']:
+  if isFolder(filedep):
+    if isCached(filedep):
+        if filedep not in old_manifest['core']['cached']:
+            old_manifest['core']['cached'].append(filedep)
     else:
-        if value not in old_manifest['core']['files']:
-            old_manifest['core']['files'].append(value)
+        if filedep not in old_manifest['core']['files']:
+            old_manifest['core']['files'].append(filedep)
     continue
-  # Ignore binaries, since we don't import those, assume it was added correctly (manually)
-  if '${bindir}' in value:
-    # Pass it directly
-    if value not in old_manifest['core']['files']:
-      old_manifest['core']['files'].append(value)
+  if '${bindir}' in filedep:
+    if filedep not in old_manifest['core']['files']:
+      old_manifest['core']['files'].append(filedep)
     continue
-  # Ignore empty values
-  if value == '':
+  if filedep == '':
     continue
-  if '${includedir}' in value:
-    if value not in old_manifest['core']['files']:
-      old_manifest['core']['files'].append(value)
+  if '${includedir}' in filedep:
+    if filedep not in old_manifest['core']['files']:
+      old_manifest['core']['files'].append(filedep)
     continue
-  # Get module name , shouldnt be affected by libdir/bindir
-  value = os.path.splitext(os.path.basename(os.path.normpath(value)))[0]
-
-  # Launch separate task for each module for deterministic behavior
-  # Each module will only import what is necessary for it to work in specific
-  print ('Getting dependencies for module: %s' % value)
-  output = subprocess.check_output([sys.executable, 'get_module_deps3.py', '%s' % value]).decode('utf8')
-  print ('The following dependencies were found for module %s:\n' % value)
+
+  # Get actual module name , shouldnt be affected by libdir/bindir, etc.
+  pymodule = os.path.splitext(os.path.basename(os.path.normpath(filedep)))[0]
+
+
+  # We now know that were dealing with a python module, so we can import it
+  # and check what its dependencies are.
+  # We launch a separate task for each module for deterministic behavior.
+  # Each module will only import what is necessary for it to work in specific.
+  # The output of each task will contain each module's dependencies
+
+  print ('Getting dependencies for module: %s' % pymodule)
+  output = subprocess.check_output([sys.executable, 'get_module_deps3.py', '%s' % pymodule]).decode('utf8')
+  print ('The following dependencies were found for module %s:\n' % pymodule)
   print (output)
-  for item in output.split():
-    item = item.replace(pyversion,'${PYTHON_MAJMIN}')
-
-    # We append it so it doesnt hurt what we currently have:
-    if isCached(item):
-        if item not in old_manifest['core']['cached']:
-            # We use the same data structure since its the one which will be used to check
-            # dependencies for other packages
-            old_manifest['core']['cached'].append(item)
+
+
+  for pymodule_dep in output.split():
+    pymodule_dep = pymodule_dep.replace(pyversion,'${PYTHON_MAJMIN}')
+
+    if isCached(pymodule_dep):
+        if pymodule_dep not in old_manifest['core']['cached']:
+            old_manifest['core']['cached'].append(pymodule_dep)
     else:
-        if item not in old_manifest['core']['files']:
-            # We use the same data structure since its the one which will be used to check
-            # dependencies for other packages
-            old_manifest['core']['files'].append(item)
-
-
-# We check which packages include folders
-for key in old_manifest:
-    for value in old_manifest[key]['files']:
-        # Ignore folders, since we don't import those, difficult to handle multilib
-        if isFolder(value):
-            print ('%s is a folder' % value)
-            if key not in hasfolders:
-                hasfolders.append(key)
-            if value not in allfolders:
-                allfolders.append(value)
-
-for key in old_manifest:
+        if pymodule_dep not in old_manifest['core']['files']:
+            old_manifest['core']['files'].append(pymodule_dep)
+
+
+# At this point we are done with the core package.
+# The old_manifest dictionary is updated only for the core package because
+# all others will use this a base.
+
+
+# To improve the script speed, we check which packages contain directories
+# since we will be looping through (only) those later.
+for pypkg in old_manifest:
+    for filedep in old_manifest[pypkg]['files']:
+        if isFolder(filedep):
+            print ('%s is a folder' % filedep)
+            if pypkg not in hasfolders:
+                hasfolders.append(pypkg)
+            if filedep not in allfolders:
+                allfolders.append(filedep)
+
+
+
+# This is the main loop that will handle each package.
+# It works in a similar fashion than the step before, but
+# we will now be updating a new dictionary that will eventually
+# become the new manifest.
+#
+# The following loops though all packages in the manifest,
+# through all files on each of them, and checks whether or not
+# they are modules and can be imported.
+# If they can be imported, then it checks for dependencies for
+# each of them by launching a separate task.
+# The output of that task is then parsed and the manifest is updated
+# accordingly, wether it should add the module on FILES for the current package
+# or if that module already belongs to another package then the current one 
+# will RDEPEND on it
+
+for pypkg in old_manifest:
     # Use an empty dict as data structure to hold data for each package and fill it up
-    new_manifest[key]={}
-    new_manifest[key]['files']=[]
-    
-    new_manifest[key]['rdepends']=[]
+    new_manifest[pypkg] = {}
+    new_manifest[pypkg]['files'] = []
+    new_manifest[pypkg]['rdepends'] = []
+
     # All packages should depend on core
-    if key != 'core':
-         new_manifest[key]['rdepends'].append('core')
-         new_manifest[key]['cached']=[]
+    if pypkg != 'core':
+         new_manifest[pypkg]['rdepends'].append('core')
+         new_manifest[pypkg]['cached'] = []
     else:
-         new_manifest[key]['cached']=old_manifest[key]['cached']
-    new_manifest[key]['summary']=old_manifest[key]['summary']
+         new_manifest[pypkg]['cached'] = old_manifest[pypkg]['cached']
+    new_manifest[pypkg]['summary'] = old_manifest[pypkg]['summary']
+
 
-    # Handle special cases, we assume that when they were manually added 
-    # to the manifest we knew what we were doing.
     print('\n')
     print('--------------------------')
-    print ('Handling package %s' % key)
+    print ('Handling package %s' % pypkg)
     print('--------------------------')
-    special_packages=['misc', 'modules', 'dev']
-    if key in special_packages or 'staticdev' in key:
-        print('Passing %s package directly' % key)
-        new_manifest[key]=old_manifest[key]
+
+    # Handle special cases, we assume that when they were manually added 
+    # to the manifest we knew what we were doing.
+    special_packages = ['misc', 'modules', 'dev', 'tests', 'sqlite3-tests']
+    if pypkg in special_packages or 'staticdev' in pypkg:
+        print('Passing %s package directly' % pypkg)
+        new_manifest[pypkg] = old_manifest[pypkg]
         continue
 
-    for value in old_manifest[key]['files']:
-        # We already handled core on the first pass
-        if key == 'core':
-            new_manifest[key]['files'].append(value)
+    for filedep in old_manifest[pypkg]['files']:
+        # We already handled core on the first pass, we can ignore it now
+        if pypkg == 'core':
+            if filedep not in new_manifest[pypkg]['files']:
+                new_manifest[pypkg]['files'].append(filedep)
             continue
-        # Ignore folders, since we don't import those, difficult to handle multilib
-        if isFolder(value):
-            # Pass folders directly
-            new_manifest[key]['files'].append(value)
-        # Ignore binaries, since we don't import those
-        if '${bindir}' in value:
-            # Pass it directly to the new manifest data structure
-            if value not in new_manifest[key]['files']:
-                new_manifest[key]['files'].append(value)
+
+        # Handle/ignore what we cant import
+        if isFolder(filedep):
+            new_manifest[pypkg]['files'].append(filedep)
+            # Asyncio (and others) are both the package and the folder name, we should not skip those...
+            path,mod = os.path.split(filedep)
+            if mod != pypkg:
+                continue
+        if '${bindir}' in filedep:
+            if filedep not in new_manifest[pypkg]['files']:
+                new_manifest[pypkg]['files'].append(filedep)
             continue
-        # Ignore empty values
-        if value == '':
+        if filedep == '':
             continue
-        if '${includedir}' in value:
-            if value not in new_manifest[key]['files']:
-                new_manifest[key]['files'].append(value)
+        if '${includedir}' in filedep:
+            if filedep not in new_manifest[pypkg]['files']:
+                new_manifest[pypkg]['files'].append(filedep)
             continue
 
-        # Get module name , shouldnt be affected by libdir/bindir
+        # Get actual module name , shouldnt be affected by libdir/bindir, etc.
         # We need to check if the imported module comes from another (e.g. sqlite3.dump)
-        path,value = os.path.split(value)
+        path,pymodule = os.path.split(filedep)
         path = os.path.basename(path)
-        value = os.path.splitext(os.path.basename(value))[0]
+        pymodule = os.path.splitext(os.path.basename(pymodule))[0]
 
         # If this condition is met, it means we need to import it from another module
         # or its the folder itself (e.g. unittest)
-        if path == key:
-          if value:
-            value = path + '.' + value
-          else:
-            value = path
-
-        # Launch separate task for each module for deterministic behavior
-        # Each module will only import what is necessary for it to work in specific
-        print ('\nGetting dependencies for module: %s' % value)
-        output = subprocess.check_output([sys.executable, 'get_module_deps3.py', '%s' % value]).decode('utf8')
-        # We can print dependencies for debugging purposes
-        print ('The following dependencies were found for module %s:\n' % value)
+        if path == pypkg:
+            if pymodule:
+                pymodule = path + '.' + pymodule
+            else:
+                pymodule = path
+
+
+
+        # We now know that were dealing with a python module, so we can import it
+        # and check what its dependencies are.
+        # We launch a separate task for each module for deterministic behavior.
+        # Each module will only import what is necessary for it to work in specific.
+        # The output of each task will contain each module's dependencies
+
+        print ('\nGetting dependencies for module: %s' % pymodule)
+        output = subprocess.check_output([sys.executable, 'get_module_deps3.py', '%s' % pymodule]).decode('utf8')
+        print ('The following dependencies were found for module %s:\n' % pymodule)
         print (output)
-        # Output will have all dependencies
 
         reportFILES = []
         reportRDEPS = []
 
-        for item in output.split():
+        for pymodule_dep in output.split():
 
             # Warning: This first part is ugly
             # One of the dependencies that was found, could be inside of one of the folders included by another package
@@ -258,22 +296,22 @@ for key in old_manifest:
             #   is folder_string inside path/folder1/folder2/filename?, 
             #   Yes, it works, but we waste a couple of milliseconds.
 
-            item = item.replace(pyversion,'${PYTHON_MAJMIN}')
-            inFolders=False
+            pymodule_dep = pymodule_dep.replace(pyversion,'${PYTHON_MAJMIN}')
+            inFolders = False
             for folder in allfolders:
-                if folder in item:
+                if folder in pymodule_dep:
                     inFolders = True # Did we find a folder?
                     folderFound = False # Second flag to break inner for
                     # Loop only through packages which contain folders
-                    for keyfolder in hasfolders:
+                    for pypkg_with_folder in hasfolders:
                         if (folderFound == False):
-                            #print('Checking folder %s on package %s' % (item,keyfolder))
-                            for file_folder in old_manifest[keyfolder]['files'] or file_folder in old_manifest[keyfolder]['cached']:
-                                if file_folder==folder:
-                                    print ('%s folder found in %s' % (folder, keyfolder))
+                            # print('Checking folder %s on package %s' % (pymodule_dep,pypkg_with_folder))
+                            for folder_dep in old_manifest[pypkg_with_folder]['files'] or folder_dep in old_manifest[pypkg_with_folder]['cached']:
+                                if folder_dep == folder:
+                                    print ('%s folder found in %s' % (folder, pypkg_with_folder))
                                     folderFound = True
-                                    if keyfolder not in new_manifest[key]['rdepends'] and keyfolder != key:
-                                        new_manifest[key]['rdepends'].append(keyfolder)
+                                    if pypkg_with_folder not in new_manifest[pypkg]['rdepends'] and pypkg_with_folder != pypkg:
+                                        new_manifest[pypkg]['rdepends'].append(pypkg_with_folder)
                         else:
                             break
 
@@ -282,81 +320,95 @@ for key in old_manifest:
                 continue
 
 
-            # We might already have it on the dictionary since it could depend on a (previously checked) module
-            if item not in new_manifest[key]['files'] and item not in new_manifest[key]['cached']:
+
+            # No directories beyond this point
+            # We might already have this module on the dictionary since it could depend on a (previously checked) module
+            if pymodule_dep not in new_manifest[pypkg]['files'] and pymodule_dep not in new_manifest[pypkg]['cached']:
                 # Handle core as a special package, we already did it so we pass it to NEW data structure directly
-                if key=='core':
-                  print('Adding %s to %s FILES' % (item, key))
-                  if item.endswith('*'):
-                      wildcards.append(item)
-                  if isCached(item):
-                      new_manifest[key]['cached'].append(item)
-                  else:
-                      new_manifest[key]['files'].append(item)
-
-                  # Check for repeated files
-                  if item not in allfiles:
-                      allfiles.append(item)
-                  else:
-                      repeated.append(item)
+                if pypkg == 'core':
+                    print('Adding %s to %s FILES' % (pymodule_dep, pypkg))
+                    if pymodule_dep.endswith('*'):
+                        wildcards.append(pymodule_dep)
+                    if isCached(pymodule_dep):
+                        new_manifest[pypkg]['cached'].append(pymodule_dep)
+                    else:
+                        new_manifest[pypkg]['files'].append(pymodule_dep)
 
+                    # Check for repeated files
+                    if pymodule_dep not in allfiles:
+                        allfiles.append(pymodule_dep)
+                    else:
+                        if pymodule_dep not in repeated:
+                            repeated.append(pymodule_dep)
                 else:
 
 
-                    # Check if this dependency is already contained on another package, so we add it
+                    # Last step: Figure out if we this belongs to FILES or RDEPENDS
+                    # We check if this module is already contained on another package, so we add that one
                     # as an RDEPENDS, or if its not, it means it should be contained on the current
-                    # package, so we should add it to FILES
-                    for newkey in old_manifest:
+                    # package, and we should add it to FILES
+                    for possible_rdep in old_manifest:
                         # Debug
-                        #print('Checking %s ' % item + ' in %s' % newkey)
-                        if item in old_manifest[newkey]['files'] or item in old_manifest[newkey]['cached']:      
-                                # Since were nesting, we need to check its not the same key
-                                if(newkey!=key):
-                                    if newkey not in new_manifest[key]['rdepends']:
-                                       # Add it to the new manifest data struct
-                                       reportRDEPS.append('Adding %s to %s RDEPENDS, because it contains %s\n' % (newkey, key, item))
-                                       new_manifest[key]['rdepends'].append(newkey)
-                                    break
+                        # print('Checking %s ' % pymodule_dep + ' in %s' % possible_rdep)
+                        if pymodule_dep in old_manifest[possible_rdep]['files'] or pymodule_dep in old_manifest[possible_rdep]['cached']:
+                            # Since were nesting, we need to check its not the same pypkg
+                            if(possible_rdep != pypkg):
+                                if possible_rdep not in new_manifest[pypkg]['rdepends']:
+                                    # Add it to the new manifest data struct as RDEPENDS since it contains something this module needs
+                                    reportRDEPS.append('Adding %s to %s RDEPENDS, because it contains %s\n' % (possible_rdep, pypkg, pymodule_dep))
+                                    new_manifest[pypkg]['rdepends'].append(possible_rdep)
+                                break
                     else:
+
+                      # Since this module wasnt found on another package, it is not an RDEP,
+                      # so we add it to FILES for this package.
                       # A module shouldn't contain itself (${libdir}/python3/sqlite3 shouldnt be on sqlite3 files)
-                      if os.path.basename(item) != key:
-                        reportFILES.append(('Adding %s to %s FILES\n' % (item, key)))
-                        # Since it wasnt found on another package, its not an RDEP, so add it to FILES for this package
-                        if isCached(item):
-                            new_manifest[key]['cached'].append(item)
+                      if os.path.basename(pymodule_dep) != pypkg:
+                        reportFILES.append(('Adding %s to %s FILES\n' % (pymodule_dep, pypkg)))
+                        if isCached(pymodule_dep):
+                            new_manifest[pypkg]['cached'].append(pymodule_dep)
                         else:
-                            new_manifest[key]['files'].append(item)
-
-                        if item.endswith('*'):
-                            wildcards.append(item)
-                        if item not in allfiles:
-                            allfiles.append(item)
+                            new_manifest[pypkg]['files'].append(pymodule_dep)
+                        if pymodule_dep.endswith('*'):
+                            wildcards.append(pymodule_dep)
+                        if pymodule_dep not in allfiles:
+                            allfiles.append(pymodule_dep)
                         else:
-                            repeated.append(item)
+                            if pymodule_dep not in repeated:
+                                repeated.append(pymodule_dep)
 
         print('\n')
         print('#################################')
-        print('Summary for module %s' % value)
-        print('FILES found for module %s:' % value)
+        print('Summary for module %s' % pymodule)
+        print('FILES found for module %s:' % pymodule)
         print(''.join(reportFILES))
-        print('RDEPENDS found for module %s:' % value)
+        print('RDEPENDS found for module %s:' % pymodule)
         print(''.join(reportRDEPS))
         print('#################################')
 
-print ('The following files are repeated (contained in more than one package), please check which package should get it:')
-print (repeated)
-print('The following files contain wildcards, please check they are necessary')
+print('The following FILES contain wildcards, please check if they are necessary')
 print(wildcards)
-print('The following files contain folders, please check they are necessary')
+print('The following FILES contain folders, please check if they are necessary')
 print(hasfolders)
 
+
 # Sort it just so it looks nicer
-for key in new_manifest:
-    new_manifest[key]['files'].sort()
-    new_manifest[key]['cached'].sort()
-    new_manifest[key]['rdepends'].sort()
+for pypkg in new_manifest:
+    new_manifest[pypkg]['files'].sort()
+    new_manifest[pypkg]['cached'].sort()
+    new_manifest[pypkg]['rdepends'].sort()
 
 # Create the manifest from the data structure that was built
 with open('python3-manifest.json.new','w') as outfile:
     json.dump(new_manifest,outfile,sort_keys=True, indent=4)
     outfile.write('\n')
+
+if (repeated):
+    error_msg = '\n\nERROR:\n'
+    error_msg += 'The following files are repeated (contained in more than one package),\n'
+    error_msg += 'this is likely to happen when new files are introduced after an upgrade,\n'
+    error_msg += 'please check which package should get it,\n modify the manifest accordingly and re-run the create_manifest task:\n'
+    error_msg += '\n'.join(repeated)
+    error_msg += '\n'
+    sys.exit(error_msg)
+
-- 
2.7.4


