Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 7696 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 22 Nov 2016 23:27:06 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0065.outbound.protection.outlook.com [104.47.40.65])
	by mail.openembedded.org (Postfix) with ESMTP id A032260248
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 23:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=CJwyMKb6Nq+xvJlRD3ZN94PGtv+OVZnpLle4Se8n5pw=;
	b=rMRw7sXKe8WN12S7kJrES6qewepom+e7Cdz1pHjG/dG0jRjooPhA4ym16Sj5tqJ4ZUBmFofBPPP+NdOGmr5mLPgWNr8kU3gMzYMna5AXpA0afuRdOZWEzb85csqDuiE9WGDEZ6qCM90sB+aRreFVXB1VKqwTPwHrmauvjj7oGfE=
Received: from MWHPR02CA0019.namprd02.prod.outlook.com (10.168.209.157) by
	BLUPR02MB001.namprd02.prod.outlook.com (10.242.190.147) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.734.8; Tue, 22 Nov 2016 23:12:12 +0000
Received: from CY1NAM02FT011.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::202) by MWHPR02CA0019.outlook.office365.com
	(2603:10b6:300:4b::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.734.8 via
	Frontend Transport; Tue, 22 Nov 2016 23:12:10 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT011.mail.protection.outlook.com (10.152.75.156) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.734.4
	via Frontend Transport; Tue, 22 Nov 2016 23:12:10 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1849; Count:20
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1c9KET-000476-50; Tue, 22 Nov 2016 15:12:09 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1c9KET-0001hc-1z; Tue, 22 Nov 2016 15:12:09 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	uAMNC8EZ001593; Tue, 22 Nov 2016 15:12:08 -0800
Received: from [172.19.74.183] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1c9KES-0001hV-Gf; Tue, 22 Nov 2016 15:12:08 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <1479848501-5451-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAMKF1spiS9_qTRf2_01rVRTfwKLoZ+WDYm7Hy4_Dr5On7eDLXw@mail.gmail.com>
From: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <220ac38a-b960-6a9a-84f1-f9a58c936537@xilinx.com>
Date: Tue, 22 Nov 2016 15:08:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spiS9_qTRf2_01rVRTfwKLoZ+WDYm7Hy4_Dr5On7eDLXw@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22714.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-IncomingHeaderCount: 20
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(54534003)(377454003)(189002)(24454002)(199003)(377424004)(230700001)(6666003)(5660300001)(36756003)(50466002)(83506001)(33646002)(64126003)(305945005)(63266004)(2950100002)(65956001)(65826007)(6916009)(626004)(110136003)(39060400001)(189998001)(23676002)(7846002)(356003)(47776003)(92566002)(229853002)(8676002)(9786002)(38730400001)(81166006)(4001350100001)(8936002)(50986999)(31696002)(2906002)(4326007)(65806001)(54356999)(77096005)(76176999)(31686004)(106466001)(1720100001)(81156014)(107986001)(19627235001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB001; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT011;
	1:uVtuiKoMktaLupeL8zn05I1K9hFyuHtddggQd8cWSbUeC58Exv9ZWsUMRodJFroGn4AJzTRd4V45CmbnlRMwm1XpjgS6wP5JFPp4PlkfGHPrD7cScM9qdaAIx9rOJmuvm/HgIrtZDpKOuswO4sosqqUFvIEseVx74dGRHh94LCownxyV8CbfDzYviUCzdC88R07yfes9yzyFFKYJ2C1+MvVWMGcc/POPMu/U56k4EFRSw6t8IlDmj2pkfzaARKB/TYVVGH+nvhfuknUAokhrZ5b4npWYKWZUT+VLvwO0gePSFujkN7flADWFDRvB/5L51FB2oIPJ/E7fjNlxdydZb74jRX+fVn3FD/iHfrbQESWrO5mmWaydXPEYZlY0ttFxXtW7l8eQPNj7CKYTjgOzBoIMoPA9dwZGQJUaSAXK4qZdkshPDIFzcJWhEl8dt4cyPwqoz3mqueXE9usKQDndWZXkm4h05vlJRphLxdXBURbEhTASTuFYoOwCslkpQl5TyahyfTYgNX4d90jEZZIaU1h1wIF2wJwuvubaQHId5bJEHizt/CED4K3u7GDmqrcTZqEuzUqgoWmTpMuMhalM3Q==
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB001;
	2:iukh7c7ydjepIsOpCUjLXbSTuM1YPbsmXjkud9gAsalK7yoopKv8tP4XkIxyhz2PWHblxa0iFQO9B5lI/goci8HBdi9SB1j7a2hI6SdoPL6M8747dAVkRl+5Ua59RXt+q75xcU4cgDqoSrUd7FcW4bQ/JDZuN88pkPke5m9S+Vk=;
	3:A3bAVfwU+oKWeycLMwujpqSTHF+OafTM50epnaDLFp0Rbx1d/jYu4HowV3KtcOrd9W+F8Rfus4qeXGtVgCe/GB3z3FrEOeYOMK+UT+ZN8sEKXAqitxUsdufY2VQ5hJ7PGyenNrarvnQV4ow1FPBGfDP9fPiJm6dlaZxhQ1YADPuDpG5QVtzVzQuldTGekGuJk7nUl4cgP3Y/LhVWT1K0hXJXqfUKenVrTHJC+sMhfHwVIYChUsOeBt5Ro8rqWNLQAILi97JO4ct2mlF/RqXBqP38tSVspxHiN0nin2AytUo=
X-MS-Office365-Filtering-Correlation-Id: dbb2eaf4-a171-4cf8-92e9-08d4132cfccb
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:BLUPR02MB001; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB001;
	25:kPweWocbMKVMuqGLlGsxyLPmRgQqI2pULN4cHxiJY+PrzGL8io56nzD4M+oVIlBKkwyoOgVtJ37ZN23NTGg0WHXSsHNuPyZAZKCY5AiJhYt1UQAAiAtAIJPJ7O5hB8zrU3uGNY2+uU5Qf8SZcjJa+DO0IO8wbC9+TG5OsDKiw5lWwv620/ItNFcnLIco68VXnyeWuwcDC5OOmOgu4c9akxkEtSxQWqWRGlucBAWaQ3V2nabrDB6Q3WmYJxPDMdh6K17yfg+52hA8b6NVPI0LiJKAMpt+q0wJI5kBce7srHFs9S68eDixGWi0X8U+vPgOP0iJoLcRxoASt/izyN2iudpGeASJBECO441MwtiXAlTY6XcHxS9q0JUFb/IpByp+i4bSacBZtQPhpEihL+B1gx3d8rcNBrmCqJyMeOYkg7WqM8xKqVNiIdW9Qzlvy9NjzDI6PyuoNQx/QPD8/w6GM+bu6+hy/LMpY+pzkU9zemG/0B7R9bTO7M4e2zhHjOJkBt41nCSv8wN7JsJgUe6iTvq1DIWDj+Yf2blFdaZ6E+e2QNX6tpA4xxLy8ar3fDp9b9HfuSV2CtAPhHtv5TW1Yx4fsODnTh8p7Tl4mYBReKB7qcACKVlWtXb+r1xChXhCpUGrfqmFnGnQBVpImXgYB60aBQFOVT65nAhX6FWrs4guc2qsed9Fhz4gXiHjrD9ZHzkNiigkQJeDSWMcjwfwfHcAh1BHYND41Qa8Dpw2+c2r3ri0a+d2NFbLeNR9GvyqhLYv5XBgVd39KLS3Ux26Pk8R68A24umeXpj5HpJCIk0TcxMvSl1TlljWBmycP3s/qh7AybSNFpRXky67CzqlkUKjAKWSO+WC1RjeWjPRWqYCB3yxIEMcdJyzzGdhm7YH5K5/io8Vl5jEuvUF5JNgyAvzqLvbt5y1b4y/o69jhkM=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB001;
	31:WGl3YySdOYMUf2Vac1HE92rvPUAQRknwWzbh3C4q95NzEUp0ehkpkAxTPwG2RFUOJ3zv0bBf1i31S4kIK9ECknERC2bnTHT5i64y9kfsHeUwG457r7MJ2LYkHW3kYW/eTXt41tS2M5SIGperJ0jOORzvFpPhsBwrVcqDJ8JeQvL7d2ZaVUkq74bgOk1/zWZk4wkUyRgWnV4vFYkniq0+/GZRF7j+EQiIqJh43VrWB/RF+sh0Z1vG/IW1hQb/nl9jwl2DstdwnxzUMe/9+z1BGL8pBsq9M5JhURz7RuVW3Q0=;
	20:9u3MIb6zgXYneayJYpcA0/QxzdidWi3KgygdPtL6oJrs7MiV0YSPiU0tyRYpofcEdSGh2Np/KNs9tMHIqU24RUoQLsLu49l28RVJ0QmHC9wgrkZowEH44ybTpg+QvVb8LBCCiZiQG+tVwOWj2e4PvSYCXTe16kNFwrCPUCqVNiwzbJOL17laZK3aTG6zTo718VYVuUHcjqYvUOV+2BVS2vSowA7VXjgfQat4wNvC8kYZi9QAPnjv2fsegARMGCEe8JBsncd1R4LElrN8AgHXGAOlW/ow9VB9ybeKq2LxaiZaAL678FKNnipxlVONv4H6CttJyA2sPwpUgxLS/YBjhPEJfMLffBrCahEqy62qpJu8WKCW0axfbRCoge8UqMATVqawh/xvn829bDuFovlqqpgFQrPzbmOfrjZu5MxhBKZm1Lg7GHr+G9+nsqFGP1XMr/t5m8CaMHNV2d7p9o5y0RM964Dsp8IHLUjOe1pomCIMxMsOxd74CxP32ORL34Ez
X-Microsoft-Antispam-PRVS: <BLUPR02MB00168862D03CB2AEC3491A1B9B40@BLUPR02MB001.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6045199)(6040307)(6060326)(601004)(2401047)(13023025)(5005006)(13015025)(13018025)(13017025)(13024025)(8121501046)(3002001)(10201501046)(6055026)(6061324)(6041248);
	SRVR:BLUPR02MB001; BCL:0; PCL:0; RULEID:; SRVR:BLUPR02MB001; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB001;
	4:kwxwbilCOXzD8/nfO+M2zPSmDQNeA+MbsrEwudahRnMXjOHWDgnqgwrrttj5GJjURQRtaVwZLqJ5ZX/NevhWacH9dV66weaXo4blkJlpH3kMmy1h2kC9UltvxyO1igUrSjzB0Hix1prirgq8fZzDZA+gGvCsAThLeqxxE55YXncDWoeWM0b5kUf3Nz34pzgqclQczJyTDng/G1gyWgu8DGSD/rtdiswcWivccIfSdxAjqIPEYewtaNV6C5Re5wlpNwOGdeow9ao6lh6NaJxPc1/w2ZK97Qv62nTAyf6ihciqTBY/MOppnGkHMO32yvyo+lMXNPyu4I65aYnqAxAXjoAj/PdPDG0X+IOl/3hepZfZR0Q08IcX6r9jzr+LA32JzdOx0ONsxTOAC95oT96Wr5MtjQL+2BCxmPDASauvJvQhiNLYhnrWtCM/GgnWp4VaKI9TsyhJVZ0R6nnFPO73pUqJHxD71bjN7qDEXjXRKO3eTch9W+035GJBZjVxuQiG8NQfZy5lvT4kGaCEjf6iNrgK6NO7wnI0psm+UmfXqZdYb0S5ig54wc58+yYDbT1axKVkRsVN+V4lQgbGBmRQuh98c4E7KKN/7brpvGN1ibT2I53+zfQ2ghAYChSNEBXHSnivq46xZmc7voPfexEe3miFvSofIziuljBnW5kp228=
X-Forefront-PRVS: 0134AD334F
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTFVQUjAyTUIwMDE7MjM6WG1LY3I2UWdpT1lLeWJieG8zS2JNNHVWUUpt?=
	=?utf-8?B?eVE3NisvS0dheHpoYk9OcUJuZHFYdUd3dXNYdlRGWlZCQlcwR2U5WUR5My9p?=
	=?utf-8?B?NjZTOS9PTmtzczVSdThtTUdaTmQrZU5rVU5XYmpENEpNOWJrVFhOOGhFdEpI?=
	=?utf-8?B?VnlyUjA5UUVHYjZHRWZXMW5VQzZzU2pKOU1JalhBRk9EMTY2b3VZYlB5Ykgr?=
	=?utf-8?B?T3hSaC9OdmFmMnRLL3VTbWxBdk83b1NqWEc1L3RuUHFETTlETnZCRnFNTVpo?=
	=?utf-8?B?VXR3TGk4UmFQdngrc1NScjdEQ3hlVVZGWERoR2htbUhTYmlLanR6VDVCc05t?=
	=?utf-8?B?b3NrdjJOdFBqcWRQcHNxSXhZREVqaGs4TGZkTlFIMFZTSk4xZlVzZnl1QlZo?=
	=?utf-8?B?UHE3aVZRRm5najU0UEtEUExtc0Z2MWRmUzhKeGJoR1RjME11N2k5dU9FOXg2?=
	=?utf-8?B?bE5aTzFUeFZNZ1lCZXB0a3lnZDlJeWNCOGhqckIrbCtZZHN4blZmazlxR2o2?=
	=?utf-8?B?czBkZWRjVDRGQkw1cFM3UUVpZ082enhkT2NLNExZVU9qN043Qm8rcWplbDIx?=
	=?utf-8?B?cXRNNFNPcHRJS1YydW9vV0kxOUhJVzIza1BmcXpNZVRaTmU5NHlocnB6SUZI?=
	=?utf-8?B?VDE4bWwxWUFrRjM4VnRCcmwvQzRlTTUrRDZpZWdhVkQrQlJFMzFtS0xDN0Zj?=
	=?utf-8?B?dTFIZXBLRE1vRENzM1Z1R1ZiVlBIOS9aeEx5ZndMZkRTTGtjME41Y1BGRHAw?=
	=?utf-8?B?YUtRcXdxdGtsKzMwUkJlL3V5NTFjUUQ4ZDI1QndzOXYrZlpuSktCdmpKdkVx?=
	=?utf-8?B?a3hOTEJ1dWUzTjhFWmtBMWhRWnN0U2ZHdTlMYzBoc2FFZkhSR1lLeHBxMnVQ?=
	=?utf-8?B?QUF1QkNMd095cVVHSFQ2UGdHdEZqMnYyVHZKZG9FMFN5MWxTbDRMU1EvVk5F?=
	=?utf-8?B?OHlrTFBldWNIN3FpMmxZZ0IxOGtCTUZjOUdXVEtkY0Z6S0pMZGJTRUlZZEdx?=
	=?utf-8?B?WVRlcjUxVjN3Sk96V1E5ZWhPbE5UQlU2YTc3eUVrYnlXRjNneWN0ZmxXL0Zp?=
	=?utf-8?B?VlBiTk1JNlc3TVF1R0NqUHBPbHYxMVR4ODB6WHhpd3E4UDIyQ0IrNmlwcWFm?=
	=?utf-8?B?NXJtdk53UHZabmNSY0pVelZMaVdtSGpLWGh0S0tYa3MwNXM3ZEwzSWNZZ2ZD?=
	=?utf-8?B?K1dtYU9mZEQvZFVBT3lJeUV2Y2Z4TXNqUkNzWmEwYTdHZC8rOHF2QkQwVzQw?=
	=?utf-8?B?b3Y5YVlObVE4L3REVHZKTlk2VW9ZcmpiT3RkVkZEN1dISEFHWmRoTnBDUVpC?=
	=?utf-8?B?bEg3dmpNdTJXYjJaeURybGdDQVIzR2pCZm4xaWtMNGRtNlpRT1dvbEh3bEw3?=
	=?utf-8?B?eHlzdHhGdG5Ock9tVURqeXQ4QzNudzlrT0M1c2FsVjRlckpYZ0NFWThQWTlB?=
	=?utf-8?B?MUtKNGJHRlFuUGpWbFo3RDdUZEdDbyt0QTdkSDN6WU43U244RklFVE1kRUtp?=
	=?utf-8?B?ZHdyb3ZhZHRhYjBLckZyVHUyeGFyQ21VTUo0aGZIODBJMzNOV1VkODRnRXFQ?=
	=?utf-8?B?enZqbm1GRXcwVEpVaFlLa0J2dk13V3NrbytYczh5NFFiN2xDYXV0V2IxcWVX?=
	=?utf-8?B?ZjYxOGtpVkxLRUNEaE4xSFhNeUs5QlRHM3B2ZjBLVTVOS01EaGlMbXBaVTZ2?=
	=?utf-8?B?citWYVBQN2d0bXFsT2RlUExtMVR4dzl5VFAxNWNHRzlNTVZrZmtVUzVCaWtV?=
	=?utf-8?B?bGsreHYzb1Jxai9VaWx3PT0=?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB001;
	6:ZVOYr3Z7iAUkzpaOh5c9PnXiud2ZoSlhhXxQdHfPt3w9mEYTY3BhIAB1OlwSgBUy9KQpjd0mGu+powMRs+l4dC3RnFmeWdwYC6ZZHcD9pTQcj8zocKk67k/USEuvTtqZm3168ddEO1+s2+H+7fvIpqjRqlpuBfMLI1IieePOmQSL6cVNmCEBX3A4s/VWGGLr8zlpHX9M2RUHmIG97R4e+debX2jCSCuMtM5TWaFtTKXBLe3mS9FJ8DmRLfrrC9K3y8djxmr/k/0LGKFstpDwj+elOyZD462EFbmiVKVS4a+jaNhZdy4pN4f7LZM7IhwOFUyzAovlVJfqI+Y5N/LxIyiMQF/xg8vHGT0PcUVXdWymxc3Ev7+BNu6VkgP68zSr;
	5:6v8PC5Y0TD00S0hALIPEzSWqN7wXksHHu8LMBjK/IT3W6vvrpB1/boBDD+EZB3NCCqkrN+5ST8Tr75Mh1qYd9NbUbZCAek4R2FHDu0GCf8Qwix2Yh9kiqzEtsns/TDXpFp5ihr2zphlQ3L/updMMEg==;
	24:5p4d+p7vOqC77l0aOYpX9I422E7p7lyRbWMnhEZ9L8pGFYEJcoTJeT+rau1gS3cUz7eKpRDmNusGe7iP9CDSPlvi+NguH+BzSFXXIiGv42A=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB001;
	7:qxFplJ5e1MRn4T54OYR0sxiH4tfMmBEPeUqTwF311DdXJIUGenAlukLtx9mudlkdu0VErG+5gwqZy8ya9WO9IJNQ/LN5pUR0AUL/BLg12JpA/PRWJzutcDlxEFuPY1kEw9PSFJoWkg7CF19D9eJqOxI6AadrbbD+5U6OyfbYwnZQ3KppzjCtZpzAmLvesudQ5uYRwqc4D3tL+loE05iAqtwcFuviyeQ6ozH+0CgHdFjNLPRcnitRvgzkljFlKmbtKgBY5YPa+y5NLvgqjjnZXKScpFK9AKicH6TJB3X/B3EXIJ4I8uKuZRKWKP2QuYzYCBQt7CEd5gBzd0bN5f/CvhP7yBM+M9KTmB7vQpdrV0s=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2016 23:12:10.2708 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB001
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][Morty] binutils-2.27.inc: Fix alignment frags for aarch64
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
X-List-Received-Date: Tue, 22 Nov 2016 23:27:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Khem,

