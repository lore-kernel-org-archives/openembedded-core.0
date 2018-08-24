Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 64723 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 25 Aug 2018 09:16:35 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0048.outbound.protection.outlook.com [104.47.2.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8989D79495
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2018 09:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-TopicProducts-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/nQpiMG39diBk4ejuyjaY5iukXa2a7zXBx2FuQNxAuM=;
	b=kIXDs4GOWGtKXZHJnKzh7FOU36MgEhCGpl0w7OkKdzGdUr/s3P4hpzFFZIzPl1E15dF5/pAX4c8f460JLl7/78djmr+r/22OWUY3HMrF3uGsqsnmpJY8s1Y/e4//JjZGGLWUwDjryK/euOGcnEDAec+gmMf7sjBGhCubeTXCpOk=
Received: from DB6PR0202CA0009.eurprd02.prod.outlook.com (2603:10a6:4:29::19)
	by VI1PR02MB4157.eurprd02.prod.outlook.com (2603:10a6:803:81::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1080.14;
	Fri, 24 Aug 2018 10:43:43 +0000
Received: from HE1EUR01FT005.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e1f::207) by DB6PR0202CA0009.outlook.office365.com
	(2603:10a6:4:29::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1080.16 via
	Frontend Transport; Fri, 24 Aug 2018 10:43:43 +0000
Authentication-Results: spf=pass (sender IP is 52.166.56.231)
	smtp.mailfrom=topicproducts.com; linaro.org;
	dkim=fail (signature did not
	verify) header.d=topicbv.onmicrosoft.com; linaro.org;
	dmarc=none action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
	designates 52.166.56.231 as permitted sender)
	receiver=protection.outlook.com; client-ip=52.166.56.231;
	helo=westeu2-emailsignatures-cloud.codetwo.com;
Received: from westeu2-emailsignatures-cloud.codetwo.com (52.166.56.231) by
	HE1EUR01FT005.mail.protection.outlook.com (10.152.1.229) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.1080.9 via Frontend Transport; Fri, 24 Aug 2018 10:43:41 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (213.199.180.144)
	by westeu2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP
	Server (TLS12) via SMTP; Fri, 24 Aug 2018 10:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-TopicProducts-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=YdVEPiVZVcGn29FWv/S2QD4qxiTsVsHINnJ3qTsd2x4=;
	b=R6sU6mIYdVCEgA+SI/PJ+p/p7EYRmejGXT+xl0cB1wFoqgfrRWLr6z+KVjkX2Pe+gPdVd89ToPgu50HABerAWE7R8RsPTUgAMjxVMFX9lzYq/0Gwv3CWLLYz1T87cDu2lyCeANKjbVxCFO+SWiGt0INAQ6zspUNQ8Eat3+kn+TY=
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=mike.looijmans@topicproducts.com; 
Received: from [192.168.80.121] (37.74.225.130) by
	AM6PR02MB4085.eurprd02.prod.outlook.com (2603:10a6:20b:43::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1059.23; Fri, 24 Aug 2018 10:43:38 +0000
To: Martin Jansa <martin.jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
	<CAD0U-h+BwzZg=gZtvVTneykKZb9k+UwgkR9Lt8jjo7Kvbj60Hw@mail.gmail.com>
	<CAJ86T=WT0G5Q9Q+Z2GQ27hnTfOjgZcUtYzNbs+fvc5mTDwrNew@mail.gmail.com>
	<CA+chaQeR5fARUq_y+SKU+YBg1psK-aV4efXbq7+aY+-FaLRcig@mail.gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <75f6f971-cc25-4828-d17d-aa3d04b259cc@topic.nl>
Date: Fri, 24 Aug 2018 12:43:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQeR5fARUq_y+SKU+YBg1psK-aV4efXbq7+aY+-FaLRcig@mail.gmail.com>
X-Originating-IP: [37.74.225.130]
X-ClientProxiedBy: AM5PR0201CA0019.eurprd02.prod.outlook.com
	(2603:10a6:203:3d::29) To AM6PR02MB4085.eurprd02.prod.outlook.com
	(2603:10a6:20b:43::10)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d34c5e98-6208-456a-95b9-08d609ae75b9
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:AM6PR02MB4085; 
X-Microsoft-Exchange-Diagnostics-untrusted: 1; AM6PR02MB4085;
	3:R/yLT1g+YeoZ7D3ln+PHM86lbnyuIKyDgTCNzz6+aN8CuvKuETOf+seosHLxJnbSisax95l/gQV13K+OBfhAwUD588QnIFiQgerkOaeBQpDTZtSbNTEYQJw0sRR7DCheTqTug7zPvhrZftZ1PekdyTdzlXkGBtT6xKynVWZTbsyq4GAumZ9ErrniT4R1P4N3/R0fqI6pChiecn/I5MC//jqrFlApsOA254gmLZARXp7vc9b2e/4pMZSiKWNTpyC1;
	25:O8Oy3eqCp0l1840nFLFNeZtTcGWtO4EJytKrp7kunP+JZ98UsM4TlHRIqJztZriEAsvKxuvjKkHEUpKus/Ils4m29CdEd738uiYEJiyOAX79k29LS2V4tzfUYrStmGaKdt82w4pqwc7WQdU1y3SFDZuMaajrsk8GsD7C0tIFOkK2CYQiV8eAXoBU2F48hAsSGRc2DKQck3oJ0vCsjFh751CM3u0FGN9XTcJ+TmeSClGIYT4+m6n3iSk9qPDk9DBuqu9sbiNtKUA4SVwZ9GGhUoMQPrRsd0FSVTBOYnmCgol9OyZtB3OB7JJSEBOV3ZPA/ZqQ7xTSn53t0q/D1zlfAQ==;
	31:0MvaD8t9Ky9Abd3fM07Rpf/7DaWc4PfwapBMxAnU3nJCSIAtUAcGZ8zsAZfr5rvK4YFExgxtos36OnGyf3jID1mryv6KR1P6uj26Hq0IfU/jQL5Wnk4XrQPKqfai7C/S32i6HUSSOBcGqol8xFdtLIfIBTCxs+h+DCkmwLUTjwLcAq7gqyaFvCVKmPcyz0L3Lud3lL4a4XbFkjYyKtofU4Q2OsiskuoYWIojgBXF6gs=
X-MS-TrafficTypeDiagnostic: AM6PR02MB4085:|VI1PR02MB4157:|VI1PR02MB4157:
X-Microsoft-Exchange-Diagnostics-untrusted: 1; AM6PR02MB4085;
	20:o9ddcu7WIZgWnBiaUm1GOGDRE9MdMbXM8augywbinruH6RgRfHb6oLCxVFkXXvmAwiRNlT3mBHMISTXQQnZ4tF4mc7q7DhOV936VywOPIEhzx7Z+2V0Sj165Hla1QqJryx6OlsH31Rs1K3LT20BYQPw0vhMo4Ip3ZVai2p+zqXI=;
	4:wo0n0BJ2ns4f68BDYH4D6BrF0CGHA4Wz/hkV7i0UKQuLJSrTUDssGjlwhoHpWeNoTuRD9yv0I2QQClOX7WFfQA/I/dszYObe55ddJCDx1OPVkoPkkXtqMW/rFnRb3MWv2GAR2fEeszzQDW+S8Eo5DYOtG3ZD7QTncugAgUBw4pppnU07QN11dSjiVq8nUqpAVg3EAZMj0zv0tFmPpr040yFViN2ubRVT5v3y27WB2HdzBND8sY+RhfNQRpDVmrIVxtm6vKnFMVS9yOBSy8AGCCvh5oRUbLkT3ePW2xdL863KU2FQH5mlRf5EIOEHgHc+
X-Microsoft-Antispam-PRVS: <VI1PR02MB4157B51FD513D648EE9EE00F96360@VI1PR02MB4157.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158);
	UriScan:(85827821059158); 
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(3002001)(10201501046)(3231311)(944501410)(52105095)(149027)(150027)(6041310)(20161123558120)(20161123560045)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699016);
	SRVR:AM6PR02MB4085; BCL:0; PCL:0; RULEID:; SRVR:AM6PR02MB4085;
	BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(3231311)(944501410)(52105095)(10201501046)(3002001)(149027)(150027)(6041310)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699016);
	SRVR:VI1PR02MB4157; BCL:0; PCL:0; RULEID:; SRVR:VI1PR02MB4157; 
