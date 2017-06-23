Return-Path: <adam.trhon@tbs-biometrics.com>
X-Greylist: delayed 100002 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Jun 2017 12:28:54 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0048.outbound.protection.outlook.com [104.47.0.48])
	by mail.openembedded.org (Postfix) with ESMTP id A3DA378096
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 12:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tbsportal.onmicrosoft.com; s=selector1-tbsbiometrics-com0i;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=7lvqs5waA08II53UpBu1gaWXdzczZ1KqeyhwiPY9yao=;
	b=cGx58z5xP0yDA3sNe/KFUR5AYBKWYH+n+grKIb8d1bVmJVymUHoDgj+WbUM16Seyzwgfb45Z1qhB6xcnQz27cmXBmQbRuWeSrDiMitZRV7sYdd9Rp4lE21mSiGZALX91X2s+bikbslF1g9R1LRWY+IKMag9UlytS3PlA1ADbmuw=
Authentication-Results: intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=none action=none
	header.from=tbs-biometrics.com;
Received: from loki02 (176.74.132.138) by
	DB5PR06MB1254.eurprd06.prod.outlook.com (2a01:111:e400:51c4::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1199.15;
	Fri, 23 Jun 2017 10:57:09 +0000
Date: Fri, 23 Jun 2017 12:57:05 +0200
From: Adam Trhon <adam.trhon@tbs-biometrics.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170623125705.08cf0025@loki02>
In-Reply-To: <CAJTo0LbmHft+JXd7ce7r3JCza4G182D4Hnt78hU89DO+TYCNDQ@mail.gmail.com>
References: <20170622104209.260f4563@loki02>
	<CAJTo0LbmHft+JXd7ce7r3JCza4G182D4Hnt78hU89DO+TYCNDQ@mail.gmail.com>
Organization: TBS
X-Mailer: Claws Mail 3.15.0-dirty (GTK+ 2.24.31; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
X-Originating-IP: [176.74.132.138]
X-ClientProxiedBy: HE1PR1001CA0002.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:3:f7::12) To DB5PR06MB1254.eurprd06.prod.outlook.com
	(2a01:111:e400:51c4::20)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6123a355-c802-4e63-4345-08d4ba2698cf
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:DB5PR06MB1254; 
X-Microsoft-Exchange-Diagnostics: 1; DB5PR06MB1254;
	3:pqDMHYli1NE2m0EyhZtDjBy7uS3mIyU9V9fAFh9mPWJLhmyc48flxX4HCZSLgLN8LEefU7RY8bI8CFUqFpjYb9KJfs0aLG6DJ+SRImKipTsgmHpzkawkwV9W57ONSOe1JgzSn9dmq7PDO/TWaZKLn/X3yq564UtaMllpOayl+CN0211RYZ8ISLup+jGXDR4H5lCCWYszoCshcYPTa0v6xRSQpa0WAHDstwYoWbhLR7iMh9m8I6p8WCj//Mn+VMxzI2+fTqWVUrYZmzJu1lJtCbZCe4DjEx3tGyMCw7hJnvS1+VLN7Yys3aW93HdKJvn8OUKCpgG25k3zlovrP1CIEg==
X-MS-TrafficTypeDiagnostic: DB5PR06MB1254:
X-Microsoft-Exchange-Diagnostics: 1; DB5PR06MB1254;
	25:LbenMiQ4cpb5DWEz9fM5QCfuxw9rHX3EbXswAUyelDMckrInidfFsfuTkratHL7NAFnmc6YACWNoIzEU9o4a6DulOEZQDviRDNczviFPdSlBohg1xY3O3bBobQHSs1NETVOwSb7yFIs3fgddY7xrnRvcvrtkfizkp3ISb/aAtSGG9BT5/NyUWiXe8w6ksdPS/H8BXaFd2WXp6qPD7T7pIB30CsGN33LSsrQjxEXxIYCUnXi+13l/wGmY50mW3JfwoJWNgxQzt52OYX0V89oFOxbffZx7wRNMcCbZN+1t3HaUWUqbVtvqTIONH+w6PgxMs8fms2fKX3AU5h1kXLpJCgSmhzYE0sxseIihfeakqxjdZfg9Re8owkTZKX7daUOvPJOrLeKFYJYbzXuJP4/wYJIYNm6nUfZQ319CWuttM9pfU9Z9p/RQScghREfLNsWvNZW0s6qT4QjE53b9/tgr1mONVITSojoRsGKIEFpJ33kiO3k8cJfwElKZNLdX8F8R3JhsLtipG3J8602kR8U9FdXZvXafRazGm3+JZF1BE+bnqMgYVv+ZxCEG7c6B+xqUZbfURLe15DPAezf6+9nm1G+7+sAygIDxb7gXIxFyFVmXtSnX7g1BynrKuocF2Wq37l1LoXrpQAr5H0EgLGw1UJ2wR+I34MaRZin75U6+OA2nSv9m9WIYlHdgGiofnHzkjE1/nSatr7x8Dv9jT6/4GC8JuKBkJIfkkhcvzLZZPxVCqalmXxrDGfNjwLqd/EZKeZHyIT/3iSKORvTRKLql5B8dEpEMPpHr0TSKYBNnR0Wx4jSvhAxRAunxaPyBbcHAtBi/6i5cLpEgl+/5Pe2P1s55IsSB4T1LcAK866TCQNPXNczUjkPm1dZbndtYDsgF1XBfvIjPO+AmhoCyNyKL7HGB9oLB2Pyaderm7+XaSiw=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR06MB1254;
	31:MDjSkol0mbqislcivYNcIJuAN+ISsfd+g3iEYVQVaCs7/eAv8zg9fdz8BKZx50R+FA56ktyiy5ZlNx9YXBXdfFRkIErlyIFemfylZsJJCzB6Wem5unbWzrcUB7n+ts+h11nLtD2pFOdwOoyazYVvJPVO/uXLqM31NQ3WjKz2EuRyB+iE2jbykRMo1ritPGoXhnu/+7RjQ6ihkKMHQAvg10LWzfNK+m0Cb7dbC8J5A3mT3F1CKKSST/6NyoTGGAHqmGkdsy9ul6L3yS205UNZ0IAgnf/tbyBuCzjX1W+1XV6+zIjDTHf0PvH8saLfd89HUsMD9oHdN/POb6xna/8GQ6KwRiu1t1gU5zuy1J8Sa393sPp1T6bZd9HrJ7t3FT9Pl+4STab9oZFK8Vosiah0pG488zfgwCSOZ3a1Kb7eIWyOaHqOW2PwBSYDP7DfYeMSVNCoGXALtpWQPkcOHV0mAB1aw3q3PGM+8N0P1eS7pjf+GCpCdwKFGNrdvKFAHh5STgTrSvGZDgGLUKT1yNIuGOFc/uJKHeg+5ZAd1qehgwgMTTeF5UcS1iP1MEn7gYy4pJxDYxmH4pzMqMI0iHEst4tWOmIb6wlDsDv5FQxnxi8MH17IsSyvl87MmsHzo2q+P//L2Nhtq84vbweCDDLzaKoDKHLWvPNLiL16NNgd8J0hTgAdAF0Gx1oeEZoqY4uVIgU4Nik2MgRJCzZuIoMIDw==
X-Microsoft-Antispam-PRVS: <DB5PR06MB12548F5505BE2A2A2F7E4A58A6D80@DB5PR06MB1254.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123560025)(20161123555025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DB5PR06MB1254; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DB5PR06MB1254; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtEQjVQUjA2TUIxMjU0OzQ6bkpqdFEvUEsxeTlkOCtzMmNQN2ZubCt2SC9m?=
	=?utf-8?B?SkhTWUgxOEw0YkhOTzArNkZqa2oyd0pvTTVsbTJnQzBaeUxEaUdtUHFGRW1S?=
	=?utf-8?B?by9vcDhMalR1ckZleERObXZWMHBYd3g2UkJJeDhHMkJIbzk3TWZsZzRpa0xT?=
	=?utf-8?B?cThmclJldW84bXBMSlZucWZob2xrMDJYaHZ5QjRFTkZ1cldtRElOWnB5SUVQ?=
	=?utf-8?B?T2VHaHBmTGVveUVDZGo4U2pUNFRma0ZiSnprdXBtZXVjUVpIL3RjTHhuN0tX?=
	=?utf-8?B?eEF0dXZLaGk2SXF3M1pXWi9wYW0yTEZBNXQ4V1ZyQyt4QTFaYTFGVXRsZDFZ?=
	=?utf-8?B?eGd1VFBnNzBWbzB6cG9WWTVDWXBDTlZ5Rko0K056TzhQU1dGZitlVldBT3h5?=
	=?utf-8?B?L0lSZ2N5UGhhcDVWMFltSWxwZVJ2QXg2MG5MVzRrUU1NM29rRVdhZVF2OVh4?=
	=?utf-8?B?Vzk3VXA4VHU1OEwxVnRVT3RSQzdwYkU0akwycEN2cG42bEJEeDg5bFc4VXNL?=
	=?utf-8?B?RmE4ZlRCQ3laaUZPWE1WSlhFbDM4VHVIMjlzaXo2eWgxellTdlNlbUtpdE96?=
	=?utf-8?B?R2FmZHdGd1VnU3hkcW1IQ25Od3FFUVdXUG5PZUtycWZJelJyQ2RHZEgvN1VN?=
	=?utf-8?B?SEFhakNkcGhJcUR4RGNUQ0tza01UV1NvV3lOWjFOME9ISkhucGJhV05GY3pY?=
	=?utf-8?B?S0QwNlZDcjhlT0wxb3RIbm5KMlhNUmNyR0J3MUpPK2xoeXZjTmhqZlpuNnQ2?=
	=?utf-8?B?Wkl2WE5iaEp5bXFSRzhPNlNEa3BqMXZ1SmRpaUhJdU5yK1FidXVpRW1Kam9H?=
	=?utf-8?B?bmI2bkZpZW05N2dPS1BTWHJqeW5CcU85KzNhMjc0N3VReWVyQ2krRmNEamVE?=
	=?utf-8?B?UXIvcWttYTNNSTU3L3oycndHMWk2V2IwUCt3bWFvZmFLOW02ZUpXZitJempK?=
	=?utf-8?B?SHcyb05mLzdHTVBkZXo1KytBSXRXdTBGeXAwalpTL0I3bW03V3R6OSt4dzl0?=
	=?utf-8?B?QUY5SGtadmZzOWRRSk5QUUZKbHNyZXBEQ3ZvblhVeDAvTHNLZk1IRWk2YXQ0?=
	=?utf-8?B?UGQzZldwNVlhOHA3Rldrd1diWER1SUowMG1Sd2pLeWNwSXMrRmNlQ0NEV0M1?=
	=?utf-8?B?cUtzdzlaQlJQZXZQM0dMc0RTQXYxYXpaQmFsazlvN0lEdm1BejRoU1N4Tmkv?=
	=?utf-8?B?dmhVejB3ME5oRnpMSUdBQjYvUVpDd3FoYUZPQlRnYkwxUDNuc2lMamVadXN2?=
	=?utf-8?B?bXV2eHAvcVlTQXV2d2dVS1dKUjd2L1N4TWZEa0dweGhWTWtDTXVjQjhyWHNL?=
	=?utf-8?B?Vy9wekFLWDdZWHZGc3JSbm9qQkp4ZHBQZDNtSzlxRmFpUzlzS25XbnZEZXFj?=
	=?utf-8?B?QVk2SjQ2QlpSa0VSWGlRcFRlVld0WVVjRDZoRWtmdGlTb3VqWi90OEhES2pW?=
	=?utf-8?B?MldiK2RLMEZLTFVQcVpuSklHdkcxMytXVGtHa0NSRmdZOVk4WVJpaWtCbjFu?=
	=?utf-8?B?YjFKNDl5TTFNZUpRVU45L281K0t1Wk9aS3ozUG1RL3VheEY3ZE5EYVhOWm56?=
	=?utf-8?Q?JRuqpUAij5OIgEnUCDgrSoJ2jI5Ts5EmFEafWrw0CFk=3D?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39400400002)(39410400002)(39830400002)(39450400003)(24454002)(52314003)(86362001)(6916009)(33716001)(5660300001)(6666003)(2906002)(4326008)(25786009)(1076002)(66066001)(189998001)(478600001)(47776003)(3846002)(23676002)(6116002)(2950100002)(38730400002)(6496005)(7736002)(55016002)(110136004)(9686003)(50226002)(53936002)(8746002)(53546010)(229853002)(305945005)(81166006)(50466002)(50986999)(8676002)(76176999)(33646002)(42186005)(39210200001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR06MB1254; H:loki02; FPR:;
	SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtEQjVQUjA2TUIxMjU0OzIzOnVZeU5sMzhTc25XWUoySkNMam13VVpoRVcy?=
	=?utf-8?B?UzBQb1lsTFcwTlVNL3FCYTNvUjU5bVk1UEVIK2doYUphbDNFQTFtbC9WamRM?=
	=?utf-8?B?a2J5TUVjOW9Oa0oxcFJkb0U3RmlqRnFvdXJCZTlXdlc5YTVrOXJHNDhLZ3Bs?=
	=?utf-8?B?SnFKa29pNGVwL2h0TEFWZldNekxtN3FNeEg5WjBMNjEvdTduMDBOUDZBZ0l1?=
	=?utf-8?B?T1doMURQV1d1RGtuekwrMExOU3dpTGlJRDYwc0lyeXFEWWZRWkpLVmprakM4?=
	=?utf-8?B?K3hORUsrSmlpSDVVb0orR3BiY0lSZ1JiQXBEVlFoeWJ1Vlp0ZnBhTnFQUEdN?=
	=?utf-8?B?dmpPcEpqWDNDL1REbGtZQThra01tejF1ckFDb3VnKzh2bXJWdHFpV01aKzBZ?=
	=?utf-8?B?SHZKaFZuTDdxZUZ0UjF0YW1FbzFiZWorNFdXL01vSFhwVDlhanVFclcvTXJ0?=
	=?utf-8?B?YUdydjF4bkhwcVhyeVVLMlg4a1NId0kxd2JuQVR5dkxPcE9xaDRJL0lSUWxT?=
	=?utf-8?B?d0MzZnlBSkt5Y1FwaFpvZ2lRdXByMDhnRWx4RzBOYU1jOTRLTkd2Z1k1dnd3?=
	=?utf-8?B?Q1V3MHlPQnlQc3NCUWVYNFpxdHNpY1VZYXZJVDI2T3FYV0x3anZoTS9tc2RR?=
	=?utf-8?B?eWdqQW5LTU1NcjRJRHF0alJaY2JlbnlxekpKTDJrcWNNTmpJazd6c2w1S3Ix?=
	=?utf-8?B?NWRGYndVZXExcWRJUUpEekRHMFYwb3Uwd2tYTjBldytJWUJndXNSWXR4ZUhZ?=
	=?utf-8?B?OHgzdzk1RUlObzBtWE4zcE5YWGNXL3pvaGc1YVg4L3p6clRPRXJ4YWNYTGxa?=
	=?utf-8?B?L0J6d2ZvTXNQNkxDTHVYQVp4amZJbEo4bXlqOWdFZ2FGdC9NMUQxdS9semdw?=
	=?utf-8?B?UnBjN3RzckZsQzAwZndMRkFnZWE1eDByNmlSR3NrWE9JQjVYOFFFN1ljRXE2?=
	=?utf-8?B?Qzk3Mlg0VWJGNDgyWjg3RWt6OW5reTZXdGt2MDk3ZitIeUloV1QyMlp0TW14?=
	=?utf-8?B?K1laekc5TjlQU2w5VG1uOHYrZU9qOUQ2cWpLQk1RWE1lVTYvK1NYZFplOGJE?=
	=?utf-8?B?YlJuOGFzTDZhVlVLcEltbWJsS2l1R2hWV3d3MHBDRFRZbm9FTDQ3eWtkWHRj?=
	=?utf-8?B?WlRUSXpvMUg0M3Y1QzVRa0UrQlBnNDZrZDN3ZmVXRmVJeDJMaXkrMktqalFH?=
	=?utf-8?B?K2N6MjdOTVN6ODJhUEo2aWVFSDAremNBM3ZPc2RCSE1mVk1FWVRZMDgzUzFW?=
	=?utf-8?B?bGt1Q2pkVHpxUW9UbDlVYURFcEkvR3RaTTkwZzBFMm5xVHZGblJ0QnhQbzFN?=
	=?utf-8?B?MEthZFZlYVpCY2N1UUZCQjAyL0RkN2N1dlRNbkdzNW9PRGRTNFRhTUF2L2dZ?=
	=?utf-8?B?YWdiUnBuKzZudkZEWE9KRjVRMERqeWRFMlV5SDF0dkRYbHpOM2xLTjlMaDZ3?=
	=?utf-8?B?ZnpXeGxqNXJ1aGZhN0tqQ0RGUTRtcEFVblZETm5jZXgvMDlubG9xazVxUXc3?=
	=?utf-8?Q?uQXMqjpH2pZx6IPyDKG83nhzc=3D?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtEQjVQUjA2TUIxMjU0OzY6WnJSQWJqTlUxWWRLZ0JKZ3NLSE5UTzljQWE4?=
	=?utf-8?B?aCtJSDE3TCtHa0w1M3pwbElqUmNRRUFFcXVsNGlGMEVXZEozbzdGUXdUSDNr?=
	=?utf-8?B?NmhKSTQwSUNCMVN0RWNkVGt5VTFDYW1LV2xJM2J0d3MrQ2hmdHh1Rk1UMThT?=
	=?utf-8?B?eTkvYWpJWjBkUm5HNG5sbnZxN2VITnhySmhrNGR4aWkxdk01OTUyMFNPME1B?=
	=?utf-8?B?TmFXMUpIemZEaHV6RVhqQjNUeVd1WU1mNHp1WVdHeVlIOTBOZ0xiTEpmb2FC?=
	=?utf-8?B?OU4zc1NnUkc4UDdxTGZlaGp6TDhJMnc2YzZldFp0NWhYSXN4dkE0SXFXQWpD?=
	=?utf-8?B?T3p0aE5NL3dRbkNLaGRyUzhIVDhHdjVzbE5xeXFUN0RSZ2JPNFJ4bklZQmRF?=
	=?utf-8?B?NlpHOExrRXZNN2x3cy9ja0tRamZXLzc3QUQ2T01xTDVHWGo0SjVwYnhDcTRj?=
	=?utf-8?B?aVFiWTBISWlmRDY0VFllajBadUJ6bHcwaDIzWm9DbDkwRXh1bUlZVzRCbmJ4?=
	=?utf-8?B?SHRpQ0FuYU1XeVdIMlROMk5NTitmc0FtQzNpUGV4UERQV2hPOVFNN1pGVFJ1?=
	=?utf-8?B?L3ZqTnNncG1iaUEwNzNNRCsramt4aDBtMkZEa2xCZ3pXYVpEeHFvKzZpQzFx?=
	=?utf-8?B?YldZM1B4OGFRc2lsYzl4N0RLN0ZKTXJkZVFUM21xRVNZZ1NoVGhUQmovaUNL?=
	=?utf-8?B?aEt5a0VKMnhjamNPZHJMaTVWRVBWM1dseTFoUWZKN2l2V1VRN1FqNFl4U2ZT?=
	=?utf-8?B?dGp6YVAyREY2NzZnaWpHaFVNdzZ2MFNUVFFsMjJ1NE5CcUZZdGdXa0FvR0J5?=
	=?utf-8?B?Q3JFRkxSVDhIWS8yTVJRWEdzUEVSNXpaWmJKclVYM0hYVzhnWVFKUmloYUNO?=
	=?utf-8?B?eTRMYS9wbGhRSjRjQjBYOEx3a3lWK0FoVy84ZlJXSHlUVmpyelUrSmFTU1Zr?=
	=?utf-8?B?Q1JGaG40bzlSQzVkK3RqbUdwNzluN2dTK3JXcktxQ1E3U3RYQ0NLQTJSRHJF?=
	=?utf-8?B?RmJxMEVGMTZ4OGhoYy9hRlhWejc5eE1iS3NrcFFQVHdMWEJFZDRkUW1reGVh?=
	=?utf-8?B?RjVEYWdaMEJVSzRObUkyZVI2RHlidmtUOTV2ZUpwdm85SUdhQ1dmVnAwbHNX?=
	=?utf-8?B?U000WWVySjhmNzVHT1RkMlFUcTl3S0VRckIraTAza2FidS96dDk2TEFPenRL?=
	=?utf-8?B?ZUw4VlhLZVZzdVc2aEhWckZYWEVuelhRUm51N21RSC9vRjg3ajMwM0lPS1hN?=
	=?utf-8?B?WTdMVzhZTHNHRVkzT1FTVXM3aWo2MVYzQWtzUnBvRlU4ZURScC9HWTgwWG5k?=
	=?utf-8?Q?ggbrNEScRWLzr1pj0XbGs0U3/Ud+cP8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR06MB1254;
	5:6c/78D1HCSsGqY0sHA95AKa2gQoHCP9sfNmdJgTMeBe7kQr/2D3+ZJTrlSRMRE+lQ/e3m+V6cQhB/rR7GfRppjq9F1yOTuWK3JMqRcYWPYF9p1tBg8x4k6Gbie06i3e+WujAd05XAGxcheZcCQ8DNgOwAZc+LMx6eG9FIAfTeD0XpTCMBRKC4ubIcePV3es+1nADuioQO98R4PkWD3CJQRvuK3O/4pcr+Hz8vIO2kzJ1OA8SBmW6s2swKXC8DltS9JiY5ygs8oewgiFpFsMm7inkQVh5QLB7mANht9427dUiWIPH4KltM+BHgNFWtC8mtqfQAnGffGWoroDrJZhAhm9biJkUyONDfXNEFiq9cjVkae6MY409vNUCs/1kOwKIOQusBcbCKF5L+XIicjf6wqjFTq0BygOga+MXmyzYzjttP4qNrgqRHlHpoW+Sk/Rx4nXg8kMXkoBHa50shKhu+JS41HSqOU0nwa77PRDbivSwQ1VPPED7eKJMuOSshw8Q;
	24:+OKeEdNLbb8DPcHnPMCN/d/a5/uJxsOpvjLgtWuD3ZZC23sMUBeBTE11fSRNNsM2m9Lb4XP+oqfkrC2uueO2s8whyAw/7lMbHuyI+zm6Vz0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DB5PR06MB1254;
	7:ws+QSYD3l5pAv9UgjrlDdnlxEwojLmaNrISs4g5iSlB5Ck6jdHO2cvIc1shvM6h7goy1dX7StO3iPx7qUNbVj4gxio6dRNzy8Yq4hReMAmRTdvK1zySJUwIQmMKpWc17UGVsI+wCXuLPku0WmyGZoC1fdSDdAXLjZtls1XNqHMtX1aEOMIWg9/NCZOzS4NJ9inSU90cScmK46xxD/26H1Gkv/I17T+kW46oL66CWc3+6gZRUA4aJKZr9JE88a5Im+qH+XxBfiXmaf9+TLqGJYiBVR3GIXV1AYyi4ypHupePkZCHFp4A0A4ufOt9G8APeQ2BE1bdUCd5RxFeeZ02+e/T6MhWr8v8EaWkdjzVwMtpTOX/C03z30vzBFvWwrcuwVBYOdO5+znEr3lprkPWH150OC5sCQIh3E59QBTv2iVW0g9ho5vuYVbnkHCS8pzo1u76FsnffmtJ6Zry7dIWWTL9KCCO8/6k07ddMpaWGp7WBkuWpVdAVwZRYC+vnQuGC1zDHiNp9PkE7FiIatYsneZgL/WluI/Pt+f4t7cMtgiBKQI5I71Z/fnZ1dv1/1d4qNMyKVIlQLVlNBmRGP9wCXc1QHasJw4gqvqwre0B8lYXQGZUL8JSF0iu9gP9IQZ2LN8/mt3q7/pIvEwr5XkMOGGkNGirUyab0ySAXkNuH/pgwBSh6QxA2I9uJyNKMT43GL4cC3jNMFkuElzR2oQRvr+gIYAqkxmaU5DqFqy5A55I3Vjzx35UAXuv165WGoY1Khs+mX4zWexYSeYjxVEfaUOJygkmt+FSgzGQxD1kW8ao=
X-OriginatorOrg: tbs-biometrics.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 10:57:09.6325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR06MB1254
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
X-List-Received-Date: Fri, 23 Jun 2017 12:28:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


On Thu, 22 Jun 2017 22:51:26 +0100
"Burton, Ross" <ross.burton@intel.com> wrote:

> On 22 June 2017 at 09:42, Adam Trhon <adam.trhon@tbs-biometrics.com> wrot=
e:
>=20
> > but I am not very happy about using PACKAGECONFIG_CONFARGS - it feels
> > hacky, the
> > arguments are not shown in cmake fail log and it cannot handle argumetns
> > containing
> > spaces. Is there a cleaner way to achieve this?
> > =20
>=20
> Definitely don't use PACKAGECONFIG_CONFARGS: that has a well defined
> meaning and use, and that isn't it.
>=20
> I don't see why as you control the repository why can't you just set the
> arguments in cmakelists, or the recipe itself?  Either they're useful
> everywhere (cmakelists) or in OE builds (recipe).

The CMake options are maintained and used by upstream project developers
(I am one of them). Sometimes they change the options between
revisions, so it is difficult to maintain the argument list in the
recipe.

I also want to let the upstream project developers change some arguments
without touching the recipe (for automated builds).

>=20
> Anyway, you could do something like this:
>=20
> python() {
>   d.appendVar("EXTRA_OECMAKE", " " +
> open(d.expand("${S}/oe_arguments.txt")).read()
> }

According to documentation, this is expanded during recipe parsing. At
that time ${S}/oe_arguments.txt does not yet exits (it exists only after
do_unpack). I tried it and the build failed with python Exception:
FileNotFound.=20

I tried

python do_setup_extra_oecmake() {                 =20
    d.appendVar("EXTRA_OECMAKE", " " + open(d.expand("${S}/oe_arguments.txt=
")).read())
    print("adding "+d.expand("${S}/oe_arguments.txt"))
}  =20
   =20
addtask do_setup_extra_oecmake after do_unpack before do_configure

but it did not work as well. The "adding.... " line is printed
correctly in log.do_setup_extra_oecmake, the file exists, but the
arguments in it are not used (I checked run.do_configure).

Thank you
Adam

>=20
> Ross



--=20
Ing. Adam Trho=C5=88, Software Engineer
Touchless Biometric Systems s.r.o. |=20
Palack=C3=A9ho t=C5=99=C3=ADda 180/44 | 61200 Brno | CZECH REPUBLIC |=20
Mobile: +42(0) 721 565 113 | tbs-biometrics.cz

