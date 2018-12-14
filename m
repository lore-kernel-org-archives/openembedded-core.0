Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 39548 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 15 Dec 2018 13:21:18 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750077.outbound.protection.outlook.com [40.107.75.77])
	by mail.openembedded.org (Postfix) with ESMTP id 54CED7BED3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 13:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=WmXCMArljicuedP0Ud4T12r0pxtlDNx5sI0jrn4aEDg=;
	b=kXOEzY1EZThxZ5pJilv4em97MavHnhkc+LXEvNNLXKlt7++aIPCXG1zS/zp+pS3Q4R3qtj/Ayaps++79VdiMxFQgsKFoRT3oeE4xlwu+OnketLhz0dLmh00IEA+fdQxQAyJaxjiwbBUIRHb0Ec/51DZdtjdNUOACFuKnMjxmxu0=
Received: from MWHPR02CA0020.namprd02.prod.outlook.com (2603:10b6:300:4b::30)
	by CO1PR02MB095.namprd02.prod.outlook.com (2a01:111:e400:101a::27)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.1404.22;
	Fri, 14 Dec 2018 17:54:16 +0000
Received: from CY1NAM02FT038.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::200) by MWHPR02CA0020.outlook.office365.com
	(2603:10b6:300:4b::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1425.18 via
	Frontend Transport; Fri, 14 Dec 2018 17:54:15 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nathanrossi.com;
	dkim=none (message not signed)
	header.d=none;nathanrossi.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT038.mail.protection.outlook.com (10.152.74.217) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1446.11
	via Frontend Transport; Fri, 14 Dec 2018 17:54:14 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1gXrfB-0003Fx-NM; Fri, 14 Dec 2018 09:54:13 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1gXrf6-0005rx-Jk; Fri, 14 Dec 2018 09:54:08 -0800
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wBEHs759029216; Fri, 14 Dec 2018 09:54:07 -0800
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1gXrf5-0005ri-Cd; Fri, 14 Dec 2018 09:54:07 -0800
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <nathan@nathanrossi.com>
Date: Fri, 14 Dec 2018 09:54:00 -0800
Message-ID: <1544810040-12073-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.5
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(39850400004)(396003)(376002)(136003)(2980300002)(189003)(199004)(476003)(2616005)(63266004)(486006)(126002)(44832011)(16586007)(4326008)(8676002)(110136005)(186003)(77096007)(107886003)(26005)(54906003)(336012)(7696005)(106002)(50226002)(2906002)(51416003)(426003)(478600001)(81166006)(8936002)(81156014)(36756003)(47776003)(72206003)(316002)(106466001)(5660300001)(305945005)(36386004)(48376002)(356004)(6666004)(50466002)(9786002)(14444005)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO1PR02MB095; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT038;
	1:cJwmUSogWdRIDXUE4AyURMf50IR63KNbgmH9J0rZdzvb4pfcKgzQXImVuYY8IOS0mhj9QpgeVxiyNBsVmgQGomA1iKH5u1fjJVX63HfivhyDHlPnu9Op8EhB5WbgAA7I
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c17d3470-afa9-4bde-3a86-08d661ed299f
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:CO1PR02MB095; 
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB095;
	3:LP82QE8crH3NW/EM7ZcQsrxX/6nHi1UnimWCcb8IRLOYZesRwSFRqNCPwMHN5hA93swFUehp9lxKtzp01m5g4sX9JSRzlAcN4RkR7bPOr+srtqXxoshhKT8duFT+u3X9+JC88iCYGGnSgdUeInrbJbwljtcljRNsCreqcWAaoQmFlKzjXSrexO9wdXIZ65oLEpkevBhgDzqZuZV1QbZlhYxnt3zBlLdcPjn5AhByyk690hTZeenNzer8defiuUhEEvsv6VKClxci+r1JSHvQxcb2VtSfiw+CYZZn6epyqUWMZKwYNxuArdXVpJ7jxNSJdSEhtMITcfgWorkIeOp3l5zv6f9D7Iaf0D5c+lDzHzs=;
	25:A6mLQM/UG81cMjRlFz3Zfgue1aL2YCV4sD/AGliC2JcjMdV/1fklK0OoQYFDExTAdCN3lIUIYwvTKeG3CJGaB6b03Gnn7Ig/+N4ciSp7a6u7Js4O5UIobtrnJ2NWvjxrs7OCqEvL9y4aXnTnsAcI6e4jUBXjX0aqQWK+4i1dromte+JeGncToCoJ7g6Lh05X14uDHNM60u0cIpO/LipYNZ9IZtOqNzBZrKTtVQ6b3fTU0cABEFqNUZ5Zs+E0DuNMIbYmaoB2DLZyjU53Gzb7wWy0zMWK7VMjbIxdAF5HqV5Xcluz9/kYKhe92cNHW8/rnBYjtOUTCRLEJk/9F22sons6NOZGX9BeehtkeCbyTB0=
X-MS-TrafficTypeDiagnostic: CO1PR02MB095:
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB095;
	31:j0I/4lO81sszDIg8XrzjbEBXwZ2glHWz+y8kD286XtOMQRWXrvZ+obXINVF16Iw1mXoCinkOIh2VCGYR9kBfYl09GZ28Z/N1Htrw1jgP1kLzOM6yGhiXPQ0xwUAlFaOTGWjZI7biAxXRk094JCjq2cuYaecaYY3jgMMGa28O+tmHPTeK/c0KD93l1d+Fu2lFphoHHE7OUx39h0BUuhKxxS0u+mPQre8tGwcxqbAUAo0=;
	20:DGRXdfT4EvbOozIjG0uPtZYWE9XXuFoTClnd5h87alirlDxtbWGtJD5gzW5PjahrOWNxoo2e0f1kda5VVSe4ka8g6wxVXt2f5DSPvzIunXfJDaWjSuYPNFmyhd2+Leb7uCWMB8/+fpryaw+Lq0UhA8KvRMvoYGC5COXppZflL5fk4nkaHhhyBDH1iosCGbiItXsOxjDBKsPikHuFEp6258sXz3J9L7cI+SF6x5L4+4CzuOTr7M0qZ65tNV6ChACXbMxmfLVIJssJC3/huzXN2AXa48Q+xRO4eqZ6HA5BlImLrlq5FV11c2085sRT5T9Fl4b5b9M9sc/2aLI5AjUdtwl9pTHPOptBwViUgpyqSh0CYH34t8UuQH/RAjM2H3XlKLsKmaQLaXxPoFyTUhZqoYj7lCdth+3QIo/0Y1iWZriemxfaJLIH9IQspewbZFMuBATM66Q5LfDyH41SwHnQLelZveQ+62kGH9ZEFQ4TlsSZa4eHHgPsxPKi9tYRyh9l
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CO1PR02MB095737DFE8358DD7B95AC2AAFA10@CO1PR02MB095.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93004095)(10201501046)(3231475)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:CO1PR02MB095; BCL:0; PCL:0; RULEID:; SRVR:CO1PR02MB095; 
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB095;
	4:Cenn497zHoDIKFrKplqTW+rJGtI7ZOJ4mK1Hwc5EPKVhSesASocf3iqiXygi5EHdRdr5BSLgMFQt7FOBM+Tbp2i5ycWAE4bcla8wj9Mk5l8pzZnKiNPuMl8IvQPJGnvcHCkh6hLoX/zzIwrzLJSaRr5JLg6z27XTH+NASnpZ/cwvfe62xlvs3u3xVH2nenJEXI/y2cCyfg4gOEqT6meqLoefUDykrKIRjwHGClGo+xbXIxEKqn7PAo2+rJbytKkrpJXI/BhYea2Qq2/OiVL+RA==
