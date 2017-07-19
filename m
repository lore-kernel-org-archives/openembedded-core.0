Return-Path: <ferlandm@amotus.ca>
X-Greylist: delayed 5560 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 19 Jul 2017 16:54:17 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0131.outbound.protection.outlook.com [104.47.32.131])
	by mail.openembedded.org (Postfix) with ESMTP id DB174782F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 16:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amotus.onmicrosoft.com; s=selector1-amotus-ca;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=UIXrd5yc1yG+Spq4tzTbju3z8k9dZJ6MqXYFvown98M=;
	b=qf+7+ReSp5lrcGRZSaLapLgFgULwdp9uZ0MJtMIEw6BIdbiQ33EMRTHHOhzj3Hc2DvT5zgTUcw2MvvRIfUpGBmEQpVrTtlpSpO9nyzQSmJqcW1TiufQlUxYlleG6MtT6qoI5vpeSNP5UAay0EX5RS9cooeNpk7VMxGGzJ44ur+s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=amotus.ca;
Received: from mail-ua0-f175.google.com (209.85.217.175) by
	CY4PR11MB1672.namprd11.prod.outlook.com (10.172.71.136) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1261.13; Wed, 19 Jul 2017 15:21:37 +0000
Received: by mail-ua0-f175.google.com with SMTP id 64so1973551uae.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 08:21:37 -0700 (PDT)
X-Gm-Message-State: AIVw113dV/knid/zQhBuC/hV+zNuNntoQNLmz/ydrOtLWGZA4F4H077U
	2aOHuLZM/N56ZwRDl/DABfCwH/T2RQ==
X-Received: by 10.31.8.82 with SMTP id 79mr255713vki.93.1500477694284; Wed, 19
	Jul 2017 08:21:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.105.204 with HTTP; Wed, 19 Jul 2017 08:21:33 -0700 (PDT)
In-Reply-To: <1500476485-20310-4-git-send-email-maxin.john@intel.com>
References: <1500476485-20310-1-git-send-email-maxin.john@intel.com>
	<1500476485-20310-4-git-send-email-maxin.john@intel.com>
From: Marc Ferland <ferlandm@amotus.ca>
Date: Wed, 19 Jul 2017 11:21:33 -0400
X-Gmail-Original-Message-ID: <CAMRMzCDOezXvirhb31HLMR-EUS8S_L=a6uL23d5nQSLhg0E7Ww@mail.gmail.com>
Message-ID: <CAMRMzCDOezXvirhb31HLMR-EUS8S_L=a6uL23d5nQSLhg0E7Ww@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Originating-IP: [209.85.217.175]
X-ClientProxiedBy: CY4PR06CA0056.namprd06.prod.outlook.com (10.175.122.146) To
	CY4PR11MB1672.namprd11.prod.outlook.com (10.172.71.136)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3d8a658-cdb5-4abf-fefb-08d4ceb9d944
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY4PR11MB1672; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR11MB1672;
	3:BWau2ogNKA0ce59rsBSqm1YUBA9RmdS7YG7M0ZFvyBwBkOrGkNNPxflBidP7xMR3Q9+KoZE3ekSbra5wput+963WbSxr29LSHMtrO3KCJ9bkkoKOTQoeO0ajDkZ0zWCt7YQJo4d5EVTcET3CICR3n0KeD4+kxzzcFqPpTLzoyozNI4g+y8ScEZ0MKmgmi7hdDuWTLy+Rwndq9YM2QhvBKTYBWa2QDAa6umZhE+q251CsAq8yMwo50jJOEn/J1U5q/zm2ipZielezQ7hzxZPTv8x8z82BtunHUq13LceLs/QOXmOuhRiHUT5+qmj5QJNfNvuIQgqtKnwuiPWfMVX1bE6FTSzr/7k6lb46QySDXQ48qdrMyAQ8FKbMkWICvstOHIH1ZIEHTL9Rk/oV1vICCM71LCtlrYQBSquR+064QppZ5jK+aewnrer/MBI59NtpjBfbfFwmS2y4Me//28H5n/EecUcFfO5YlHRSgkHS47l3kVqZ+DsG39Qo28XE7GnFWjCgQUQoaLxGqhO/dyHAv770yXsri8NJeiQZ2PspiLMxabokRmQVLske/Ld/tQRK8xHDduCoFwdfuZ6OdFWElAtP/JluVg7IjMrv9nRLeIF1ylTSL9DvY+6BP11pFE4xb3a6S4uLa7aS3jmbv/F7TRUPQZ0cis2No/ANOLerBSeI5lR2yNvt9zCRtF9oUVNPMKKLllUdYfIi4+ua1HVzVA==
