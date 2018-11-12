Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 16333 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 Nov 2018 20:04:24 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr790085.outbound.protection.outlook.com [40.107.79.85])
	by mail.openembedded.org (Postfix) with ESMTP id A82F56C233
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 20:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kqM/sfB+/0YbbvDQrRQPLCmVZRumKnVz6cKS8mbbdDw=;
	b=qXDMHPjnL0qL3BGiSlvMfSmokzqWEzQwul/rO1BmQtSAuw9K0RWequX+LBz3wsFKcDusgabIoRcHCt0EY50KZq5E7Sz4RnJBXX9vhcgJViF71OwZoac6jpVjLEOPokQOhrdohVMXnfLf3a5YnxWApS111Lf2jeKg3mfsU9/3y+c=
Received: from BYAPR02CA0008.namprd02.prod.outlook.com (2603:10b6:a02:ee::21)
	by BL0PR02MB4450.namprd02.prod.outlook.com (2603:10b6:208:45::27)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.28;
	Mon, 12 Nov 2018 15:29:01 +0000
Received: from SN1NAM02FT010.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by BYAPR02CA0008.outlook.office365.com
	(2603:10b6:a02:ee::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.21 via
	Frontend Transport; Mon, 12 Nov 2018 15:29:00 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; windriver.com; dkim=none (message not signed)
	header.d=none;windriver.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT010.mail.protection.outlook.com (10.152.72.86) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.11
	via Frontend Transport; Mon, 12 Nov 2018 15:29:00 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gME95-00007M-MS; Mon, 12 Nov 2018 07:28:59 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gME90-0005Xe-IV; Mon, 12 Nov 2018 07:28:54 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wACFSsjw022773; Mon, 12 Nov 2018 07:28:54 -0800
Received: from [10.23.116.188] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1gME8z-0005Xb-T8; Mon, 12 Nov 2018 07:28:53 -0800
To: "Yu, Mingli" <mingli.yu@windriver.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <1541657297-30997-1-git-send-email-mingli.yu@windriver.com>
	<1541657297-30997-3-git-send-email-mingli.yu@windriver.com>
	<CAJTo0La+u72y4JiB9dGKGw==FR_8Uwu31pO19eJ78bVfnHj08Q@mail.gmail.com>
	<5BE4E504.4010809@windriver.com>
	<CAJTo0LZcL0H=sEdc7n7BRw+u-R3fHNb=2ooJO1hkPsp404PLqg@mail.gmail.com>
	<5BE8E53B.2010405@windriver.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <07f660b1-59dd-5dbf-af25-39475b6cb477@xilinx.com>
Date: Mon, 12 Nov 2018 07:28:55 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <5BE8E53B.2010405@windriver.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39860400002)(376002)(136003)(346002)(2980300002)(438002)(189003)(199004)(2486003)(81156014)(23676004)(106002)(5660300001)(2906002)(64126003)(81166006)(76176011)(8676002)(6246003)(31696002)(229853002)(93886005)(8936002)(58126008)(356004)(4326008)(31686004)(50466002)(63266004)(110136005)(3260700006)(47776003)(336012)(2870700001)(36756003)(316002)(77096007)(478600001)(26005)(126002)(106466001)(67846002)(2616005)(11346002)(65956001)(65806001)(476003)(53546011)(486006)(446003)(305945005)(186003)(65826007)(9786002)(426003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4450; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT010;
	1:zgO5H209wXvns+j5BCCeQCPBpgsDreTprfQs4qTNyjqSIbSPUN/I8gFc+tTfQjeIehtVbXenoLWO4rKVa915pyqU9kVA/8Cj1/tHLH2OIyDb0WNa5koe3Xkfr25Ab++5
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9a14417-146b-443b-9b9b-08d648b391d9
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390040)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BL0PR02MB4450; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4450;
	3:eCzwPHPi/eSS4/8JbVIYONpS0cEFLTxDWnkoGckIL/1VqS/dzpzk3rL3TNO5PnhNMAKqVSfICFQBRfPv7i8ImypFGNRj/B8H3YGKO3ViT7brFSorTswYlA+vNcwiOZkz4e9b6l3x2hZTMRbn3W0qwxodXeVfNTK1G6Lzs847Q+nI2elcvuEmkGWLDfIGFeiG/wMxfoN0qTogHZgWd17d49KvUCCHxV9G6/5fxO7uLxyeUTlFnQTaN+utkOPBm+R1/PPQsw2R0ZERTjoSr8uZ8mOXG1op0HtbqO97ZDfS3ErSs7poKd7H48KOG5v4FOHY6pXFUXsfD3v6Ij9S3yaLUwmU9V/NyCpEuC4iCpuajq8=;
	25:HXrtq7ODX59ojEt/wC13GSg2VeY+/XEYQm2IIGISC0BPOLgmIRiY/FT75O1Cn5wP+kwHFDOBwUlVI6Bosx9NagbnVTBiRNlnDACRRKUTnKBSpeHxZB1kdGSnXaS5M2cLdqjhJ5OoDBPv5AFYiEZFyaq7AImt80ZTsGU6nTdJBvVrId5Yx43bNh28cTrsPUL3oV4AEz8Vpkv9ZQZYaGmlPVTBFCLs+zkRLxO+LBo0CzLBFP4Ayn7vGcgsGmZD17NQbivuDERZm3S3I9yiF9fZV3e6E1ZWzEkVXiep0v2xZFzXL76OJrF3fJ9h1yQ6n5AooWkb32wwbXBnCckmD2cplw==
