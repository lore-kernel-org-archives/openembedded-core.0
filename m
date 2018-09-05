Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 40055 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Sep 2018 18:09:11 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0066.outbound.protection.outlook.com [104.47.38.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4FB793D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 18:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=XDXf2n8aho0jQNn5zj6HEJQeJ6Xg1HPRMJG/5etZZTY=;
	b=yVDuJmLnXgnfCmaF+0kOn0tf60INWysLrh66inr4C0boT3IXqHbRBItoeB6mt/Ua9j6HSSFGSQk/mw3gniK22rY2O3b6zNhSdRKxDqMkIC2IiwYtFxz1eWvDyAVx2KgdlXh5i05Jes91eAEaFXWLi/eVhedswu25NZW7uR3Dq5U=
Received: from BN6PR02CA0097.namprd02.prod.outlook.com (2603:10b6:405:60::38)
	by DM5PR02MB2681.namprd02.prod.outlook.com (2603:10b6:3:106::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1101.18;
	Wed, 5 Sep 2018 17:53:52 +0000
Received: from CY1NAM02FT040.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::200) by BN6PR02CA0097.outlook.office365.com
	(2603:10b6:405:60::38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1122.15 via
	Frontend Transport; Wed, 5 Sep 2018 17:53:52 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT040.mail.protection.outlook.com (10.152.75.135) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1122.15
	via Frontend Transport; Wed, 5 Sep 2018 17:53:51 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fxbzu-0006WK-9m for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2018 10:53:46 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fxbzp-0003CF-6E for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2018 10:53:41 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w85HrdNW008651; Wed, 5 Sep 2018 10:53:39 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fxbzn-0003Bx-7D; Wed, 05 Sep 2018 10:53:39 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Sep 2018 10:53:37 -0700
Message-ID: <1536170017-5286-1-git-send-email-alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(376002)(136003)(39860400002)(396003)(2980300002)(438002)(189003)(199004)(2906002)(476003)(2616005)(51416003)(9786002)(8676002)(50226002)(7696005)(36756003)(305945005)(6916009)(486006)(126002)(5660300001)(316002)(356003)(81166006)(50466002)(48376002)(16586007)(336012)(106002)(186003)(8936002)(26005)(1857600001)(81156014)(36386004)(106466001)(2351001)(47776003)(77096007)(426003)(4326008)(478600001)(63266004)(107886003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB2681; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT040;
	1:Ezh7TVvwpd7CDHy2YXbtEVd5GxoFWYjQR2R1g/pUOPxnykTABXiqmVG7DtP+3R3w2/Lc/Ifkvil44YHQm6HjMzlZ1TbHPTKJbUPeVZQxDjk9l2yGMusMJsX5tNAOg2QK
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ead00bd6-b2e9-4890-c18c-08d613588a64
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:DM5PR02MB2681; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2681;
	3:gMBxko7ClIKbuETXf99eH/NYSFGK3JXOSefVeKY6TgJFlprR9hphLAQZwb3ItrCZM0TQNfk2MBJTLu1YyBEfQm4I9MsGdjot5pJ/WatymepUNPiaz0V6T+UkoDz6y5YOohRDAnwalocLp46WTYorSFiWwY3vtv8qCSxXc2ir26pq19k9ecehuHhqqqAAhnUaLaK6HGEMS/i6Pxr650U6PhF5xOlChilD2RlQ5GmRjEKoCSX0DY3UwrkHpKD/yVCZhLGXIr+MGhPYmovW2ksOVCb4UET1YZr/1rOXWqu0T+wgNoGPSRDKrAOQ75Wrdkv82HAKj8M9fSGOpfEIxs0IENQkaPGGctuDbiKikU+fp64=;
	25:AgL81ltuUP2VA8Qc8QbOLpR9Y7+2BsRhyGCcJGMkucVxSewwTWPyiV+ZF0sc/0Iam2uIdA0H/Tnrq2PTVNgRgM39CwlcY+dWKZdSHFNPYJHI02dEZOUBLf4N4bljDw7Bw1WBQ2bh5Kg+Z+Wdn13mjaFQPsgQ9EKnT/uF39GmzIXHYoYFJ8Ge4hJVuLzx0uYiRJiaQ0b2B8iCYH+geEsxbk/3+YdZoUMS9jhs1Rw02M6SvDJaSSE5kQADG5vJhjkWHyTsSaMeBXKCgHyaRo6qa4h9ZFtoUNC8CqatFf8SpyDQBVSVSAOYAHhmt/VAPN4oGUohe15jQKAu3cy+9mY9ew==
X-MS-TrafficTypeDiagnostic: DM5PR02MB2681:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2681;
	31:RmYpuY9JAic8diTVjqp8HIMs+hq4TvKoWR9AHxSophjAfxiSN/73At61y2nhhEmbjYaMAQkz1VHBJ+6xgsGNIp+/L57IsHd6PkD+zKuCcMxmws0JONr0O3ok0z26B5utG7mYWY81WLmRgDlH/oMGDVrbBgut/U7VZg9g412fqIZgp5Qqm3+PoOOC2q2LEwuT7c29xPVG3fZqKqAxpUEmjqWfopVlhrTycA4KAvhg/M0=;
	20:ejJE+uEwAzhA3rjuT1REFHjOj9x2e2LN/1Y6SFoTP5a8zZuGRGu8Jt7G1+QnlyntPpyL+zEQcySp0IeTjQDIfySRVGJGCWvRvp0dh6GTo6upj0Jc0/7IluoM3g3k7ZgkAe1LaOw11o82cYsCpD9CMK6unGg9pTGyAmbh04ZGsvsPXgD6UWvosEtT5KvtSTioNuzO1L/a+hkIwoLxNA54qQi2teawLhFMb0AtHT67I09d2H1T7FpKg0FHCzsiOji5hYPYFzGQCI6UCUrd7VjGBTA3jzvKqz7KJTm/+831743MAvNr01YV1NxLpIJH2Xp9sXC8GLXbN8kFmtUSmpJ2PARIsubt3Z0nGJ+iq2ioq/04Sq/ndCI/QRQnrkAqZ2VUhpzqXEhM4O0Zwm0gkUl0wZAO3F2JUttQsiaAJoftJL2s4oEVmbO4/7RZEJjSOUzx1jPIwKYuVY+tJBDX2BpqpP1NRshg1/ppYwCHBoBnUks1HFwhTooumV1kz2cfjTw/
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR02MB2681C87349B898CF15FD5594AC020@DM5PR02MB2681.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231311)(944501410)(52105095)(93006095)(93004095)(3002001)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201708071742011)(7699016);
	SRVR:DM5PR02MB2681; BCL:0; PCL:0; RULEID:; SRVR:DM5PR02MB2681; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2681;
	4:xvmkzk8LNDREbvX0CmiskkpzSQEXsiRmBkL7z0Ke0tmFQGtylOve6n1Iy02H20523BEIR0jJ05JdXmCNp6pylQRXQEDig40uX8SMrwLooKgVIcBIR+N1+D9ce4Z+R1q69A3V6zrWjwEyjShdOpPVf6QCBCdOqnu8K+qpHuHx6zfoFsFbyiDyFx4sLVWVIZICjsEEG8MEtdDRXgzyKsy16T9gYMYk6uyl/xLDgcMH6YrbUBJEPUIQHdfWy7VTFLDvr8iX7qiJnEAwt/QxbjneeRoOoADUnBJfLAp0hLzuhqyffv+/x+ZFidcNfjG1ENTHPQTHnpayKDhHKvWAZVjUHTpzn8YAZBsXBBE8EHRJWA8=
X-Forefront-PRVS: 078693968A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB2681;
	23:JwIbnXiq2ui7+eE36Y2V1vBsu6toR0RpNfrJ3ypO3?=
	=?us-ascii?Q?g4nisTUJc+8yOVxEz8M3WwrfAN6i4jr7eRT9JbWZQKf+L2gfx4skF+6r33CB?=
	=?us-ascii?Q?Y0o0pGJ//7c/6xA3V6kniNVps6KLn+7NubHhzoioNB4RT804Bhd+gSDXWysZ?=
	=?us-ascii?Q?YqrQsswbvTpV9k93L11T5vFE4uZprZCTNM3JSNYw3+2ehU2B7oUMCOSitY3J?=
	=?us-ascii?Q?wJFYHSHVdKUtV60Z/knwdTamrzrVrUJOHEJSSIMR4G5rF69PeC1dG8k9IjOp?=
	=?us-ascii?Q?9HcmyhvD2Ho9ULyft5ASDfVUnt1yNr1MLcyFWmzAH/nnyTzKU54+06ErcZcA?=
	=?us-ascii?Q?A7CPQlroMfpdvBLFhDPf/YzhTCzpXNy5672+XheRUfNDmhPT6lM3zEB309bU?=
	=?us-ascii?Q?iqgRjtovKnoG3irQB+9w1ClIbCWlZZSX1H+wV98PFj3cxkfhXDwyMjEW1XX2?=
	=?us-ascii?Q?q4O+OEnj257z5FnQ6c3+gitH9BmHcEpabZCFtXGqKuWypq8g45qFsKshR2e4?=
	=?us-ascii?Q?69fN2c3RBdpUcu22EBwWfw1fGbvzeEHGhkOzFk4V7E50gztHigMw4rs00dW6?=
	=?us-ascii?Q?PQc6XIvkF7xrkH8Vb8LntlafBSuZfQV68NuEXPRBBcgeKk8mbi5KC/+a4K+q?=
	=?us-ascii?Q?2cJKBIWbTLm4q9fTf50w3Ffdmk0/mguguHSUyiU+NAn32BbKrc4RLNvkQ8yI?=
	=?us-ascii?Q?zZsEyBmUIooTT99519E3mgQH0rn7pK6C/PJfhfIjcR8SBnilgGaf+6AIIaF/?=
	=?us-ascii?Q?E0cMjoQ3jCvObR/uQhy1L7i6CXO7RTxG10nZdiJRxe3RPkZA745HymnYo5hf?=
	=?us-ascii?Q?ifHWDQMcUHx2jFU5DBv1wR35CYPHV6UZEk8dlhvCnhBPTEPrdD8zE1schI/M?=
	=?us-ascii?Q?Y9a8nScfWvpcX4PLCoHXXim9Oc88ZdFEEPU5W1k6XbuFv15bAte80tR9jJNX?=
	=?us-ascii?Q?NoXx8DeWHksqMwmetg6JNLZH0yC6tdPAk4T04+Hab1Ww5EGp1xu4xHSDXvUQ?=
	=?us-ascii?Q?J8RmYgDLlNp6JpilQ6+cAF879L0qM/XJkwBFDmWcrQMFhezx/9k9pjKCWdEL?=
	=?us-ascii?Q?f0IoC4=3D?=
X-Microsoft-Antispam-Message-Info: 44atqrPyI42iIIMN8tPiZHKtKTMqdhqx4mL1iTntBOV/Zdycuc+4Q+/5z+RhMHmcVGoS0jroqUQc+NR4ujvmWndEeZdXg2UPSSGnvvY9EDKUMSyBWe62nyBYvk/j6I5W+yOF7PpUNGpSrQ9GnIhg6KpZ9qYd2gJFxkOAW6rxHiu6YLPYIaVNwHjuyKpb6Dse6P+hFSAjNLgbdMOytIfoINvkFb+C79Xw3Re6HfwMf4IZb3piyL9S3nogbq1XdEkquOy0voCVT88ZKhJgjl9cfHvcq4+8+IqwSuui86IE99Z+PmWOrQDNa97AMM3V2SNwIT18zCtshDuftvX/LRo8tG83LL0MXrrgeZiCdbmmyO0=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2681;
	6:PrUlUXoXePldy8lm/fr2/fsItPKK/odPQwHfJ1b+SXn1LvDr3TRAje4W2aRMXFfoWkT0g1SJdIKEW7C/wqxyYc+Vy2xyMWUpw2NfTh9wFPUTA/11NVtXojOX4OfgTIO0pY1EJH17ySFujg/pwzFs6pllL21r4EoZcpKQBAua3h8hVZZDvh4b8pmCdFf5NvIseWAasDNEo+7KJxmnHeetM0gzm7HGczZaBYtDes4DUQWIqD9axwy8KUZEu4Gem9nJoxBXM55Op4FcLGVGCnbMgdtdCOd1Z/Y1kdtILFsrYu8Ji8fW5WjoU7R1RDxa2J2tE8Ka/BWiEVjRQqsBnShw775gVbU8xbHsCl+uEfo0v372EbyK9PbJKLP6xGHzEMMV6za8fbG5XhoohZz6nIf4wKFVYkNbgptkB2s5+kVz74f9fEjccbNj87OWpw9uRkjd/zKGqOGcRRugWdQbWxle5g==;
	5:+OKSbhu5yfeFSW/O2OPfCIrbR7pXw3UxMH/BZmyRUVtDroBGKEehkPieee6HuC6go5g6oWJuM/e7lnhkN/C46Z52qY8X7jSv+eXkVl577r2t6F1pTgZQJKU8d1yWvQ1O3XuigS/vM+EHF1NOEl4I653re9gV+Ppf8dOlvEYxCac=;
	7:lM89ONfO7VNh9AA6mZ5XoX1LfFAacz7/ry1Oi21JCbbocDk0A2y9m6sNbC6M2LHkk8om3YRkNatXpg4D4xAgQq4JN1Lg2hhgGYAZtTeJVCKHWmnvy58Y06Y9wENt3gEXzmcQ4ALmC0ZPZAfB+Fme6FC9W/e0sKOFhSSghWI2OHRzZkFNnQKXUgH4neXVR6JS2PQuJ8lhEKUZ22a/4E1OJv+7Iq7sF89TEKmvs5ys+vIOTMLBMpNjZpkTkQqdh4V7
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2018 17:53:51.7537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ead00bd6-b2e9-4890-c18c-08d613588a64
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2681
Subject: [PATCH] python3: fix indentation on create_manifest3
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
X-List-Received-Date: Wed, 05 Sep 2018 18:09:12 -0000
Content-Type: text/plain

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 .../python/python3/create_manifest3.py             | 108 ++++++++++-----------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
index 1849152..2db5e3b 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -50,8 +50,8 @@ pyversion = str(sys.argv[1])
 # Hack to get native python search path (for folders), not fond of it but it works for now
 pivot = 'recipe-sysroot-native'
 for p in sys.path:
-  if pivot in p:
-    nativelibfolder = p[:p.find(pivot)+len(pivot)]
+    if pivot in p:
+        nativelibfolder = p[:p.find(pivot)+len(pivot)]
 
 # Empty dict to hold the whole manifest
 new_manifest = {}
@@ -65,21 +65,21 @@ hasfolders = []
 allfolders = []
 
 def isFolder(value):
-  value = value.replace('${PYTHON_MAJMIN}',pyversion)
-  if os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib')) or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib64')) or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib32')):
-    return True
-  else:
-    return False
+    value = value.replace('${PYTHON_MAJMIN}',pyversion)
+    if os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib')) or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib64')) or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib32')):
+        return True
+    else:
+        return False
 
 def isCached(item):
