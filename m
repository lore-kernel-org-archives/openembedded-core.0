Return-Path: <DEVARSHT@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0060.outbound.protection.outlook.com [104.47.34.60])
	by mail.openembedded.org (Postfix) with ESMTP id 839C578A0D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 13:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2BvQ/khNnMl7P2uN8x00PUXq/xOXDlNVX9bNuSbWNYU=;
	b=Sgy6wLgn2jE9gbfMTcCM41zwUEI2xD66sydvUjnQdGa81Age2gmOzBA3lWcIOLD1HoS5cUndltG/kudxOzvsLreCxiLxTrdIZL9EzGVpM9iL88cBIwXh+wD6nRHOPSpnrcYGzqWYAKectCiugiJ+rG+5SESXyZVs8bHM8p+BBHE=
Received: from MWHPR02CA0021.namprd02.prod.outlook.com (2603:10b6:300:4b::31)
	by BY2PR02MB1622.namprd02.prod.outlook.com (2a01:111:e400:5267::28)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.952.18;
	Tue, 17 Jul 2018 11:11:42 +0000
Received: from CY1NAM02FT005.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::206) by MWHPR02CA0021.outlook.office365.com
	(2603:10b6:300:4b::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.952.21 via
	Frontend Transport; Tue, 17 Jul 2018 11:11:41 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT005.mail.protection.outlook.com (10.152.74.117) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.952.17
	via Frontend Transport; Tue, 17 Jul 2018 11:11:41 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:58218
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <devarsh.thakkar@xilinx.com>)
	id 1ffNtM-0000TZ-TX; Tue, 17 Jul 2018 04:11:40 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <devarsh.thakkar@xilinx.com>)
	id 1ffNtH-0007E9-PP; Tue, 17 Jul 2018 04:11:35 -0700
Received: from [172.19.10.63] (helo=xsjmrinals50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <devarsht@xilinx.com>)
	id 1ffNtG-0007Dw-Ha; Tue, 17 Jul 2018 04:11:34 -0700
From: Devarsh Thakkar <devarsh.thakkar@xilinx.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Tue, 17 Jul 2018 04:11:22 -0700
Message-ID: <1531825882-7255-1-git-send-email-devarsht@xilinx.com>
X-Mailer: git-send-email 2.1.1
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(376002)(346002)(136003)(39860400002)(2980300002)(438002)(189003)(199004)(486006)(47776003)(575784001)(50466002)(51416003)(5660300001)(476003)(126002)(14444005)(426003)(110136005)(305945005)(2616005)(36756003)(48376002)(5024004)(478600001)(81156014)(8746002)(6666003)(7696005)(8936002)(316002)(8676002)(106002)(356003)(81166006)(26005)(72206003)(336012)(36386004)(186003)(54906003)(77096007)(50226002)(4326008)(2906002)(107886003)(63266004)(9786002)(106466001)(44832011)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1622; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT005;
	1:2oCda3bTH3CuRtPeUB+Ln5eoKk9JLPY598LJM8kyCQcmwnQ0rRoYOMtNwRw71OnEl77RPsgU3WjxT82OHrshK+MmwSByZOd2HwbZqr5xqCgshrnMy/OojNX7kATurPVT
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5dbca0a-1ffb-400b-42fa-08d5ebd612ee
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060);
	SRVR:BY2PR02MB1622; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1622;
	3:HhK4aRNi7XmsVFiSM98UXJcL0MpaHxGeqQsrAZmHd0m42w6SqRAB9FpfIJjrwXXyumHBAHEUUsGMkaAz5PmHeiTP2544j/auiPP2PTvpLHqY/UtukB1VzqtJ6raeCJsmHVA4MOshBz731OPs4DJT6ztNzbkW2wri0agAI+pF/Gv2NcHtaH+Q2ccjTZOjXT89iDyh/dXgsVV83iXM1KEcTTGXIOzf9pzdvwdC9XpoCISh84r8FHZ3vKAxJAwdZ8D/uWhHWgLkx0us61gkfrbfweINGRzbgeig9qtb7Hdr9fx7LW8JzzRpcKXwHEMRUYPuVHZB3kHpCwLC++B68rnedEoKpay41T4uOS0lP1yEvRE=;
	25:Fy4GCaw7XGVRkfqDjBIJmqFkn1b5yXCiBiqIeiLmCo/B4eEqMJzRev/ADp5Nh3uDYdPCSvEPyQ7+KxVENoojw9LFRr+H0/rfY7NkCXKeTTL0YXIO+ba2kqhLZy1LGZkhJx9j7eEAFeZvhqHupr6CJ2Q2ofYfuJ6UqUWkbujqxgfM6NsDQe9CsbbvORsJxT1IQ8XPZj7OHb/dEzkLOuwULyLmcrmLPNsv7VRjFa59iFh1uJSDd8O/3zz35l02f77tNTmw5uHcRzoAo49dEjJluwODI6yd6miOstznaHssp8G/rxJXlVeI7mrCkipQI5y/9YswxD5/ZwA0lJ7rLv1mFw==