X-MS-TrafficTypeDiagnostic: BL0PR02MB4450:|BL0PR02MB4450:|BL0PR02MB4450:
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4450;
	31:ZGU7+/0EInrxzOLbnqOiT4rXQ5/b9y6eMbSfOMDApkgRaCmXJJZbRiAySeegjodvGITr9jWhplnZXB3b5L1W7erD7Y2Qoly01H3V+ecpMTpcLYqfcsMeMAVkLS9xkN51yaw76LDZK0ipVDCms+2tXY3PN6G1eHVJ7WGPlMX3K6q11x1nF6BUPhggR5RXymelPQbmZogk5ZQaij2EZPNEXKjcP6/JLKvqugF4/37M2Yc=;
	20:3nK6fvkisqkf/x1U8M3AyZpl68Lqc9gr2hDx1gE8WB1jNTTupNrGN7sYrf1x0zL2xbWtyL/9oO/r4RVdGtDxrugqNzggSMblrLnRmMF8a0djRC8jbG9CHI8HR1dVQWGKPcTaGWHjrtzGTVbxaYaU8KfmBnNKIJ3f3E8RSg+ECu2+8XB9L4upBuCbaJuB6GoeoOFSesGb9Q9Q90vXsS7v0+TYasrcqx3yVPEW8Sm4qOFIAQFYT5M5IYz0ljZgLr1cqwrvebc53VlgtSHE9vRfpfrGSbxuz2dDqpEw42BfXd5CVZ6wXJdTgEPIldUW284c/GDlwa6ZlMqtD4hIZnzYHBvwLCoe/TTtcBP/bEZ7BvZN8TtnKlrWntoM/l/j2ujNG1S0VoKaosJkUHUpj2pALZc1QcoDS3t3kQWGnVQoesqwbBsDxt1MBP1AXPuKrKzPVrwqUb0F7nTqbwLVqad7idTUdMOgGDLebM3Va0KFWuqMmTug9oZUG9KalvvqRqcj
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL0PR02MB445090C817E57D080F279666ACC10@BL0PR02MB4450.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(3231382)(944501410)(52105112)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:BL0PR02MB4450; BCL:0; PCL:0; RULEID:; SRVR:BL0PR02MB4450; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4450;
	4:WDmDuv+KCYkHolHRSdsqe9VBXTDRohPW1G0XLLYD/nZy/PMi+Ih2seI5Xlvnk0LmpMzULb3nRjQ2ObPO6I7ZgKLsTxToM0HML+mJxMnd442bwHFzzQKc7J4THQOMOhb5X7+NPrOAQgV4Wa9kxq3aHuqsOPlVQ6ikro9flPSp8wgHsPhXYAOKJIvKFUrKDB2YXrNhSysd/3d2bgMikIv98rtMf0O/oq8skCe05nlHF/Tt2qDBad3NpZ4MFkAYG45SmxJ+513Da7KcDKAozrOb0A==