-  if '__pycache__' in item:
-    return True
-  else:
-    return False
+    if '__pycache__' in item:
+        return True
+    else:
+        return False
 
 # Read existing JSON manifest
 with open('python3-manifest.json') as manifest:
-  old_manifest = json.load(manifest)
+    old_manifest = json.load(manifest)
 
 #
 # First pass to get core-package functionality, because we base everything on the fact that core is actually working
@@ -114,50 +114,50 @@ for coredep in output.split():
 # pass them to the manifest directly.
 
 for filedep in old_manifest['core']['files']:
-  if isFolder(filedep):
-    if isCached(filedep):
-        if filedep not in old_manifest['core']['cached']:
-            old_manifest['core']['cached'].append(filedep)
-    else:
+    if isFolder(filedep):
+        if isCached(filedep):
+            if filedep not in old_manifest['core']['cached']:
+                old_manifest['core']['cached'].append(filedep)
+        else:
+            if filedep not in old_manifest['core']['files']:
+                old_manifest['core']['files'].append(filedep)
+        continue
+    if '${bindir}' in filedep:
         if filedep not in old_manifest['core']['files']:
             old_manifest['core']['files'].append(filedep)
-    continue
-  if '${bindir}' in filedep:
-    if filedep not in old_manifest['core']['files']:
-      old_manifest['core']['files'].append(filedep)
-    continue
-  if filedep == '':
-    continue
-  if '${includedir}' in filedep:
-    if filedep not in old_manifest['core']['files']:
-      old_manifest['core']['files'].append(filedep)
-    continue
-
-  # Get actual module name , shouldnt be affected by libdir/bindir, etc.
-  pymodule = os.path.splitext(os.path.basename(os.path.normpath(filedep)))[0]
-
-
-  # We now know that were dealing with a python module, so we can import it
-  # and check what its dependencies are.
-  # We launch a separate task for each module for deterministic behavior.
-  # Each module will only import what is necessary for it to work in specific.
-  # The output of each task will contain each module's dependencies
-
-  print ('Getting dependencies for module: %s' % pymodule)
-  output = subprocess.check_output([sys.executable, 'get_module_deps3.py', '%s' % pymodule]).decode('utf8')
-  print ('The following dependencies were found for module %s:\n' % pymodule)
-  print (output)
-
-
-  for pymodule_dep in output.split():
-    pymodule_dep = pymodule_dep.replace(pyversion,'${PYTHON_MAJMIN}')
-
-    if isCached(pymodule_dep):
-        if pymodule_dep not in old_manifest['core']['cached']:
-            old_manifest['core']['cached'].append(pymodule_dep)
-    else:
-        if pymodule_dep not in old_manifest['core']['files']:
-            old_manifest['core']['files'].append(pymodule_dep)
+        continue
+    if filedep == '':
+        continue
+    if '${includedir}' in filedep:
+        if filedep not in old_manifest['core']['files']:
+            old_manifest['core']['files'].append(filedep)
+        continue
+
+    # Get actual module name , shouldnt be affected by libdir/bindir, etc.
+    pymodule = os.path.splitext(os.path.basename(os.path.normpath(filedep)))[0]
+
+
+    # We now know that were dealing with a python module, so we can import it
+    # and check what its dependencies are.
+    # We launch a separate task for each module for deterministic behavior.
+    # Each module will only import what is necessary for it to work in specific.
+    # The output of each task will contain each module's dependencies
+
+    print ('Getting dependencies for module: %s' % pymodule)
+    output = subprocess.check_output([sys.executable, 'get_module_deps3.py', '%s' % pymodule]).decode('utf8')
+    print ('The following dependencies were found for module %s:\n' % pymodule)
+    print (output)
+
+
+    for pymodule_dep in output.split():
+        pymodule_dep = pymodule_dep.replace(pyversion,'${PYTHON_MAJMIN}')
+
+        if isCached(pymodule_dep):
+            if pymodule_dep not in old_manifest['core']['cached']:
+                old_manifest['core']['cached'].append(pymodule_dep)
+        else:
+            if pymodule_dep not in old_manifest['core']['files']:
+                old_manifest['core']['files'].append(pymodule_dep)
 
 
 # At this point we are done with the core package.
-- 
2.7.4


