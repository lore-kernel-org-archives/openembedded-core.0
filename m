Return-Path: <adam.trhon@tbs-biometrics.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0055.outbound.protection.outlook.com [104.47.2.55])
	by mail.openembedded.org (Postfix) with ESMTP id C70C8780BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 13:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tbsportal.onmicrosoft.com; s=selector1-tbsbiometrics-com0i;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=p2b6Kq8rTYhdsGA4PYxQVzoXPcy8kJvn5VY/LPzflco=;
	b=RXfazFC9LuMYUhlIZVKj7Qj354Q9Xng2XWiOQySvPASjVQGsNWH8RTnbGRYXQl/azqTq+GVuye+F72AJLMIYZlKR5SpsZXgDhyOseUGMEGIo3qxXQXIy8ZVn6KHSui8YigfcScegInYbvhdD0azh6RtiyPVv44m0elmujJD37XE=
Authentication-Results: intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=none action=none
	header.from=tbs-biometrics.com;
Received: from loki02 (176.74.132.138) by
	VI1PR06MB1264.eurprd06.prod.outlook.com (2a01:111:e400:518e::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1199.15;
	Fri, 23 Jun 2017 13:21:23 +0000
Date: Fri, 23 Jun 2017 15:21:19 +0200
From: Adam Trhon <adam.trhon@tbs-biometrics.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170623152119.3449aecf@loki02>
In-Reply-To: <CAJTo0LYhB1seMV_QyDf_PWkGF0fkubZb3WHpV2dcTfeU=ysckA@mail.gmail.com>
References: <20170622104209.260f4563@loki02>
	<CAJTo0LbmHft+JXd7ce7r3JCza4G182D4Hnt78hU89DO+TYCNDQ@mail.gmail.com>
	<20170623125705.08cf0025@loki02>
	<CAJTo0LYhB1seMV_QyDf_PWkGF0fkubZb3WHpV2dcTfeU=ysckA@mail.gmail.com>
Organization: TBS
X-Mailer: Claws Mail 3.15.0-dirty (GTK+ 2.24.31; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
X-Originating-IP: [176.74.132.138]
X-ClientProxiedBy: AM3PR05CA0133.eurprd05.prod.outlook.com
	(2603:10a6:207:3::11) To VI1PR06MB1264.eurprd06.prod.outlook.com
	(2a01:111:e400:518e::20)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7741ce2d-b9aa-4cf6-0a39-08d4ba3abe92
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500067)(300135000095)(300000501067)(300135300095)(300000502067)(300135100095)(22001)(300000503067)(300135400095)(201703131423075)(201703031133081)(300000504067)(300135200095)(300000505067)(300135600095)(300000506055)(300135500095);
	SRVR:VI1PR06MB1264; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1264;
	3:C5DjrO7EarINDsxAkNvlE/ZMmnE28fXU5z/cnsQXMkSQivmSpMSCcv+O0E84GGZ8cVhkD2BXDYtTitWtlKbjfHqwPQJIpykC6QDQHP3w+uLrI8g1vB66lY443P/gn9Cx1v/Pnf3o8zrK15VLD7lB9oAcbQ/v/QtegrSenpRjnYqrav9RqHR/ZtqW6kA9qAWRRsnead7v3k5KXgzIjXlEcTIf3fFiZiW0X8eNTfdBns4YinCfhB0VubF1Xoqb9SiD66pEpZOyB+9Qa7zqGFed7Y2dKJTPn1JM6Au0TzWM7IGaL90213Rrnt8Qw3cA2dt0BUu/aJ15cJRkSwiORiL9kwht9tNmpRmsmi4nux6v0K+LYJlzbeVLs5G1xugsZVBe8FSfQzxs8xiB/CwxQyLbKnF5P7+53fcWOHvGuFg1t/qioRGfIh5i6oUMpGIhA9MKdXAh8A0wsK1ycv8bELNzmCJyLIa/jiyXYNOmkfqFtf2XTvHukg5SZuoGroEQ3IBxaa7YqvcK17IbjUh1+RvDzgbaZHUNuc8thDI6Rq3yq24y56aoi2shTgqOczTRFOnr4wtJyS+q2oL55OMUDJNfGEIQ6floUmnqOkn7oOzgKgmsZ6oqS8bD9XiWrhChjbl3piNuys0+e7G/bBVDbiuE/OUBxsYu4VFgr0RTcikMUE9WPhnYgVUcWKuJTl/RLUCd4k64nbKREIQPiXNmnFJzhYqPxL7vuiN++3SNvcHaiCw=
X-MS-TrafficTypeDiagnostic: VI1PR06MB1264:
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1264;
	25:XaVb7WeSRpDlHjgsIFasovBtIrgwkKLDTODQ3ShSNfGic60Qb2yndlPERHpNMYbpXA/px9daq8QWuWARFY0QFa4uju6EiuLcIlkde6RxaJw/SAxU/LgfKhmRkTXUvhfUPd7TRWCc3wh0qAZcld5MrUy2Ex2QAQZcjrufzhX02ojNcCfHgVaBaso5f6bhsjGBSK2TjgbaueVsxdJUfyeZAsSbI3D26pBIENc5YKtwzXH9QEIFhHci6NFxrjdq/r9cQjiaSG4muYFQkR6glE2RCl816Q3ztryhSAe2KHRZn09NhqiFF1UUc5PvpXBaLcF8VeZMt8XxMBd2CYtJsUKNplS30ISqlqjOaS9Sn0Bcgsqwt9QuMjL9O8B1bYsNUa3LPS1vbbuyQ8CsFGVdlXYoeNyLF39+3heN1ZKafl+1Pt4eXbXxDPtdO0q60d9MYfismxwo/sDhXgl6O6/8i1NaxZE6v2gwousEM9KrwUL/txG3Uc2nW+iIpvFmwBv591AkXgB3sH7jvMms8DrqD/v8bvSmQBimp5bwjL39lkVjDDT+Ymgd5V7M62qWmwbaL3cJzzp55RGSRpag6Z6TM1rvCDP23ykAyj8rWZG6VUwMJw5AsiXZdolfwuwEDgahdW3EGO/7rQcd2fyMFwWmpable5XvgM8QwEnM61ecNtGS39b9cVZizQb4L3NNyxxo3WW0WHWQlLbpeMf8xrWEBWozr75A3yXS6lEHn7ebW8N4u4M4TT6koJ3bClMGf6u6rgN5JlJrNRR+YdktoUH3bT4NniXgkaqwgwMIZ7WHOhplPX2FYEVMdCp8f1l6C4VNS8KdGjJeOqDD+Xixptp9xDnLYzsCAfe3diimtIpTqRktiqtgDN8dtLBDavLwquzuLv3CtiTubiPCU34QficYWFl9u9ivpc62fvqpUnCCl8nzp1I=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1264;
	31:2Oz4+yjduGfg5YKSc6VykkTEAw1KQl4vKRMWeBbKv77z25O8w5lWdTTh7QrtXC9y0HiZOkxJiZ70uH/ZosJkeCE5fhfKtcqYnUleF1FX/4FkfYSiV5oCWwGlHG6R1UTHkj7MtoaAeoDuo4BXnvExSVoZnzsonKOkjzVvRj16VLpNwr9WtybRb2OMzLO3ZsrWBfSGpTu10JeNmkXJH63cB6eozFAG15FBmMq1DAT5wX1r1kcaCcJ6AN0tTWYudum/XY5jqimsoxTtwlSywRDtDDQKV5rtViN+6LUHtgrI921LKNGX+DgCgNsltTwGvhrHQm9Oe2QZXLb+97ceqSXcC3dVjIdQveRUnLIVzOCcwYnS+ksfll2+zpMU4/zfJ7oQ0Sn8yxfhDjPAsEDioTSA9veJc5n2SIydA4Cuti/V81R7r06Ns2k0j9BsQqmGI7Au77UUe3Q7ZwTQNEwH7VtuGzCeCQ3VJV+1BytnlcrOMDm14wBEBQOUVoMQxVJa5rULUwMj91HNm75ig2j4cuzyxY+Fa4nKjkgLHks543XB/mYvx/sC7iaD4LeH1OOHLSB33ENu3796eT1ta4YTzJ4LOGg1MavLvmI1T7RrzsXmaVnAjz87zIElU7bla9Kx75HXCtic1HhMKOFiY43Zr5j68Ag+0o6FOshtkNkX9UziG7O7eaRA0IjVyhhQNbqZw+5B
X-Microsoft-Antispam-PRVS: <VI1PR06MB1264EAFC9C213BCACB1BACEDA6D80@VI1PR06MB1264.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(100000703101)(100105400095)(3002001)(10201501046)(6041248)(20161123562025)(20161123558100)(20161123564025)(20161123555025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:VI1PR06MB1264; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:VI1PR06MB1264; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjA2TUIxMjY0OzQ6aUxkMDI0alZ0Vjh6b016NDR4MjkzNHNONjh6?=
	=?utf-8?B?WGhMU3ZEZWpVNkFaMVp2KzRDbnNCWTRLQVRyNGtYR25wUlRCTnhrWHkxQVNo?=
	=?utf-8?B?c2FaalkwWklrY3Y5ODV0L1dwQlUvazRjUUNlY1RMU1F0MW1MRTkwSFVnWnVn?=
	=?utf-8?B?a1ROdHQ1Z3JwNlhjVjVGVVpOZWxuUHlXc3pNQTFUajZ1MFIxa2JHN2tEUjdF?=
	=?utf-8?B?bjlVek5kRG5DWUovbVM3MnBGY2VMVVN2MG5VS0MrTCtrZWhpTFJGS1k1YmIy?=
	=?utf-8?B?M0RhbFlHVXZWTUh0K2M2UWJwcTFPdklGeDRhS1BtTGVHUHkzeitDMWcvMnp6?=
	=?utf-8?B?RFBQR2VCUXdxVVN4SWFLMVIvT1hmdTdPN1N3UjViL0xKbm84dW5LR2tLbjM1?=
	=?utf-8?B?VlhyaWtRcVZuR1YvOHVFYUt3WWFoYnpqL0k0Tm9RVktqenprYmNaMXFtNEtU?=
	=?utf-8?B?SXdWMGN6Y21Xa284M0t0bW5zdzQwajMyY0NTR3hKT2ZRSE9weFo5R1pUNTZX?=
	=?utf-8?B?LzVIRkxWWjljdGJ1emZzcnFqZnFJeWxMRWZwRHdEc01mK1ovcnRURjNXQUJT?=
	=?utf-8?B?YUtrRXQ0QTVycmRpTExvN21rNExYMWVHYWk2eFVjalJQWlc4UmJCZ3FQdC9t?=
	=?utf-8?B?Nm5YSC9PcXZpTnpKVEtJRVZsc0tsdXNldmMwbUJwOGxwS0tYT2R1K3g3U3BL?=
	=?utf-8?B?YUR4TzZCem9HVTgwbjM2NjJIU3luK3dYeXliTHlkSVVoQUp3SzZYU01JYTVt?=
	=?utf-8?B?ZVhjU2NPVUNNWGZiMHEwNnNSbFdReFhZbVVYbmxuUWhiUTJRUXpDTFZDTkps?=
	=?utf-8?B?cTJjRk9qaXp4QmUvTkphd094ODIvaEhZNDdjZnc1RWZSU1NNRVYyaDBsTFVC?=
	=?utf-8?B?SUpkV2M1WnAzWUhIenNqR1RsbHh2eWhPcDVya1JLTlo1eVViZytwSXlabm1x?=
	=?utf-8?B?T1prWWVia3dnY3FqN2NWbFByd3NjZEh5WExtbEZVMmo4cldoMi84NVNiQmpU?=
	=?utf-8?B?SXd4VnJKSWJKRmU0ckVYQWlNU1YvZXhRa2hkWmdnb2lUR2FUQldYZW9BR3kr?=
	=?utf-8?B?bktqSVhwNktlUURFQitHd1VWKzYva3FtOFg3TEJnN1hSM21nNkN5SG1pa0ZG?=
	=?utf-8?B?ODJBYjhFa3RJOEY1c2FFMWd4eU9xMHptRFE3Vkl4aWtZTTRSeWxDUlgzczN0?=
	=?utf-8?B?WkJGUVV4ZG0xMW1SVklHWFUzU29INnhjYjRpQldQRkJ6K2ZDbEdmRlptbGRU?=
	=?utf-8?B?QXBIcS9BSTR2eHloMG9IaWFSTFJwWElDZ204cnN0S1hnNkgyM0pKbVUwV3dI?=
	=?utf-8?B?YzdiUlIvT3pzdHBLcUptSTZjWFFqcnQwNy8ya1JuS1hQa2JDQXd3QnRIM3RQ?=
	=?utf-8?B?Tk9hTElOT3g0alBmT05aZ25vSWI3Ni9WZGRSd0lmSk5wR3FpWHJ5cDZGcnNP?=
	=?utf-8?B?TUt1TFdMMGtUU29wS01yK2JvaW5YRDVPZFZKaGVmNW1hd0E0WmMvR2Z2Rk1D?=
	=?utf-8?B?dkJjUy9nN05xc2EzWWlkT1VsWDJweVh0Q05ZQlVYL3pQZ2pjRG5JMUpiVE80?=
	=?utf-8?Q?lYb9aaTtF0jNvaLK3DDm/h3I0dxnyTR8zg7QytH3i4Q=3D?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39410400002)(39830400002)(39450400003)(39400400002)(24454002)(229853002)(25786009)(53546010)(4326008)(23676002)(55016002)(9686003)(50466002)(7736002)(33716001)(305945005)(50226002)(8746002)(42186005)(86362001)(76176999)(33646002)(50986999)(3846002)(2950100002)(81166006)(189998001)(6246003)(110136004)(6666003)(1076002)(6496005)(5660300001)(2906002)(47776003)(66066001)(38730400002)(53936002)(8676002)(478600001)(6916009)(39210200001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR06MB1264; H:loki02; FPR:;
	SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjA2TUIxMjY0OzIzOlhqaW5tWEFqZENLVXFkc0xiOGtSWGJvNjFk?=
	=?utf-8?B?OVFRQTlmL1lHQ3AyNlZ2NEljRXoyUFdCYmtVNnhtSyszMVRod25FR21hWkkr?=
	=?utf-8?B?WTBOL1d0QWJuNStTTUV0REtWcEZnN0xXSTJnenJ3d2Qrdnd2dWw3V1NERUJn?=
	=?utf-8?B?YlFCbzVERzRLM0svWDZLaG1kc3F1WkUyeGU0WjY0NTlYbndvVmp3MStEMzJP?=
	=?utf-8?B?b1hBV1grWnByT2RGUUdVTkIybXB4U09JcXBmeFFzRE9KVWZENkh6Z1pud2NJ?=
	=?utf-8?B?aDN2bmFxVGZ2V0NCQmRyVE5WMEowMGpVV1M3QmcvbXRMUlFaZXplektLVkRN?=
	=?utf-8?B?cTlwaUNJdkwzUVJqT0ROSTNNN2tkZ1h0V3NNMzMyTWo3cDJqbk1mcUQvWkVH?=
	=?utf-8?B?QkFLT1JlbmgvRzU0MWw1RFFyVmtwQTZMTCtxYmhhUmZxdnVNTld3SkZvb24w?=
	=?utf-8?B?NHpSQXNMZ05ka0hLOENqM25UbEVKcm1NNzRpVmowYlVhSkN1QlM5OVkvRjJm?=
	=?utf-8?B?QnNVM0kwNW9DNW1ZM284eTF5TUVNZVhaVFBTM05xTFFoK2g5ZSs5YzdHcHJ5?=
	=?utf-8?B?VGxwWW5zRms5Vkhvc0dVNzF5Z21STjBxTEtYQnJCWXN1NWFocDNOaUVGZUdi?=
	=?utf-8?B?T0Q5RTEybXhmUTRGT0ZMV2hhR2hHYkRwNGo5d25uNE1CWmJHbHdNYUhEQ2hm?=
	=?utf-8?B?dkQxcGhwUjg2SldoeDQvbHdRZUxzanVFbFZRRktzV3VGVHRtY3l3dUZlWXBi?=
	=?utf-8?B?ZjBQRWUwU1Z6UFBHaExjdzc5Uzcrc2h1NzlyOGh1cVY2NW5TQlVwNTMrcW1V?=
	=?utf-8?B?M0xLNkpyYyt6SUZYMkhBb3oyWjFsVTFlZldjeGF0NE8xWUZ1ZFVKZ2JVZXVl?=
	=?utf-8?B?VHlyd2JkbGJUWmZ1dHlRZ0hhUmwzQzhlV05CVjdJS0k0Y1pHYWsrek9jZzNY?=
	=?utf-8?B?L3djRW11dXAxdHgrWFRyMDJuY2hLYUp6UGZTUVlOQzBXT0ZDOHJzeE9wMTNV?=
	=?utf-8?B?NVVMZi9WMEFtTmErMjRmY1BJYTBvcGpRVFJsQXVBNU5xSVo0WDJBT1g0dFpm?=
	=?utf-8?B?U3RyVitpWCsrZ2VvTFVMbFFXblMwdm5pTlVMTkt0emZZWE9GMlFTMW1NWEhN?=
	=?utf-8?B?UFBhcDdYNndCN2w2Vy9vNXZQcWR0NXk5MVBhWngzNXBudFplc2V6ekFRRnNq?=
	=?utf-8?B?aW9mT2Fxb2FqaWE3ZVVhdHo4Yk9SWGJSaWhMOVZqSTZ3SFU0cE50UXZvMWxJ?=
	=?utf-8?B?NGgvdTI2WG1DNEN3RkpUMHo3VC85Y2c2RHJkQVdYU0lJdTBRVWVMV2pkQU9C?=
	=?utf-8?B?ODUyQTF3aFArZllWMFJBTHJJNXgyR0VrdkduTCtpMmkreHRBbHVmOVRROW1a?=
	=?utf-8?B?emFQRlEzanhhRXVRRjhsZ2F4ak9EM0pGOXJycDFUYUVvSWZscHJTMFhZTjlD?=
	=?utf-8?B?MUhwWUZuSVV3aEcza3hJSjdEbjV3dXJXVnczdDZMaXo2Q21LYWl3d1JDTmJq?=
	=?utf-8?B?dExIQT09?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjA2TUIxMjY0OzY6L3d1dTgxMzQ5TS9yK3hmNHkxV3BvblJSUjcx?=
	=?utf-8?B?NCt4VDF2Sm54NlB3MzZ2bnNwSzIwMEdSY1greVh1aUwvUmp2cWJzK2FETDF6?=
	=?utf-8?B?U3QwalV2ajA0ZEZtMHkzdXNOWEhwN3YwalFtTEhMcVRsbDh6d2dzVUhxRWsy?=
	=?utf-8?B?RjFQQTI4K0srWWM2MEZYMkxhcCtKYXFCdzcwMFFBUHlyVFBFZkJXSi9WalVD?=
	=?utf-8?B?WllydzY3YU8xODU0SWQ5dmEyNloxaVd6TGU2ajdUei9tY3V1NmRyWEh1VExo?=
	=?utf-8?B?SkM5RDZKc2FlWDZCSGVBMTh2bUJ1bUQ2elZ6U0haYjYxcnNRWmRVVFJLTk1C?=
	=?utf-8?B?aHpnbWlTblVzc0hDT2g2QXNUc1lzTkdJYy83b2d1bEhpQ3B0WXlzd0tWUWZm?=
	=?utf-8?B?ZkExWGxVaVRIVFI2MURxMEh0bHpvbTcvMlpBQzdmS2ZOYksxNXpYRGQxS2V0?=
	=?utf-8?B?T2IvZGUyN1JVUEVGWklCOFZjZ3pwTXhBdHlIUm9pSENTZTRVZmdpVlRRTTdS?=
	=?utf-8?B?Mnd6K29Qd2F0VzQ4K1d5aGlrdThZMXhnSWQvUXltZ1dLbWQ5WkVKaisrYStt?=
	=?utf-8?B?MHhXcFEwYVZMREhYZE8yVGpCR0Z6WG5wUDE2dGRPK2MvK1BvaWwrdFB1eVdV?=
	=?utf-8?B?aDU1VTV2VldScjdTMHlGYzlZOVR1b1c5bDRieUFtVWdrWTMrajc3eFNkbnpz?=
	=?utf-8?B?OWdkbGd6WGdGejdtVlV4ZnpQakpFcGtMb2hzMm1TdXhwOFcvaEZTTjRkcVQ2?=
	=?utf-8?B?aW1ZbndEQ21CczRucUJJWnY0TndWaThnMVNDQ25NSFNkLyt3b0xFU3JvNWFw?=
	=?utf-8?B?aVlaYlNVRGVwbjU5QkNKNUFyT0F6UWRNZ0s3WG40Y1RQcjljYVZhY3I4cXBC?=
	=?utf-8?B?MjFUc3V3UzRtV0d5VlJReUZqUzVINURIc2hWOERsTk40b0w4eE4yRUtDeEZT?=
	=?utf-8?B?amtWZExPV1F5eGNFSnBmaHJnR2VMeG9MYURnODZDVU5jWnhlRW5KUDN5b1px?=
	=?utf-8?B?b1Y3UXl5ZjgraWovWEdQSlh2Z3FOTEpmS08reGs0N05SOUNib0VHT2NSNVZz?=
	=?utf-8?B?Q3psZzNlWmUvRkFhd1pJVXMxSms3L2YzQklJTUZjN2c0QzhwcHpCUDlnSlpN?=
	=?utf-8?B?MEE5LzU5M3JzVnl0OXhjTUpSa2xhVVZyL0J4d2IwSURlN3pwUGtFNWtiU2hR?=
	=?utf-8?B?RzZhaHBSN081UUJBbDVkbTcwbnFFaVN0UEJ4UkUyOC82MUk2YVFmYTVBNDM3?=
	=?utf-8?B?N2RpRVJjT3hWMVRkMmVBVkhCNFVRVDdEeW9DUTdWSk1uMEFRazR5VWhRaG1H?=
	=?utf-8?Q?65uqA+RRQ2g0S7OT0LSMeOhdEGVBGxM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1264;
	5:DkDgZRc08ymkXlq/G8HfN4jZ9/Yqx7eaVEEmIWH6LqwzwO2Lh7tlf0NCvLn8aN6NVyBUUSJTpyg5h972deGJBrhD3vVpdGGsS+BtblwPwvIZfCv9DfaZmY+RvvSw/KCd48utcb57O6VOnKivdvLLVCY3vkxSOru58lMnGdStzTbb+MI9Y+zTAVH5xk01b6d2pVgWNU1tIKvKA3UUpbkQPEwboXAfYfjne5e6u5wj9KHgHnpqoM2zGRAjUgFHbFvTFSeYdCDpGku2OS8flb751BwGE8Mh68ck2ulL/Oa4Ycf6pFvEf2LM2rmNpk234FZ/vPEt5pQNFoUw0n9Puct/GbG5YnhXGfSp7XfaSFfrCNtvWrn4v446cyG6IPO1+Locnw+P/h3UyP0hdJxC6XwmsF64jHzUeewiHWOk6qEMGaaj/geQWNt2PvZSa9oSRB1CDX50EbDBUjLikYMgakWnbZ40VryOQFeyFcpfDSrQbocZeA4Yob2q94zhVuJeclbe;
	24:EOh/Q3J82aO8JmifbHNb8ulVrztN4k8nhfWXweFXAu8z9AQVyfxvLbfFKSAIy1g3ij9FrMjv29Ki6ZW9Sqe0qv0wEX+lGvvsGg4GqiadYxo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1264;
	7:6LBkvCug7oNqAHr3u9miQl6AXWX/bom/JWioCzpmz15YrHT6n/B9peJl2n6K4hlqvyG4bHCvNvNyNHRkeMk831Q/ZMRNawQtWImV8S3TKGIk2WMOldEQ/MM+thHwUOwIeqr7OPyvBkQDoXr49q1kiE+tRkxAW1EL0jSQ9g5G1CK1fDQqdMxa3249bn3qwWEt3Fl/HpNb5inWNDvkC1ZEFdpV4OcZO4KuRvy08aigLAgrIhmp8TKDeA9sEWmFehXebx0mlz29rTIOKff17RGCvCeyBedgWMR3ZTmbmjbdg4xZopQB0/McEUfoiWNbfK1s7p0xloVqvp0rZ7obfk7hfmZTQ12D88J1FmXylQZJLdQCln9J8vB4Q/+ij45IKSwf5yMLLyHNHNPbP/eibxQFd9ND2P/0nnzjcbyxB+vfXWM6KeJQAoirFF1+lfwXYh7IEDmNnlEhCNSaEwiyBxgpvX4JzrFSjekHSmtXlM7J5cZMXyH8TaQXcGA73cm7Mlc+3wydrucISCA5GJ2ROoT0w82mDfw4sbt0462Svm6OhEGd7gO3xwYhwSU/SbtP5ZhIa2Vjll+juvkieWwXCT6QaPyMHeUku1qXgcg+sVnN5IHvKB2iMsK96K4XhPdseoSXIRX5jcZVL2EYXpa7sph2cVOWrzbEgfJ/3j0uLkjGzHdGY9MOnlgoF+32PJL8nfrey7THCp3GP3XjsXE2PMDgr5lqhmw+vwqXT1MQRXfI9CkO/ijjw72q2zofJ1aDMINYXjovqkMTNxVYlhEFW0cnZ8x4X7YgsCdnJReHUSyogak=
X-OriginatorOrg: tbs-biometrics.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 13:21:23.1850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB1264
Cc: Openembedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: how to load cmake args from git?
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
X-List-Received-Date: Fri, 23 Jun 2017 13:35:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


On Fri, 23 Jun 2017 13:53:05 +0100
"Burton, Ross" <ross.burton@intel.com> wrote:

> On 23 June 2017 at 11:57, Adam Trhon <adam.trhon@tbs-biometrics.com> wrot=
e:
>=20
> > According to documentation, this is expanded during recipe parsing. At
> > that time ${S}/oe_arguments.txt does not yet exits (it exists only after
> > do_unpack). I tried it and the build failed with python Exception:
> > FileNotFound.
> > =20
>=20
> Yes, good point. In m defence it was late. :)
>=20
>=20
> > I tried
> >
> > python do_setup_extra_oecmake() {
> >     d.appendVar("EXTRA_OECMAKE", " " + open(d.expand("${S}/oe_
> > arguments.txt")).read())
> >     print("adding "+d.expand("${S}/oe_arguments.txt"))
> > }
> >
> > addtask do_setup_extra_oecmake after do_unpack before do_configure
> >
> > but it did not work as well. The "adding.... " line is printed
> > correctly in log.do_setup_extra_oecmake, the file exists, but the
> > arguments in it are not used (I checked run.do_configure).
> > =20
>=20
> Have a look at log.do_configure and verify what options are being passed.

I still have EXTRA_OECMAKE=3D"..." in the recipe, the arguments from here
are being passed. But the arguments from oe_arguments.txt are not.

> I'm also assuming that you're using the cmake class here.

To be precise, I inherit cmake_qt5 class, which inherits cmake class.

Adam

>=20
> Ross



--=20
Ing. Adam Trho=C5=88, Software Engineer
Touchless Biometric Systems s.r.o. |=20
Palack=C3=A9ho t=C5=99=C3=ADda 180/44 | 61200 Brno | CZECH REPUBLIC |=20
Mobile: +42(0) 721 565 113 | tbs-biometrics.cz

