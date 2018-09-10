Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 2181 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Sep 2018 20:33:15 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0058.outbound.protection.outlook.com [104.47.42.58])
	by mail.openembedded.org (Postfix) with ESMTP id F17657980B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 20:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=j9gHMX7lN6sgtE5uQcZ8AdfDTWdqkEpHfdsbHu1i7GU=;
	b=a83yfLDuXIeMZmYm2hnK1UO4L1CQGF/EwuwQt2zorkKW3ZVqLFiOgw/P01fhK8/OB19WO1s3yTooSMQCDyhw+6jJY3rgvxPp6gyd7IcfR/L5Hoiy3Ln+IOm1iyLcBRwDECjeSdNdTx2WfooB5VG9EClnnRI7YQNb5HseL/D2daw=
Received: from BN6PR02CA0107.namprd02.prod.outlook.com (2603:10b6:405:60::48)
	by CY4PR02MB2678.namprd02.prod.outlook.com (2603:10b6:903:11a::12)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1122.17;
	Mon, 10 Sep 2018 20:17:24 +0000
Received: from BL2NAM02FT054.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::204) by BN6PR02CA0107.outlook.office365.com
	(2603:10b6:405:60::48) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1122.16 via
	Frontend Transport; Mon, 10 Sep 2018 20:17:23 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT054.mail.protection.outlook.com (10.152.77.107) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1122.15
	via Frontend Transport; Mon, 10 Sep 2018 20:17:23 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:35467
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fzScc-0005FM-UP; Mon, 10 Sep 2018 13:17:22 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fzScX-0005Ad-Qa; Mon, 10 Sep 2018 13:17:17 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w8AKHHda023739; Mon, 10 Sep 2018 13:17:17 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fzScX-0005AX-91; Mon, 10 Sep 2018 13:17:17 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20180907145533.31088-1-sno@netbsd.org>
	<10772E09-62BB-4CFC-A99A-F4816FAE87C1@netbsd.org>
	<CANx9H-BfgTfmNs+oGxC-Cm=Tp464=fpZnMb17vbTWsRg2LTZdg@mail.gmail.com>
	<CANNYZj8dyfuOnHxqE7V5n3sz=3XjqPS98E2n=t2uJbPkvczKyw@mail.gmail.com>
	<6FC71ED0-1800-46FD-9A0D-1664CE908975@netbsd.org>
	<CAJTo0LYHhteuX2y0cvW9DWOw1ey31EpWDB1Q8mHHCN2qaxUung@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <27c3c64d-574e-e4b8-f1db-343e4a660724@xilinx.com>
