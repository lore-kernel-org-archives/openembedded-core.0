Return-Path: <alistai@xilinx.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0076.outbound.protection.outlook.com [104.47.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id A8E2471A61
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 23:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=LzXFpMY39rhb/zHmg4K2Q/DLiEPWlFafEACOmc20rKY=;
	b=mxvcMhMv5Hv+TjhNwWL38rOyzRfZPYhD53Xb4yOWe4aWK4PB60AQ5ao4w81ao9dq5OEEYD5SepbdNgIuMsfMQCG7tm4BugODOdd0ToPZZJOcprDjYvN+P9zBebGbGHEh51tTPykmSJ/8kQiKW8UVqAgWCdz5BdGgvlirZT0wDHQ=
Received: from BLUPR02CA027.namprd02.prod.outlook.com (10.160.23.145) by
	BY2PR02MB2006.namprd02.prod.outlook.com (10.166.109.156) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.679.12; Wed, 2 Nov 2016 23:20:37 +0000
Received: from CY1NAM02FT061.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by BLUPR02CA027.outlook.office365.com
	(2a01:111:e400:8ad::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.693.12 via
	Frontend Transport; Wed, 2 Nov 2016 23:20:38 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nathanrossi.com;
	dkim=none (message not signed)
	header.d=none;nathanrossi.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT061.mail.protection.outlook.com (10.152.75.30) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.693.6
	via Frontend Transport; Wed, 2 Nov 2016 23:20:35 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1595; Count:17
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:53102
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c24pe-0005bc-Ks; Wed, 02 Nov 2016 16:20:34 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c24pe-00013e-Gq; Wed, 02 Nov 2016 16:20:34 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	uA2NKPOX032372; Wed, 2 Nov 2016 16:20:26 -0700
Received: from [172.19.74.182] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c24pV-0000z4-PK; Wed, 02 Nov 2016 16:20:25 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Nov 2016 16:18:23 -0700
Message-ID: <1478128703-12144-3-git-send-email-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478128703-12144-1-git-send-email-alistair.francis@xilinx.com>
References: <1478128703-12144-1-git-send-email-alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22674.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-IncomingHeaderCount: 17
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(189002)(4326007)(81166006)(7846002)(81156014)(305945005)(50226002)(19580405001)(107886002)(19580395003)(11100500001)(356003)(33646002)(5001770100001)(36756003)(2906002)(87936001)(8676002)(50466002)(47776003)(48376002)(77096005)(36386004)(5003940100001)(63266004)(586003)(229853001)(106466001)(92566002)(8936002)(50986999)(189998001)(76176999)(9786002)(5660300001)(2950100002)(4001430100002)(626004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB2006; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT061;
	1:0Affteg/efhbo7sQetZSHfCY6keY95hL/XfVEDbV1T8t+QGoMU5ydCRJtBDldMXvr+lbjxVf6s7q7GpWG2PVW+R2Uh4ze89aoiTco97sLkPA05OkWS/uen988IX2PESlMrslsWDAgTKl6VIC/eAj9RM+EYw/sAQJze4bFRUeWYCcxCxlX3IosfN79kOj88KMb9sL/bhPQVQoJFOCaAs569ALpRQL5XimJ3eXTq6wSfVMKBxCU286s5L0oUZcREBS0vUrP6AwB5y4Bnex3S6DQ7inSpvjhyCmIawtO1vRu5zlMa8rayoNq41IFA3cD8y7UCThxkA7jTkG6AJozXnmDov1VjSav1EzHgtyyInAsiL1Agx3SqrDHVMuYNQO46WfC/AYKrkrsy7C9b+g/e0Rt27gE26EEnkCMZ9Dna5xzFzkq/gkjDZ9V1U9hGR1P9t6rY/oWF/AlOPHn70uIGDXnBbNt8LAwAPuAS7VmBg6kNCvXYYsmHfIyuM3r4kviV+eZc9xAfYpH0aoQfph0WWZjFk7kEkp0NQQs7rwZFh5DOhFxe8uSea/E4u8iF5Q6vA/s1kWYDxblbZ+rzXk0MVd84QiJjeKyIzHRGP013HMvMo=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 3299728b-d90b-4057-6a63-08d40376da71
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB2006;
	2:TC4mmgMoNxvCA3f88+qgoifi7ACCNegSUBvnTmFqrak6R/mAgOiec6mHzQ/Z2FQeXJFD+lx/2EU76czZQRL/eMZ2EK37Xzs2D1GZ5u5s/ERooeC/dLT8QpBkiYoksLhdT1CexG6iraDxQN8MB+aGkMiZ3i4VND49Xc4eCJgu1uG907JEfCTRw1Znsxr5HDgeL/wHfi2q3yJCVT9IpzPKbQ==;
	3:CVvDusmQ9gB1QQP/c2jSa5UCVCxMymrJTMogXDTA/6SAyy4gMKW7d0EOHqxoQTEguvIE3DU5wanfyqlcsCdnYhyNJgMjD20UBTfLD8syPRIUgbvMJkf1C56idAkd5Lin7yKNU0QMGVyKUSnXB71xIPmn4f4LbL47svkcUInclBQrXyeVdvnWe6Q/xmOskQgV+juScPXNjTGicehVxb+v4OabYu4xfbeb/osZodnmM9DVhrUw2lXz4S7SUPHEzAvTrF4l3wECTzNv5GksP6hto6Zl+3/etkf5xvx9Fc4tjKo=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BY2PR02MB2006; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB2006;
	25:MXOfON4Vja4sFOs8BqlTAtUs0I2dADt9gCWledSRdAEEEWSBMhLickUQj03KT/2UUFyJHiT4ORDBYultOEQjeZS3Knyw6wPNDn/Ci3F4yv7RJsiG5A6S9BhxbRFQYVOPZEKCix3kCWwsO1mPWXOlIZUnmlRW0dpAJM10bOPkWGvesKOe25WE//rX1w0Nl9P84t1KwaFKuDPs52g5TRHwPIPWUdnereWuxXQQSm7JLDFuqQFIWm/HIM7MFo4DvmlxLiC+zFBQjJQ+DCGqWzIS7LpxPeRqVHlUpWXViv2MigBMRjcCfvNy/nz3xJYPas/1VbDtKuFDPOgARwsCrBrd/NUDi51M+SXy3vq5Hlbep9IMx/v9yKw5tk7oYlGzRsW5iXWpLyss0EdnCr5+L7NpPd9jQbCEtEVEqKYveJoZYS92t9i287eeguLDl7iHfkviU7udClVrmcsGbSb60Sb+wyRE/bkzLXJhmqD0suNGeqagCmDVpr80ePNQwt00hRUKNNuen972f6aykC2+pmXqfAr1uoJyry/3Mng9WgC8WCamcdYxnhOfqsr2WlNVwwLe2YqEDhni1JORq2RsfL3m9tfNT2ylMpX+pb3YkMOWry9VZMhbZPJPfISuvGLO6IHuycvuAE3TqYqnNiM28Jt9umNS4KWxv9Li65N2NZSK95X8Md7Xe+1n5E7ffeKMi5yJtaYmBFKYcqhxHDfreDuzFanwcIwWJ0mBWp7pOgh1xxqrYxIK/aH5W4x0aPISbxfvDnrGYfsUzxf420apr6ru8XZbJMZoZ9zBEVz9Sk/5/o0=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB2006;
	31:WO57ThMtySUiWix8/Yt480QiFrT52PeoJhB8E8Dxgtk2lfrDvoEAmrQDEyEDsFZ8lp/lNJeud96rLuQR3w2CHjWbFY82j7O09SlDKklbA/h9bSb3VljCuvmK9bdMlWZem2n75SGI7EfcCZlo5C/5XVXET0Vy/JlXO2nIVjQIjlEEMyRndMvdu2gV7E1C22/y20D3dnp1jezguNl+paTcrrzvq2KuDkLPXN3N7gTF90/dhJOi88IPPlaacVXa/iAY;
	20:KC4gm8FubUO4gX8IUcuutlMy4lPQDO+u2ZsIqTgG6bENRI34FJqD8hTYLJOFyh/E42a+F2On7Cr3QXnmjzinTfEQgCMeJ2YNagJSbymGoIJRDYcN1eF9ISLQO7Ygpx2BIr2hy6tX2ux0O91dgxa8MGwrRFMwPrYlezWYaOqOOhV++dUtGCo4kG1xpi6ZpSb6B3OYhcinnxQCmRD+uKdi4ZlDMygr/aEsFedhumdMZP8fKqxpnQflm+pUzNEwjiguRGVsZI6/gnkIoG6wMQgZpZ2V+IzDp2ux34TdTJf7VKIS7OQjAitaSj5UjZZEpUvo18ETCzJ6/SHlmmFpyEEK8ZWE/8A1X1LqbsnEtthITn7UPGHvECk9skCN1DN4Tnp2TXkhMniBMxW1x3m4MQtink7KoiE4QOhUHl4qOjBC3vJ4KLdoruZn5yN1jvJF1dSNuIRbvkpjFvxw0Sk5Zm3IBRBv1Lu8Um7LWCd3/4jKA/sUe+5wYnjhTjVdy/9u1aH5
X-Microsoft-Antispam-PRVS: <BY2PR02MB200661085001DFBBF21742C5DCA00@BY2PR02MB2006.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13024025)(5005006)(8121501046)(13015025)(13023025)(13018025)(13017025)(3002001)(10201501046)(6055026);
	SRVR:BY2PR02MB2006; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB2006; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB2006;
	4:ZdKoZnJyNTF8sXEAvSijiFQjT3C7QxqiL7Xap0hD0z2aYswFnqxPjf/f1SIG29Ear0nVq22kPGv5jAyZLoa1ltDGSE+JzSr8ITRlBsMGx1H4Dt7ZbTig15IZnFcxY5LbFtrc5vjHHS5ThpWD013YZR6wefrHhcWUnw3IkwrTgCHTfKXQ3z0RNFW90Q9ZY7wlDguBcjVhh6yIhvgGtboi4p12GqNu00n+vZZJeiczG79L1H2CaZso6aC6bP/LzMspgOd/avYA4oAwno+wUl4cZInTPCChBRyQhQdw+E81RenyLVbn4lGFpBshC0dk/EE3bzgONAOkBDSlw8aOptqZLwW6U3K07lsUovRPBIxPSqfifPWPgUWCvGoNGiS479ovG++Unyt6vTH9pYQpy142ovSL0uJLfUh7skbFtkopg0PFmS6MqyIXCSZ+6R/R46lyutmySzy9q+degWXuBLfjblQzWt419DIIEmrwh+j1xJ78pJE2pOBFsnPEpNLtm1BiXI7GEboRa01l8CQZbYomxvYmb9YpKOedOD1r+sw4vtPHtH1Ae4GRTQ4vM1/qPp8Q
X-Forefront-PRVS: 0114FF88F6
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB2006;
	23:RjYreV/+i8cQVUDFkMUYQmbIpNVMbBcjBCwOK+QsG?=
	=?us-ascii?Q?moBjvKNExQ8NpEDYtcGGxAqqtTU9/nhdjuZmjc8zwf2EIqoO04LWzg+CrabF?=
	=?us-ascii?Q?ub0608fY79cCPTMNqOHlLyORFnfDutmruqqZ25HfHdc8ZdBvWsBeqbZwiDPw?=
	=?us-ascii?Q?+G1DqqJ9nfX9lxXyWooro1kHQS7aeTvPSHUXd1bfsYIoeo9FZPfMFpaF8qMN?=
	=?us-ascii?Q?9FB3zOpB7xWAPkiVNIvSFT4i7li//ixSKDgfG8rJCJY+ILP98DuupzdZYYFA?=
	=?us-ascii?Q?vaelqBdW13FAXAzMhZObyDWZURJyszNpmWsfwbgSRVqv0uB2D4su/q8ljJqp?=
	=?us-ascii?Q?QUXDobzzFNKgr24I+ozH5juXqo5Nm+0FWsySNHWi+piT4iuxaYnbNM9JFD93?=
	=?us-ascii?Q?1jOUdUoQe3KCd3TuXqjOXPEpUUFPCc7H+HkvVbUYgA6DL2gcKZVIT6VXvHWQ?=
	=?us-ascii?Q?MVSe9Dy8R4vzk5uIH5YqogJjvdeJdcfteaPBwTLn6HvCyEMt3MOOW/sR3u10?=
	=?us-ascii?Q?OOxZXdgRSfQNM56Ewoc9KM4UnA1RtKEYDddB6nGql/nNdfuIPu5A4P27N+YM?=
	=?us-ascii?Q?vhrTewgRbWscUp5/OB9NfNVejrWQjchAXgqoJAL3corxil5Vibsz++PsBoE1?=
	=?us-ascii?Q?dEZXsYL5HQmN04yeC6NdzrW5UgGr5BF4N2Ni2N/oAX1Haz6nXUyabvjJAjqe?=
	=?us-ascii?Q?YVVxEo3y0k0WuBnkB1blmoGBbng7PB85b2QxMLyJ1mGmFbhasGzrDo3pDq3/?=
	=?us-ascii?Q?C/XN2tl649QPBsoTYXCnQcrnJmT2mMibWYWEsAVwa3mBpzOrMUt4sWY7pv8H?=
	=?us-ascii?Q?IhmG2HcpYwH2P27CGsNqoM1Ny8Rer013+9t3qenv6EyRWLGC2weLVmc4PzFH?=
	=?us-ascii?Q?fNwTn49sPBbeNrYI35JD6HBUQ0RtlxNoVAE9fZh5G9XHeNilUigKxfHaXPey?=
	=?us-ascii?Q?crCF/hg52KlJjhZ4b+s4bo85nQ+PVt7+uh7rSJZSOSVHigDW0hLZMy5b3a9T?=
	=?us-ascii?Q?UMer+JptyPXxz2naf5pzi2VlLskRLVDkcBFr4AgFOec4DNOqiAPBQ8gNvQXk?=
	=?us-ascii?Q?UggfGM0yy0ob4NoSpoH1ZHWC4kajk29kSwxMMsDEF9xIUJMbMI91oc47p0rB?=
	=?us-ascii?Q?KCuEMcGCWQ=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB2006;
	6:67oMSqanefeYJ9SZUc5yf0aPcbNyBJrCvmvZBykoct2mMP/+q7VLYrB5ioCOs+Rp6CwybxTsR22G1mo7X0Mq3jlEcGqY0KOMiLYqTXkGmT7NllKMDIxI/COwDi5vHTih3wHXXuQO1C5z8dIv0NjcU/iv4Bq6kk8zpZsCyuk5s+nv+FKIPmCLpX0YMSHEIRzbRtHlPJc1qx2jJBq+LJVH++5a92RJsa8Ze3gNLCntsgzMrbxvdkSNbjXoiMsORdF5QrS1dwnz1n7rAJeZhSZKo7cfSKDsU6/hEDfQmNjWfmI0Z7gQztgImnWn8LcdydG3FkTbsyqu47RZFp+V+QNwTSx0PvDXehYBmWGNdP114Sg=;
	5:tDfHywHDZ+0+c8yvNovKI+6hKzeMWdBJucngmYziNq/oJybfxAOrp7Hs8RMhovIQ3oUQAMLH0MaauKAjri7BqXlCyVogqWwnp3NhTvaho7OvFbomPAC/JSvkiVEXbV7s2o8Ypap6L9cEe0OhOTQJiw==;
	24:5xV9WLgd/hdI7X3fXWpbq18lA+nNxqZDLROHc8zM1sc7bvtc9Xstv93NHgCA7OR5QEAn4hzjG3/1ek5tpqYghZYFox3DGXJXM5V31vLtQbY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB2006;
	7:wRC0AQt6leqslk9+b1a9cghwECB1mmokCR+w9+m21PcAr1a3wJK6bp4dVEu2zYq1VEyPDS74GgOjSrwMqw+wvIQ/9myO8YlcztE1F1H/2Kr+V1s/Bm+QIimLbYfpu8vrfxN+0LhfRTGYZwDvmkVpg8I7dW2NuxNx1Szt4nDUaIIA+s4lhiGOXpWMW5T+UgqjIpLNWPVyYhfP/Tydzxh4jDXeCOk4gDwMQDoXDJ2kwNKeqw8OfrL33hgHIOBeyKOtpAIL4tSVvHuMwUwXuP3yvhQL69Aey2uorhVbJSI1kknr9xGz1fMQmePfgzKWWwSmIksklwrwZMKdZD5d8gW/JYYmf5Zlrw0XYWfRIx2A6Ak=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2016 23:20:35.6191 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB2006
Subject: [PATCH 2/2] runqemu: Allow the user to specity no kernel or rootFS
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
X-List-Received-Date: Wed, 02 Nov 2016 23:53:52 -0000
Content-Type: text/plain

In some cirsumstances the user doesn't want to supply a kernel, rootFS
or DTB to QEMU. This will occur more now that QEMU supports loading
images using a '-device loader' method.

Allow users to specify 'none' for QB_DEFAULT_FSTYPE or QB_DEFAULT_KERNEL
to avoid supplying these options to QEMU.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 scripts/runqemu | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 922ebaf..ac10ee2 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -453,7 +453,7 @@ class BaseConfig(object):
     def check_rootfs(self):
         """Check and set rootfs"""
 
-        if self.fstype == 'nfs':
+        if self.fstype == 'nfs' or self.fstype == "none":
             return
 
         if self.rootfs and not os.path.exists(self.rootfs):
@@ -481,6 +481,10 @@ class BaseConfig(object):
         # QB_DEFAULT_KERNEL is always a full file path
         kernel_name = os.path.basename(self.get('QB_DEFAULT_KERNEL'))
 
+        # The user didn't want a kernel to be loaded
+        if kernel_name == "none":
+            return
+
         deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
         if not self.kernel:
             kernel_match_name = "%s/%s" % (deploy_dir_image, kernel_name)
-- 
2.7.4