X-MS-TrafficTypeDiagnostic: BY2PR02MB1622:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1622;
	31:p2Uv4SqBfiSBAtK78Ok5DFJyk+fdt1bz5xhY+pkTzAtos780EM9Zr9idDDgW91/APfyQB9QfUa5HDEP4tZXU9Abh4QxHLWchvchff79lSX96D7/1OO+lCROKnoO9n1hp7WKvgHq06bdyQKc2Fzz6EGdJFNliCIbAEnWDcnyrfZ2Xs7VoJZP4qgVXlhLIwEEqqH+Lol62IpyAt0MxD+2hRNf6wyoSX9nd26HCMeODmJU=;
	20:w90gwbmWFGW/ffoYLESgzrfq7cXVIcNq/voGA8kfuLZulYOXEjaPyye3BDDvcjO5IaGij+zJbnl7suI6+yVAnsSt+4Z1grnku8SQyJb1a4kDTtVXcdaaJhchtgCMcbfTsZYnmrewug2vX43YYwMSQG9/8JotdBs/EQnJI4img58+2rZLJY8X2GPCu2+8YEvjsp08n9FBFeEBWRlKeF80NDjDbzuR865J5RKonOZ0RcdA6RwZkLIHZ+qgv2fF6GGq+4T/pVeRsiJ09gAxBy0thX9+yWi7SimOUEmNjZRKve3skX+IMq1BpbEItTSLmDeup0I/bg8wPENh4zUqFTIAnN+O4U8lhklopKMcVDMI3hJON1Kv1A0cu/08cRv6kRia1jIE42p7FR9swgYWVqQJnKfFivT0la2YgYVIFBd8p48rz/hSoauWZtNN8VSLgMm+m0QOKfdxsuLPhUkXI48sQkKLQjZ6AMIw8coWLYjmGuqJNmB1sWCKSrOX7EOnwRZl
X-Microsoft-Antispam-PRVS: <BY2PR02MB162236EA8662CF9BA0FE063ABC5C0@BY2PR02MB1622.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(223705240517415)(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93004095)(3002001)(3231311)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:BY2PR02MB1622; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB1622; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1622;
	4:EWkSIiyCj1VrwOcE9o7n30Pqj5trfDKkue9pKdZbwZ6BOAL0PWUKLgNBbAEVXOaBa0RrdsYF08Rq8GawBYFN1B4M9h2z+/uEu3Ed1gFZdP+GoQ3wN+Zs6+CknDugZyVdEKlcwE8rXOK36NlkolSIOALzeo9a6k1JZR/k9mulft//Z/XOHd+ogiIkjK55pY+mEYglRpJ5UClkPNESlwH+Rfbq/Kq5imsuX6Vctrk31g/Kj094aKWx/QSF6UzI0W75XxSjoZcbApNGjYJSmc0dqCnJyvItXZ+oqJcMZr+6FxOorlAR++9z+oi+FGtC3vXEwhlpJmox8LpzSFMxO0+6cD6QSEjdJMSv5TRGyRBJrSQ=