Date: Mon, 10 Sep 2018 13:17:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYHhteuX2y0cvW9DWOw1ey31EpWDB1Q8mHHCN2qaxUung@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(136003)(376002)(396003)(346002)(2980300002)(438002)(189003)(199004)(53546011)(4326008)(2351001)(6916009)(77096007)(26005)(2906002)(10710500007)(305945005)(186003)(106002)(966005)(67846002)(478600001)(106466001)(316002)(47776003)(58126008)(5660300001)(81156014)(15650500001)(65826007)(76176011)(5024004)(65806001)(23676004)(2486003)(230700001)(65956001)(36756003)(14444005)(31686004)(64126003)(486006)(9786002)(31696002)(8936002)(63266004)(6306002)(426003)(50466002)(1720100001)(336012)(81166006)(126002)(446003)(476003)(2616005)(11346002)(6246003)(93886005)(2420400007)(356003)(229853002)(8676002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2678; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT054;
	1:guaCLM9SE6ad9v9vuf/9nAqcF2AIeSaO4RxlyjMBG5kLQNGbk9fOGC5S3LL4LxoZRy7LHouOwrU/ddzMTry86lwDkiugaP9j5a/uTL59MHnIJdrkH6jl7IwI04Z7pfzj
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c064aaa-7fa9-4d64-3510-08d6175a6b93
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:CY4PR02MB2678; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2678;
	3:4A2w9M4b3vgPfJvld4YAVZk+vxs69cgL+01TlW227r9o7LVC43AFPg/KdAi+yIJXB6GJbewmuixcwKZDXpqNoi9QOK4Spy5Nw3Gbmx1bGdfhZ6Mv9KSuWIZggLHVhphSUnBdakKnKZf0L3pxHi4pG+pcwr86WyhKex6YSQxnyeh49XXXO+f3GWATQqp3ILYUFrW46HyeYX3YoopG5by+baCqkaXngHde6hWR6jEWWD210Sl4gmLz6ugOOyIKMlH4cea7PbWHNVTLIVEAXLJmexyiIDm4daqZKoitOSjlm3CwNPYwMbL7fSuFrkCfADgmbS85C4Tz2VW32FpGPy3Q6ZQeIbHKb1XIgsMYP0zEJgc=;
	25:L2QZSRtYbsm7Apr6mtRbO4TC+gZeBm2VMX5HqXg92uG6cX8crbf6Own+61s/CFEObh+RNKpgP53GD0n8qxQC9hC8YptuSmN4ia35g7RLD952KLmJvLUrnCwkCaoE8QWn/qJ2vyvM5IWfJvY6zy1fpHZ3D0SzpXvA3Caf9dtomvdh/RC6qyI3O5PqkEnhLAHqZHxaYdkQWrhSrGPHoYllvl1JCAd7rZEP+/5drOomAIvp4vm/9tWnE2EbZ/JbSgCVqRFfasI2JD0HB9jxxv6IyIpg4fwPUdPCf0coMqtHL1PMnJQe6dGgMYnIgDCZNFA3tUvmSBb9u0v4CPMkciCceA==
X-MS-TrafficTypeDiagnostic: CY4PR02MB2678:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2678;
	31:k7J5KWp1bqk3ow6Nr3C5sfAuSIXoOI/5yeP5O9pNS31ovXHlnlA4APpWau3MAoM4etcAHxAo7AM2jC+wYnQQTd16W0z35VkRYeP8g0sgiDqbRboyZ08SIMANlDGH13Ye0IRRd5NXEU3kz6VTqEH+RWEvV+gEOG2Ma8p7rfCiiSdyzd7BWSeS7gX+DuTdczrjVjcfk+dP82TDWR2dLdSbT9EdlTrXi54DxAtocfQ1sQg=;
	20:GElCuqpmJ4uMBshiVFRWhAGuWptFD06LftMVHvVLQ9mAYAO+xlDI3AFo0NVUvxOGobEBSIV3TwuOqzhooubLscJ5gSvxIZ9RLcW3IB1p4kh0JB6u7mUIsuaTrbjrKmSTMsoxB6gyDROjcqd1oa2KsI1fjGMQaSkZnSbjFuRfhsawTallB6iULN2x3MIei4VSC+ltVwSyLnO2b8UZa8fdZbZWMyN9UvidMpRAs74uMixURmaoWXijH22AtbBhjWIkokX75s6iKsknDmCFdQL+RdIOJ2XhtwTmpsY1VvXB/x/2kQJMKCjryJ9jdswgVXWRfaXq6Kg/kEbQHnb+fqokPLV85rioip9SJWxEi6aXsCiHLUukaVBKHp1X1plk3TCfrYKICiwXqQd+scb3dHScT/bGGodZGOSBLIDnJtQzztR4e56L75xiOZeozs6YiVFg9umvRufwnSJcdKSjgsMqNddrRln3PfXmn5+4HmlQxOZYnUp/3FjkRnQe/OPczHFd
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR02MB26786DA016D65A78F64B00B3AC050@CY4PR02MB2678.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(264703809997249);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231311)(944501410)(52105095)(93006095)(93004095)(10201501046)(3002001)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699050);
	SRVR:CY4PR02MB2678; BCL:0; PCL:0; RULEID:; SRVR:CY4PR02MB2678; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2678;
	4:b6+gB28r6f1B4kSKjKBspx4rF3hpKizFNqJn6HcBfdAbtyYpXcJRm7j6WpYXN6nKXfoSrGExyTTUQq002qpnpiqkJGFNEOwMSIpwJgI2kxbBmnzx/bEBbO/dRpb0MzRvts9K346PElPumw/5lxJ/vXKms6SDpMdsFzAu1NC00eknLGclmWWJjizm/FrV6e7rB+VyXUhGvna/2ggZ2+VufS100889fCXcHPNu+sLz7+kzBcTWKxGl5k9PD7fpFcosSBk5q54h4kDTQMOXTttcCNvOcYd3kMSKlf1NShdK09P8V1xSTnF26NPJTmBJRiXc2LW0MOJQ3aF06BLczUeyxV7QVV0I1LvQqsingzb3POM=
