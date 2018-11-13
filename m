Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 61927 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 Nov 2018 08:41:08 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820042.outbound.protection.outlook.com [40.107.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 07AD86BD1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 08:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pOwXhi+hix1ym4lVF4raWA66fOlmaCJf2iDsoXDR2Bk=;
	b=JJ//E6gU1FL5Cpjkp/kO3rSfhol2jAPDOthc0k+ATGDVcMW+QSMs2rziV8s0g/TdspXxIf3XUU4CHVPgy3/Dsokw/rvi8GmR3MFHgn18P0frVpPKnC/K12erokvSTAmXB5dHb1z2rKxShhda0lk0ABn+FBSAyUshYo3mG+/uCm4=
Received: from SN4PR0201CA0027.namprd02.prod.outlook.com
	(2603:10b6:803:2e::13) by BL0PR02MB4322.namprd02.prod.outlook.com
	(2603:10b6:208:40::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.27;
	Tue, 13 Nov 2018 08:25:15 +0000
Received: from SN1NAM02FT028.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by SN4PR0201CA0027.outlook.office365.com
	(2603:10b6:803:2e::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1294.25 via
	Frontend Transport; Tue, 13 Nov 2018 08:25:15 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; windriver.com; dkim=none (message not signed)
	header.d=none;windriver.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT028.mail.protection.outlook.com (10.152.72.105) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Tue, 13 Nov 2018 08:25:14 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gMU0Y-0006DC-AN; Tue, 13 Nov 2018 00:25:14 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gMU0T-0003EJ-6U; Tue, 13 Nov 2018 00:25:09 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAD8P5xb001763; Tue, 13 Nov 2018 00:25:05 -0800
Received: from [10.23.119.67] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1gMU0P-00039w-2q; Tue, 13 Nov 2018 00:25:05 -0800
To: "Yu, Mingli" <mingli.yu@windriver.com>, Alejandro Hernandez
	<alejandro.enedino.hernandez-samaniego@xilinx.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <1541657297-30997-1-git-send-email-mingli.yu@windriver.com>
	<1541657297-30997-3-git-send-email-mingli.yu@windriver.com>
	<CAJTo0La+u72y4JiB9dGKGw==FR_8Uwu31pO19eJ78bVfnHj08Q@mail.gmail.com>
	<5BE4E504.4010809@windriver.com>
	<CAJTo0LZcL0H=sEdc7n7BRw+u-R3fHNb=2ooJO1hkPsp404PLqg@mail.gmail.com>
	<5BE8E53B.2010405@windriver.com>
	<07f660b1-59dd-5dbf-af25-39475b6cb477@xilinx.com>
	<5BEA3F06.3060705@windriver.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <8a3f9482-3402-886f-3fa3-dee69114d878@xilinx.com>
Date: Tue, 13 Nov 2018 00:25:23 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <5BEA3F06.3060705@windriver.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39860400002)(136003)(376002)(346002)(2980300002)(438002)(52314003)(189003)(199004)(47776003)(5660300001)(2870700001)(14444005)(305945005)(77096007)(8676002)(110136005)(186003)(64126003)(65826007)(356004)(63266004)(9786002)(31686004)(6666004)(58126008)(26005)(31696002)(8936002)(316002)(81156014)(4326008)(229853002)(36756003)(3260700006)(81166006)(65806001)(65956001)(106002)(106466001)(336012)(50466002)(426003)(11346002)(476003)(126002)(2616005)(446003)(67846002)(486006)(478600001)(93886005)(2906002)(23676004)(53546011)(2486003)(36386004)(6246003)(76176011)(567084001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4322; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT028;
	1:eJtSTgkmrWwA5nqJ1rGiIHlJnA8DZxqkN6ndiUJnfL2XKVQ845e8t1F4TBX8cxWiPW3haz9zULOtyY97cYqL4EyHDNDahOUAYg98i6BAn7qFuTdaubSJBPObwDo/JcEc
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5683dc6-80be-4849-0b7c-08d649418994
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390060)(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:BL0PR02MB4322; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4322;
	3:3/KUrlx+M1P4TCKVm8YY/Ha/anfb/TmsroAgcMJlzEPtYMUUoOR3mcCkmnmdE1pOKv64Zsnd79TyCLFQkX/YBk+6AfS9SHLarekNv+mYRncvZNsMP80FtTrrgOokpll0Z0aP2i6SAq46KavmZ0s+m93ELmy7Tn5VGvHlikZp449U3VIO8mRqDaj+gn4QOXrgfPkY32p8YcjhWQyDy/kA5lccr7oSlqAPa0iJQHp9B+6LS6XhUW6FqlWvw2pTtnhxqfHF0q3Fvu0Kiz9neWPCWiP3mAn1gN1C9HmsTWKG+KeHzmAebraDoOyjk7KyNuSu2Oq/E7KyFd9NifLrfDqd9/DvM5QzzOtC3M3EiYfILxM=;
	25:I8NmusgB0BOcCKIFJqa98iw0IUfT8bnGoWKvoi/iw+PDYw8FKLqMewqHBpjmaT8M2ry1bRyi+UXl0xEE0cN0iWeqthlFUoMZ5WZaJFaKLi4TjovFnh5sASwZ3VwHzQa7U54n0os9yECz23igxvZvNrLmEinBG/ZurGgnewRQ0ZLRKZYls1+H/UurntlsyqDDjRiDR4Zx458QMFC7M+KEbKYH1DgBazIZDSJ6SGXph7VoBOPaeBEGk9hDFobtIcOv6hQ3UToVxSluBTtgsJaEdsa90kPUNFHXZ24/QOG97yZ/pOg1F43R7Nq37Zjo9XtYEJyxWOoWnuCpNZ39WqhPEw==
X-MS-TrafficTypeDiagnostic: BL0PR02MB4322:
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4322;
	31:DK4ge13hhVuixKwI0x5KN+/5b/mGcdYssYDvBdTRstAB7Pf8DrOoAMQUvQTCc2PsyF8CfNIPAclsRhBMtKnaUi7qf4XMwJBQW959U1QzskEOK78sLCcEXVpkMvK/AMuxt2YpeyJbK7L6lh9Ssad8JtQeRYH/WpdmSXTy2pZr5bLXis6nZTdopbahjK1Smrq1rVDsfUSqUBiaWbKDGtZHvkqhWUqjPZZvw+aMUgR2IGA=;
	20:KNc/+S6hMj4D0tifGC6HC7YzbZbp9eX3ylB2lHiIQ5PA+LLmeeV45tJMYV7N+jWaOe7CXIL2ZR5eV7C7aI8QPHhDZvLlWpTLNhhqGet/LCUAoQcLfBMrxEHLYbYs6HjjczphUVqZ4Ei4pDCrTKE7sGPu45MSWJ95r0TDtuSNS6lhu1djgNeLfYYSM00Hy+0oTKoj7zX68Gq1RGTRDKcb8bbxYhxTIOZYN1xNOTYIcBFioHQl0RVyej5cdB+I7i7o/pk8oC0+ocizbltMfWzicXzSz2UIKyYIwwJHxliCabKMPE8o+lhxiSzoH9KwntqKApCLnqjQo55krQBrm2IwdQHh8sjl6kRIMC5Kj5CJ3OTI88wu8w+4L5nU5zpd8I/jd9jYY9R7UhiKoWUA3XswlGpSruZLmvq2iFeD7k8eaT7t6Q1G1KQ2GibVVZ9U66Hi03Q6a91xxSsgCpb4l8fuSgQ3ftVvTC/5/RPl61d2BTUOT7HlTWh9fZfjNtG5XJ60
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL0PR02MB43225B1D4FF78DB4D28F2B08ACC20@BL0PR02MB4322.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(17755550239193);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231382)(944501410)(52105112)(3002001)(10201501046)(93006095)(93004095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:BL0PR02MB4322; BCL:0; PCL:0; RULEID:; SRVR:BL0PR02MB4322; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4322;
	4:1VbdyAw1Qw83uCuT9MY2uMIsv37YCb172nUB+uw7/1IGoo4ZLM+m7FyE2qsQHnJDnf11sziOx/9SaooHw51hiq7WMb3yTFJZsHetZrsxWRlj6ZxWqxTV1R1F6AKlarKP23/usM3OHXcfI+TVXnWO4/AXVzsqMXrSoHbvU/C1Phdew0+92d4Xc0NTnxCAw8me0ASM7KxdiCLBx856H/gyF9igA77Zr/wm6SG75J7pAClWYEhB5GXutXuEfNgrybG7skSJMw4T22TBoaobAUcja9qRlqXxNCyyIxjJqyeYtUVVFGY426lIakWcmFjv6ShL
X-Forefront-PRVS: 085551F5A8
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTDBQUjAyTUI0MzIyOzIzOjhmM3RtSXRkMXhWemlKc05MTENqZmV4KzBQ?=
	=?utf-8?B?ZkRrcC9WOGU5eEluazlKbUdOZ1MvNlZHOHBFRDdZNkt6VGJTazJoSCs4V0Er?=
	=?utf-8?B?UFQrSWpmcDV2N1pmbnFiVWE1R2tWejZEWEdoU2thV2IyaHJqWFpIOEkzTEJB?=
	=?utf-8?B?R3JzNTNHdlYvWXpRQW4yWUNpeWNHZGlNUloxUXhSNHE3REpuaG41T0pSbFV4?=
	=?utf-8?B?WnhPRGpZUEpDckp2cm5JM1FCbjZjZ1k4TlNBb1diRi9uOXhvd21tSHgxdUxy?=
	=?utf-8?B?M3lhWm5ubUFGbkJsckozU1JNeU41emdqZVorcUFrMVFnTjFrdWUrcE4vMXZ4?=
	=?utf-8?B?NXJ5QW9uTVJDRU0rODF1OEdyTXBOT3ZXWkFTME81QjlLVEpDVHFiWElveVdy?=
	=?utf-8?B?MGRwN09USTNTSWhCZDdnT3I3VmZVMHBHSnB2OUpIeDgzWXFJemhpOWxBUWVt?=
	=?utf-8?B?REQ2MVQ2Q0sxd1hjSUNBV09zSGJjM2Q3Z2s2SEhmNXd1RmdZSm5YTVlRMXpk?=
	=?utf-8?B?UVo5ajZ2RVlZazRIcEkrejNqcmNrREtBbGFPN1VRa2g4SktlREFXem1YVjh6?=
	=?utf-8?B?YllOaWh6YTVoTW1sUEJJdU1OTDdJVytkK01hYnFwK3M1UVd2QkpuSTcwcmdr?=
	=?utf-8?B?K2NHTmVzUFNvTFRmNmYxNWRIMU5mNmdhMHdFMnVWOUcwMS93OFgyM0FMZTdu?=
	=?utf-8?B?YnRlMENmUXNlUkhXT08vYTlpcmZZbkdpNDB3bUR0L0xsMW90SUdpdU92UjRV?=
	=?utf-8?B?aW9uZkpLWE1tYzZQNWgyQi9kV0U4am1Zd1RieGFKaXJoREhhamxOR3ZIY0RT?=
	=?utf-8?B?OFlHMi9rU0FlUzNsVmtZdmQ1TTVqdVFGNFREV0dSZVI1Nkx1KzJLblVDM1ZO?=
	=?utf-8?B?NUtZNTJaV1E3c25sN0s3Z05UZk1uYXNKY0RvYnlVM3BxdXlmSi9qd1IvYnlB?=
	=?utf-8?B?YXBMV2JzaVk4Q1NTNUh3UXFyUy8wbnpNVklBdS96Zmh1RWRiMDduMENxb2U0?=
	=?utf-8?B?Z3dadS91aXIyeDJpMmpyekJENWZhLzg0Y09IM0tPdWNxR3R0ZTRta1liTFdW?=
	=?utf-8?B?KzcyYkNtWlovaCt2bUpPZmxpa3hMWkFqUU5lVzhraTB1aUI1VFNsUGdNSkVk?=
	=?utf-8?B?VGp0UTVDTytveFRvODhmWE91VjVoSURWNUNDOUlxQVFtT24wczNyMTdsaWJK?=
	=?utf-8?B?Y0xYY0s0THNaREorSWVta2JJV0wxZklNTm8yUERLN1I5dVp4S0VJVTNYTUhZ?=
	=?utf-8?B?R0lQaXZjMUtiVUZpMEw1aTNTNWlQRkJCdGdnckM5cXArR0pKTjg1eFk0OEk0?=
	=?utf-8?B?QVNRYWxxVzZ0b3F3SzB6SFEvRnR2Wi9BQUZhUFcwSWxjR2YwSkVxbHNpb25S?=
	=?utf-8?B?b2NZNC9Jek1QWnpWa0NGckdPTmpGemdibXN4RWJXYVFILzMvNDRMamZ5YTZ4?=
	=?utf-8?B?UVluRnJXQmo3MDhPWVpmREI5eDFFL1YzWGNISWsxSW8rR3RCVkNTT1JaekZG?=
	=?utf-8?B?NXgwd3hERU1zK0xPSHp6blBubStUS3gvaklya25MV1dzY3VCSEhyWW9OYURx?=
	=?utf-8?B?bVZqRUl4ZllrRlZFNTJMbmYvM01FbXhCWm16ZDE3RTE5dVlRc2psbWNXZ2Qy?=
	=?utf-8?B?ZVlrL2hKcXI5M01wTk1pQ3llZzNFRitnWWtiMG92U2VhSUt4dHNmZy9Xalpo?=
	=?utf-8?B?a1NOWnZtV0xiM3BvdWVBSVhod3cvY2hkVUtOQmsyR2xDL0JtY0dNdWltYk0x?=
	=?utf-8?B?MEVOV1c5Q0xxS00xY2gzRGlJMlZiL2hjbERnM21RRktzNjZkbEVmcDBQd0ZN?=
	=?utf-8?B?VDB5cmlRRFpmVVNkU0VVTnc4Mm5kUktGU1JhQUd3N1E2UDI2Sy9vV08yR2dv?=
	=?utf-8?Q?lhf7pOnGqhE=3D?=
X-Microsoft-Antispam-Message-Info: UkQxn2QrWEi7WSW8bR8ULAa2fh0iyhQhdbJ6kYBbYo122cbOCLbIec6vhyiPqHkm4Dl7ZnGnmdfchD5ylmInsgwqoxeoSukvKCq3XQqIRB0eVJQ6ybtJquapGkdeC9WpPAJOApSRaQ3VbEJHRJRm+AEFa9CS3YNP5k+VNUtkw3TE7EMEpChcaaabQMTowyB+cQzjALl/zFjrOYxen0VdYNywoCiaO/weKTKTSjZz0+O5hohQQSTGYyUobACtuICJKt3GdMAsioN00KGBIYmzpKu5uXYcPKwGGO0xg5imPx7Th6b9HBwQNOnlJbuwBGV61NqDjEa+99YjkdLHWwcC+aGymbTVQWzP6S2YOoMSiLo=
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4322;
	6:/8QqK3W4PO6kY8iu6CmCzihJHi5RuKF9LlJYYt6t7yRzEm/xBPmDIl5Af6+4qenaIm5yWYibt/tmFgt15ZoCbehSRVN0/YMxxypG2yFVMVUuffLVSyfTiQcwwJgLMhGBmdvXZxM//vR+IZ75DVLFpvPazvE1cq/5YarN4zXbZ5bZdYpx6x3JVhRAt7IrKKuWrrYrLmuvpRoMcWzVB8zo6f5vMvck4BZAb3FBZMrilgp97fst642URyH5A3ECCNiwFch40Duz8y91S3oPsEFyLt2iLGEjrk5FPp08udvAw0RP1l3D+O8T8unxmqq9DUeV0xXnA1QS7j5gcYHCKZCJwxyeiNslmsFue6cBDcQklVyuYRn0TWTQ/sFppv+hn0yUxFAArBDIsuTZAzz4ffZwl9g+c47uau13OFPJWmLhuuaP97mS+vcpTnJrGLTt+FG5PeKDr5lCANBjMR8vBvftqQ==;
	5:r6u0OsqxXidMFhkvgYyvhz2kqcCKQZuMF4RORfCyX0Dgu5HGqxE82V6fe6H2vjSJM3aeWp51muVbVBZzJX/RVYIkZkDIJKJ5/H4vWb5x5p/gYmuCo+X/QXi5pmiT+H4Xj276TlBjNOKKnvI2a3+cKmHhzVwJFIK8BW/kl/ex8t8=;
	7:TGdl40Ri7QL23XTQtRKXR2fYMmsM5xeqWB8nefN/qOhsJ8lXr+Fg1CsRnS1FtcaK/vJPndEwzP1n4z7IAPVKclJBO1qgpOPSuThMQ7O/97StKVruNG6mXguVxa0t70Srha7kyBqPq59BtWjk3NO06Q==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2018 08:25:14.7199 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5683dc6-80be-4849-0b7c-08d649418994
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4322
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] python3: add tk support
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
X-List-Received-Date: Tue, 13 Nov 2018 08:41:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 11/12/2018 7:03 PM, Yu, Mingli wrote:
> Hi Alejandro,
>
> Many thanks for your comments, please check my comments inline.
>
> On 2018年11月12日 23:28, Alejandro Hernandez wrote:
>> Hey Yu,
>>
>>
>> On 11/11/2018 6:28 PM, Yu, Mingli wrote:
>>>
>>>
>>> On 2018年11月09日 21:02, Burton, Ross wrote:
>>>> On Fri, 9 Nov 2018 at 01:39, Yu, Mingli <mingli.yu@windriver.com> 
>>>> wrote:
>>>>>> Why is this here and not in the manifest?
>>>>>
>>>>> It's because we can optionally enable or disable tk via 
>>>>> PACKAGECONFIG,
>>>>> if add it to manifest then we need to always enable tk which is also
>>>>> the
>>>>> implement in v1.
>>>>
>>>> Are you sure?  As I understand it there won't be any errors if the
>>>> contents don't exist.  And to be honest if there are, then the
>>>> manifest tooling should handle that neatly without special-casing.
>>>
>>> Hi Ross,
>>>
>>> Thanks for your feedback!
>>>
>>> I didn't quite understand what you mean. As I know, if we add the the
>>> setting in manifest as below:
>>> diff --git
>>> a/meta/recipes-devtools/python/python3/python3-manifest.json
>>> b/meta/recipes-devtools/python/python3/python3-manifest.json
>>> index f922561..09c9199 100644
>>> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
>>> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
>>> @@ -1056,10 +1056,12 @@
>>>      "tkinter": {
>>>          "summary": "Python Tcl/Tk bindings",
>>>          "rdepends": [
>>> -            "core"
>>> +            "core",
>>> +            "tk"
>>
>>
>> This error is happening because you are trying to add python3-tk on
>> RDEPENDS, and that package doesn't exist, when you specify "foo" on the
>> "rdepends" section of the manifest it is translated to ${PN}-foo.
>
> Yes, that's why I point out that we need to add extra logic in python3 
> recipe to make it rdepends on tk after add the logic as below:
>
> diff --git 
> a/meta/recipes-devtools/python/python3/python3-manifest.json 
> b/meta/recipes-devtools/python/python3/python3-manifest.json
> index f922561..09c9199 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -1056,10 +1056,12 @@
>      "tkinter": {
>          "summary": "Python Tcl/Tk bindings",
>          "rdepends": [
> -            "core"
> +            "core",
> +            "tk"
>          ],
>          "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/tkinter"
> +            "${libdir}/python${PYTHON_MAJMIN}/tkinter",
> + "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter*.so"
>          ],
>          "cached": []
>      },
>
>>
>> So two things:
>>
>> 1. The manifest can have the _tkinter.*.so on the "files section of
>> tkinter (please note that this is _tkinter.*.so and not _tkinter*.so,
>> the wildcard should be after a "." this is to keep a standard which the
>> tooling can handle more easily.
>
> Got it, thanks!
>
>>
>> When the PACKAGECONFIG is enabled, the files for tkinter will be picked
>> up correctly.
>>
>> 2. You should not manually add "rdepends" to the manifest, the tool
>> itself should populate those automatically, this is better because we
>> would avoid this kind of errors.
>>
>> Please add the package to the manifest, populate the "files" and
>> "summary" section and then run $ bitbake python3 -c create_manifest to
>> populate the rdepends section automatically, also keep in mind that you
>> should run this when the PACKAGECONFIG is enabled for the native package
>> as well (thats how it will pick up the dependencies).
>
> No new package needed to add to manifest, we only need to update the 
> items for the existed package tkinter and per your suggestion not 
> manually add "rdepends" to the manifest, so I only add files to 
> manifest as below in manifest file,


My mistake  I thought you were adding a new package.

Anyway, as a matter of fact, all you need to do is to add the same 
PACKAGECONFIG on the python3 native recipe and enable it, once its 
enabled you can run the create_manifest task and it should automatically 
generate you a new manifest with the required files (clarifying that it 
doesnt have to be enabled by default but it has to be enabled on the 
native package when the create_manifest task is run), meaning that you 
don't actually need to add the _tkinter.*.so file manually to the 
manifest, it should be picked up automatically, this is because the 
create_manifest tool assumes that the python3 and python3-native 
packages are exact copies of each other.

Regarding the extra logic, I also agree with Ross, and I don't 
personally like having the extra logic there, either for that package or 
for handling each package that would need a PACKAGECONFIG, I think using

RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 
'tk', '', d)}"

should be enough.


Alejandro


>
> diff --git 
> a/meta/recipes-devtools/python/python3/python3-manifest.json 
> b/meta/recipes-devtools/python/python3/python3-manifest.json
> index f922561..09c9199 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -1056,10 +1056,12 @@
> "tkinter": {
> "summary": "Python Tcl/Tk bindings",
> "rdepends": [
>     "core"
> ],
> "files": [
> - "${libdir}/python${PYTHON_MAJMIN}/tkinter"
> + "${libdir}/python${PYTHON_MAJMIN}/tkinter",
> + "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter*.so"
> ],
> "cached": []
> },
>
> And also the update the python3 recipe,
>
> diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb 
> b/meta/recipes-devtools/python/python3_3.5.6.bb
> index 2a45476..e50e7dc 100644
> --- a/meta/recipes-devtools/python/python3_3.5.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.6.bb
> @@ -78,10 +78,11 @@ export CCSHARED = "-fPIC"
>  # Fix cross compilation of different modules
>  export CROSSPYTHONPATH = 
> "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/:${B}/build/lib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"
>
> -PACKAGECONFIG ??= "readline ${@bb.utils.contains('MACHINE_FEATURES', 
> 'qemu-usermode', 'pgo', '', d)}"
> +PACKAGECONFIG ??= "readline ${@bb.utils.contains('MACHINE_FEATURES', 
> 'qemu-usermode', 'pgo', '', d)} tk"
>  PACKAGECONFIG[readline] = ",,readline"
>  # Use profile guided optimisation by running PyBench inside qemu-user
>  PACKAGECONFIG[pgo] = "--enable-optimizations"
> +PACKAGECONFIG[tk] = ",,tk,tk"
>
> And then I run $ bitbake python3 -c create_manifest, but there is no 
> change in manifest file.
>
> Thanks,
>
>>
>>
>> Cheers,
>>
>> Alejandro
>>
>>
>>> ],
>>>          "files": [
>>> -            "${libdir}/python${PYTHON_MAJMIN}/tkinter"
>>> +            "${libdir}/python${PYTHON_MAJMIN}/tkinter",
>>> + "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter*.so"
>>>          ],
>>>          "cached": []
>>>      },
>>>
>>> There comes below error:
>>> ERROR: Nothing RPROVIDES 'python3-tk' (but
>>> /mybuild/layers/oe-core/meta/recipes-devtools/python/python3_3.5.6.bb
>>> RDEPENDS on or otherwise requires it)
>>> NOTE: Runtime target 'python3-tk' is unbuildable, removing...
>>> Missing or unbuildable dependency chain was: ['python3-tk']
>>> ERROR: Required build target 'python3' has no buildable providers.
>>> Missing or unbuildable dependency chain was: ['python3', 'python3-tk']
>>>
>>> That's to say, we still need to add some fix in
>>> meta/recipes-devtools/python/python3_3.5.6.bb. If so, it may be
>>> flexible and clear to directly to make the implement just as what I
>>> send in the RR.
>>>
>>> Thanks,
>>>
>>>>
>>>> Ross
>>>>
>>