X-Forefront-PRVS: 0854128AF0
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTDBQUjAyTUI0NDUwOzIzOkszTE05N1VSbUNBS3FLNFBDSlc1SWtoZXVQ?=
	=?utf-8?B?cW1xT2xmMTlXcXdTN21YZUxDY21BaDgyT20xUUNNbVkwWTRXdmF1ZnM1OTZJ?=
	=?utf-8?B?UWdiTlFWVGs4dDN0QjhJQ2FNK1dNaXJUenM0MkpMQlVVcExnSTBZV1JwdERy?=
	=?utf-8?B?Mm51QlY3MytiQ3NVd0hnaEF6akswUkNJVmVTeVIxUXRtVCtwS0FNTkx6bWlr?=
	=?utf-8?B?VnA5OXZzOXFadEVFOWpUTDlRZmdPZDM4V3VBNFg2TjRRVC9TUlp6Z2N2SUVn?=
	=?utf-8?B?MW9JVkJ1S0wyaGFuaVBlNktrT2hzWGY1Q0hQNXprVVByVFRWTmlMcjJYcWV1?=
	=?utf-8?B?TnNHNDcwdFRvSXp3RWp4M09HN0JVNGI2NWU4cXZiWExwRTd0aERkSWhOaW93?=
	=?utf-8?B?cG1aMVpYWjNUbnhSZlBhV0kwVnljRndLVWRmZEM2Q2hDWE9Pb2JTamtXZ1pu?=
	=?utf-8?B?M053dU1KY01uRGpVSEdnNVE0R3poOFNoQVpFd3EwVDZmUys5VUdLRGFGalgz?=
	=?utf-8?B?Q2VUTkVZU3ZGaEFKQjQ3RGJLbDBHNUF5RmREMk5OYkhOeml4cUxmMGlGa1c4?=
	=?utf-8?B?d0dzKy9ZZ3hyNHBDeENidGZ4RGM5eUVEL01NZEZDR3FKQW1IcmhGK2Y3dXdm?=
	=?utf-8?B?azA2NE5LOCt0UkkwWGpYNjhVYmhZd3ZldUtPdXNqVEtMeWJ1ZE1YcjF1Vk8z?=
	=?utf-8?B?c2JVSXNZVTFwRVNKVURNd3VybmI3bFJTL1NBdENNVDBBL1M3Z0UvQVlCbkJS?=
	=?utf-8?B?TVNYT2V5WmxpM3JONXh6dHFGVXc5Q3p3OVliamNtdHFIUkZXN3BIUnZlSFdH?=
	=?utf-8?B?VGs2VXhFbjhpRCtkVk0yUjA3Um1xNW9rOTRUTnYySkpScGlQbEN0MjVUQ2pF?=
	=?utf-8?B?QjViSWNQVjIxSXg3Kzh3MHp2WFBVZER2aG9waTNDbDVJZ3AwVVFKeHlrc0Zm?=
	=?utf-8?B?RjhITHpYenRoS1ZXMVc5WmdkcFRXc3luNGl0c3JrZWV0bVZOK1Y3YncyeWhT?=
	=?utf-8?B?aml1aStDVWE2WVo2Q21UVzlaWFFxb21NSDF2Z2lIaGVyL0JzQXRCeTBQbStS?=
	=?utf-8?B?TExOSW4vbm4xVktZNzNCLzR5MWtzSThkUDJSQVdvZ0hTY1VEVHdHcUZKTjVQ?=
	=?utf-8?B?R01ZZkpBdUNVQ0p5RndLTkF3eTBvK2FoSjhPbU5sN1k1WDYwV3B5RG9MelFU?=
	=?utf-8?B?anNicURIUStkRVA4UU5NVzNRamZiVzhZcFJSU1pTcm40NWZyMUl0bzBnVVFu?=
	=?utf-8?B?ckJPSlc5cHJNTDdoYkdRU2dRblpNWDJJbDhGTVpzNmc4OTlhejBvUTJCcnNk?=
	=?utf-8?B?S3piSGtvMG5KWnhONGlBejFUcGZudHdEdlRka0tjcXE2Ujd3TUdyd0NZK3Jp?=
	=?utf-8?B?RUdxYjZTUzgzSFVyUnFTUWsxMUszcktuUldoOHdsc3VHaVhHWnROU0FpYUlp?=
	=?utf-8?B?VThtbm4wUU9OYlZoUU5SZGV4UFJHZjJHVVBiMUIxNVQxbXN4ekhQSVdiSUdF?=
	=?utf-8?B?Ykc2aEZVMEhrODJBallCMG14c25LSlFpSkYrTWpkSFpkc0NlSG53dTlwVU1t?=
	=?utf-8?B?dVFMWUlQdmJZeThlNHFpdjByL1Z3QnBmNG9GOTRGQ3ZOL1VyaVBIajN5eFRn?=
	=?utf-8?B?cjc3R0xLeDIxWXpocm9XbUpETkNWc1RDMUQyVmJTZlU0NDl0UTg3MmN5Wmt2?=
	=?utf-8?Q?s+NBZUiayrXYUmVxozrH+VD0uaxPzDxER3PCion?=