X-Forefront-PRVS: 07749F8C42
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10009020)(6049001)(346002)(376002)(39840400004)(396003)(136003)(366004)(189003)(199004)(2906002)(105586002)(305945005)(6116002)(3846002)(7736002)(2870700001)(68736007)(64126003)(486006)(110136005)(106356001)(58126008)(16576012)(316002)(8936002)(14444005)(65806001)(65956001)(47776003)(66066001)(44832011)(31686004)(52146003)(52116002)(76176011)(2486003)(67846002)(36916002)(23676004)(117156002)(8676002)(81156014)(65826007)(186003)(16526019)(53936002)(97736004)(5660300001)(81166006)(77096007)(26005)(478600001)(25786009)(6246003)(39060400002)(93886005)(4326008)(53546011)(6486002)(42882007)(229853002)(74482002)(476003)(31696002)(386003)(2616005)(11346002)(36756003)(956004)(50466002)(446003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR02MB4085; H:[192.168.80.121];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: topicproducts.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics-untrusted: =?utf-8?B?MTtBTTZQUjAyTUI0MDg1OzIzOjJsek9TTzlsYy9adFZpS09QOEpyUVAwRkpG?=
	=?utf-8?B?Y1Q3d0gvNGhGb2owQmFTaGE2WDZoc3dlaFo5UGFDY3N0ME5Ea1pzMURaMGQz?=
	=?utf-8?B?OHJLTzJuY3FTNzVsc2p4S2s1K0p6Q2VxUXBheThGQ2Q1T1o1RGxtdUZXWkt3?=
	=?utf-8?B?S2dnaEJ2dFgvNG03THNnTURrdDJHQXhSTllOc1d2aG1uVXdpUXg1WWNpdm5N?=
	=?utf-8?B?VFp5T2l5ZmR5aUE5clFRSmVIT0Rya2NNTUZoeVdGR2tGdlQ0UXUzNkZaRE4x?=
	=?utf-8?B?V3k3N2RUYUE3YUsydE81MjNvNW10NkVEMEtRQzdsSmc0Vzh4WTJXUFU0eVVT?=
	=?utf-8?B?VFV4aWNhT0ZaV0dpNGdlekxSSTFxM0MzbW9HM3ZXVEJlR1pIMnduaXZucURC?=
	=?utf-8?B?U2FLVjB5ZGZaaXpiSmthVEszTVE4WllNZms2aWZzOTYwRmZHbzFPZ08vdHlC?=
	=?utf-8?B?US9OeGhiMmtzZExud1NvbDZLc1VCZzRyUG0vTTZUWmxUaSt2a0pPQmZJZ285?=
	=?utf-8?B?a09jNjdId3JZeHd1eEhycmFDMEJmVHVseDFsZFloTDFQRlVudXZCclErRzk1?=
	=?utf-8?B?V0czT3picURMVWxVdVFoWmZJY0Fobm5XRlRzQ1FocWpRRm9raGg0T2luUmRE?=
	=?utf-8?B?TmNYWFJuWERWV2NoRXpVRlR1c2lTSlQzUEhYeWpqOEJXL0dNcUtGY2JSZkpJ?=
	=?utf-8?B?dHhpbGQ3UjBJU3FOU2Y5RkFZdWxROXRLUS9ScTFzSHluOFowU2Q3UUNkbDZr?=
	=?utf-8?B?aXFrdldNRmtZVlk3ODN3U3lPRkhoZllMcDh3R1h1ZGpIM1FQaHVYcGl2TDRT?=
	=?utf-8?B?SmdObFhjb2h5ZTQ5S2cyajhQZVpvdktGSXRFY09lcnBXVGtSQ0hFUWl3c1dG?=
	=?utf-8?B?dGdVVFFoaG9CS0owMitXUzg0K2FVSmZJVDMwd0VXa1BicXdwMTFSZjVnRjhY?=
	=?utf-8?B?aGFpQkdGSi9rUlJXcU10R1J5V21xSU9LMmpJN3ZXcHVFWVhjMG94N0o4dHN6?=
	=?utf-8?B?VVU4a2daWWpvb1BMWUh6QzcvY1I0YWJWUkxrVHNKekdqY0VkMVR0T3JXUTdo?=
	=?utf-8?B?b215b09DTVJiUW9BNzJEaUt2dysvZWdvb3BOT2pITEtqK0RsQzMrZ055QzEz?=
	=?utf-8?B?eDRTS0pWNW82RWIxdTVBYXFPTnFJVU5DQnlKRkZhZXRGb3lNQ2RiZEdGanB2?=
	=?utf-8?B?NEVmeG9mVWlwTUhBR1JCbHIxOFoxbmYwSFR0VG5aejNMcHp5QXNrWTVpNlBC?=
	=?utf-8?B?NDRMQ1hMOVFoMmNBTEJ5bHRwSnRZdUlIdy9idnlZb3NWd3NLd3lsZHlXRWRr?=
	=?utf-8?B?ZXMyQTRLczEzeWdmc2J1NkxVakhTZFNOYzVnV2J4TXVMODQwdDhTZ2d1Tm1t?=
	=?utf-8?B?cUx4aU9pOC9hRlhXUGlENXovOXZIZ25haG85d2xDME5kMGhORWlId1BHaUhw?=
	=?utf-8?B?WmdXNUdHaW8zN1FkMzdTeDZ1d0xubTdBRWUwNWVnSE95MDJQVWMvTGZqb2pI?=
	=?utf-8?B?WjRvR3NXWU5xdWp3dzUwSE5qTTZORzQ2QVlBOWFWcDZtWU9DanhNNzBaemgz?=
	=?utf-8?B?NHNKUCszcHVETjVGTW5tckRsTnFhcGtHQS9tVnIrL1Y0UHpKelNuQUNjNDVr?=
	=?utf-8?B?QVo3enBtaWF4T1RIaHlCTEt4Zk1TVnJWSkZqNXR5S2dybDllRjd0SE5HZDlS?=
	=?utf-8?B?ckFDMzlFWE8vUVNpQ0ZsOXZRd2NNa3o2aDBzMlduampjYXdlcmVjbjQ5dVlN?=
	=?utf-8?B?T3g3cWg0M1B6VVdpQVJoa29LV2RlaXNiY0lPZE11ZGhVSkZFeE1QWE5xeG9D?=
	=?utf-8?B?eWRRQndGUXBJTVBRaUl4bTViaTVxM2RXVGROa3ZjSFlpTTI2VjhPTC90Qlpi?=
	=?utf-8?B?TmowakNuLzgrcFJiMjBLVTFUWnN6UDFqTGJuUk4yV0FrY0NCSmx6cjJJUlN6?=
	=?utf-8?B?R05qczUwV1QwQlJvbUJ4UXoxSDFSbi9uNEFjemRxZFVKQkFJVldhWHVaZ2dz?=
	=?utf-8?B?TzJwWFN3bTdCMnRBMjBMNmVNK3N4YUZuRU9Qbk4rY1ozK0xXdmRNMHkvdTlX?=
	=?utf-8?B?VXVycXAzb0lIK1RWb05tRlZOdXRkL3krYkRKemFiYjQrcVY3bVpsVm5KcE1R?=
	=?utf-8?Q?99mo5D21fUhrH307YuSaO6Q=3D?=
X-Microsoft-Antispam-Message-Info-Original: 4fE5SpcAQPUbIjZ7k1YKkW1hSuJbyEmwmUr2YVONlAmEbIYIAwLw7HspSK+8J1nfM76dO1b7bJmZWN/CoKjUufpRVvjEIN6UJ7Urw8fiij1JifMtDB2zeX7HEs8NAsZfLA7pF8FbMh7O5GqDxwvhgEHRKzW6XitzjbUjRbxj0qopp6wNvbVQAPqSVRY+HZ2hWD378G4kj1F6GLj66GHJPAzWqI4OFE3MSYPSDhNa9Nsk+Oi3szQ22RzXerI/abqmSRdJVgoGB1tN6Px6fwORld/6VQuwpxo/p7j4I2CU8YeIqhL6IcMX7HV1pxpUmuTi2coepGx293HX+MEzf9ZQVZfGCef+wTP4liFFuX2oPDo=
X-Microsoft-Exchange-Diagnostics-untrusted: 1; AM6PR02MB4085;
	6:v/PeGHmvJqTtZJ0SdIoWDJ/ysGrZePcdMZ+9dUgxyzW0DUyqRY4zfcysp5U/kR4SeJTsY5SOWbeNRf9S5i5nF0aTV8te1wrb6xf+I8GVyqmRO6S2IFrADOlG2Zfd3oSL36/YHMUnwj8PtMH/TEHq2njPjB1wL4Qi/4WRV5gJz58W6mrRaD/ICqCckaQsiXCYVcQ6unLxclMbxt6o87q24eKfaze5JkCni789KDQCpJRY6HM4IG/X1QWz3ju3VPx++uTEGaod+lZzBH4go2/uvBzWU3cJoTEwRvG2cPJ6ed6TE5wsiUWAQ+SpTCwy/eh86pNckYaLbrZspaPWDp8ZQNuP8YCCHokQPiyqGTMmim/Y7HCYqNxYCHEog8twWy2n7E2zwCULd7s383AU9QMTRANk7DLj31NeBpSaEy/qRFTeiSfpzURY9HXP5J2pJwKU6sQoVLOvY9ADsy1CJej9Ag==;
	5:JWfutQ7HPrI0fUAaW4tDtT9Lz/qibCzA9uErai9/WRH1iVFMWuYrn4As9O98Xr02RhtUVCzbXZ1jWz37a73ZAfgVp+7S17OCyAEIDq+aoRkgd5IbT/LuMkHvOGqxUnQiKywnPZHyZ3phKvuiJ8DgMydhiprPWGG4xrnTjWxXxV0=;
	7:9KkINv4cQIKtCihry2pyWiJGfhukGvWjlcEPpBBCx5HMhUF3/+EPixiw6EmKl17NQhl7Q/fBfaBujhVJqHh+eBICtWKq+iSHPPeNl30N+6d85CRSBT9s0+14hoAJQBfUv6F6zxsFpqlErb4awvHoyyACRxCBYiQN5EcA/+/8A7Y4OhqDNiAtFIubQew8Wc67HGq92p+kWaFf0NJMhtAWI6et3Q0QNIs11xtnZ7sIpYrJqaiXRd8g7QV983Sp6a+y
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4085
X-CodeTwo-MessageID: 20180824104339.f0ca9c4a-7314-4ac5-a900-f5a9d5cd838b@westeu2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HE1EUR01FT005.eop-EUR01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:52.166.56.231; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39840400004)(396003)(346002)(376002)(136003)(2980300002)(438002)(189003)(199004)(126002)(36916002)(7596002)(67846002)(106466001)(2486003)(4326008)(39060400002)(386003)(7636002)(77096007)(117156002)(31696002)(336012)(7736002)(25786009)(356003)(305945005)(26005)(6246003)(186003)(31686004)(76176011)(74482002)(65826007)(53546011)(16526019)(23676004)(93886005)(42882007)(54906003)(478600001)(8746002)(5660300001)(8936002)(110136005)(3846002)(2906002)(6116002)(47776003)(316002)(16576012)(36756003)(58126008)(50466002)(956004)(66066001)(14444005)(64126003)(44832011)(229853002)(65956001)(476003)(36906005)(8676002)(486006)(446003)(2616005)(6486002)(11346002)(106002)(65806001)(246002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR02MB4157;
	H:westeu2-emailsignatures-cloud.codetwo.com; FPR:; SPF:Pass;
	LANG:en; PTR:westeu2-emailsignatures-cloud.codetwo.com; MX:1;
	A:1; 
X-Microsoft-Exchange-Diagnostics: 1; HE1EUR01FT005;
	1:Vh7Bhy+53xSaLsEUQ5ebsBR9UbwYfx9GWtsQBFCXJU4zJeg4U74PEQ4564SKeKvLCVB7XFKnn2psp9kjRSWGVdFiu5zzIq/2U1WDCUUgM71LmMCD9BTvzVTXY8t1KysB
X-MS-Office365-Filtering-Correlation-Id-Prvs: 33c68965-0704-4430-e42c-08d609ae738b
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(710020)(711020)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR02MB4157; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR02MB4157;
	3:0y1utr9ZqRb/gICTPjmbPqXUbLOkgZHz1bfEE3EDdAlqJDgv74JnnMzXx5dmE6wqxJh7IHKS6Q/9ONL3uiWljo00OOW9zO/XIttlQ0H2o78PJbuDqiVrmEdfKN162k2kjG6hB+zG9CaIBwLZiXWj6jbuVAnWin73r0TBwmdRrtTyB5JYFZhhbkHyH8IoITuewdF/dzUoz4Zw02CRyQ+44h8Fcz/sPKJngJS7jnurziwebZ2/opb3mkq2HE8O8RiO6u9pFk5S2vHkVJi6q2XkY42e6AEPHGmx0QE9JiofKnCJ9c4nVqbbPZDwjsXhQ9EJzLZwqc6QJNu8ptw+833aPhGWR+cWczKGUDdYo8tm7EU=;
	25:7se4cv7MgdQOE6tcby+QhfKzjL6pYI2ftxzup8/Bzw6mZ0mqqv8Rj0RimHQKBiwSqRYDIOxvnXihZBjX7xI/EWRNNZUpLH88oW1XQqM1CVeh4F/Mmn1Ty8MMb//ZtO+0uJ1jLqIm8YjtWmuhG8BqmGkBKHxqxAUxL83889cHX/rQ2Xpo0Ju5R/9yJH24IyOKeqkE0W18FNckLJRzJd/6ijBhly7BCOauMfD5rrUwfyFrWiAw2AziDvBS4/E6Zbi/uCD3dHXgLl0VjQqmkgbqRowFDD6m+FOBn0it2Ju1o9yR0TF7TdWyxKwIiU1YmoUPqrGG5auDLOlMqzUI7op+MA==
X-Microsoft-Exchange-Diagnostics: 1; VI1PR02MB4157;
	31:qfADT1MVQ80j3BmNyy2/QQn3H/bUfIrhgpC8+XMbSrO/Ozw9+4OfKvsIBBn/eJtko2PTcM854oeIwpcj+R5vczzUefXlNptC5U/pMFv7q4d/2+w8Zwi8IAdR3mcqdyuM2LqEBJ+s8bRm1Q8QCF2RN/KoHh7wyEGusX9rsTFIsmS3J4hQf0MdAT7RY/S5H51k37rBnhZpkIQ8kypf0KfFVlAV4aI1nw6LCSyUr/G6b+I=;
	20:ZaGPBKy9arXUJIiLeJgiGaDMjMgzfObmFu6w6uRBvWPmud1Vo5DxftHGKFAMOYL7JomR5R2a827HsQtWcH1aTfXqzyB5s0P/gxC6inWgCVBsWcpE02DlOcNIKPgDwAqbatpLDK/HSZhV6AYeZ5BwNFpVC9g+5HkEqJ4F9kBRf78=;
	4:E/JuOqBKknkPUWfpWl4oC31IJp4WLGxUHUKiRo0kNFGw81lEgcKyH2+MB04VozbtQPvp8XJrVErC0rGDSVtIeW8VjxZJfHwCLPFC9O6ZTV7Ms4YMrKjbAHYALWA/1PHI1Kb0jT6F6P+uV3FrJKGH3eBAPxnfnKfp69bxUvHwphVxhcDLB4Zt1zW12HU6uQoie9zhk92zYpVj/X/kyem/qhiK6XfT4MjEpAMq6PnVW67sDQtroVEl8tLrBeuuIN347WxGoAtlyniduD7QEEgLZvWPLAPGdKW3CUYXzygR0ni6o9bveM+MtZnSsOx8LZj4
X-Forefront-PRVS: 07749F8C42
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjAyTUI0MTU3OzIzOjF4eUNKVHRxWmRDdWREcDAwZWdRbDFTZmZ6?=
	=?utf-8?B?dVhRMTFyTUE0Vzg5Y0RreE9xcTVQclMzOE4wSWpMVWp4Uk12dTdjeVRpZjd2?=
	=?utf-8?B?U093QjAzVVE4c1EzM1pKVVZ6bGVibFlKYVlMZU1RRmR2a3RkdTJUTFJmSU91?=
	=?utf-8?B?T3VUNnRMYVJCQzVJYVc2RStqMGdtaVRuRkxjSmw5azNncm1kT2NHVFBFajdY?=
	=?utf-8?B?SlNXZGE2OVZDV1o5YTRabUZ0elk2Q2ZJZzl6RHFSdDlIaTl6YlNPMy91MFJh?=
	=?utf-8?B?a0NhUGp2RGVSTVp6cXZXQ2hTNnk3NVlUU01Db3czTHVzVHFQRnoxK0doYmFK?=
	=?utf-8?B?bXFtSzdNSGpXYXl4U2tKVDRIS1J3R1ZkU2xKb2EwMk9PSkE2clVvM093ckpB?=
	=?utf-8?B?eHg2SEVMZ0s5VytPR0pONExtTWUwQldTd3RIZnoyMUk4aXRyYlZnVEsrellV?=
	=?utf-8?B?c0NucTNZekNpZ3BnZEc5YWxQL2REaGhmejRZQjYvT2FvUVh0aUp5MGtlZ1lw?=
	=?utf-8?B?dm5YU0YxWDhxSU1NUGY3NmtFS2VDaDBudnhxUnhBTU1oeDNmTmJ6Yis4SDVq?=
	=?utf-8?B?YUtWVjdpODJzeG1ic3ZFcWZqRlIvTklQOEFTUmdNNFpzb0RobDJoR20waTQ2?=
	=?utf-8?B?RkZZcXF1V3RmVDViOG5pUjVzbFQ0dGJUMEFSL1VHdGFuQnZrZ3BPTDMzV2ox?=
	=?utf-8?B?RENpdzdNTFRqVzNXUmJISXc1ZUF5V2d0dnpIY2tNYjlVRnY1SUlIQ3ZWdjAz?=
	=?utf-8?B?dGtQa3NZM2xONFJWc2hYUzdsc2FRMXZpSWwyODE4eDJTNFhMaDZxSE1mOXdT?=
	=?utf-8?B?Q0p4c3B5aUljcEdrOTBJblo2N0NHYmF5NlVmdENaK3Rsa2w1SXd3WHZIQVJN?=
	=?utf-8?B?VFFIUjVBVDNUUHFkdlJjVFRtSWhMdFpBVG9PL044MTl3MFF3RFF4ZDhLcndp?=
	=?utf-8?B?TWs4aWRvUlVERzNtOWh2SHZJSlpsL2kwUFpuNi8zOEJCalN2MVpWUzBUTVN6?=
	=?utf-8?B?emJyN2JNejZxZEJKdzkvS010ZU54OFc3MXVGdU1UVTZhb2dJNTlFc0krWlJ5?=
	=?utf-8?B?dDBwbjRnR1FlS0F3TlM0V1FrNG9FVEVUWGNXOUR4bEhOdXZ0WXpoSlJLT0ZQ?=
	=?utf-8?B?VWpma2dVM0JLZHdabkVrck54UlUrWktLVUxuUnhmSEIvZmd6YXFVTkJacXVD?=
	=?utf-8?B?a3Q2YnQzSnpmWm4xbUhCT1pqWm5IS1NnQkw1TlV6cnhwK3oxS3ArWjV6Y1JU?=
	=?utf-8?B?WWFJUWx5UTA5b1BXQlQrK1l1Mkh1YjdEeU5WdVhDNVRWbENPTFBmT2dNZnJy?=
	=?utf-8?B?Z3BvK0tuMmxHKzUwY042WFhYbDN4ZlJORWgxY2JRYXMwNmZiU0VGMmpPdlIr?=
	=?utf-8?B?cGF4ejdYeVU4eHRtR3dBZEZxdHIxWVhQdUZ3Q08rV1JPYlNxYVprOUZab0x6?=
	=?utf-8?B?bE0rcExsbmpnSVRaSC9BZ3FSRDlObzA3TnlZaXpnVjZkcUZzWWVrQ3EzZXpo?=
	=?utf-8?B?cUtoNFlsUlVta3NOSkJ5c1hpbm1vZFFKN3BtdWIyS21CMlEzZEtqUWwydDlz?=
	=?utf-8?B?bDQvRE1sUzlFZWdzUTVxN0k5clJ3ZGYxOTdFclBKdzF5MXo2NENHWUNrNGti?=
	=?utf-8?B?RlFUV1JiK1RSU3RGOG9nWEhhTk1vSUFad2VvVWhoN2ZaTlZRZDRwQlFVVTNS?=
	=?utf-8?B?R21heDdWbVNQY3JmRTQrdjNpbkpiNWJ4c1NCOWJzMlVMM2NVNGNPWXc1Z1ZG?=
	=?utf-8?B?MktMdmRsMk80eUg1dDJCNnFoTGRZR25PTTluK242OUsxUUJFdlVQK2I5Zjhm?=
	=?utf-8?B?bC9kWGFmMHZFT3NhY1hWRDhVSXREQWoycFBFMFBuZDJ1L1VLdDFCVkxLaG1F?=
	=?utf-8?B?OGNlYVhTNlVBeGJwZ1h4MitQcmtMT0ppMitNNHV5eEE2M2F4VS9yVnlxbjN2?=
	=?utf-8?B?Q253ZE55S09nYndPUW9vbFRVUWpLcVFwSXVvMUtub3BNU1pCdnhPaXBTWHZR?=
	=?utf-8?B?Z2l5T1ZqOW5IWVpHbFFVQ3E2ZHJLTXNyZlh5eEs3NThtdkVFL0xaKzFvRER6?=
	=?utf-8?B?dC9nTGsvbjVwTlhMVDhlNHRQZzI5QWd3My94MDhxM0cwbVFReWlSNWhyZnp4?=
	=?utf-8?B?VXc9PQ==?=
X-Microsoft-Antispam-Message-Info: tQjub1GZYuhfUbTqs5n65aax0IV66cwl7OKhf+25SXo6L0Yr6Ts1n9tAzwVPL2C648CCv5n7f1msdaFpxJnP4dGEj8Q9dycrnZad3kkYg0JOGUntx2/Ap9ORkbWGJHqASLZmFGT8q8hQWarxoDtZ5NxQA6osJ6byHwENvSY0ktpp1NwNGNaxbVjDFUPxs29ABnb89n/AkVZbnBFS1oQHbZ6DOppv3i080Goy7Sf8uCmpihbNsx/7xwtv7MDDStRi5WnRDNkq/4DSOnyke6A8Nj4ae2OWtwEVmjf5fqVFmkx9LbHZzWi9gP3BGI3FHh4yeRzSbT3ienVaPFThRTYn39MhG7cByihz0IvAQhw9M1w=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR02MB4157;
	6:yj8vcgWBxZkEB5Xt/K/n6mikpEo8JUrhNqWDWw+dZOQGBMx1YtzcYVuftt/l8Ruthlwm/kzUKiaJ+GkXqaIfqIYetd9XPDsRahMM0DwQzP5KkO0G0RzkALxbZ22Gxv+F5BlNlRMWn/0ld8E8U2wUNfwwl0FEAHl1al7WMgIRLAq/1wgG0Avg9goiYnFrHata8MX4C5YvudhxlatDT/pTAhKbpD/HvDVu/LMwyu4El5vOCCgZnwssNXtZOyxOybQuy5n5X2jD/qCKsvN8+NyNlKPxlWjEOvKA2kYNPuFHibgsk8m59IUHwzc+xJErAVaC/l5dzJhapJDierkFuUT2LjwBrUprL7UanYboBLIm3RPru/s4w5o74LZvFQznhZC6BwHa7jIkz8Vb/Np3BId8oHBRAr/LcLQN0pcZbqZBD/wj5Ge0MKMbA9KWADul6VZZ34hxTiNvrPZ+H7mX9vQ03g==;
	5:WaQ0zLb//XcAGWBRcBvBDLgXn0VEeJjVc7oSud60awpBz37cW6rnafd+eUw6fOJN41LfzIDCyGzkLW+j1Lh0EXGZZOJP717EPB1o/A/Wwt7oAvwqTRmdxUKVu03OS1bLeg0MgG1AjM3wJR2Cl6PW9ru0q6sdafj5UfDjHbylqsI=;
	7:2UHYvjKaPWNXa6ukG+j1jBl6bZ46Zcbkj8KpDc9Ju56/YJz/OuA9fi6K1U0FTJoUWbKq2YPNDCNq9SVW2QeoKd4+n37dlQFmAcAuJtiUvMCxWwBmrjjld7YzbnjjRZr7fYauED9/+9bCZGWquLxUVg8hxScmprVqyq8lOg/bJbrvYORlH8vh/ci/c0/COjoB5L4GxSw6TJZQ6hOVlOrli+VgDS4gWxvT5YEbiNEdHTAhiLAXOP5agMwG76iu3+hA
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2018 10:43:41.9185 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d34c5e98-6208-456a-95b9-08d609ae75b9
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;
	Ip=[52.166.56.231];
	Helo=[westeu2-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB4157
X-Microsoft-Exchange-Diagnostics: 1; VI1PR02MB4157;
	23:L5RUw7fQ/dd81BBy0W/r8nj1Ft0z6pCJRdwBGdJQkTjxnD2q+zeGMGQOcRfk6l2RUOqr7VQLD1l1BoHbmFoUnF1xIelJ7AWTV+dtszQO1i/LeiiLq6yNt2mMRp/QaKJAbjaQM6JRf1H5Snb6W29o7w==
X-OriginatorOrg: topic.nl
Cc: daiane.angolini@nxp.com, patches@linaro.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 3/3] linux-firmware: MACHINEOVERRIDES for BCM43430 NVRAM
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
X-List-Received-Date: Sat, 25 Aug 2018 09:16:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

I think this should be solved in the driver actually. It probably "knows"=20
which variant is there (or could be taught using devicetree or so).

On 24-08-18 11:04, Martin Jansa wrote:
> One way to keep it allarch would be to package
> ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.AP6212.txt
> ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.MUR1DX.txt
> in 2 separate packages and handle
> ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt
> symlink with update-alternatives
>=20
> most MACHINEs won't install either of these packages and those which need=
 it=20
> will pull the right one (e.g. through=C2=A0MACHINE_EXTRA_RRECOMMENDS).
>=20
> In worst case someone will try to install both packages and based on u-a=
=20
> priority one of them will win (use higher priority for the more common ve=
rsion).
>=20
> Cheers,
>=20
> On Fri, Aug 24, 2018 at 4:53 AM Andre McCurdy <armccurdy@gmail.com=20
> <mailto:armccurdy@gmail.com>> wrote:
>=20
>     On Thu, Aug 23, 2018 at 1:15 AM, Ryan Harkin <ryan.harkin@linaro.org
>     <mailto:ryan.harkin@linaro.org>> wrote:
>      >
>      > So now the ln issue is resolved, I'm not convinced my MACHINEOVERR=
IDES is
>      > the correct approach. Does anyone have any feedback on how I can i=
mprove
>      > that?
>=20
>     If you want to make a configurable symlink then perhaps the more usua=
l
>     approach would be to just use a variable in the linux-firmware recipe
>     to weakly define a default target for the symlink. Machine config
>     files could then either do nothing (ie use the default) or provide
>     their own value. For example, in the linux-firmware recipe:
>=20
>      =C2=A0 BCM43430_NVRAM_SYMLINK ?=3D "brcmfmac43430-sdio.AP6212.txt"
>=20
>      =C2=A0 FILES_${PN}-bcm43430-nvram =3D " \
>      =C2=A0 =C2=A0 ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdi=
o.txt \
>      =C2=A0 =C2=A0 ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdi=
o.AP6212.txt \
>      =C2=A0 =C2=A0 ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdi=
o.MUR1DX.txt \
>      =C2=A0 "
>=20
>      =C2=A0 do_install() {
>      =C2=A0 =C2=A0 ...
>      =C2=A0 =C2=A0 ln -sf ${BCM43430_NVRAM_SYMLINK}
>     ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt
>      =C2=A0 }
>=20
>     And then in the machine config files of machines which need the MUR1D=
X
>     firmware instead of the default, add:
>=20
>      =C2=A0 BCM43430_NVRAM_SYMLINK =3D "brcmfmac43430-sdio.MUR1DX.txt"
>=20
>     However... note that currently the linux-firmware recipe is
>     architecture independent (ie it won't be rebuilt if the target is
>     changed). Adding a machine specific symlink is going to cause problem=
s
>     with that, so the above is still not a full solution.
>=20
>=20
>=20


