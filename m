Return-Path: <BSREEKAN@xilinx.com>
X-Greylist: delayed 1744 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 Mar 2018 01:50:22 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0083.outbound.protection.outlook.com [104.47.32.83])
	by mail.openembedded.org (Postfix) with ESMTP id 07A0C6E671
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 01:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=LanLits5qKmpzUxyFJZrjGpzfKfx0adin8OuGrrC0CI=;
	b=v8z2r//RbVr/a/r69LH1yf+qz0iww00tOoODyYWeSdyQsbNHIBpp+t+fnaaqMFoenbEZGYpcRlC2Dr9veNHtsrS5fQh2x0kyMftYLjSPlAcSoLxPKT9jnpOP6JT9Trzrm/ftaP44SXO6KLm4/aPUVxOsVivyxZBVnXFp0gkTeHI=
Received: from CY4PR02CA0005.namprd02.prod.outlook.com (2603:10b6:903:18::15)
	by MW2PR02MB3820.namprd02.prod.outlook.com (2603:10b6:907:3::33) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.548.13;
	Fri, 9 Mar 2018 01:50:22 +0000
Received: from SN1NAM02FT032.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::207) by CY4PR02CA0005.outlook.office365.com
	(2603:10b6:903:18::15) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.567.12 via
	Frontend Transport; Fri, 9 Mar 2018 01:50:21 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT032.mail.protection.outlook.com (10.152.72.126) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.527.18
	via Frontend Transport; Fri, 9 Mar 2018 01:50:21 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eu7Aq-0001Cc-Sg for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2018 17:50:20 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eu7Al-0004Zo-IV for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2018 17:50:15 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w291o4cw022973; Thu, 8 Mar 2018 17:50:04 -0800
Received: from [172.19.3.10] (helo=xsjbsreekan50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eu7Aa-0004Hd-Co; Thu, 08 Mar 2018 17:50:04 -0800
From: Bhargava Sreekantappa Gayathri
	<bhargava.sreekantappa-gayathri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <manjukum@xilinx.com>
Date: Thu, 8 Mar 2018 17:49:38 -0800
Message-ID: <1520560178-31053-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39380400002)(376002)(346002)(39860400002)(2980300002)(438002)(199004)(189003)(48376002)(7696005)(106466001)(336012)(36386004)(356003)(63266004)(186003)(50466002)(1857600001)(106002)(9786002)(51416003)(2906002)(54906003)(50226002)(8676002)(478600001)(107886003)(6636002)(316002)(6666003)(5660300001)(36756003)(26005)(77096007)(110136005)(5890100001)(4326008)(47776003)(8936002)(59450400001)(81166006)(8746002)(305945005)(72206003)(81156014)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR02MB3820; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT032;
	1:0VxwmNDMpDP7wy/srP4T0IHpIM/yvNyKPsRMFMdjEV5dHdD9kk/nVDpi8nT7KJILKBth97fgjT8mIEdTS7j4NxQLnoR5u95VnrnO2LfkEp6bOAx91xFMTnCaPmZlBQee
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ce0e232-6aa3-4c80-feba-08d585601e55
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:MW2PR02MB3820; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR02MB3820;
	3:snhcGBzYocSNWpWAAgJoRZcuumUxv/ntbCmCYLxmeMm9iqC8GG2J4fpehDrHilj3y5q61t4Tgq6Sb84mZy6Rx8OyVmuPncqDOWCXfnvhGVPpatHaNo44yWnQRwk7nJu+8RwF2EHYkwWSTCS8u5z1rsaDQ6wIvM1j2GQUqmVmzwmEplTkuQO+3XtSmSmaM6QciZpfxYhY3gXMloLbjX2ENAW9AoZ9Y0WLwZwKl0b0gAEa2/KbMW9HIfKHpHYJpjjutD1RAzgXU4QB1c8uz3rLLAeTW6aPFgpjHse4onYffyq6FLT9cnTg71EqgB2e3kkP2/GNjHvERwuXvY7sFvQb8wNZr3Qxc/n2PPePs8kgnIM=;
	25:DDugnm1Y5gcLo97oc6XtXbZbo47V8l7cBodTWXunaS8E556klTmoIf2G7bY3GQkneB+goMHv/+01hd1vlDlJn7MBTp9TJvuXGeJc2d1b6LgHGCFY94+A8sW2X3D+NQEL3Y5Lkxlth7LhRQLbnOrqUa/88erSelBdHAuJfYMtnom6GuzSM3pdorLkrx/Ez7G1fmGcQVhL6Uy/+RQ8YGuhWIoon6fa/W5K0KNobfM8N7bmNSXKmoufEbteSwgcfm4KllCcpdPYi9AH9WxeH51Ym7NfFA6Aej0k3ZJyWUNhXbnFMA8mOrrq6EII4DuBaqDob3h9TU3rMdYvY/XiqWIwYQ==
