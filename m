Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2371.1794860233187490356
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 12:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Bne7CTff;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5780dd7ed4=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJdCs83567096
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 12:17:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-id:content-transfer-encoding:content-type:date
	:from:in-reply-to:message-id:mime-version:references:subject:to;
	 s=PPS06212021; bh=y3YGfupIK/pDFye5FF2lh9gaGyDrhoDcn6+m6vFUNzI=; b=
	Bne7CTff6rUyQLEHZxFFRSuh+PmfUM1r34mqGVzjKeCOgZHHbdGLrq4ZcHPqhPUz
	O+HfX8mKqBUH/+fY7fEKkrbjfeUomEV46zMo/AJMSBoY+wfhDpNlnXz4SfxtIdb3
	wT2unwzOTc9/PqOHmwxjslcolAcQ0G2RJ3YeewwjM6OO58HB5g/CHZ9TRsuhpDH3
	5gNYs918GjTkgn+xS1Z5b/BB8WvEyy4c9oAkVmR/Np/UkFPdnbnfq82vyIHQunrP
	rx0Lf2d4OUPSipewusITV5nK+qCyDr6QWqxz1naCIoWoQI8zXSkZ6hMjeKq4AJ8w
	xCAJCYkQ0Q61T/iHeFZoZw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020072.outbound.protection.outlook.com [40.93.198.72])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hxr1h38ke-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 12:17:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmFRRddCV5RUUUWr2XikpVIY9iqm1jWWQt3/kH7bZFEkEFBr+Jko57B4s/AWrPPzkA+glkUX4tMZcDnBAxeIFiPDporL1H2fUBNTdRJbC/pAd8cNsOB0XH/b3tTYG6yhpziTCDYhmWlyq2fv5Mnx5mBF/jeaVTTga3yg3Hjd1aM7CqkzW5RPVquICd+AcBa/6QYhnoKmVnR+GxG5q7taKOVlttZ0IcViXiODoIF2NuYg4KVf6Zw377S9X2TQ3mfukBbikna3kGg8l76HZBfHPlZWRybJMzC30usHgMbOGX+If8JZBlPEtlgHg0Rq+jDlibRF9qFKPxBhVFe/uEE9GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3YGfupIK/pDFye5FF2lh9gaGyDrhoDcn6+m6vFUNzI=;
 b=Oabsinl4LHwjGTnn1JVzrI81YB/OgXJYt8mLSI5PikETX0LGfl4Wwp/AA/ep9cYQmExmEeSPDe7c1/VgDTCG+1GHYLYjOwp/MHWDm+b6QP0yThxR8jQQLBAZUzoszoMLu2fqMFphKtDdAf8gRdkAJxBjWCBrhJeuU+YYhUB9dN9XSEubIPdP6hIACZB22+9OwT2CM39ACA42zhFNXTJ2oFrpx2fLVLCOjOKy0rrUi/dQIdUdMBr1R1vdc9XA8ZkcfvS03e2H0Dx0reoaE85ykGhRS0c54bFJ6yObv2E70FwTEV7jQa89/iQAdTwT1Wc2Dx5qmhclUPw6LZ95tiF0jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA3PR11MB894536.namprd11.prod.outlook.com
 (2603:10b6:806:532::22) by SJ0PR11MB6693.namprd11.prod.outlook.com
 (2603:10b6:a03:44b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 20:16:06 +0000
Received: from SA3PR11MB894536.namprd11.prod.outlook.com
 ([fe80::2af0:9d0a:b8a2:bcf1]) by SA3PR11MB894536.namprd11.prod.outlook.com
 ([fe80::2af0:9d0a:b8a2:bcf1%3]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:16:02 +0000
From: "Gavini, Sumanth" <sumanth.gavini@windriver.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
        Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "patchtest@automation.yoctoproject.org"
	<patchtest@automation.yoctoproject.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
        "mattware@cisco.com"
	<mattware@cisco.com>,
        "esparlin@cisco.com" <esparlin@cisco.com>,
        "MacLeod,
 Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] [PATCH v2] rpm: 6.0.2 -> 6.1.0
Thread-Topic: [OE-core] [PATCH v2] rpm: 6.0.2 -> 6.1.0
Thread-Index: AQHddXvUpdN1O6rAaUWyERfl1edN17cwo+qAgAAFOQCAAHp/AA==
Date: Mon, 16 Nov 2026 20:16:02 +0000
Message-ID: <93e45ea7-db55-4839-aca6-4e7ddbfd86cc@windriver.com>
References: <010101a1d852b11e-c16751df-e6a5-416d-91dd-1f30cdbab297-000000@us-west-2.amazonses.com>
 <20261116033732.3106610-1-sumanth.gavini@windriver.com>
 <DMWN3RX2K68K.O96T3TFNS2DC@bootlin.com>
 <AS8PR10MB50736C20744CB290C0DCF5DFFD7C2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB50736C20744CB290C0DCF5DFFD7C2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB894536:EE_|SJ0PR11MB6693:EE_
x-ms-office365-filtering-correlation-id: 1e950eb6-f1ef-403b-e4ca-08df441e6fb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|10067099003|11063799006|56012099006|4143699003|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: NWAOYzOdfz6IhwBxr4GWL6EvEkOm+2IlpQDHUujey+H7Jg46cEHtoN3UDgeMAMaM+aUNK8b34UJNbhGwSRekVJw5FdOcjnYa/bavGmUjtfmpjoRPbct+AkzLoUDC/YazxkNLF0vcB2mHQmb4bKl0NTSal38D1TMLXKKSKGy2AyEYkTmboN594RGvr8pPMshsU+qBwoqjrKS5VOQRPPYfEWcODf+CgcZuSPnW+J2OZzrxdnfkdiLZ57XDvHbiarVisFvkhdbi7dJlDQPNwonjlxuR63qTfHrUOs78WqG9oul3cLkFcaCRVoXz65MlCjcr0EqGABD03s7B+M+67f/OLT685vfQhh/Cpdytbhg6KWm4rL5KgMCP/BifkQA2VjBICfjJhbKVOKvpVbpfAJ9eI4oAWoBwwJ2Yox+1SgkK2F+eKJAe1uMIOgcCbyoK8H12+zmXaY0ih5HDFuiNlOVaEwZuXMAnAwtX4Qv5n/pLSe1MGd3WT6bjaVnVyrW2gNwhA63CB4t6CdGnzAKZ2cTc32QWGNYr/B3/K4e0eFzph6SKKUhizje0Uh02oxO7qzzCcCt+FTwtQCC0S+G1KKxm/aUVNtQSQBmfhv6HBqN8Q6NCaz7m+PpzjMRhPcbJwbldcac2TXxb9aqfVlfZDICnjfUpmOQnXlU4lL6A5XnlSQk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB894536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(10067099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGdjb053bFFtVWxqK1pIUFJQMVBLdlRORXZycW93eVdPMmF6ZmppYnNiWTlk?=
 =?utf-8?B?bC83NG5VVm9NKzRuVURLaUEzQXhIbmFDTnp2TWRiS1VjMnpISmF0djVGUk9E?=
 =?utf-8?B?My9DbWpEVWdVU3BvUStmcVkwaVBWWGl5a1l0Kzk1ZGhsalNIUkg3R3lwMno1?=
 =?utf-8?B?cUNsQjVQVVdQNFJkTE1oR0xlVjFUNjljdUUzMWMwK05rRzZONWY2Ujl0VTN3?=
 =?utf-8?B?VTA4VjU2aVdybkp4dW1HZXUwS1krWVFQbXp1MW9aRTRydFhkVDdXRll6NGNO?=
 =?utf-8?B?WkoyaFRUaHhPZisyMEtYQTJKVXk5SnZhMk5KWlZGOWhoNW0vQllsM1FtVm95?=
 =?utf-8?B?Q0Fha1lKZmd4K0o0b21hYjY3a2pOSzBhTFE2bHhwdTFDbUt1MEpJRlQvNy8r?=
 =?utf-8?B?ZXRVbEV1andZWEo3WEVoQktZVzd0cXphVWw5bUpCWlpvb05XVnRmSngyZWM4?=
 =?utf-8?B?eFRKa0d3RGR6WFYrSFVNK08wbHJSclRudkQzUEJFb2haRHVHczM4dTk4czI4?=
 =?utf-8?B?VmEyMmtmMzA4MmZvc1hocUl4MzFZeGRTT09EV3lMNTQ0WENySEVVdVo4QkJn?=
 =?utf-8?B?SWlZalhmV0NTSkVITmk0bWRPL3h2RUFuYTZHSmRYeE9xSDI4MDRqQzQzajBw?=
 =?utf-8?B?VnFUZTI3QW9BbnJ3ZlFEcTVWb2tKM0tyYnZSL0hmdkFHM3dsK1VDNDAwaXlv?=
 =?utf-8?B?VjJOSjNjSzg0bDZncGVPa2d1dUNjdEdZRVh4RjZFanFQYVZ1MVc1NzJhNU9r?=
 =?utf-8?B?eHNBaXVYMUh1T0dzRnRUL0cvbk5YeHlNL1NIc3NESmxZSGd4WXJINWVWQzlL?=
 =?utf-8?B?UU5kSzduYURDMDVUVEdCVzBzSlFCL1o1TFEwS1hEN3EwQnR5OWZSejg5Qm1x?=
 =?utf-8?B?bGhVNXR0dGtvNlhtdjdPTjFNbkhNRHVWRVlVYnRZR1JpOFBoUzF0ay85YVU5?=
 =?utf-8?B?a1dweitxMHNPSEdTcVROcmlUTjVKRGpnMHQrTkFVZk9ZWHRDbFBBTENwVkxt?=
 =?utf-8?B?MEZ3WXozTTlMZUJpbm1kL01TL0xBdFJJYjUrQzNDN0UrWjZVaGhtYVVIdW0v?=
 =?utf-8?B?amk5SUl3Y2xhTkZ1blJsWVZuSjRzSXZnbVN3VHNYZXlEczNValoxUWk5dlNY?=
 =?utf-8?B?RzU4ckxyTStqZDFPc2I0djE2amt6WnpZZTJyZ2tyazNaQnZZbXRQSUw1eUtN?=
 =?utf-8?B?OTI2WmJWVGR3Zm5xTEFJcjZOZzd5eHVtTGVqN2hTWm91VXkrSXhiZE53dUVX?=
 =?utf-8?B?N01YLzQ3Q2R3ZGVJUUdMZGtIWFF6cnozSy9uV21kdTNSWHppWXlaMDQwQkdI?=
 =?utf-8?B?WGVRZlN2VkxUeHY0QWd3V1U4bldmeFdBTkNha0ZFTytPdUgyQXF3QUQ3SDI5?=
 =?utf-8?B?eXB0bWx5U1lxSFd2U1Bob1pxWFhIYktkS1NreTY0blY5ejVqMTZmYlczeU1y?=
 =?utf-8?B?TXBHR3k3c2w2eUIyVVpxMkR2WlVJQjhpTWdsQnZQNmptUGVlSnBXcGRzMVhQ?=
 =?utf-8?B?NENpdHliK2VmaWNQUE5HV3Bid0U1R2FhZE43QjErc1FZQlZ0Ym1ubkJsdmVk?=
 =?utf-8?B?cHlCcTJOMFJSVjdIRjFXTUh3UEg2cjJ5SjNPRDJFT0gzeDgrSGhoZG40cWRx?=
 =?utf-8?B?TzVOTzJWc1ZKUXEzUVoxV3NDeXdKaTJZaHhJdVByQXVQdGNoU1RHdDRIUVhX?=
 =?utf-8?B?Zm5JY0NsQjdyQ0VJcFVIM1RBM3dnak5wWGZpbndjM2ViS2svQVVaVEE1QTN6?=
 =?utf-8?B?ZnNlcXU4NXB4MFU3czM2MVh2aGtiM0FueFEvOWdjWE1oMklKclhUYlZybzda?=
 =?utf-8?B?VzNYNHFiMHpJRnVOdVdkYStsTWdVaXV3L3hWaTVnTDdZSkovK0h4TXZBV3Fh?=
 =?utf-8?B?TGNzeStkZzI1c2FIdkVPdkdkTWt4WXBoQ3hsQWQ4Y0dFNlFDYnA4bXRkanVV?=
 =?utf-8?B?WjlBNjNsb0dDcER5U1l4UlhRNi9DYXdPSXlFamhtQzJYZkFGaG4yT2tmTnVJ?=
 =?utf-8?B?cE5MZFFPUVl4VFg5c2p6Y3JJYjBDYzI0Qys5c0VFOVRDci9HZzBUbGNaR3Js?=
 =?utf-8?B?cVNlL0dCa2pDU1YzUmYyRWlkZlJhK3ZZTjNKLzhPZERoU2RBWnQ1Zm1ybzBF?=
 =?utf-8?B?N2xRN0hlYXJ4Z0t0UVNvWFRQQnRJQ2sxN3BuSk1NR1lrYWQ3L0w5amVPajJE?=
 =?utf-8?B?QWNUYm9vRlBxVU45VUcyR3hkRnJCSGp5UTU5ZHpkV052RG5XYWpCQXlKVW5N?=
 =?utf-8?B?cVJtTnQyWjdVUlBWdTNqUGpwbms2RGpPYmJjeEhDUTYyZW1uZjkvUFRSQlFu?=
 =?utf-8?B?K3V5b2xkcDhUeTJOR0R6Qm5DN2tZMkpvOXltRkZrVmFwVytod0YzaDBtQXJP?=
 =?utf-8?Q?0/bpdCfc9zasUxAByjYHEHIBV4Le3NRT+v9vl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA1AD5C56A4D124E8D47D79AB067AB45@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Vz6MKVvDKu2aH/2qfg85koxK05ghX1AkEAiaba3/EbpSNSR47LZoT7KGOJSYC32BSzVtkNez9ydNmGDPu0rCiVMC8JRvv2JIwr6G1B3XzT9/XaexbbXcRbNRGx8KG3h8LZQsm3U8BbZj/YEkloDgqmlZYDX8TVoOx1ktbAxvePTWHae9vag6uGyh9MWaN/86kz6+7lfLpujoNOKoCqXQ+w5V5oX5q9ROiGNUjU18Z20SDVbOJezWPfTqwXf6ajQ5qIE25wc3H0ENLXMJIesY/THZaV50u5j89XHhEtoL9MjkJNPopPGFSZO+EsSOF/XuNCXL86L78x0/LxHIZZ+kDg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB894536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e950eb6-f1ef-403b-e4ca-08df441e6fb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 20:16:02.3193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ks12Muw0G2jRH5kodMlE9a4ZMlb/x5+pu4HP7HadDg/HPg51oQtmmloltDx2wOrjw/ygbputfYw135Y3BJF1SfMroSZDhoEHimQ53dH7aVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6693
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfX2VPIt5Bl1Wti
 9gSsEBYsISsnPUctbRQjQPtmgfEV8DTvd9OQu5Wt6TCJDViVoh/PsPtEriEoOyjmsfD9Ki2vWiZ
 R3N78I/T/NNQnYMWp9bfbXw89tfObS4uu3P2+aZsaoM4OHI1B9MXbhaaWB6JrGtxb9+GSYOwi1n
 ykfSqUdMpmUUeSc3tiakCBpjD6chPQ3jaZ3eAqzV7RyDhqgWtnqALHF5esPjKTOsgWW0xmNnM25
 bgdnc3R9trs2MTsTVpKWgvhfwVid4+A475G/6N+xk+dbE8xH4VEHIhJ2Fs2HPJCEN3W+I2UysgC
 NZ8svd0AYOvJeO2GaNVM9MRbv/LfIzz+pWxfNgFoInXr8Is8NCGgRF7DG78s/quq+GKpklHnACm
 34Pex/r2Z4sKlYUj3XDnYBU4oO0nFNbLMMpPw6fkOec6R4kh77dRkmR6/jBU4LNMTIOC+risCIn
 7Y768GAR9AJ7cqagtdA==
X-Proofpoint-ORIG-GUID: bntHue6HsGxSaCS2tcV7Dp9OCVjQNysO
X-Proofpoint-GUID: jl2CIOzXUMj2ECWUcVFRNH902DSV1IO2
X-Authority-Analysis: v=2.4 cv=WcmZ+EhX c=1 sm=1 tr=0 ts=6afb64c8 cx=c_pps
 a=0/0ATQE1JRcUx1QjezCFVg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=AUd_NHdVAAAA:8 a=a_U1oVfrAAAA:8
 a=SJFd959JdLurMQfg8_UA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfX/n/hcTldaiNE
 MLwlGRPLhzXXj1WrD0EwgMKZJsuiI+ya5Low3n5RGBP/1cTIA7s01Br7Z1VZiPZNlNr1qXm8IIB
 XL/jdjxk0uI57LYDLdH79gH7RsN+wm6R0b43dSiZumqbv3l4+odC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 20:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250374

T24gMTEvMTYvMjAyNiA2OjU3IEFNLCBNYXJrbywgUGV0ZXIgd3JvdGU6DQo+IENBVVRJT046IFRo
aXMgZW1haWwgY29tZXMgZnJvbSBhIG5vbiBXaW5kIFJpdmVyIGVtYWlsIGFjY291bnQhDQo+IERv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXpl
IHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogTWF0aGlldSBEdWJvaXMtQnJpYW5kIDxtYXRo
aWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+DQo+PiBTZW50OiBNb25kYXksIE5vdmVtYmVy
IDE2LCAyMDI2IDE6MzkgUE0NCj4+IFRvOiBzdW1hbnRoLmdhdmluaUB3aW5kcml2ZXIuY29tOyBv
cGVuZW1iZWRkZWQtDQo+PiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IHBhdGNodGVzdEBh
dXRvbWF0aW9uLnlvY3RvcHJvamVjdC5vcmcNCj4+IENjOiBhbGV4LmthbmF2aW5AZ21haWwuY29t
OyBtYXR0d2FyZUBjaXNjby5jb207IGVzcGFybGluQGNpc2NvLmNvbTsgTWFya28sDQo+PiBQZXRl
ciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+Ow0KPj4gcmFuZHku
bWFjbGVvZEB3aW5kcml2ZXIuY29tDQo+PiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCB2
Ml0gcnBtOiA2LjAuMiAtPiA2LjEuMA0KPj4NCj4+IE9uIE1vbiBOb3YgMTYsIDIwMjYgYXQgNDoz
NyBBTSBDRVQsIFN1bWFudGggR2F2aW5pIHZpYSBvcGVuZW1iZWRkZWQtY29yZQ0KPj4gd3JvdGU6
DQo+Pj4gKiBTd2l0Y2ggU1JDX1VSSSB0byB0aGUgcnBtLTYuMS54IGJyYW5jaC4NCj4+PiAqIENP
UFlJTkcgY2hlY2tzdW0gY2hhbmdlZCwgdXBzdHJlYW0gYWRkZWQgYW4gU1BEWCBjbGFyaWZpY2F0
aW9uLg0KPj4+ICAgIFRoZSBsaWNlbnNlIGlzIHVuY2hhbmdlZC4NCj4+PiAqIHJwbS1zZXR1cC1h
dXRvc2lnbiBtb3ZlZCBmcm9tICR7bGliZGlyfS9ycG0gdG8gJHtiaW5kaXJ9LCBhZGQgaXQgdG8N
Cj4+PiAgICBycG0tYnVpbGQuIHJwbXVuY29tcHJlc3MgbW92ZWQgdG9vIGFuZCBzdGF5cyBpbiB0
aGUgcnBtIHBhY2thZ2UuDQo+Pj4gKiBSZWZyZXNoIDAwMDEtRG8tbm90LWhhcmRjb2RlLWxpYi1y
cG0tYXMtdGhlLWluc3RhbGxhdGlvbi1wYXRoLWZvci5wYXRjaCwNCj4+PiAgICBpdCBhcHBsaWVk
IHdpdGggZnV6eiAyIGFmdGVyIHVwc3RyZWFtIGFkZGVkIHRoZSBXSVRIX1dFQlNJVEUgb3B0aW9u
Lg0KPj4+ICAgIFRoZSBvdGhlciBwYXRjaGVzIGFwcGx5IGNsZWFubHkuDQo+Pj4NCj4+PiBMaWNl
bnNlLVVwZGF0ZTogQ09QWUlORyBub3cgaGFzIGFuIFNQRFggY2xhcmlmaWNhdGlvbiBub3RlLCBs
aWNlbnNlDQo+PiB1bmNoYW5nZWQNCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFN1bWFudGggR2F2
aW5pIDxzdW1hbnRoLmdhdmluaUB3aW5kcml2ZXIuY29tPg0KPj4+IC0tLQ0KPj4NCj4+IEhpIFN1
bWFudGgsDQo+Pg0KPj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlLCBidXQgaXQgbG9va3MgbGlrZSB3
ZSBzb21ldGltZXMgaGF2ZSBidWlsZA0KPj4gZmFpbHVyZXM6DQo+Pg0KPj4gRVJST1I6IHJwbS1u
YXRpdmUtMV82LjEuMC1yMCBkb19jb21waWxlOiBFeGVjdXRpb24gb2YgJy9zcnYvcG9reWJ1aWxk
L3lvY3RvLQ0KPj4gd29ya2VyL3FlbXVhcm0tdGMvYnVpbGQvYnVpbGQtc3QtMjUyNjkwNi90bXAv
d29yay94ODZfNjQtbGludXgvcnBtLQ0KPj4gbmF0aXZlLzYuMS4wL3RlbXAvcnVuLmRvX2NvbXBp
bGUuMjg3MTA4NycgZmFpbGVkIHdpdGggZXhpdCBjb2RlIDINCj4+IE5PVEU6IHJlY2lwZSBtZXNh
LXRvb2xzLW5hdGl2ZS0yXzI2LjIuNC1yMDogdGFzayBkb19jcmVhdGVfc3BkeDogU3VjY2VlZGVk
DQo+PiBOT1RFOiBDUFUgcHJlc3N1cmUgKD4yMDAwMC4wdXMpIGlzIGxpbWl0aW5nIHRhc2sgc3Rh
cnR1cA0KPj4gTk9URTogTm8gcHJlc3N1cmUgaXMgbGltaXRpbmcgdGFzayBzdGFydHVwDQo+PiBO
T1RFOiBSdW5uaW5nIHRhc2sgMTkyNCBvZiAxOTk2ICh2aXJ0dWFsOm5hdGl2ZTovc3J2L3Bva3li
dWlsZC95b2N0by0NCj4+IHdvcmtlci9xZW11YXJtLXRjL2J1aWxkL2xheWVycy9vcGVuZW1iZWRk
ZWQtY29yZS9tZXRhL3JlY2lwZXMtDQo+PiBncmFwaGljcy9tZXNhL21lc2EuYmI6ZG9fY3JlYXRl
X3NwZHgpDQo+PiBOT1RFOiByZWNpcGUgcHl0aG9uMy1weWdtZW50cy1uYXRpdmUtMi4yMS4wLXIw
OiB0YXNrIGRvX2NyZWF0ZV9zcGR4OiBTdGFydGVkDQo+PiBOT1RFOiByZWNpcGUgbWVzYS1uYXRp
dmUtMl8yNi4yLjQtcjA6IHRhc2sgZG9fY3JlYXRlX3NwZHg6IFN0YXJ0ZWQNCj4+IE5PVEU6IHJl
Y2lwZSBweXRob24zLXB5Z21lbnRzLW5hdGl2ZS0yLjIxLjAtcjA6IHRhc2sgZG9fY3JlYXRlX3Nw
ZHg6DQo+PiBTdWNjZWVkZWQNCj4+IE5PVEU6IHJlY2lwZSBtZXNhLW5hdGl2ZS0yXzI2LjIuNC1y
MDogdGFzayBkb19jcmVhdGVfc3BkeDogU3VjY2VlZGVkDQo+PiBOT1RFOiBDUFUgcHJlc3N1cmUg
KD4yMDAwMC4wdXMpIGlzIGxpbWl0aW5nIHRhc2sgc3RhcnR1cA0KPj4gTk9URTogcmVjaXBlIGds
aWJjLTIuNDQrZ2l0LXIwOiB0YXNrIGRvX2NvbmZpZ3VyZTogU3VjY2VlZGVkDQo+PiBFUlJPUjog
TG9nZmlsZSBvZiBmYWlsdXJlIHN0b3JlZCBpbjogL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2Vy
L3FlbXVhcm0tDQo+PiB0Yy9idWlsZC9idWlsZC1zdC0yNTI2OTA2L3RtcC93b3JrL3g4Nl82NC1s
aW51eC9ycG0tDQo+PiBuYXRpdmUvNi4xLjAvdGVtcC9sb2cuZG9fY29tcGlsZS4yODcxMDg3DQo+
PiBMb2cgZGF0YSBmb2xsb3dzOg0KPj4gLi4uDQo+PiB8IC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdv
cmtlci9xZW11YXJtLXRjL2J1aWxkL2J1aWxkLXN0LQ0KPj4gMjUyNjkwNi90bXAvd29yay94ODZf
NjQtbGludXgvcnBtLW5hdGl2ZS82LjEuMC9zb3VyY2VzL3JwbS0NCj4+IDYuMS4wL2xpYi9oZWFk
ZXJmbXQuY2M6NzoxMDogZmF0YWwgZXJyb3I6IGZvcm1hdDogTm8gc3VjaCBmaWxlIG9yIGRpcmVj
dG9yeQ0KPj4gfCAgICAgNyB8ICNpbmNsdWRlIDxmb3JtYXQ+DQo+PiB8ICAgICAgIHwgICAgICAg
ICAgXn5+fn5+fn4NCj4+IHwgY29tcGlsYXRpb24gdGVybWluYXRlZC4NCj4+IHwgbWFrZVsyXTog
KioqIFtsaWIvQ01ha2VGaWxlcy9saWJycG0uZGlyL2J1aWxkLm1ha2U6MTU0Og0KPj4gbGliL0NN
YWtlRmlsZXMvbGlicnBtLmRpci9oZWFkZXJmbXQuY2Mub10gRXJyb3IgMQ0KPj4gfCBtYWtlWzJd
OiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLg0KPj4gfCBtYWtlWzJdOiBMZWF2
aW5nIGRpcmVjdG9yeSAnL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FlbXVhcm0tdGMvYnVp
bGQvYnVpbGQtDQo+PiBzdC0yNTI2OTA2L3RtcC93b3JrL3g4Nl82NC1saW51eC9ycG0tbmF0aXZl
LzYuMS4wL2J1aWxkJw0KPj4gfCBtYWtlWzFdOiAqKiogW0NNYWtlRmlsZXMvTWFrZWZpbGUyOjcw
MDogbGliL0NNYWtlRmlsZXMvbGlicnBtLmRpci9hbGxdIEVycm9yIDINCj4+IHwgbWFrZVsxXTog
TGVhdmluZyBkaXJlY3RvcnkgJy9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9xZW11YXJtLXRj
L2J1aWxkL2J1aWxkLQ0KPj4gc3QtMjUyNjkwNi90bXAvd29yay94ODZfNjQtbGludXgvcnBtLW5h
dGl2ZS82LjEuMC9idWlsZCcNCj4+IHwgbWFrZTogKioqIFtNYWtlZmlsZToxMzY6IGFsbF0gRXJy
b3IgMg0KPj4gfA0KPj4gfCBXQVJOSU5HOiBleGl0IGNvZGUgMiBmcm9tIGEgc2hlbGwgY29tbWFu
ZC4NCj4+IE5PVEU6IHJlY2lwZSBycG0tbmF0aXZlLTFfNi4xLjAtcjA6IHRhc2sgZG9fY29tcGls
ZTogRmFpbGVkDQo+Pg0KPj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3Zh
bGt5cmllLyMvYnVpbGRlcnMvNDIvYnVpbGRzLzUwMDANCj4+IGh0dHBzOi8vYXV0b2J1aWxkZXIu
eW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzY2L2J1aWxkcy81MTIxDQo+PiBo
dHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy8z
Ny9idWlsZHMvNTM2OQ0KPj4NCj4+IEFsbCB0aGVzZSBidWlsZCB3ZXJlIG9uIGRlYmlhbiAxMiB3
b3JrZXJzLCBzbyB0aGVyZSBtaWdodCBiZSBzb21lIGlzc3Vlcw0KPj4gd2l0aCB0aGF0IGhvc3Qg
ZGlzdHJpYnV0aW9uLiBJJ20gbGF1bmNoaW5nIGEgZ2VuZXJpY3g4Ni02NCBidWlsZCBvbiBhDQo+
PiBkZWJpYW4gMTIgd29ya2VyLCB0byBzZWUgaWYgaXQgcmVwcm9kdWNlcyBlYXNpbHkuDQo+IA0K
PiBUaGlzIG9uZSBpcyBjbGVhciwgSSBoYXZlIHNlZW4gdGhhdCBjb3VwbGUgdGltZXMgYWxyZWFk
eSBvbiBvdXIgRGViaWFuIDEyIHdvcmtlcnMgd2hlbiBkZXZlbG9wZXJzIGFyZSBlYWdlciB0byB1
c2UgbmV3IGMrKyBmZWF0dXJlcy4NCj4gRGViaWFuIDEyIGhhcyBnY2MgMTIuMiwgd2hpbGUgPGZv
cm1hdD4gd2FzIGludHJvZHVjZWQgb25seSBpbiBnY2MgMTMuDQo+IFNvIHRoZSBidWlsZCBjYW5u
b3Qgd29yayB3aXRoIERlYmlhbiAxMiBob3N0IGdjYyBhbnltb3JlLg0KPiANCj4gRGViaWFuIDEy
IExUUyBFT0wgaW4gSnVseSAyMDI4LCBzbyBzdGlsbCBhbG1vc3QgMiB5ZWFycyBhaGVhZCBvZiB1
cy4NCj4gU28gc29tZXRoaW5nIG5lZWRzIHRvIGJlIGRvbmUsIGxpa2UgdXNpbmcgYnVpbGR0b29s
cy10YXJiYWxsIG9yIHBhdGNoaW5nIHJwbS4NCj4gDQo+IFBldGVyDQo+IA0KPj4NCj4+IGh0dHBz
Oi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzQvYnVp
bGRzLzUwNDcNCj4+DQo+PiBDYW4geW91IGhhdmUgYSBsb29rIGF0IHRoZSBpc3N1ZT8NCj4+DQo+
PiBUaGFua3MsDQo+PiBNYXRoaWV1DQo+Pg0KPj4gLS0NCj4+IE1hdGhpZXUgRHVib2lzLUJyaWFu
ZCwgQm9vdGxpbg0KPj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KPj4g
aHR0cHM6Ly9ib290bGluLmNvbQ0KPiANCkhpIE1hdGhpZXUsIFBldGVyLA0KDQpUaGFua3MgZm9y
IHRoZSByZXBvcnQuIEkgd2lsbCBsb29rIGludG8gdGhlIGlzc3VlIGFuZCBzZW5kIGEgdjMuDQoN
Ci0tIA0KIyBTdW1hbnRoIEdhdmluaQ0KIyBXaW5kIFJpdmVyIExpbnV4DQo=
