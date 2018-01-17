Return-Path: <mkelly@xevo.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0060.outbound.protection.outlook.com [104.47.40.60])
	by mail.openembedded.org (Postfix) with ESMTP id CC614606D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 18:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Gaa8fFR6rvZHN5tkT1mRly8sl7V8mB4W7dBv5lA8+j8=;
	b=FOhSW81Rw8LHgYO2l+FdYyGth6q2Rjkey9+KrJsy1leBEVr2LWNOnJYVR/ykBeX3FpI/ctdCxYtjpkItity4H3g+XOZCTKiMTtKk+L15xv4UePuVtsJqk/wGWLWAdz59zfZ9ofHMCtqLcTr6SgL/3Z+JNRqbabem7YNETIKSCDk=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [192.168.0.3] (71.35.165.30) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.407.7; Wed, 17 Jan 2018 17:47:37 +0000
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	Jussi Pakkanen <jpakkane@gmail.com>
References: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
	<CADqQcK4-=Q3mvKJfhjHbJEUYeTiGq3c7dCAR3E=w+ktr+_7RyA@mail.gmail.com>
	<e3dda70b-e6b2-bb18-2fe0-807b5c4fed48@xevo.com>
	<CAAjYPQ=u2U3f6DrL1KP-RkftD8P3nbASf1YUeeL0PFP6vY=hzQ@mail.gmail.com>
	<0ca64688-6a1d-0415-537f-bf59fb8dd2a6@xevo.com>
	<aa0ec366-dcd4-bac2-418a-acb0f9a06709@xevo.com>
	<0f020bf5-d0e7-82ae-c2b3-e7ea5006313d@linux.intel.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <a6f2ab9f-e466-6107-a8a5-12d0706277ce@xevo.com>
Date: Wed, 17 Jan 2018 09:47:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <0f020bf5-d0e7-82ae-c2b3-e7ea5006313d@linux.intel.com>
X-Originating-IP: [71.35.165.30]
X-ClientProxiedBy: MWHPR14CA0065.namprd14.prod.outlook.com (10.173.97.155) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18e8f30b-85e5-41b9-c6df-08d55dd26606
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:Zh/n0LChZPbfnhkVxgeV1GfDgC+N7wVwVqNKD0na9C49zDNz96azPD9avWW13mCwLGuHPl5pKAfNnVenTiE++DSAjv453nhtInVG3zDe728Mz0kV3H0J96pIIoDkm3ZLeeE1bqrsqjjHCMBXIVNWLF81G+Olp0RQy2C0DjmtbehMsclSKHsi3MXVc8WlPEe9jRpAiemyvzrufgy7MERiHTE1ogp4SSKeqlB7+RNXp6AkGLqEH4ZwcCvEAWqJ6XR6;
	25:SjjBnuhiG3JKikgHJZmx4R76UF1MaC7X/mHZiQZZ/soRiJBB287sR898Y1VxLOSYSULwmzUMuBiMqbznMSHG1uFhdzf9d042vpQ69a7Qwvbf8TdIA4qoI2Kvyrakfjy+m/g6lidTTxMBphgs1OR20QsyF5xCP8oJLz8qZ3BPudpCmjQx3xQ+nd6FZm3Nx2o0yhUGvW9Mrga7X9AwGnalsgzJ7AZVD/PfiQFZwmYluxrleraRN8FWQldbxZRE0mx3I1hFPaxtR4rBZgws2Q3y/LuBOOjutoJKdfPZWqQ7apXJgwBHQe10vuWj5QNou7Ut2QaQZbqgJVLY32RdTsDhwA==;
	31:mhlXKUZiNUC8P6BvTWjAKIkS6CZ5yR36U+fJMYJgTixNs5O7tp+nBi+Fy2Np3QV7c2D5F7CDg1orUx+zOUGc7fo3n/pL+0F3bE1hCt7uShl+J8Rvyibb8bw8v4EsZEGB0w0BHsJyvnhn2Dn9hhnK42gu3f0TfSqqlgvMpBYfasedVlHccJc66Kgxc0v72jE9vPqZjV79mp8bT6EH6aJNFz4Z+MBXE67KFUOw8HonIDQ=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:Yf1tN4wiCPN5ov7VLI3Qyl4yIFumsLL+T4PTWwcOeYH7AjbYmzHVQRrJ0Es1TuoVRDiFRGfTc2sxIaMBW9MLc6FXXJVDr5pmuMcI82YZoEpBbOWA4GxyUXSeF5BjUFxpSBEIYgXkzSn5vtI/ONzFD2bjBdAqfGmTyfOagYDgUjv4JOaZs7i2o1biCIGXSbjh1tI5DXlR2anVdIiErj5tr5gQ01UDdfSEauYMHHoe5V1+frihXQWWDDpuDlPwtmUD2mQJRAb0Wg11QowccpR5ZKiGCZtT2zOWUq1kj6EzE6PGB9+1FLhPlblL/S+hyckU6f1TeJLAJEgHDBDVqAL6rlffrlNhL50Wqkfa19PFwe9Yax1g6JQ31rxjTShBNXrAEuNdT4pxmfBJRp8b6HGW28kTWR9BryrP3wOEZQ9pjYM=;
	4:v666PA2jC8i1khPsJVJ054+SFa1eweHK8AJa3H8PgMxZ07S4sFAJ5ZciZO+mIRkvDrwKZ2ujyqh7ZkiTombkHEfXlBE2i/zxtm7ZE6AFsq8wNnwRaMpMQneyzQlJorRz7JPNZay0uM+gJYsSPecZt2aNNN2nA25WndhJyP53PaT+MEf9y8k8v49lHG6VzgUfDMMRZCjH9S7JNA16il3X2P2e0XdSR0L/TUte4v/ZqB8S7EzlnbjhDN1IA3prxfQzf5n7uyoqUfb4k3LqDo3zHg==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB2935F1376D383100A8541335ABE90@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231023)(2400048)(944501161)(10201501046)(3002001)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY4PR0101MB2935; 
