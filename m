Return-Path: <mubin.usman.sayyed@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0089.outbound.protection.outlook.com
	[104.47.37.89])
	by mail.openembedded.org (Postfix) with ESMTP id 1C0DE6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 10:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=klzlab4SzMLfKWVqiAKIT2sRdtj1kuKXqFbncber1gM=;
	b=aTYpjLBFPwF2hxC+c1NpGRrT5j6HAAL9ywFbTLK/mDLjRiC8SDOpJh9mo3KRbfgWVEYDxCD203PKUGUPZq44N4Oqe9dsJej2E+Kfrlj7ULUeuKh2Ir2OZCS0Ux4n5RV/zEGfrR1RpnoKrPOFR/DCW1GWV5UtD3kmaOJsZWh7tOo=
Received: from BLUPR02CA036.namprd02.prod.outlook.com (10.160.23.154) by
	DM2PR02MB1307.namprd02.prod.outlook.com (10.161.142.18) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.587.9; Thu, 25 Aug 2016 09:29:58 +0000
Received: from SN1NAM02FT001.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by BLUPR02CA036.outlook.office365.com
	(2a01:111:e400:8ad::26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.599.9 via
	Frontend Transport; Thu, 25 Aug 2016 09:29:58 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT001.mail.protection.outlook.com (10.152.72.158) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.587.6
	via Frontend Transport; Thu, 25 Aug 2016 09:29:58 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:41151
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>)
	id 1bcqz1-0001WT-PA; Thu, 25 Aug 2016 02:29:59 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>)
	id 1bcqz0-0003yH-7q; Thu, 25 Aug 2016 02:29:58 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u7P9TuNo013405; Thu, 25 Aug 2016 02:29:56 -0700
Received: from [172.22.159.26] (helo=XAP-PVEXCAS02.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <MUBINUSM@xilinx.com>)
	id 1bcqyy-0003y2-Ah; Thu, 25 Aug 2016 02:29:56 -0700
Received: from XAP-PVEXMBX01.xlnx.xilinx.com ([fe80::4c50:cc5:695a:c7f8]) by
	XAP-PVEXCAS02.xlnx.xilinx.com ([::1]) with mapi id 14.03.0248.002;
	Thu, 25 Aug 2016 17:29:55 +0800
From: Mubin Usman Sayyed <mubin.usman.sayyed@xilinx.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Thread-Topic: [OE-core] [meta-oe] [master] [PATCH 0/3] Added cpu benchmarks
Thread-Index: AQHR/SNoq94wReEHtECYO+1qa7LP2qBV2I2AgAOTCtA=
Date: Thu, 25 Aug 2016 09:29:55 +0000
Message-ID: <366532EA46EE364DB88242E771105CB59D13F3@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1471945649-3164-1-git-send-email-mubinusm@xilinx.com>
	<CAHiDW_EN1ZpGUZuP+zJDOtUqnpP+fgtFzMYc=7ZsnJA-eJZXfA@mail.gmail.com>
In-Reply-To: <CAHiDW_EN1ZpGUZuP+zJDOtUqnpP+fgtFzMYc=7ZsnJA-eJZXfA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.95.144]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22534.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(189002)(51914003)(24454002)(377454003)(13464003)(199003)(92566002)(106466001)(54356999)(2920100001)(33656002)(2900100001)(50986999)(2950100001)(81166006)(47776003)(305945005)(7696003)(55846006)(4001430100002)(7846002)(76176999)(5660300001)(8936002)(2906002)(106116001)(7736002)(81156014)(8676002)(15975445007)(11100500001)(50466002)(356003)(63266004)(107886002)(4326007)(1720100001)(110136002)(189998001)(3846002)(586003)(6116002)(23676002)(19580405001)(19580395003)(5250100002)(5890100001)(87936001)(626004)(86362001)(102836003)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1307; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT001;
	1:br7j1pYREOHYBKgDx1kTbu4MN2tXuUvFEATvFjDloVeeT0tgOHsB/9fIpyL7tyqHDDY0/x2lFrSLLB04PnpXX+Y4unYLRPkB695zcY295GfAeJlZ8xFmnKJWsKNAt4qzCgK2HqmRNmoREecFNMUt6U8cWNxfdCPSbQuAb0JTkRfcvtccXDX3sLIODq/hDSwxCglMMTWiT0wpXuWYSry3EXWckQofmetIvrbVBV1xpyX+ACXkrD6TPn8fr6AYhcO/IOkDW60mOyNmksZhOHePweIUEr7j0DLTStGjbD1fjgKqHKoB3fgqMMMBgWa6tbVWlwYHNXpfhfYMXkUpFyCH3jpKwrAUlUz/KRiqaeEM2HNmiQ+QyKX/rAChZmNLBZLR6jO25RupKmFoUqzH0PQrQAh7/YG1izowoXpkRA0W6sWMCP+Rrn8RM87C82NferX7trxlk6MJGcEs+tYRkJjfNmx3YER2LGoH9Nqm+HebEMZCWOJkoF+lFzZObnWIQsM/S7VYNakzhGAJv5sXYNPUhH9x5WvB9WiPfgMV7L5rQY53tR8ggMnjr7rnh6zvLk4t8dCRhQJfur6FdVnspXlJBcDskmc+rdJ+rcELj7jyfuJmSDawgNype356E9yWbtN84xUiNm/yPDM6VfMHydsFxg==
