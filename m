Return-Path: <alejandr@xilinx.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0057.outbound.protection.outlook.com [104.47.40.57])
	by mail.openembedded.org (Postfix) with ESMTP id 6EBF0799D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 16:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Xmb4ho5jar6+5MTJJYBUkRRfunbzKNsrL2456HCFg8g=;
	b=YQIhKkp3wc4zlpAQrmfVH/TVLBATkeCfMBG5OnuIgUWH3EpIlX/HoRPBzMjZ6iw91kdgzmkAdBOVNYJg6RJMt+X7KiE/FwpMaTXEZT09Ux9yJg3sx2YVHrcxviUS5+9LkP9OX+1LmgoB2ackJKng+PiB22JT6f1JIIvNdie0/sw=
Received: from BYAPR02CA0014.namprd02.prod.outlook.com (2603:10b6:a02:ee::27)
	by SN6PR02MB5119.namprd02.prod.outlook.com (2603:10b6:805:68::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1122.18;
	Fri, 14 Sep 2018 16:36:09 +0000
Received: from CY1NAM02FT046.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::202) by BYAPR02CA0014.outlook.office365.com
	(2603:10b6:a02:ee::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1143.15 via
	Frontend Transport; Fri, 14 Sep 2018 16:36:09 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT046.mail.protection.outlook.com (10.152.74.232) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1143.14
	via Frontend Transport; Fri, 14 Sep 2018 16:36:08 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:42768
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g0r4i-00009x-8o; Fri, 14 Sep 2018 09:36:08 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g0r4d-0000qT-40; Fri, 14 Sep 2018 09:36:03 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w8EGZsMU012994; Fri, 14 Sep 2018 09:35:54 -0700
Received: from [10.23.119.150] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1g0r4U-0000lR-Gp; Fri, 14 Sep 2018 09:35:54 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Andrew Geissler
	<geissonator@gmail.com>
References: <1536868179-5111-1-git-send-email-geissonator@gmail.com>
	<CAJTo0Lb8EDKyH16i5JcpyTQuLG1vPZaxes=B3hUM3=zn0_chsw@mail.gmail.com>
	<CAJTo0LZoPhfR4Ahd_CqXeouPfHoH8+zth_3qr6__rd2xCg2Y9A@mail.gmail.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <d8c0d4fe-ae89-5b3d-0305-96820fd22141@xilinx.com>
Date: Fri, 14 Sep 2018 09:35:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZoPhfR4Ahd_CqXeouPfHoH8+zth_3qr6__rd2xCg2Y9A@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(39850400004)(346002)(136003)(396003)(2980300002)(438002)(3190300001)(199004)(189003)(9786002)(67846002)(65826007)(8936002)(65806001)(81166006)(478600001)(36756003)(65956001)(54906003)(6246003)(36386004)(31686004)(63266004)(81156014)(8676002)(486006)(5660300001)(2906002)(31696002)(336012)(2486003)(4326008)(76176011)(39060400002)(3260700006)(50466002)(356003)(229853002)(77096007)(2870700001)(126002)(106466001)(53546011)(23676004)(186003)(316002)(2616005)(47776003)(446003)(26005)(11346002)(476003)(110136005)(426003)(106002)(305945005)(58126008)(64126003)(107886003)(14444005)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB5119; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT046;
	1:z2bFjhoYJLg0yEqpeNe8G9UVIkh4ZzTVz0nOE5UmaIgAIm0NFMfY+LW0I8Sm1CQpdXiyWPeN9hlisda5piQk5G9Ol1FF7IBFCzQYFGuUbewJeStAWCUm7vZvF7z46tpz
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e2f768a-06bc-4a00-37f9-08d61a602cc4
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:SN6PR02MB5119; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5119;
	3:VCGNx5Ya/8h2hUo1B+DnIajV+HXSdfd+pTXnun+IrZ/+oHqJghxazPpfJ7h+k5u6aEj0zyzggeA017Dl5FKax9aY3KTN4m3X0wi/2Z/EfY+tG2Na/WrCid+0MDaMcsmxVoZ1q20LBKeRf5eX8Akl3oVGdBnLnc7hUjYP4frf+1XBgPKzV4hU6ImNCRQTxXIDI1rTU++QhXL2s1NwvL82As6PEcozuTDbvBPCUB3Vmp9itkrgtZ+5L84UrqUHww+LRgjlRscbRrbybeJqZxusNiTGvZh2whOzqhxyp4fxUN4RKWc1aTK/hOzWgTdzRg24JCE9C2gObb1KGtFviWbYZ6qPyPMsrOP1fWZpJZHcJfE=;
	25:OuAuow+ECffMnEF3Qh46rLzXgDLwKVtGxOu9appQNh9DwNmy+uBe7CR2H4VC7tp5IQJLTsoJbgB/U/yYqfffYvUAJJX2yFZWNI3pPO1wSCQSdQ6awY1gIrbLeVZoeSzZmD0qBnjA5s7iZ54U+QAkIrin2oaZcFUD9j/QtaQMk9dq4lPUyCCQEyJ49OFrgfRzAV9snVqqfZG7jw3MRTC3i3kbimWEKCNA9MbYVC+Q+EdRI1eX7UzNM9Fcz/oALX/IbNQKKbUZRYxeaVOmPgriK8+SCd1dKQ5AhymnyclyJeasm1v5JKPX2meitdC2Y4OiwpXY5iUlQjEJEHtB1HUJWA==
X-MS-TrafficTypeDiagnostic: SN6PR02MB5119:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5119;
	31:TjtO18ML0Gdx6F/l6tax6U8qbPemvIA3pyZNa1p5ZJA8QeC0M7qLcgvz6JGMcZQ+cEx0LyDs7kQ9ifd3WK0jMQ/DiPWd3J8mSjqqu42dCX5DeuUqvCartnahJAc23LM2j793g/qdkh+O5O2KjVhBTs+qJbWZMElAqZ9n8KB/CUTqaJimR4kkGC8JySIYJGPiQlWSeFFue196VyMzB5kLI/HWR7S4IQObqoHdc8du1lI=;
	20:v7yxNDkMMf1pTHsXrsJlzQRTIy1G8x5dT9kRf9i2+qhmzYEpgqbnE7jNEpxLysZBDYmXoQl8bhqukhHkhM3u92JNxQle4S28ZYZ3uAh/Dyhy8/omhRD/u2MY2Lt94piE8Pq48nbUFw9yGyGRG6EZWu2OjO1rce/jmoWE+n0E/+WUXy/rktnDtIrOD0QwNhsMzEP/7wr3K8grsJA+y/fsNEPRGJvBrKdMqQFhPh3UpjC0TScZHr11fdfwh3pIWX6nOZLFq8JjDrIz5nyv7Jogm0aljxPsG7kmD3AP4LQlNqC2nb2l2ipiSUGrPYU7/fTfJClKoInpdHeov5Dh2l+Jyj2CkMHT1W38WjXK8WadUXxFN9iTlKhMNX7fr7YuSef8Zg2hgbxaoxBOc7JIqGAyxbeRFmCNiuTUd0tuiJfSETd+NlALmTqUYQVWV0KckuflSch0dFSBXSBbAew0q4yKqWhAGfwAui2zpzcrNrRLlbdZtyQfKouEEplb3y+1y+sP
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB5119CF0C6729876E368919BAAC190@SN6PR02MB5119.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(3231311)(944501410)(52105095)(10201501046)(6055026)(149027)(150027)(6041310)(20161123562045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699050);
	SRVR:SN6PR02MB5119; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB5119; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5119;
	4:bnzvA+WTCjrIHzzKPSBnhbV1OedgKo7/Pwa5oH97Q96aVn0R8NDD3M9t6rSUSiu9ftyFnJwtDviyYHAZjnjbVkzc3/4l0DqaDVwTNj8d7GjuLdkJOr1QDuFBxQEZxHzgumWTDS2cJYCOJ6YGMLl2l4VaLFIkercujfxthDEAb37WtcEfSAP1wkMkfTG1a60S29mT523VQ05qkYLg9qO510xdztn9WGWUAbFQCUBmvW/aMz5OM1jlCFpXkpnlxr32bH3ipLrrW1J8vBa/K36gUOgXm3AFR/7NfvOBqW7/LgbdGzWvWXZRsp1bPCVqC0rz
X-Forefront-PRVS: 07954CC105
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtTTjZQUjAyTUI1MTE5OzIzOkJncXBPN1NoVUxrRGFPd0s5a0x1ekwwRzRX?=
	=?utf-8?B?emQyNHdIWmdDdGNsdjNhRDc2dGw1ZEwxR2NFa2VaWnorR3QwUDA1bjFlSVRm?=
	=?utf-8?B?L3R3MHRYaU5XT2trb1dEY09pQlJaS1loV0xUUGJUUlNCT2Z0WUd1MEVKZTNY?=
	=?utf-8?B?OTQwLzY2Wm8zZ3RNeDBuS0UvRWF4c3lKV2dPb2piZ3BPUG8vMStlcUcrNGpR?=
	=?utf-8?B?cnFjMUxRRElyYXNlZGt4MjQvSVRaQ3YrU3E2UEx1eUNHbE9zbStKM3pZYXpx?=
	=?utf-8?B?K2EreDhwOUZVbmlYRGJUdUtSZmgzc1h4WUlxNnRlQ09LS1RBemxVMkdSaGdx?=
	=?utf-8?B?bVh4bjlvd3BQQ3NzZDFodHBiajR4VE45OVJZRnJIdFVYRzlibG9IKzhGbXR6?=
	=?utf-8?B?TUtJZ09qREVqTUxxKytLL3pzb05CZXNheFlFTnVESEJaT1BtVEpHNU1aR21n?=
	=?utf-8?B?TWhPUDZ3WU13N3hXcTJVRFY2Z1kxS2pJSStwc0ZRRmpsb3I2OGk3S1VBd2JT?=
	=?utf-8?B?L1pFcVhpYnNjOFZ0bmRYQWdKWVVoWlh4K1EzQzU5cmZzdllTY3RmcXRCdmJK?=
	=?utf-8?B?UnJCMUZtRW50Mll4NHZYYWtLZVlHVEZnYzkxaGl4ajV0NldqMm9Odi83YnEv?=
	=?utf-8?B?ZzM1YzdXbWJyVGwwUit1MWVDOVR1dG0rckYzT2xvZUZGOWhidExRVGhQdjdw?=
	=?utf-8?B?cU9BOE4yMis2TVcwSko3RmxMaHJUYU0wV09oVFFTbnNTZmo0dWVvcVdzVXZI?=
	=?utf-8?B?MVNucUl6R3VnajV0ZFV0Yklkc2FQck9sQk95RFZZcGQyTnBJUzQ1VHliWmx6?=
	=?utf-8?B?bUZFc05NSWd0K1JZdFRVOW5od2ZsU2ZGWGpXS0NmaXJ1RVlTY1FYaWNmaEpN?=
	=?utf-8?B?eS9LMVN2K09mUTdkdmdKa1R3d2FlMmljbGdzVEtvNU45alFQMTNYWUJnOHI0?=
	=?utf-8?B?aTM0NENJdFpkSHJYeGZvdEo1QWFHaExCL0MwaUJZVjhjTjVOa1ZPdGZPMzRt?=
	=?utf-8?B?WHRGaEhmMnRQdlI2MkJWU1g5SkhEdXgzOW5hd1loWit5elppWW1wcFpmaVND?=
	=?utf-8?B?RjBvQ2Qrd1dTbDIrK21nUU9NU0JHUWlPL2owV3hobkJCVWNHYkdCb1liQWIy?=
	=?utf-8?B?dUU1TnF1cTNadFVMU081OHpFREpQb1J5SUZnbzk2NTltaTVQZ0VEOVNHSXFK?=
	=?utf-8?B?QURkdjdQSWczOEJvS21QSyt1ZFNBbkd2WDNTVENoZEZ5V1E2bk1ZZ2NUb0xp?=
	=?utf-8?B?UGx3OHRFdFo2WFpaYkdjODd2YWxaTndtdnRheEs0ZFA1NjNQdlpYb1FCOUV1?=
	=?utf-8?B?WHMwN3QwRWQ4WCtUQWJ2ck9lTEErY01NQVdVRFpyWHhLQ1NQNENBR2hTSlI0?=
	=?utf-8?B?ekFhdzA2eWNQK3k5UjVGTTZpQ0M1bE83T2dPbEVwTTc1VjU2cC9YTGxhSVNU?=
	=?utf-8?B?d3FUaFBkV3R6Mk9RUis3UDVGUXhlbng1TGFIV2ZDdjdiWWxRdWt0VzQwRENh?=
	=?utf-8?B?ckNieTRBR2JPWWNiMS9tR1lsbTdkVmtQSUliUmFzbHZZQVNLVU1iSFB4QVdZ?=
	=?utf-8?B?ckthWUhvYnhDSkwyM1hSNWU5anpjLzN3YXlFNlQ3VmxJOWtZRmw2dXA2dElv?=
	=?utf-8?B?TUM1UktGRVZ4YmNwQUpXSmlKNVhERnJtK1BKbVdwT2tBQXhwSzY3aEF6K1Jz?=
	=?utf-8?B?bTVBSER1K0NyczgzcHVuM2o5VHV4VGdwYnNqd0ZDUzB1WDkyQzAzYVhwcVpw?=
	=?utf-8?B?dnM2clp1WUUzbTByNXN0b2JPMTFWMEJxWWlERFJJcEpiVnhpeVlIMWVTc0dI?=
	=?utf-8?B?VVRBaDNEaCtEUUdsQUJmdzIwbHc4aWNXbWxyQlJjdzYyeUQ4QmdaMVdYSW0r?=
	=?utf-8?Q?9ARRfpQMI+2RHehmg3C9licnvkGyWc2W?=
X-Microsoft-Antispam-Message-Info: 0LGZbbEdJW5+ZjGiRWgGy/weeJdNtfyfJTdzjHYYNx81I60gIQTmZq2zdSZCdQVyqXqDM4BeC+8E1Gua+ovhqzoSUdSRUvHcV4VWbfX2JWGBe5Uhdk85SnWEL4tHw3c/SzyvF/TOfN/j6dQIMrkuXDREbXRnGh26xcp7x54quPYDac1hjVNjS6XoSyMJRKaU8Gi35jIpXyfq9hUptosw4Szua24UOSX1NMnPpInIi2j2yY5/Y+jSxlyw/MkQKPQ/g9O0klEypNTDYJ/qTIAbEZRLqVMp5e5fair18e5Z/uqFrVrZ6jdeh026XT+CisCFnbIX8ZbVTkPIqAYw5scAdPFRjWen0AqMGzbQSLy1LgU=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5119;
	6:G6kU2cn0zNB3phA3VWIyRxeqOg3ZVNJ2a2+LiBDXKns3LjrVnVtSmUooU7hijP8FMIcitZMMm4PwvYZTTdfjmLiKUdYU3iXWdhvJu4o6SGrjAMaKsP5PFirnfZ01nduH7GJFvMC1aCmln0cd3/hVXK1/bXie3Tvsyc6jbqoj2gb+aqwxADDx1De1FF4O8L17bF2Dmb75qH6siekeqXTv+GGPYkapwUvifN7zq6EWyN0+dTGMwXCZWTB7wFq9ZC7mw5LRJixhV3vF9aeuoRipxVZcNBWg38anva/MccmcU5WxjjpYm11vpfISHiH8aiZAd5oUBloTC+VsPODNHPFuWYl6LDOH/NELH2lX2XBlhEx7YIxj63mE7rQrmNGU5POcXHM/pWjcmDoRlEBhA9abDfCULzydJCQVdcdbf09U465x/LYRyIO0tbX4x6ub/LU2I43CvMYjutkFsab7l6DNvQ==;
	5:Qr0LbzcGKn+rvBI2PyCKueqhRKBEK0FJ9/DlDRHJjAjZOb18+WURL00b3MWDBytd5GM89FJa3bku4cPqTANXA37ygCBzSXhYrAlWo/hAYW/oOZociV4+PHk6pJpm5AXNBqSp6pgwGf6NHCl4PCjYqO1LpcC0ue8W98H3XUQu1yM=;
	7:c9epA/te9RklIqFboFlHKuWars13y5w/0XrioxcWPUMKxXp5LJBGwnAOqtVOD8ZQUKgYynlKstF3QPurSLBreZVzyJ0hR/sZ3gez9ZoIIOkvyZQ5aHNQWXOvZ0A79dc5KWwpahfeNg5DU94LUbGUcsS/Yy+rzr4E9XOLcDz9Hfpm/8nWyW8kY0++LBhm3+SqldxyPuDPwZEqo1ccAnr58Im8V7tC0d6UJPVOmiFl0mTcOc+bL/Qceu14dVcZmDsv
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2018 16:36:08.7399 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2f768a-06bc-4a00-37f9-08d61a602cc4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5119
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python/python3: Move test files to test package
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
X-List-Received-Date: Fri, 14 Sep 2018 16:36:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hey Ross,


I believe that if we want to go with this approach we would need to add 
these packages as "special_packages" on the manifest script, that way 
the script will simply avoid checking dependencies for them and will 
pass them without modifications, this will also cause these packages to 
appear earlier on the list, it does require some tweaking because 
directories such as lib/python/email shouldnt be on the email package 
itself, so we would need to take out such directories from the packages 
and rerun the script, that will repopulate the email package (ad others) 
correctly  with the files needed instead of the directory, but to be 
quite honest it might be easier to go with the first approach and delete 
such files on do_install()


Cheers,

Alejandro

On 9/13/2018 4:49 PM, Burton, Ross wrote:
> On 14 September 2018 at 00:30, Burton, Ross <ross.burton@intel.com> wrote:
>> I suspect simply adding python3.5/*/test/ will catch the bulk of this
>> now and in the future.
> Gave this a go and annoyingly the manifest generation must sort the
> list because the glob works for everything apart from packages after
> tests alphabetically, so the tkinter and unittest tests don't get
> moved.
>
> I guess we could change the manifest to put the tests package at the
> top of the list, and be sure to respect the order when generating the
> lists.
>
> Ross