X-MS-TrafficTypeDiagnostic: CY4PR11MB1672:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR11MB1672;
	25:4sQseztfsHhWqt9ongnFKsq+1RgT9S0ypnpxI15m5txEtUg63PA4/1mgbpbfKMoBQM8GTK3yf9kSmbBVS6ypq80Jjxi32H6ethb9QoPccidnAmq7K+DPCwiPGO3sHB39JuYDe2IJRcnozj5E1CPbTqC7cvvb43LGxA5LnnC7aGj7AB9+bD15iYOPjng+cVlsHWW8nwoVMiMoM45nxdMuMDJocJGKaYkAP/SR8DeRFZct7QKeer76GJE2/knq8hBUV8NqJstOhBou1hcRDrelr24Ram9NLFvcjb9EaPalwot7eZMQUepbuJd2HOYMpjzHucZ9OuSoN1i6U/mpNJ1In6/ArlDMi9WD0s5XLQ1a3Gy7vR7moqC71t1h4S9WOaAqYP26WbGiALAJfcnbhn7RIwO2ANgFrFl/lOhD/Wljcl92Z+tsXwsJhi0U0edp64J4FpPbizpD0QtnP2ZTHzSN+KCWz9M0F6Kc8VCchjAK4sZUfeU+gWgCdcZT2h4g4mbC6tgiO4sdAaE8gIAKXrJOhGbm+dPi48xUEhYTJPCWmMxPZzkbGxAyektGKn8we5WNSV7Teun2JEe7iCRwEowWmaoauXc0YeRINtf4PGvtMgUy5oMeJhSdAMjDbRM0O16LEzP3vgE40h04zudIGfR4twqkh8LsZTlfkBnzJntemRyCNYuG131bfYsE139vYvirmFgc8ZIqktMrTJTbbrQJsZQwV9OyIlDOvjrTRHZxKBCEzAQgwdiIYzjAUBPzgYDvLzQXIboynLBJarDt/5PtpdZP8/BPqewiY6Lg5LscH4Ha0uujCP1xaFQJCz58egzut6LZ494ju0jN6SX+POoh4ri1ltonXtB5Zolodv3V6Ugsnf17S2rLluqZjl3nv83+mej6a/pxpf+vP1fko0BCWuHeb7Vfif6NljffU6I6Is0=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR11MB1672;
	31:R9fk1kr4IuMtxRgH1snLZl/vsgbAR5cgpTwIAebLe+hzyX6YVfgrMpOhTSC1C1cBPFLCCLiQX/AQjyVXSFtu5eVlaQ03cmOuvoBDmS4V1REd+kDHwEFaZZAnYznJoR0o3w1C/JrjcDWB3Fvzzq6rgNPT5z2LBD1cEhqxrMVGLSzNmv4jzjM/gcTwpNdzjrhzD+eY/nAIDw5RUw2onn+HIKgBaghkpdlM3UjSV80XbP3OPxkUsFlcf38BMhRdKeeX8Mv8DR/HA/xx09K/yUM8597SlAP64Lmfu1c7JrvsAOtZz+BgQJ3Dc2myQTHL2y1NY70ETH7JETLguyd0Ui6rOrc9tJzfbGYWaUqLn+uuNClgTFnO9xYeGJZ7ms/lOulH7+jcHB9O7Usgd5t+4VA2GPoWC4kQU1fYArRH1PhDLuR5vt4PLmHVwx/SBCKMPx6aTkmbWsrmn7rzjAP1LdhWP7MZDtgC68Dj8XOT68WGOBDrDme/jllytIKawPJc/y6ytICavewqZxa17xdKsSs7wUl775mOhy/ESFxluZD0yOH8b4/7WDR190otHaLKg06taI5FrzNY7BqqIiZIyLL4+ejTfJNXBCAMkPp11Yf8vBT9z+Iah8fnCm9FqGgGjU1P9kqFir0XwwlEMLFI4h2+u2EUbp72/ujI/PBG/+PgAh2qBr1v0ctpDH0cxFqoaGuqSwNALNrqgCWtnongrpdZnQ==
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228)(148574349560750)(84791874153150)(228905959029699);
X-Microsoft-Antispam-PRVS: <CY4PR11MB16728958656A4C3C50798D8EDCA60@CY4PR11MB1672.namprd11.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(2017060910075)(93006095)(93001095)(10201501046)(100000703101)(100105400095)(3002001)(6041248)(20161123555025)(2016111802025)(20161123562025)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(6043046)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR11MB1672; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR11MB1672; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjExTUIxNjcyOzQ6NjNmT3VaUk5BUy9VK2tTV0ZmcUMydEd1MUN1?=
	=?utf-8?B?VDFsRndHWVpjeldiTW0rWTdTalFFUWplbGkrUWVsMFk0bUJWYzh3Q05xNTlj?=
	=?utf-8?B?a1dhYVZsWEVYb2FLSjhJQzVPRytZaEdwbXZ3YVVWdHd2MDhPVWNQR1diWjVr?=
	=?utf-8?B?UDBKZ2ZlUHUyMVhvak5zdXUwY3ltcUd2aUdyVDloNlN1OXFpUEt3RzUxVDk0?=
	=?utf-8?B?dHMwRC91WE45WFpKbURicDN0cW1ZcnViVDBLL2hKWjk4a3JjbUdTbXhmTy9z?=
	=?utf-8?B?bVA0anp1L0FYdExJT3krOEVFc05hcGpHYWpTSmtadTVHVW9ycWtXZjQ4eEV5?=
	=?utf-8?B?SmdEaWpVd28vZlhQQXgwRXdwemFrR2JNbEpnV3ZnUVNuV0hEczk4TEY3Mlda?=
	=?utf-8?B?NVBPNmxKUEwxV3FPa2cvNVQyTW9mK0NodFNjMW9sck1VV2NmZHgraTVDUko0?=
	=?utf-8?B?andnTklNaDE4ck13L3E0OURnYTFpaWVlVXlNMGcxTVhWa1FkNS9xMHNwZmRD?=
	=?utf-8?B?dUVZSUJ3VjlXZGpHQlJkaDYyYzBsemp4UzR4a3Zoa0RZcjYwQlJ0R0NPTlBO?=
	=?utf-8?B?c0FlbURhLzhJMzZISHdBWGJYdUxYcjdoVyt5ZVJ5ZXoxWFowSG1qSGlrY3pC?=
	=?utf-8?B?OTUwTFNNb0cxdlRJZ25vM3hXYWpwbHI3eWgzRmkvdS9qQzYzM3cwQTB4S0hE?=
	=?utf-8?B?dzBkSmw5eFU5QXA3ckt3RGdMTFpBb0NhWG02elhob3pZZThmcHB6cXFsYnNE?=
	=?utf-8?B?TG5iY3BCeTNlbUpEZkgzWWxncWZNWUZCSnhLVWZCcUhlVVg2czhnaGRJdEpW?=
	=?utf-8?B?NlhoTkxhMnl0VzdtMGd5S2o4L3ZyMk16V1hQWWdmTnpuTlJTRWVhTmRpWkxD?=
	=?utf-8?B?V0dQSkp0aDF0eWZ1Wm5zUlM2ajNncHd5YUZNTndDWHEyYXlQNDRQSmV3WEdo?=
	=?utf-8?B?dmpaM2oydGJkdFpERGdEWGJnSmtpWEd4RExsak0vb2lkMGMrOTNqRWwzZUo4?=
	=?utf-8?B?UUI5UzNwY3o4WG5TME1LZ3pnT2hOZTBDb0NZWWRrcUJzRjRHOEZ5UlFPSGMy?=
	=?utf-8?B?bWZFWVdjUktKQ2lsdFJZcXIrdWYzMzlRc2k3aDZSN3BVaG0vbWMrYm56L2Fm?=
	=?utf-8?B?ZmFCMmNYK0xrNDRKSDNINlJJV0NaVTJhRGhGSUZyOSs3T1loUzY2T2FaZXRw?=
	=?utf-8?B?NTRsTEFSbHdtYXhIM3VCck51d0NmSXMxb1B0NlIrUDJCb21uTmpYUTQ5WFFG?=
	=?utf-8?B?Qy9GT2ZJbjA5OG9oeEtOY3ZHemZpbEI5MDdFcWEvRFRZb0EvV1RacjZGdDFy?=
	=?utf-8?B?TEtHRWt3bDllSFliQ09NQ2JDcHVaNDllSHg4ajZpTjVoTjNsNm1zdXZySlB4?=
	=?utf-8?B?ZzlPZ3AvRVFqQzU5OHBPanlMQXlEVWlRLytZMG1Vc1B1WFMybmN1OWRXVzJY?=
	=?utf-8?B?cktTSjkrbGVQZUJqZlhUSERKOG9NS0hQZ1M2VCtXcXRtL0lYZm83RE42V0xK?=
	=?utf-8?B?V3NpbHQwbDRtZnZhZXFnVXVGc2pvUHRqTldwdHltT3pmVkpyWEV3Sm9wc1VC?=
	=?utf-8?B?Vm5LZHRzdmxtM3EwY0JocThKajUvSllLcURlcUp5MWM3Tm5oQkwzbTYzZ2Y1?=
	=?utf-8?B?dWVjbU11cUJmZHozRXBHdE9Xb01XSE52L2dCU1ZobEZTSFJqcDczN2RINmZv?=
	=?utf-8?B?bStHcUU4bDNoM2w0eUNQZGVtL2JiMXB3ZTB3VHREa3ltOW54amtkZXpvRGg3?=
	=?utf-8?B?dWpjSmtYK2htaWFZZnJmOWE0SDV3cWFFMzBZUVgrKy8zNGZyZGZCdDRaNERr?=
	=?utf-8?B?N3ROSkdCanZJajJQMzRNbU81SUJzejlSZHk3d0RTdjFhc2k5bGZzbm04Ymhj?=
	=?utf-8?Q?8lQrMY3gEY=3D?=
