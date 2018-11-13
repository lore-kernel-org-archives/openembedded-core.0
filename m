Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 19948 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 Nov 2018 21:38:04 UTC
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr710081.outbound.protection.outlook.com [40.107.71.81])
	by mail.openembedded.org (Postfix) with ESMTP id C15546C176
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 21:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QJ9l1QHHACCN8fbzC/f030ob+2++xwQwJof9AaAcNoI=;
	b=QwSf2Q7ip5buhzk25a7bR1YLJtdLuepLQmkXfqIdSeZCj6D6Y0Tr60kVlCiYEh0NChhlRSeE4ivE/ko8RVz1ner0NFhiCfvAsoR7fbbvg1RjF+mAH0q2KlD/B7ZfFHhgY1pnXXn3kvWmRkUG27v+c6rP4DjR4/Ih12WkVAsdP8c=
Received: from BL0PR02CA0095.namprd02.prod.outlook.com (2603:10b6:208:51::36)
	by BYAPR02MB4455.namprd02.prod.outlook.com (2603:10b6:a03:57::28)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.20;
	Tue, 13 Nov 2018 21:25:29 +0000
Received: from CY1NAM02FT019.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by BL0PR02CA0095.outlook.office365.com
	(2603:10b6:208:51::36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1294.21 via
	Frontend Transport; Tue, 13 Nov 2018 21:25:29 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; windriver.com; dkim=none (message not signed)
	header.d=none;windriver.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT019.mail.protection.outlook.com (10.152.75.177) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Tue, 13 Nov 2018 21:25:28 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:39583
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gMgBc-0003Fn-0a; Tue, 13 Nov 2018 13:25:28 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gMgBW-0006HE-TI; Tue, 13 Nov 2018 13:25:22 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wADLPEF9017939; Tue, 13 Nov 2018 13:25:15 -0800
Received: from [10.23.119.67] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1gMgBO-0006F8-GL; Tue, 13 Nov 2018 13:25:14 -0800
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
	<8a3f9482-3402-886f-3fa3-dee69114d878@xilinx.com>
	<5BEA9506.5000600@windriver.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <b0b7d4db-3e54-10f7-2c9b-d2feed1565a6@xilinx.com>
Date: Tue, 13 Nov 2018 13:26:32 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <5BEA9506.5000600@windriver.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(376002)(346002)(396003)(2980300002)(438002)(52314003)(189003)(199004)(58126008)(8676002)(8936002)(76176011)(36756003)(316002)(4744004)(106002)(110136005)(81166006)(81156014)(229853002)(26005)(50466002)(2906002)(2870700001)(9786002)(77096007)(65826007)(106466001)(63266004)(6666004)(23676004)(67846002)(2486003)(478600001)(356004)(5660300001)(53546011)(486006)(336012)(426003)(476003)(446003)(126002)(2616005)(11346002)(47776003)(31686004)(14444005)(64126003)(186003)(65806001)(65956001)(3260700006)(305945005)(6246003)(36386004)(93886005)(31696002)(4326008)(567084001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4455; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT019;
	1:5ulMoD722ys9nsDNUo2MFVp4Y5ofFRsgH3X/yAtJEuLAxSh9wuTWy88jezo0G44JcexcHR8pLpbzhMobewTRSK9SjNq0zTa1qxYsLeSry0VMVYOkb5w4+rsbMrLe7zAM
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 318e2097-1170-42ac-d613-08d649ae88c5
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390060)(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:BYAPR02MB4455; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4455;
	3:83CB9WmCoQ+hrqSkvCvxdJuwu+UY+yKniSez3tv0aXpte/8gZfpfLaZ/H/gpdFYERp7jDNpB6ZQClov8TW5nAygFG5qnovCM/5aa5hw5gfuXh9FCbjLxp2CUiaRAnH15qPTctCyg0dOsQ0LSCl7RfwMtQa3Q48vOMU4T0K7W3aLa1Xod3ugDXOOqYqfyWv7fsamqacFVtkBfOdHz/56QuosEH6A5ARYWyY7bPMnxjNj2SKpNm7kjwDSFKh6pYJi+fvVVRhePaAz0WUeij5BKmIJeOM7tpm8p2WVhSeK59UgV91fFXY2kh0rFvmf0VVHZJpW4gyOww2ieHNr3Pq7sRcLgDK0Lyf5SvcM7oJPP0i4=;
	25:iDo4Y+QnaF716qRBOEDA2hbNY9CO+9mQrpasx6ucdiIXK23n3/sWna/Qh4wLia+YefmjnJXFiJPk0vjwEszN4u63pEzl9c/tmgrajTeKxn73yfknXMRhLSe0NRjDorKeeEZWQIqniI7unx4+Pn2GTC1hBFDZpF5bbzEXDxUTW2TuZKFDDqs2gOYKu1y/nK6I3rFwiO8UBkWBrbirs3PpE/DQp9c1xtdQO1PDspM6eybFlgfVs/eSpxpBKjwGbeX0cUCgqutE9QzG3a6Nzj7tu8Y4TL1Okbn82PLhD5qpTJ2Bo9tHbSoDNg5PYayUtD9l2p04npN8psasBdNp86oPaQ==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4455:|BYAPR02MB4455:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4455;
	31:2ywzrvXXthnDvfeEwajwsLM2KASMLDwJuSnyPRS7GKypTM6Q7FDIIlwFYhvf6NsnE4+fUuC8JOi3NRGwyz5Q96osiD/RAhcfWMiycHPczukkUAZ9qfp0iVNtquvSCfaLd7Evdxo1wGUcaIiQRMoMChN9urKqM/gxL2btAZrw0aoqT5+uGfYhFgghrE3PvgmXldjLLhm0ENvZZ3C8ghEh1ZeCnHBjhhX/voS4S80qoAA=;
	20:7aygyxW+0ngNqx8QY870am+g793Sw7z0W9flw10sMK1GTIp67SgQ69mWYAWnmqD3Y/q+YaCq/tjtV3XQGzfPaQhXTrUuGKClkY0rTppfM+9NvOcqT82L/DFMLi7eUp6YTwDNBqj78GbOcj7l6c44w6rkipacPyoio/ilDqKs3meGhHZxHFduLwof4m4G7eeoBshNlgPsWsvXEoKUJFXkvhs4qJqTaMyg/Y4Y+IdYmyNXru/xA29LWzdXnuI9e4jWnM2s+45YWv7mAQojLHRIBQaqHsJRj2jdq8Vm9roPLroIPQ+i+GCiWQ1lmyfDx4dXF90UzGgqiencUHiZzq3Fce4rjunU0DYQtEG2GY9ggzqTZ7+NQK9SPqQJZ91MOzSGlc79kYNl2diSQbpc3hjdAfWFmOM6PYBib/5nv5waUMjZjD0NoyrthtPvceum8txpKrEJIKT3ZAlfKJULhQw+HQN+YBYSfBNEtzzUuq/qpgcF3lw4P7wQU48yreu6CoSM
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB445546EFB8F5BA03049E602AACC20@BYAPR02MB4455.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(17755550239193);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(3231410)(944501410)(52105112)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:BYAPR02MB4455; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4455; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4455;
	4:8lW2udW2nQi0J+M+3FEBUJ7SktpBXCvlBhNZyq+PbRi+IqdF9nSSAMDXC5MU596dKl1aY1a1L0OFE82wzy5ht3+V5Jm9BLTitgMA3hmy6owrSqopqN5XwxJXCvV4BdDw1koR7r9n1fkFhhxxrSmV7GgGj7B6tbgXz5EOfcAPxSiHWCs2xHGNmqvD+JVg2yn2L6veAVnKWHDgTxPYUYlEORR14Q4Vo/ufwBmWK06BcURdKYlZhP6Uvvauo22I8Gk/zQ29ZTmtsCbUFCE0niZG69yOAhSFRa5bzhjjZY/sx65HMKfo5uPAwVbERxfB4yte
X-Forefront-PRVS: 085551F5A8
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWUFQUjAyTUI0NDU1OzIzOmhWYkR1bHlDMG92TE9YTWNMWXoycHVFcGg1?=
	=?utf-8?B?d0ZqNGErN3dSM3QyTmd5S0N6QXErd3lYZmNkMWNXMkFHR1VjUXlEdnExMUl0?=
	=?utf-8?B?MFpvdTlhOXcrZmlCTURLR0ZFRGtWeFN0ejV5SzlZbTNqUUMwVzNPTFFhUlZY?=
	=?utf-8?B?RFh2ejl1UzNlREN5b0paUTJrSEQzVHZHekdEUjJlSXY0ZUlkTGo0NE8xd1FJ?=
	=?utf-8?B?cGJVVlpnVXVJYnZUOVJvbFJZOWZ0TmlsSWQzV1c2Q294bUM5QUlHZEhqS0Zm?=
	=?utf-8?B?ZmFwYzlSQ0ViR1VTSlBVdGQyOVdhWWdPeDdkYnpZejdRWkZPWm95aEZUN25v?=
	=?utf-8?B?ZHBnNU9FL3FMUUQrR1B1bks3bXdoWjlCL3ZVYTA3dGtNWHRUOFdXRWJwd1pt?=
	=?utf-8?B?TjlaUlBEa0k1U1FCVkN3bkQ2K3g2WmIrYmxFaGkzbjhKSldiUGpmZjdNcDda?=
	=?utf-8?B?UFBYWGt0Q3RzQk5pc1J2L3QxbkVaQWw1cnB5VXRMODFpeEI4NXBLS0d3Y2d1?=
	=?utf-8?B?THBPMW9sOHBaaVNMYVhYOUEzM3lJMzZjTkZJWUdOK3J6ZUQzTFVneVRmTm1l?=
	=?utf-8?B?VDVLRDZlUnNxV09kUnFyZjkrdjVqQVRGckYyMm4xQTA3cURuRk1zRkFsYzBW?=
	=?utf-8?B?TmthY2FSZ3VKQzA2NGJ5eDZQVkdsa1RId1lma2tZb2JtaWVSQk1WUHoxYyt2?=
	=?utf-8?B?NVpnMUhPUldRN1dEUnpPK3JKell4Slo0QktZUnh2cVNqYUQwdmd5ZDVsRGVq?=
	=?utf-8?B?bEJVUlNlczcrZlpDLzYzRTRGWUtFNC9ncUVDc3RVUFFWNjFnVWdKemQ3T24y?=
	=?utf-8?B?WjY2TDZnUFcrQ3lRTndnNEdtTExvS0V2a0o1dWMzQ1g1bmMwUURxWG9NUm1Y?=
	=?utf-8?B?bzcreWxSWFBLdHBJOTVPclJyc0EydEc3cUNIR2hrT1BjaTBOa1NVUEMxa2RE?=
	=?utf-8?B?SURpWk50c25FNDZac2haQWVoNVVOelNsQUdxelBvdGNPY2xzeTUrTmh4MURT?=
	=?utf-8?B?eTltV2R3Yzh0N3hlci9GYzFoWDNCMHdCbHZEd1BSbzZqd2JXTkpSamdPbDBi?=
	=?utf-8?B?RHlZSTdPaExxTGZMcDBSNncwZVllZGxLTmJ0WmZ0NTdrczg3NmRpL096cU01?=
	=?utf-8?B?WjhZT3FEYld6b3BURW9zbXZSU3J4Sm52SzU1MkYyQTA3a3Fadms2U3RqV09L?=
	=?utf-8?B?TkVHSENiZG9JMVR6WnhzL3RkL0wva0IzamlWSUtDSSs0eTJQV2UvNCtDVzFH?=
	=?utf-8?B?ellpZDFybi9BbzlyekEzNlVrRmJxREFIa3ZvNDlDTnREemlLd0piMDRta2pN?=
	=?utf-8?B?TGF1cGN0QUVZM0dsaVB6a2hhRXdGYVA4S2FWNDhJQ09yWWd0czMzZ1FlWUM3?=
	=?utf-8?B?Vi9wdTM0RVRnSDJyRW5CMHlFakEyTW1NdTlDcGF2aXg5R0VjWXNHNVdWU0tB?=
	=?utf-8?B?MEVGbEpSYndPN1BLaHptMWNuYkxNandKR2dDZXdCdW9iWmY1d1d4bGgwUDZO?=
	=?utf-8?B?cmhnRGx4VHcxZ3VicmhmQlkyMDNSdmo2anprMXk3cDhsY3RXbUs3c2lTZTZk?=
	=?utf-8?B?UmI5eUhWd1AzbFhQUlFCSXk4WExOWkZDRXp4M0x5RVVOQ21MSjJZb3RTL2FL?=
	=?utf-8?B?ZWtlU3pENEwrbHMwWUYwZHE5OUF3UmZnTXZLc0xTdUJxY25JMG4rc3p0Wkho?=
	=?utf-8?B?V0t5T0d4TC9iME5BeVBoeDROSlNvKzJVVXlRc2d6dTZXQjYzdDM1a3pLUFRY?=
	=?utf-8?B?MXRKVElTZVF5R3dtVVdpNVRTUTAxVTQ4YmV3T2FOM2lkOXVuUUY5cmZWRUt4?=
	=?utf-8?B?SjJ6VUYvOUdvUW13MjdWM2RoKy9uWlQ4b3BtdFNYV01NZ2hYc2FNQk1LdVJz?=
	=?utf-8?B?NW5zTzBjSVF0VmZDR2xlUXJwa2NQWmpTTVpGMmZUcWs1S2RZN0R1d0JHdkdx?=
	=?utf-8?B?My95MktxQkhBPT0=?=
X-Microsoft-Antispam-Message-Info: uqrr+oRwkku18CdhLGAYqyjcnWA4fJ6AvdyCUqtsK2hULDAvRv3Odp9lxK1Ks7e9gTGXIwWs3uFnFDeqsQJJpTzf3THshY1F7ufvckjGFxw+KG4KyGRg8sjXou1qaLguj6NK3uFhGMh2lMQ5FxwG4T2b+kBj5dL/MO1qtApGrXkdUKCAniBkNh7CgYkcn/Inu8hSFv0T4ABSjNHv1EAO7SiQKG7rkaXgAk797vsObPAEp/mQBTeXJX++qH6ifPuq6S/vmsGFa6kv1McAag5WLD4clHZmKxVPtxHD0V3ARMTXLHTWl86kfpDW026dsAlmFWFJ4tWHC8nfpxUqcHV56cDCyVZW1jSgbO0WIAba6Tc=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4455;
	6:vFP7bwM71xC8wF0RTVNFCw6QuoSIyMkydXjVl3GFMkH2iTtoeyKtgigqNbXWvhNPSjWFHxg3oiXY65+ar9eUE+KiQnbODslR6g+NJZZnbO5M2H4PZYLfqRRhxJTpxkjV1Z5OjiHXLy2nToKaZ2Ry36tokIIS3A8/mgEhYoHJa5gSMM3bZslkpHYVGyecHE9xidNvV3eGsIBGebRzTxcKTHEuFWqsGdl7i3XKr6KypqQ+F0pSyAunWumrclGU96UDZ3mwhgEJ1odNX9wdgygywJr4Ao9U0YIpL+Q/0PL4TYkWj072h/95dw/zyiDeYpYbyaiqhsv6uUNihosQGya+mXbda9r8P6Wr1zUJlnMp1H1LqcTlgttcssYS5f5eXoxFr55K8F0asmTDe8IBUUsOcaeaxm+nv2bZRxQmfKK/o64bHjI9mZJyx5hUdsrL0mi9hWPRY3oAtt2pn03xFQqbNg==;
	5:N010ul8wZyiQXz547+Aqomp9AUBpJ9DA8NTNTX00f3qxK+ht2DZkj6qBT8VMzMwme58LFotEwZCryvECxwH+1QePwdv1zdJIpugZsJ3B1PyVL9fEPNKMcAHoRnNCIunRvHOfKSvsXNpcjIkJ7sDBpaA9i5QdvW3ySm2KubdsFgY=;
	7:1yPrzJiE6dWLKEn1VZFTbGDPK0wLqa+9svVUWRexuGpKdvtvCf1YEX2Mzm2UzYN7P9vnutdO3k9oDcX73RvADnogqlcG5UujLOhdniKKOicbAtLQf2T++a2uU40Eyv/pBTi47s9eU2TNSX/UUhOzWg==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2018 21:25:28.4338 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 318e2097-1170-42ac-d613-08d649ae88c5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4455
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4455;
	23:XIa+uj8xMQAep8TtsOypoa12FpfkXKfUtIuznziAyJoEvtdA6/7SMYQcNTLz4SPZPIxC4OglWN8nG5Gs5uyONYrPUC2VuIXAlpX2l3eMDgsWymqCzO9DgRekuU2BBOKXer9GSFV+dl/U6t7ULlBFoA==
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
X-List-Received-Date: Wed, 14 Nov 2018 21:38:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 11/13/2018 1:10 AM, Yu, Mingli wrote:
>
>
> On 2018年11月13日 16:25, Alejandro Hernandez wrote:
>> On 11/12/2018 7:03 PM, Yu, Mingli wrote:
>>> Hi Alejandro,
>>>
>>> Many thanks for your comments, please check my comments inline.
>>>
>>> On 2018年11月12日 23:28, Alejandro Hernandez wrote:
>>>> Hey Yu,
>>>>
>>>>
>>>> On 11/11/2018 6:28 PM, Yu, Mingli wrote:
>>>>>
>>>>>
>>>>> On 2018年11月09日 21:02, Burton, Ross wrote:
>>>>>> On Fri, 9 Nov 2018 at 01:39, Yu, Mingli <mingli.yu@windriver.com>
>>>>>> wrote:
>>>>>>>> Why is this here and not in the manifest?
>>>>>>>
>>>>>>> It's because we can optionally enable or disable tk via
>>>>>>> PACKAGECONFIG,
>>>>>>> if add it to manifest then we need to always enable tk which is 
>>>>>>> also
>>>>>>> the
>>>>>>> implement in v1.
>>>>>>
>>>>>> Are you sure?  As I understand it there won't be any errors if the
>>>>>> contents don't exist.  And to be honest if there are, then the
>>>>>> manifest tooling should handle that neatly without special-casing.
>>>>>
>>>>> Hi Ross,
>>>>>
>>>>> Thanks for your feedback!
>>>>>
>>>>> I didn't quite understand what you mean. As I know, if we add the the
>>>>> setting in manifest as below:
>>>>> diff --git
>>>>> a/meta/recipes-devtools/python/python3/python3-manifest.json
>>>>> b/meta/recipes-devtools/python/python3/python3-manifest.json
>>>>> index f922561..09c9199 100644
>>>>> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
>>>>> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
>>>>> @@ -1056,10 +1056,12 @@
>>>>>      "tkinter": {
>>>>>          "summary": "Python Tcl/Tk bindings",
>>>>>          "rdepends": [
>>>>> -            "core"
>>>>> +            "core",
>>>>> +            "tk"
>>>>
>>>>
>>>> This error is happening because you are trying to add python3-tk on
>>>> RDEPENDS, and that package doesn't exist, when you specify "foo" on 
>>>> the
>>>> "rdepends" section of the manifest it is translated to ${PN}-foo.
>>>
>>> Yes, that's why I point out that we need to add extra logic in python3
>>> recipe to make it rdepends on tk after add the logic as below:
>>>
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
>>>          ],
>>>          "files": [
>>> -            "${libdir}/python${PYTHON_MAJMIN}/tkinter"
>>> +            "${libdir}/python${PYTHON_MAJMIN}/tkinter",
>>> + "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter*.so"
>>>          ],
>>>          "cached": []
>>>      },
>>>
>>>>
>>>> So two things:
>>>>
>>>> 1. The manifest can have the _tkinter.*.so on the "files section of
>>>> tkinter (please note that this is _tkinter.*.so and not _tkinter*.so,
>>>> the wildcard should be after a "." this is to keep a standard which 
>>>> the
>>>> tooling can handle more easily.
>>>
>>> Got it, thanks!
>>>
>>>>
>>>> When the PACKAGECONFIG is enabled, the files for tkinter will be 
>>>> picked
>>>> up correctly.
>>>>
>>>> 2. You should not manually add "rdepends" to the manifest, the tool
>>>> itself should populate those automatically, this is better because we
>>>> would avoid this kind of errors.
>>>>
>>>> Please add the package to the manifest, populate the "files" and
>>>> "summary" section and then run $ bitbake python3 -c create_manifest to
>>>> populate the rdepends section automatically, also keep in mind that 
>>>> you
>>>> should run this when the PACKAGECONFIG is enabled for the native 
>>>> package
>>>> as well (thats how it will pick up the dependencies).
>>>
>>> No new package needed to add to manifest, we only need to update the
>>> items for the existed package tkinter and per your suggestion not
>>> manually add "rdepends" to the manifest, so I only add files to
>>> manifest as below in manifest file,
>>
>>
>> My mistake  I thought you were adding a new package.
>>
>> Anyway, as a matter of fact, all you need to do is to add the same
>> PACKAGECONFIG on the python3 native recipe and enable it, once its
>
> Many thanks for Alejandro's hints!
>
> I still failed to let the files(_tkinter.*.so) automatically added to 
> manifest though I run $ bitbake python3 -c create_manifest altogether 
> with below logic. Could you help to take a look is there anything I miss?
>
> $ git diff
> diff --git a/meta/recipes-devtools/python/python3-native_3.5.6.bb 
> b/meta/recipes-devtools/python/python3-native_3.5.6.bb
> index d5953cf..80f9678 100644
> --- a/meta/recipes-devtools/python/python3-native_3.5.6.bb
> +++ b/meta/recipes-devtools/python/python3-native_3.5.6.bb
> @@ -28,6 +28,8 @@ 
> file://0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch \
>  file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch \
>  file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
>  "
> +PACKAGECONFIG ??= "tkinter"
> +PACKAGECONFIG[tkinter] = ",,tk,tk"

Wouldn't you have to DEPEND on tk-native here?


I believe that might be the issue, you can check if the _tkinter.*.so 
file is generated from the native build (basically if its not generated, 
its impossible for the create_manifest task to pick it up).

$ find python3-native/3.5.6-r1.0/image/ | grep _tkinter.*.so

If you can confirm that it is generated but the create_manifest task 
isn't picking it up we can keep debugging, but first lets check if its 
there.


Cheers,

Alejandro


>
>  EXTRANATIVEPATH += "bzip2-native"
>  DEPENDS = "openssl-native bzip2-replacement-native zlib-native 
> readline-native sqlite3-native gdbm-native"
> diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb 
> b/meta/recipes-devtools/python/python3_3.5.6.bb
> index 2a45476..edc9d18 100644
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
> 'qemu-usermode', 'pgo', '', d)} tkinter"
>  PACKAGECONFIG[readline] = ",,readline"
>  # Use profile guided optimisation by running PyBench inside qemu-user
>  PACKAGECONFIG[pgo] = "--enable-optimizations"
> +PACKAGECONFIG[tkinter] = ",,tk,tk"
>
>  do_configure_append() {
>         rm -f ${S}/Makefile.orig
>
>
> Thanks,


>
>> enabled you can run the create_manifest task and it should automatically
>> generate you a new manifest with the required files (clarifying that it
>> doesnt have to be enabled by default but it has to be enabled on the
>> native package when the create_manifest task is run), meaning that you
>> don't actually need to add the _tkinter.*.so file manually to the
>> manifest, it should be picked up automatically, this is because the
>> create_manifest tool assumes that the python3 and python3-native
>> packages are exact copies of each other.
>>
>> Regarding the extra logic, I also agree with Ross, and I don't
>> personally like having the extra logic there, either for that package or
>> for handling each package that would need a PACKAGECONFIG, I think using
>>
>> RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk',
>> 'tk', '', d)}"
>>
>> should be enough.
>>
>>
>> Alejandro
>>
>>
>>>
>>> diff --git
>>> a/meta/recipes-devtools/python/python3/python3-manifest.json
>>> b/meta/recipes-devtools/python/python3/python3-manifest.json
>>> index f922561..09c9199 100644
>>> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
>>> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
>>> @@ -1056,10 +1056,12 @@
>>> "tkinter": {
>>> "summary": "Python Tcl/Tk bindings",
>>> "rdepends": [
>>>     "core"
>>> ],
>>> "files": [
>>> - "${libdir}/python${PYTHON_MAJMIN}/tkinter"
>>> + "${libdir}/python${PYTHON_MAJMIN}/tkinter",
>>> + "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter*.so"
>>> ],
>>> "cached": []
>>> },
>>>
>>> And also the update the python3 recipe,
>>>
>>> diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb
>>> b/meta/recipes-devtools/python/python3_3.5.6.bb
>>> index 2a45476..e50e7dc 100644
>>> --- a/meta/recipes-devtools/python/python3_3.5.6.bb
>>> +++ b/meta/recipes-devtools/python/python3_3.5.6.bb
>>> @@ -78,10 +78,11 @@ export CCSHARED = "-fPIC"
>>>  # Fix cross compilation of different modules
>>>  export CROSSPYTHONPATH =
>>> "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/:${B}/build/lib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux" 
>>>
>>>
>>>
>>> -PACKAGECONFIG ??= "readline ${@bb.utils.contains('MACHINE_FEATURES',
>>> 'qemu-usermode', 'pgo', '', d)}"
>>> +PACKAGECONFIG ??= "readline ${@bb.utils.contains('MACHINE_FEATURES',
>>> 'qemu-usermode', 'pgo', '', d)} tk"
>>>  PACKAGECONFIG[readline] = ",,readline"
>>>  # Use profile guided optimisation by running PyBench inside qemu-user
>>>  PACKAGECONFIG[pgo] = "--enable-optimizations"
>>> +PACKAGECONFIG[tk] = ",,tk,tk"
>>>
>>> And then I run $ bitbake python3 -c create_manifest, but there is no
>>> change in manifest file.
>>>
>>> Thanks,
>>>
>>>>
>>>>
>>>> Cheers,
>>>>
>>>> Alejandro
>>>>
>>>>
>>>>> ],
>>>>>          "files": [
>>>>> -            "${libdir}/python${PYTHON_MAJMIN}/tkinter"
>>>>> +            "${libdir}/python${PYTHON_MAJMIN}/tkinter",
>>>>> + "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter*.so"
>>>>>          ],
>>>>>          "cached": []
>>>>>      },
>>>>>
>>>>> There comes below error:
>>>>> ERROR: Nothing RPROVIDES 'python3-tk' (but
>>>>> /mybuild/layers/oe-core/meta/recipes-devtools/python/python3_3.5.6.bb
>>>>> RDEPENDS on or otherwise requires it)
>>>>> NOTE: Runtime target 'python3-tk' is unbuildable, removing...
>>>>> Missing or unbuildable dependency chain was: ['python3-tk']
>>>>> ERROR: Required build target 'python3' has no buildable providers.
>>>>> Missing or unbuildable dependency chain was: ['python3', 
>>>>> 'python3-tk']
>>>>>
>>>>> That's to say, we still need to add some fix in
>>>>> meta/recipes-devtools/python/python3_3.5.6.bb. If so, it may be
>>>>> flexible and clear to directly to make the implement just as what I
>>>>> send in the RR.
>>>>>
>>>>> Thanks,
>>>>>
>>>>>>
>>>>>> Ross
>>>>>>
>>>>
>>