X-MS-Office365-Filtering-Correlation-Id: 65a60082-512f-4a95-c2d5-08d3ccca6215
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1307;
	2:QHaWFJmYBP7MCw6QNzElpN7VGM4c8c8OLxBkxzk14TMsSQzfRFreLI3ECB70/i59ZbedZOJt9QfUPiXE3t4Oe/0+vp7lSY48vIPbm8VCpcPoeDJE5qVb2BAebrQpwQn1wSKr4gX2i3m2IWmqKWGYZTbG7DpgFe8q4sW91hyi3uie5jB1pSMU1ZjZg7xyCSJW;
	3:E4SBn2voLu95dC21/+8I0Wa1gnVSru2mMrSrkhJFCEK1JwRIwSPe/XU0171jL8JVGYLsm/9nxCs9nV85cOEA2JYwWtsYj/EbNaWsJ63MHK5sMJD8/2pNiRbAsvK19s/EkCbnZrnUIPVkbhU+jYN3HruvGGvkbPwMADAfX3KT/PV0o/4qAxMStz6yWj8WmCa/7Mxp6EM3FhPz7PTSusJX6AXc3shA5QzAZOczAi8rzYdKf8olSzoQW5B+IMPGRil+836EiNDNUHu32y7F/r2Gew==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:DM2PR02MB1307; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1307;
	25:SpD2+x3/CtkkjjVOmWcLpkKtNr2/CttRLTUHI1uCMwgUC9p50JazMrn97pPcs/ev86xQNhtNhV+0faXkFp29x2q7kXgrzBhyeYQ7bKV9r6UqIYRYvKDh/YWqs1nbaJTzNgYjQwt3I6qTKuGQ78J4x5Hu8fId5kFmpF+pMiXcZBXPoiIpqs1rtVs3E79EFXfUyp0AWEAJPX36rP0TtNx54QPSFD1UPJhNpihzMgAoMm0TvZpD+MP4alTtog9QQEUz4n4tKmyDn4UzabYaBaUbUBS+2ZbOghKMg51I74ljwb4jShE6v511We1/g/ZRlio3r6vYk/nvacTSmoaLZP4D0bkv5b0qOh2oZ2dWl5ONUQm2QZSZ6Ap0bgXWKDO8a/4afPBbnJmZEEJUdNIH+dMljw1bMlotWv81wxE2T13pV7OLkspJ0UpwxLcnjwarA1Iq8pjp1+OBf/xGsSf/1zgg+1eA0pGMcVMukUEZPsPltCpoHJbd+8QG/HxBRCVOX4uerRCnNmqicDZu98gnaFgdvezavRVNRJCd8RkBqZH14G4Tzh5ua9707jBkaujpJn+9oG6caad0a/+zVo0H95qyJswvlA6NI/TiC/Gzow1gJl8QLrssO2VW4oShYXYLHo36Y9sHKud+8wfkkxM9Yi8izq9BcdCU1lZ3l5H55hYs2RFA8RNzMmSsKGGgKP2cvSPuu6WoEch/MeWRXgWXJVmXSiOrFRN7Msgk5FJtIw5TIqSG6fMPdv+jmz1kJ8VaIeKXzIEQefw8VLudSp+N/KQwSBYegihmASUk2b/cW81ASFoptDIc5jItbjblJTCxXw7MiEKgt3cfJTYQa2T6noeIwqHpWNMtGte9QigeD5TmyJtN6rVmde9+CaJQ2v7mVCEA4BIHYplw50tqpJbFwaaPQQ==
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1307;
	31:jciBeNQZYLH7ip9ycVP0wxvlgGvDaJ0Nb+WXtO5rAxYldW6t97VjBEuNradgPFRQpwe9OntN1sIfPMqayvJ/ARtDj2a4bZ9WDOz6+0zkZP2DXpa/N8wfLSsgtxWORamS3a6Y4cgJkgqWbVrmvs+2Aw5xPevEfo01wt4pI1AswhXtbfqwOksJU43VHVmUKS242Au2EVOnf+kGCQJTR58O7NeNNRo5Im6pzrbY1H8+qqk=;
	20:BvGwQ/6U8mo+9hM1ZcT+yghseh6EbHZMBHjLWqVMl8eO0Z444fCJDXjHWQSBeKvWaFkMgzI58XTQGCHHbA6q04uTh6GURDxArWrB9qbI+Xkd9KctyfmTiY4pSGgDXIn+Xkg5nnrnHxFZI6CyfjHCBij1zIsMXTnilerGM90zh312rMfG3ksckmUsf9IxGi8iw1RXKdrRK6aODVzfMV40gO2R1g/wpuEshoB3kFXjXMdjTHFXYgGRm03xYASuFXSX42TA7PM864gzB8iWhWcnU6f0tUJXZzFS2LV0qvc8IXYu20A70wDT/COHWmjV+q4qB+0b51it5xXo7lA49zzuWNPZ7L/bWitlt2gYHvdpIlptyoyt0DtPZRgjUaPrO6fo/E4x3VpMtW9l7MONJHr0Q1FyErQ7Q0p6K/XDqgQ6ndHWJut209Tn9Scsue0NNUrxuQJBlwbl5VPNW89zNKbfXcViv3CJr8k0RBR9WHyn2O1nyEIkNYj7/jlEntxTiOZm