X-Microsoft-Antispam-Message-Info: U1wiGXf8I8qO0Noudl3L9JINe4efhWiG+FkyTJMY/4AP/ygxBfiLqR9hmxvpkTupujCLc7W/UxdsUDtpTRshhvEFOeSMrJ0+wG8s8rBKX8TUZrPfgT1aUNwRn5uy4imghXIa//ZBOjVXsU1tnMHnXh4B7cBvfs34F8UxEVaxzE2sa5qvQ65iuINTiuMAiKckF9z3ORuzxJh2fMUgD6jdFgwFuwhCEha2HrUaw3QXt/3KBp1jKJNRn4E5YqokfT/ZXJmnlwd/5dz+mVLlYRbaHXlC86RNVFFj7CPrXTpYVzHJoirHELLUwxjrsgjdXzUkewzZfrdtuBOBXvC1oHIwHUqMGYn/oZuAc8ucZbVXKPE=
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4450;
	6:ck7onbp+7wEJE594qmB0aE7YLVXmQw101UCTV9pBsXHK2m6YlIWQUUCfLvLbNXHfEzGrN2by6QLjohcPfT3xwXRYlFawFFeO3uQcGTaWvsz0iW9JfDn3DJSsWo+ZszSLecCigyXi8caMnPRVSw02xwBtCMcmxd3BokntqwepqteuryxmgEzU065E4JojyPxPH8ymzdENagOJG1sRUVyMiWwZ2endx5EcPnssh9HCQ6VKVw74RdyFHrp2DQSCCqbpR3kEbPscnVjR4Xowp9ZCUIkWMK2ypRX9MDLZiRwc/At66N5eoSEezGq5E5MKEjjQWYX20+oLKn++irwZvcLPNkf5qCqPPWWEFfie8EBAGGVv1iaz2ZLut6PAkcNKJXZPoATZy0ZSI25p4gFKw9j7iKqpghY+aV4cTsWLGGzDYMr9jAve4fslHfKV2pYEOY7cgkz1VFLb+Eq7YB494Zwy0w==;
	5:RYvsy/xPJnd/DeGAbdHt/xARsV5s31CAIR1/D8fpr5deSCAMOsQ7h26NPh7f1zYEEBX/EIIsbOBLNZQJEr7xmWdEtqFrUy9V9AWBAA2ZfBh5qSTQlpP1YNMoVUGH0OnLSsoLh2/1DujzDIXrH2IhFO4MZ5u5P7Ol6OKEXAZdQok=;
	7:FwpJSuasmpeifin1CHu06ohsVOhmwuFtyOLGtvZOnx2XDes1ofc9UZyKT0lhfze2YimJJl2r7ftQFp4AWDsv3EMe7qFsOUBmuG0GlW+mP/copT2CNwSsUzXkRYeY2AuxxMNiw66TTz5OffMbA+DcGg==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2018 15:29:00.0775 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a14417-146b-443b-9b9b-08d648b391d9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4450
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4450;
	23:g5n2jeqqNtQn5zaQdPfcwfGZ06krTOQ9PZI1KtgBTmtEQ9Nshwj0/qSyXAnTcm46bM2nVKupgx1SGKKUwLHnJTLzwOZ5EtpCXoxoJ1QK62px1OQ4Erv7C7XszeLrhr56Wu1G7x2lbURZa7erqlIBhQ==;
	23:i+7pBwMmYzeC34UIBlxakn5LJjwghGQZXdQDOPliTko064dd8+1BqW8KrkTv+mpX1g/M1WmnMHNfcxhfW00Dm84aoL5d8JLrcXbvbxwR8TuT/hQQrzCMagMQhXKobRmlm/XfjTZGmbnS6yaJqy/AdQ==
