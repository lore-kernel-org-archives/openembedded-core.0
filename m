Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0048.outbound.protection.outlook.com [104.47.42.48])
	by mail.openembedded.org (Postfix) with ESMTP id 26A4171957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 20:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=nDEe/M1vvcqFKVbvirxch48hNHKZmJR2jxnaQwFg6fE=;
	b=qypp1RGwmXW24U/h4dAANED2ArXPbwyUPhJlpNQgBUue+YDAA+Fo370BToVuIEtBRG90aVuhH/dhhMMYKkgdiRI+328lTzxDFkc2fU+KYiWuvDZbmdwXVx4ZQe80XzwI4EXrbt1HDMFuFDYLQ8dRBHqq4puXbtXrOnlLouecYTU=
Received: from BY2PR02CA0117.namprd02.prod.outlook.com (10.163.44.171) by
	BN1PR0201MB0708.namprd02.prod.outlook.com (10.160.169.19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.860.13; Wed, 18 Jan 2017 20:16:48 +0000
Received: from SN1NAM02FT003.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by BY2PR02CA0117.outlook.office365.com
	(2a01:111:e400:5261::43) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.860.13 via
	Frontend Transport; Wed, 18 Jan 2017 20:16:45 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; topic.nl; dkim=none (message not signed)
	header.d=none;topic.nl; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT003.mail.protection.outlook.com (10.152.73.29) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.803.8
	via Frontend Transport; Wed, 18 Jan 2017 20:16:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:56921
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1cTwex-0007Ow-JL; Wed, 18 Jan 2017 12:16:43 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1cTwex-00046h-Es; Wed, 18 Jan 2017 12:16:43 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v0IKGgdL031762; Wed, 18 Jan 2017 12:16:43 -0800
Received: from [172.19.131.25] (helo=XSJ-PVEXCAS01.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <MANJUKUM@xilinx.com>)
	id 1cTwew-00046b-Q3; Wed, 18 Jan 2017 12:16:42 -0800
Received: from XSJ-PSEXMBX01.xlnx.xilinx.com ([fe80::c4cc:6661:8e92:58bf]) by
	XSJ-PVEXCAS01.xlnx.xilinx.com ([::1]) with mapi id 14.03.0319.002;
	Wed, 18 Jan 2017 12:16:42 -0800
From: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
To: akuster808 <akuster808@gmail.com>, Nathan Rossi <nathan@nathanrossi.com>
Thread-Topic: [OE-core] [PATCH][Morty] binutils-2.27.inc: Fix alignment
	frags for aarch64
Thread-Index: AQHSRQxC6X/0Yp8zxk6DeL+LStz/waE7t4KQgAMhiwCAACoYgIAAQ0gA//++rfA=
Date: Wed, 18 Jan 2017 20:16:41 +0000
Message-ID: <14EB1FFCA0C8D24A8B04EDEC1EA78C2453DCBCE7@XSJ-PSEXMBX01.xlnx.xilinx.com>
References: <1479848501-5451-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAMKF1spiS9_qTRf2_01rVRTfwKLoZ+WDYm7Hy4_Dr5On7eDLXw@mail.gmail.com>
	<14EB1FFCA0C8D24A8B04EDEC1EA78C2453DBB31E@XSJ-PSEXMBX01.xlnx.xilinx.com>
	<05c7dfd0-38f3-b684-db94-38121b086a67@topic.nl>
	<CA+aJhH03XW19tEX5nP7WgoV6au9xmms6GuASEHMmRvA-1qhh8w@mail.gmail.com>
	<ee6f0244-0fb1-ad27-6056-a358b5eb0112@gmail.com>
In-Reply-To: <ee6f0244-0fb1-ad27-6056-a358b5eb0112@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.1.92]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22830.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(39840400002)(39860400002)(39410400002)(39850400002)(39450400003)(2980300002)(438002)(199003)(377454003)(24454002)(13464003)(377424004)(189002)(55846006)(106466001)(47776003)(626004)(5001770100001)(189998001)(38730400001)(39060400001)(5250100002)(8676002)(81166006)(54906002)(6306002)(81156014)(7696004)(229853002)(55016002)(2950100002)(5660300001)(5890100001)(8936002)(2906002)(356003)(50466002)(7736002)(4326007)(50986999)(76176999)(54356999)(102836003)(3846002)(6116002)(2920100001)(93886004)(33656002)(92566002)(23676002)(2900100001)(305945005)(106116001)(63266004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR0201MB0708;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT003;
	1:THnzuO9Fn3tJ0Xp0KrV9/G3JIFUvQ9AVcJTDD9/lD2SLgdrmApgWJNzAn0M7E9i/a9Sb0T0v4Z82d3XOTEpN07NwCoKcCvpett1vztKCS403dJ8ETGwYjK5efSTqoNl9FsrbD9DcFfOGmD3+IeE1nVh/Mt68qhy4fyuN4GGQTyDbEa2Oz46Q3hx8Rz5tV55DkY6gLvQqRtsxMGVrXLWQiatE2mUjLh6RXkRElFfOC6XVRPLn6zvfY/1DVqrK354PTrVUdTYn8Byg6muD345O8i+8NsGLnmcwMxm5w/wge3QFw7LpEAdfGpqrpM09nix3+nPScL5H1AArOHU2UezHvPghlM5a3XwTF6m6vb456sJIvGHIEdorPtEFo++knBTKBGzN4YB2UTYe2Bg94BEeCZ0hJZ63hYVvGPfwdFBD5US9F9t3VZcfk6RBH2OLgWuA7Hs2DSVF8sFZdKsHc57VSDlLRSaKYEFJOpHXgXLOXPNg2qDS3RnHYrGDpJpkj9yG/d1PU1rjIekuggoXozEef/kcrfWRjJtyJ90LekjeL1EoB8vCisgcBbpiTrWlCLpDCAnmxMGUJZz5ss0G8yTWiA==
X-MS-Office365-Filtering-Correlation-Id: b44e85c6-ffbb-43e6-4e78-08d43fdeec19
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:BN1PR0201MB0708; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0201MB0708;
	3:Aqcob5debEsjCGC+U0FX64MI1PIfvrzxOAtrf/waZdKxKbNKIv6/sHOuD79qJj8MxtWRymyY40P/3+o41gdGVk06OJvkoqSKPxgNJow41zbAObHD6e/q6duRgYUuqomLj5E6njOcwTz9wWqN5DBG2SIkwD0d4eqVYoFF+OOh0nfgNpHuK5hl1xQS4wmRxh7NBY3NlUoDLLMn9Opdc6nDYNS3Z/epNhlhrK8FpUIRmRHe/gLemLSbYPBsGXfhHHNgiQMUbxyrcZbPQEJsb8OE5P0Gz0qe3McBgzYWz09aETefnGq70Q3G6NMrVZ4TZphohgs5oMOgHKyxHuKm8dU/jHYJYbfsHZAzzYIApoL0buAcmn7rXUCLxvqA7YfS3l0ymRgabU4XP0CH7woCvDtliQ==;
	25:R/3c0D9X0SVK9qqGMXBlx/YVgyeebHSZ0o2o9g5rWjGo4jIUpizTCsT4fYG1xl/cuiToj3prhEnnLrSs2TBF1TFP3LjMykB+QwFYTpd0j4iU0ZYxOfqyNbF/ec/eYzw8sDR1sM0VBMMEUSkFNIJ0//vJUbX295ivKJVgFNVXvZ+HWvZLGThDkdkOy5/2SolnWiuw7wO9QWiP29I8RpXlop3zh/IRMAlO+7cCUS3ExDNJ1r2o9/Sy5YyOHqevOHS+man1eiESS8BQeFnEaUkGh+pyhJ0XO+LGYaMpN9y5o59O/YvIKRDW8MW8eHD/yyuD9JbPh+wbpsnlmWUMVISAuf2TTG707S75HC29VpJKVdxVltBOMGVm0tHDgdZlUtrO9JEY6bJZ+3BrSVxnlzZRUrnP3S9tgCj8vWD8tiBgkmBUNis88YEZ1CI72qGz23weBWDXPj1JVuZoUqX4RaRteA==
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0201MB0708;
	31:gGhYe8N646ZDbFV0kG4uxfD3Hzln7ZVeZm44epOiy9I7nS+SeEQ5793qFiJGqbIKgw7cno0+dXWfLVB9IWjDEKksy9E8hH+qAMIJj3C6UtzB59zei7Sd/6P/9kQszzdE2vxypBuDCwkD6JJvjkn1o2vFVRdFS65rQ5ucm7h/4l4VNE91hCnwwNOgQsJmLw03n4ef401dmL7IYWD/WbZOl6QqpwTbsWQnEBbQR4XvxFGZdkQ9Sv2MRJk/o/J13h2nWsTkLyPQlzAolBo2u7ebYg==;
	20:fEzuMdVxaGAOX3OIv5hqdnyP2zM5PYxmgAv+dTehPMv1ltK3H3zZ1GI2CHbWLbkBeRDvXYZN7LZJTPSY34pgiS65fHKYd0B6BUblO7kQsiRxc9QYcZQYV6FI21Gp5cNgRNJ9EobHEPOzQLwd292/s9ZanoVWuz86yICdemszKqoyY0RimshxBlm4gNQ2J0eX5BMJXRBUxW6i4mK6DYmNz5FkZhyKy//EOm5XxcaIGi2OQYDBOwiIaHjwFSu5ACMbY2f0x/QLnA2pSh6ZsgPQEbzjq2RTq/0rTbusLGhor//PCAsD5E/LnA58HAjkxvrkPSkPJqAqgCVPp7KKHqZKy634+ZHEA39ldXwBSK5xzpELR0X8n3IvQDkz4rNHOUQNz8LQFbcnZEnhoCrjnWmV2opUlqpH9tAucqmiMAoL1KVaqATcWz+Ke46aigEl01Y8fDRBDbFbGe8aq9TJtS7Bh2IQJnYuZDTiwFiFdCAP99SenIPXpoErsT3/TdvTEu23
X-Microsoft-Antispam-PRVS: <BN1PR0201MB0708E6DA3FCB475E14AD3205B97F0@BN1PR0201MB0708.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249)(5213294742642);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(13024025)(13015025)(13023025)(13017025)(13018025)(10201501046)(3002001)(6055026)(6041248)(20161123560025)(20161123562025)(20161123564025)(20161123555025)(6072148);
	SRVR:BN1PR0201MB0708; BCL:0; PCL:0; RULEID:;
	SRVR:BN1PR0201MB0708; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0201MB0708;
	4:nXUnrlkLEqhRvkyItEwJJ/vAh2NDkVlFy1gcsTf5ncdsPiPE8ayZ/iWj3MH+UTFWSw9cTsDdMd6UII8+TBjvRiyZzYCuvLm7UgvaioVHpLpjplWaQ4uqbjtN0nrL/EAXiE2ZqxCqMSQ+OpO44j2vpHRCwCSAfACVqtdv3FJMx4w/TxVEBQ3LWza7O87XBMjPtgFcpc3Y7aYC6rWUj0BhTUxuX3QqbmTLlwXluZ7x4AFREUhLOrLuwHaHYjRN328AHaVY6cwDYQxGVjyYhAyDAMo7xNDNPgAhqPfPeZ2ywoMf0xt72ICWi8tdFr4hNAszjbfbI1j5QK2dGPnvE1tMELweHunn3CnvJRws0CyqwbiMcFSmn4sNjEGkpgEDZSWIoimXokMBhvVGbtpRJcJ+sqpEtIp8x35t+aTVvh2SZN2eDTdNqPsV577QBZG9JgxSHYI4nnZe0BU1y+XjPzVyIHGW8mu8kH6pHQsoWmPVQbdu8VHRG0H6eIUdlju8kGjBiLojeA+q5H88y7BS8/fWeWGbYMKC9odhcwb6cJ2hz5UD3A1YFo7e714JlwhsqSzXGjfyXwrj0JURZfsRhEVe3MfBpGYzrAuOImMicfuRlZcLcoCw2AVzG7OrlSeBbgvQvOJ3qao1b+K/KoaYdtaQq5pOPcRbe/1rUqDnElyOcdEN0jHuVfj6ju3N1UPkFG9e0MCs6AG0HEkNysuEL62jfheWFq4ifdzqtt45tvUDa1d53zK3Dp9owzFNynJKaDZKzuUUgjWkmnA5lIfGn/sp1g==