X-Microsoft-Antispam-PRVS: <DM2PR02MB130770E2201F73DC9D9AAE74BDED0@DM2PR02MB1307.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249)(192813158149592)(228905959029699); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:DM2PR02MB1307; BCL:0; PCL:0; RULEID:; SRVR:DM2PR02MB1307; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1307;
	4:Dhi5zA//09J2r/iyqxpaDb7baZFF11ypUVc+fyAzAiQmh8xQUIPNg6ndt8oc30EA0CLwyAnesXK3dcJAQ1oAk6jbM1UXGCBx5A7A8sVUhq405rSZEeH/BuCrsnWjxOi1YMOaqyGcUdpZiAY+lZch4q06qCAOHeVRFxKT3R/7Ur0KGCGFO+4zz7ZTNpMdSOj/bxPWQXAArQMRTFX+ZQ9yseomswu8ikThkWoL5Kax2TnKD1toMEGD3sbE0TTRxSR57sK/FsOiHGrBdv+zx3NhXyFimCt9/NMAPL91rQyLjjLIDgu1FvgAKuzFn9ix97Hyvr7ztBcw+RuCIjYCPOnbpXQMSUS/g5/wVXnFesdiFZHZqO7zXfOpmQDhrKDv7X7CcOiMkHlfQpWuJmJawiGzbTu9RwVReFwSs2SqdetPwnSYvc39mfGHdJjX1Lno63R6gaXrrMol/89uX+jf28yNL0IKaVrKfs4lK156g91zWad+NRLWuTjUF7c7gjUEmrMVFurAiPTWBhPj8wSKkCYvy+E8tqpXqAiOicUDw62p6NJ+tel3NF5eTKPBZ2brQIIKRBL+I9WZJeSxyU1oPe8h5MY1NaJMZvEiDkihGPLGK6o=
