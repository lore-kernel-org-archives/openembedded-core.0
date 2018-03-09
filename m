Return-Path: <BSREEKAN@xilinx.com>
X-Greylist: delayed 3710 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 Mar 2018 02:40:40 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0076.outbound.protection.outlook.com [104.47.34.76])
	by mail.openembedded.org (Postfix) with ESMTP id B687B6E671
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 02:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=LanLits5qKmpzUxyFJZrjGpzfKfx0adin8OuGrrC0CI=;
	b=DjPNWlT5f02vX9Ncp5pMd0aXzmYUeXweF3C+I/BY4+Vitux1XjpOywI0jHFZSurhi+PnAFCcrazeUXgcsN5+/8mqLWUiDZT0dG3lbuAP/ZU5FssGwCr8osW0F5ouaJD+wYN7G1jmJehFRJsTwQVW83eEH1OgA8yZ+/t05lV8AZc=
Received: from BLUPR0201CA0016.namprd02.prod.outlook.com
	(2a01:111:e400:52e7::26) by DM2PR02MB1308.namprd02.prod.outlook.com
	(2a01:111:e400:50c8::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.548.13;
	Fri, 9 Mar 2018 01:07:03 +0000
Received: from SN1NAM02FT028.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by BLUPR0201CA0016.outlook.office365.com
	(2a01:111:e400:52e7::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.567.14 via
	Frontend Transport; Fri, 9 Mar 2018 01:07:03 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT028.mail.protection.outlook.com (10.152.72.105) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.527.18
	via Frontend Transport; Fri, 9 Mar 2018 01:07:02 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:45906
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eu6Uw-0001BA-2R for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2018 17:07:02 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eu6Uq-0002jy-Um for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2018 17:06:56 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w2916mh6029529; Thu, 8 Mar 2018 17:06:49 -0800
Received: from [172.19.3.10] (helo=xsjbsreekan50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eu6Ui-0002j2-Q0; Thu, 08 Mar 2018 17:06:48 -0800
From: Bhargava Sreekantappa Gayathri
	<bhargava.sreekantappa-gayathri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <manjukum@xilinx.com>
Date: Thu, 8 Mar 2018 17:06:37 -0800
Message-ID: <1520557597-27145-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(346002)(39380400002)(396003)(376002)(2980300002)(438002)(189003)(199004)(316002)(36756003)(1857600001)(8936002)(81156014)(81166006)(8676002)(110136005)(8746002)(356003)(478600001)(36386004)(186003)(72206003)(336012)(50226002)(305945005)(107886003)(106466001)(4326008)(5660300001)(2906002)(9786002)(63266004)(5890100001)(6636002)(48376002)(26005)(50466002)(47776003)(59450400001)(6666003)(77096007)(7696005)(51416003)(54906003)(106002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1308; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT028;
	1:Vl7UypAkBfLvr6NkiFkg0eoYqPZrmn0LsbNGRS/INfdjvzq2ssnbzv7xDpGlXKH5wIdKWUpHSmj0cxxAGtXEerPedQuH92NhY28NTeh9CDsbeu21uLoyZOGMtXflcjoA
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 359243c5-2602-4bb5-8fba-08d5855a1163
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:DM2PR02MB1308; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1308;
	3:hTyL4FGVcr9afYIicuDM9xoubQLwqC9vgVx4SAkLB14Li5VSdhFwGLBEpCgKq9WTY4ekYSCRr00fwsrLB+2heTxwlR/5O2JEwaXZPofznYi88xBQmGj2ck2E4QicAsee/V8cmDgzsih0StYiS0KViRNancZ5HdxRk8nXq7jdU/FM5qgPyO8L6AskDmzEXOltKhqmhn3c9Fq4E7Kk4LX71FHDQfbtcVNIwCRPJabzvrYwYbw3SATsTSc9/6rgG9/9+ZvYs6gQxPoUKsmvfwDn567fgeLfbZOspb3mGJwHnN1PJUx189yQjgDnLyz+IajILNexOt21wwApc2DLHrWUwYgA+VbbeUsXHtjzqKC0FkI=;
	25:p8bRdS+f2AnvfMyv8pHM9i/OyJDiaDAUFk33lqmMNIZBqdZ8zpuBsdUrOUF0pNI8DX/hdX+L55BsCqF3XHTsfK+HnknZ7tvemfB+kZPQCcc9N0lcHQ7Iwy27ij/OTzOZh0GcycRt/7SRXqnYXSgmQJ2+9TG9t38sBBdDioWKD6mk8g0TOX9beSVCOBli2iMMKp5eDFoZ8uNs1/Q8YLgjeH/m77XqiUTiOfYg7zoN9u0CXZzkR1UArY4D2KW9ARCuMfO3HbMG8PAS2Sqjhq5Xdt0GuVEc/Mc/dTCuF4o0dyjWD09tRK9Kv2RBuJSiByfjOz9GYrlgKZxI9zuUxSfTYQ==
X-MS-TrafficTypeDiagnostic: DM2PR02MB1308:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1308;
	31:pLvXNdDpXhMlD6hqKurv8WuV3UTCwSYdvTdV9diCuYPKb7pvIog9gGnZwTpPkSZrfbs4Wnnrkju4iTUSSYFQJQnrt6DxIaxTDpzIYT8Twh+MJZiZTCl/QfK1pYaW4Jw+HSnVq4+ZFY6gP/hjV79Rd8BLXfMZn+D+LHG/G7O+mVA+fXtU3pGLZ9ZIde4f3hTgB9GF/HrVHuC2zEaoq9kYs6tA0FOcLFiOoqfjU4932kc=;
	20:TcyGl+meM5FBIhYaVgVXXmzYuIv9v5aYbvhiM3HpiIOHunT5gRCaECAXa6amUS/dkqrH6tGTCgTWvPcc5SE8zKCgJQ8SBLxLvJ5U1coMKqReweJtnZYud94XLrhg2YQ23ocHtUfa4VAnps/OU3FDz4krkMrgZ5KBy2Xe9/q7BqSlpE2lNxPKTCVylIBbioQ8mWGoPjeyh1hz3XsmqV+pc0eMhL/3NAlNjgzlJ++xeAe0CqEwZxAdIMEghC2Sz8sy6cDwVHFjRcoLAFuKSzNdGOUFS7JZyK3n+ljnJFpnoH0xYID2dPFnFwr3gvHnU4kcEGJFuQutvq85nzvjz8H8j1+rKHf2XQiCVl7nPtoL8RqNoVHWMc/7rEjlDBHDHkxlw46jx923/q6wshkLdalYuRQnuLhst0AEUZaetcZTBydUCCXLBKgz5yUk3uoTX1yOV0HCAJ7WzP8CCCMWgvpIl0+irHAjhMwvEljmL8nxDuaZwr8tqIFxJhl3NIAQiv3X
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM2PR02MB1308CEA070D9DAC2920520F3B0DE0@DM2PR02MB1308.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93004095)(3231220)(944501244)(52105095)(6055026)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(6072148)(201708071742011);
	SRVR:DM2PR02MB1308; BCL:0; PCL:0; RULEID:; SRVR:DM2PR02MB1308; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1308;
	4:/LniOj2y8u8rdaKRajruCzLna8omwPwoHzvfggNVrQxjrjFfUIr74f6aPQq2UfYtoWBGo4KYikVpyOVZlJ0Cxto78BwqKkjj5EVK+7ufUnpFNWcvMheL9ohRU+7H1mHrPkcrNg8rfJ9qNj7WDcM4leDeUDVclYNlMgWSGRHx9LJ1g21JjTk7OlETt0EUYtCV83gYnnqHpd3EOTf7T95vhhjLk1L8y31mpuM/Bz+xdNyM0Wr+/O37QucHQMY2hcCVjflcO7XcdPp2OlD6pJ7NFzWdXA5MhLzmT31D4TK3ssi98uV1jB/8N7tMvBAQ3fjJ
X-Forefront-PRVS: 0606BBEB39
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1308;
	23:f1cvyPX+fZ/rghQXIVlsg3RuE7sFfr/iC5yaDZojJ?=
	=?us-ascii?Q?guxYVyHWeEajxYI2eJ6yXsWoAyv8MtRsreQE4m8EbzBTJNO4YMdAQcE76YKh?=
	=?us-ascii?Q?VO3gWJNAx8e6pdVw17cempqxfYtoFFt4jIPnp/9zN6J9g1Z2ELcJS1U1KJPd?=
	=?us-ascii?Q?vhxUfTtaaWtF0jqvrseGDx8l0pVFqOG50pSCgg6gUu6PRhleqrcmMRoQLp2l?=
	=?us-ascii?Q?keKg6pxwEZn5cj7N5rQR66EvFyTKJxVOhZRqqbvl501R38dBCwFp2wqzSJP8?=
	=?us-ascii?Q?oZ9vpOoM7EHMLWepMfNdIgTdK4fHkXrBG2LwN0OAU9CWhNUHPO8JntILDJDO?=
	=?us-ascii?Q?69Sp7tdLJlag+4nLNcx7DMwpr6FTjy65m+wUUAd895FoWs6Gv/1SoSun+f/a?=
	=?us-ascii?Q?KY4/dXeKdaFTLOVWQRzevdeY3wtwQOZVMOvCwutxuFhrrRBYeBWHH6Hi76Ks?=
	=?us-ascii?Q?cMtqVmMK5QzUHDs94QceYFjC6vEsAKZJvuJrmBypNj50hb7lbV9xfuWhlZdN?=
	=?us-ascii?Q?uXPTfyH7QXpKakSkV4HeFkCJmBg8jic9H2TgvZ/yH8IMesbZmo+NbWSYepkG?=
	=?us-ascii?Q?1YgbqxSz+DbTe8oYRIrwGjulydvO3yeFh8+6+qPqGCRfBHHlpmQRf8QJqX7m?=
	=?us-ascii?Q?3INpjiUzrCJV6ImYpjjSuwzm1JpA8Xt0mU8thZSPHiMIKZ+Y2CeBtIFJQgPX?=
	=?us-ascii?Q?ogkzLGFf9TGAzvkbxqJwI7UsEBAhoEneZznP9nxXaPMeh8apSwY+MJvFCiLb?=
	=?us-ascii?Q?HnZt3Wqg9eK9f21k1Z6RoUEfNxr2hNXypQJvX3VrkMjijiES1n6Otjmm4jsx?=
	=?us-ascii?Q?rY/UPelsPZZKVshi+yg7tRoL3y/8n0a9dMFOVDp+HbiwW16QpINuna0C//NK?=
	=?us-ascii?Q?GrZTsvVKxl5wc8Odq/fpbOj/JXFPH4KoC49BU1g4Gtls6boKNAjRWePyLxVU?=
	=?us-ascii?Q?d7s3EQumGxb9MYUDDPabqAbcok+0jxjL6TiL7UzHugeZcaNeOkgY/aEgs9je?=
	=?us-ascii?Q?T2qJiXc1eMH3G9k4PR05Bn0O5mPQlgWDnstsDjF+7S5+FgHqUeWOKkXrFPMQ?=
	=?us-ascii?Q?u3DcXmjYhlEDs/MvJK3koqRJJErrRDrCi53AjBuM7qHxVgE1Sw7R4Ygoq2kj?=
	=?us-ascii?Q?XSjhl2JssA=3D?=
X-Microsoft-Antispam-Message-Info: orLei8VzBHf/xUV0JktiFUe7K7XKVjQy9cnU7Ujr5QYvlnbrIPdDkNXyjFtX8M0548ycD9uRF+gR7mUu+bX7aN3C5dAyr6c77RAJjcK9m3fiQzpLsOdzc/y3oCjfY8NHTdtP9RqnYyxCl6RP94r/m5aK840fNjMMbB0cFdaydKaWnbhrfXvh2oreKmpPj1VC
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1308;
	6:7VNYGvwaApd++oB7zpazYrBVPWkmoFnGQkLJewMJZHO4jSTvrf61rfTpgLCcDH7ZhwFv6111oSJUAxusJfNledtJed5nkIm8UoZhYhIkd56mbyi2IYlxEa9IDLEk/yfot/JorYNaOVnnWEw1HtsvFziEd0+jvBzY4F1pCpOzR8hSJLSmyq18tsA7zeSJde9CPp2/VRZskeqkUONB6dD+1kGSSOJGoWu//avbQ/FD1DXg9Hym+kroO01R63u4ufnO4wJQSHML7+0RbCnFUlzFuk2lUBH06TgMuDOtXdt3wD8e3/fBAJFWdKTZaBvkIJqeOBfk8oSsqNI0pk0xJoNmM9+wLxzg+sfAKcV65U0IFEw=;
	5:l9mbGf1lk4Jtl2iIJIAbvRMA00e24KTLOT/54jsjb90qa1FI8n84QszOj2tuZK+1iGdIjQbzgbPKIIX6FEHVe+PNBH7RNzAWrcwY6qBqyuTCIXMiEhOhw4Nr0JvcDNt1taRMlc26ltfPL0+LFHOj0/iYRNlDVPBsXt8i0K5ZK4o=;
	24:YzTk/dgh+SbC5xlnr68qSRG+91ZluuYEjZvoZBH4o4kzedVyJGYsCD0VvZYrT4/SLYZWodcdYzcvwqr/uvzJZfoKEAM146zsyHcUzb274rQ=;
	7:tFEdbBvflGwObYMtGr5od56juxHblF/I4p/qvL0Wf9ANUKDTcHVJN0lqnBVgMSm8XMoJo3b1Cp0kXOGvHsrHd9BKBGAsRpUydBjeeT6mQq/k2ugBYhzr1XUotPhEhFCqjZuUuO9YrXDDT1LZbpehWXd9mgsm5JcTYcUUiVouefOKCORtmiHIYoUeKBfC7bPyFmvwm7WCJZ9rYZ9DT/hxBCC8o3NKemm6t8qO0LAsQIqx8LszL8i2ngG+WUdwPdgH
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2018 01:07:02.6831 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 359243c5-2602-4bb5-8fba-08d5855a1163
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1308
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
X-List-Received-Date: Fri, 09 Mar 2018 02:40:41 -0000
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

