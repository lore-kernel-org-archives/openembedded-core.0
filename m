Return-Path: <BSREEKAN@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0085.outbound.protection.outlook.com
	[104.47.37.85])
	by mail.openembedded.org (Postfix) with ESMTP id C825B7894C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 01:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=LanLits5qKmpzUxyFJZrjGpzfKfx0adin8OuGrrC0CI=;
	b=b2y1HNZLDZXFqhUvfrkG8ktVyxBCx3cGf+gb0kuhynkh8fztVGsz6m+JbL8l2Dxahe4I4myq9zP0xAAdamk0LSly7SXFjZSQpr/e8nZ3ygisPdFGkx1qQPOwwDiS/f/snB2AXoeUYFl/9+eYZhgHCV8Fik/2HVxWt879Xa/HdZc=
Received: from BY2PR02CA0008.namprd02.prod.outlook.com
	(2a01:111:e400:5261::18) by CY1PR02MB1301.namprd02.prod.outlook.com
	(2a01:111:e400:50f0::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.567.14;
	Fri, 9 Mar 2018 01:54:32 +0000
Received: from SN1NAM02FT053.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::207) by BY2PR02CA0008.outlook.office365.com
	(2a01:111:e400:5261::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.567.14 via
	Frontend Transport; Fri, 9 Mar 2018 01:54:32 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT053.mail.protection.outlook.com (10.152.72.102) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.527.18
	via Frontend Transport; Fri, 9 Mar 2018 01:54:31 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eu7Et-0001Dh-G3 for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2018 17:54:31 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eu7Eo-0005JY-CM for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2018 17:54:26 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w291sGCs024258; Thu, 8 Mar 2018 17:54:16 -0800
Received: from [172.19.3.10] (helo=xsjbsreekan50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eu7Ee-0005I9-3q; Thu, 08 Mar 2018 17:54:16 -0800
From: Bhargava Sreekantappa Gayathri
	<bhargava.sreekantappa-gayathri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Mar 2018 17:54:11 -0800
Message-ID: <1520560451-4718-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(396003)(39860400002)(376002)(39380400002)(2980300002)(438002)(199004)(189003)(63266004)(186003)(6666003)(54906003)(59450400001)(106466001)(356003)(77096007)(316002)(336012)(26005)(106002)(4326008)(5890100001)(9786002)(5660300001)(8936002)(50466002)(8676002)(48376002)(81156014)(72206003)(81166006)(47776003)(1857600001)(50226002)(36756003)(8746002)(36386004)(478600001)(107886003)(7696005)(305945005)(6916009)(51416003)(2351001)(2906002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1301; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT053;
	1:MroV1Jep6efwCwIbN9nIAWxTG/41VAFe5kWj68hZ4ngfvx0IUrWXL5cUxmUbMnZlT4vq9B8KiqNCMNIdz1ZLvRx37nZhXI6MRWFUhiCNHVEmsnhgL2eX09t+whTOuble
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f92797d-46ed-4a1e-632c-08d58560b3a6
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:CY1PR02MB1301; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1301;
	3:qM+EZ8Vsp4J8nYpSytLqiRI/d5J7ae7Yp/5ZM4swswCaZG9ck8v0gjBQMP0H4yAgpJH8CBLXfwBi+DwRI3Kz8b12B0pwM6ohRMM5PKEhqNkw4gWrNbCx6bsSiZMh2ycLfFCZsQUYtjxLE0Jdps2DVk9SXBRueG5gTA+ujdUY1gp9WJQ+54WyeMJ1XiQzIXexq2lpAPZOTARkaOtWjgp96PJoxxbZePcfDZKecCJ9ETu8B3SbVqtcWDQI1+NTh6qjWzWpiaJnvV25Eg/pOnKv56SWES0iQ5b0VDCq0KM1wfHvFg6p0VXiplIcv5BCclQmKu4zU3Zp57t3v7lOys2ppcHXsPyMKcV3jFQSbnIO2vM=;
	25:4FBlSDAj1J1Ct8nWeXq0DvqLmVoJtmNI9gNu8I49iHF1tL/2KS6X+NbSxY8Ian0rRWXwTDojyW3qR5aqqCKneyNRMBc8sBDzMFqzZnDWd1S+HXGYzHgBg3VC5LUXLpcoSCVMkIHkx4+wC1kyUCTV5ZrWIlRCqCkgmOxg85ZPoEeo0EQRRoEhs2EXTt77F+P3gMA1xC9OueBndaujuae/ET92XkEV2GTQB874A3TOZNJirm03SeEQ6yqCS6A1PKlw5H55V4Vii0aIl2IK18AfAOPQldg5vkzvbiGB2b4HR8jGxMeDsjUh+5GCglS6nDRuI+/FmwswhtyPmplrodSoJA==
X-MS-TrafficTypeDiagnostic: CY1PR02MB1301:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1301;
	31:QEfVRj0kD+soalqhHCbGFZhh44cTmMTJup1kEybomkzLcRm+VxNte4HD83xC2ah+In+9MKmPJhp/SIj8PpkMeRoWcHpcWp+9dd78h0wiRBu+UrjVaQm8DcRY3atjl10mcqX35nhZODo2xf/dsQzH1xkPyd83LZVyi0KIqtMK9VkZQxsTg0oenLWt7Dvq0zgA9XIWKHDboA5qOIgmJb0gQJSWnvo72Wh8qePgwJv/Sr8=;
	20:49o5IK8GIVaJZJq8bPv/Si6qJ/zhc07hGToXKGl3ZJRb2jvfR5BBqN3dIB9c/hjI4jC1d5wsKwyk8LqnU7s0N5VeGxFM7HoRvfhj5It+Te90g8ESftZSMJhcWOiryevDkCalJO2kqPQ/UHX4T4gpY+Rh+JkqwljuWaiWeXilZF9cqDGp3Hr64/wFHG8ldYZ1HI6Sr/yORjcl/m7rIUOw3ZP5Y2Ju0amo65v5BHEJjNBDfpSpDdi6DWydIPSKh/lOD49qDzodfm1OUwAa91CA4Vqec3MzmdmyhQ9nKSQsqcWJeDopBmdFsfTd0NPhhrmPchvns38mPjYyH2C2MqpayLnWRwtBqurmniqppS65uFqsXW2US3HhY6mlIuAxOVehwtSEGlz8ITAoDrYXRH2a7nopvB+Fhrw5pAmst5ua9xzLwsD1vzHGEo1ZFzUD46aLz7fT1SyIttHV9N57ajw7YchAOzay6XzjvWr0ck8ZCD2AOFEuvnxPT8PUxh1CJjs3
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY1PR02MB1301647F75789387F01B9354B0DE0@CY1PR02MB1301.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(3231220)(944501244)(52105095)(10201501046)(3002001)(6055026)(6041310)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(6072148)(201708071742011);
	SRVR:CY1PR02MB1301; BCL:0; PCL:0; RULEID:; SRVR:CY1PR02MB1301; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1301;
	4:Vv3FnaFlnhwIQnl7GAjpWnYmXlGNIJ9crtORf4rbtJkuOKPfQmCnMJrxF+AZC22iQz+s7uDMdEAqIi1roySBS0BYIiMvw1eMi6ARAoJGI8EHpcYgI7h2xoTfC5Gj9mxsS5aEa2rvAvlTZ0dbBbKcbJjF1VMnLtLzmj/Or3EEiRxDJJ8zV0xl3CYaNr4KqYYxUYrZcvsB6VVAF0hsI+oWsGKgszBhi7IZ8Ch6/WPPPbNddWwKgCPbnP/KsO8yT488iUoC36LS28z3zHWKKPH0jQtRPJrDPQmoBXs6eKioO9UjXkl346k6Jx/5yhmDPG2F
X-Forefront-PRVS: 0606BBEB39
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1301;
	23:DX141yLFXAwzNbfeMCBegfWrxIZ4SPVxUI3jKxyJ4?=
	=?us-ascii?Q?7XCRNjlsYn+djftd5TfyA7UfzBj3WeiswWULRyf2Nt7Lu+cAOmZySdZ/7Qdx?=
	=?us-ascii?Q?0994gisMWCR9sWtrTj3M2UBCiY3R4jm6cS0FkTk0UZ13XLEbSoQIgPQDiTy1?=
	=?us-ascii?Q?CJxBPPdZ1n57hkEjBAc++9o0/bm/u561xEFQqNof9K/ujHlj3r4jyPhV+xHM?=
	=?us-ascii?Q?K03Pa4xoMNAzJIphtWHkGyO4MBu/BSmvx7hA113iLQ/QzqZmVLbVf2ISUivl?=
	=?us-ascii?Q?FN9JuTsfzjEyEUptQq3TBGhOIBoGcANmAH2p3LpVJM4Rngt02Ppgs1qi9XpQ?=
	=?us-ascii?Q?HQBf0JVd9t9V7BzfF3o9Sp/vWDzjQt/T7KJl8YUpxa/a8Swr/BTlHN0E0Ojk?=
	=?us-ascii?Q?vjWK9glx3nP7X8CgU+Oc3hoa2mDeZIZNcoL0yrEMwFr3gSMs3A60duHKyqc+?=
	=?us-ascii?Q?dRjIruefGoo8B8fFD8h291l31qkhVXGGw/3ia+F7cOiJwLKQB1PVsojtwDPu?=
	=?us-ascii?Q?liX7dh7f31xYP7yIucDqdJnLFwBxXx0R196F5fyWHR3TAW0dHMik/WXn2Tj5?=
	=?us-ascii?Q?GBrSvRHLZQU3Z4QEAJTFhSsTqZpVvhrKu/KP7D3SAgLMVI4seFFWDmvrRqLx?=
	=?us-ascii?Q?dEEv31vOtqjjupWZZzwJZ/ClGmMzuRaNFUeqykdupA1UBFDdjesMWaK7iL0B?=
	=?us-ascii?Q?0K97++YqjVRQxEeZQOxV8CcXjmkHB31WCZbJL1ZMt1Tal6ISXbXHEkFopxe8?=
	=?us-ascii?Q?GJozQQ7rlT+fN6Ji+mlHyC90U9r8QXXMh1iiEf55XoCKPLsy2hyYj3PIxH5X?=
	=?us-ascii?Q?C5PwS73dIkJtK9UsGEt8u4Mn1CRd1oBVh6CMK71W02lwLqbQKTWGp/q29QGq?=
	=?us-ascii?Q?ZParHYHYpULWvA+cJN0pphTw7O1SLqxaR+YkINDTcSmqFGV5N3tqbtfYdmIW?=
	=?us-ascii?Q?MjPW9GqR4abIwq9FmPPrPRpsg+VprNEKRYjunzZQT9mC5Xy+x0NEi1rw453P?=
	=?us-ascii?Q?4HQZXNS3WLam0QxwfJPkYezsva9jmU4k3Ylj0mhkH/SQueV1Bcu2v7Y9FLVS?=
	=?us-ascii?Q?aJY7oichMLpfuv/ngTCItW88X1KizErmwqeZ9hCAeXNO5IAbw=3D=3D?=
X-Microsoft-Antispam-Message-Info: SQ74K/GOf9MJf5WKcO/PzS4FpLM5/43JD1VOjwTcPlpfxSB7ZZXUHMbqMrOVVG8MKbCYVJHdzXpy9FE3tlW/cF6jJwdJDuKU5Owh2t4WGoLlIy022AExsjj6n5kwJErYsHdZ4lUTV14piD5TwnuQWryFUvd62jJwrV6eIEqOlTgyOPmdrb9mAr/jzPqmUUOw
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1301;
	6:MUHnkt+OaNIIMao0iGBPtmO6NyqBxD065loopQCwoW9JnN+u8g/+hrvRSYFZPCC0laNvMOgJJRI8MiwinovQFnSJDOxz+SIJKuQfSvXhE4fuIdWXoBaYMnZCNhCDd3/WlvDO1t4K0D2vGy8C5a2C5QMqwLOTJHopQBTSkxzkqn2tDeCbThpL/H6NfDC54iwySRedTJ22D93GH2qNoFp9bfOTgzII6nJ8+LBgxh5FHuXVL/sOiF7wCA7VA+sbGm6y+04Cg7OkGN/yFlsYAEMwgi/zgC359AnJtLzmB5NmYmAnKntWRSPrffhsIJCds3yGAmMsQVz7D+Bl4ppWd7M8j+CFRnhvLnEzjx863saDXCQ=;
	5:ozGsXyHz++ndrb7LZizmZ73OeoVGnZN/w/RrCZno8vIHaonk4mEhdUPnZD8sWBsFtGoLhUr6+T0sf800x30XxonEdiGK/1Hfg95Vn4jhzfKdY75juMv9ZdWcL3UjfBcwxe0H5dJVESfGxdjXGRlYYL+I8TAHKds2FDX/0qmU8Zo=;
	24:rCGp0Pgb1mZ/gIxrRPArv2BExEO/tcN4rr9Ptq12E3BtEsRLHTakBiQrtFlqLd4qZInpvZP243HjAmwfl4GY9wOtcIdRi3yg8yqIpOInRY8=;
	7:vblbSPXdE9tl+zvEGAx5/XQ8YCf6TfGVIJR73cmWy2saceI7Gf8qNx/EvqK4yPUa429OP5u6jz7JRvABoegnfe6y12zT7/39cKKpVxB75QuUuHkKd+6IK9LTqyMWtveijWOua+xV3ucHj02Id3BptA+D/odiXvAI0WhAJdbP16a0oB95m4aSxMdQ/k7S/R3rjSV24zyJoOSUMq4v6QGP3UANky6r01dgqQR7P0wguzKkeqsQuMmJL5sQM5FVuXtl
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2018 01:54:31.8923 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f92797d-46ed-4a1e-632c-08d58560b3a6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1301
Cc: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
Subject: [PATCH] own-mirrors.bbclass: Change prepend to append
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
X-List-Received-Date: Fri, 09 Mar 2018 01:54:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

If BB_NO_NETWORK is set to 1, and local download directory is added as
PREMIRRORS_prepend in conf file, PREMIRRORS variable will have
SOURCE_MIRROR_URL as the first url. This causes build to fail as network
access is diabled. PREMIRRORS should be appended here so that a prepend
in other layers/conf files takes precedence.

Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayath=
ri@xilinx.com>
Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/classes/own-mirrors.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.bb=
class
index a777835..4cfd894 100644
--- a/meta/classes/own-mirrors.bbclass
+++ b/meta/classes/own-mirrors.bbclass
@@ -1,4 +1,4 @@
-PREMIRRORS_prepend =3D " \
+PREMIRRORS_append =3D " \
 cvs://.*/.*     ${SOURCE_MIRROR_URL} \n \
 svn://.*/.*     ${SOURCE_MIRROR_URL} \n \
 git://.*/.*     ${SOURCE_MIRROR_URL} \n \
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

