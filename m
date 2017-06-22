Return-Path: <adam.trhon@tbs-biometrics.com>
X-Greylist: delayed 18084 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 22 Jun 2017 20:15:56 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0064.outbound.protection.outlook.com [104.47.2.64])
	by mail.openembedded.org (Postfix) with ESMTP id 7088477E91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 20:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tbsportal.onmicrosoft.com; s=selector1-tbsbiometrics-com0i;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=sWsQoC3+RkSq55NRFy94KsLXPXGz5I4Zgn3Vhn9l9u0=;
	b=CzNtgp2Wd0HzLeXZh/zVvsXpvDpZQTvkYudw2yON4kkvLEXyCYj9o83RXRRDQQySQvTZD71xGzCC+bRG/1J5Kmweh8Kd/dgqbeoiOcpO4ljcNX/uq69OKeqq0IaXbQvGfvEn/276HD03gngazEwahgXoujUZ4rFJpscNyP/e0vs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=tbs-biometrics.com;
Received: from loki02 (176.74.132.138) by
	VI1PR06MB1261.eurprd06.prod.outlook.com (2a01:111:e400:518e::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1199.15;
	Thu, 22 Jun 2017 08:42:12 +0000
Date: Thu, 22 Jun 2017 10:42:09 +0200
From: Adam Trhon <adam.trhon@tbs-biometrics.com>
To: Openembedded Core <openembedded-core@lists.openembedded.org>
Message-ID: <20170622104209.260f4563@loki02>
Organization: TBS
X-Mailer: Claws Mail 3.15.0-dirty (GTK+ 2.24.31; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
X-Originating-IP: [176.74.132.138]
X-ClientProxiedBy: DB6PR0501CA0038.eurprd05.prod.outlook.com
	(2603:10a6:4:67::24) To VI1PR06MB1261.eurprd06.prod.outlook.com
	(2a01:111:e400:518e::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e293bcc-bf63-44e3-80e6-08d4b94a9412
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:VI1PR06MB1261; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1261;
	3:U4d85jjpOVtNkgOwrfch40UZgdVo9drm/K91/abmaYafSDmugOyv/M0+RY2gJZZzVxlkbSzWzp8WYZP0tNf14xmJDkvOjKH9UueFTmNgztR0KwZerR1Q/TCboJL+er5ORKMtFNC5vnTXCxJ7GI3bQEr3SMe4cF09mcEbjO5QLp8pYkBuMf5+5AxEDvRjBF/GBuC6nbxdYUZK6b41s8ulXIf0RsUuuBvZHRaZ4OINH5rQf2ed65WKfvaxvXpjR9ky7Ty/gtu5UF4NmFJ19rMxakfGSAxfEYbkut9bVGYf5k/2/VEj9I//FOe9yGPCzRXJNkjpfdlROg5fakDQ2rqSNQ==;
	25:lqAkHw92Mzxu1Ly4LD/Re9UZGYIlGeHd7E2B6E/dTSOhLD2D/qqoAPRP+JTj0A/7BLoQLTycCB/Scd44g2tCtzgCj4QuVgLFa85ZJNDxdR1Nojgtf/YfoUCa8uIkmhQr3GzTsR7Znya4guaFkLM2ZTyGS2b0AZkvwgUi4z6qr7HWDXulnVzIG2X9hgsfU6TNJfBhrmeWXwDkwgAQ4R+yMGoXmhW0zEzFra0gBLxUgBGqOo63MxOZz++IndbQ1LbAUtWpaUDvLwxIMl78CLGxTfwd8PnmDhA6bR8YGZigWFHRAFSp4xXy03Q/Jqm+t1P2M3hjyNmWOnDyIAaB6d1Wt+TuyPn9+dhhfkTXI7sS5jJZ96qzRjaNjom2TBuhcIShGrDROrVvSmOvr0MHDCSvunQxdlZbFMxapGgQY8wFbUtp4XIKqCVVuloOEImtZeoZ4lkGxo/NlRTnk5mkfZ/OxAQfShFuI8Gj44RV90dcE+Q=
X-MS-TrafficTypeDiagnostic: VI1PR06MB1261:
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1261;
	31:8eGRgaMnQMDKvaCxQP7nMOc/k147qWwlYLFPi56DvkKPEv5yDZ4mJ7Qvx2/mJgxuw85WzMK8vI2vKckk6S597Ssc0KdQDo8YKXZKrSiPXCd2p2ffMSZEGL49Vn33btmGoNUsT/GAVTQ6tARPslVGu0bwnJK6j3IC6KiIPuku29Bf307mWxicSwm2mvAeCK3HCKVGujej0TifAPXDoM4h9SN9y7OTtn7Vuvqi+bpYIIKmbGp3NVAbJePqDYS4PWDi3o25SYlY2OKEu9RCfyxtlw==
X-Microsoft-Antispam-PRVS: <VI1PR06MB12618BC964DA9B63935D2176A6DB0@VI1PR06MB1261.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(100000703101)(100105400095)(10201501046)(3002001)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123560025)(20161123562025)(20161123564025)(20161123555025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:VI1PR06MB1261; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:VI1PR06MB1261; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjA2TUIxMjYxOzQ6MmdSa3NiQWhVcVlVWjNhdWJ3eHJiK1dsNE00?=
	=?utf-8?B?NFQrUWl0cXVieUVsbm8rNHVMREQ1NTlyU0ZjYVBmMndQMytCYjVCTG5Db1g1?=
	=?utf-8?B?SkMyMGU5bWRLNThrWW9ZdTVBcWhSVEJONzMwY0Q0M3VUdzhCY1Y1K0J3N0pP?=
	=?utf-8?B?Z2tBYUdoc2ZGK09pYVV4ZW95U2VUY2JtRUx6TlNzTDRwZGllUXBFUGsrN0Ev?=
	=?utf-8?B?VytvWFpkY3h5Z3dLSE5UTStIV0JFd0MrbUFLcUkwQ0UzU3UxblhVbXRBbkZT?=
	=?utf-8?B?bFlFYmJWSExiRnNGTzJZQmVYWlI3cmJJbER4ZUIzczVUWmVaUml4WXplQVcw?=
	=?utf-8?B?Tlo0OEFnOUFpR0pKajNuQ1FKdks4Wm51TlozOVBvM0VqNjBwVnIwMHMxUGRF?=
	=?utf-8?B?WC9RSFRLeCsyOVBjVTNOSE1RcWdJdjMvZWZoUFo4cnE5Wk1pYndSY05MZTVS?=
	=?utf-8?B?RnUvRGFjY0R4V1FtT3ROMHhlMHJPcUVwNktuakQzWFRFbmtFWU5zZXBvdGc0?=
	=?utf-8?B?T3dOZUxYa2pCdi83a1FDVElNVk5pMGdRZGpldFNrczhyRGpBN0tSdS9VS2hw?=
	=?utf-8?B?MXlTUFZIVm52U2g4azE3dllSUXd5QTNNMkwwVUE2aU00M2tzcm4wZlJ4SWgr?=
	=?utf-8?B?M1lxK2x1Yi9SaURUTWd0d0xZSlZVWlZRME4rbm5rWFhEL3UydVlYczMrTXQ1?=
	=?utf-8?B?bjlIS1NnOGZsZVZyWVZoVUt6VlBDcmc5eGJjMFNRR1gxYklVdzdsRlg1NnpG?=
	=?utf-8?B?UUZJN2VOQkJSVHRSVXFoV2J5ODFwT1gxUEdkZEhsOWFBUDd2cnpCNE9YbHhK?=
	=?utf-8?B?WUgzNWtwVXBPdEF5a3RwZjB5bEhkeEVwMmVuSHFJRTQrM3JOZnVuQ2dSOHF1?=
	=?utf-8?B?Z21Md2dsS1A0K1lxNitHOEZrcmhTVHpkaUprQnNQS0FWT1JjZUxES0FneERC?=
	=?utf-8?B?b0d1MUQ1VlNzeWMvZzhTYXVkK2p5UUhCL29zMUdaOTM0Q0hLSldWV3dieURH?=
	=?utf-8?B?bkJtMkRUN1J6K0ozZ2hCai82cERVKzZvaURJNWZvVHNvdHRNbUtkSFBaVnFN?=
	=?utf-8?B?aXJ1U1pvb0h1WC84L1BqaEEvWmUxa3BNS3k1VVdMYlNCTjNrblZKa3ZZb2o3?=
	=?utf-8?B?bjhoVktHUXFTOXczVnFPeU5YNU54djV1TWI2UitWdzZlNGxuL3FodThOelZC?=
	=?utf-8?B?WnFSaEVINlRlREdZU254Zm9lYTAvZm9qS0hsT1NZQytxTlpNMnNjLzhUSmhT?=
	=?utf-8?B?QUtnUkU4RFdFUDdmV2tZWTJQZG9haitzcHhxU2l0ZEZDaWlvc2d1ZlVrNTJ5?=
	=?utf-8?B?K2pIbyt2bWVZVkhRUThDV3RpNFRyZzNZOXRnUVNieGRpcmgzR2hyKy9aVkdi?=
	=?utf-8?B?MWw0YWM2dkEwNGtrS1VZWmlpZlpMUDg5SiswanVYZ212QTFKd2tyWUZNZytP?=
	=?utf-8?B?a1diSTJwUjFhcllHSGg5UDJ1cmpuSW9uN0cvb3ZSODRNak04R1dGMVg2cVlq?=
	=?utf-8?Q?8nNlpIWUl+PjaKROIgRTk8/u6C6svJPAxCZ9zeJ2XQx3o?=
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39400400002)(39410400002)(39830400002)(39450400003)(33646002)(33716001)(189998001)(86362001)(42186005)(50466002)(478600001)(1076002)(50986999)(6666003)(3846002)(6916009)(47776003)(6116002)(7736002)(38730400002)(110136004)(66066001)(6496005)(50226002)(23676002)(25786009)(8676002)(9686003)(55016002)(8746002)(305945005)(5660300001)(81166006)(2906002)(53936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR06MB1261; H:loki02; FPR:;
	SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1261;
	23:NYQ4ZdkwdNQCqnRoVf4vhMv2iPUpsjKbeBO+WPQhjsvh0SZNk4dUaqLj69Co+I1ze4S+bUeSmrCHjb78FZxZio+oScdtRcI8Vd6N4FXZuShkRMUDiwuHlD2ciuqjpaYKO2K1XkimF/u9rAiN75+fagW5sXI9vjj493FkLF1dm8CO4B6VNMFOSIgMgwZre3N5tPkO5TKwII4b1OLeh7LYloIvZ93cTdYqfzEETWb+OZAw1lGQgiiJ59d67xpQhudoCmOwAbn2CsO5xF6QRTd+WJVC5prGrKCM52QIyGaKm+/F4dFcK09WT1FIxbhENBB9NTnoSj9AZH3MSdM71vlLgeQhjzoXfUHlBX3GSNNDQEA3M3XiYMDGB7rpQ0E6iYjpq87xsCeuChVpsVk1QU1d0N90wk0VrgCh1F3u/rjlK31XnzV5Aab4IFhoQxlVTYwuU/A/Lh6MXfiCovskTe7Yj0qao9TKNslB3bzBETP8RFvETuiaUxSidh4gfTAx+LtWypQGV5Hsw2PETbAiQQCdeRqSkEFZ3B4Z66DrbFmxGPLoL08psytjkciciTd7i4rhGzqQYY+DoKT47EGeu7ArzoILs2Be772Z/n5nErLhDyI71X38/0OP0ukQfYnIYoO8Oypp5/Fup2T1r1VSytm3KqaZTAsSKlr6vgeQl14obQmpioBN8wDi5tCFloLNtTrw/RoeI56KLeg979f08wfa8+fyGkiu+mwCqfo9fvfL4wVJrFTO49Ia8KR7OUNhdJ/lG6YVL2RJfSpfMaSZDlFYxYUDM73DwzsO0LSIlEPTxt2KEIyOYEguSSONS24eg5ftimNZmOOZtB/F6VPEjLQjiG2NkT44VmRPw0JintoEVWDc51eKvK7DtW36ne45E0w/Hbypu2jzRO2l/UEl0px5Qt2ZL6gJt/5IF0ItvtJww/Am0aJ4AHC2hsXwGd903a6W
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjA2TUIxMjYxOzY6RFVELzhBYmo5bHRwb1pqWnZoZkZKLzV2aE9z?=
	=?utf-8?B?Q2ZrWUQ0VU84Mno2Z0ltenlFMytaZ2lHVHpMak0vT3dGMXBVMElzRnhnbnhC?=
	=?utf-8?B?RXhYZFIxeEhCeHF6YlZ6WUhPV3Z6Ky9SdklOUEhvRXBSOEhqZVRqNEFtN2NK?=
	=?utf-8?B?UFFSUU5pcmpKb09Db3NUdkJ4OXlCdUFzdjcyZXBxdWlrTlI1WTZhRHVyZFhH?=
	=?utf-8?B?RTZLM3dqR2h2K2tvS3RkeXJTUExVbFlaL3FXTGszOGJhdThOSHNJVytwMkJK?=
	=?utf-8?B?VG9aTmJWbGQwRm5ZZDBZUlpvUWFGQ2R4VXFPWUpEV1ZDYXZEWWt1OThjZFZD?=
	=?utf-8?B?SWNZQkY3MEs3QkEzNGRCdFFrQ0IwajRINEJVTnRCWTZDNXArVzFXcnFOTHNB?=
	=?utf-8?B?bnBNcXBYODN3b3VueFBob0ZnNWFra2dEdXdYMU9UTEFUYUd4N3hrbm1pQ2FY?=
	=?utf-8?B?RVFzeGFhWXRPRnVwVVhHUitCWkRpYUJ5b09EVndXeTBEN1Q3Z0JHYmNoSzlu?=
	=?utf-8?B?VmpDd0FDdklXOGxNM3UyTmJ0d2hQeFVKVEZGYmovdzdMRG1Zd1l0MnpRTDN0?=
	=?utf-8?B?d3hiK0g4K3RBSG42NzBkOU50Ymlnekt3WjRLOVJvTmJZeWlPNmEyMEVhRk9p?=
	=?utf-8?B?L0YvaEhieW9iQURDdzNCdk1TYkN4VVNFVHJJekpzVGJhcDc5NTY4ZE9Yb1Vo?=
	=?utf-8?B?dDNkOVkxZGhhZzRQLzFMUGxZZFRCbWZqY2FoOXdMdURKemxNc0hwV0JLTGZp?=
	=?utf-8?B?Mk1hZlROK1RiYjh1WjZ1RDhOaTV5TzhHRDNBdnYwK0lKc0RWeUlzNmhQT05C?=
	=?utf-8?B?UnVweTJoc3dpSWRYZzlXRjNvVS9UcjZaQWZVYkc5c0cvUHF3dUtYeURQMklv?=
	=?utf-8?B?MFk4a0M0MUtYdkVsOEU4M0VXWk8rMXFlYzYzNHhlWTVxaGYzcHNJSVdURHE2?=
	=?utf-8?B?VEFTMXFKaGdnSW9OUjdZVkZ2RHpEWkNvbkFaUmw5b1RFTG1SaEd4anRBdHdw?=
	=?utf-8?B?QzFPV1h1QVFhaldRckM2QWg4SHpvL0E2b2JmM2VYeUZwa1FSNnNheDhuOFha?=
	=?utf-8?B?SFJ0MHNDOW1EY1FDSkJvcHVrOGdHYWRrVGZUSW52ajhMZTEzdGEwTzgxRzE1?=
	=?utf-8?B?RUxiWkI3L01aYUNOWDYxV1IwdytyUHV2MUNOYmhMM2NvRFNLRUM2Q1RrajVR?=
	=?utf-8?B?clk4eEpXNnRtNlU2eTFQdjNPaFpSalRvT3Z5cFMzdGp4bU5rZzN2S1duMmZh?=
	=?utf-8?B?OEwxRWx4empucEMrN1NiL213cWtYQWdhWkJWYWsyR0JlUG1Ec28rQWxjKzgv?=
	=?utf-8?Q?p+7SKVcDPRYVbE7ck8854u5B1ykel8U=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1261;
	5:hn4A9QAytQyTGIlwCz/lTIFpsxfW3/gUlS5ezDoCG8kw0vcHoH6Ss3Hd8WrT3ARvfjMA3FsT4LA2MPnNo/ZH98ahmdDOpG47KMacStp9PzwYWCwPbFdHH+UBkKZhWHmrsTJEFCzm48caXR4cclWUarOINBRXj+KAY9KJfVNLHwZSzGsu+j8+VNfJV5nQsUcrbwOM/9skjhP3IgAtHBQo8EmuRYisCMgtYcFHU1GXEp6FQfX578udbLYAZyPRhx9QaE7zmqqvi1Y5xBHMwx3+8hHg396KzNx0eYxGMJqlHvMIOzNhMiG7CZPd5pligpqNHzrZ3RWTduk2GooqID4gKNu8yy2Ljf4Kozq8m9r0p9rNsXay9kTzkjEPnzgiT4AABaY0S1C/xPdYZI8k7AzBsixvR5CZNZ4yppGdtageCNS+eiUSSiNQFBAFj11mtJianjtePnCjqqShBOvGmcrYa0eTGWaVN11kdWHbvgbjO32WhYvNTR4qgjIL7LyoQ5zo;
	24:J2+WtGEKB19FRYHTlJgY24VZ0puKBuZ8yGNJsRTPbTeU+9oV9kfn9swu/wjksvRJXlR+TILDmcngI7qEScpbDNKhJcuOGdzW69+GUSMNhys=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1261;
	7:tfB13iRGcHEBs9bE/6DmYKqdE+1vdiN+Vh5u+RadJq/QnjLphCaHPsfB7N/50y265f5+e1vCuJ/hSzBD4ctJWGMwtUYAXrl/KwzsbjBVIWJ8E7kIGb6Pa03QEcZZbmZa7CyWGlWJPDh1X+7DmA6hvwcXYZw8vmF3tx4TdnKDv26PnsvMndnDaKfWVW1fEC622Fko81VWNrdb/ObDp1wNfOAsCCquXYwLzsbU48CrhRUD8u0o++5RvjfEnCzIXzHbT2KpRo9YjhEvH+onUabQRUOFVckgqpBcyJOmA9jOwwfvySUov35n6DORjEWqTMBwhT5mju1pAZ/PTQ1zMiJRr3EItuRHKlHtnwEcsXk/91C56zbocXcmmsO21vxi1fdst5UM2LcQoks3fdC/FFSPzIDCyp9KXLqWsnOcMw9fHJU7p+nurdER3ecUGw1Xpi7jFKc6D0FqnpWeoYBL+P6msZSmR9LcvNrj3WUTAw1C6BQ/j1wNXvMMufu1zgvXxYbKzrWXdC9gPFI+UWzIcb7foZRKV8K6E9dCif5yV/NJhVtYE7yjkelFcOimOE3QO3HmkhvdYPcwitnfeKd/eg/agLtlS//s4Fh8F79/NmOBrVVMRS3vh+Ol8o1KyY+V/MUC135JBOIjaPWlef8gHEQr/LR7poakVRl2Hf3lQwV6GRED7OTPn5Js1v8/0vq9VFRlDPrRd4OGeRgB+fe2BpRW/K4y/vPshF/bgg9FL5v7SMsjCCSk4V/ZxI2G8S79K18Ne+WrHBOkbTqUYeCaq8IHIBYQtg6Gzxj5uKjp260TqMY=
X-OriginatorOrg: tbs-biometrics.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2017 08:42:12.6541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB1261
Subject: how to load cmake args from git?
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
X-List-Received-Date: Thu, 22 Jun 2017 20:15:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I have a recipe that is configured by cmake. The cmake arguments are hardco=
ded
in the recipe and set using the EXTRA_OECMAKE variable. For various reasons=
, I
would like to have the arguments in a file in the project's upstream reposi=
tory=20
(it's mine as well) and load them.

I came up with this:

do_configure_prepend() {
    PACKAGECONFIG_CONFARGS =3D" ${PACKAGECONFIG_CONFARGS} $(cat ${S}/oe_arg=
uments.txt) "
}

but I am not very happy about using PACKAGECONFIG_CONFARGS - it feels hacky=
, the
arguments are not shown in cmake fail log and it cannot handle argumetns co=
ntaining
spaces. Is there a cleaner way to achieve this?

Thank you
Adam

--=20
Ing. Adam Trho=C5=88, Software Engineer
Touchless Biometric Systems s.r.o. |=20
Palack=C3=A9ho t=C5=99=C3=ADda 180/44 | 61200 Brno | CZECH REPUBLIC |=20
Mobile: +42(0) 721 565 113 | tbs-biometrics.cz

