Return-Path: <DEVARSHT@xilinx.com>
X-Greylist: delayed 10318 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 09 Jun 2018 11:59:46 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0046.outbound.protection.outlook.com
	[104.47.37.46])
	by mail.openembedded.org (Postfix) with ESMTP id 92D4D7545F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 11:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=e7MzJ7CJdXJmLOuX9RPUi1nIEiso0FSctp3ed0pptQs=;
	b=Yad2xcI3wh3maEoygDLyONMQsmfOJMdKHFyeZYpE2KBD3dBD4zM8l1yzXFoZpZ6jMIiJb6MsqJgGFla1OhrvIRcD+bavDlTDPu3wh1oS6m0tOwYKNwX2axSgAo3CXqtzC7agn3auyktbRd8pumuwM4d9+xZ6SNxtUDBgQuPplno=
Received: from BN7PR02CA0024.namprd02.prod.outlook.com (2603:10b6:408:20::37)
	by MWHPR02MB2814.namprd02.prod.outlook.com (2603:10b6:300:108::12)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.820.14;
	Sat, 9 Jun 2018 11:59:45 +0000
Received: from BL2NAM02FT036.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::205) by BN7PR02CA0024.outlook.office365.com
	(2603:10b6:408:20::37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.841.14 via
	Frontend Transport; Sat, 9 Jun 2018 11:59:45 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT036.mail.protection.outlook.com (10.152.77.154) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.841.10
	via Frontend Transport; Sat, 9 Jun 2018 11:59:44 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <devarsh.thakkar@xilinx.com>) id 1fRcX2-0006Pj-3A
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2018 04:59:44 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <devarsh.thakkar@xilinx.com>) id 1fRcWw-0001KF-W1
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2018 04:59:39 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w59BxZna029913; Sat, 9 Jun 2018 04:59:36 -0700
Received: from [172.19.10.63] (helo=xsjmrinals50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <devarsht@xilinx.com>)
	id 1fRcWt-0001K8-Or; Sat, 09 Jun 2018 04:59:35 -0700
