Return-Path: <adam.trhon@tbs-biometrics.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0059.outbound.protection.outlook.com [104.47.2.59])
	by mail.openembedded.org (Postfix) with ESMTP id 45F3B6011F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 18:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tbsportal.onmicrosoft.com; s=selector1-tbsbiometrics-com0i;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=XbCMfIwW9jBwkzl3ZZlurCT2nRq7Il+ozH7pWovHWBs=;
	b=IKuLG1O94TIGSRCQTsfB0LB+pt60/iA0lYm8kN/zSvQ0kDe1y87XJDXF000qpXFXuAHOyExmGToB0dk7Hlrj0EQUIj+7dzW5t+nGtaQuSRAl5W0KUtSRfxJwwO3hJxIHDcmHOhddHlN2VPSMFnqPYrIp0snIC6ZmZIkMgyTphIk=
Authentication-Results: intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=none action=none
	header.from=tbs-biometrics.com;
Received: from loki02 (83.208.72.126) by
	VI1PR06MB1261.eurprd06.prod.outlook.com (2a01:111:e400:518e::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1220.11;
	Wed, 5 Jul 2017 13:59:54 +0000
Date: Wed, 5 Jul 2017 15:59:50 +0200
From: Adam Trhon <adam.trhon@tbs-biometrics.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170705155631.548cfb71@loki02>
In-Reply-To: <20170623152119.3449aecf@loki02>
References: <20170622104209.260f4563@loki02>
	<CAJTo0LbmHft+JXd7ce7r3JCza4G182D4Hnt78hU89DO+TYCNDQ@mail.gmail.com>
	<20170623125705.08cf0025@loki02>
	<CAJTo0LYhB1seMV_QyDf_PWkGF0fkubZb3WHpV2dcTfeU=ysckA@mail.gmail.com>
	<20170623152119.3449aecf@loki02>
Organization: TBS
X-Mailer: Claws Mail 3.15.0-dirty (GTK+ 2.24.31; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
X-Originating-IP: [83.208.72.126]
X-ClientProxiedBy: HE1PR0701CA0074.eurprd07.prod.outlook.com
	(2603:10a6:3:64::18) To VI1PR06MB1261.eurprd06.prod.outlook.com
	(2a01:111:e400:518e::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e9ecaae-570b-45e8-05ef-08d4c3ae1d9e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:VI1PR06MB1261; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1261;
	3:BOYnhBNunsfKSylhQp7Gk5XTZ6wJAN0r5SduAsy0h7V9WTHKoBew1ocUFNYIdVS8JYzuRprzNkB35iO2UIU5TMa9tC3l6Srs3HxmNcweoSi8FwCbZKwYR4h1FYzJ1Af0ffRwccLPHI2MzayYlrtDydbqe+fgul3T5YAtbE5Ub9MyGmM7jBu2KSaDqUYpBwdV4XtyyQHdguQEzZ2oiHKBhn38s59a44JPHKh774YJbKeWiD4QAumtNjd9j+UxPuMdK5P22hdKo5DNlpK80K+ifjkXycdmI0hY7hToM2x3LhYzwBREkkksJ0udBAtnF53dQl28N20mv7oZ2UNpsUWH9a/WwpbgOnCslNxbgzYx9QZW05m/wIpgq0VnEGCyTmC9HJKiEPCNPDlPOEeuwwv4CFLvNHoJxGvqVJMeDSFujMpAyiArW21zXA6aS+U9dT8r25lHvxut+aJvsoPFkG3BaBDOSkuEZdVZqwFyhOBFqwMERmZ9RgoGCErg6cJRBqISoV19l/PXQIjEa+wpqmcibrYTdV44KFI9kxqx41Wg2qSUsSZ1OEA2FdL2YH7cXLsOpBE9mpuQAMDE1uEH0TQmJ4cTD70c7V1fWHnu+0Wl/dcZTji953iW3VdHCy6i9voLrgrKLIdK1uvYylJD3NSDCYKDumq30z1P9KTUK/T6Bra6NJeM0lRcX3H/AFl8lVBc8H/bwvhrxGa9ks3SU3d9UMyDvDpMkP9WGDppbgEKIcp6VDSwNfkAn5j4V4+Xapel
X-MS-TrafficTypeDiagnostic: VI1PR06MB1261:
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1261;
	25:Wvf2mnrSw9HAjKHWVf4CEiLANd0aO76gQOmTaJWneQZZSb57rNfMwvhZpM7Xr4e0te7/XUL78B+guRvdm7WAKRwTAdJqBO+vaj8D3oKaz49hND7mCsUHJxkdAqlj8ukH2TTj+zS3IJ3s1F0GB3DNRm2Kctl6ZPAFUWKZSDwCjSALUrOAT+kxSW/Ql00naawa6cd7zEltAl3uqGRinOlOT2d6MYYbcyjnO4MexEe1KnPPuKGz3mVU+h0QT/PFelNgHYUHFJd4Gd51ZRi7OBXmVsoCQKCSBlZHnCSBiv4bWxoEvBz1UoFigWfRJBR/0g6sC55qJLdjzfxVf6lrAzy24PvfQbb9MRi1r0vNIwofAVEgKmK2RixkPmKZ0Qd0DTMOA1EzUAeUJ9bfZwxMfmhSi11dzRGV0phwzZwZYtV0mZFIHxVpDiq8ZQbcpQRYdX0dvUsgux3Ig0OgQHSTdjIXZn5yq2fhrseLx23cLdqnsu1r4jPCBDwATKG/UBNlgM/nrIfzX20a+0GUUMA7Nlcw7CAnhZnq1R0ayAKEhTgqQrItULlVzBXw4UhL8+tsiuu063NNOKlcTpNtGLP/7yaQGgD5+ZPMOJ3jHXvaPuMJcONp39QGRlwgmFe7X6ypMIJTLGJdRFsQJ+8rrdyJG/6wxgLrzOpqnJ/QiNCFK4Q3L+AN+6Cu2cIzANTyZKrHr+xNH1+eLzd6f18PluiaD1/QYsmOJk3LK7eMNW2uAUXfucqK6B9eu/LmmbQFyrGIl2o5KJ1gIROUKL83YmeMmI3J/yZ/Z7ICM88f3qNgdCBSqEDp8gVGL4wWxS9oZMOEtz2fNr02AobXmpE1UcgZZJ0Kk0Ly3GGrWOTyguxoPvC9N9dE/TCAcUCdu6JxwuG9H0DLPSHGG5LD0tkeNP0JRrBun9xPH/4swu7KkralXhP2Fzc=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1261;
	31:L3UUwDuQz9lIe584NQhM7hQXlniKkqURXcNnlFOt068iNXWB8iPFHHO5QYrPruYSVWXx/qgy4cLeWtjweN7hFoj+UzrISwsZnRumZctI0mwjtSJUfBCD7ddxduyc6NIhDWqTJXkgk0DxvJHGBRw3AVjbEkiUKYpDsIgjekf0c+zRYS9RdgfupDq4x76TsvNUwmPZloWowbl81BrjQvaQb57mUZV67ktIPzLeX+H2D5EzhyBG2yPeckS4FX8NG7oesCDXUIO5zOAbPSjuRg6PHcqRazRX4CzQFBbm9ixwUFYd/TcmAwEFt83ufSzgybA51nJkbANrci1K2TcAGxRpC/F4zp0WcJxs8wjU4L7QZjWGaU87Namj7O3QbsoKSXyRM60n1/wkAET/pNc310TS8WohbNuE9JRqIqeiHdP38q6Ks3QxkvJrPP+fzdru/7ydttt64JPrgrI49vIMw4cvATE3lq1YhJsGOvpD4dVcem/ijJN7TnRT5kfrgknGRQ/k3Me+VeHK05Q0p+jhgIQLzxVnX5vjRJ5jMURJFOS2NydI5T7j6FeH3pJW7bU+WgIi/fweKpruBlQsDdiDBOgduMx/4kFLVBmQuwA8zx1JWp3YSP8neIogR2glKfY58bZ/ruCS6vgdHpkf+OlXheRXEF/SsflTAb9+O9DL/yIgndDTa3pikCCP69CIMNa9ZfE5ZPjjb5ORmtkzELoyPt5Edg==
X-Microsoft-Antispam-PRVS: <VI1PR06MB12612684F4E79021A611A1BCA6D40@VI1PR06MB1261.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228)(209349559609743);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(100000703101)(100105400095)(10201501046)(6041248)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(20161123555025)(20161123560025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:VI1PR06MB1261; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:VI1PR06MB1261; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjA2TUIxMjYxOzQ6cnpBRkpjbmpuWmJ0THZvQnhqZXluOTA5ZlRL?=
	=?utf-8?B?cmptbkF3aFR2N0l5NEM2bEZQUllkSlJQRDhUelIvQk4zZ0JQd3FSVW9xbktl?=
	=?utf-8?B?cERHa0sxS3cycXpvbmt5M21wbzRJOWxRd2d2SEYzS3N3aEpLQWc0QVJEVWhx?=
	=?utf-8?B?VlBIZTlIRUQxcFpseE9IUExPUExqdTFGV1VOd1JQZGx0alNVQ2Q0enRuMlV6?=
	=?utf-8?B?RCsrWnc1VEpOQm4zbmNHMmNPeFdKcHdnRnp2bHVWUHhsUjZ1cnRSVUx0a0Nh?=
	=?utf-8?B?L0pmK3AxRHhTbGRNeWpudVJ1eFpaanp1QzQ1RjgvT3FJZ3RtT3RNakRpbE9C?=
	=?utf-8?B?eWNvT3JVWDV2WHhHdzEzcHdFbXNodm9yWERObEZYS2p1c1dtQzh1d1ZnSDE1?=
	=?utf-8?B?eHArUDFLVFJnMjc4K1dybEloRXgrQnVxSnFwOS93c2FqY0tyT2w1QjRWRUZK?=
	=?utf-8?B?Zzd0b08rMENtbTZBSGtZaXkwOXRIalVlbzlCSUxuV0pSdmsvMG5XUzlOYWp5?=
	=?utf-8?B?RjRQYjVMeWdRQzg5UUM5eGVxMWx4Qm5LYWxIQVVVUGhRY05UMU02WmFEbUVr?=
	=?utf-8?B?OEU4VHBjM29INkRJZEtMZTNxVUxydE5CVEM1cVhZSjVpSlZiUW1MSjE4VjFn?=
	=?utf-8?B?Yk96anJqV3VXZVEwd2x5VDRWaGRwdkJtR281OFZmMWZWb3U4Y2o1U1BVaVRP?=
	=?utf-8?B?U0JlblN4RndtbVY3OW1JZjk5L1BVcFI3N20rNmY2UERjSnJROFYwTVJ1ZmZi?=
	=?utf-8?B?akpWVUJvWjZpQWRZeTN1ck9vUlk4UDFrYld3Tlg5aWEyREtPY0djTUIwWUJX?=
	=?utf-8?B?QWtpQkZKc1FDN1lzTm1HSE5IelNjRWVpeENEWDQ5T1RQOHh4dmdKSUZQdEx5?=
	=?utf-8?B?bDJFZ1pqSGN2dENBUTdpVXBxQ3dUUTAvZDcrR2NVK1ZBbHUvWVdTOHRFZlpF?=
	=?utf-8?B?M2M0L0h2ZG84cjR5RWdUcEVOS1Y0RGpXWS9aZDlSTGFtMGxXMnFlWFczQ1Zo?=
	=?utf-8?B?QjdrTmcwa3o1WDVtaTZVL014WkY4UmY0R291NnVwZ05MQmg0QU5QZlVrRWRB?=
	=?utf-8?B?UUVhc0V3T2pqRnorVlBVeG92MkNwRVVERnJZU0ZqYnhUQzd0cmxEVEtaTjU0?=
	=?utf-8?B?STRmaVdpK2ZuYmg4OHovUm43TzJCR3RydjcvVFBPVnZPWnRxTmM5QWNiSTAv?=
	=?utf-8?B?WmVSUUpEb1ZYOVZNT3VYem4zZ0dtbDVTZ2RaQVlkbDV1S3UrQ1RsSXpGR05y?=
	=?utf-8?B?MEhDOWhCOVkzZS9la09FbEFpejFNNmhQcnN6ZVdFVndlNUVNUGVLR3A5NXZz?=
	=?utf-8?B?TytJaThFU0FRS0lNblZ4M21HbDAwdUVLTGZ2cGo1ZlJYTkZGVjJYUFNBOVB1?=
	=?utf-8?B?VS9IV09LakF2MjhyM00ybURKRUF2bFlXdkJLRlJLZkRUbVlXUlNEMlhNdFdp?=
	=?utf-8?B?OW10d2ZYbHd3ZkdOZWs5VWRHNHZnOXVxUncyUCtHSWNFWDdOSzFRckF3OHJv?=
	=?utf-8?B?SHg1UDJPM3l3SVUyZGloMEZhZ1RmWVRxVTVQS01QTEUveDVDU1V5WU01QnVw?=
	=?utf-8?B?bFVQTGlFbk8zR0JKNStKTHVzUUxIdENQVGVZdWJPeUJxT1RFaW1sbFd4RnJY?=
	=?utf-8?B?MUNFZWR4MTFoV1ZGUVRPT240YkQvbzVmUitGZUVNcCtWNi9CditRQ1E9PQ==?=
X-Forefront-PRVS: 0359162B6D
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39830400002)(39410400002)(39450400003)(39400400002)(110136004)(8746002)(86362001)(81166006)(2950100002)(6916009)(6496005)(6666003)(23676002)(33646002)(966005)(8676002)(38730400002)(4326008)(25786009)(7736002)(229853002)(50226002)(6246003)(5660300001)(50986999)(305945005)(478600001)(55016002)(50466002)(2906002)(6306002)(6116002)(53936002)(33716001)(47776003)(1076002)(3846002)(9686003)(76176999)(189998001)(93886004)(42186005)(66066001)(39210200001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR06MB1261; H:loki02; FPR:;
	SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjA2TUIxMjYxOzIzOkkzQVdvaE16eXAxQ2JON0ova0Q3Y0hJOFVm?=
	=?utf-8?B?YkRUcHdPNWo5eEVMcEkvbWQrV3VsYnZvbVh2QzhxS0tkOXpGcWJxbkhsZEU1?=
	=?utf-8?B?ODVUUUtZWVZqTndKOVJLTnI5Zm1Xd2R2OHRZVWdUNk9zcVo4QkFMeXVOQWdW?=
	=?utf-8?B?YU5wN2QrMlJuQ2F1QUVUL3o1V3M2TGpIOUNiSTczbXBSd0tYMDl6azNjNUY4?=
	=?utf-8?B?NmZrL3F1QXRzVkk0Z1VaY25SK1lKTGhHK2xIYXFRRjNibjZKS1Nka0FKZTBa?=
	=?utf-8?B?MlhGY1cwNC9MSFhvL3hPUFpmZThuMXpxU3hRb1JnbW9nQ1pRZEpVZkFCUVo5?=
	=?utf-8?B?aE1IUlR3ZUlaU3dRWjdQeHJyYy9ROEdVK3gxZDhkaTgzVVRJeVpYcWNxSDVQ?=
	=?utf-8?B?VXppbEt0ajBmTkU4TlVWcUVVcXBXK2xudVVuZDBKVUd5OUlWRVhPZlRLb0U4?=
	=?utf-8?B?TTJaVVFzR0g0QStZaE4yUU1vdjQ3aW5DdmhvVENPNWRrZ0dROTh5YmZrdzd5?=
	=?utf-8?B?THJyV1FpQlNIQ0pRaEtXVmZrMVBlbEJSai9JUngwenU0UDF1dmVmNkozeFBF?=
	=?utf-8?B?N0NMRm9HYzlzNkNadHdXVEU0ckZXZUFRajlpYWlzMjJ4bjRvK3cwZnA1Skda?=
	=?utf-8?B?K2FPM2VyeGMraHRlQkJuMnVQQ0h5TmFMM0xzaW5FS2RxTk1GV2xaNzc3Y0lh?=
	=?utf-8?B?dDNRc1NjeFJzY1M5MFI2NVlGeElwTXFieDQyNmtaYXlCRlVJZGRiUWN4WHJx?=
	=?utf-8?B?YlNVU3o0Wk5BRUtsS0VSOFBTOHQzU3JRWVA4b0RqRWV0OVI5dmtMRktlbTRm?=
	=?utf-8?B?S2lHVkZTYTFpUkU3WGpSRk9NU0dNRWpmMEVhME10RFZxZEhSendONGlkSG5U?=
	=?utf-8?B?TDNMU0hPeW5ISlJkVHlxdllIQkllZVAzbkxZVVpieW1DTVFuOWZuRGlONWhO?=
	=?utf-8?B?VldnM2xNTVB4TVZhMFUvckRMUHc4OFJvd3dYeWJvQSt0TSsvUFljcDZHKzhR?=
	=?utf-8?B?bG44b2YwdFdJK0hkc1ZGVFBtLy9jYUovMC9kbUlTSnZBckdOeVMrOHl6RWkz?=
	=?utf-8?B?cWNTaG44aTl3VWpqbk00K216ZUREbnpuRy84NTlnSFUxNVRZVkFDRlRzRXph?=
	=?utf-8?B?UnJoNUNNVmJuUVlUYXZodERxN1FpVHdDVEJ2K3BPOGxMVVBWMjRIa09CS0ho?=
	=?utf-8?B?aWNNYjRUZ2pvdStncWs3Y0lqUHNTZzE4aG9qYUpSOGlsUnJTUENYM25UVlNh?=
	=?utf-8?B?UlhKMWZrKzFSYTM4QTlWRXZXZU5DU2lnUEI2cFhESXhXcEZNZGd6Qk9yRjYz?=
	=?utf-8?B?V3lQSm1MV2V4U2g4QUg2K1VXakFQKzN6MUJkRkFENGFxOXZ5SXVPZWtTNHJp?=
	=?utf-8?B?ejFVOEFXdUsyYWlQMnMyNUpOQkMzQnJYYk5pc1crSU9kRjBOeStTNkhOQlBz?=
	=?utf-8?B?a3AzSVlZbkVKTFJrTXgwNnBFWHRKR2wxbmR4QmR6MncrUzhHeEhFUWNrNzZ2?=
	=?utf-8?Q?9H3xPU38V7egqOq2aA6L+o0ckfr8/kwE6rmeix0uKl6+0t?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjA2TUIxMjYxOzY6eEIxWkR6V24rbDJHVDRVNmFuVllwdVhMWFV5?=
	=?utf-8?B?VUtDYm5URkg4WVBBbnVIcnRWbVB6U1ZRV2o2UnlvQ3BhbWI3Y1Z1NjNFbGNv?=
	=?utf-8?B?eC9IcWR3b0NNU2NqR3ZsOTQ3YldjaUNSenEwT1U4dkpmU2lYWlZJb3Q1Rnd5?=
	=?utf-8?B?ako2OVlxazBmcmc3VlNGVXFPL2tBSm9RazErOGQwb05yOWVGWGErUzF2Zk53?=
	=?utf-8?B?dmQzalByTlowWjRZRU9INmorL3ptcERFYWNZdGJ1cjRhV2MyelZqZDJmaVdG?=
	=?utf-8?B?UVVpMHNielNrVjZHMXdZek9XUXhERGFhSXdIckVHbzRiNmN2UDRtUWlRSDB4?=
	=?utf-8?B?aGFPbXVrVEY3UzZ6R1ZTUVdNR09sUlRseDJyVVFDUm5rY0tKU0JXZWVHcmE1?=
	=?utf-8?B?V0tiNGcwd1pDRDJhMUM2UUpadENITWZ1WGdsYkhPSnBPbFU2OGdQdEV3L04x?=
	=?utf-8?B?Vm5SK2RTeDNSSER5YkZ5ZHF5cVBCZ1RkalRQeVRncytPOURSWkEyUkRRQlJH?=
	=?utf-8?B?R0I0ZVp0ejhzYlRnOVREekhUMXgyUDQ2ajc0Y2s2RHF3NkZoYlZZRlFrbFpo?=
	=?utf-8?B?eE9XQ2FRS01RR0ZiL2txenZBUTZVZm1EUTFTaWNoU3ludVN3c1Btb2JhaEUr?=
	=?utf-8?B?OTV3Z1lra0tJYWplcjd0YmNFcXBSSit0WmlCbCtDcWxBZUZxVmdNc0pZcEc2?=
	=?utf-8?B?WUxSWjdNem5mYUdIeWVSRUg0MFRoTjBRUTdKMnpkUEpWY3IxTnhyM0VOd1hr?=
	=?utf-8?B?YnVMQUcyYlRjVWE5ZlBQQ21QdXBGNzB2V01LU1ducnRva0UxdVArbUtCMVRP?=
	=?utf-8?B?TllRSnd6MEtJSmlhdWtoZW1vaklQcXIrNXZHbVhWOE5BVzM0YWhZcWcvQ1J0?=
	=?utf-8?B?eHl3V3k4UExIN25ocFRVSWRRV3J0cDR5azRoRGJ4RGc0czgyVnhKQUFibElI?=
	=?utf-8?B?SUFLTVRJQyt2NVhUZndzTFd3MnpxSU84dGRlMkM5R3kxT1Q0cUhVWTdNQTJs?=
	=?utf-8?B?U0NDbll1akROdE9aQ2M0OVIzQ2NKME56MGtSSi9PL3JqVTdRUDAxWVh4eWh2?=
	=?utf-8?B?VnFBd2FvcGV0QXdFbkNIdk1GSjRjZjV1QkM0TzJYbnhOSWQyVzBtQWsrWDUy?=
	=?utf-8?B?ZndQRmRsdEZXaUt5TEZLaE5sQ2oxa1crOFBML3diVDVZMTdsTkdZZWVZL25C?=
	=?utf-8?B?ZHdZcGk2TG4reXVlSUdTTWx0VzVUUldDNTdQWlQzdUFEZjJDa2xPbHJuUUpC?=
	=?utf-8?B?NkxhZG9Ya1g3M1EycTZIbnRVZW45SnJ0OG9WS2JhcnVDT3IrUHY1bnM1TW1i?=
	=?utf-8?Q?6GA2zIPXcaYdPqsmSaCgKWFwjDmLY7M=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1261;
	5:EdLZwS1aH/VXg2YVAgFLmEFZHELQ3nuPsWdi7Y4YekQH/iL7k0atae0vGTihiKK4T3opJrYO8LrgtKn+0Fd2asQdTC0Uf+lqMlMaVPRbeO0akI66S8x4VIvQNjLlu29vvl6dF6NupN+y0tvSXXWRmjIevGvR13InO74SmVUxeEfySsCSoaVfUUho1T3/8oj2gkU7wHA90rWzWqALXCR15tpQM/2mlJWMDCH87FxfoLK+ja+Gg4gVRjOXTIvcWBe7YU4p0OO+CF/W6feYGCbZZNi4l3OjMhJLCLuPNGiZGX2QzetZW63QWTE0c5ozmK7Sf1e4k/rpHonGm20DIwoDOkqaVL12E3r/rCbMPEVgMsFpBp2dPBY/7nWWpgg/vV3NDhEfh/iPtp9O3maDb8/HfKxk6KOCgF/XvksIKhUySg4s2bVN8cIZpW6ZhmzYlkqbmrRzaXW6Mb9dDAYuTdmTIXxgJJ3qW5XRfe8oiyWb+Yy56WOy9wnQX+u4qp1BWtnA;
	24:zaZkKAraaDOwnWOKdOvPgrP2gRjEwEOEdmllLfkZzrHbJ2uUOA7pVqOJUgePoj819W4JfMe/Z9NVc0DBe6HejUz71Gx4nkfcsqvB8OOK0l0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1261;
	7:vDiBJEihqpOndsYu0H3JNbzLvpniOZAW0rNxtNl5WDC7UZ1xSMXUUBaxel1tFNiBk9mpeU9XR09wu1InqdMvMC6E3vjNhsM2UbEBEVgasfyV9+0u3XLM9KaBPVPbuz9wDrdcK4CTEeoTE1E247tAgwz8QAbxecy7xYOsLt8DlV/LmtjqeU9BdL11bPET147yDRHc3t3EXRpuCiYRN4GVSsrA7VTOzNgJz2bwZe3y/J4TG6QboG61mVESA+KSgyn3IcZbydeYIGr9c5j9T6J7cw0PnBirJeI6KEzrbQoPVJ7uTlo7aKS+8PoZNuffuxj5R/BgBFHqvI+KHohkKjMwGwJkMzm/vxVd9zd5D1RMkzfB5mUTUMdLF6KJkV+Wm4S+AEDVJ9rPjHyP+GlWevxlT5Qw0SkR495eLmLihQT6RbaeGJaQ7VKAzIAJPJgATL4TVnITpMZM8dAdYBkfYpn52rcVFy0oYkL2dilTA1REwjdmM7ujNCBkHLg67Hz7LDqu4zYSRcxUW3ozR+ivb7UM0w4KyDgJeGrHMTLKtJlLhdPJaf4FjvtO8Wu/cIutDfY29nKZTbyGmrd0Fg18VP9rHZd/r/WJQES8eaMAZCNG9R+a9X6oqQOaFRkgCELJ03uLBypjQZqteatMlUAbp/WHslYoqziFZVPNnrQbk/todIu5N3iVFVi8zloMyQkOnFnYjbQAoweSE6KvUBO1IzbQTp7/8o00akeEGERTk+tMcMMgwlDgqrASEu+hSnu8qgGarUuCCI7+yFg1+F0FM4xqI84zmHtKVNNV3lDLNmpRp8M=
X-OriginatorOrg: tbs-biometrics.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2017 13:59:54.9078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB1261
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
X-List-Received-Date: Wed, 05 Jul 2017 18:33:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Finally we figured it out. When chaning EXTRA_OECMAKE with python
function, the function must not be registered like this:

addtask do_setup_extra_oecmake after do_patch before do_configure

but like this:

do_configure[prefuncs] +=3D "do_setup_extra_oecmake"

I assume that as bitbake controls build task environment:

https://www.yoctoproject.org/docs/2.3/bitbake-user-manual/bitbake-user-manu=
al.html#passing-information-into-the-build-task-environment

the changes of EXTRA_OECMAKE made in do_setup_extra_oecmake were not
propagated to do_configure.

Just for the completeness, how am I supposed to globally modify a
datastore variable from a python task?

Thank you
Adam


--=20
Ing. Adam Trho=C5=88, Software Engineer
Touchless Biometric Systems s.r.o. |=20
Palack=C3=A9ho t=C5=99=C3=ADda 180/44 | 61200 Brno | CZECH REPUBLIC |=20
Mobile: +42(0) 721 565 113 | tbs-biometrics.cz