On 11/22/2016 02:03 PM, Khem Raj wrote:
> This is ok for master
Is there a particular reason not have in Morty? We have 
arm-trusted-firmware failing to build due to this issue. I have 
submitted a patch to master as well

Thanks
Manju

>
>
> On Nov 22, 2016 1:31 PM, "Manjukumar Matha"
> <manjukumar.harthikote-matha@xilinx.com
> <mailto:manjukumar.harthikote-matha@xilinx.com>> wrote:
>
>     There was bug with alignment frags for aarch64 in binutils. This is
>     fixed in master of binutils. This patch backports the fix to binutils
>     2.27 version.
>
>     Signed-off-by: Manjukumar Matha
>     <manjukumar.harthikote-matha@xilinx.com
>     <mailto:manjukumar.harthikote-matha@xilinx.com>>
>     Signed-off-by: Nathan Rossi <nathan@nathanrossi.com
>     <mailto:nathan@nathanrossi.com>>
>     ---
>      meta/recipes-devtools/binutils/binutils-2.27.inc   |   1 +
>      ...eration-of-alignment-frags-in-code-sectio.patch | 139
>     +++++++++++++++++++++
>      2 files changed, 140 insertions(+)
>      create mode 100644
>     meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
>
>     diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc
>     b/meta/recipes-devtools/binutils/binutils-2.27.inc
>     index fc81721..90518bf 100644
>     --- a/meta/recipes-devtools/binutils/binutils-2.27.inc
>     +++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
>     @@ -37,6 +37,7 @@ SRC_URI = "\
>           file://0015-binutils-mips-gas-pic-relax-linkonce.diff \
>
>     file://0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch \
>
>     file://0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch \
>     +
>      file://0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
>     \
>      "
>      S  = "${WORKDIR}/git"
>
>     diff --git
>     a/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
>     b/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
>     new file mode 100644
>     index 0000000..f8b46be
>     --- /dev/null
>     +++
>     b/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
>     @@ -0,0 +1,139 @@
>     +From 4a4286465b5d6c28968bc2b29ae08daca7f219a3 Mon Sep 17 00:00:00 2001
>     +From: Nick Clifton <nickc@redhat.com <mailto:nickc@redhat.com>>
>     +Date: Fri, 18 Nov 2016 11:42:48 -0800
>     +Subject: [PATCH] Fix the generation of alignment frags in code
>     sections for AArch64.
>     +
>     +PR gas/20364
>     +* config/tc-aarch64.c (s_ltorg): Change the mapping state after
>     +aligning the frag.
>     +(aarch64_init): Treat rs_align frags in code sections as
>     +containing code, not data.
>     +* testsuite/gas/aarch64/pr20364.s: New test.
>     +* testsuite/gas/aarch64/pr20364.d: New test driver.
>     +
>     +Backporting the patch from binutils mainline
>     +https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=7ea12e5c3ad54da440c08f32da09534e63e515ca
>     <https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=7ea12e5c3ad54da440c08f32da09534e63e515ca>
>     +
>     +Upstream-Status: Backport
>     +
>     +Signed-off-by: Manjukumar Matha
>     <manjukumar.harthikote-matha@xilinx.com
>     <mailto:manjukumar.harthikote-matha@xilinx.com>>
>     +---
>     + gas/ChangeLog                       | 10 ++++++++++
>     + gas/config/tc-aarch64.c             | 10 +++++++---
>     + gas/testsuite/gas/aarch64/pr20364.d | 13 +++++++++++++
>     + gas/testsuite/gas/aarch64/pr20364.s | 28 ++++++++++++++++++++++++++++
>     + 4 files changed, 58 insertions(+), 3 deletions(-)
>     + create mode 100644 gas/testsuite/gas/aarch64/pr20364.d
>     + create mode 100644 gas/testsuite/gas/aarch64/pr20364.s
>     +
>     +diff --git a/gas/ChangeLog b/gas/ChangeLog
>     +index a39895a..fad06dc 100644
>     +--- a/gas/ChangeLog
>     ++++ b/gas/ChangeLog
>     +@@ -1,3 +1,13 @@
>     ++2016-08-05  Nick Clifton  <nickc@redhat.com <mailto:nickc@redhat.com>>
>     ++
>     ++      PR gas/20364
>     ++      * config/tc-aarch64.c (s_ltorg): Change the mapping state after
>     ++      aligning the frag.
>     ++      (aarch64_init): Treat rs_align frags in code sections as
>     ++      containing code, not data.
>     ++      * testsuite/gas/aarch64/pr20364.s: New test.
>     ++      * testsuite/gas/aarch64/pr20364.d: New test driver.
>     ++
>     + 2016-08-03  Tristan Gingold  <gingold@adacore.com
>     <mailto:gingold@adacore.com>>
>     +
>     +       * configure: Regenerate.
>     +diff --git a/gas/config/tc-aarch64.c b/gas/config/tc-aarch64.c
>     +index ddc40f2..74933cb 100644
>     +--- a/gas/config/tc-aarch64.c
>     ++++ b/gas/config/tc-aarch64.c
>     +@@ -1736,13 +1736,13 @@ s_ltorg (int ignored ATTRIBUTE_UNUSED)
>     +       if (pool == NULL || pool->symbol == NULL ||
>     pool->next_free_entry == 0)
>     +       continue;
>     +
>     +-      mapping_state (MAP_DATA);
>     +-
>     +       /* Align pool as you have word accesses.
>     +          Only make a frag if we have to.  */
>     +       if (!need_pass_2)
>     +       frag_align (align, 0, 0);
>     +
>     ++      mapping_state (MAP_DATA);
>     ++
>     +       record_alignment (now_seg, align);
>     +
>     +       sprintf (sym_name, "$$lit_\002%x", pool->id);
>     +@@ -6373,11 +6373,15 @@ aarch64_init_frag (fragS * fragP, int
>     max_chars)
>     +
>     +   switch (fragP->fr_type)
>     +     {
>     +-    case rs_align:
>     +     case rs_align_test:
>     +     case rs_fill:
>     +       mapping_state_2 (MAP_DATA, max_chars);
>     +       break;
>     ++    case rs_align:
>     ++      /* PR 20364: We can get alignment frags in code sections,
>     ++       so do not just assume that we should use the MAP_DATA
>     state.  */
>     ++      mapping_state_2 (subseg_text_p (now_seg) ? MAP_INSN :
>     MAP_DATA, max_chars);
>     ++      break;
>     +     case rs_align_code:
>     +       mapping_state_2 (MAP_INSN, max_chars);
>     +       break;
>     +diff --git a/gas/testsuite/gas/aarch64/pr20364.d
>     b/gas/testsuite/gas/aarch64/pr20364.d
>     +new file mode 100644
>     +index 0000000..babcff1
>     +--- /dev/null
>     ++++ b/gas/testsuite/gas/aarch64/pr20364.d
>     +@@ -0,0 +1,13 @@
>     ++# Check that ".align <size>, <fill>" does not set the mapping
>     state to DATA, causing unnecessary frag generation.
>     ++#name: PR20364
>     ++#objdump: -d
>     ++
>     ++.*:     file format .*
>     ++
>     ++Disassembly of section \.vectors:
>     ++
>     ++0+000 <.*>:
>     ++   0: d2800000        mov     x0, #0x0                        // #0
>     ++   4: 94000000        bl      0 <plat_report_exception>
>     ++   8: 17fffffe        b       0 <bl1_exceptions>
>     ++
>     +diff --git a/gas/testsuite/gas/aarch64/pr20364.s
>     b/gas/testsuite/gas/aarch64/pr20364.s
>     +new file mode 100644
>     +index 0000000..594ad7c
>     +--- /dev/null
>     ++++ b/gas/testsuite/gas/aarch64/pr20364.s
>     +@@ -0,0 +1,28 @@
>     ++ .macro vector_base label
>     ++ .section .vectors, "ax"
>     ++ .align 11, 0
>     ++ \label:
>     ++ .endm
>     ++
>     ++ .macro vector_entry label
>     ++ .section .vectors, "ax"
>     ++ .align 7, 0
>     ++ \label:
>     ++ .endm
>     ++
>     ++ .macro check_vector_size since
>     ++   .if (. - \since) > (32 * 4)
>     ++     .error "Vector exceeds 32 instructions"
>     ++   .endif
>     ++ .endm
>     ++
>     ++ .globl bl1_exceptions
>     ++
>     ++vector_base bl1_exceptions
>     ++
>     ++vector_entry SynchronousExceptionSP0
>     ++ mov x0, #0x0
>     ++ bl plat_report_exception
>     ++ b SynchronousExceptionSP0
>     ++ check_vector_size SynchronousExceptionSP0
>     ++
>     +--
>     +2.7.4
>     +
>     --
>     2.7.4
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>