X-MS-TrafficTypeDiagnostic: MW2PR02MB3820:
X-Microsoft-Exchange-Diagnostics: 1; MW2PR02MB3820;
	31:2i3lTyh4/ojzduY/7Ce9+x0SWCk+c/Hl8QLwRt4eOwAa6S5D1k1vHaSPu6KGUX8lAJShfq/9kbBkDxuVCkHmRXxpVVb+OMRUZxZfijwdhKWa7GB8rFLa7fl5fRNeAaEKKH7wyvMUhvvkbdA03kiBG1of5FGMVpFA6bBz8RSfXDUqrTlmYjakRRJ6sVyKX9w3+nvQ1TpVONFRFqLEEtnMzYAPu/q4mm/rqz2tlzamZrk=;
	20:vvHRYIYAwLYcjtGdLBlgxLftKtE5W0xSBOC5QtfvTVMjrJ4AevOLdeCitXZbLFBdnA02J1WwUJGRRjGJPUtS/uXWwCUqo9siegyPJGTJ183U8mIR/qvhmOFXOXAYLdml4f/MI2RSdoUOuWTqXJEfX7nRJEE+oq0S+N2RosU9EIxtOXj8+cJKUuth9STMnP+0Vd+vQc/OoZXwS+KbYQhS8YefLiPH0EBnfBclmHzJITyJlnJEbSlHw9piMPlB/0zq84H6XCr5hFJ4ECv0H1I+/MVQG1RJBZCUpM3xEXiyKJ3sF/vlQK3ahQ34n2oULjSHUjOOamqq1y/eLO7waIrPI/6RrG4UuV7NQswaJUQ4aQuQpmVpYyPr6j5b5Wdmbkf03btS6aTUhPj1uFmX9fcaiWBdtQ9JZin8Xf5wVgIT+MC4E4GPDwYBq0tXfWynfba/80mnSd1/1seOr9JkB3mahH1EZM6msjFm58dySookIuzPVDVifp83PPFbzQUUxVMW
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MW2PR02MB382032D0E41D18BB63C30038B0DE0@MW2PR02MB3820.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231220)(944501244)(52105095)(10201501046)(93006095)(93004095)(6055026)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123560045)(20161123564045)(6072148)(201708071742011);
	SRVR:MW2PR02MB3820; BCL:0; PCL:0; RULEID:; SRVR:MW2PR02MB3820; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR02MB3820;
	4:4QJD1mSF/6G3PiVyevgmxtcu/0/ujE+7KorEO/xyT2iGCmEl1GXOBe56qak1AOdW22fHk9rra0oMOFm2rFMX+YhFBQ9fkQbU5QbeQYnMqzJ0HoGH/bJ7hH0nuNZcqXUL17+PW/bE1tdPx/bA8umJdITb5XvP0lY1FXl8VJlz+qAfQ15tqqV+1gRrCPY+PDjpOQZTupQKL9kSrH+WT4L4k7j1Vqzy0Rb3OmThlZyEGFjDZe5KUpsxstWQAeYl47rittJpImkKXdtt3hz0W5tyusSTQsFz1+ZcMsuFZ7ht7j1vFQRi0rrHLapfSQsDbJDe