X-Forefront-PRVS: 073631BD3D
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB1622;
	23:xVLhybneEsV364rIKCpx1inUzdmP2d4XVQthgAxtb?=
	=?us-ascii?Q?lQw7D0cbQDe2qNDGBEK1uzQy6S0OT4jgjCMffH8B7qTxR01bZkRkaNqAlJci?=
	=?us-ascii?Q?M6seDW+0Yh+KhV+lvtJw7iO6xyz+P98jld6I5HDYZnXgsK7reyYpd/FiIm0+?=
	=?us-ascii?Q?T24slqVohnFkYKx9wO5t+DWkPy5igiGtuIofzHxHMvD5ze4WGwxj7Ew8gMkR?=
	=?us-ascii?Q?e5LNqhbvjcwk5IIVjTPs1Khb8FoMoKUTdz8VHa27US5NkSTZSBtrxecvVmp7?=
	=?us-ascii?Q?eRY+RFuOQGhx1agGaoUAugRF82eYZYPBppHOv1l6S5tNfD682p1ACaLBX4B0?=
	=?us-ascii?Q?0g+Ce4w0I8JW88lxsR6dqC5RWk9yTH/trr+DyYyQ+3HkrUv7Jo4k+ZMXspt7?=
	=?us-ascii?Q?ADUQBoeA24ahX1wRp6uByInqa4O3EGzEFH3s8NsnsQS0jQDmQ/Z8dfOcIb/5?=
	=?us-ascii?Q?kMB8k8P9aK1bP9SuxkS7rz+cnIw+1tJPb21RkH0utsaESgKxpdFcuXGjMs0G?=
	=?us-ascii?Q?pkndGUoAdr/VgV1g8+zW7w43+yb68PUCZJDZbs5BSy1c6/krwKvvgXi0EeQv?=
	=?us-ascii?Q?EOnGpmNKqElstbToRvGsu33nUdenjOdajvmGHxCXbGW48ODV9CCF2ouQfI02?=
	=?us-ascii?Q?AzEWfCxOJwlcQvjVWZloVrxFWLiLfv3HoOfHuy0VvwdgGsfu7jhzy/zHcJDH?=
	=?us-ascii?Q?o0H5tBypZhBrAULrxPKrp5zPzQJccNMP/4yBZXYEJgtxQqcT6n74FcW3gsyW?=
	=?us-ascii?Q?4o9GeGm+A8t7nhX/nMo7bIEZ+syEJ+lmsguvNRT7Ok95PthOyAs80M/AHRKm?=
	=?us-ascii?Q?mLgaaLczTYCRy0Y4uTCSmiB1lf8T5X0DxVGGNUUMeHkWhBS2ebNWaKsGQrOI?=
	=?us-ascii?Q?jvadRxXT+Wb5eStkAezZ90PjQ1vOSBC74xHCfkWNcdOBtCaQ+x6vG2EMb4GV?=
	=?us-ascii?Q?/MFePEKQ/qpmydmF7qNd3SaZWB9jqdqQ9+lLB8Vu27PQKwtm63DEU2lv5q44?=
	=?us-ascii?Q?vcO8QhNG49B5ejt4zrVA3bk2QKyrPWM3Ng8tdUfxy8yvBxhIbOOXDVFbvuFH?=
	=?us-ascii?Q?e6tZ/5mhK2WmkNEdHUav+AeJqtRhI0VGy2jUJ3BMrfw2/kphD9wsYiv2YbGE?=
	=?us-ascii?Q?uhUVdtefsRwVaZc8VyJ3+HMQ3js32ce0HzGCcmmZ/pFqCrksQDJd83ZnBEFP?=
	=?us-ascii?Q?FZeHR6a8rFRg/s=3D?=
