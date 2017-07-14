Return-Path: <sorenb@xilinx.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0070.outbound.protection.outlook.com [104.47.32.70])
	by mail.openembedded.org (Postfix) with ESMTP id A0AE9781C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 08:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=VbLIswSVvISIzzyhAHsoodD8xv7b9hAGEAOamGsAkME=;
	b=nKplLtW9HcMFuuOV03xWfAV1snlKNbrNX9lV7RgYHUGL5lxCuw4zCy8+F/aYoJsHm9c3+M8LIKSAth5F407RQ+SyIxSvJteOqJZVpbGy8858lgKVlfw9Ii7rqhBWd0QEmpKlYE1CfK+AoZDt7mVmDxXSf+oJhpJIivDO/QL9pCU=
Received: from MWHPR02CA0042.namprd02.prod.outlook.com (10.164.133.31) by
	BN6PR02MB2724.namprd02.prod.outlook.com (10.175.95.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1240.13; Fri, 14 Jul 2017 08:42:13 +0000
Received: from BL2NAM02FT014.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by MWHPR02CA0042.outlook.office365.com
	(2603:10b6:301:60::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.13 via
	Frontend Transport; Fri, 14 Jul 2017 08:42:11 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; windriver.com; dkim=none (message not signed)
	header.d=none;windriver.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT014.mail.protection.outlook.com (10.152.76.154) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1240.9
	via Frontend Transport; Fri, 14 Jul 2017 08:42:10 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1dVwAr-00076t-Pw; Fri, 14 Jul 2017 01:42:09 -0700
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1dVwAr-00006I-MA; Fri, 14 Jul 2017 01:42:09 -0700
Received: from [172.19.2.240] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1dVwAq-00006F-MJ; Fri, 14 Jul 2017 01:42:08 -0700
Date: Fri, 14 Jul 2017 01:42:08 -0700
From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
To: Joe Slater <jslater@windriver.com>
Message-ID: <20170714084208.5orx75lioo6otme2@xsjsorenbubuntu.xilinx.com>
References: <1499991861-19044-1-git-send-email-jslater@windriver.com>
	<1499991861-19044-2-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1499991861-19044-2-git-send-email-jslater@windriver.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23192.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(39840400002)(39450400003)(39850400002)(39410400002)(39400400002)(2980300002)(438002)(377424004)(24454002)(199003)(189002)(9170700003)(1076002)(4326008)(33646002)(626005)(110136004)(6246003)(2906002)(38730400002)(4001350100001)(478600001)(9786002)(85182001)(966005)(2870700001)(106466001)(50466002)(85202003)(6306002)(83506001)(76176999)(189998001)(356003)(5660300001)(23676002)(57986006)(2950100002)(6916009)(47776003)(305945005)(54356999)(8936002)(8676002)(229853002)(77096006)(50986999)(81166006)(63266004)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB2724; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; MLV:sfv; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT014;
	1:a1Z6LnieLwUBVhA1/a53ygZHMB91dJDJblpMSn0mgOhyes7guE1p2NGpjFabnlqx8q+LwskyIvcJJROgjKK/rTxY0xgP59Wk6KLQE+vTqMiXF5T2kllCa54/BQ6imW+5V7bcAL2VHtZxYUeYtSwR33RD0ZgTdCdjU9tgk/6E/lBffLMbvtZ0BCn070htQtMP01hi+LsNV5sWxhUUwQtxFtZyPtFLRVJ/JqnCdEqf1bVbSeduZ8EF5H9YUmqPyRu8KKikcyWPmoCOpVu98U+rArv4YFvksAJmflqHd3wAG/1iTf/wI+6TQjTpOs5qUat7WPQFzsBOgexso9nEMXbu/6Dm7LLCCeyK18vn1NhhRG/gmaEECg882kmENZOp+HRu4lXUtV4qiaSW9w9kFi9N7Sp1yVIoIYqo2Bf3f25hhc6uMm72XLXxkGr7fTfIeAXorNNU+vNZFjn0EfJ1mct8FYAB4SPLWZINTUp718Evj5RLwJ84m7JFFtP/wLhPVLf0lY1iD/QLeN+tTvsairfzs56nDQVUo0P2OAjZ0A4BlhnEsvYCF/mbIAk+JaHBnuUAGTpUzz/2A7WrWI5u4Sj6b3a00+L+IKPp9g6ygHRlSeEBy1oue+nAZL3jPgGXnnUfNZJezCfn9MOuHNDqzdp3/V6jBp3Mls7v4sQixVBd0QDktTOuy4cICL4rNI9VOHN8LfFUm9tAffsxfveccJWPgtkZ2bvD9mpJzycWeT00QVQag1AR6Jmw8SvCgyfEP8IrKoa29fmqY9Zdvh84qXPYj8lfPyomkuXpVvn2WalhZHSsLHT8yLfjHMSO3zciY2wQBv1vEpUWH64+vhejNj94J9/H80GLSftTwuwfh2YJxHM=
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb68d767-d173-4d42-ac24-08d4ca9437b4
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(8251501002)(2017030254075)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BN6PR02MB2724; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2724;
	3:f5buPCt+yAuMgVYIW2Um/9kFEgTYRbYl0iPUwxuOKSG/k+/A+U7oSWZkGjS8jpsy7V0Febq8C/LaKUZLwibALYwg3UJP+fSgHYX9GrEZGA9VIAvQXl7X/Y8OzIeywp0ykiROv5Zl3OuFUe6sS7CM29T7SFGA0zAUmxlkPC4KHvGeJEyhim2IX+Jw5d7rUeM/EsWD+tn28m9/GrktztO1hDl7A3yygrIE6dgfiX0KsfQO1Y+8acY9AYVAHa0n0y4CQodEM8u66jkOOvHLNJiCmciqyTToqW7+oRHqi/195IkJPu61rQCo48HWSAkRr9/HE1s98VXo34VaWiVfzzFvbwWoLogd0zsJYA0Gp+4JW7ShT+j5oyiLVuhMY2vYyk0k/jLNM2qHymEOPpTtsOHK+SzV4AdXxw9IYLrO9xNZjemztHHhrqsCS+XUxKBVp/XB6KV/APTiIwPCEaPi4lzD5O0mxWiQzR9AAoDHAx55UPikiNfYxjVhhhZX9mXc1DUkocMDsfEoYy8GR4zr+LFdfAg+sDA0BMp8CuG+iSkrtJjkTq01fP9fzj1dL1CHSKwFwjQeuYcbYEXkgS0qID8H/rjlfB5haSFDIN3V1ZIjdX8ZQQpdBt3/XcbOKx8YxPzEujG7rFxBo1HnKQmsGkZ1HyTVi8gNe++njRiLnrCo59fM3EIV24fPnngNBThY5pgVbFu2N9cPhY9xzP5X5Gw0BjxGjLeVkOfeo5xIQ5dgj3njUD81nmCO3VN7zw3DrBXcMYdcThbdc5smaAq4FzLdkM4i/pkb8LDZeB5/FBNEbZe2HLqpVj2IPHkZ+yKPAQBpOPVLWEzliifZwk1h4no5mjMQvOWi3XgKjTpIgAnVVLwbk3pzbO5baoaAxNbsS9TjWbEGocj/o2TyVlw8BNqBw5dU3LWwugJjyescp/EVSJg=
X-MS-TrafficTypeDiagnostic: BN6PR02MB2724:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2724;
	25:b5nrJEze7dTHtLhyF6FySQhBUErQVrwMmOLAUsLb3472bOasYltvYVXetOcbhF1wGVv8b4rjGFYFAvS9VAYz4VYRh0rTUyhy0i+8FznCnwWfrKwDb4sZJ4sEkpuwcJbgDhJGsNmpe26Ti2UXks5cY8X+vKyMKo+qpXQVhK88CZBcu2E/42JLrATGlFsIkFalQ+HXlveVel8j+VoXQ39QCWbqiIGsC2efZAxMhBcGQYvGhaWRujkg3k2XoG4M9s/17996pupCi8lmS5ASJ6+B+mMA4D45LHaXA8qyWiovRGc51R0b8qeEMVxxeHuHGYE+TLgX+f2eqHmnalXiUFU5PFt3w4CIEoeWI3LfMckiHcmlvS9hxkKEThXxd8zXtnN5Alryy+7zPkoW6J5PiirhUA9lXL+nAnsUY4l1omrLyJ0lZnnJm1t8L7dikYx6heGe0YlVaVNlUY+YUEH/O14c73aW3XBhLzRhFPWXaszdAv2URl5XU8A2/lGkLu099nDZil1J3WodHDOysBlP6dyZSjHZg4jfKX2flYsmEBs82TGNhkVFeBe9m25VsU+4Mn9rWQN1grQZjdLQKktWgb5T7QI/iPIFA4l5VdjTnfcBNDg+13ukshWE2Y3BlEEhasgkHzeWOJxBDRrnAoWrh435EVoStwK39nX7KE0e3cUHYcyIitgEKFfLt3ki8/erRcSSbHKL5SwkwU2VKZi/ynRrVK0S92nM3QfNaaHJmDzsJxTYSlg+J1dvjpQFyRO/yL59wybMhZ/N455HTIzGysEjeRTJCzPtDBxcwNKhsbBvUSGIU4opery/bZX6WHfiZUm+L/wfHeSb1cDiXaKrFfSTt7O0P4RGR9eTGW6cpd4jeZ47BDCEpcjYaqJXGJTI54f8Zqw56J55flsIDivARVQGf48JWCuWGk4HgSwFFRNn4RQ=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2724;
	31:NZsyES/XHhqjLPrWWjkaTA4i3LDza6n0oLerdtPnLq+Hi54q/sNBFNRwGYF+4QBTJU7zChU87k78K5QwSRZ0sjJG+3MxnsF+h5MVCnWPICaKBhthha+Y2UtdR182DwElm8V/ROol8bAe24gn1/H95j6tk1UpaeTqs5PAF/rSZ55a9Bph80CsKbBByfvTbLPIFbLSEY73hXTs7gVCgS+qgX0VLf/sYbRAW2J4llaA7r80gnS74+z3d+NmyiD0cgIPLDUianhnjqxIpuIOAiE36xnemEcQFlouVbHtJRK3VzcJ3QaPZvDb5xR1yo7BHaWb7wEJDt1x3eqOnVF1Tua+ADYRu5A2N4RRRq68mUsrsxH3aVht5OG2XgziJwKR3WI/psEtJZD+AVjYw9dbFecZ0ODDawU7i8fKkdpP4P3pRGztcBEvYztFdx9TcWfoP9B/NmR4UvrMj3JA7NKPne88ayEVOwZvl7sjEa472kBvJVcuE+rPe8ZqBrzlNx+bCTIjqWIhck9mlpyuAW8Lr8VODm4LL607FkOo2c6dlFoRnYWSc3g2PF8UHsp6dOBWTqaDL4+Ztd+o7r7mm+mKZ2aqPa9wwhSc8JG0oP+KJnRMlBu+jqo4vlzpK45Kd8PbCnYXikiyjotLIJXcP+2mecBFp79bi4S91AXJlZkbP59DsUe7rxGrt7/5lbPrJNo3aZUGQdNOH5iAUqqEjoIoiiutfA==
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2724;
	20:l0ECH/8YHKOP7VJ7Pl6dUTd4Eti3YENI9vR/DcX1jb+jqAk2wNkri8olA/1oLD3Y5Z+zcRq4F/g0xFHoWPqaQTYB7WbZ8yrsJ2jr+okVFhW+yX7aJFpxEClLPPWAV7sIAFJRdvm30jDFHs3ZcA9iRnUv/asGmW5BAiXtHOHwgCy9lbjdUWxtw3UJ282sOyzMZdZs9nuoaacqtBby/wRz73+gbEdTDb2j2i4a+WRQQt9TRMFLGKZ0OcwZrLQNds/jqCGScpe1BpY6/QLE2KwI60kjRijxavt6XxB+jKkBQVmajOyaoZWUqDAw9DRYEKCt7K4nUE/szjlyx3qyx2qrrWUrRZ6/pyPY2igWLX4LcUNSIjyiZ1QgOuQyvUXq+tBKRwzK8baaSJlo6LgcpbVy9OXstk2gtNErS7VRPC9M/zzEnro6vGepv+P6HwCkX1Fmsmp0t3bLXsykRgfcBKBnshvrKiBuMgQLcDmPZHXRUIy6zWVi8ZawqpAxGTyIlYF5
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228)(167848164394848);
X-Microsoft-Antispam-PRVS: <BN6PR02MB27240895F1B49B952E485DD1B0AD0@BN6PR02MB2724.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(2017060910075)(13018025)(13016025)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(10201501046)(93006095)(93004095)(6055026)(6041248)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123564025)(20161123562025)(20161123560025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR02MB2724; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR02MB2724; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAyTUIyNzI0OzQ6R29RUHZFQWI4UHIySnRvSzJXdnVnbEx4Qkp3?=
	=?utf-8?B?OEdTUkt1WGwvRVFaSHlLS0lDU1JVNzRmQlkxdGlBeW8ybDNFK3lsVTR4VHYz?=
	=?utf-8?B?TmwyZ0MvWlJoWFUrNm81ckJxYnNydkI4MnpMMkRCSkxtMmtXMHc0ZFhYVnFq?=
	=?utf-8?B?aVVKU2cwRWdaV3dZT01hMGowcW1DMStSQStWRGlnOS9NVzM3WW1RVHNvQ1E4?=
	=?utf-8?B?NHJhK01YMkdEQUJGeSs2Y3hwaWI1akNKdjRLL1RzTVhkZ1lrYmtyRVE5RXJP?=
	=?utf-8?B?U3ZnRzRXZHEzMTh5WE9LZ0o0NzVkT3ZMMkNkVVY4VmtkSzM1a01sTXlINGdS?=
	=?utf-8?B?TTdTcncxeHJ5NXY0Rm5iV2l0TTdhYldDSWhQcUcvM3J1dEpXQXBjTENEc1NK?=
	=?utf-8?B?cDROak5IR0VFbEZadGh5RU5wbkJlUUJwK2VMZHQ1SU5hWDJ4NWtzTEs5U0J5?=
	=?utf-8?B?NzhDYXlKYXJEbEdSb0ZKeGsvaXRVUlIxZmM3UmJ0Q1lpSGJKaVg5YUJnRDhW?=
	=?utf-8?B?a3lwTXlCN3lhcklraElQN25KVHFXTDRiZHJpNitmcFdGZWtaRGM3QktaOTU0?=
	=?utf-8?B?cFFVZERpY2ZkV2Z6b1ZxNTBxdG5mcWs2QmdPSmtCWjV1RUVXQ0o5Z0t5bnhL?=
	=?utf-8?B?MjZiWGgveUtIemFpeEdqUDFlU3hoc2pmK21nR01mVnEvNXYzUWFhcVRnaEMv?=
	=?utf-8?B?QnJLVURnR0VUNlU2SWVXYlQzZU5vdDBldXZKZGxneVhVaHZIM1E5WWY5YXNq?=
	=?utf-8?B?aHRVaGx4MDFXYWQ4c3Z6UmljMUxSUkZrUDl6Y3pzZ0R2d2o2aTVHMUxBME02?=
	=?utf-8?B?Q0w5aDRNeWRqNHR0SEFDWndkSitJekJyWWFFU1JMWmJoa0t5TUlXcEx4L2xj?=
	=?utf-8?B?bVdOdWI3ZTNHWWtxemxqZ3BpbzE4M0dQM3ltaUJBcW8rRHlMcDhrTkR2ZUhE?=
	=?utf-8?B?dno0VHhOeVkxSVBiaEg4SnV1VU1RalVGeTVlWEV5bzlGNW1TSTdXUHNiWkdk?=
	=?utf-8?B?ekFXQnZDdjZyZG5lY3JFazJ6UmRGS3Vqc0M2NmZ0dm5qTHZ4MHgwTkU5dXhP?=
	=?utf-8?B?SEFhb1dFNFlZUERIaDlMNkw0WHlUUEFBT0haUWswMTBGZVZjbEZvSGJGUkRu?=
	=?utf-8?B?TWlZak4rQjBGYTRJS3ZvdmNFZS9MVHh5SkErbVRwQ1pHYVFkY1B1Ulprdjlz?=
	=?utf-8?B?ajF2VWZkcGJCaUk4SGR1NTNRUTF6K3ZsSFZaSmxJSzR3NytoMG5TNk85UVF4?=
	=?utf-8?B?eDU3ZjZMRWZKTGcwRmM1OTJneDhBZ1lzWHRsMkpFYThzTGxwaWh2L1hjbEtR?=
	=?utf-8?B?Q3ErWGZtQm5kQWpPak5xZ3dmZGNPN2l0TXRDSnIxQTQwOVdjMTRnQ2JHMXF4?=
	=?utf-8?B?dFhqelV6OFdDYjJMZlp0L1h4K1Q0SFlvN05aazFpZm9qYmV5MHZoZWw4ZG4z?=
	=?utf-8?B?cTAzSDRKY3YyTHpQMTFtbzc5UXRZNEtqUkhNSElGbVlodWxXNzlTQXdPTUFC?=
	=?utf-8?B?emxidFB1aUJOYk44VldYYTdtNkhYR3pzcGtON2E3T05uTWVWUmNWbTdTcGds?=
	=?utf-8?B?MUEwOUV3bS9rU0ltbnhsMmhhOFIxMU91dFpSUUdqMzBydGozMVQ4TjZ1Wnlx?=
	=?utf-8?B?SXRSRUVjRW9FeFFMYUlWMUdmM085MUQxcjgzU0JWVDFyV0lHa3Q4TWFEVlM3?=
	=?utf-8?B?dWFIb0JsSVVhbUozWU94c3JKN2dBMm0zTnJ5bGZoV3dBbWZ2VmEzTFRPVnV4?=
	=?utf-8?Q?Qc79bBjktuF23kCclToR/NIXUNOlwOHVDfvw=3D?=
X-Forefront-PRVS: 0368E78B5B
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAyTUIyNzI0OzIzOnd5cDZVMEYyTy9RUDVBUk5hVDU0bTZMWmRt?=
	=?utf-8?B?MGNRRFNFVHhHRGFBakc2QVpMZEJJMWpqYW5ORVRtWWx4RmhnWlJWUWwydldY?=
	=?utf-8?B?M05UNDNtYnFVMXBaRGdIOGdmMGVETzZKY2trS0RtcjBsZ2RHV3NZaW5kcVFz?=
	=?utf-8?B?UnI5bXFyRzcwdUdPbzBBWnBiSXFYVWlZRm5QeVcwSzZsSmtIUXRXcW1QK3dV?=
	=?utf-8?B?eHc3OWRuNVltNkEyc3hRR0Mzck84Rkd5am8xenNaTmt4cnZQSVlCTTJKK000?=
	=?utf-8?B?RWw3eGRaaFRoMzFnQzNyT0RFdGM2aU9XN1YrdmlJeVJEYWRDL2t2REE4ZU9N?=
	=?utf-8?B?elJqTHd3Wkp4akgvRCtQRHRmMVcxbEh3QzNzOHFWM05McGFJN1J0MVJ2Rzhp?=
	=?utf-8?B?UUh4a2pLSE5FYlhmbS84RXRaRG10OXRYdEdIM1BCYm80RnIyOHdpdGJQK0Ix?=
	=?utf-8?B?T0xGT0xTNk9yVGhVOFlhdnQxVXlzVHhlWjV3dUdVMjhGVUdkNS9WUDl2bndt?=
	=?utf-8?B?cEZ3N0x4c21KQkRZdGMvSExreXh3VkY5YXFEMGZUN0JGL1pSMW1wUDRCVHlK?=
	=?utf-8?B?VHhyTEZFcURSWFF2ZXJNTTNDUk5hMDIvWkRSN0dQVFZ2WHR5V1FaQjlwTjlu?=
	=?utf-8?B?UDNrWmhHUWNFWVRjZmQyeFgzb3VBM1hLVGFkcHdIRk1uT1V4emRhUGJGcTBn?=
	=?utf-8?B?SUFyT3pCVWFLQWwvUWxrSWo2WkFFSis0T3ExY0tIalgyVG5heGdFRHVpRUdV?=
	=?utf-8?B?UDgyaWY5MkxraVlzc094c25WREhxWHMwaDVlTkVDaUFHMUQzSSt5OHBlWkJs?=
	=?utf-8?B?QzZaRFcvWVp1SC9LQmt6Q1M2aVRLMExxYklsRWtta3UxejNQR3pBVDZrN3gv?=
	=?utf-8?B?T3NnSjc3Nk9tQmVnVTZHRGhxSlc0THF1c3U5NXBZak9KVHBjdXpxK2hzcVRD?=
	=?utf-8?B?bHJKVzNrcjNyUzRYZXMxb0YvZDV3aXVvL3pZNDBvQlFLQW5MTXBvbUhDVTNT?=
	=?utf-8?B?OHhOclAvOHNlSk5UU2EvZXBpVUovK1UzMUxKdWIzejJuRExoUnlWd0lzS2R2?=
	=?utf-8?B?cWRVcDNMWWRiVE5HQkxFZS9kRUg0bytjdjZweDQ4cHpGOFFqL1VWN1gzcTc3?=
	=?utf-8?B?MmtRbVZQbmxKQnhtVFI5a3ovcTVyWFZldXJsMExvUzFnaEZFd3FFbDRlcUNp?=
	=?utf-8?B?MmVNN0poUGtiSGd4TFgySGlTaGxJcWlRVzFsRkxYbFJ4R01uT2RhcXA5MkdO?=
	=?utf-8?B?UlNzSTU4Vyt3Rm9JRWhoc293QWRSam8xNTd1bGpkdWYxN21DSGZEeGJvY3NR?=
	=?utf-8?B?SWRqTjhRZE8xWU1lbTBtZDNiNFB0VWszWVY4djRDekl4b3NjQlIwNnV2cDhz?=
	=?utf-8?B?TUg0U0tQa2FPRFExS0ozRVBUMHprL0pUcmVMWllnWUV4L3gxaEx2WVhhbmkv?=
	=?utf-8?B?TDFmSkIrb0czSXEwYmdkVDFFNjhMcE9UT25GWktueUVVdGtsbWJiK2lXL3ZO?=
	=?utf-8?B?aitFVlVOKzNmdWlFRHdlL1NGV0hjUk9OM2o2LzMyKzBwTUsyUXU2SVJKTTZR?=
	=?utf-8?B?NWxIYVZCbzRpcmF5dkV2NEdaWXNIaXJyMUozSnV3V0x4MXp1UXpTQVdsM3dW?=
	=?utf-8?B?S2tvM0xoamc1ZWQ1UTIyTmFjeTUvSDdQTzh1eHI3aFZmOTJJMXQ2ZTBSKzRD?=
	=?utf-8?Q?yUMR8tzbXBtLa/JwMVaXqjM/l+xdwbAnBzwHZqo?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAyTUIyNzI0OzY6dkJKSzIveEZpQmxSc25oRVNWOHBnelhPNkRH?=
	=?utf-8?B?bmo5VUVLQ2dLYUsvTTZqVGZuWm54WXBWdTIxV1N6cnMwSGpHeVpoaEtKa011?=
	=?utf-8?B?eFFVdzZtZWxyQ2JPbWczKyt1MFBUdG9MOXU5NklFeCtNOC9EdHpSL01jT0pZ?=
	=?utf-8?B?OEs0NGMvMkp3REVrb1RtTXh3NGo2TFF1QVZHYTRwdytEMHpkWTNKWUN5T2ZU?=
	=?utf-8?B?L3pHYnpmR1RpN0ErMzYvdUs5RC9VQ1haNjQ3SjgwNkpCZ0JVdEQ4NGFZZDN5?=
	=?utf-8?B?R0h5VmVSbXRuTnpwci85QVhNcmlBakNmOVNFMlhHdktva2xxN2hIZUFOY0cx?=
	=?utf-8?B?MWh2N012ZW0rUTBzNlBuY08wV3ZYVmNRZ3VuRDlaVXB5b2k5TmhjT3Ayd0Fx?=
	=?utf-8?B?Ym5aWlVNVGgyMUw3TGxzSmNqSHhnMTc0azlYRjZONFI1UVdGUEtoWHpqcVcw?=
	=?utf-8?B?Uit5TjNqUmF4Mld6c0lwMUZIM1lSNGZHTWNRS3B4eUZUL0w4a25vOHhMTith?=
	=?utf-8?B?YjJ4MHRTaVJNVm43TTdnc0lIZzZpKzJ6MXZyaldWV1YwclVjK1ZTd24xMmkx?=
	=?utf-8?B?WUNKV2toOWlMUkRoN3EwNE5mSVBuSC8xUjdEdUk5V09WNUFRd25HTWRxUEpX?=
	=?utf-8?B?TlIzOUJwY2Ira25zWi9penkrZnpWZUVwVktaSXl3WkMvQXByRFVFWENXY3pa?=
	=?utf-8?B?em9YYTdvQk82OVgvektHMXd2QTNmdTE2ZGQ0Ri9YNTYyZmxXRWNqME1IN251?=
	=?utf-8?B?Qm4wMlpCYllCamptQ2N6MmIrQmVBOE8rMEREUHJUTmE2SllYK3RSTU81U3M4?=
	=?utf-8?B?VjVjYTNaUFFjRUxjYTRxTFcxVTBZUmcydFI3NmczT290bWZnVUk3SmdpcC95?=
	=?utf-8?B?b1dnRTNFZ2Z1VDRLeHVMZmpIOTlTdUg4TURneU1IUnNWS1JHUzNMbWpwdDZX?=
	=?utf-8?B?MlhGQXg5TUxYQUFzWG9HN2RLaEtvRUJudURUcU53RDluWFF3TlErMlNhTmdO?=
	=?utf-8?B?STdSWmpDcEdYK2xHT3pVc1E5NzVBQmdqNmxzRXNBRjdobkQ1Q2xiNW03WEFn?=
	=?utf-8?B?REJuRWZsNEs1ek9KZlNlREJGQTNPdDM1WENVZTk5TTd2ZFRiY2kwSWRMa1Yx?=
	=?utf-8?B?b0J0K3BiWXYvdStwKzY4VFgrY1lVZE5Ddzk0cllRMTRsMHNnaXphQW1yQm9U?=
	=?utf-8?B?bk0rVktIb0VFQjdGcmxWZE5BL1pubFdDNkEzbUt1Qkk4Q0Y0YmQrR3RObUt5?=
	=?utf-8?B?MEtVb3RhbUFyTk9iWkl6L2RxOERZeTRyNGJBenE5THA3WDc1eWp1ZkdlazRl?=
	=?utf-8?B?bUE1OEl6S2hidGRrVWhZR0k5TVVaeit5ZDdXKzdNdXpCbjhqaFoxSjR5OFU2?=
	=?utf-8?Q?Uzl3Cmp?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2724;
	5:g82s5fUZta/i8ZosF219h3u/3LtrjnyDi2AUY9K86wBSY91vBEk5JsMPsqxqIJjiee3SU80ultOb4IIAHm4Ujx3SU4YFtnqEihuuDw9pi79LjOuFJ2LTYktKQhLWr3EK0y/dscUCmDG3nIbGrpf/8qNiZ+wNajcj2FZKqqzGdX4s7f4rzrM+/4+v49veKj9cJpb3JvOmNZ4HSVqwgK+GM9gZE1eskZNw0ISsi2NNtVwa+EIpHPIaq/43L1GK3B154+uD4IuFZMqcdqvs/d1E09eqNsY+KbJCc6ez/G6ML1DY0vxVFBJ7ajzKiLx+/gedegrOgIBPX2SldWaZrRagGuLb77Bavb9GZOyYy9/zjEP3eNbItWBYalZemxtcNaEaEJONb5IkX2VMzRqbr/bzPbJcywvHZjKbcBenbLCmzhl78TuZVT8eM4JiMxsY8xb0freD6V8FJsNPKKflqLQR778l/N0jSxrI3DgE3KvTgIGyaVWZ8QYCc+7nxPCx9zlX;
	24:fiuDcXEA8pMFzMIkSICfGVUWCJUCJB4GkkFG98OcLN2ijKUdiCkwFF1nvwBXNytGIE9SGFlqYvoDHhEP8cbjuqAqYDRq5De0/xWe1O6sXUw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB2724;
	7:KWhaAfquxGdiRHpd//Uw8xep75O8QNPBzjGhO+axtNnfu+Df8+CDu9udrpxKLeqMR58YLJKxJKKclx+fesRd0wlYljfusLBjbuZ7CKr3iJj0ArnwG9Hh3SlcEhb5lIi+beAzloc1mxji4wBHvcJdALlJhxApn6n/S80vYGvkpqjFffM717UqgYSu6jnrvXyAwDrSCkCbhFoVNlDie1r8mKCbtv6cN7Tju9UdpXu9chtBkQhg0N15cPNz+AYQwFz76p1f4ZUcnGMrbfQYeJbr86saWribfuKsKxsh1Wn9WTaPJssijKZ9Zu3T+kYS7sX+vak/B5+dGz2Kdy3KGg7D1bCV3fFG8RftHXX6+hASbSUJI0RTKGJaGZqiVRW3qU5rctTAOp0yHN5RL/qCX/rGO7aE1Hi8kOuqslzym2Wi+DFrwXjXA3p6OlC8pHDFDjWTR4IaCf8y9rSMCjlGRV8/VIzSCvDp1VKoOI443YC26LFVF40LePuNGcYqKo2Tz/A72CIRnPywDHxF4tr79X49kk25fd+uFhdfM8028vX3E5fwJ7cDF8gfhi5WyNkYRbD/2bktdQwG692XQ5RCTErB7xkfB0pxBYRiEXDlpZn+BunHj0I2cVe2Fghni7cVxjtfz+8zrjrK7kNB7hN+HHSEVHh1nGrvhDlYcrEr4fWRFsJrDuzF8kjPJ1J0IRxGcoWKIN8kOhJyG6JNcyUfExeBCAPfJSqO13Z0TGl8SUp/d2UM2sHnWQ6XYoOzsaP5l01kaBH9wc1i1HUJQeeRo74HfF3x5hVGje4KDQiOI43fiEk=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2017 08:42:10.2765 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2724
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] valgrind: allow version 3.12 to build under gcc7
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
X-List-Received-Date: Fri, 14 Jul 2017 08:42:13 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, 2017-07-13 at 17:24:21 -0700, Joe Slater wrote:
> Building for powerpc64 fails because of erroneous assertions
> that register r2 is clobbered.  This has probably been fixed
> in version 3.13.

Wouldn't it make more sense then to go ahead with the 3.13 update
instead of adding another out-of-tree workaround? That patch is already
on the list: https://patchwork.openembedded.org/series/7639/

	Sören