X-Forefront-PRVS: 0606BBEB39
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MW2PR02MB3820;
	23:gvbeR5rhH0AJNyS+s/6Np0tBF6hXHwTBGHSkShgAU?=
	=?us-ascii?Q?xPdxPMf/3OdnaE1+cho1BnypoaraDlo9CTXNsjifSI/7arM/29vmClL+m90L?=
	=?us-ascii?Q?yj1EbmcbYatQCQ1SWFb4h1ocpcO0e9WCfOUBzoDdYE/TkDaveKNjiMxsmUDX?=
	=?us-ascii?Q?tU7WxfomhxNljR4HTwcJwykgpsjMvTSyZVzgqYMM/b/CcC/x3Yb0dzjazUtP?=
	=?us-ascii?Q?0Aah4T4YKNkgxDXjbytmGpAbOL/rkleoEUfQN3tq5DGt7iRb3Ir4dE9tOomA?=
	=?us-ascii?Q?Tw8LXUzUsSiEiph2agKLtX9bbDFmTBdLjDUvDfeCTMq+YVEH1qt3L5LpcFNI?=
	=?us-ascii?Q?tJ6Yurq/NafV/rT2a9tLNcxfTcsEuuJWlsa0CRy+TuBZ8BWuY7QNdtsQrkLW?=
	=?us-ascii?Q?gb/YLGUz8CnLAMCJ08TViy0M9ci3pcnCutbpoZw1hukCqZvtUpSs8jJveKAJ?=
	=?us-ascii?Q?fgn5FkDVwFBbhFYfNp6rIHbaXGsfe3eu7s0VmHKQqmKpqmcmB1tExskJKMAd?=
	=?us-ascii?Q?i1h7sCPkg0/hAv42GTelO9ywIpKnJD7Fbw0PlROSDWioXHl3V4DQhX2eA0sL?=
	=?us-ascii?Q?weFf9c+5qVmlOMADX38EgTPwB0mn1LUhnDJQsUpxiuwK+ikjHnX3mw/H9a7S?=
	=?us-ascii?Q?Em+j4mwR388GP7aRT9R2HbqqHDZVTJmZPqNT0FRFe5F5Q14SjURRyL1oYaQI?=
	=?us-ascii?Q?3KI7nJAX6j/86Zk5sky1+jVdSlJRtBHFdqdgDmgI/n4AbYzn/B9eWt5PM4hM?=
	=?us-ascii?Q?Unx6Dc5rafLVesODcVMuqZevPxW/UkKhu61FH4w9lUZ0YCeEd0EsMQ1Evaz6?=
	=?us-ascii?Q?42mAYNT3jNf4Y+tB9On2D1j/Z9au9pqMLQFtRcrR3OHuquf0FJ897QMGptZY?=
	=?us-ascii?Q?n0Ll0hw6MCVBwewCYMkk84CCNvhnMzLv7yEWuKAePMZXyjaP36CmwJEObZIp?=
	=?us-ascii?Q?ot+4tHrcLUCWWBWaYwl32vlWuY6ni4xIn0+Yh7am9sU/mADKbeSr5W/skg3B?=
	=?us-ascii?Q?3RFG/f2pHXthnYOn8J56qyJXQY2qne2Bw8mHcNOLWzqhI5eaFoiS7FkM6RAf?=
	=?us-ascii?Q?YI/iRA/7C4IOumR+HARlNXrGn5mqFwOTkoGPhb42gAqywulxw=3D=3D?=
X-Microsoft-Antispam-Message-Info: uX7vEDx0/GoydIpZDYbfI181VZvClD+X+8B9g0ukkYOQuSMO+nXvLDoRaFeTX475L9dZFKe6wivybAhF2XqsLeT5fNSwutCf5XVL2o0sChM0fPekl033TtGkWbeRXQZc63W67LjahbkiXiBJFz2ulUL75EpA4stMIs8JQEgsLKEStcj/A0eyoorlkKxj/ID6
X-Microsoft-Exchange-Diagnostics: 1; MW2PR02MB3820;
	6:cFajdyQFjiNCFFsgbr3YG6hwemEFeTZ7smVWG14Xzf88biW/h1MeQBKEsuoQaV3hlXKKtgfV9Y5KfHUEGfCf4vrvLo3Jh34ubnGEdaMQ+u6en/PzQphwUXI3EU4Kwe6EM6JEavQCzJgolyp/rxV25sihKZFEv9RXPFSCynSfRn0wIerzvoVWmkjprXPENRF9tqF+p5plGLa8L5RZy2fwM8+2+d4rPYHO6x5FTfZo2K5ts0Q9kqfz/QnG9F7SacWlojmSHDCI8G2fBXGPgEJjum5dzAQJ6dG6PZ2SEu+I6lZ09hw7ZO3Xp3KYWH33dt9CHpVpfmQHJpuUD6DJs9iQ1QZbPz9Q8/lVHbSoqqy/2xY=;
	5:DexEdCYQUkOCdNYULTeIlwARroV6jYGjQzJmP08+OyWJWVxqlRdThD//OMOet/PWCcfkIxljM8sr/poZyhB9jLhZxRuhC67J+d0KhYGGbTFXR9fknK/67i6ys5D2pL6t5yl2F9zicI+PwLJM2zQsNDNtSFAlMZnwUKv/DMh3cZg=;
	24:21UREtSsBjnDiXfHmMZCPBLbe5eIiBHXRUjtj7nkVTtdEX+D3PYXg8MMhjyUV4sHPexdaF3GuCLqxMn4qZ0Buhm1QrTSdSmMAQ3gx9GlLjg=;
	7:KvjYykONJ6oNo4qZ+rb6ytrths+tbxTRGzwNqWXdHYA/tyNq+DacCW/CogDJoke4b0vWeqKEFQXWKap6kXMjleXfne9npuyrFY4xKAQqdviPOsNwIrHaMK/MZ6qqzwXOjEL6pqecnSM7s8apPQH9SqoE9CrXVKtIsXXyYPpC4tQTqKXw5nGGoOuBnOoNdJ9I1jCFo2DIxLkxR96Bx3CpdfoslVs2ReWKGV4AnzmpLixWzOL3/AH+t8DEnR7UP9dr
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2018 01:50:21.3850 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce0e232-6aa3-4c80-feba-08d585601e55
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3820
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
X-List-Received-Date: Fri, 09 Mar 2018 01:50:23 -0000
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