X-Microsoft-Antispam-Message-Info: wyCwQ9kCYA0PvX3VJwh4psd3PiXbAHqClut+WG3MEWJAbifIVg2WcnFFgOZWaYphX3K9piXCNevy1cuYX1CT9rlpEoVSwxZ8bIN4Oq7vGNK7QXdHUxfGYaO0CDumvmgCAbEp+68HAAXQ6cC8Nn3QUDr2XjFonysXVwKQOrjbYeDc2/oypov1dAFnUhq0F8w7ZP1cFyC9VaUijJFSN2xjvDwCcreTBBiSJ6SrnaWXOJhvlTbOYM6JU3nWOUUtPsLEyrcXctE+iQ3O9zwiTjYZWO80Hf+cM9yFPL+C+zRJE2XwXrSXkiNwiXDULEKuedOn5mBosPWVIx1CGm8ycjiWV4FNuRxZtYYUjXXSUJE31NE=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1622;
	6:8yU/SipuF4C13yhOU1qPu7fcHAl4TxVsTzbBOfBzlwdL0ZkXm2/0/uRnrq/sRZmgN0MJiycf+WfvQIjtF2AKqWrjK80VqSTGIxgDP8yMD1dXBnGVPaVIIrqtBAP2ralVw6ppJ+S5o3YWXsc1VN4d++3ikxLHoUHq9LrRaz7G0ZgiUPIQPP7eb8DKnGd/prihfrR+53nPooG8lZpig3WFi25F4eBpqMiKuG6KPUyMX+6FjwohmAHYVwt/zz/6RwyEcm962xbAt3ncoe3CC0TiPFnmTHhfm32qrho44PtWcK4vbPyGxRC11wf9jhGvibg3JCDtGWy+XprM25zHaunZRTsGqDDD7BW+PB2WInw/fdqd3JYF7Q8Ej0bNMiCgTNbbnsNPgw75wusvsTwegAWcWZYGuaV49w2hk/PcsKpgB9mOOKM5kafaXbE6bX4HXy66XQlMaTbYev7ekl6w4n7z8w==;
	5:Jbia71Ahzia4q9IEEmRocPD8ZyG1cdk3Jsq1OG21hGe3rV3gW31/ZQETEnd+7fv7Ch15KFOkgwajZV+7rUXR34Mgq4eipPQZlqzziVWln5j+KCFgQVDCe1PD2KI59bOk6gRAAlhjakDK/OKL34Q3S+SwKiOa/IrWTSJdPk4o1Mg=;
	24:V26NshN+fOvYE8O/FlJwpcmy4lugZFMYr+8oqz0PUFvaZeNqRPD2S0OaUR/LjNg3lqxHFXCjl+8w5kaKDd3wOaLaUkiTbfElgmkRSOmL4Lc=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1622;
	7:be0P+zxcXdvYGLZukSSJRHFotAwJXlAhtOqM4un/tfw+4j3tlDrC8q5+RzrwJc/8ZsscJaodgmMsvvQOnPXrh204l7J8el+RG70hXC4BpYandu/CzmtRW5E0VaS0H1LRwLvmyOG5VLtC+P2FlMZ+j2Ga076TKuum0U02KpRB8fNIk2+7nxkFV0hNFd3+vsRMwNxMa+0l3YXM1huKEcCtgL1mCSxwaEcMMr8t6C8RwEOxErD9ttXEuW8d3bT4Jq1H
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2018 11:11:41.3582 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5dbca0a-1ffb-400b-42fa-08d5ebd612ee
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1622
Cc: nirmala@xilinx.com, jeegarp@xilinx.com,
	Devarsh Thakkar <devarsht@xilinx.com>, varunkum@xilinx.com,
	maulikd@xilinx.com
Subject: [PATCH v2] matchbox-terminal: Upgrade to 0.2
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
X-List-Received-Date: Tue, 17 Jul 2018 13:46:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

New version adds support for command line options
(-e and -- command) which can be used for launching
programs or running commands through matchbox-terminal.

Signed-off-by: Devarsh Thakkar <devarsht@xilinx.com>
---
 .../{matchbox-terminal_0.1.bb =3D> matchbox-terminal_0.2.bb}            | =
4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/matchbox-terminal/{matchbox-terminal_0.1.bb =3D> =
matchbox-terminal_0.2.bb} (89%)

diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb b=
/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
similarity index 89%
rename from meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
rename to meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
index 4488191..7f5eda3 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36c=
aa9b7df079bae19f \
 DEPENDS =3D "gtk+3 vte"
 SECTION =3D "x11/utils"

-#SRCREV tagged 0.1
-SRCREV =3D "3ad357db2302760b8a8817b5f4478dd87479442f"
+#SRCREV tagged 0.2
+SRCREV =3D "161276d0f5d1be8187010fd0d9581a6feca70ea5"
 SRC_URI =3D "git://git.yoctoproject.org/${BPN}"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"

--
2.1.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