X-OriginatorOrg: xilinx.com
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
X-List-Received-Date: Tue, 13 Nov 2018 20:04:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hey Yu,


On 11/11/2018 6:28 PM, Yu, Mingli wrote:
>
>
> On 2018年11月09日 21:02, Burton, Ross wrote:
>> On Fri, 9 Nov 2018 at 01:39, Yu, Mingli <mingli.yu@windriver.com> wrote:
>>>> Why is this here and not in the manifest?
>>>
>>> It's because we can optionally enable or disable tk via PACKAGECONFIG,
>>> if add it to manifest then we need to always enable tk which is also 
>>> the
>>> implement in v1.
>>
>> Are you sure?  As I understand it there won't be any errors if the
>> contents don't exist.  And to be honest if there are, then the
>> manifest tooling should handle that neatly without special-casing.
>
> Hi Ross,
>
> Thanks for your feedback!
>
> I didn't quite understand what you mean. As I know, if we add the the 
> setting in manifest as below:
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


This error is happening because you are trying to add python3-tk on 
RDEPENDS, and that package doesn't exist, when you specify "foo" on the 
"rdepends" section of the manifest it is translated to ${PN}-foo.

So two things:

1. The manifest can have the _tkinter.*.so on the "files section of 
tkinter (please note that this is _tkinter.*.so and not _tkinter*.so, 
the wildcard should be after a "." this is to keep a standard which the 
tooling can handle more easily.

When the PACKAGECONFIG is enabled, the files for tkinter will be picked 
up correctly.

2. You should not manually add "rdepends" to the manifest, the tool 
itself should populate those automatically, this is better because we 
would avoid this kind of errors.

Please add the package to the manifest, populate the "files" and 
"summary" section and then run $ bitbake python3 -c create_manifest to 
populate the rdepends section automatically, also keep in mind that you 
should run this when the PACKAGECONFIG is enabled for the native package 
as well (thats how it will pick up the dependencies).


Cheers,

Alejandro


> ],
>          "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/tkinter"
> +            "${libdir}/python${PYTHON_MAJMIN}/tkinter",
> + "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter*.so"
>          ],
>          "cached": []
>      },
>
> There comes below error:
> ERROR: Nothing RPROVIDES 'python3-tk' (but 
> /mybuild/layers/oe-core/meta/recipes-devtools/python/python3_3.5.6.bb 
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'python3-tk' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-tk']
> ERROR: Required build target 'python3' has no buildable providers.
> Missing or unbuildable dependency chain was: ['python3', 'python3-tk']
>
> That's to say, we still need to add some fix in 
> meta/recipes-devtools/python/python3_3.5.6.bb. If so, it may be 
> flexible and clear to directly to make the implement just as what I 
> send in the RR.
>
> Thanks,
>
>>
>> Ross
>>