X-Forefront-PRVS: 07915F544A
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAyTUIyNjc4OzIzOndQVFlqWGFySUhtRXd5NnRVNzJlWjhIZmdh?=
	=?utf-8?B?Qy9VaFlvWHQweStyVm9TRnBwcjJZdHBKa09qR1UwWHVZa0hRaWlabnhXYjZ1?=
	=?utf-8?B?MEJlNXpNaXdWSW9yZUVKS0ZrcmMvL3FHOXJpWm9kaldWY2hnMk1uMDhCeEpU?=
	=?utf-8?B?QzhDWVdKSUV3UngxRFVGL0JHMmFxZnhndE82cCtpSVZ1d2o2T1p0dUJwdXky?=
	=?utf-8?B?ZVBxMlV1VFd0T3NuVXM2MVV3ZFRVSmN3a0FlMWNPRk1TM2VzY0NTQ05KNFpJ?=
	=?utf-8?B?b2tYSEdCaHIyRXhlcFg1T1JDQVhYTTNodkltYkxOZW5RdHh5STdzNUJRTUxo?=
	=?utf-8?B?Ly83MElHNDhHMWEvc0FzS25NSDRCbVErQzlIVGVVQzlCRmRZRGNXUnhEUjUw?=
	=?utf-8?B?d0hYUEVRSm9iRW5IRW1BZXBHT21GM3JhTHE0Sk14TWZKVFQ0RDMvTkNzSjFz?=
	=?utf-8?B?QXRqeXF6NXRkOW1zTTFhN3NBZk4zaXFGb0syV3pCNzBXeTZ3NjJPdmJKek9h?=
	=?utf-8?B?alVxeEUySWpUeVJ2OHlrejd2UXpXbGMzcEtrbEtzYkNWazJ2dkxha2JXTWZw?=
	=?utf-8?B?eUZTUFdVRE1UTXpyVldpMUhKdkpRelJOZHFjT0o4VlI0UVFOS0l1aWU1YlJF?=
	=?utf-8?B?VFo1Zmc5dXpFTk1VWXgrSzIxMno1aUY4ZE1qbVkwek9tYlpVOEd1RklPeTdB?=
	=?utf-8?B?dUZ4aUg3akdvTmUvMDFPdjE3VEhWa2NPSGloQUtMMnVnY3MwRUFrd0VJSGYx?=
	=?utf-8?B?dmt4NXE2eW11N1FtdVQzeFhRczQ3T3psaUExcUFpRlpWNFJiMkFGanVoWm1E?=
	=?utf-8?B?WDV0UkVzbFpmV0xSdmdpWUZuSjBOeTFzSkR4VnQySy9WOWVZZ1pYM0p6eU1K?=
	=?utf-8?B?QXZhZm0yUzlGZldBWFdBL09zRXB5eTAxM0F4Rkk0d0xvYUh6bWp0NGNteUVM?=
	=?utf-8?B?TDN1TXVnS3gzODE2MTRubXVZdUJUZ295dU41ellqZCtUVnBveVZ4Mk9Wb0JY?=
	=?utf-8?B?VUNJVlpnYVdQS2tKWnBOUUpBcEJ3L3owdEVrTllXRHRXajhKM1JFMUhvSzdX?=
	=?utf-8?B?VUY0TVN4eUVRcUNjcmlQVlV5RGg4elM5b3QyU3l6NVJlQ28rTzFNaWN1TEV6?=
	=?utf-8?B?bG5VZVZrL2ZMekJNc0pjMFZ6WkJIcjlrZzhMWEpFcGNTUlhtaW92RkpIYm5X?=
	=?utf-8?B?QXVCYm1CQTBxckFYNUFFd2dXWU8xRWRaVTJFYnh4MndYZ0hBYU9jWGRsY05K?=
	=?utf-8?B?Z05qSFhQRG8yWU1ON3Q0S3ZIWENNV1kzYXQ1cFkwOStjRExtbVJEZFpMcExz?=
	=?utf-8?B?cDdOZHg0K0pFUDJtK21tMHFDS3ZvRFkyKzFLSmNvcXFJTFNuM254c2RZa2M1?=
	=?utf-8?B?K25aNnNyVWlGYUVBbzJIbXRRdkRsMlBsMGRHUFV2U2ppUngzK1pQTFg3L2tW?=
	=?utf-8?B?QmV4ZVZuY05mendyejh5SVNXS3VZQTdmSTJjZGVxQ09YQ0dKOWMwVUlpT2pR?=
	=?utf-8?B?N3cwTm1QNU83L245NXFMSXVBL2ozNWFOcDFJeXE0UkN2NXdJRmRxVmJDTmQ5?=
	=?utf-8?B?N040ZjJaM2oxbWU5ZThDTnNNQnpYMjY5NElNMTQ3aS9vUVNNT2l3QmR6ODJu?=
	=?utf-8?B?RTBVMFE4VlJ5MFVtaW9QVVFkNGppSHh0bCtEcW13cGhYUjlSNThaUXQyay9u?=
	=?utf-8?B?SFZnTHFrbzZzeG5zdWNKTUUxaUNhK09BeHhYSExNUlZnb1FHTFpnc3d5WUQ3?=
	=?utf-8?B?NFlNR3RCS1dRS0NOWWgzUTVSWm00RGZQbXlFZDM2VWZmZk80ZEZUUFcrcGR1?=
	=?utf-8?B?aEtwTEQ0M3B0b1JDcGFKVFFhcGdKb2FmU3hhMDg2U2hBZkE5cEJ2R3lLSE9i?=
	=?utf-8?B?alEzMFpsZk1Fa1NTNTA3S2NvVy9TL1pncTJ0TFYxeVNGZFRCY2FEeVBGYm9S?=
	=?utf-8?B?OGd3YWkzdExJclNYajh2TXdHT1B6T0dMT1RQci90a2YxMWQ4NWlwbCtoMWIx?=
	=?utf-8?Q?tw9oZN?=
