Return-Path: <alejandr@xilinx.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0060.outbound.protection.outlook.com [104.47.32.60])
	by mail.openembedded.org (Postfix) with ESMTP id A630878DC9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 20:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2nlKuU4TvPivUqNQlsOPE7gKjXZ9B2o60xaTV4nFWJ0=;
	b=PP1SlA6+CMq+FUpaQ5/k1mzbR4uo6be8cbyJNnilO+JNowN7DcVqh7QIethPGouhedfLzI6G684SD59wYZajtJAywotJQw5bYUJhp+rdice6lPhyJulqL4B0YZNvPiCDbMO7VKUSeYvAMspnwSkuIWFesm7EqqSxT27VvrFc9cA=
Received: from BL0PR02CA0098.namprd02.prod.outlook.com (2603:10b6:208:51::39)
	by DM6PR02MB4940.namprd02.prod.outlook.com (2603:10b6:5:11::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1080.17;
	Wed, 29 Aug 2018 20:02:54 +0000
Received: from CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::202) by BL0PR02CA0098.outlook.office365.com
	(2603:10b6:208:51::39) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1080.18 via
	Frontend Transport; Wed, 29 Aug 2018 20:02:53 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT051.mail.protection.outlook.com (10.152.74.148) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1101.10
	via Frontend Transport; Wed, 29 Aug 2018 20:02:53 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fv6g0-0000A9-W3; Wed, 29 Aug 2018 13:02:52 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fv6fv-0001N8-SW; Wed, 29 Aug 2018 13:02:47 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w7TK2lnK030285; Wed, 29 Aug 2018 13:02:47 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fv6fv-0001Mr-31; Wed, 29 Aug 2018 13:02:47 -0700