From: Devarsh Thakkar <devarsh.thakkar@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 9 Jun 2018 04:59:18 -0700
Message-ID: <1528545558-5533-1-git-send-email-devarsht@xilinx.com>
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39380400002)(39860400002)(396003)(346002)(376002)(2980300002)(438002)(189003)(199004)(5660300001)(6666003)(2351001)(72206003)(356003)(106466001)(316002)(81166006)(9786002)(81156014)(54906003)(5890100001)(63266004)(6916009)(8676002)(48376002)(47776003)(50466002)(186003)(478600001)(106002)(305945005)(77096007)(7696005)(15650500001)(51416003)(26005)(4326008)(59450400001)(36756003)(107886003)(575784001)(50226002)(2616005)(336012)(426003)(486006)(8746002)(36386004)(1857600001)(8936002)(44832011)(476003)(2906002)(126002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2814; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT036;
	1:kaMentqRUthoBjhwzWPr/JkNIgjrP75WPw1RSND9RRYZN4EH56D1bdan3LEIGNIqbQfgvwkRiAUraCjPll+1cKv6XPPTaMDBlia1k9ReDpKbAQkBh2VEnvTdH7LgWr76
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:MWHPR02MB2814; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2814;
	3:NNWj/S3TT2vggoErs3HH5bMLJHOZry0PhX+8AjAxmQ2dpn7Elylqvf0l8Dmvj1w7mNOxbzxFtYQyq1N+2kJcAdg/4+inLut1h/yX+soJMkBYCm2IuTQ+Iwiml2G7UqmQtLef4iaphdmUFeiCKehYVa0UWNf6j/7VwMEz3HnvotOp/gzSi7CPwsdfaG7xBiY/fUvUfsdqcWfZUPziXZAJ5hYbEnKjT5uMgQjgUUmUe/Mx0h2PwdU7Skf3xmkOkme2dGKNa8GejmJ/Xdaer6abNwIYDLRvQNTypp/EDC0T3qEvMLypP3tHg+dhxZa3ypgxlmvidEOJ5n5/1SEmegEk+aRaHcaekK+7mBOhdeuxT5Q=;
	25:NDDtLTGyrtPvDwR1pNmhcBpc8nehieBfeqhBLozu7mLb4dzo1pq3UNItWZKMFZ3jolpqiiB+Gb1qKJqffnBM5iTkhqcWzgNkXq2fMdgpaUSX4hH9ENWX0OdbS80v5EIfeGyQEWjHdMobKDu/sY1CIYKV24ip0p+xKiZ8shsJoAT0SfJmUwnLhEpsSMILGhuuoQ8MSCTjcgotIAiVJUwbg4zLQrzBPJxyKyvjaV1FqerXEUrtHENkKBtFA8KtetGxfGJQ39hCm1b++dn55js/ZpSX7iQWU06Mbx/PnII6vk2CrznfXC4duJWR3a7ff4YCuTYM8zGhn/XuxDkEJHuuhA==
X-MS-TrafficTypeDiagnostic: MWHPR02MB2814:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2814;
	31:N4l7HryXqw3yQJDMfSl8JRqwRGY5sNbmTEeFkUMPEItkNlHxFru7QgwjHt2tfkV1WCfAPzwWAr+b6GEqzcb4rnjbOiLc3f3gIN51fPcY0m5RYoyiVkyfm75zdBsysVyFhf8d5kcMMb4uzWr745yyPY2eLbW6bNKH7Ee0ErXEfjWNoNAsNF2rcAdMI8uzO1D5LkbYj+2KxzIBwZYoOsaas1KDN5JHxiMGpELedRrxQi8=;
	20:IfPeMyChqzSajIfjwta/f+V41XeWbl94hfFDsDBpq2KaaSFJDVX+CgBm9a56RNEGX4ux46zIjT/PwLXhWIYUWVuyGOfeha44mGdQUShKzuGVUNHn4P6mPqnab35c7tAY92jB8H0rB+r6qm5Vv4IZ55q9EQi1FO3/WYJQ/OfEDsJg1dZ8oa536H4G7cbTy3sg3xmjXZAiqZ0pyOLBbX64MPr4V2SJEgf2LZZNdlcr67ZBdIoJo6HAeOpng353TgoHv5eVpEU4kU9fTRu1i0koDc1iGFto9qqifOce+RAH7WmeX/Ll3Z2Tely/PTv2AUTcRRYNkbfKQQxej3jpN2ZfnCaRORMb4jsCOkR3ctyg6ZzVrIlzJQxqM3swmm3ubjNHhjeIIPfzWc/aDrnGvG8jM0WU4kxcMD1nPTWEaKdDcEHrj2d8hJOtzfsShd02YSGV9heU8LlTJ1KwLiRe6aS89+uQ4HAejkK0OoM1AVneQorzQPjVqmIHriyl2IpTXgdx
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MWHPR02MB281461CD63BA59A319F38900BC7A0@MWHPR02MB2814.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(3231254)(944501410)(52105095)(10201501046)(93006095)(93004095)(6055026)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:MWHPR02MB2814; BCL:0; PCL:0; RULEID:; SRVR:MWHPR02MB2814; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2814;
	4:MvrzDwbskY2rQg/7oQE4NvB5rMFNyW64WW/xTc5wUK40zZbzeDunT++FZ9uDoC6t40OK/qlbuJWkDKg51P5QW8jSWbU5+WvJGnoEKjRvp0JBcJXAsEXM9hvxr7N/NZcllukfnvzGYiPxQCRVZKGmI8fPaMssfocb4QOcj/5pM2tBTuO6sJ6yK4/ZB9aChriGDl1W0LBTBW11EyEP0ls3SMldfmit7Fis63aKjPP/0YaHzTPtBNz1afl2DvrOVgyNimW+0ksxcfIao9LHBOVp7NISzdmJhUZaP+lNAWzMsD7q3WMDfPdsVcYe9Es3riTR
X-Forefront-PRVS: 06989017E3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB2814;
	23:ChFGa+Txu59ZS6/6vlfpsLn3pJGsXvCxcUGi5AEIy?=
	=?us-ascii?Q?dcqP098rt/mREJ9hthItIPC6D3IPd0QofuMzZhiQwzE7SRaxWEw4JbNA55nu?=
	=?us-ascii?Q?jzaC+06FfoA8/pWAwsKRoIeEtmivekYWZqTKF0C1lWknsXreRfCyaNig4m8C?=
	=?us-ascii?Q?wPadu9+wzaVRUfxDoC+38PF4ST+nsIlyTcZ/Trp/63So0sjJrClUt9L9ZfEw?=
	=?us-ascii?Q?YloVHmYs+xw01Sb73kuSQ9b71XEqCtCSLo2JpJc4+XdkdfZFBSwHNN9yUSqj?=
	=?us-ascii?Q?JhtyqVmF3utLz6KRBaXNEEpUxPQvXWZypTWAXPo4Ogz4ysGhJmzZXuFhF8tO?=
	=?us-ascii?Q?ctz9mb6+uJWKq35AfnrC47tDo4ykHdCvYL2KjgG+0MJzj1BvABX9ZFHLGkXJ?=
	=?us-ascii?Q?7ThynPetVHyNTC6RidOSBQJVcQYiaSAUJ+lGcQ2tX69GAz7pcEphULiaYAfA?=
	=?us-ascii?Q?NZ1MwEAgsjLwCtEkbufnitgHS8DUMh/Btsa87rw4MiQnpjl9aXCtY7ZggiN9?=
	=?us-ascii?Q?Sc/UIN5y+8hsC6I151bcyXZFIipHg8wwnc8vaPuv2Yl921cdH4dhfHMrpsm9?=
	=?us-ascii?Q?ycq41mic4zxLcImx+4QAPq1enFHFG5jcuMBrhTeoB+i2+fNHuw2imU5r2eZg?=
	=?us-ascii?Q?5wZ86PpnfVzmTbfn3/Q3MWM5lzQpzvMoePlbt8AcU68txYClYx1915ZMdxGG?=
	=?us-ascii?Q?1o+sDV3NNXyH7ldKPnwOGEQOqCxV3/e6I2gQjm2Q8HH272+JXL2iVXoXHivj?=
	=?us-ascii?Q?2K7YqJ3/s5Sw/wSvqbHKyy9OuMK1fDtxXlc9VRLZjxKKpNNdPzHXHHHtDqsH?=
	=?us-ascii?Q?zhc3B7y304vi839lhCL1yZAdjT/mPZ4bREWIBpGg1QHx8hY3GayVILtdOKF/?=
	=?us-ascii?Q?p4iuJsco35mqZwDiMC9Wj8mLocaYOapf0hUgiFSL9xr1BcYQ1G5k0HFv5imc?=
	=?us-ascii?Q?FxP3IGCYCzqJYBy1ltMhz1WWT3QoQoKTPdY8rPuRtqfEnFioskwXE6WmpeMq?=
	=?us-ascii?Q?VrZ7TtryyWVWHYasixAKzGjWfkUV3Dyn9j+0R/NZy35L2t7CUEPgHKIldVL6?=
	=?us-ascii?Q?rAjq+6V5UX7E4W5pLhBZuf/lMdPKj7o2LE0gKJ5BWlyNO0bq2dyWwALtlvO9?=
	=?us-ascii?Q?0QrhhBXstsmhOMlkfyTu8veTocLeQDJgPOzzh37x4AlPCv7pW8ASWcDKNkex?=
	=?us-ascii?Q?IMSR/cEFI7VR4NaEa1qolzRn6ftgjWbzO0ak8DEst03d+oa7L9KtJik/s0oG?=
	=?us-ascii?Q?TPOApmfmCLUgRTU6n0=3D?=
X-Microsoft-Antispam-Message-Info: xZzfgYBPh8Vycvf/xP+7x6a8PqHz5D5PJmGI1BcbNX/ya28SDGiKpVUu/8UtcnVlsn8ZkBErBM2Wz6DyQFr+wMHtDCCpLbdTvyrwjurp8dzN3XPdizbAm0d1UvsiBmn0Nf4XhBLZ2iIJxJfpR2LPO8RtH+ur4sJUDAdHrIderImfq1Q0j4XMDKGx+sFZYSUu
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2814;
	6:tki1OxeZc2tTc1h2nLFUsqn/X7V1/1w0b1dy3LKk26s2SV/vXDTDugEBF1BlxzxEYTLnOw7GEqikDWWZCgMkeI6Yuv6YSPFzBDJ5Q1mXfPzl7u0JBpfk2c+fZZWszUYD8Su9WABOfQIoUIpJ9giG4BSS6IV93WTO7r6KEkEGnS8ORC4AevVTOyMs4ZKnDK7pgVb04DJeoC1rALoo8QSQp8Fjro0NVgbctsHDXb8OhTe+DVNaHCse2BNCZGhcBVdqv9pUzvyUDW8s96dz0bMHVRYIYR8DCfjcGecR/HxRsCQXcy7gvqurUh6aejf+FKaUOFq43bVSNaFHwUbO3OoB6Lam6jeRZHEWBHStv5oYFZGNf5OojzvwyGx4VRH/4hVTV6Su7OarJxtMwBfFSKRQZDOs57b036Kf/IY+izehgCrVQDbNqFggJvBO0lQzhaXXc3Po1pq7RyJ8HQQSs60AAA==;
	5:qHPdCNhmnR5YympiH73nAY6TTLc4CEyLMVJdokN4aQBdLB7GfRUqHV5AFVOGuslS8N8qfrZ5Cdq9jsVsKCXIJLA2TkolUKk4PMH7JoNnS7XuiLldJVicEpHvS2j/Eb3RqwXWg8Vg1ZAPmN1YiC4nPer+uF5HI4tln3OwaeKEmXk=;
	24:NSvYGhRnhmgCcsQVpKk3AHbk7qf1dWpzbFKuwes0/aCLnUSLEAbGEC59Dfapswnmk9iHEmH7gZX6ndekbpvsyR1cQmda1qOxAl7dWo5x+9k=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2814;
	7:PXOu2n3oYs0W8dqNeppRVpxyV3recAltTErvTxx02UbE4HSDZlhRA202Yq0064hMG0l+VENT9UL1qogezfmqnuHoY28oVkHpiFaK+RJoigiT2cH+1CRTJNjs9bjJNMllEKXbb2KcEDJwlEWRM2/o4JIbRPbYRk4vNE3qofA1Y6rWipX1MIK00zDDAauS6OEVE4a57E0kw62+F/onC6nLxVfePNGRFV9IITQBA3uoLnHbOAjTD18HOpoaJTdJYccO
X-MS-Office365-Filtering-Correlation-Id: 340b4c87-7305-49d4-7963-08d5ce007dcb
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2018 11:59:44.6726 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 340b4c87-7305-49d4-7963-08d5ce007dcb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2814
Cc: JAEWON@xilinx.com, varunkum@xilinx.com, maulikd@xilinx.com,
	Devarsh Thakkar <devarsht@xilinx.com>
Subject: [PATCH] matchbox-terminal: Update commitID
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
X-List-Received-Date: Sat, 09 Jun 2018 11:59:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Pull in change which adds support for command line
options (-e and --command) which can be used for
launching programs or running commands in matchbox-terminal
via command line.

Signed-off-by: Devarsh Thakkar <devarsht@xilinx.com>
---
 meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb b=
/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
index 4488191..b7fbee7 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
@@ -10,7 +10,7 @@ DEPENDS =3D "gtk+3 vte"
 SECTION =3D "x11/utils"

 #SRCREV tagged 0.1
-SRCREV =3D "3ad357db2302760b8a8817b5f4478dd87479442f"
+SRCREV =3D "ccbc3c70946b04313c6166ab0dfef21e5e83c289"
 SRC_URI =3D "git://git.yoctoproject.org/${BPN}"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"

--
2.1.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

