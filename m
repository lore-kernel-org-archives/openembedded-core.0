Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 387 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 Jun 2017 17:02:51 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0043.outbound.protection.outlook.com [104.47.36.43])
	by mail.openembedded.org (Postfix) with ESMTP id B14C6782ED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 17:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=RZEXwMMOJMV3mLpixnYLwUUbLzVXlPMeBidg4H1hfZs=;
	b=fDu4Kt71RXCW3ai9Xq/42KJAJo0Xk4EQaWkq/XqThpa0b3djia1iipmK/KG/SUp4ken2aebQ1XCD0TOV+wSJDu1U7TnZf8kAacJOpiuOW7KNlPkO6ZuSN6IeFPGlKqA5VaaJObnyQ739tVTskHlUv0zrO1z7SgKd8ZmtB+o2uE0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.0.1.79] (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1157.12; Tue, 13 Jun 2017 16:47:00 +0000
To: "Burton, Ross" <ross.burton@intel.com>
References: <3bd366a6-a31c-e4c8-688c-e24e84f1520c@web.de>
	<2af19119-fac3-8ce3-fb36-c4aaf64163b7@xevo.com>
	<4e18dc00-1800-f2dd-797a-7e0a380467c4@xevo.com>
	<b51b0f8b-e21b-087b-5225-38fb8040479f@siemens.com>
	<8098d7e7-b887-4c4f-6dba-db9065c97571@xevo.com>
	<CAJTo0LbrkS8oG1s05KcMu6mREZwd-+h2aGwo7cLXjJc08XrMeA@mail.gmail.com>
	<f64173c1-2746-06cc-d283-6d42c670cb69@xevo.com>
	<CAJTo0LbpaXG07FouMMN5qa7zVUqkgxAG5OciFXQmhCzoSxrrEQ@mail.gmail.com>
	<55c25692-acb4-01d7-5c6d-c180508b8729@xevo.com>
	<CAJTo0Lagk3XBDGYsCb0UpjmYDNWPQwjqnTsAMDPd9DSP5Xq7Uw@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <2e4ffef7-2375-f9d6-4789-919858b88272@xevo.com>
Date: Tue, 13 Jun 2017 09:46:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lagk3XBDGYsCb0UpjmYDNWPQwjqnTsAMDPd9DSP5Xq7Uw@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR20CA0016.namprd20.prod.outlook.com (10.171.151.154) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-MS-Office365-Filtering-Correlation-Id: 09091173-a2c8-4a0c-79a8-08d4b27bd043
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:VUQw9ijS6X+Tdht+w/W74FOssHWVYPfsyjHY4boMSfgOM6i6laMQXfUh3kdT8ZpzWez7PyxeChqmtc/ycIB0Z78JajO0YbGznvY3GMBhwaKG8+w9DLZcW/5ZC6Qm2ZM9/3mCyQ4dI+alQGR8JsLg3Zpuv8eI7sOqBiVIsa561dm4eLvEV79ly5NGoEtLwenYGXGEtuoXSyro0VQnJXaso3kviXe+UimGAx7Yb8zDKf5pk6Ky+3fxdMW4wmXw8glOlkgJzfkD9kMMtCFPbkdybBpLH3omy/lfC9MxiV/iwHN1ODThQN+K3fCsfoPm7K98HVnhjo0onolNtnGw2EQ8jA==;
	25:lGw8P4XuBplqAzudB5qVG+C+h1xhHPLl/tX5AcvT8kSsowxDSCoPlGge/2GEUUGFMedHaslVN5RVZ20zK0MmNmop17MLzK2lp9UlCYP3+EL5Q4Gab6hYij9qs3Ecp6oEK2GcFWO/Z0Hf8VP2qLtMoTJq0+e9gzmotnWCR7mh2oiIERjc71LWr3BVg7BvKsiYRpQ3ZOgc2EfH0QSfWEuFx8VPW6yMtO+9kf1pLxYFVFrWjffkc59WtW+kJ5qTveFhBJkWgJ44NBJg5YQUDgKR7PC3H5Oalp3gS/pALWTfOKoJSmL3akMFxOZjmTgK3rQ/bjCVS1eN1odand6BmVfH+59GcdlDdVd2wdUQSFzQiNdJZWMfAkJ43T/RFOzLwlD08sndFW7B/CNii//mOv99pbsGbDNQGbOIOY86DPlDHNy9DAbCew+NCDC8oHKiqiaZmO1VpfXNt+ft7rJ/JOZq8klRqU5F8A7DzNFndzdFiU0=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:Z03Z8hrvvYq5GnguGUT94qD1rXVUeNufH2y1RsUTCz1qOFIib92vlNvQINEBG0pzHXbHmRmEwgUQRnCx2JLOJzXMdksu23gToEKWhkn9mPlRNOOx+24QuOfn5AmXvRdI/LXYEyN17r4ujqVWQvjowhTibeDAS3eODSlxc+fn9L5ec7lWipIrRXRwUovMKz5bVbvsxnX9vaOggDWROBBePGXp2v5HYrQivDk5+ZTQsjnh2mq6Ksv2d2bEVM6eIhIF;
	20:OW0bQ/PhrYYftGEJcLAsuAiW6/wipTmDcjRhZfpA8lnMmDG/FmVvOANARyc72NrPdeDZ/LibzkXxQbriKOqR9ZLgJqTFlFyGrD27AH70zcw1lZi310gzwIWHYoblH6B1iNL5bq+wea4YDxiAcHXDnIAqgtxZOA7btadbBmxPaUl4oUU67LEoeoUjzPP03SMqf0rPJVS878ltwJz7915e2Uv8t3eDHrBgvWtcQqS8GD7XO73zvQusQdk9ZBB2ld/+2TnnGQdw4t22GMfWScsoNqTCTXEbvmVGVLUeEeWVeVy3bPloeHG4TRUu5tAAvgcRAYkcD2mNboqyKKkQcntHmQ==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB29354D90B0EBA0949D9E8FFCABC20@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(100000703101)(100105400095)(10201501046)(3002001)(6041248)(20161123558100)(201703131423075)(201703061421075)(20161123564025)(20161123555025)(20161123562025)(20161123560025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzU7NDpLNUtNRjhKcGlxbVllVnp6WThwbjZDanBJ?=
	=?utf-8?B?SUxkVnZVT1FSbnQrVnMwTEdGT0ExQmNWMXdZMmpiK01nbE83S09DelZyVTlJ?=
	=?utf-8?B?N05hb1BOK1ZoTldhNGVOcW1SbVR3YkVQbTBoYUVLWlJGZ0NvYVd2SFpFemFT?=
	=?utf-8?B?NUVKUXJyemsydG4vNmVXVlhDMm9zTFNxRjA4RkxXbG5EOGZISVdRblg3LzJk?=
	=?utf-8?B?MDZ1cEV2eUhPVXE0RkJRc3VDZVdpS1R1cFdOSVRZbEpyZFBVYXNUMnFaajBX?=
	=?utf-8?B?bkVCZGRmc0w1WXdSMS9HaE96aGNDMThhOXJJTXo5ZzdBZFFoSzNTV2lqUjRO?=
	=?utf-8?B?T2VMQVczZzdQZHdoTFJpejh4ajNmVU8wL05xcFlSMCtxUkFtUkFkZ2FJay85?=
	=?utf-8?B?ZjRMbFE3dDBNa3F6dzc1UWVGSW84WlBCRkpYTHg5Qkw2WG5YRXNvM0pvUU1h?=
	=?utf-8?B?VVNhMDFsRkFSelpxa2hNV1V6dWxqeGhKOVdXUmZoeG5VSzZLeFhJdVQzQ3dn?=
	=?utf-8?B?NW1nQnFIa0N1UTVRWFNkbmFtM3Bta0puTEpkeXkxS3lPeURCVnhGRFFGNjhK?=
	=?utf-8?B?TkpRTFZHbDZxWGdRUTdzL3V6ZHliWENEbG9MbUlkQU1YN1IrZ091clV4Q2hh?=
	=?utf-8?B?TEc5bWxQSnlPUlR3d08yeWRoMG1pV2NIYm83NS9UMWRjUVNZTnF6OUN3T1JZ?=
	=?utf-8?B?bVNjRGpRT2xlY0JUYlF4SStwTkF4dDJ2THRVK01UUnYyRndkU0dzYjBCSmI3?=
	=?utf-8?B?WFFIYjNvcUFCdlF3NnFNVzlHSnUrRVlCbDAraVVWc2cyV0tWUEUyK1dEVWJZ?=
	=?utf-8?B?RmNDSncyUEFyRUY1S2pSSlRZQWZSUmo1bnN0VWsrd044VXRxRmpkZDNYYjRT?=
	=?utf-8?B?aVdld3BsUWk0Ui9NZVlPdlIvR1RmTUFoVDhNc08wK1pVM044aTluQ0JHU0dE?=
	=?utf-8?B?enVEekt5MHVObENoajh5ZUNDWWluQko2SE9LVFJCdGo3NzUwaFBlczRER295?=
	=?utf-8?B?ZUVlbmljdW5IVzVMQ1dITWtma2d6bFc2NUtlWmZVVmdkVnJuRDBNalY4VTVH?=
	=?utf-8?B?T1FjVU5JUEZzUXp6WTg2ZzkzditYWEhYQUpLZzREWW1KKzJDdUQxdmdienhF?=
	=?utf-8?B?U3R4dXVicHlWb1RiSGpBUGZYWWhxZWowaUsrR1dBdWZiK3p6NzVtY2Y3ME5L?=
	=?utf-8?B?S09pU3N5VlhuZFBkY2hFU0JKMXg4ZE9RclNXMWdzV2ZDbTJDNkhuUG00ZHYy?=
	=?utf-8?B?WHJJYVFXMDVyemhPeXNUMWFMSjlRYTAwRFhSSEdRcDJTYmxKYzI0ZW5mcUpz?=
	=?utf-8?B?MnpuZmdMa3ZqcCsyZHVYQ2JHWXlTb2N5NmhoeFVDMW9XTjhvWEZlK3NZei9m?=
	=?utf-8?B?SS9uU0J6enJ0NFFJWm9yRWl4TG1Ubi9IMkFkckJ5MU1iSmowL3l0bEloZlZS?=
	=?utf-8?Q?MwyEJAU=3D?=
X-Forefront-PRVS: 0337AFFE9A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39400400002)(39450400003)(189002)(377454003)(24454002)(199003)(25786009)(42186005)(31686004)(229853002)(2906002)(50466002)(4326008)(5660300001)(50986999)(65806001)(106356001)(65956001)(76176999)(558084003)(53546009)(105586002)(33646002)(64126003)(86362001)(54356999)(31696002)(66066001)(65826007)(83506001)(81156014)(81166006)(8676002)(110136004)(189998001)(77096006)(6486002)(93886004)(6116002)(53936002)(54906002)(23676002)(6916009)(2950100002)(7736002)(6666003)(38730400002)(305945005)(36756003)(508600001)(230700001)(6246003)(101416001)(97736004)(4001350100001)(47776003)(68736007)(3846002)(90366009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935; H:[10.0.1.79];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzU7MjM6TzIvOXJPeEtvSVBWRmZGd3hQbXdZT3Rt?=
	=?utf-8?B?bHFUQy9RVHVLbmlHTlkyNlVxUGZsQU5GZXlkSW9pTFF6NVBPNWc0WlFlay8w?=
	=?utf-8?B?Rk5Ja1FTd3UzNGRLM1ZlWDNEQWFScmRuTEZPa1pHb2EwT1ZoTS9ZcmhSOGFD?=
	=?utf-8?B?UWNmS2RaSkllb2RPNWEySUhwME5lRk90UHJTZ0ZDbkplZDAxemhqY015TWUz?=
	=?utf-8?B?bUJOcHVzUlpLeGNHUGhUeG50aGNPbHJVS1lCR3Y3K1VXTEFzdnEvWG04R2hn?=
	=?utf-8?B?MTZlZFlWLzArMHVjY1dpVE1oeTJ5N1Z0M3I2ejJsRjd4clB1Y1Y1SFdvRk5G?=
	=?utf-8?B?N29NU3pyN0hqVmNQQkREMENudGNuek1XQldkZndUR2tuVmJVUmxma2lka2Vj?=
	=?utf-8?B?TUZBMFhtQ2RJdmFvWEtIdDkvRUsrMG4vMDhIK1F6UC9yNXlVYVNLYmRFVDNJ?=
	=?utf-8?B?eGZNcS9xc2FTanNld3JJUWJLRWZKa1ZkZjhPSFc4S0ovYlZJVzZZSUlkeU1r?=
	=?utf-8?B?SFd3cVlybjRuV0wzYWlnRFhkWXJ1UzBlTjRuc0YrazdXOTdOakFZKzRRRzdO?=
	=?utf-8?B?cWtTTVNRR0tXSExuYks2TjdraU1ESXJsWTVDRWZLaXF4U3pnL1VYUlQzK2pL?=
	=?utf-8?B?QmxjMXNMWmpJK1ZZbXFFYTBBZ08rUm1xM3d0bzdyS0JucFlNc0s0eDBPTnph?=
	=?utf-8?B?S2paQVNSanN0bnRYd0FpT3FudFRMRUkvaDFhcFZFeEZNY01kOHl6Y1U3ZWg3?=
	=?utf-8?B?Ni9NT3kyNVppME1UWHFhNXlpVmRHNmhKcXlMQnZGdEwwdGgwdzV0OXY3aDZO?=
	=?utf-8?B?T3VsU0NXdWgzRDJ3cHFFdnZJQ2EwNlFKejlCb0FYMTllVmdraTNqUitBU1hJ?=
	=?utf-8?B?dG1MRWtja3lrR08rOHhJN2NXN2NPdmUvcDVkbXRIai94Ym1rZm52UFpVdGxj?=
	=?utf-8?B?SEFybE9BMCtIR0svQWRkajJaY1owa1EzZWd0NTlmQU1CZFFLcW8vNnczN05C?=
	=?utf-8?B?bjdwdGwvb2lwWE5XNXVLanBqTklmTzFxb2grbnlwOHM5ZjBRekIxZHFvM1hs?=
	=?utf-8?B?eTJYWS96eHNvV3Q3OUc4VFRybXJROENSbUV1Skw3bkxGZ2JsUzM2b3YzdHJi?=
	=?utf-8?B?UEVVWXdRZG0rUFJQL2tQNTVQNEgxbVUva1BBdzI0SlVCTjFocW93SUJPeFRo?=
	=?utf-8?B?cUFnU0E0Zmx5NGVxNmdjbnViamwrZ2lGZTQ2TU1mODhWK3ZPbTRZRmxFTGVM?=
	=?utf-8?B?RGg3WXNlYzljZ204WjlOV3pzUFRYK0o1ZDNjUnI1UXA0YkU5QVE4YWY0WjFQ?=
	=?utf-8?B?eXRVQ1V6dmhKbFkzRURWQSt6Z0VZOWpUaHNpQ0JMNHh0TGpTenBRdUlRM2FK?=
	=?utf-8?B?cjhTaTJKcmxOUGw2bFlKdVdGVkJBZlRaKzErK3hXUnpiYXlYZDFZWDdIYTR2?=
	=?utf-8?B?aGhHWGRBWnU2K2lRSHJTYmJHMUJpZTJNNVhnQ2tmUWlPdHppdFM2UmQwUlJm?=
	=?utf-8?B?cnRmeElJcHJHT2JxaE92b0F6a0hQbjdibld4b09jeXJSZXRPVUh4dG14K2pW?=
	=?utf-8?B?ZVdLRmUyMEN5dmlDUTFUUU9NTldOM2NoU3RqTmpVQUFNZk51bkZuWXgvT1FN?=
	=?utf-8?B?WnBNMi9neTJvMkFraDhTVmhSeE5aNXpvVWFaVGtsRTREZ2NSVnR1ZHp3SDFq?=
	=?utf-8?B?OHZJV0dhWURRK01TeCsyWGtxUzRraDZuaER5b3FnVlJmMEpYcjY2ZmhxWjIr?=
	=?utf-8?B?L2ovQnhaUkJIY2tjWm5RcEVUZjdtSi9wZjdnemdBRzl3OWdEUDNJZGJndS9u?=
	=?utf-8?B?aFBOMkxqUjFYVGJNSllKVUdvVjVkdmQxbUlhbm4waGlqZW1OTFBTQ1lIQzFy?=
	=?utf-8?B?WWlUQmV4SEI1UHEvbjVROElYT2h4bUdyMFNZWEZuYzgyK0tpeFBsMVAvTUcv?=
	=?utf-8?B?Tk92OUJxSlllZWJRTmVxK3h3T2hHRjNRWGU2THArSko4ZlIySFN5a0xCUXhE?=
	=?utf-8?B?YWo3aWM4RzA1TzBIYjlHZUJXYXhxb29FNkxSS2hnPT0=?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	6:tSED7DamWI0M5ABFf2YKIrv1+aEOeX+3UyNnwyRY01LOo4dJyrlJZ+1kbEOmnX0PnCbEMbTvkYT0zJWDwKvPljfSVEJnlM6MFb7MYFHIVvsThdIt5xPECYRdKnHiZNSgLuW/N4mBF1t723kNcp8lA3pTaFJN7of4sCootuZgtfSTwMlEgeRTfqaGnNUUn46DM+svGdhNOcw2XZTDpAh4a8WkMtjjdtylOgbc95e9gKAA49V4O32TtysNbLeNT4LfsjjS/MIeJpbPVH/2k+Rdnb+zpCZtpLTrSI1iicddH/eLl3lI8EW6zx6seymBM24lkC6m+H+v8+J04uSxir4YoYFbGOy+8MnIJMXikB5F5Fu6Lmj3Boz0Q3QccHmdAGrY6ai9T9pC0xjiXX1FnR++nd2PXWAV6RdGBZJPRYvf1Fa9kv2ja8a3cQMxFnszBWILoet+ITgs9zfTImA/ynCSUaWP+9TdM70XwB/IZefYXK51/XZVgmgqaMeYPQVxbr+mSG8sBKuFxisu/5/01qshhA==
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:dvYl7ncoawOGs7nb7kPlFbPZYWM6EVicgHDWzMOV37NkuZwafXiS3d650YOehOeNKsNdEchzukWz00H+BzGuOOM2XVeW2xZ7l1ZhA+52ix4YvANwjw9ZEEKDKORrLdx1lglJeZ2vWwK9K2Tlm6o0sKXfFRT03Co5eQCrwr/t9K9LUTaif6WlpbHLtRa5abllmF7thfbyGVGtVVNOwCZrHSRKb/SvwMvCL6y7iPIDb8oi0WR0r9J7lYCycGx8Gi7UKDvUkeMOevz2iVxrvSD6OJ+8nSbdWJ94lqdLmPtA/Q7WksdcycwbZSSvqXUYU1Nx81/tV/7eQkLKnTMQxMqbUD8qSBJnjeZ10Q3IdnUYzD5Q3k38zliyDUh3942BxBuZklqQQw6DSES26oa07s0M+pMhwH8ZoRqEWUn/+AImB8yxNeIo4GvOg2qUbZJELxuuYCCwT1RPXGrByPptOJYankNQnWbDHsRv0eG2Zun+I5Cv+fZMVxqEH85EYu7s/gNW;
	24:LP8IDFTs/XW2lfTmxdcOENHA2k0AabSHtfq084BXrsy9vXTAeqSTlpzfc7SAnNpVbpf4xXgwK5he8TXoOBtOTEh5ext2PGL+Q8n30O6ya9g=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:XcLgwWEPasnoIOzammM+FC3OlGgdKpIKYu0XYUTco76XhIX4IX+hOWcnSX8CXV1T+kymtnydJQjy3+Nszp6jN84YSb6vLkL25HZF6poWUJz+KhTpK/ZxAfrl1JNmyR9akW/yoOaLD9N3Vi1Fs/9dNjVjj4PrzzSP3+YLqHbSoInyteDrcJBUR3ONNT+x7WqFc2VMKOSFeEdQzBOM9JtDf+SpjfUAt3cVKcZs4FVRjVOo4i8Xyo4a41lSWA0lbT71t30aexON4wqmhZWvTCQKAld4f/BVpyu642wZ3caUht7nQYhYsAFOJKv2vj81miBDcDxQCXvkExOtI7tKmlVgTQ==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2017 16:47:00.9480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcf-agent: Fix daemon termination
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
X-List-Received-Date: Tue, 13 Jun 2017 17:02:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/13/2017 09:38 AM, Burton, Ross wrote:
>
> On 13 June 2017 at 17:35, Martin Kelly <mkelly@xevo.com
> <mailto:mkelly@xevo.com>> wrote:
>
>     Alright, makes sense. Do the patches look OK to you?
>
>
> Yes, they're both in master now.
>

Ah, I was checking meta-openembedded by mistake. Thanks.