X-Forefront-PRVS: 01917B1794
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjFQUjAyMDFNQjA3MDg7MjM6M2tLTDdrNHVCVEEySS8rMldEb2lOaHUr?=
	=?utf-8?B?T3N6RFozVXJHNGZUTHlianJTSHcwZjhzV0xVMHZDMlFzL2pNbXFhMGlIUnQ5?=
	=?utf-8?B?OFNwRGpzcUk2UDU0OFhJSElnZGg4bk1xWkRkRUUwcmgvZmNPYmpqM3Y1VmFw?=
	=?utf-8?B?NlM5Ty9jWjBHaFQrQ2VMWk9nczM4am4xbUtidUsyVUloY3o1cE8ra1dFU0cz?=
	=?utf-8?B?Ty9Zc0RsVFlUblY1bnBmYUc1WHFncDZPVDMvdlBtdldjbzdhT0NYbSs4NUJ5?=
	=?utf-8?B?V3JFV2YvNFl0bmtnOThEdUoySzhVb3gzcnh0d1ZhNG1PV2FKbk44aHpLRThJ?=
	=?utf-8?B?cFNMdFFFLzQ4WFUzaFVTekRJNVJwd3hPWUc3QUd0TnRSSUtxUE5sMVVuaVlN?=
	=?utf-8?B?QWlGSDFGRmV3VTVtYnRxam1hbUV4dnVBUEF3VjJLYWlhaEhyck9TVitIYUxO?=
	=?utf-8?B?ajU3WGZUR0VvZlEwbzMyRXNjUmRPVXMzQUVEd1BaY3MwSlFDZDFWczNuZHBi?=
	=?utf-8?B?Y3R1OXRONVl6c2tqeGJqeWNiRHJpYkFpZVI1L3Brc1BjZlJOcWlVWkVkNGVC?=
	=?utf-8?B?MVdFdnMxYjc5ekMvRk1rb0JHekVUUy9WaTRNaE1RVkdUQ0xJOE14ZGVicFJG?=
	=?utf-8?B?OE9KcC9lT2VKeEtLWHF4Tko0NkUzWDR5SExpVzdlWUNrZzJWR1hhc1d0NkVk?=
	=?utf-8?B?UFNTckhiaWxzem5mTS9KbnZFTFZjZDdMdVBBY05vNVNxZW1HdWxDYkpsTkdq?=
	=?utf-8?B?ZmJjRmd2NHpwZFFOMlFEN0RSOVhDNkY0UHYvZ3hzYXlKd0RIeXFBNG5HeGdI?=
	=?utf-8?B?QVZBcU1EQXNxVk9ObEFVOGpmKzFBcDVzU2ordTF2OG9sVDR0a1c0WldCYUhN?=
	=?utf-8?B?Sy9QS1pIU3hCREN1TVZ5UFFQMzhTd1RjOWtCblljYmhweWVQVXhJU0oxL2xr?=
	=?utf-8?B?blBkU2lBNnYvRjdRZ1FTaGJ3NkQrWU5rTEEwdWMzakg0Uk5YeEczeC9MZms0?=
	=?utf-8?B?c1djZ3ArR2g1cURXaTFuanJjQWZCelNvemNURTc1anRZTEdCN212a2Y0RkpX?=
	=?utf-8?B?VzlPUEdmRjgvWGdpQ0dQM25LOXVSellldkNyUER5VEZMbmM3T09NNkYxTHU0?=
	=?utf-8?B?QnVhL2w1WllZem5jRHNEOXhYbi9PWkhnNEpuQ3FjMVRaYW5IZzVwOUxFZTB4?=
	=?utf-8?B?SVptYzJZallqdjNsTE1wZ3hCVkFzU0lkc0hpeStQUmRRZlJCMmFlUE96TnpF?=
	=?utf-8?B?dm41V080WnRZRVNtYjRGSlQ1QW5ka2x4bUxYc1N4ZHNXSlV2a1ZMallScW5C?=
	=?utf-8?B?TDJkOUVZL0VqbzhRcjIrMHBUY2lFKytRRW0yWmtrOFUzZ1R1TURaK0UwSGZk?=
	=?utf-8?B?TUFReldkYW1UNkFHMFhkSkh3cG5KbGhvY0JFTmJDMUZFaGFhNmhUYmx4dHor?=
	=?utf-8?B?ak55RmYwOFZzWFpuVEZiUHdPVEpkdXZsU3lEMTU4Z1A1ZGRCSFUxbmZqZVJK?=
	=?utf-8?B?TzA1bXFLaUNuK1lXUGNXOWJVTGdXWnBzVkdQcmN4WGIwQWdtanJRVXFORHN6?=
	=?utf-8?B?WXJVS1RyQ29oT2l5d3JDUWZzdXJJaWoyakpzdUdpOWVIeE5VaytwTklNVmYz?=
	=?utf-8?B?cGVNR0dXUXBES1hwQ3oxZmR4LzVnMVVnNTU0cGZuTU4vZThObVRoditHbnRy?=
	=?utf-8?B?WW1NWjlERVZ1c0Z5aVNLbkJ2eXJlNWdMSVJ3MytHSHlRWnJ3QkYvaUl4L09r?=
	=?utf-8?B?WjFPS3UvbDM3bUh5NE1YK1I4V3h3Z056QUFTcjhpY2NwUUl2YWlqakZJZko2?=
	=?utf-8?B?YjRBRkVqdlhVNHRVVklyM0NtSjQzYnMvdkhmL1ZmTHdjOE5mOUdUdk1SOHF4?=
	=?utf-8?B?SG1wVldReWtoQTRQTHRGTTdPQUozbzVUNll4bGhxY0lQZlBXQk5ZSndFZmYy?=
	=?utf-8?B?cHJRSTUwL25VR2c9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0201MB0708;
	6:QpsBw1Is/DDe6mzr2H2rmF8pRcEG08AhrdKDBF7tI3PC6SHRdOiTkuS+XDd0FSLBKpmFf/X/YQwhBZ4TX3/iv+ZSF0xgfmvHCiykpCMqZlMPepTy0N4PaX5nHiGvD0gCWthHL2/6K+GZUFea/WaBWBJBQ8o9JW4GXdeSPvmIFelV89mW631WtreIpz0hfVUH6FV6Fig6LBWpaUOJlAbBNGLYBa/R6soR17KX0ldFrXNNjBNrAKX5xggwizzdbcIzqr9oNSuqg1C/bdDr0exYCtYO2KL4lpe0aCU0/4VwO1xQYS2WopjhfQL508VJJsal368634DNh9ZWyYPfdSYVFdjmehbY7iHQdepiuRL2aKHbV7/HjeTCEutDKpNPV0gK96g8fXXPI1TFBkhh3oUzZCNkkwbbRUQrVdD3l5WSnOzQln8ZLP0p1M7l1uEdknNzOovU7B3mGrK0eM9Z5Agzpg==;
	5:sA0GMPbSctAYLadQpIpX2clDvB/rQQTkoV4Dk2z9R66nWc9iHbAFQjWXJVD8b0yraNnVEGCkxqA4dONQ4Pp6hJQyv/x8EBf0wgTS84K4a0Z/jdBIEJFJ+ipr3jj8kEMeJHdWfmugzmYQP8GSlSEdCo5PTlFQowuaxKUebYmgfJs=;
	24:5PlcjcSxhyvKQYMRLnrgYWVNYN+Sdp4O1CaO2XgV2gsTLMFXQGxBB77/1SeBPCLZQJ2ondJq7Yk9oE8Ol75eFec0pqu7w+HPjFYmiOV2rGY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0201MB0708;
	7:fYUlqmX+wdho8huDGX3iIU/FQQCjGbjXqWzUPUT/jK8BaqfqDAJ8aqiEEDg4gYACizmS2GFtF0JJeoU0vF+6KwTCriF468iP6YdMRXQmaYVu/r64KF/jjnbxOGc0QitLBOty2yNQPahNMd1I/Vd6ifeVVWRtS4OkUl47loLvnus8l83U10glH1eNMnIraIrQ7kDRlqqSB1Qla13ZdI1KMd24PriDGmJUPHJpX8Dt3HeVoMKkG1Gqy8WoBQdVC3Ozusz7bcfoVikSJ4KmeWghS/7Wa/UI6sWgrSQcjLqMjVMNhkVD38GN4CP1Rvca8AcvYbL41N8QjPHa1weM5Cradz9Lq5ElSyZDLI2g6/G8TU7sYVBpLcsaEbVBwjTzwI5IbPGddso1TCFaVuiE3Kr4oEKh5bimSupRcGf0fFzPdUzSb/+J6yFJVwFBgrIEa0ZTodJmsPxT1wCnjotQI0/Wcg==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2017 20:16:43.9641 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR0201MB0708
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	"openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Wed, 18 Jan 2017 20:16:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYWt1c3RlcjgwOCBbbWFp
bHRvOmFrdXN0ZXI4MDhAZ21haWwuY29tXQ0KPiBTZW50OiBXZWRuZXNkYXksIEphbnVhcnkgMTgs
IDIwMTcgODowOSBBTQ0KPiBUbzogTmF0aGFuIFJvc3NpDQo+IENjOiBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBNYW5qdWt1bWFyIEhhcnRoaWtvdGUgTWF0aGE7DQo+
IE1pa2UgTG9vaWptYW5zDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXVtNb3J0eV0g
YmludXRpbHMtMi4yNy5pbmM6IEZpeCBhbGlnbm1lbnQgZnJhZ3MgZm9yDQo+IGFhcmNoNjQNCj4N
Cj4NCj4NCj4gT24gMDEvMTgvMjAxNyAwNDowOCBBTSwgTmF0aGFuIFJvc3NpIHdyb3RlOg0KPiA+
IE9uIDE4IEphbnVhcnkgMjAxNyBhdCAxOTozNywgTWlrZSBMb29pam1hbnMgPG1pa2UubG9vaWpt
YW5zQHRvcGljLm5sPiB3cm90ZToNCj4gPj4gQ291bGQgc29tZW9uZSBhdCBsZWFzdCBwbGVhc2Ug
c2F5ICJ5ZXMiIG9yICJubyI/DQo+ID4+DQo+ID4+IEkgbm93IGhhdmUgdGhyZWUgcHJvamVjdHMg
d2FpdGluZyBmb3IgdGhpcyBwYXRjaCB0byBiZSBpbmNsdWRlZCBpbg0KPiA+PiBtb3J0eS4gSWYg
aXQncyBub3QgZ29pbmcgdG8gaGFwcGVuLCBJJ2xsIGhhdmUgdG8gYWRkIGEgYmJhcHBlbmQgdG8N
Cj4gPj4gdGhlc2UgbGF5ZXJzIHRvIGZpeCBpdC4NCj4gPj4NCj4gPj4gT24gMTYtMDEtMTcgMTg6
NDksIE1hbmp1a3VtYXIgSGFydGhpa290ZSBNYXRoYSB3cm90ZToNCj4gPj4+IFBpbmcsIHRoaXMg
aGFzIGJlZW4gYXBwbGllZCB0byBtYXN0ZXINCj4gPiBBcm1pbiwgeW91IG1lbnRpb25lZCBvbiBJ
UkMgfjEgd2VlayBhZ28gdGhhdCB5b3UgaGFkIG1lcmdlZCBpdCB0byB5b3VyDQo+ID4gc3RhZ2lu
ZyBicmFuY2g/IEFueSB1cGRhdGVzPw0KPiA+IEFsc28gSSBoYWQgYSBsb29rIGFuZCBjb3VsZCBu
b3QgZmluZCB0aGUgY2hhbmdlIGluDQo+ID4gaHR0cDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2Nn
aXQvY2dpdC5jZ2kvcG9reS1jb250cmliL2xvZy8/aD1ha3VzdGVyL21vcnR5LW5leHQ/DQo+ID4g
TWF5YmUgSSBhbSBsb29raW5nIGluIHRoZSB3cm9uZyBwbGFjZSB0aG91Z2ggZm9yIHlvdXIgc3Rh
Z2luZyB0cmVlPw0KPiBJIGZvcmdvdCB0byBwcmVzcyBnby4gSXRzIHRoZXJlIG5vdy4NCj4NCkhp
IEFybWluDQoNClRoYW5rcywgYXBwcmVjaWF0ZSBpdC4NCg0KVGhhbmtzDQpNYW5qdQ0KDQo+IC0g
YXJtaW4NCj4gPg0KPiA+IFRoYW5rcywNCj4gPiBOYXRoYW4NCg0KDQoNClRoaXMgZW1haWwgYW5k
IGFueSBhdHRhY2htZW50cyBhcmUgaW50ZW5kZWQgZm9yIHRoZSBzb2xlIHVzZSBvZiB0aGUgbmFt
ZWQgcmVjaXBpZW50KHMpIGFuZCBjb250YWluKHMpIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiB0
aGF0IG1heSBiZSBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCBvciBjb3B5cmlnaHRlZCB1bmRlciBh
cHBsaWNhYmxlIGxhdy4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgZG8g
bm90IHJlYWQsIGNvcHksIG9yIGZvcndhcmQgdGhpcyBlbWFpbCBtZXNzYWdlIG9yIGFueSBhdHRh
Y2htZW50cy4gRGVsZXRlIHRoaXMgZW1haWwgbWVzc2FnZSBhbmQgYW55IGF0dGFjaG1lbnRzIGlt
bWVkaWF0ZWx5Lg0KDQo=