X-Forefront-PRVS: 0555EC8317
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(376002)(39380400002)(39840400004)(396003)(346002)(366004)(24454002)(189003)(199004)(54906003)(31696002)(68736007)(3846002)(97736004)(52146003)(6116002)(52116002)(53936002)(6246003)(230700001)(53546011)(386003)(39060400002)(7736002)(25786009)(31686004)(2486003)(8676002)(36756003)(67846002)(23676004)(305945005)(4326008)(90366009)(26005)(83506002)(16576012)(64126003)(6666003)(478600001)(16526018)(2906002)(81156014)(6486002)(77096006)(81166006)(2950100002)(93886005)(229853002)(76176011)(66066001)(65806001)(106356001)(316002)(65956001)(86362001)(117156002)(65826007)(5660300001)(110136005)(8936002)(50466002)(47776003)(58126008)(105586002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935; H:[192.168.0.3];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzU7MjM6aEx5SmR3Zjc5NzNKVmRtSkxZUmxURktT?=
	=?utf-8?B?SXViSjY3WWc3K2dTOHRqVTYrcE5zQWx6RTQ1aVRuZ2FrbDdoT0x0N0xtQitX?=
	=?utf-8?B?NlRVS0U4c2hEbC9xc1NmNTAxMmx1Q0RhT29uTjE5M1ozM0c4TW5aUjBjV2VQ?=
	=?utf-8?B?cDFQc3BPWVVma3pNY2Q3R3hIY2RVVzlscTNuN0dVZkMrRVJOaXNUMlNNVldX?=
	=?utf-8?B?bW9IU05tY0dqK0RVdkZLRDBRY21QS2lXcUkvOTY1K2MrWkV4WkVoUzlzWTZO?=
	=?utf-8?B?REY1aWlQNDFHWVp3WERMZnIxaTArZ2M1aWZoL0lFcUJQQ0s5Nk0xZHRrdVJU?=
	=?utf-8?B?L1RnOWkzY1JlcElRbE9leU9zNTlWZVVYM2RYM2NkbVdwbTBSd0NFcFdkWCtw?=
	=?utf-8?B?ekljeFllSXpyV2d0YkhjNlFhUU5oaFVweXdOMVNhUjc0UVlpZnZoczd5MWJ0?=
	=?utf-8?B?Q0F2SXNVMXZIWEE5NVpXa0xFdHFFUkNpbVJSVU1PamprVURVTFZzWVBPa0Uw?=
	=?utf-8?B?V29ocUFaV0xyc3lMNmd4bEFQUkZGS0M5d2xESVJxYjRSQjExdjRZRU0zK1h6?=
	=?utf-8?B?Q2NKSkFxckFLdzlLK0pnSUp6eTlxMnpRY21HRkRkSGxYdGEyRlpGYnQ5VFJB?=
	=?utf-8?B?VGRBRFVFb3NWdWRyK21FbExjNkRwS2NmdldZdmNEK1oySnRrV1VZQ0UrUSty?=
	=?utf-8?B?TkExZk9GZjVhMVBic0s4ZHZDNElveFpWQTlGTk5teGNJV0ZQL2dhYWtndFhh?=
	=?utf-8?B?NkdiazlJQjE1TXdCWk5hMUs0YXBLcGpUbi9vZG1xUk85MXpVVWJXYzM4V3Ra?=
	=?utf-8?B?Tmw5ZzFIWTFtQ244Y1p5SnhKd1hTZDdJTjAxa3lMaTNGRXVBVkNJdXVCbzdk?=
	=?utf-8?B?QTNueUJBb3JpTWJwVlhob0swNWkxVjNaaml2RmkrQWxYTWVqSWVYUnlBWVMy?=
	=?utf-8?B?eHNqTFFRZGxNSldleDYzQmdsK0xvdWluMm4xY0MrSjJlY1VheWsvZE43Tll6?=
	=?utf-8?B?R3RwNDY5STgxL0tJaHFBSEdMSGZ1Tktxb1BObjNWZ29kbmpIN0JjWUp2bktZ?=
	=?utf-8?B?QXY4UGN1RW03WFFQMlJ2dndlRlUrSzNMSFNWMEx0TjdOM2tmN2NRcE5OenUv?=
	=?utf-8?B?UnNRL3BjS2dMRWc4U1lUd0VOaXJ2UHBzVkFjZjhqKy9Mc1RQWisxVE1RZGUr?=
	=?utf-8?B?ckx1YTJKM3k4TFVYTlF3UDBCRktBRW1xeC93RW1sRmFXMVZPNEFBOFdpaWkv?=
	=?utf-8?B?SERNVUdCSHppa3JMc1pOUkpBMFQ5NVpYOWJSV2Y4SXMyTXZsSzhFVEpONGR1?=
	=?utf-8?B?LzRySUVCaUk2Rnc3MHNQNXJNT3E0c0NXeTU4bGcxK1Y2YkJybFUrVS9zUjIw?=
	=?utf-8?B?eUovNmQrckVaWHJ5bGd2OEFtaERDNERHTTFpSVdUdmJ2K1VkeGR4alBBbCtH?=
	=?utf-8?B?eEhPWlJHRWRmSW1MZUw1SkgvaXVXK2J5TU5UQ1ZiTzJjTHZ5RXgwK2xrK1Fk?=
	=?utf-8?B?TUZpMXJUOGpIMDlURzB3cTZGdUxpK21KeXlvK0NpZHhDTjNPbStGcTg1Mk9s?=
	=?utf-8?B?Rm9kdm9PWkt3WEdmTEU1SjlrdUZ2RDdoZzZWb3hseFRhQ0NHcDNiem9xYzVo?=
	=?utf-8?B?cmtWcm1rU0ZGUTM2blJIbzlkODhCY2FZUmpvcUYvVis0OHphWkUvUnN5SjNQ?=
	=?utf-8?B?d09SMTRzQndERk9ZQVEzYm5MZkxCekY4eXkydjZrb2RFUFlkZUdiTk0yc1Bw?=
	=?utf-8?B?RXFBc1Y3Y281Wkt1MjQ0WXZiRU5FVE5TTHprb2xrQUdNcTlzVDlvYjNJRi9k?=
	=?utf-8?B?K2NRQWNMZ3ozTVBIL0VFL0FpbDFSd3I5YXhGMlM4Ni85My8xdERNcTlzZy9U?=
	=?utf-8?B?WFdmRXh4VFpYSFBhNVhaVHFpTmVpN1dZVDY0VWVRL1pxek9zaTMvbmdFZmk5?=
	=?utf-8?B?eGtQWW90SVozNjJUZmp6dmhxcTYwbGFEWVpJcEVyWGhzRkpzUnVzdnBWTmZL?=
	=?utf-8?B?dnhQRTNlYzE4Z3BSY1hqN0JwcU1BbnhibkFFblJFNHpIZEgwLzFRc2VsSndJ?=
	=?utf-8?Q?zKmwtw=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	6:E5KBluNWJdJ2U+LLICXnYJmaes7lZvrs8mFbg+d3Ow5ogByPLdIr0l/d4vLl/RrY5AbeBmADjK0FOpKZlBbRcvl4GUi6dN3EcQHCbq11m+LKmNwZD+69freu+GuNwD81W3+kmf77t505yIef8f++4C7/ehFHxpJ3dp0qFdXo3he+VCL4FadMGNoQ7YTwdQ02HlWYpmvGoIqXoiZQk++X6Q0cjmzLrPPrC3xMXStPnKzv3AbFeTdkt+52noVNSRYIIZv++tjmw3XfsyYVYAY48gB0e3EpqkFRcEIohWEfWxa7Q5nafClXFNzOCYLmnGrm2/3IGZO/zpFQeLCeW3BcC+RppaacltKNiIj5T6yDQ50=;
	5:aO1SNysYnl87VT3ajru7W7F8Dxzij7A5gUIb3Xu4h0DeZZms5tNOI5eFXbU2UaQHkn4di5RACAUylY5YBfA4EhC5h27MSYdWuk9yGHaw5ugZnqHQka/MlPg1jDcszcHVmKxWeapJQzdzNkqd3q0nSfyx5G33L7iAToXo67X4ar4=;
	24:xChvPwxzXsBVcUfghc2HyIMoNIoR6VWs6Mkn5lAlWZcConiNPV5dws7JWSKmLchBRh/gvidGxzaoM1QNXox4g/rJQXPPCJFvRAbGzdnHXjI=;
	7:klgGala2+afpVrQkeoiO4/xMrDj/lB4DUXXaO/VrUZ6u0Z3Sm2Z2d7ddv+B0Xiy3q4i0MGsHrBf4sqwbBmR0ua4IAVnULFWZlcTBgDdzyukpKZvy1YnTOuKqF1dahPaUZtXoyCppLLVY/xud3C/EIDhkSuTwqRAaKi2PivAuUegusGEI+SQRoYe7mtQJM84AOwFReswyhFIvJRZ18NfJrzHrHrgFvBqCrPJoxqFqUpl+ulCDtvw2NpqEeNH0+YkG
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2018 17:47:37.2622 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e8f30b-85e5-41b9-c6df-08d55dd26606
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues with meson in SDK with cross-file
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
X-List-Received-Date: Wed, 17 Jan 2018 18:02:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Paul, any opinion?

On 01/12/2018 04:35 AM, Alexander Kanavin wrote:
> On 01/11/2018 09:22 PM, Martin Kelly wrote:
>> Khem and Alexander, could you comment on which solution is preferable 
>> from an SDK standpoint? Otherwise, could you nominate someone else to 
>> do so in your place? :)
> 
> I'm not sure who is the resident SDK expert, perhaps Paul Eggleton?
> 
> Alex