X-Forefront-PRVS: 0373D94D15
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(7370300001)(4630300001)(6009001)(39830400002)(39410400002)(39400400002)(39450400003)(377454003)(24454002)(7736002)(93516999)(9896002)(189998001)(6116002)(3846002)(59536001)(66066001)(5660300001)(2906002)(86362001)(50986999)(23676002)(47776003)(2950100002)(61266001)(63696999)(76176999)(6916009)(7350300001)(54356999)(305945005)(229853002)(50466002)(74482002)(98316002)(53546010)(53936002)(110136004)(122856001)(6246003)(498394004)(9686003)(6306002)(38730400002)(55446002)(61726006)(478600001)(81166006)(42186005)(966005)(8676002)(5820100001)(55456009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR11MB1672;
	H:mail-ua0-f175.google.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjExTUIxNjcyOzIzOmZxK2NtWlYrNmM2SjhySFZ4ZGhMOExNWDgz?=
	=?utf-8?B?U1hEQk1QUXluY25sTExadmRwN3Q1ZWVoYURnb0lWc3JqNnN5bDdhQkNXYTEr?=
	=?utf-8?B?MkhDM1VNZzB2UzJaMXAxdWt4d013L0JwZjI1RFNicUFjbVB1SjZrbVlaYUE3?=
	=?utf-8?B?RHUvU3ZYdGI5bUIyWnhSU29Cem1rT0t1c2FLcjN2L1RhbDJyTzhGZXBPVDVL?=
	=?utf-8?B?MG50bVhZdHBrR1F5SThrR0R4NWpCdUMrSGVJT2hSQXY2a3l3NjFaRUk0OVZO?=
	=?utf-8?B?U0VIY1UrK01BY0pWek82dUx5UEpUWXJGK29BZk1aYzdCRHFveWwxd1BGVmFv?=
	=?utf-8?B?dWFYSC9zVWVNWkdXaHV0bDE4dzdJTjF6ckRqZHdmK2tBMEtxVEVWMGV4cnVD?=
	=?utf-8?B?eTRnb3QyQkdPQVNvY0sra0toSVFJZDNpQlJpdEdFQXBzUFRNanRyVHNTTDRm?=
	=?utf-8?B?QXFIb1BjQ2xCbzNIeXQ5c2ZDcUIvalV5QkowelU3YWxPbk80TUNSNGlYempk?=
	=?utf-8?B?TkJGRzh2YmF1YktLWkVtVFU5aHVXTURKQWpiZkVqZDRRdzlBVlUzeFBDN2w2?=
	=?utf-8?B?MGcyWXVsWFhWSzZGRHFQVDNsd0s5LzVJMTBURmVrb1pDVnN0Z3J3WE5DUnEy?=
	=?utf-8?B?OWFpeXR6VGxoT1Y4SHJQbXZkUzBzcVBUb2JBakxQNlNrMEtFYnBZVGZZbGll?=
	=?utf-8?B?NVR1b3lhdDVCNjEyMVphNzBYMTdYVWVJSGlxSjRHS0tielFuSGQzVWc1NGxs?=
	=?utf-8?B?TjJFV1NpdzNaZGQ4YmVaMWNQSU41SUMzTTZGOXNXOXRWelNDS3BNUCtNdE11?=
	=?utf-8?B?UElXajVtNkEyU1RlM2NvMWJpbFFQeG53b0JySGs2MjFCSGNXOENUOTJlUmhM?=
	=?utf-8?B?dXlHWVIrTWFpeTllSU1WQ3RoOXpnWmRmeXVCUENSSFpUREk0cDRhZHVDNTF5?=
	=?utf-8?B?YW9nekw5UmQrbnp4a1FnU2U4MGFWSmhmMmhxVWhSMmpBaWpFQ2hDZzNCeU5u?=
	=?utf-8?B?UFFvZGw2Zzl0aU9mRzJ6WWJKNlhTT3I4RmczU2llcjlyT0xKZkFvRjV1WjBs?=
	=?utf-8?B?bWs5aTYyOGdvckd6ZVJkQ0JlOHQ5WElQSlUra0pJaElkc1liaWJFVjBkaWpD?=
	=?utf-8?B?TzVta295ckN4dFgyR3BuZDFDazJCZmhvS09kRGVYbnJtTUZLQnBlUGlPOS8y?=
	=?utf-8?B?MHc5bWJDNUFuVElPbUo1RUxUaVFjM2ZNd0Y0dUF1eDd5T25DdUpnc1l6eXNi?=
	=?utf-8?B?ZVdNUTYyQlZGMmJiWnhDcjIwUEtzZ3pESHo3VktadkI5TjcwRUdLOGREa1FZ?=
	=?utf-8?B?VWZTYWt6NzFDQzdxQWxNSnhrYkRpYlZQVEh5Y1ZKSml5eXdpNHFXYURma0dC?=
	=?utf-8?B?bkJUdVluQ0gvRE95Rm9zUXVqRFRoQzgwNjRPUzY0T1RFRTBvTk9JOTdDaUtq?=
	=?utf-8?B?UnFmUUh2eTJQOVR1VWlNaHJ4ZTZkRjhjNTAyL1ZWdFdLeWFwSU83T3FwNjJs?=
	=?utf-8?B?Wk9HcHpKSnlGZDRFMGFmUHROUlE2VnFJWFVicURJQXIyZU9QRjJrSHhTVWNH?=
	=?utf-8?B?YkRvT1hiOHlTYSthTng1Z20vQWM2cEkzUkttSEZ5Y1VwUUs3Zld6YnJ0K0VL?=
	=?utf-8?B?SUk1em9lcG9lZ3pmeHE4M0c2ZVIxaC8vb1ViODIxemZmNmxnV2RCNkxVMWVQ?=
	=?utf-8?B?VGo2dTUwcWVvdmdYRGpHN0RFZ05OYkViVWsyNU00YkQ3Nm1hUlNYbmEvOWZM?=
	=?utf-8?Q?fdivKQTz3ajSwGEYJ3+2HKIq7Ysy2LQWUxQfk=3D?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjExTUIxNjcyOzY6THZSOEFEWEdWaWlMOG9UOTVtVW9WRElla3Jw?=
	=?utf-8?B?VkoyRllPaWhRS0pzRHdIZFB2Y0Q5R1RuQkNra2p6amxHdUxxeTdMWFlYOXMx?=
	=?utf-8?B?enBEcUN0c0NUVGd4U2ZDazg5WWZReXh5bnRaYmFEV2VRSVE5UE9SOVIvdHRz?=
	=?utf-8?B?OHpKZkVxQ2s4aENZWGFoVW1qRHE1TnhkSkI5bGtmdFd4NVJ4T0NRRWdLYU1v?=
	=?utf-8?B?UFgvREhCaU1vWXlQOTYvWUxtUjdJMGtsOWg4S0xBTUYzeUowQnNRaW5YbklJ?=
	=?utf-8?B?S2pZeGtoT1FvdlRtUHk3YThPcnVtS3hEYkpYeWhLQ1JCazd3bmU2RkVkd25S?=
	=?utf-8?B?OEF5ZnQ4MjRhMUd2cEUxYkQzTGMya3ZibnNLQ0R1bDd6TTZFVVh3dVpOdEFp?=
	=?utf-8?B?c2JVemk5anhqbmF4TkVsRkZXa1lQRTlZZUJjejB5MUtXLzVlUjlOeHlHWWZp?=
	=?utf-8?B?Mnhta2hHeGV2SDAxdWRlbFVmeGV0Q0NhUFJvaG5yditUbjh1dTNsVTRCUFlD?=
	=?utf-8?B?eWRxNTI0SzlnRmxQVUVhK210M2xkclQwRFZ5Vms0WlJjNGo2QzFyRjdvd0lj?=
	=?utf-8?B?SU5xV1VzeERuTm5mQmQ2aEpNb3RZaThHNmJsV0JCTlFIOUlZMy9sRnNIWTdH?=
	=?utf-8?B?Mi9SOHlaYlJQdHlRRkNWc3hkNWYzWlc3cVl0YkI0RVpWV1UxRVA3Wk1vR1Z6?=
	=?utf-8?B?V1YrTVZ5TTk3SDJ1eWVQZ1phMkFoVnF3R0NnaForMm1KQ0lwQXFJMjRpZzNh?=
	=?utf-8?B?V3c0ZldQd2JKUWx4TnVXbU96RVV1S3lZaHhvaXJtT0o4eWlSUWJIcDRqN3Rp?=
	=?utf-8?B?anphdWpGSDk0a1gzYXFNdHdQK0pLNjhWVmJZbGJjYVowZ0lqZ2dIVmIyYTAz?=
	=?utf-8?B?WUFPdmZ6V2lKNG9aWGhialVDRkpQMzh1S1pVVGF2VWVLR2Mra0tOTUNITGlX?=
	=?utf-8?B?ay85Y2hlTk5uWEJ6WHZVdVVIcWx0eWQwRjBrc3ZRcERkeTdjbk8yNGxFcncv?=
	=?utf-8?B?a0hvN1QxWktEcU9WZmI3MlVZU1JraHp0RFJIWU4zbmF1YU93cHZoVHNKVzNS?=
	=?utf-8?B?LzZONHl0U3VsUlkxdnVCeUgwSStvOHFpRFIrNUhYS3dWaUZ4VHkzMERJWWJM?=
	=?utf-8?B?US9RSEV3TUF5VFFuTE1kYnNKdTZzSHhWdFdBWGk0WXp4WGZnWERScVNZc3JF?=
	=?utf-8?B?d1AwdlZrRXlPdE9DOUVVdWlUdzdOOUl1V1JhZG0wa1hDbGpoQmx4ZU1ITkZF?=
	=?utf-8?B?aE4vdWdqQkNtVnF4S1hrbnAyYmdjTDgzWHczd3JuUzVrc2tLQTBJZkp2MDVM?=
	=?utf-8?Q?sQ+fL4qVfYjD6LH8g1qPzfFKptkntQc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR11MB1672;
	5:2QuztIigADQug2KK9+50YekXXbnN84t4+bQ15MNcAKt2yykep3flG4irUuwE19m5WjoM6KItzXofnwVqN3LDN0a2+wd3dgi/SMNxjCPZhACIhadcXp6rdVwWjfUWgeXj1m0RI6l6H2bLJeUflvvTCO8HjvHislkSF7mCJOa/HXDr6Gh4pWcUUmUKGZdEuPhCs4s7NDKne9UwWv6eYzcL0O0mcbKZgisDQ5UqDXeYOrAYXwpUbZI1RfdA9KmVPxkRWgpGh9si5ZzYIts3s7yxdi7P6aLQnUwshIH+upGjxSY2ty8SS3/DVt67CfMjOvK20EcBWpWmpBC1sIYSj/EOn4PHtQkbDBhw1SQ+yJScbXg2/3d3v75r/EWGITjjyhLUCf4epwCjepmWt0Ys1SKNcZZKbcISGjuxeIz7IMQd24ZNZSVTll54Z7a2cuB/fUKyzjZmS+6lUbHP8zi+Ay2xycbHMCtIAQwSbuBqZO/SpN9UzeGe4KvRLkwjrEygi2Ro;
	24:RAqUgDr+J4+4dBHFZm84nw1kf359shgiTNFy6jXhO6Vh4zXehTCucak8Mz56hsGhg/r8/hxYThElUJze/ioi6Xz6JDz6yS+wyj2mqjlF6nA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR11MB1672;
	7:QrEhilA+fqc6MgoW5PWRn+7NEfyfH0whMDe5iJtUu23SDbQwqYuk1zu7l6EWMcBGTJzF8fOMgtGdPUxtfWXGKHvA0NATS8b+BeX6qUx82snsZaM7zYXn2AN1eiQPoPQ3z1TGqB3AnlsrVsSjS7AwFyO7VTT3XE5YjiqD4QHu/D2yb3GymiDG56dHvSMoihy95elmE+lhbq/vzcIwGjsjNDskc0SKRvfgL7WroG7aldOpRQnM1t6LJks/AjXlwh6nmkYzyQm41ApFgiq3wugdusnrge3C428QI4SHDMCBUf2SPdlfNMqKgQYhduK+y32HpVADZOAp9KnlCDIiNt0CzyftkKmtmtEIGhRl+qrN6hbUJOAu79SH9BLYX+yvvXTgtioqFA9k5U9JVofpXL0ppw5eijP9cSxIz5bijr/kauv8kX2iUOL1387hHpyBK/nbGzX8/tc/5dSJSkrvS5g79RDu9XnGWBywAgPanYSjLhfJK3AXYfBC7KFOGZxySm1inLCFg1eK6eyV+QtV7hhiYDhLmojC8HKVS6FNglfWwJmIala7UAZhm4wZ/amWqcpcULuJjwOVhSNUADmDKjznx9fTd+G9edyTZVDTggcVx4TqZv8sd62gv85sWs5hfGp8BCm8WeaCRJHvHqowKIFsUs+kaYh8sC9SP34Qf3ltzriIJYQD9IoPQffzD1HebfKdyO0WJ2KnypyxWV66Nb+U54T+PJwxRYT9G3skLuPmmgErBu/5cYqgmJHcSc4DXZI4hGapMz54nsdUtHa/7AzIYJn0IKLtC57XnJ6t/yhAah8=
X-OriginatorOrg: amotus.ca
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2017 15:21:37.5521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1672
Subject: Re: [PATCH 4/6] bluez5: upgrade to 5.46
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
X-List-Received-Date: Wed, 19 Jul 2017 16:54:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 19, 2017 at 11:01 AM, Maxin B. John <maxin.john@intel.com> wrote:
> 5.45 -> 5.46
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-connectivity/bluez5/{bluez5_5.45.bb => bluez5_5.46.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-connectivity/bluez5/{bluez5_5.45.bb => bluez5_5.46.bb} (91%)
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.45.bb b/meta/recipes-connectivity/bluez5/bluez5_5.46.bb
> similarity index 91%
> rename from meta/recipes-connectivity/bluez5/bluez5_5.45.bb
> rename to meta/recipes-connectivity/bluez5/bluez5_5.46.bb
> index d5f516c..93f4be3 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5_5.45.bb
> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.46.bb
> @@ -2,8 +2,8 @@ require bluez5.inc
>
>  REQUIRED_DISTRO_FEATURES = "bluez5"
>
> -SRC_URI[md5sum] = "20d936917afc7e1ffa091f5213081c55"
> -SRC_URI[sha256sum] = "4cacb00703a6bc149cb09502257d321597d43952374a16f3558766ffa85364e9"
> +SRC_URI[md5sum] = "913f35d6fa4ca5772c53adb936bf1947"
> +SRC_URI[sha256sum] = "ddab3d3837c1afb8ae228a94ba17709a4650bd4db24211b6771ab735c8908e28"
>

A new testing utility, advtest, has been added and should be installed
along with the rest of the tools listed in NOINST_TOOLS_BT.

See: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=fedb7f6eaba7bc4ac879d1762ff267789c4db552

Marc