X-Microsoft-Antispam-Message-Info: BVoWf+f7FAQP1I9+qaUNXcnG1RSwgy+vdszEtrdG1B2zosygf/xSYAcM6/Dp0jMIVVFYrwhFmOh5dxx8kiJ8PZBCoicm+QqOpVvoTub47DscUL6wHkZ7DLi2gCfbAnwn1Nfjk8lcaadsrFHumz8XMMC429WByKI0LW1DFiuPsKtl+mB+IxhAeHOM2gx+GHVfLAf/kreHncg5eLneirS3WO0mVvmSForyRxDcJCQLtojZ/uttr8IwRsHIT+XC4uwHteFdQreN7TT6VWwsZ5P4KOlIrtD+5yf3coO+5k3WKPwvNnA5tuNkPFFeEit5mFmo4NYdcpWjYywFQh5O3rCtiN0xBV73BHhMOgeHi+eEliw=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2678;
	6:wYf3yobsdk7mNyhGvF3MKctApDBDkt5icyhbsanVTHWZLO6gROwDGX1RuDyLy61ZYkqnLZp33meunbgVyLoXhmqbB/xX3rVunMOUmR5qjW/V1BvJoZnVGfB4++G3ooROtQ/0Ch4PuwNT4wiOPrzi1dOpGwwKcLliYcsaekIuzmu+n/3he1Bdf8HZqz5ldYdQWTqsxDmg3IhwJDxnRQXEidF8Wn5ybumZyz7xd4QYuP2/nwyferc3z4U/ZrxhWU9mknCR50gramSC9mNfIIqHmfe6Un0PSJVnHolGvWw9a16d7vLDInSucnSG55Ed91V5aCYBQYA1/vDHIBEQTTBpcggaa3Ofs07ARC3Ox5mfo2TpgLcjwOkC7MspH+ZTEQy3+OO1KfhybBdvpBkm2e7ScDsK6wIxEguFrLshHzqBzysuzwk27xuOEimc6oYF8dVSDGZ7rO3Vxxi5KYETMkM0Ig==;
	5:v/v5B0etcnXF1wCuyC+qYRXxyrxvRfMnUI6G1pe6EdyqdNoxgPYcJaC+D6XiK994bcsdmTnVVz9jaDdNhohr3Wc7x2p3ucXa4lJip1XlI4pyZhwQ2R+oA4Hq2iP2BCbk7aAr5tEFkUrytfso91eSR/gpq+pP5nY2NPEU51k9DrY=;
	7:W5b/t+HA8YJwD8cgKEn36jh2Y7yE2n2egsnCaPTq6B50Pdnl/HV7OGbkxfugYUvdpYf73C0oQAh2qBZ1gSgI/7pKWHqtFa6s8zHk9IiZi6AGbggBv2T3TgBFhXhdiZroVZRFxZBoW1mF2bU92mI/tYjh3ojdHZOrRWSGqPGhttCrtBg3jSlRTVWG2LSreWioDqvs84VXDn4YvKvLjVakMYo/LNxXwRlYEOEctAqCAOozCBf6PTPcTYvhSmRtK7kA
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2018 20:17:23.6152 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c064aaa-7fa9-4d64-3510-08d6175a6b93
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2678
Cc: sno@netbsd.org
Subject: Re: [PATCH v2] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Mon, 10 Sep 2018 20:33:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Jens,