To: Alex Kiernan <alex.kiernan@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <CAO5Uq5Q2QLz-TM-0Nugzj15Qzpdj1xFaLptGR_KJL6qtWQi7wg@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <52bd5fc7-c48c-d1ed-019d-b5f2b0bb8722@xilinx.com>
Date: Wed, 29 Aug 2018 13:02:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5Q2QLz-TM-0Nugzj15Qzpdj1xFaLptGR_KJL6qtWQi7wg@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(396003)(136003)(346002)(2980300002)(438002)(189003)(199004)(8936002)(47776003)(9786002)(65806001)(356003)(76176011)(230700001)(8676002)(2906002)(81166006)(65956001)(31696002)(39060400002)(81156014)(305945005)(336012)(6246003)(64126003)(36756003)(58126008)(229853002)(426003)(2616005)(316002)(50466002)(486006)(446003)(11346002)(6306002)(110136005)(126002)(106002)(551544002)(53546011)(476003)(67846002)(106466001)(5660300001)(186003)(31686004)(26005)(63266004)(2486003)(77096007)(966005)(23676004)(65826007)(14444005)(478600001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4940; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT051;
	1:xcbpVzPV1hRn0p0YDx7Qel8UGayFsTtWnTfmMWrSo3oaUADVhYyafxC7yjcMT7lhaG7yvK/EL1uefsAdaKbuMRYFN8/ILc9i51mPSETlScsB9S8Xctb1aME5jOZk4viO
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 932ae302-880c-4f8d-54f0-08d60dea67e9
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:DM6PR02MB4940; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4940;
	3:NPch6svFZZvsfN4u+wyEAghj1kAkNRhROB6J/t6j217c9xDwQZwai+aGBQpE/ueZeLRnv+ZvccDjLgMhOXdLqEIZ6ud0zPAyehJ8i9jidrC0eBZfwxEpjlqjWjFhuQVPv2ak92SixPmLQSMxN66oPlSBmGfUX5yTwSJbAdmsI+2E4xXF/gNmgoGd5JhbRRWWrx55ovlbDCIwUwW4GFvuuuXIIxwsUzrwF7oZrxlgvqWMxwxUM4c4rnCrVz/6pKze9EVvT/wMhgq+45Rw9eMfOsqzlHNs7+mpUsDjadJS+7HlzuZbxRheRhb/PVxwPlMGKBDfpIQ0NCzAVKrbo0JyndyW2nO+YVJ86jgbsJIiwgc=;
	25:l6gT5rt2CVqsjX2RNhtr0Dv75Xqq0HBQdMWTRYnQzbVZt4pfmGRLetnxiMRWblQtuVfx4n8fQHoKeLIL0GfwAt2eWTsz66jU9xeqbg4gZnFS/eXugOFAqtJfWxUncj65kZduTKjTefudjkUJ+YknpXFl6JD1p+tXlYptQpmX2eTI2SqV2Y9chX1/Virl0i+Rv35aO/qpEXxf07ZhqZmqBhMaiHSi3/UwenzOBEL8ZeeAKJKQCu4m+/ZP0h/Gr8Lj3/XVA/9HJloVrg66cbrI1By0o1dwn1iOw1h3f9cex2A7LwVPQ529jb3z6/E+xPR+9KuaxZ8F8eSsJiX8QWgU2Q==
X-MS-TrafficTypeDiagnostic: DM6PR02MB4940:
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4940;
	31:bCVO9C73xWMlt+OTRGioEk5HVm5j9KepxwqEUCVDv0ofy3lkut4crKgNTYdkvK+0Mkp1okQ+b4vovLjuLsS1/rqmRzEH0CwRbMsD4QMecCd1hlUzIdjSoYOuJFWMhtRKc7S/HXoPm8QwdtJM0aZGkZ1/ddkqMlt2pk/i1g17PZcP51rmJtB7x1tSIPFbqm+AlYZvVJrCCROBeqPjjLSZa+2aYlOMdM4ot9QYFSJncjw=;
	20:RFMSxUdaKb+tbGCmNWIgoZV/3HM/Ok9Yud0RHYG6Gm/LWygwbyF0pxmkIStzjqaozqgTp6S9HOHEWCYp6t/qYvTfTi0/ZBdXB/o7TJz5JrzMjfJh148NzoHDa8KH4nZ6npiQp33Lyi68Wi3oeNpH+2z6jQ8pyfHpC4sMEVaNPvHBrRERSjkRO3ELN/yeXuIlNbkE/SccQtUXNJd7AENhxnS32qz8/lJm6cWtMZCojpJCSIEGgAXNF+JR+zoPbvs8LqTOsQdoZP1zkWgdkK3PqvbjMYQrqAN4kT4VyJbVwl9xEvjsOywDxmAX54STdCkB+hWrkMoVCFPsai/ybXrgpIlQbh4X9dHr3xT9Eqg6FGGl94N0KXaInTalyq3IOmLRTswA2wtj1txME6VgHPBumQAotn5ag0iAuK919tSEjqrozQ4JTJKSFLwJ0wDQvcTOQ0XPPocH3OAqbDOfjVUYtMHjVoR6CDzVsavRU7n09gL5JVhA61DcZpMmeLOoikyv
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB4940827827DAE6CAE42B3003AC090@DM6PR02MB4940.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231311)(944501410)(52105095)(10201501046)(3002001)(93006095)(93004095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(201708071742011)(7699016);
	SRVR:DM6PR02MB4940; BCL:0; PCL:0; RULEID:; SRVR:DM6PR02MB4940; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4940;
	4:XLoUJsz8vplwkxFgqgfNWoI0oXe0JnY0pV1o3RFJrhuJUoN35YPSM8DgLF0meR7ga+I1D5UKFs5HB1tGYKcJ66brlXNV6GDGodfH3DdosxSmty2NyI/Usz6FxMPHTD6hzePMZ/HEythA6X0ZQHWi7aAYyUrWmADKZaOxCuWP6iqsjvjaukdUhP8eFHQOaR0Ww94x6oY3AZDR3I2VT+12dkRKEjNRDAIycAjKd2VPO60Os8u+ICZ9WLKge1ME4kKTk3rddTKRNxduTxe4Xr4avNR9dSKLCoWXZF5XYHz0823j316JZzHO8d5WueCQogOt
X-Forefront-PRVS: 077929D941
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTZQUjAyTUI0OTQwOzIzOkwrN241ZTJVTWdKMGNIdXoxVGdQMUlGc2I3?=
	=?utf-8?B?MThOUnVVNVhlMVZVTjAyd09VZUhDSEYzM2grY3g3UnVNUWVHODcvVDlsQkVv?=
	=?utf-8?B?VTA1WGJwaFRpTllHYW5lRi9SS3k5QjZCaEFsOEo2TW8reU5sU1U5ZFJ1WDRr?=
	=?utf-8?B?cEpTazJsQitPQXllUUFuOHE4cHJwU1RIU2pWVmpGNlZTbnlLYndpei9kS0Rj?=
	=?utf-8?B?RzNrbmJWb1BUeUs3azVtZitXM1ByRDluUjJ6RGJaQWdOekZjN2VRNDVIN0Jw?=
	=?utf-8?B?cmRhQWhyTEtGdk84cUoxblNBRmtsM3VhazVTNDVQZ21mWFl6cGN5c0hiTGxO?=
	=?utf-8?B?RUZwZmh0RFpEWUZldmh4dzJuTk1nUmdrNGNHQ0FVa0xGTjU1aEd0SGo2T3M5?=
	=?utf-8?B?enJZc0FDdGNRbVN0OHhvb1lRd3BBcXpEdnp2SUVHc1ZHa1RsN0tqdnFmZjEy?=
	=?utf-8?B?ZFl0Skx6TlZUMnRaVERLR0U4dm1LeHdJOFNGb2RGcWx4ZVUvWjdFQ0Y1TWxa?=
	=?utf-8?B?aEk5eGEwSUY2aVpFVGQ0NVJBQVc5Q0VBVWVEU3JJS0RRWmY2TmVRV0gyRWYv?=
	=?utf-8?B?U1lQbnFKcEdHWnV6ZkVGaDZTZ2k3aTMvNERFOGFRN0ZDazBOSzdnMWNLUmZ3?=
	=?utf-8?B?amFDS1J4OVk2Uno4V1RWWGpWaTNsTENDYjRGQnJhOTR1cFRuNHAySGl3Mm1o?=
	=?utf-8?B?dFNhQkp2dHZEU2VSVU5RSjE2WC9FMzBWdlFiUU8rVGNUMktSYlA5U1FTQXRl?=
	=?utf-8?B?ZVJHQk5PY0FXOENERFRVKzdEb3EyN2xvMGxzMzdTaGlNcTVaUkdkemVyd1RC?=
	=?utf-8?B?UmthdWk0am4vcE5HekpIOEFPR1NJRDN3ZTJYQTdPWXBmQ0RneEJRQWFYWkFi?=
	=?utf-8?B?V2RPQURUNnE5amxoSTRxbUI3OE1vcnNlMUtwQ0pOVjdjUUlac0FycHJEU3E2?=
	=?utf-8?B?WGJuUklWUDFDVkRhZDM0Wm10a2Vxbk1UQWlReG1UemhCd0FkK0VXaGVUT0xv?=
	=?utf-8?B?Y0daNkZPS0I4KzhJcm1waDRKcUhrbGJrTndGQ2xlNDBGVjJvenRuVmVhV3Zh?=
	=?utf-8?B?a092dTEyWEZNeis2L29uMXRhTkdEUlN3VTBjRHlVQ3ByM0NhUURiUTlabEVJ?=
	=?utf-8?B?TExJc2ZaYzlGbXhsK1N0VUZFakd5aHJ3WjFyb0lYSXV2QmZQYThJS1BUWWhY?=
	=?utf-8?B?Tk1BTnBCS0xXU05KZDNrcGg3TDRCTVczYUYyNU9TLytVQkJ1ME9UZjRSN0Vs?=
	=?utf-8?B?SHJRVWdValgxemQzVnU4RlF2REpQL041azdyMmNoSkFuQk9qTy9OSE8xb0N4?=
	=?utf-8?B?YXZuVnk5KzczYWFWVWFDWDhFR24veHErWjFIbFZQaEhKanc0cDlsSGRZZE5p?=
	=?utf-8?B?cnBFMS9UQVpjOGl2TDEyeHlLU01SVVEya0pUSWJMdjNncENtM2ZuRm9MejFz?=
	=?utf-8?B?YXBmOExQUXZPZlJ2UXJHbUY4cVAvZWlxcjFVNlA2bDY4ZThvSFhiUkFRcjVN?=
	=?utf-8?B?TGVqZ0dGUjdkNngxK01OZTBGZHVqbjBheEY3RUJYL2gvYkNvNTlCcFdVWG8r?=
	=?utf-8?B?Z0dtMXVrL0Iya1J2T2lGU3daUkV2dXNwWTBPYXpkNzdjMkVMMm1VMWV0MFBF?=
	=?utf-8?B?VUlYMlNRaDQzQU5RNWl0M1E0MkxWTC9JOGVYcHhKZEtLV0xncVlib0RtZURO?=
	=?utf-8?B?UCtVSERhcEw4N2hha2tTc2hhZ0YwQzdIMXpJbWp6dTA0OGYvNUtSbXZKc3hF?=
	=?utf-8?B?MjhVRHFCWWJBc1d4aFl2dz09?=
X-Microsoft-Antispam-Message-Info: /na94xoaXCPT4/32fClyN4e7fBSqi5FZ2V5m2wknkiMuHKdgug4CLSnlyT+NVy+ils44s/bhJN1jlixBvJ1MFGwEsMG/4gkf/a5ixUTcSiPo/2MU8fxweGgAxMUgyPJsYlqUnPh3GaJnVDA8ax9jI21BLiscaoesUab4gJ2iBhU5fFa3ZshdMLY+MDmOfqNTTA3zNaKQ202YhWt8jsr+rMYo7V7hVydv8kZJwO53rbI8hJTHRqS45KYvto0W8e1DjUNMNmtsfSJqqAPxmJoZjcCTsFxmrQGb4Zm5h10Rk5kBg8zEKf33Z6aMO9A01yPqaNXfFM/kG/gZEXsmvSOZ0BeJSg8yauXelr8DUYDNgVw=
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4940;
	6:rh4LMoghL7j6uGdBIVKbM/QvuhrsQXgjKWt3rDJzhONEHOfcJ/4fNOuLf6s8WUcDXpn56J5eAggiJVJJpN5o1POMwF/DCUj3f+IZOWFyWMjeZ8RgXNM3FJ3pHPqQ+eFD7sT5vjnbh7/pxhYzGsEDwmO0tbng8/YPNQelgIuQ87O9Jdy4LLXM8C63LKazfNKtADp6VwGfAX49WKcBBbu170i/JBIG3bD/ob+QfxOnzL+5/ab9WgtZ9cipL5ECjH6ERtdWIAUMfN403kYn+s39JLMqnnmB2x+wCUVr3AfwtK/sLPcc7pBcyStkzjZnGyyPVr+9uSaItYjo3uRbe1kp1ZDqtsqJjsCUdxJ+xi3pRDaGWm1chPRksya2mlMVAggwUA7bAqd4noaA7LFODVBjAKj9KrNFmd1bhEDjBvqwqgr1e7fv5T+UpQIK5SI9yWJNGtQEwUE6H0dxAsyfK3SXqw==;
	5:dk0Bq44w4zvMunkKALZYvhbQsw2OgGzOYuGxHbNX3OL8ORBq/UaW5I2pryFE0yysUSFf5ypL17H7RSzdAS9NqiBfJO28RXIA6zMICLK/wcegsq8scPZhKDM5FIy3kghyLoMFfL4WkGUbKtYGq5ula6hOKMwMA04pS/YX9f+1cJg=;
	7:37ayUgh8j9di3VhjlQ5HA4jb5QqTPGYIVyDz3iWJdpIq1qhH7udYl35y7OmsiD96QKBxuAhk+wH9VxW3DYWfLd6up+1XACfr44DxjclVN3xzgnHXFvKlpqz3SEnUQvNQGQBxEWioOuGNwu3Jk7lAdXrOgYbkodJkxp1JJnP2MAPIsEKc+NDM+jneDI5DYdm0C9tsM/tlWv5Vmfsz7/Tj3Mnp34r9Qh9/x44FUk55JGU1cAVcwm3YQZnP76EE+WlH
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2018 20:02:53.4638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 932ae302-880c-4f8d-54f0-08d60dea67e9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4940
Subject: Re: Multiconfig builds broken in master
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
X-List-Received-Date: Wed, 29 Aug 2018 20:18:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello Alex,

Firs of all, your issue is not a multiconfig problem, and is not caused 
by commit b8730f6 .


I was able to reproduce your problem before and after reverting the 
specified commit.


As your error log says, ostree is not in the list of valid image 
features, if you add debug flags to bitbake

you can see that the ostree-image.bbclass file is not even being parsed, 
hence why ostree was never added

as a valid image feature.


Why was it never parsed?

because theres no INHERITs/inherits pointing to it.

greping though the iot-refkit repo we can see that for example the 
refkit-image (I don't know what your production image is based on I'm 
just assuming) contains the following:

meta-refkit-core/classes/refkit-image.bbclass: inherit 
${@oe.utils.all_distro_features(d, 'ostree', 'ostree-image')}

So it will only be inherited if the DISTRO_FEATURE ostree is included.

Adding ostree to DISTRO_FEATURES on the <multiconf>.conf, allows the 
build to find the ostree IMAGE_FEATURE correctly.


Alejandro




On 08/29/2018 06:39 AM, Alex Kiernan wrote:
> I've run into a weird multiconfig problem on master which seems to
> have been introduced with
>
> b8730f6 ("bitbake: bitbake: Add support for multiconfig dependencies")
>
> Before that, I could happily use:
>
> bitbake multiconfig:gplv2:production-image
>
> whereas now it fails (gplv2 is a multiconfig which basically just sets
> TMPDIR and INCOMPATIBLE_LICENSES).
>
> The error suggests failure to populate IMAGE_FEATURES correctly:
>
> ERROR: Nothing PROVIDES 'production-image'
> production-image was skipped: 'ostree' in IMAGE_FEATURES is not a
> valid image feature. Valid features: allow-empty-password
> allow-root-login autologin dbg-pkgs debug-tweaks dev-pkgs doc doc-pkgs
> eclipse-debug empty-root-password hwcodecs muted nfs-client nfs-server
> package-management post-install-logging ptest-pkgs read-only-rootfs
> splash ssh-server-dropbear ssh-server-openssh staticdev-pkgs
> tools-debug tools-profile tools-sdk tools-testapps usb-nmc x11
> x11-base x11-sato
>
> (the ostree feature is introduced by a layer derived from the Intel
> IoT refkit - https://github.com/intel/intel-iot-refkit/blob/master/meta-refkit-core/classes/ostree-image.bbclass)
>
> If I revert that single commit everything works again.
>
> Clearly there's nothing in that changeset which is touching
> IMAGE_FEATURES, so it's something way more subtle!
>