X-Forefront-PRVS: 0045236D47
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTJQUjAyTUIxMzA3OzIzOjh2blc4bmZVdlNIV3FnZTlVb1pHUGtiSUZJ?=
	=?utf-8?B?Ti91c1ZVR2xLSC9FdXQ3NitwNkxqMUlheXJEYjhzdEpQMHVDRWZpR2haWFcv?=
	=?utf-8?B?dUs3SUR2Vkl4WWN1VnRNcVl5TUhoT0greWNtSHRHZm1uZFBjdy8vbHhnK0w5?=
	=?utf-8?B?eE9yVlF3U01KTVNzbzZSb203blZUNUx3bElqNDZXSjk4UlVHU3lhTlcrbVBz?=
	=?utf-8?B?NXJyelZUNUJBNEp1bkY2eEs0M21jSmhoQlNhcE55dDhwV1IwTkNiUXRuMTFn?=
	=?utf-8?B?aVQrakhqWk92ZW9MaEtQZnlGSzE4L0lvR2ptSVJZVmYzVHdrcmRDTm4ydSsz?=
	=?utf-8?B?amEveDRGOWp5d09qRzhuS0V6Qnp6WlNLWTZCd3FzYTZPYSs0clVOSTQ4UVNI?=
	=?utf-8?B?NnAxN2ticVlUNy82VWkzWkI2eHVJS28wdjlQQ2tOenQ2SXBnUzVlTElsS2Uz?=
	=?utf-8?B?ODI3ZU52aFBNZXdTdHNXSER0bi9BVFN6R2NHcE4ya0ZHanBRelRjcW1FcCt4?=
	=?utf-8?B?bndPN1JtSDVWU0NBRjMwZEVFL0xnZ3pjTUZ2dC9VdmRiK0h2MGhJd0x0R3A4?=
	=?utf-8?B?WVdFZmcrOGtNamwyRmsyREVpaUl4VGZ4M1piWmJTRjFKcktlQ0k5aHlseThy?=
	=?utf-8?B?dEFUMUxuSXBrLzgzUmRrTjJFSkd4V0U1UlhlZXZaTlFremNGbmY4MU5vLzNt?=
	=?utf-8?B?QVgwTFgvQlh4ZXhtaWdqVWN1bUFDQy9DemhkYnEvNGpOWWxra3U1WlBXQXNY?=
	=?utf-8?B?Z2NFbGFPTWFTWG9XandOOUYzTHhISVRJcXltTENaMGVmYlFrL0ZZK1pheGRV?=
	=?utf-8?B?M3c2a1F5azFFOFNRR3ZnS1gyeVlTR2RVc0xFMzNaMWpibFNiQ3pVdU9DRWF1?=
	=?utf-8?B?NGpqU2VoNHRiOEI4c1lmS0FBQnNGZkJ4OGE2RjhiMDhKRm9jbi9xN3RHanQr?=
	=?utf-8?B?ZFNhQm1PL3lkbStYdTJ2Ynpmc2N5V0VYMFhRazA5ckZuTmRBSEpVdndLcGgx?=
	=?utf-8?B?SjA2d3AvR2VLbDJ5Z3ZlQk9GOHJ0cnhvRVhRYXRTZmhrWFRaUk5NVkY1OTgz?=
	=?utf-8?B?THJPY09NUW5vcHdZYkp3QmwzOVAwT3ZUa0NGR3lSOEZDU205WDAzY3YrVm1X?=
	=?utf-8?B?b2hib2hJTmtvUU82ZEgveE04ZGRKbjJmdmUxRzRmVGhLVm9SSWdYdkcwRE41?=
	=?utf-8?B?cnFsaEJuRUpZZWdubThQMnc2aENROFdnUEExWWdkaHZxQlI2RE5zODFTYThy?=
	=?utf-8?B?RVVTYzZkNTdJNjJhRUJDcWZWTndpT1BrdXYwUzcxSHJ1WGdDbmxsZWFZTExV?=
	=?utf-8?B?cnVTaUp3M1RPRk0vZ3N0NzdVT3JvM1c4MEtpOG5JQmZ0MjRSMTVLUE92WEtN?=
	=?utf-8?B?V2RNV2dod0hnZjU4WTFVMDFrN1RVT091OWx3VitwUWRJZXVqeFlveHZJNDFo?=
	=?utf-8?B?RFNvSXlKL0ZCMS8rQTRreTdmdm56NnRqd3pKU3BrazA4a3ZMdjFuMzZRYWhx?=
	=?utf-8?B?OW8vL1UzNHU2QmpaWFNQT1hxNSs5eU01cFlxZW5yL2s3Tk1OeEFyM2s0ZS80?=
	=?utf-8?B?amN2YTNKS0UzcmRna1FEeWZzaGVlWDVmS1l4T0U5dSszWWtXd2U5dGdSb0ll?=
	=?utf-8?B?VVNUSGRDZzd4cFVpS2Q5SlZQdSsyalJUeFVJR015VHpXMkdTbWdhUkhYTlBR?=
	=?utf-8?B?Qjl2emZpMFo2dEtHcjNLa0NqMzdKZFplWFdneFpqNjBRWG5HaGhTeDV5dkhB?=
	=?utf-8?B?ZzZLb2pEVk9QbzNMcTZJQllLdnpFeUZLOEtYL2FkeklET2o2NnBJNzRYZW1v?=
	=?utf-8?B?UUxhN1kxV3hCVi9nWVdrYlM4VUdZMVRNMjhadmUrRkhWbWV4M3ZXakhOWlBj?=
	=?utf-8?Q?9HUToaQUNf4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1307;
	6:d4Kd3600jNK8ydXwELoN1z8ygErmDDJMNqPWwBJHU0LqgjO2ndP0QaohP0gWa06DMwcJxwYq2eO8e9LasPk+o0RcT4+MYBQbYAvu8qXVqsZgmF1ptm5W9U4ejBK/ZsZCgMaRkpZhGJPSTj5MN7TK1F6leh6yDZKCNJiKDt3RV8gPBf56TeiFnmF/I4UmQUh6KXHNL93n/3jpbHrgkWHQSYFhu7oEkI9vPl3LAJjVRwCpuy7o5ibfU4MKsjlwlML32lWITtfXhpk0Cl9a/DG8Yyqi0++AG/Y749aUzg5R7Vxeugm0+fzmhfP4OtyYGh2c9WIi1zITYU3PltFHvZrcWQ==;
	5:YHFRGK2ZDCaIMWPV7qXZEVYwU6qCLCRCcB5yQxh14rqFw51wa9pU3r+H5LNHR42yzMfBM53sDmJApsRSu217PEJwAeBoraDNmu0f+aixk6U/LZFFC8ZkIFhEIuLrwhgwTrbiGe7yLClWqLhaAojIWg==;
	24:5JNfye0M9XqpHbpJIWxA+mxvFMbsTr9U2qYC40CJt1TexEKBtvFhwVyNMUHwpGF0qBo4xYJyrqariRBUi4lueshu8gBbMUibPQnd+6g8dD0=;
	7:GmrnS79i8uC17BoQKdvC4QIKDVgZ51FLXiyVw2ocvN1u1PBauVfgDSZXFvTVmO2xgB2lDt5CaVpPH9mXQfAHxGPXb8H+PhKg8/DSnXAcvRJSuktzIE2eClby37+Z313grZG4aeSe/T8qAMqS95spD8auQfO0QW5dFLmYcVms50NPCeq0U6UvuNxRkdOHI++PA8a+j+D6sfxLVJRoc2Ff+WlRmMjOq9LcsmmqH6WCkpp5Q4TJdk6eN0/KdQGj6rZd
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2016 09:29:58.8706 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1307
Cc: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe] [master] [PATCH 0/3] Added cpu benchmarks
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
X-List-Received-Date: Thu, 25 Aug 2016 10:03:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVzc2kgS3Vra29u
ZW4gW21haWx0bzpqdXNzaS5rdWtrb25lbkBpbnRlbC5jb21dDQo+IFNlbnQ6IFR1ZXNkYXksIEF1
Z3VzdCAyMywgMjAxNiA0OjIzIFBNDQo+IFRvOiBNdWJpbiBVc21hbiBTYXl5ZWQgPE1VQklOVVNN
QHhpbGlueC5jb20+DQo+IENjOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2Ut
Y29yZSBsYXllciA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
OyBNdWJpbiBVc21hbiBTYXl5ZWQNCj4gPE1VQklOVVNNQHhpbGlueC5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbT0UtY29yZV0gW21ldGEtb2VdIFttYXN0ZXJdIFtQQVRDSCAwLzNdIEFkZGVkIGNwdQ0K
PiBiZW5jaG1hcmtzDQo+DQo+IE9uIDIzIEF1Z3VzdCAyMDE2IGF0IDEyOjQ3LCBNdWJpbiBTYXl5
ZWQNCj4gPG11YmluLnVzbWFuLnNheXllZEB4aWxpbnguY29tDQo+IDxtYWlsdG86bXViaW4udXNt
YW4uc2F5eWVkQHhpbGlueC5jb20+ID4gd3JvdGU6DQo+DQo+DQo+ICAgICAgIEFkZGVkIHJlY2lw
ZXMgZm9yIGNwdSBiZW5jaG1hcmtzIGRocnlzdG9uZSx3aGV0c3RvbmUgYW5kDQo+IGxpbnBhY2su
DQo+DQo+ICAgICAgIE11YmluIFNheXllZCAoMyk6DQo+ICAgICAgICAgYmVuY2htYXJrczpBZGRl
ZCByZWNpcGUgZm9yIHdoZXRzdG9uZSBiZW5jaG1hcmtzDQo+ICAgICAgICAgYmVuY2htYXJrczpB
ZGRlZCByZWNpcGUgZm9yIGRocnlzdG9uZQ0KPiAgICAgICAgIGJlbmNobWFya3M6QWRkZWQgcmVj
aXBlIGZvciBsaW5wYWNrDQo+DQo+ICAgICAgICAuLi4vcmVjaXBlcy1iZW5jaG1hcmsvZGhyeXN0
b25lL2RocnlzdG9uZV8yLjEuYmINCj4gPGh0dHA6Ly9kaHJ5c3RvbmVfMi4xLmJiPiAgICB8IDIy
ICsrKysrKysrKysrKysrKysrKysrKysNCj4gICAgICAgIG1ldGEtb2UvcmVjaXBlcy1iZW5jaG1h
cmsvbGlucGFjay9saW5wYWNrXzEuMC5iYg0KPiA8aHR0cDovL2xpbnBhY2tfMS4wLmJiPiAgICB8
IDIyICsrKysrKysrKysrKysrKysrKysrKysNCj4gICAgICAgIC4uLi9yZWNpcGVzLWJlbmNobWFy
ay93aGV0c3RvbmUvd2hldHN0b25lXzEuMC5iYg0KPiA8aHR0cDovL3doZXRzdG9uZV8xLjAuYmI+
ICAgIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKw0KPiAgICAgICAgMyBmaWxlcyBjaGFuZ2Vk
LCA2NiBpbnNlcnRpb25zKCspDQo+ICAgICAgICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9y
ZWNpcGVzLQ0KPiBiZW5jaG1hcmsvZGhyeXN0b25lL2RocnlzdG9uZV8yLjEuYmIgPGh0dHA6Ly9k
aHJ5c3RvbmVfMi4xLmJiPg0KPiAgICAgICAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVj
aXBlcy0NCj4gYmVuY2htYXJrL2xpbnBhY2svbGlucGFja18xLjAuYmIgPGh0dHA6Ly9saW5wYWNr
XzEuMC5iYj4NCj4gICAgICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtDQo+
IGJlbmNobWFyay93aGV0c3RvbmUvd2hldHN0b25lXzEuMC5iYiA8aHR0cDovL3doZXRzdG9uZV8x
LjAuYmI+DQo+DQo+DQo+DQo+IEhpLA0KPg0KPiBQbGVhc2Ugc2VuZCBtZXRhLW9lIHBhdGNoZXMg
dG8gb3BlbmVtYmVkZGVkLQ0KPiBkZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxtYWlsdG86
b3BlbmVtYmVkZGVkLQ0KPiBkZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiAuDQo+DQo+DQo+
IFRoYW5rcywNCj4gICBKdXNzaQ0KPg0KPg0KDQpUaGFua3MgZm9yIHRoZSBpbmZvLCBJIGhhdmUg
c2VudCBwYXRjaGVzIHRvDQogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcuDQoNClRoYW5rcywNCk11YmluDQo+DQo+ICAgICAgIC0tDQo+ICAgICAgIDEuOS4xDQo+DQo+
ICAgICAgIC0tDQo+ICAgICAgIF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+ICAgICAgIE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiAgICAg
ICBPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxtYWlsdG86T3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gICAgICAgaHR0cDovL2xp
c3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtDQo+IGNv
cmUgPGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVt
YmVkZGVkLQ0KPiBjb3JlPg0KPg0KPg0KDQoNCg0KVGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1l
bnRzIGFyZSBpbnRlbmRlZCBmb3IgdGhlIHNvbGUgdXNlIG9mIHRoZSBuYW1lZCByZWNpcGllbnQo
cykgYW5kIGNvbnRhaW4ocykgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIHRoYXQgbWF5IGJlIHBy
b3ByaWV0YXJ5LCBwcml2aWxlZ2VkIG9yIGNvcHlyaWdodGVkIHVuZGVyIGFwcGxpY2FibGUgbGF3
LiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBkbyBub3QgcmVhZCwgY29w
eSwgb3IgZm9yd2FyZCB0aGlzIGVtYWlsIG1lc3NhZ2Ugb3IgYW55IGF0dGFjaG1lbnRzLiBEZWxl
dGUgdGhpcyBlbWFpbCBtZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVudHMgaW1tZWRpYXRlbHkuDQoN
Cg==

