Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0064.outbound.protection.outlook.com [104.47.41.64])
	by mail.openembedded.org (Postfix) with ESMTP id CCFD1781CE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 16:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FFth1youayh+lh6ABg4X8qK7vI4K0dL0efCm4Ka+FAk=;
	b=twiasc5h9WGy+qhtI8XT3BuAQiUFag/mqLu3KWg/zXGdYyEFnFNIHncV1Si0pzqwEJFz13/DFxb3ktGNXKhzDSkJPFUJG8oZmGWqvy8s0Ecsg0yDGdHLv3tGi3WX7syEc90rzQjpNemAPbiC745Wd175WS6fynPo1rTb18K3vyc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [10.200.13.89] (96.69.208.217) by
	CY4PR0101MB2936.prod.exchangelabs.com (10.171.240.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1143.10; Wed, 7 Jun 2017 16:33:35 +0000
To: "Burton, Ross" <ross.burton@intel.com>
References: <3bd366a6-a31c-e4c8-688c-e24e84f1520c@web.de>
	<2af19119-fac3-8ce3-fb36-c4aaf64163b7@xevo.com>
	<4e18dc00-1800-f2dd-797a-7e0a380467c4@xevo.com>
	<b51b0f8b-e21b-087b-5225-38fb8040479f@siemens.com>
	<8098d7e7-b887-4c4f-6dba-db9065c97571@xevo.com>
	<CAJTo0LbrkS8oG1s05KcMu6mREZwd-+h2aGwo7cLXjJc08XrMeA@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <f64173c1-2746-06cc-d283-6d42c670cb69@xevo.com>
Date: Wed, 7 Jun 2017 09:33:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbrkS8oG1s05KcMu6mREZwd-+h2aGwo7cLXjJc08XrMeA@mail.gmail.com>
X-Originating-IP: [96.69.208.217]
X-ClientProxiedBy: BN6PR04CA0021.namprd04.prod.outlook.com (10.172.194.31) To
	CY4PR0101MB2936.prod.exchangelabs.com (10.171.240.10)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2936:
X-MS-Office365-Filtering-Correlation-Id: 8e8f0ec3-985d-4b4d-87da-08d4adc2f1d0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:CY4PR0101MB2936; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2936;
	3:LZ6ChTV+WWP8mnCtaoT7dGDxuXUTTvnTZed3gM9I+RWx/D935/xS9f/hH/m2JniQKESsNB2xwIJqm/vRHmwDjTd1DYdfELl9ZPD96iKmhdXGWc7S8YPOnnI9R5tgK36zFpppYDJMGv2elPLz9cAuTFjD/xlrMSWwLXuadSB33lgdOQKvADOUk1BVzdNwdOfhtUKk1X648JLbv1IVEzEFb3qG0FYFl+OMj3XKgcXXZWaOynj058MIkAZW44r10Ko1pl3/bdSqM13uL+OgfPqQxxVumula/IdO6DkhXVFWrqnytYJe7WL4eUUUNYplZLLVsO6AmyQRLVTfEa/4iX7g9w==;
	25:KOwWl8O5wzuXpXIsbg7c+g6c5hEJqJCDi2i+Tj29cpK07P4I4zgzCAJhnWBi9I6q7Cw6EKBsW2DT0YSwuWGwEZ8mQ352G35+2+tMkPPv8jsKHeyn9eEnYCEiW05KaC8k4xCAeY6PLKodnspuiTJMppymoIKn2x8VJqzKqjIYBOhagUH3tG1rn3X9nDE67qFtn+E9tJ46zbbgRC0Tn4ZmO7d+lru1p96/ZD1nHP8JwxNIjyMuaknHzO7XXZVykSw9mPcE8YafssD502/TAuqy9JoYL27o5ZVNgUxvH3VHcF3TeIHW0qqh4RlhtJY3+UnLfELRdDycYD1GrN8rOknCtT4ny/biZiY1wFmyf2dEg4sQj3gSmYvu/ByOHLO5TlT4x9IObGMODFhMFxSWtr9gDIP0Gl2K2lPeFtA+mJkAWerncEcfbC8BTJZcHtT/VdWbvz2Q1fhydyK3sTvttCDfBfnZ+fXzA07BI8faHqphXMo=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2936;
	31:4Xs/DkC0dR9ZdF3Oqsm0thI541XmT4aw2nxFGtQHCcbzi2qvBCqlnEpILJnEaI4jKUM5gI2Cw8/1d622mX2jkGG4gpXuFoZ6aVgOFIT0w46Ld7MP/heAMQ12BLk8M/K5GyXUpsZgFUK52GBFOcr5Ttx4J62MPQ1pSVPT0Nbu2Q6wweCDgbNUwmX7zcOFjmtbevrraVoc4MuqF6OCHCk3j2XIENfiKG54h8ITHWYOgMIXUz0WHKBDifYu67oYvVfXsY5l2pS+oDiHEVa+qQv4aQ==;
	20:sRZmtAMwRTQQezwG6yvhlJ8FymzCTxiN1ilEYSAlR8Hwgb22C8wU8MzStibruSCJlXcVsgrsqzIXDo6lGNhBN5XQTD3EAdU3jRzpxBduIF7XB3E+ZBCyEcoyXLDKAXcEYg8Q+p7nPmyPMMfBidpIISD8FQMjicQ4gtVMq68g/hJ604Zxaj88oLb3btT/BqPMurwyhjMRXQLGEN/YVeiuhumD0IMi3NO9DU51YMKaQHi4EbsklMTfxC3EVJ9ylGgkMTwTHNGhh+z0owxHhnpdg+bC2z/yJH40DJgjQzsvUf+J4/aQSc0jFq7QYXoEepIEkiQ/hJEEGtZ0E64c0t+UAQ==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB293661DB4B06329BE461C04AABC80@CY4PR0101MB2936.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(100000703101)(100105400095)(10201501046)(6041248)(20161123564025)(20161123562025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2936; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2936; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzY7NDowSTZIaVlqcnZDQXByT2FJOTRDbnlPUnd5?=
	=?utf-8?B?cHd5Y0lNK001TjhCcTVNM0RhdWdqVHNacHBkTndMYzZMQXdkb1FvdFhWWUE0?=
	=?utf-8?B?NGNJVFViQkg4TVhYUGxiSEpKV05vUmFzUlVLYzF1enBUY3lEODNwd3VZS0JM?=
	=?utf-8?B?a1BOUjZtbis2VE1kOXl6OHdrMDVvSHNjaU04cE85eStpNDUrVHNWT3JlYWdX?=
	=?utf-8?B?RzNsOW5YODJnbDFrdlFWU3hUSFlqMHBUYWtrT2UwY3BYREhPYXRYVnNRQ0RT?=
	=?utf-8?B?cEY2MXZKWUwzK1BMTGdDb0JIdjRqUEtYMUpZNk1ETFJSSUdZR1RBZHI2QnRu?=
	=?utf-8?B?c0NqY2tqYWNBeFlXazV0UXBwaGMzYXp4bVBXYnc5MHNKKzI0Y1FJSk9ONG51?=
	=?utf-8?B?eklSUEtML29lWko4R2JjNVJFa3gvLytIRENjZXpsaTZSKy9Qc1lTZlpaNVhB?=
	=?utf-8?B?b2lPRlB3d21QRFRqYXBCMFUwdHZQRWk2bFI0WGVGR2lWRlE5RDRBbXAvL1lS?=
	=?utf-8?B?WE5ZUjM1eWgyRzhnb1o3UThFWm0zM2NMVUJxNGlWdzdreEdEaTVPQ3hkTTVk?=
	=?utf-8?B?UUJBNlpFSXRBNHJHZTNReTd2cS85dlIxWXFjUVFXR1N1eUJhNjg4RnBUNXdI?=
	=?utf-8?B?a2NCbXgybFA4aW1QQVRveFVQZlRyQ2V5UzhhNTQwMExKc1FnVTlUQnBqMkg0?=
	=?utf-8?B?MlZkTXRJei9YVlUvU3hRTGdiUXlxemdIYzBYWHFlemI5SDZ2UkZvZWRIRXlB?=
	=?utf-8?B?eURUY05ublNoU0RkVkVIOHRMRWprTFVOaWdZVDZXcUZ3d1VXUjVvelkxK2k5?=
	=?utf-8?B?SEZnNFJCMS83MXNzbTZlREJMM3h4ejAxeWF3bUFIL2xLSWVMS2VsTFFzOWpX?=
	=?utf-8?B?V0p3N0ZSa29WZXJCc0srQ0xKTWE0bUMyb0t2ckFuRjQ1OStWdTBvSW1PL2ZP?=
	=?utf-8?B?RXh2Umx1VVo5TFNEZmdFWFMvOVNzU2tXcHVzM0djMEZ0aUNTTDAvKzlrcm1r?=
	=?utf-8?B?SExJZkVxRnNLWTc1RTMzdHh5NkJQVU4xRnlvcWNDVTBDeHROeHNVSVpzRGU5?=
	=?utf-8?B?ankrbDNXK29oanorbllFQ1B3eFpqbzFvQ3p5TEJwNXBBWURrdVlRNkN0aVo4?=
	=?utf-8?B?RDEyK1MxQ3QvMVVyWXhnUzl5NnhZbzdiTVRnSkx1SnZ3V2JRRXRLSmdiZU5L?=
	=?utf-8?B?bmdqckJoMktEeStFVS9QWVV0RjFLK1VEUm50eVVHcjR5cXNwTStXZDJ0aVBV?=
	=?utf-8?B?RlZoa2RlOEpqWStqNDdVYkZZMXVaakhGbmNSd1pEK0RaZ0VDVVJuQTVrYk1Z?=
	=?utf-8?B?cHlYTENEaGprbktwRGlSSW9VZ3JLZlFjbXR6NXVDUGgvYnBVZ0tTSmEyS3Vz?=
	=?utf-8?B?cEFnYzZpYlNjMTFmQXBhUkY1djR0dkx6WkNpWHNrbkpYTkpjdGNObDN4bXpE?=
	=?utf-8?B?VlJoZWozbll5My8vUWY1cXlPcW5QODhoYTZEVGdyWGJTZUR6WjQzaHZTTEtR?=
	=?utf-8?Q?o9m71atjjgHHKDBMtcBqPUxgOs=3D?=
X-Forefront-PRVS: 03319F6FEF
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6049001)(39400400002)(39410400002)(39830400002)(39450400003)(377454003)(24454002)(966005)(6306002)(4001350100001)(33646002)(7736002)(50986999)(2906002)(305945005)(36756003)(54356999)(76176999)(230700001)(31686004)(38730400002)(478600001)(4326008)(3846002)(6246003)(47776003)(189998001)(65956001)(23676002)(65806001)(110136004)(229853002)(66066001)(6486002)(6116002)(25786009)(86362001)(53546009)(77096006)(42186005)(90366009)(93886004)(64126003)(83506001)(53936002)(2950100002)(50466002)(6666003)(81166006)(54906002)(6916009)(31696002)(5660300001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2936; H:[10.200.13.89];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzY7MjM6bnNSRGQvSWV2S0NNZ2pmU3k5bm9sSkIz?=
	=?utf-8?B?ZWM1MEVFLzRIa3dtUXJjdWprZEF5ancxOTBoTldSRUE0MjRURVBoSUpZdWxM?=
	=?utf-8?B?NjRGVXBKZGIyQmVOUUFTSUNwUmU1aFVaQWtsN0l3UlJTMEdwR20wSU56TFI2?=
	=?utf-8?B?ZWpiQUJmQ1E1cjFUTVYyQTZzK09hN3ZOVi92VU9YU3ZUWFhIb3VRUTZDK05z?=
	=?utf-8?B?cC9OV3RScjZmeUFYT05kVVZUcVBMVUZZdjl6SjNPZEZSbDN4QlM5Qms2cTVu?=
	=?utf-8?B?WGp0aldmVkRjQXFjNFZSNDVhRDdiUEVvYjNvb3JzZEFDTDkyOWc5Q2U1VDdZ?=
	=?utf-8?B?YXJrS2NNa2FZK3Nndkc5MnZweTc0V2tTeE5GQmZKS3VHZmZ6QzM1TU5WazA2?=
	=?utf-8?B?eTZqRmtqWVZwVndqZDIvM0c1djJSazcyN3BvK0p5YUVTQ3VvcWpaMEZxSWZ1?=
	=?utf-8?B?bGx0c2F5VjJXd1AxbUlTbHlwSE5xOGJ2TE9mQk5KT25DVHZJWDM1TjNTK0Nr?=
	=?utf-8?B?bmh3aTQ4Qk5KSlV6WE9mOFpmVTh0RVYwM3FML0I0UHJoRk1YbnRXMlVxMTFF?=
	=?utf-8?B?WXFrNmYyaWV0SjJGQW1HTVJqcWhuckdTVUJ3SVFQbFRrZGZodEVTUUp2VXdm?=
	=?utf-8?B?MlZLNllKT3BRMXZjUjBYRW81RHBwVys5TmFvRlhac2sydUcrT1VDQlVkVEta?=
	=?utf-8?B?TWZVWVFiZURvbFZINWlRNDUySi9haTNTT2VOc1Q3SlQvN2RoZDhmNWd3UXJ4?=
	=?utf-8?B?VUZWYkRvRkk4eE81c2JmTFRuZXNSa1JNdGl2K2VQSGFybmhkajNKSmJFRzl1?=
	=?utf-8?B?MEl4M2lVMVhQbW1DMDYyQlRpWUVZSUJyTWdZcHJJeGRRVkw1bkdnUk9KMHJD?=
	=?utf-8?B?QkFxS2duZnFwOERYN1N5NlBJVmhKRlIwMUdwRkovTnpKNFdPYjlSVm5VSEY4?=
	=?utf-8?B?M3YySkVPY2U0d05tMDkza1hQVEM3T2ZHU3Q4cWh5aEI2RTlFS1ZReGlVOVVO?=
	=?utf-8?B?am5wOUZJVk8wZVUyd1JXRWVPMXhSajF2Zzhpek1JVWtjdFdCZnAvZG9RdzhL?=
	=?utf-8?B?VVdUV01jbkY5ekV0MFhSUk1kVVZGd1VRbkphejR4b3JuZUdxdktWQkswUW0v?=
	=?utf-8?B?RDhRbStVY0dFeTJVdUE3NGdRRTNQc2NQUDRaWnRLVk1MYVBVNCtTQWtLdUlC?=
	=?utf-8?B?LzRiRDR6VUI3RWR1OTNtR20zMFZGUStRVmcwQTh0endkR3h6UEplZUpoN0xT?=
	=?utf-8?B?TzJDVy9nc202eUpHeEpXbDVFSVRUR21xNiswT2RtSUJFL09PSXJkalhpbmlB?=
	=?utf-8?B?MjhaS21TLzcwSkd0K3VGRGY1WkJVYklCY2JPdjlOTFFHK01ERHpoS2R3ckh5?=
	=?utf-8?B?RlBQa1A1bTFWaVh2OVI5dmNDQVFBeHUxb0NoZi9KNDd1dnFGdjBOZTdkYkJ4?=
	=?utf-8?B?OGFUNlovU0VyMjNnOTNuU1BTZTlHQll4MUExZ0tsT3RwWDlSMFkzTEZzdGQ1?=
	=?utf-8?B?Y1RMUk9JdTlMZDAwMGFYUjExS0dTYk5nNjgvZ3NLZEdDOStpR0tRaUYxNnlo?=
	=?utf-8?B?S1ZWcFpQb0tjZUcrUGtYSncrZzdOKzVPWHlTWVAyOFFpSllHbTgvMDd1NDFh?=
	=?utf-8?B?NHRSMmVOUUYwVVFzT3BKWEpSa09LQ2JJQmRvV3V6enVHZjYvdFFtTUovSXpu?=
	=?utf-8?B?dWpFOXpTM0tVWHdlSGZscmZRdko2dFMwd0x0MW5sbW1GTm8yM0FDSEVOa0da?=
	=?utf-8?B?UWVoK0liZkkzWFlwUXRWRzBCYUJ0czUzUTlWYUZmSlFFY2JkSVg0QUoyNGZP?=
	=?utf-8?Q?XN56U21wdg9j5Uw?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2936;
	6:0/9Tn8H7FlJo2Yv2QykBGkGbSg0OBkT9Dzuk/ljngM2cIsIUcUCRoKaala14xCkQvswVoGTzVuWox+09Z6mr7l5pM8LoBHEdsrJzyAq9vKzQXWOg1PWWY1UB3xR/FQHi5JYsLzMABRIjF+ztNoONXPxmX+VM52TGUiF0nI7Nx2evvGIV0DWTtia0SgL4wEwJObsN2qs3wZWhC9mIZiBkBlNBNVKTa+YJc2ZzkyqU29PbBMMWsbh2qpxSyEmBk8ArDb0PXGjyvFwjW+aCkR7kO6MyIpcfmRrsYkhuya5qBqxhe0n19+2AAD9pQhqNxLgbxL+FP73Ync3xEJWgBdf42eoyQZcJZYlw6YMC+pet9YXad6da2psxLdZZeorq1ZdNsOJtvmQMqf4i3yExf//eGraAWDhqLgvX5uTnJjx+dKS5wBJ1dZ8t9+08ef7tK8+QARZAeHD6c187TxBFZYyDSVqrVavx52Gk6/tPG+OzougreU4+SAm5HqN/a9k3a/C8Ec/7JNTmpuHBs1vQkTiOLw==
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2936;
	5:LRD2Dxj5Gk521GCv+cYsmUARTUhK1bH5P9ia9cPSnkosf0vml7EQA0sm3k9Pw/epddbPHIcsaz6zNShLUTtuHAIt9UiD3ifrrpkP/FYEFmsnT5KT4yLBqIVAPm2KlJf1FKVud74sK1GxHJq67fF4C30HUBkNSOamhRCIYDuVHytB+XkItpXA8ec5q7PyeJIqHjdIaWqhIFTbZC3k8xH6Qb7RdH0OTMTL/W3juEtVdJssXsXyrH/PGuEg9UNRm/42+aZg7p7YDEocJo1IQBNuWoOMPbdEeMZBi6Tqvw9gWYNYQYQIVoBwRaU6f1UDbXD3GZoa21OR4WSVQWqEGS5TDPVfSH04FxnDtwfXVkSvaek4Vqm0dszqbH8tMcq2ICMW0JtHq4AVuSCnl4hP+davwI7JRAP/MZcVk77PjCU+3rkMIq1oWuKcTS8TSxmHWbfgOg/3nPc9WbIg4xIuPj95saGf+lEXxDChLdLP0Yyp8VEW4FJ6b5LZCt6/Jggcllrm;
	24:+UVV4qN8DG+aQiJvRH+cBaM/UTMPJVsv1TxL49Y1dSFmHCPUa70b04XRCdLbxWYDAybfNX0rEOYTpAcJrUldPyawmKQz/rGOAwz7mIRQyr8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2936;
	7:O42UDTFee3sx2L2iEX+1PhFV7kpcrCvxWUv8XHTPW9DG4U63IOprplgMZigA6BIuzsW6oz8vVcG1Sbh1mEStfaC5INAwQe7k8aRdEDmNK7agvEB6kntHioO6lrcb4fuVFpb10VPIiI00+UdBcmYfgKGRmtCb4MwwKlB34ln4urrBlweDDPFLIc45M8JJOkAWM51TnYGUguY34oQ79GlBMYTdSJsyDRYHnlGxvdFfV7eJ4o+e4qGxAy1TbbgkxOZoKBTmLrv1U3biACyAk7QVgWMJzP56NANI8kywmiVZ6q0P/Qjh3zyuVQ51kTAsIFTo9EZfi8KEBS3kjUBvnPfZyA==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2017 16:33:35.0202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2936
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
X-List-Received-Date: Wed, 07 Jun 2017 16:48:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2017 09:08 AM, Burton, Ross wrote:
>
> On 6 June 2017 at 18:28, Martin Kelly <mkelly@xevo.com
> <mailto:mkelly@xevo.com>> wrote:
>
>     I sent a separate patch for fixing the systemd issue, so I think we
>     can merge the two patches separately (they're both needed):
>
>     https://patchwork.openembedded.org/patch/140355/
>     <https://patchwork.openembedded.org/patch/140355/>
>
>     Neither of our patches have been merged yet.
>
>
> Sorry, somehow slipped through the net.
>
> This patch doesn't apply as it's been corrupted by the mailer.  Please
> use git-send-email instead of copy/pasting (I've managed to apply it
> manually as it's a simple patch this time).
>
> Ross
>

Which patch are you referring to? I used git send-email for the systemd 
patch, and it applies just fine for me on OE-core master (using patch -p1).

