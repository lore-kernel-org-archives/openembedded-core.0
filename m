Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 1016 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 22 Nov 2016 21:20:46 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0046.outbound.protection.outlook.com
	[104.47.37.46])
	by mail.openembedded.org (Postfix) with ESMTP id E39986FFCE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 21:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=BK8VyRfB27DP8CFPezQHwmHLSabSgQbzsC0vpXNXeNs=;
	b=T72BLzWZZyqrR5fIPf6PoWuOdjvW8bf7hx3SE8FbKq3Zw+TgCK9V19w9Q75X4of3cKL0Fj0y7XbRSARFSsZ67wwaiUf4G15sbjhvlvrhdBmjr59d/9U7/667FGy4mTnRzVtqI91b0/IMkIzPgzcYTUpsLiMpAAD2InABHF+DZHw=
Received: from MWHPR02CA0011.namprd02.prod.outlook.com (10.168.209.149) by
	DM5PR02MB2874.namprd02.prod.outlook.com (10.175.86.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.734.8; Tue, 22 Nov 2016 21:05:19 +0000
Received: from SN1NAM02FT011.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by MWHPR02CA0011.outlook.office365.com
	(2603:10b6:300:4b::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.747.10 via
	Frontend Transport; Tue, 22 Nov 2016 21:05:19 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nathanrossi.com;
	dkim=none (message not signed)
	header.d=none;nathanrossi.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT011.mail.protection.outlook.com (10.152.72.82) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.734.4
	via Frontend Transport; Tue, 22 Nov 2016 21:05:19 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1489; Count:15
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:34110
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1c9IFi-00068I-Cg; Tue, 22 Nov 2016 13:05:18 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1c9IFi-00008P-9K; Tue, 22 Nov 2016 13:05:18 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	uAML58X7003068; Tue, 22 Nov 2016 13:05:08 -0800
Received: from [172.19.74.183] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1c9IFY-0008Ud-9Q; Tue, 22 Nov 2016 13:05:08 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Nov 2016 13:01:41 -0800
Message-ID: <1479848501-5451-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22714.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-IncomingHeaderCount: 15
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(377424004)(189002)(199003)(54534003)(106466001)(2351001)(7846002)(63266004)(47776003)(33646002)(4326007)(50986999)(2906002)(356003)(36756003)(305945005)(8676002)(110136003)(50226002)(48376002)(5660300001)(626004)(6666003)(8936002)(6916009)(50466002)(77096005)(5003940100001)(81156014)(189998001)(38730400001)(81166006)(92566002)(36386004)(9786002)(107986001)(5001870100001)(19627235001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB2874; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT011;
	1:yaT4pWZeDc2AEycwqpMAPpPkYKA90YsPjzpW2d1ZYfa1RxWgpjer7/aTfvr+TJQmmN/GbAQgoAXRfaBUHRXotQ41VwJnZOHj5/Y0S9iEJ0pl7mAHQ1UiXY44bIFqH6tFH+Nfhju9AasPFA8lyjaFiESJHTaoSsCgw2jR+j3vTiDvhivap1YqlpOVj7BC1umOFi8sXIFjaBXnA7qd+oZrVlUh69oqxXaO1l/fXVF5ZySI8/5oV/NPOXsek8qelmCYtWfTxsp+mi3nESPJMP2apbSZMLLBl6MKEk5oA6HgM3yO3eQO0xKmkGF7Iy26hmGnWYq1pzOnXMNWU9bqL2/AFstPZ8wDp+3gCf4fMtPV4ICm9v55YNKt1Dr0fjucc6fx5xgZF4Ibrs3kOiqB5844Q0q2KzOjKErJI+4OM/ZRq3eTOSvmuz2umBjKd4lxRWIaQnq0yY4izCIsRNdUFEOGDugGB+EqdWH2w60QvXOsMz3TREbrPHHkgmMRprffCYDdMs143ljhG2QnaD24ry7bnp9LXKqFp06w44cPUkPm1fNfUpqVSMk0VejOtal7ItyAkLKiaND1tOSca1z9yOdSWUZOeNW9i/A2tgZh/RHM1zM=
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2874;
	2:810ltbtXBE7eIIhMTKlFWZIIblb+M9W6yBsPPFxsGYHSMgkAA1hC/pXW2ajuVqtinob1cjzMxyghqKOj3QhuWczCRWQioQXmS+rVZ6+SQhhWkGrxPoewOwkgUvXmamHxVAQPkYVU5fibZr2FlSQ8bQsHujdCM8/9Hb5+Gb9Vbf0=;
	3:o/Vp19ME6mRL9MPoeijlWbjGpUXsiHVB0KC5TmPi++v2hFVTF9eAXMBOLUrH48bGz9k2bjFliR7P4VhrFamBZ3i+3JcO2ySACBo35KaSCG1pAOthW4aZL1Ggg8cgLtwJ5k/XgquABbbBGIDIjGovsD5imQXe9D+JlEehY7CaGlSm9qZ816DsolwSuBJU0LHfNcJ2lXWp7sjTgm1756csDaej+faIV3bakGk38ay/VHkE0nVTmPC/BzDz8ljmVoxtXRbWDYM/Pedc/emq6P1t9Wqnq3DZs1Kh33Tg0hYHWfs=
X-MS-Office365-Filtering-Correlation-Id: 12d7c795-216b-4c1c-f26c-08d4131b4417
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:DM5PR02MB2874; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2874;
	25:jpcF3G48j5RRaRi8EFYRmb3BwUM1JNKc9XLd0w89dsNZFm7rard6TaAZPUwfcrTpzc8YhapKycsPy3ZWKH2ae9qOgMPgemaTRnbMpE40I04wYrhxGtJXxtysDPfodMgkYEyVjjwODiQY6cgfJT8FwsIs3FldDxbgkZfa8b7B3KRehVeEVgvnBBHuvgyt3Ejet91qILhIV8XJ+cQlEgPqd20Sbr4XGnd4WCSRVSyTmCWQtISroGUECVf6G8NVwRfypZAB+tgX1Yyd25fGKaaiqbW1IQa6ombxMJyye0Roi/Q+N2WP9tsx0NDN5u6gjsPeLgq2kylHD+45ij+EfMWw6Ujq76u+Y0y97WimIAoUpcJVb4vJFrxu3M5uXcfofcMD5aEl+OG+/Lid4J0YSVYzPOt8yspWuTAG1r4N9IGxmtHxRoBJUUmRwpjF/aGewa6P6AlORHp5HpfbyJRWba2PW0no2UIxa1GkaQlA3j31v0+/0PEOQv/Ypexg3Ysd6AnBnly4JB1V1oWcc5J+O2kjjZSedt/HlAACmZ9KuwBs0JYJnw3H6RVbVqk6mCVWKc7Z4GfWFLhv02oq8Olya+cU8grc+TQViQQPeHg+vKa1doiQ0XZjYVSG7+4n0xDljkKaocA0qcKVUIo16iViBFQO98K9zAU85YgIRGpZIEOK27Dk+ZSQrsXw9D0vHi42PgmsagKLJ7aSxNRRCtPZTqlLO9zQAs71gRushdoZm/84IgliwO+cwl1a+o3yLGtJG+PGRd8+/RZ1p+JSKqiDjEHbJkeh/7PblGVfyM27CZJizAK29dwBxGwhZZlGE3+doRGYh1kpkWuXfvpGhsMwG1T1YgbgW0nc/ErQp4m277T3Hzl/Kdt+Uqz+nH+K+iAXsGpunmH94gcgykIRTxKMmWtHtW3v3C7ZqN1PiXjnEzlFg8w=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2874;
	31:UNLP/l/a/ikzTxpVTwur1QZOvbrCR+saCZfKkllnPM47EVij8/VwLvB9Bolx9+gUQK0gvR428kCdyOqmzegmm5EMMNPrnU9J/pk3jT2Kb+NYzjKKg8bsHVrJw+b0C9OjbV/Yo0rJwQNkbVl7EyhLrS6zHsbc0QNX7ZayT73l9Hifyz+XioqouwaiOCwGiMBr3GKKHhl29qG07IRz7aATnW58Qcna6TMaimdeCOJXLUY0YOhpwgoxedJz9sr41qPAlrn82+tXyVuuJL+SjghZNecX0nlEX7mMvMydddxEF5o=;
	20:UDOH38QZC9WNJZE9BnnZ0hiB/4ZFc2YtmSrY+PP9/foMVYF6SBMPaFsNJOMRNj4TEYDVaxiQgmlsIlz8HvjIxSPlKOU+7qRuXMuQR3BXrFAJj0XsjII59EyN367O9iLWgNW8z+gVBlypu4Sz3RZVlw5WN4KiWjEb5wlI5kvo9jAAGZFDgx/L6KaghNK1xaRTq51X8JYybNeeFz1kBK1DvBA7b59JlbdTsjFKq85VHRt0Db5L/IWCR181v5cPY/oxKvJQfGHeBH+IWbCVm4lPA3LE91tHkYc8tIwUw03hbT/LEYWM02QOLoKtPslcC45htaDHJf/447NlNv6GGOWiyKn8SjnofB/elSQt/cFUtgOcFlyZRLnXe0oIT0Hnq0+vZgHVBwg2CizyTsl+QkFCX1EYs2rCTr6+92ESLZQUfONZrhLpJ4gsLSifgpJ26vn87QeSIB5mlmfsedHBn2E4ekhiyl6pcxcoBJXe6b/ED6n3eTDPbxRReFMsv7zVKY6P
X-Microsoft-Antispam-PRVS: <DM5PR02MB2874CF77B8FA7D1335093D07B9B40@DM5PR02MB2874.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6060326)(6040307)(6045199)(601004)(2401047)(13018025)(13024025)(13015025)(13017025)(8121501046)(5005006)(13023025)(10201501046)(3002001)(6055026)(6041248)(6061324);
	SRVR:DM5PR02MB2874; BCL:0; PCL:0; RULEID:; SRVR:DM5PR02MB2874; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2874;
	4:CFv673crkSPJ80ywkzSpg/S9rLJNrrXt9+RPVyUtB2ZuTnxTpbCX7lZKJluu2jj7lzh6FU/WyZloW3WUvaypf+f787Thtb/B+QTfPNTTn7nX5X453HWgvhxplYUcZTHArGrOq6NJ8aSs8rGjfE8WzXEYtFpgdP8NPV8ci6+wI72/GI5yd95VUIofxQy5cYj+Ulrs4cZsYoVJkVbmaBQqz/a3q4zVhag1sESa2iK721h5+RyqmLtGBNKmNIEkCllv3FM616oHICwSOYIMpVddBd83CP9v+fZwYBPSBEF+Q15JvckuBCTZYxqI52Bdfc7tkrB/ZFkmEGAgVWE9I//2/VuYb3r4AEtvvWRFSCa5ba1lwnEMyes1y6dX6/GQ50eXJFSXa+rytEZCkqLQs/e6q4wXcroo7dpCiTRBxAYAAlfdYdHdRfhyFFTcXqjzz5Uo4Xu3Va74qbGnemU5Hck1O0qFPb+k/+Scat95Gzfr/zBgr1O2BtM/UpMbpU/rUDDqOzQ/L+JG3UJ9im3jTRs9U4B84tX7ccmJGmCunj/Bgh1sg4CktPGI6QMljmKBZ33xzRzOzkiS+4bYL1U03RwXNRkbIJdUZgC5aPyXAbyOHHpW5mFzzXJMH4PlCC4Eti1l
X-Forefront-PRVS: 0134AD334F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB2874;
	23:C12JEQArEV8AkH9CnpjdwUVycnz2YSrNTfj3oKOc7?=
	=?us-ascii?Q?kvWPG7Ul/1tYQlnFhQaMMk7qnkZP0LceT8m8R4x1qIfwwS0pBM6R23ZMJmWz?=
	=?us-ascii?Q?T89NfunbqKKLVs0/TLMYYnA2uwOaRa8pLUyg9uxU86kJW7aKtazcopvzL5X/?=
	=?us-ascii?Q?bf45FxssXS5aBMGb3SqfP/p42kMaHoMPM35ChKs6M+Guztq7qKk2DHoLj3hd?=
	=?us-ascii?Q?5Jqpm+2d4mnOz4OnBgoJVisaYOxu2dJuPM3C/rIZZkyERpLmySZX1Q2QOwBO?=
	=?us-ascii?Q?PDuNl5/Z7dQemnsR2cx4oYvuT1Dw8U8BcJkuoZ8Dv5w1qAre7zlUXm4oKYVd?=
	=?us-ascii?Q?hsJAxp3YGNDo7xB26TTITDpEpfw6I8za7+rc/7KJksTP9sgU3BlFIYHx7y7f?=
	=?us-ascii?Q?UXBLiy9YDG5N+J7n1d9EuZuqPgoAvCAdVlxM3v9lnuP09Rf/izo5bgl7LED5?=
	=?us-ascii?Q?p1NIghZSDlW33T3q8qHJ9DjVvd/6/Pa/CBWRemxRGy8ghcGHYzLvEo1+ukbg?=
	=?us-ascii?Q?phx3EiZ0Nj6ZDrScpyIHAcFl6PUcy5h/9ZYFK+P2qphoRqlgSfE8V3x08QJH?=
	=?us-ascii?Q?JiP2thnYkgRkDH3Ix8dBo1qA9GLTl7/0JIGZdAuD7IYpmRdRM9TOmC9VuKS+?=
	=?us-ascii?Q?t/SBSWyVaAOkYdsKmTJM0lv8kymzVlCSfA4ZVaTzagIrctzMa8cnWSSxD7tW?=
	=?us-ascii?Q?lwK1eOGSdG2PlFlSnBzKdSRKshqW7rPaZ115GBRHTf30AqpQhmh56IURHZCM?=
	=?us-ascii?Q?0T/NB3BLbUZGr9OtnRKFQeFiFeDmc2mq0rMC7Uieo+w5zjvmFxb9oSjid2l2?=
	=?us-ascii?Q?Kbe7A9fwTEfwGwPHSMGcHhV7Cgd3JkM4xDEDtoDhDLF1vE56sUozLvP4W040?=
	=?us-ascii?Q?KW7+zBK/sCMGsP0kMtToz9axYHJMIRp1kHxn7ULwqABwj28xziqWELzlYwpL?=
	=?us-ascii?Q?9XqzxNg6Pm+Vk2A6Y3oH9TBv6apq19DpTjBuII4+YVhO+UKoryahYXDMJB/b?=
	=?us-ascii?Q?Lf2JXQalUekfQQ1HHV3H7gKO8ogOYz1QIFAuHk8Hknzpg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2874;
	6:A1nKmbr2aAZPsutDRMTIJSJWRv8wHAMsnUbMoZXb1fpCFy7ishOy6vJreGqBePd/EN56z5qJigaaijVBXDTNvyl9Cy5ZS1dfpYkwA4IaMKklNpImn6gOTDIHGWHuSgNbuUrUXFpr7I51wEV/WMl+iEiXiROT7u4dNtoDyLh0U0saAorsnHUHIaD/1yi4xXa9g2aIrcS9GxqjUaUlFwZYpDwy7Hb7ZGvqGn61LbcyfGrD83c5j2+eWd2bgjifzCcakbc/DU7puvwoPxlYSyXd+KMNI4VAYumLJICwpmS46//8jZcWiDsAz6F8Xh/VOy4zCt+NM0l3zM3Vl0Ate9vx7oxxhZwNm5xP0SV4JMwYI1+z/UD8Jm24IvMULiacdoke;
	5:Mqe2rSme5RCt+ByLP9UA66uzJFYJHraW/OruWXmt5HLf8U72qWVWy8ZspGFxgtZYLMq15/x8h4D0mA88X2SZqE9/DGX0fbYQh56pMuJQjLh08j/sBYIm5Bh+3+rJQPD9raGKL8HgIiZ3o/zOd8+sYA==;
	24:Chi4BqTlKxwznQU70vRME2lR7qu9xH4d9hHO9YAvDV4uBKDnTP/c1OSGPN2lMNWLfwnR+Kj5hi6x7joKveVx/2FEl3jfP6ezlAKGYa5QQpI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2874;
	7:JV41LeoB3IOtESqOrjFqclIT1AcTaZ2w4oBF+Cj2l5O0GcJz++8Sqlk2Zfl4ih+lu4bQuiWPelruWL8a7t2qadJRExJwepWK52a0Ht157hrQMPTQrTnkEZOn5T7v3v/YvKyXvLEXe7oarcIy/SM93D3C36yMQ9uzvVKVFf9O73zCvwQnGXVcXW2EkCf5OkOw5R9ngPFRCjhAw1Nk3zoKiKEuu/Zphwvq6in58rwRvKifPSsqqubsQsefoIx8aGPUB8DfeVz12fNBOY2O5Yna5EkTRFAJKynPP1GBlR76HDDtV86N7FtarcZGLOXcgOxv5GdwugKyTRXr7yI+SxNX3g2uyhl68nRnKRiV27jIHr8=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2016 21:05:19.1516 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2874
Subject: [PATCH][Morty] binutils-2.27.inc: Fix alignment frags for aarch64
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
X-List-Received-Date: Tue, 22 Nov 2016 21:20:49 -0000
Content-Type: text/plain

There was bug with alignment frags for aarch64 in binutils. This is
fixed in master of binutils. This patch backports the fix to binutils
2.27 version.

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/binutils/binutils-2.27.inc   |   1 +
 ...eration-of-alignment-frags-in-code-sectio.patch | 139 +++++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc b/meta/recipes-devtools/binutils/binutils-2.27.inc
index fc81721..90518bf 100644
--- a/meta/recipes-devtools/binutils/binutils-2.27.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
@@ -37,6 +37,7 @@ SRC_URI = "\
      file://0015-binutils-mips-gas-pic-relax-linkonce.diff \
      file://0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch \
      file://0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch \
+     file://0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch b/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
new file mode 100644
index 0000000..f8b46be
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
@@ -0,0 +1,139 @@
+From 4a4286465b5d6c28968bc2b29ae08daca7f219a3 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Fri, 18 Nov 2016 11:42:48 -0800
+Subject: [PATCH] Fix the generation of alignment frags in code sections for AArch64.
+
+PR gas/20364
+* config/tc-aarch64.c (s_ltorg): Change the mapping state after
+aligning the frag.
+(aarch64_init): Treat rs_align frags in code sections as
+containing code, not data.
+* testsuite/gas/aarch64/pr20364.s: New test.
+* testsuite/gas/aarch64/pr20364.d: New test driver.
+
+Backporting the patch from binutils mainline
+https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=7ea12e5c3ad54da440c08f32da09534e63e515ca
+
+Upstream-Status: Backport
+
+Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
+---
+ gas/ChangeLog                       | 10 ++++++++++
+ gas/config/tc-aarch64.c             | 10 +++++++---
+ gas/testsuite/gas/aarch64/pr20364.d | 13 +++++++++++++
+ gas/testsuite/gas/aarch64/pr20364.s | 28 ++++++++++++++++++++++++++++
+ 4 files changed, 58 insertions(+), 3 deletions(-)
+ create mode 100644 gas/testsuite/gas/aarch64/pr20364.d
+ create mode 100644 gas/testsuite/gas/aarch64/pr20364.s
+
+diff --git a/gas/ChangeLog b/gas/ChangeLog
+index a39895a..fad06dc 100644
+--- a/gas/ChangeLog
++++ b/gas/ChangeLog
+@@ -1,3 +1,13 @@
++2016-08-05  Nick Clifton  <nickc@redhat.com>
++
++	PR gas/20364
++	* config/tc-aarch64.c (s_ltorg): Change the mapping state after
++	aligning the frag.
++	(aarch64_init): Treat rs_align frags in code sections as
++	containing code, not data.
++	* testsuite/gas/aarch64/pr20364.s: New test.
++	* testsuite/gas/aarch64/pr20364.d: New test driver.
++
+ 2016-08-03  Tristan Gingold  <gingold@adacore.com>
+ 
+ 	* configure: Regenerate.
+diff --git a/gas/config/tc-aarch64.c b/gas/config/tc-aarch64.c
+index ddc40f2..74933cb 100644
+--- a/gas/config/tc-aarch64.c
++++ b/gas/config/tc-aarch64.c
+@@ -1736,13 +1736,13 @@ s_ltorg (int ignored ATTRIBUTE_UNUSED)
+       if (pool == NULL || pool->symbol == NULL || pool->next_free_entry == 0)
+ 	continue;
+ 
+-      mapping_state (MAP_DATA);
+-
+       /* Align pool as you have word accesses.
+          Only make a frag if we have to.  */
+       if (!need_pass_2)
+ 	frag_align (align, 0, 0);
+ 
++      mapping_state (MAP_DATA);
++
+       record_alignment (now_seg, align);
+ 
+       sprintf (sym_name, "$$lit_\002%x", pool->id);
+@@ -6373,11 +6373,15 @@ aarch64_init_frag (fragS * fragP, int max_chars)
+ 
+   switch (fragP->fr_type)
+     {
+-    case rs_align:
+     case rs_align_test:
+     case rs_fill:
+       mapping_state_2 (MAP_DATA, max_chars);
+       break;
++    case rs_align:
++      /* PR 20364: We can get alignment frags in code sections,
++	 so do not just assume that we should use the MAP_DATA state.  */
++      mapping_state_2 (subseg_text_p (now_seg) ? MAP_INSN : MAP_DATA, max_chars);
++      break;
+     case rs_align_code:
+       mapping_state_2 (MAP_INSN, max_chars);
+       break;
+diff --git a/gas/testsuite/gas/aarch64/pr20364.d b/gas/testsuite/gas/aarch64/pr20364.d
+new file mode 100644
+index 0000000..babcff1
+--- /dev/null
++++ b/gas/testsuite/gas/aarch64/pr20364.d
+@@ -0,0 +1,13 @@
++# Check that ".align <size>, <fill>" does not set the mapping state to DATA, causing unnecessary frag generation.
++#name: PR20364 
++#objdump: -d
++
++.*:     file format .*
++
++Disassembly of section \.vectors:
++
++0+000 <.*>:
++   0:	d2800000 	mov	x0, #0x0                   	// #0
++   4:	94000000 	bl	0 <plat_report_exception>
++   8:	17fffffe 	b	0 <bl1_exceptions>
++
+diff --git a/gas/testsuite/gas/aarch64/pr20364.s b/gas/testsuite/gas/aarch64/pr20364.s
+new file mode 100644
+index 0000000..594ad7c
+--- /dev/null
++++ b/gas/testsuite/gas/aarch64/pr20364.s
+@@ -0,0 +1,28 @@
++ .macro vector_base label
++ .section .vectors, "ax"
++ .align 11, 0
++ \label:
++ .endm
++
++ .macro vector_entry label
++ .section .vectors, "ax"
++ .align 7, 0
++ \label:
++ .endm
++
++ .macro check_vector_size since
++   .if (. - \since) > (32 * 4)
++     .error "Vector exceeds 32 instructions"
++   .endif
++ .endm
++
++ .globl bl1_exceptions
++
++vector_base bl1_exceptions
++
++vector_entry SynchronousExceptionSP0
++ mov x0, #0x0
++ bl plat_report_exception
++ b SynchronousExceptionSP0
++ check_vector_size SynchronousExceptionSP0
++
+-- 
+2.7.4
+
-- 
2.7.4