X-Forefront-PRVS: 08864C38AC
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CO1PR02MB095;
	23:SMZ1MM/Z9QWpmgdwqCLWRbskjO6Ogct0t1WMTYCOv4?=
	=?us-ascii?Q?Im6X+J26cG0vUKzZVB4TbcH3UIS5g4t/C4e5JMGhhwhq+HFMj2KFU4QugsqZ?=
	=?us-ascii?Q?nTSnBenGM01hRAqTkgB28oqnEe8jciOGqs6iXlAUsMpC/gGIXIOjoNDg0+qi?=
	=?us-ascii?Q?JN9a7EuTEGc97Kcfh7RKf56kWg7RzX9+P5iXkv35YJuXzE1KzjM9QL5td5rs?=
	=?us-ascii?Q?jKyJ1xTunGF4wOq3yL/qay+SsQkKc3R5drigsYa7puK9ogeCwsZlk0D+eqmJ?=
	=?us-ascii?Q?VYfU2B9b4b1wT3VlkyekO6J6+7K1ky+KxDBdnZ9nNNksQN9UXvlU96HIDrB7?=
	=?us-ascii?Q?JLDmlvG0ZRBnxD/UV/DekZzUEAAqentspBPnwRuhrH863Ji+SzIHmsWlNfqm?=
	=?us-ascii?Q?6vdbtkv7EJYmMeS2pAgd49RqvDVZRHnvZNMJHZVpajfGPUrwa4HaHAp6RCJb?=
	=?us-ascii?Q?drQUw04Y4FaSdrUXlz8yV0zIJlNL5kakdZQz62VwT66ZVCKH6jTjRROEaT8a?=
	=?us-ascii?Q?1hBf+MCuVSh2/2jGuFiYMrS5L0U4BOmGca6yWTZm8Ry/C9MipHb9Rm9di1Am?=
	=?us-ascii?Q?pS1q6K8SVlkrdDhCUB4mSIg9+AsAuC8e1o7KGGRW15tFmJEai7U4718NCjsQ?=
	=?us-ascii?Q?Po5FBafiPavTpXM12Z+qlU3v9DU5RNoYKK2eaI/qK3isV/2zv1jIw4FoxfA8?=
	=?us-ascii?Q?1vdhAaPLl4JId7/LEOzVF4VIQXYeLULLB8Z2pKm1cgo0QOQWhPDYce+cXDfl?=
	=?us-ascii?Q?ujrLkzxoEANjsY1uVOy7gfUc0TBEXnkYcA5GFYqGu57JCtDS76RFFwRDs/80?=
	=?us-ascii?Q?7jg/9MF5pgwLuD8Af1APz70QoAIA6vt48ynbF5hOSyXo/buAgpZSYFvttEa8?=
	=?us-ascii?Q?GEYTYUiT4aMhZ49Qwsj03yKPik4RUy47Cfp3KleeIG+puutkfzOfumovaNNA?=
	=?us-ascii?Q?ytBFPTaiGmF8e/33L4Mswy6z24btVUGv81J9QnpQo2/bNi8N35U0zHnSpvhX?=
	=?us-ascii?Q?YxPg3GuFGOcQDRvwkKWLY17NXogwy2UhOS/UAI3nbKrzvNhFRlN7kJ2pmw/4?=
	=?us-ascii?Q?/tV5/dZlZu2AlQD55P3klaG4T8boJAKCmh3UFPqeYezdVw9Q=3D=3D?=