The compilation log for python3-native still shows that it didn't build 
the uuid module


Python build finished successfully!
The necessary bits to build these optional modules were not found:
_uuid

Please look at my previous reply to find how this can be solved (its 
likely a missing DEPENDS).


Also, this patch is missing the new python3 manifest for this release, 
there appears to be a few new modules that we need to decide which 
package they belong to, this is the output of bitbake python3 -c 
create_manifest:


| ERROR:
| The following files are repeated (contained in more than one package),
| this is likely to happen when new files are introduced after an upgrade,
| please check which package should get it,
|  modify the manifest accordingly and re-run the create_manifest task:
| ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_blake2.*.so
| ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so
| ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*.so
| ${libdir}/python${PYTHON_MAJMIN}/contextvars.py
| ${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextvars.*.pyc
| ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so


Cheers,


Alejandro


On 09/10/2018 09:38 AM, Burton, Ross wrote:
> One thing to be aware of is that I've been fixing up Python's PGO
> support and there's a slew of patches in master-next and more just
> posted that this needs to be rebased on top of.  Good news is that my
> patches remove two of the patches we've been carrying!
>
> Ross
>
> On 10 September 2018 at 17:36, Jens Rehsack <sno@netbsd.org> wrote:
>>
>> Am 10.09.2018 um 11:35 schrieb Alexander Kanavin <alex.kanavin@gmail.com>:
>>
>> Large parts of dnf and friends have been rewritten in c++. I have not
>> yet updated and reviewed that, that will happen in the next cycle.
>>
>>
>> If I can prepare something for you - drop me a note.
>> Otherwise - the perl-5.28 update ("." in @INC, regex buffer overflow, ...)
>> is also
>> awaiting some progress (I can keep "myself" busy).
>>
>> There's already enough disruption to deal with (postinsts errors,
>> openssl 1.1, both caused by me :)
>>
>>
>> You know, corner, ash, ... things happen. But there is progress! Great!
>>
>> Good that we got all the way to do_rootfs though with 3.7.
>>
>>
>> Yeah, but than came postinst (coreutils :P) :D
>>
>> Cheers
>>
>> Alex
>>
>> 2018-09-10 0:38 GMT+02:00 Tim Orling <ticotimo@gmail.com>:
>>
>> I did not review the patches closely, but I did try to build
>> core-image-full-cmdline with the tip of poky and these patches applied.
>> Everything was fine until do_rootfs... I've attached the log.
>>
>> Essentially, there are some bits of dnf and so on which are not ready for
>> Python 3.7. We have dnf version 2.7.5, but the latest upstream release is
>> 3.4.0 (with a 3.5.0 just 3 days ago). Not sure yet if that would have
>> helped.
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>> --
>> Jens Rehsack - rehsack@gmail.com
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>


