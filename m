Return-Path: <alejandro.delcastillo@ni.com>
X-Greylist: delayed 458 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 26 Jul 2017 16:34:13 UTC
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id 62F5977D9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 16:34:12 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v6QEfJrs030149; Wed, 26 Jul 2017 11:26:30 -0500
Received: from nam02-sn1-obe.outbound.protection.outlook.com
	(mail-sn1nam02lp0016.outbound.protection.outlook.com [216.32.180.16])
	by mx0b-00010702.pphosted.com with ESMTP id 2bxw2j89j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2017 11:26:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=jwNR2q0I7kElKQBRdVjGTTNOys948Kz7SiXd1GZvjMY=;
	b=b7sweC+xGaZaDykUZBySVVE7IcWLd1bgSjxC62d6hyu67EdsLouiPb+3Wtj9bg0B/5U7pbPFk35/lPQeSv+cSuQY0QTFOh9c7+WR3o0VH5neGYyuB0YSAYULxcjSgG7CfOYZTTOQB5RGoayJa55W+c7Esl0oLW+mWftDejF4/dc=
Received: from [10.0.62.53] (130.164.62.126) by
	CY1PR0401MB1322.namprd04.prod.outlook.com (10.161.213.14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1282.10; Wed, 26 Jul 2017 16:26:28 +0000
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <1501061170-3010-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <c609be97-70a0-1717-b6ba-9a0e53420bbc@ni.com>
Date: Wed, 26 Jul 2017 11:26:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501061170-3010-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Originating-IP: [130.164.62.126]
X-ClientProxiedBy: MWHPR02CA0005.namprd02.prod.outlook.com (10.168.209.143) To
	CY1PR0401MB1322.namprd04.prod.outlook.com (10.161.213.14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 115915b5-befb-407c-ef4a-08d4d443116a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY1PR0401MB1322; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0401MB1322;
	3:alZ7ytRBQ2ctt7oVKS2MAbHL6U7Pp3iRjB0avji4KBzf2D/rSsCfnXtygQTEhKiFMtyzq9J3+kdd/ZsLZtps8m4bJ87AM/ykMJGA1ec7CSsH8NgjDMN2k8wDP9Cy+cQGIp08Rd1ZQf/5iKdgWiVS9ofBecDfxi8J7musHwvWv/e1TW9gito9n6iW6DeQc1IXPjIM7EJIHTIDd7fVW9KWxSF9Sy+d/Mcv1/9S9ksbu1cC9Z8v2ijzO4IXpUqmCJ9HmE/y9HWx2p42kpOy4lqTwgFooOmMLW8tM2NESgfQ6mzHpuOr0JJkRp72A2HVIlXC3rFKQUkK3N4wpdPQPfBOV6BgVHLWsRrYARcoXoilJZ56F25HgKPgJTLK3NHC2V3ISUrpS1VbUawe04HNQL1bcfbbEYHQFAk5vMVyNVTghSMwo3A3RlvsJ9l52AfAHLjYIsHRhuQbFnp2S08iehmTwuF6SbGH9DWvhNKvZXGHogjND1Z+9C0f/+Jsk1Xv/gmI3qcBsxb8ADM2xgqX3Njc+kk5+aErbvjV8tIIL905CtK+Ix9CAMd+PXyrGtS/m9Bg7oF5tZmGtG4qzyv3kmNJEQxXdEdMYagHcRGBTf6oLzLy1n6iLhkiWJ9UC5X+rY24LPe2k/rfnWurLwrMyrbkoImYMZhAGZ6s17shY9n535z46cy9a73CfoUZUvt7n6wvz4FC9Unlmqrgy8rQZwKXruQqSHEO8kQKzMFxcBtryYg=
X-MS-TrafficTypeDiagnostic: CY1PR0401MB1322:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0401MB1322;
	25:eLyFey1lSuwt7EXY/vdYVGKESf3FJfvGmKwfPTqddokaBaK0wPmnDLHC7o3N1ezeG88BTMXAuRekb0tMLG0+lmW7N0nxuHR7iDaCckO+AkKcg5JvPZKW4WQmktf0yZ+jPwVI14IT25SXe3kTYHVMeDT1Je/QLrEw+xhkylAkzoeb3JVag2BRkL3oq77j+GZ6Fr1bLc2yzt5WBJitF/6nTh7ZV0lAfbDupZShgVAK0NHKd6PJ0LPfekLcO5Bk70hrbM68PhTHtM9xXLHPy9egXvDz6gh+JSsTm0Y3w0S2m/w39iHa+iu8XI6geSbNsjqf9n1JZ4QqMu5BdNWktEU4eWSbvYiuIBkfi+FxUc3vaYXF6drMpLk2QlqybmzTZhnZmdRIWx6QBV8+/ZaPSvIFNkyVmgqip9z2/Kacs7E/gCrxxe0NTso64RiOMun3UW+CIuBXAbJGkbOiIYTQqP7Wn55Pr2eTr8mAy8P+GRy49ATmjxONiklZCOPJAZmZyPYSHMwh/v2sgkMDnG8+xxVj5gNZleGWoydhxZAFyT2YxOnzXAQJcvfPS8znUJWKqugNgqS6xBSktnaTqjLVHevRiYbKBJUnV9JWYH3UDEXtsUIQGnaEObzXhsjHP1cGERgN9l0A9irlVygjXkry3ubncIptlWpCUUHemZ5Z9oKTpJ6AsuEKoPt8fp5r0W3Vgp6l84W1PlkGQNgN5kKAiRCickyjoCSergzQyeUIZlHtsy4g0b00Xd4vCWy0kUUS09Oajzoo0TeONOmHU7VJi48E9vQYCPYijmjCPu4aaNJLwJEDEZEQsG0bPD7DUYmsH3w1VY9yENGXRE+99P58oUINOY26D/BodOd8TmKIEkQNCojAEEb5mQSkMKlFL2tAtUEOvTu1bWMz2iODBhDO7G138LizcIL0giEgbR9iBqAEtX0=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0401MB1322;
	31:sfm2kIU/09HPJO8XMPLKFi7RhotJx3tRRf67u+93MPy3tcMsfkJFYVbEdN8oNmImY67ayr8GUqVfX4lYqF0evZhQfNVVIlDpGCNqDpv0uzK73FQaAVKTEfZ9jJv8v/m4EvzsMryCjVKNbY5UnMW6sWABJchpOrgE3ugVe/Ip163S2+4jAktE/iQddNiHenvGpZvOSOOisPv5rtaDqsi8L/xPPixADiK9u6Dcg5mn4OB1qgkYcEg76pME/9kho3yIIAg7IbYcG/WMwn0Jk8ZYk4FURQlTZga3CwdJAaD22xR4Bj7mNAZ+4KqsHmT8I259MHb2ll/v5Zb5+NnLpd0SQiJ/acJSjV4Gp8o4kmSIOZW50iGjeNWKxfOM1z3snxjpGwbMqD0Pt6wtSCjGFMCXeK0s5r4ec6FJfQ4jtp+Dk2awb/Pi2YWYVNM1HDddrJoSTr6pbsjaYp3LEBGkFEbt0dRbF1IyMPDzK313uWguJrbI0pX/5aa7K1CpF8FS8Tu8n6w4kkeurf0YER/6p3Lk2c7iMtv0YuHxl9Fz99b/X3NnncnQcKZ3bX20mqJVU2bRpIWitOoQgSXdv2tbGasrOU3AmtQMb2iba+BV6xZRBXSoGs8PMLcJoUcVVeubda9BflRG6sGgo56/FKgYWLpDVPV6+NIx8iYeylxnmLDEFq2Yl4suE65bdZ6zJZuPDERQlH4f2APRvZIovtnncAAXow==
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0401MB1322;
	20:im2LXXK/Hdk+Ji3OUAHMmBNZdj3SdckPJn3KuXy6jGf3F25sF5GwCp1kwh6SaxQ52NhjjdT6GFkjCynUJKTiYwtab+Av43fmWxYor347DdvRmXtwUtrBtxJ6hFMMuw0TbUXjmuwONp5LF/yP0+Y/98RiaCW8MWf/ZdayH+6bf72QFM0FrYyuAZpIeaS3OPqxeDn8d+Y9MJj9i2wGk8OXsUWJ3G0P5J+kp39wdWW2P6IonSf5L7vtt5fTNGG0VxWJjIN9Do+rCOTR1bDUdoDGVL151bXMK5U/qnoLGFog9hY4QjLx9hFXZTrzvGkre4785gGYORnbHdY9KEvbP9SDIIV3CCqQY9LTWw1UM4PAbD+o30CXQPSEBrSS/72urSqzWCZo233/OwTUJy3hxbsDt/XkZ+fUEQvXId65C7gULUA2sNLmceVsvf4ICOcKeYwPrq9s5nbo4tyUmEsaQKZbSdNlDxe+cRnSDM5zSd2CHzlK5cYXmc43Cd9txvNcdFKVJ7n2H6c/jxZEExgiRrRg6PnC8unO/FTTeMzfIoHAN9iTseBxmJoMkXhuwwVl6CKrUJApL8k4QsRKzH8XH4Nhv6ZPOgaZq8ciQ8ByVxOmdsQ=
X-Exchange-Antispam-Report-Test: UriScan:(10436049006162)(170618885588394)(228905959029699); 
X-Microsoft-Antispam-PRVS: <CY1PR0401MB1322530C888591D36BA78A3386B90@CY1PR0401MB1322.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(100000703101)(100105400095)(6041248)(20161123562025)(20161123560025)(20161123555025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR0401MB1322; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR0401MB1322; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjA0MDFNQjEzMjI7NDpnN0pOc0xCdU5DQjVPK3o4RUZmWUQwVkdR?=
	=?utf-8?B?dXkxMW8yN0gvY2VaUG11TWVRckduTDh0NHlsTHVoZjRQYmo4aHpnNWh6UDhq?=
	=?utf-8?B?QXRVT0JPcHE5WFNaYjJ1TXBORFZFcjBYTEZKNzJnMHFBeFJUWjVZUHV3RFhN?=
	=?utf-8?B?Mzdidy82c09IL0ljVWFxdGVaRyt0TDVNenc5L2ZpRk9VckM4T0RiWVdpYmVy?=
	=?utf-8?B?V3JyTG5TZXRWTmkrQTc0bmlxYkswL2N4V1VHTGJ3MTloR01iWWNaZ05RVTJN?=
	=?utf-8?B?R1hSRlBDaTIwTE1VMnlmNkFBM09lS0QvbVVhU2ZvdjkxRkh0elBRTVBpc1dO?=
	=?utf-8?B?cCtBRTFpUFdCTVpodTRxaDlQVnJtWGphRk9Na3V0QSszbE5YeDhCaVJINzBY?=
	=?utf-8?B?ZGRZSldXd2ZINEp0dFZ5a2syMkVRQnlLT2lld0swVGdZRDZHdmlrY2ZSclRM?=
	=?utf-8?B?UlFsWGFjdG5FalJvVmhBNE5JME9pKzB4Q1Q4Smlob0NQaXdkajYzaDZsSmpr?=
	=?utf-8?B?V2VLckJDS3BrVFBKSHg0WTVrS25saHRjRUpZSHJyN2gwNHVObjhUN2xmZEl2?=
	=?utf-8?B?SEZlZCtkVlZSMlR3T3dPMWVoWHlhaVZZY2dEcmxRRWJkYzhjQzVmdlQ5cXpM?=
	=?utf-8?B?NFpRK1lNSnlHditlZTNBaTljM1ZuTDNLRWtGQ0xRc1MvZkt2b3ZlVVpMeW9a?=
	=?utf-8?B?aW5BeDEybmZXcW9HeEdHTXJoK3daeWVjTGJhdW9FSXZMWFpmZkM3dHJWUkpx?=
	=?utf-8?B?VzR1WXY3MllDQWhTQW9UcHRUTlhkdVpOYWVHQytBb3pudkVRQ2ZlbXFnVW5H?=
	=?utf-8?B?U3VHR0kzKzMrNk44MlVoNjdCSXVVaXd2aU5WTm9xWi9qNCtOd3F4TnNXdnRa?=
	=?utf-8?B?OG1NaXNuWTBKT3JTVWt4RFZ1a01KS1VXQ3pjUTd1RHlXL1dVL0VXc3lVMWNZ?=
	=?utf-8?B?WDhTdWo5Yktjb3JUSW5ZM1BBWEwyTmxzSG9GYktmakJxYjYvb2ovTjBDT01l?=
	=?utf-8?B?S2RydkpqVlZxMktJVU1VbzlEWlNQZGtxMXdrSENQY2pyMDRpcWtVLzlHUEpN?=
	=?utf-8?B?cDNoR3paRVd3QnFta3RyNUZRNDE1eFQwTk03V3ZwTjZKUTN5U3NhamlaejlR?=
	=?utf-8?B?c2tyK3MycDVQWndTeGpkSHAyOEZqMzFLSFZLekdrZmNjN1A1MGpGU0poTnRY?=
	=?utf-8?B?clpIOXlmK29DZ0JHU3dYN0FmZlhuVEVHU2xzRlFlZkNZUGt6SDNkSytzcWVJ?=
	=?utf-8?B?L09IcGgrdUxOemp1OXEvM1VkeEpzRFlPTUxsb1N3SGM3Vi9zNVBaeXlQeGtl?=
	=?utf-8?B?b0VZS1dpUHdXZi9sMXVlZjBNS1JjZW9sekVQUDk3Q3dpcUlBSGVvL09wVzYx?=
	=?utf-8?B?ckxRTjU2cjFxNFEzU09oYi9EUmliYVhpMFlLUC9TSmxEWGJwYU1lYit4MVQv?=
	=?utf-8?B?RWVvQ1M2WEpMSWdIY0pYdlMvZitHdUNQck9RYjg3OWtxODMzWlhLcTQwOWV0?=
	=?utf-8?B?bEh6bGlSNHJaKzgzdTk0ck03aE9rQW9NaCs1U3pyZTdCK3pBL2g5c3hLb2pX?=
	=?utf-8?B?eHkrcXJ5MHFCK3hic01oQjdIa3FHWDV5T0RXbDkzK2Z0TlROUlkyR1VJSGJv?=
	=?utf-8?B?MjFRUG5XOUo0bDAydnpUSXRuUXFrSzZrSWJjQjJUeHFDc012THJiRW5yV01L?=
	=?utf-8?Q?xhyYAq3oQga0VYy5Kag=3D?=
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(7370300001)(6049001)(6009001)(39850400002)(39400400002)(39410400002)(39450400003)(39840400002)(24454002)(199003)(377454003)(189002)(7736002)(478600001)(25786009)(86362001)(6306002)(229853002)(42186005)(33646002)(575784001)(53936002)(38730400002)(81166006)(230700001)(110136004)(189998001)(65956001)(66066001)(81156014)(50466002)(8676002)(6246003)(2950100002)(31696002)(6666003)(47776003)(83506001)(305945005)(53546010)(2906002)(65806001)(4001350100001)(966005)(65826007)(77096006)(90366009)(31686004)(97736004)(54356999)(101416001)(7350300001)(6486002)(50986999)(76176999)(3846002)(23676002)(6116002)(68736007)(5660300001)(106356001)(64126003)(105586002)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0401MB1322; H:[10.0.62.53];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjA0MDFNQjEzMjI7MjM6enJqYS92bWpNR0E4N2UzS3JvYkpFY1pw?=
	=?utf-8?B?dEdYbmVGMmRjcTVmVFFHaVowaTM2bjZPaWlwWTFTNGY1eU92bzI0dVFMYk9h?=
	=?utf-8?B?TVRlbzEzTmUybkZiVkJaWnAxN3JvSS9kd0xVKzJvTk94NjJOa2FvUTBZUG00?=
	=?utf-8?B?SDVBUVpxMCtKMXVoSHZIK0VqR3RXNkNuU2M0NzY0RWVURUNXaFI2Y2tvak1m?=
	=?utf-8?B?QnN5Tktsc211dTdNNHRsZEptazNjWFd5NXN5dTBFdEJRajJNR2twYTYwVTNn?=
	=?utf-8?B?Tm5Zb3dVUzQxQ292M1U0YnptMzA1UHNKaDlYT09GeDhKOS92dy9DZW1zWE14?=
	=?utf-8?B?Zk1BQjE4VmtNYmh1OHJndVozRWxlRE5tU3o3OHVTM29XbUJOZ0hXbGJsLzJx?=
	=?utf-8?B?dm50WllFMVRGUkNlZ2t6eUZCUk9Lazdpa2w4NGRFdUxrMW1ZS1JBUkZmOUh2?=
	=?utf-8?B?L1JOdzNjL2VaYTlNOHZLa0NtbWdBMDlmZytXWTBqb1U2ek9XR0c0eHNjS3Z5?=
	=?utf-8?B?c1N4R0dGZzd2QXc4bTVjS0RhMHZSTS9uQU1LTCtCcThnRWszaDR5SzdvSVli?=
	=?utf-8?B?LzNxbmhKQkMzbVl0YXl1RHlXV0REdzRsTGorSXhacURvU0dPWGc1NkFxZHhY?=
	=?utf-8?B?b00vU2VQRTViRlRZc3o3K1ZUcUJPUjVYUXMrQmlBd0VFY0M2Q3paMU54UkQr?=
	=?utf-8?B?VHpuSEpzNzJvd3MzMnUyZDFYKy8wSFpIMGZ4YmtqV05NM3ZyVVYwNk1SMENr?=
	=?utf-8?B?QUpta1lVVDFaanJOUTluaTFLMkVQVm14dytmM3JUdTJXaTdUOXpoRHBMZkEw?=
	=?utf-8?B?bmxHbUJIM0lDZUdWWExMRmJJU1FCYkM0aVpJZWUwNStOaExoc0JmSWd0M2JE?=
	=?utf-8?B?cGhNUWRQeFFoSjlHdjNCSDFYRFBhSkJHZ05KSi9FZzRDc0tLb0JDWFB0alpI?=
	=?utf-8?B?dm5RSnQ4TnBOcTBlMzhQMUtPcHpTZVJwbFI3UlhtWEpLamZUUE8yaTFmek9w?=
	=?utf-8?B?WEtHWkZMeUJhZ2FaU0lkZ3NreEFNSXB1Qlc4cTJxeXN4bWFZaEg4MjNXNW9K?=
	=?utf-8?B?c2tZOHVabU85cGxpZkJ2QWs4QURnMGJZSlpuQnpNdTFxdjVVbkgvcVd4WHcy?=
	=?utf-8?B?ai9IempydGdSREVvS1cyT2drb0tuckdhcWp0SzllZGpNWS9NV3hkNEpKaEdS?=
	=?utf-8?B?Y3JEQWVZSWF1MmpoK1N1U0d1VElmTEQxV3ZXbFg1UW0rR2M3NEw4L0VKQjZ5?=
	=?utf-8?B?MFpaRlJibE4xVGhRUVcyb0laTEpzSzNvOU5QTVkyeXlwZGVuNGFnaHphYWVT?=
	=?utf-8?B?a0xTN0wvQlM3Q1ZzakJPUVRZa0JxTGNubUw3a2JEYk03V3BWemNSMjF5a1BS?=
	=?utf-8?B?Sk1iYVNLeDFKaFUwakVYOGcwMUovQld1cnplUXhDT1UyVzhDY3BJUFJQeVhi?=
	=?utf-8?B?dk1iYzJoS2pnWTdDbDEzRytIU2tlbE5hbnlUeWYzQWxXRjMvZ0YwVlVxTUNZ?=
	=?utf-8?B?cDhSUWpLY2hva3g3UExKZ2hLSnB5Wnk4bGZscEthbFZjNGZmZjhiRGkzZDVZ?=
	=?utf-8?B?YVFVSFE3b09ISTN1S0xLdWt2NUlMRE9Pdlo5L2l3ai9YSVNzYUF4QmFkOTU0?=
	=?utf-8?B?T3hwaUg2bXlqM3YwZWNLUXZrTVU4T1VDODhnQi9sODk5MXhZNHV0aThuSXRi?=
	=?utf-8?B?YzFyYjI4dkFFcG9JS3A2K2xGRFA3Vm5QT3ZnWm51cHlUUmg1RjNhRkgzRjI5?=
	=?utf-8?B?QlhWZ3RwZkdYMllCUGNqdkRkaEpqbktCcWpLbjBLaFVIR0Ewb3dJVlo1Q0Q1?=
	=?utf-8?B?czlSemdSSkpKR3FiZzBHVHFOZjdEK2J0K1d4NjRWZUJaODdjbEFSekZ3ZDFt?=
	=?utf-8?B?b0NWaVBnU2ZFQmpNVUhsWXptMHNnVlAwMXNiL1NtVk5yejQ0Z0ZtbTJIU2Zz?=
	=?utf-8?B?MURUNlhGeWR4WVFId0ZTZUVGNUFiWTc5TmZhODNuTmtaTmFEcGpyK25xclpp?=
	=?utf-8?B?OUhwMFpTUEF5aWxaQ2pCRjhUZitwU0l3c0cvRDVrTGZJblVIMWJ6blJPdXN6?=
	=?utf-8?B?YUI2UzhYdVY0OUY1aGM4RmNUaU5tTlA4RmhhdmJOMTBwU0ZuN1hjeDFuNURh?=
	=?utf-8?Q?w4GxCWYpT/FamHTIlFXx48JRQ=3D?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjA0MDFNQjEzMjI7NjpRUGZ5NnRIRHZVYlpGdlAxSzJmekNGOWtB?=
	=?utf-8?B?clVWbTN2SW5rWDdOZWdOUEFzZUpHdk55bzM0c2lLZWg2RHh5L01Bdjc0SXhL?=
	=?utf-8?B?QUF1d3k5dDE2SGcyUUx3OWxFVDJpR2xwSkJBTk54RElvd3h0c0pJTWNpN0RH?=
	=?utf-8?B?dzZidUNNN05UUHlETVoyditIU2FwQkhGYlpaeUN0L1dRMmtPQmxiU1lJVVBU?=
	=?utf-8?B?STZoSWlQYTZqOW5PVStKZmxNT1NUaTArdXdSa2IxalFWcm1DTlZzdEtBWFc4?=
	=?utf-8?B?VUlsSHMwbmhlTG1iM2dEK2s5MXFiMmM4T2x2ZVViUWFMNzU4UjdLNHkrZ2Jy?=
	=?utf-8?B?aWRHNXc3QXl2K2VsVCtCcHo1Z0xGRjZhdk9CQ25JbVhtazhvV2VLdWZaRXJl?=
	=?utf-8?B?alRVaUs1UUdud08ycy8xbUUrc2FDK1ZUdFp2Uy9oeFFLWWVWV3lmOTVEY0Jx?=
	=?utf-8?B?TFdKeVJWLzZpQTVUem9XTzRnK0s5TnpuVklBVXpQNkZrMW03K0JRYVZaN1Jk?=
	=?utf-8?B?Z0JucHhYc0dLZUxqbFlDVnNWM2NjcEQwV3lKeUVYQVpOSzRnUjVaMGRFOVl2?=
	=?utf-8?B?TjFVMWRNT0orc0lpLzh5T0VwZzBJY1JmS2NzYjFkUG1yd3NaV3RvMFVkV3FP?=
	=?utf-8?B?bzlKNnBWckdFMVdKRDdLWnIvc2hpMVZxTjlOZWpVWEZRRU9nRHF2Zi9TYU8z?=
	=?utf-8?B?bk5ualhpaTd1ekNzZC9NR0FidGk0UDFUdlg2d1BmS1dHaWxCQ2Z5MWZSR2V1?=
	=?utf-8?B?T05TenNNUGtLYkx3T2w4N1BQeWJUakFzM0NMSHdXMEdkSDhGem53M2FqRTdD?=
	=?utf-8?B?eUhkWFZPOEVKUnRWVjFuNk1WTkp1THF0T2Q0RDQ5WjNaZWwxc3hvTnp3TEov?=
	=?utf-8?B?TW9ienkyVWNVODhBdmlPbUxMSVRDNlhhUUZFbXY1eExtS05Yd0x6RjdWeFFp?=
	=?utf-8?B?SGx0cTdkT09tYjlRcTkrM2RSQWpzQUFraGpPK1hrVGtoSFNYemQ2Y0dnRjUz?=
	=?utf-8?B?NnYyZFpkaU1zNEpYK3ZIMWRqbGh3WU00U0QzdkQ5QUNvRWhGdjd4TjhKaHBi?=
	=?utf-8?B?NjlBN01qdndZc05QaU5qWXRmVDNJUFJDY2JXTjNkT0d2NDZTSytLVkpzTVc4?=
	=?utf-8?B?eWEzODFzQis5dmVzNWRpNUtDYXJ3VmMxL3VSaWljVm94Wkx4M2xRUWtIZkpy?=
	=?utf-8?B?dG5VMXB1NXpua1Vmd25jQnY0Ky9mcFhSMnduUzZmakpmZU5ORVBvSUxkc3Z2?=
	=?utf-8?B?R0hQSXJidzNtcjFKTjlQRTJja2lFQ3R4OVIxaGlISHpvVjRFZ2hRZytzVHh4?=
	=?utf-8?Q?H+DFTDp69zcm2Xz2Kz5f/fiPd1n7tUH+g=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0401MB1322;
	5:i/ni1dYSJLK/1VxXElpPc46uuU0oMRR6IIcMZSQqEfR0ID6N+adwZzoC7G3cBUSnbiBD/JNJSm6okH5jyaGIFP+B4HsyRvBkyYHPKDtwqrL6KSxlMAb6MTN8hE4+Vrz/jghPmsUE1gSYBlkNBmK7bbwlDa7cpEUyba0CIb8aRFjwR5sQ4EWYBt9faKS+S7SHavcw9D2UDAnbFcnTG8ItFGqQqMlOEPIUNzF1JjAOAodoJ3hjCxw1ly0g+HkBTO1pnex5L7hYr4y9gLuNpnkoexBVOn1DZ/oGdSAG7LLqlwBsr2RA/RpA92cWtcwQIlc/SrsUNmG0IXc60dP918QweHlA3omfPz+D8kEMnQhcnukf/sSTh/Rw2eggGluGKdm616xPLX77lj5+4v+xz/ZEkHQul14/7eiaxtjDF44lwyoMA311Z427xv/6uwykZ3KTjJF9x9huSr2JzSb43EN9PczfCssrxg4QiURjr5KED5mLgpcAv24xFIYl/fKvMTJh;
	24:bsKWb+VVXpHvFepvP9M7lyW9AHpJuwcRw5CKBvPXU97HvBrKOBVgCzCQGaTP23KsHU3OZh6oJSBkSoJG9V13O7S02P+sAxVFhKyCuaZ2iak=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0401MB1322;
	7:GfOSddfWuAlUUhiNMH7/RTl5sy0DeR6zpaFJMAML1IQbEh7a4PpDHMiOKC4PYUljMA27J82F2LpJIFF0lD8Z5cTQsJ7tLQaX1cu2FhSCm7ujZtoHuSo8useTM8G9y6R/wQf3xgjKMDHskp3bTrsayjKPIyByJb0nij9BZnVtS84lUuceyD/qygKt7E8rCza2UHo86DnsR8oErW04dsdUtCYypLE10b93U4apxQkUh/6qCrQ5dZcoyjhWMo6LmAf850MbLIbikoyn+34jNFuvoWvZI0OnZasqvpMIUZL7gCyfIcDwzV4OVzHu+p6Ncu7OyGJLou+7+illnGAEVc0GzGTfPNgzy05m7E/BE1ZFIV9ZCEUeIae+opwPntn134krvzOT8q/ApT+GL48jmyY6OlSGCGt+1uKWn/9Wi30Z3UDepzcoLxZ7fYNMR/yH03RRKX2flbtKMkZf2gPxE3FKjHSfQXbaI1hYaOOhhokzXlwm8KKDhamDwr9/nKYxCtXWzEPV1aqs4A+p0sQFZGsgHXn6e3Gt9RkxOFEWR+56Fqsj5bfsM4UeEvRYkGPa6dgVklIL4y9ujN4uojGrB6/fKNp93EafWx6eQy8ezumMzvA3e3hmiAR9y5Lvzj0xYX6/cJpZXW2f4pNxHzOp4e9mxx1peInD6otvM7QJHBtK3AvCVJ1F6XtyJT1eH7LjzVAMAj6mOVL+H45RQie3c6TLaariUJliivBJ45YfF+yA3yJ4GQdh175NqFsxa4zlEGM260dJTDCv9Ho9sQx5DRUxn7Fg3RkHBg/TESeGI0TS4nY=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2017 16:26:28.2763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0401MB1322
X-Proofpoint-Virus-Version: vendor=nai engine=5600 definitions=5800
	signatures=585085
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1706020000 definitions=main-1707190113
Subject: Re: [PATCH v2] opkg: 0.3.4 -> 0.3.5
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
X-List-Received-Date: Wed, 26 Jul 2017 16:34:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

master already have opkg 0.3.5:

http://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/opkg?id=89b8cbfd65ae6c682908da8028d86692926e4d45

On 07/26/2017 04:26 AM, Huang Qiyu wrote:
> 1) Update opkg from 0.3.4 to 0.3.5.
> 2) Delete status-conffile.patch, since it is integrated upstream
> 
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../opkg/opkg/status-conffile.patch                | 69 ----------------------
>  .../opkg/{opkg_0.3.4.bb => opkg_0.3.5.bb}          |  5 +-
>  2 files changed, 2 insertions(+), 72 deletions(-)
>  delete mode 100644 meta/recipes-devtools/opkg/opkg/status-conffile.patch
>  rename meta/recipes-devtools/opkg/{opkg_0.3.4.bb => opkg_0.3.5.bb} (93%)
> 
> diff --git a/meta/recipes-devtools/opkg/opkg/status-conffile.patch b/meta/recipes-devtools/opkg/opkg/status-conffile.patch
> deleted file mode 100644
> index 6fc405b..0000000
> --- a/meta/recipes-devtools/opkg/opkg/status-conffile.patch
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -Upstream-Status: Submitted
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 086d5083dfe0102368cb7c8ce89b0c06b64ca773 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Tue, 10 Jan 2017 15:24:59 +0000
> -Subject: [PATCH 1/2] opkg_cmd: only look at conffile status if we're going to
> - output it
> -
> -The loop to compare the recorded conffile hash with their hash on disk is
> -outputted at level INFO but the loop was executed at level NOTICE and higher.
> -
> -This means that if a conffile had been deleted the status operation would
> -produce error messages for output it isn't displaying.
> -
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> ----
> - libopkg/opkg_cmd.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libopkg/opkg_cmd.c b/libopkg/opkg_cmd.c
> -index ba57c6a..37416fd 100644
> ---- a/libopkg/opkg_cmd.c
> -+++ b/libopkg/opkg_cmd.c
> -@@ -638,7 +638,7 @@ static int opkg_info_status_cmd(int argc, char **argv, int installed_only)
> - 
> -         pkg_formatted_info(stdout, pkg);
> - 
> --        if (opkg_config->verbosity >= NOTICE) {
> -+        if (opkg_config->verbosity >= INFO) {
> -             conffile_list_elt_t *iter;
> -             for (iter = nv_pair_list_first(&pkg->conffiles); iter;
> -                  iter = nv_pair_list_next(&pkg->conffiles, iter)) {
> --- 
> -2.8.1
> -
> -From 225e30e0f9fa7cfeaa3f89e2713e5147ab371def Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Tue, 10 Jan 2017 15:28:47 +0000
> -Subject: [PATCH 2/2] conffile: gracefully handle deleted conffiles in
> - conffile_has_been_modified
> -
> -Handle conffiles that don't exist gracefully so that instead of showing an error
> -message from file_md5sum_alloc() a notice that the file has been deleted is
> -shown instead.
> -
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> ----
> - libopkg/conffile.c | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/libopkg/conffile.c b/libopkg/conffile.c
> -index b2f2469..7b4b87b 100644
> ---- a/libopkg/conffile.c
> -+++ b/libopkg/conffile.c
> -@@ -51,6 +51,11 @@ int conffile_has_been_modified(conffile_t * conffile)
> -     }
> - 
> -     root_filename = root_filename_alloc(filename);
> -+    if (!file_exists(root_filename)) {
> -+        opkg_msg(INFO, "Conffile %s deleted\n", conffile->name);
> -+        free(root_filename);
> -+        return 1;
> -+    }
> - 
> -     md5sum = file_md5sum_alloc(root_filename);
> - 
> --- 
> -2.8.1
> diff --git a/meta/recipes-devtools/opkg/opkg_0.3.4.bb b/meta/recipes-devtools/opkg/opkg_0.3.5.bb
> similarity index 93%
> rename from meta/recipes-devtools/opkg/opkg_0.3.4.bb
> rename to meta/recipes-devtools/opkg/opkg_0.3.5.bb
> index a21fde1..3e511b6 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.3.4.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.3.5.bb
> @@ -15,11 +15,10 @@ SRC_URI = "https://urldefense.proofpoint.com/v2/url?u=http-3A__downloads.yoctoproject.org_releases_-24&d=DwICAg&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=wNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&m=BifePy5QrwZOSind-8ndN3lCCnR8yRdx4Vlx8YK5WmY&s=J_wAe7LX3BF1PYcPxUBNWuq4VmGmewb44c3BOV2NY4s&e= {BPN}/${BPN}-${PV}.tar.gz
>             file://opkg-configure.service \
>             file://opkg.conf \
>             file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
> -           file://status-conffile.patch \
>  "
>  
> -SRC_URI[md5sum] = "6c52a065499056a196e0b45a27e392de"
> -SRC_URI[sha256sum] = "750b900b53b62a9b280b601a196f02da81091eda2f3478c509512aa5a1ec93be"
> +SRC_URI[md5sum] = "d202d09ea0932943071b842626cab13c"
> +SRC_URI[sha256sum] = "734bc21dea11262113fa86b928d09812618b3966f352350cf916a6ae0d343f32"
>  
>  inherit autotools pkgconfig systemd
>  
> 

-- 
Cheers,

Alejandro