X-Microsoft-Antispam-Message-Info: RFREvQJFKmNPO89bRrUHQ8g0kX6hRaG/VAawmuphFF4ssKdzyAi8/mPMURd/p82nXytEURX1dsmNTElLq772QHt1bry1LyteOUi1tChxPM3ggd4tCCrCuRaBRlD649ltE/04vzi6E45Q09eW++TLwBwGa9IMIW+PKb/qdW4eUcil/NlSBdom72uTyiX344IiKWbcJ9fGXLlwc+Iber//bufr/layiKShDuKNrNLcV4c200WL+SIGUXkDSqNyxleWzdtkF6FF+jxn0ELQdmX6XSy7kYxPw4QRGxSGAVVd+kACS/i8G0RymD4WnrKwZU9M
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB095;
	6:S2z9nchm/bs4pv1/iGeKpM4TN1UNfq1V878dSHQOE5h1+EetMnYrdSgrl6d1odDvFb2JzTzYA7NvvZQgUv4rBe5hRWcoXtzFB1RDxWksm1eYIQF18Zle9FDIG0W6Ac9gEdRzILpMlfnBdmr5DaaGptkgUj8v/P/xhIGlyM2l3jYIz6qXQ0I33u+8IQZaQcoA5XoRAlS98JZ37kQJ341s7RlCKNKjQj9ajniSyCxT4mn7a9jDB0SLT0J9arcYbpkh4NghWL8ET68hGIBj6+ihblRwQLDwCrsR/kFQYRJpaY5pL1Dr7dk3hPj3DhZRQaNwPgD73FSbpZ+U2QW87YC4BGaUMURqVumxx5kdFvw3U4TEf9jiQijp5nM780HV42FlnBiBMVnu4IewP/cMzWgve2yt47Vc8+da7A6smev9Pggzv4V9LGDcwZpuFSmzwvQYJE4xQCOGZnCVAOUkprH5Ww==;
	5:pmg2SCnFfrhTATM3oC9/BhVXL2e7P2HJeLHgtMgLeNsQTiEzVW13M5Q7oA98Jci2ejOCKNHOX7mKB8b9MRnfw1ccw2kmt41rYFpDo1Hs+Lhcs5KqBrQIeLx8tezu7oSHLRG8C3OvP8xESROqnFPm95OSQ3QtwCF3rC+fA7bJTbY=;
	7:nGl79N1mu7RlWWOOsPBsGHGjct5rQk8IPs/erSQ9fL8Uw0HNB/KivFfnWlmNbA6Fw2jQdsmbaVmDVZxhyOmkTt7yktKRniDWLZjMiIajkg7ct2c3yjioKhkw+lgqDtYkP4ToFySFejlu4iIy/F+iBg==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2018 17:54:14.4979 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c17d3470-afa9-4bde-3a86-08d661ed299f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB095
Subject: [PATCH v2] device-tree.bbclass: Add support to compile overlays separately
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
X-List-Received-Date: Sat, 15 Dec 2018 13:21:18 -0000
Content-Type: text/plain

Currently only dts files are considered when looping through files to
compile. Modifying the loop to compile other files that are overlays.
Also surrounding this check with a try block as the function to find
overlays parses the file for a '/plugin/' tag, and there may be files in
the DT_FILES_PATH directory that are not parseable.

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/classes/devicetree.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/devicetree.bbclass b/meta/classes/devicetree.bbclass
index 8fe5a5e..d785285 100644
--- a/meta/classes/devicetree.bbclass
+++ b/meta/classes/devicetree.bbclass
@@ -120,9 +120,12 @@ python devicetree_do_compile() {
     includes = expand_includes("DT_INCLUDE", d)
     listpath = d.getVar("DT_FILES_PATH")
     for dts in os.listdir(listpath):
-        if not dts.endswith(".dts"):
-            continue # skip non-.dts files
         dtspath = os.path.join(listpath, dts)
+        try:
+            if not(os.path.isfile(dtspath)) or not(dts.endswith(".dts") or devicetree_source_is_overlay(dtspath)):
+                continue # skip non-.dts files and non-overlay files
+        except:
+            continue # skip if can't determine if overlay
         devicetree_compile(dtspath, includes, d)
 }
 
-- 
2.7.5


