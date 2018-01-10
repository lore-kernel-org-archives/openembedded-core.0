Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 151454 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 10 Jan 2018 18:11:27 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0044.outbound.protection.outlook.com [104.47.38.44])
	by mail.openembedded.org (Postfix) with ESMTP id B9824784DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 18:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=uW1WocUqCRnfHFXCW2N6eYDV6E5bOpZH9UXmzroH0Lk=;
	b=xC7P6NPDhcZMwZNkqZnzD1hT8wvunjRkmwAq0ZLCaJaJu0NsxhIoXPYl2p6VAjzsCIEusjP6SXpirIZQSdGBew0QUwUuthzn+sk7PQ4EDdiaJMaS70C0I/Tgng5eJdvC79DbcT+YO26CiIDYP+F9h2wQkdVsy2RAYI0F3zKFUh0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [192.168.0.3] (71.35.165.30) by
	MWHPR0101MB2941.prod.exchangelabs.com (10.174.168.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.386.5; Wed, 10 Jan 2018 17:55:48 +0000
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <20180104131238.21452-1-alexander.kanavin@linux.intel.com>
	<20180104131238.21452-2-alexander.kanavin@linux.intel.com>
	<CAJTo0Lb4YRsAknNGhzc_dqGS7wJgFzxL_siyqQAGJ=9Wy7Cm+g@mail.gmail.com>
	<0ff515da-6221-7074-11c9-96b1cb8380ba@linux.intel.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <64c07649-f0df-9acc-fbf3-e8f6a52db9f1@xevo.com>
Date: Wed, 10 Jan 2018 09:55:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <0ff515da-6221-7074-11c9-96b1cb8380ba@linux.intel.com>
X-Originating-IP: [71.35.165.30]
X-ClientProxiedBy: CY4PR20CA0014.namprd20.prod.outlook.com (10.173.116.152) To
	MWHPR0101MB2941.prod.exchangelabs.com (10.174.168.141)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89575fe1-25c9-4ef1-2c94-08d5585361fd
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:MWHPR0101MB2941; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	3:7fAN8SgNolDXSPEDviFTIsrxsBq8Yjf9LqWjaBgAMOKiTPKzaTgOhx1GVSscdgzjtIghA22HenYifW9rbePhAFMrQmt7lG/jQCGgx6PdS60pGqY5Hm+ULkp/0cxunUfkwU4emLBZCZWXOqDYwmpxf0/Coz13x9lKttFJdj2iLeKas8s2InAxYaZx/9PLqLhdAVT19pYDT5k1RmvEs3bgscOW1iRnxmg1JrtOjLa67UbKC86B5V4t/smWNwJOHkpa;
	25:Y14hDn9Vk//G6aJU8I0KxfaiR0lF40J1Z/LSYiinkZYQjitygoOAHH9WEy9dzyhP+h+12Flg1FTrla5L3UQ0J27QV5ZDzext+9l1SqlIV6w37hVbSTpJaPmmNN/rYxV99oIB3cdtmQXoeNPtk7DHNIjZJ+PcMrA1IExI+iIX/64z+vaw2TYDotkn47OZz3dE36M7qCMST1bGTb0r6ej601rayoVSjiE+kD1MPpM4cLW9jUZ0oaajksacw9UTMT2PX5jr31L5oFvkfxrx35nx0L+xv3UbwYOMxkZmQ1N6Ns2Di69ExVLv6U6lTPC/06DtK70izmB3EprSWJdi8ypxvQ==;
	31:Ctmt3D7ItHS+8BK3dzhDqCDgYHDwstcHtijWYY6Q2nX7VzBmpHZbjQkawDmPlbm0H9QPvBfO8HkwUF2iynkVtsmoPjG1jkCIBzKPuXoZ1mqfBAuNpvnD3aXzt2L9IJ7CY05XjmQO1NAyH9/n0eF+aUQzYHIV+f16a1Eh0vg/l7U5CQJCH7MhTUqlyWUBIJ/DtwCTUX+rVCLieU0eSkUsqCYCsD9qlN4weK1U2nmgmZ0=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2941:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	20:48P35j71Uk7eJuJS65nO69BwQvyf+giC9jhr+muOWCxDrwvZ/t9RO7J/zvFaea5we5sXlDVZ+zu7I7sxvI9KWVm+RMDLcmEUNo39ju1xPN7Go4gQDNbLrNIrHwrVPESt1ppkQnUwmaVWCFixk+gFUX1Ie/k1JkKTJccmO/GUsGD1LMOQbSPoISLVsw+bl3UNvF+LFbljRXDiOQDhVwlPHY1FH+KPCeZCbFE4+vrK3LvqlX2bjZPafhbsU7KH+ncC/afy5ipjEq6RXBlnyTVUrYuUENdpWgZdzONL0Ix2wDuIudrsGDy2lUcBJ1LCIuykbdzTKrxeV7sHXV+llXE+zA2d79ocFZntZVtEF7Vvun0KDaovGRmvXwZA1srtqA0zNEG84Egxqt+zDxUi39Mb/6K/Hg1vV6SYVTe1kI4RT1M=;
	4:P5R1nlOkMdZSjn68jLf6qamoZzfE2NHak/q/6SGIFlFVJI8KgvsD3F7Iy4MfE1BLPvxSArgGhEYMPtT84vK1XFanFPdap3vtgL37Acl+jPwZJA96K0VgQtZP8gH9EdZ0LrOmHWJwNBfdXLGa8ldVF0LwhNIoopzTbq9E9p4SrkBCtku5yEgoCn5p6XSatSqetoER10VfwiHCX5xp+eZ5WcP/WLPtvZIfne5x0ZdWwoWjjP16/e4wTWH6WYzx9FKUacEo68bKhG7fLAglf07+qg==
X-Microsoft-Antispam-PRVS: <MWHPR0101MB294114788DC06849B90356F0AB110@MWHPR0101MB2941.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(3231023)(944501075)(6041268)(20161123564045)(20161123560045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:MWHPR0101MB2941; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:MWHPR0101MB2941; 
X-Forefront-PRVS: 0548586081
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(39850400004)(366004)(39380400002)(346002)(376002)(396003)(24454002)(199004)(189003)(31686004)(16526018)(47776003)(117156002)(16576012)(58126008)(316002)(81166006)(50466002)(65956001)(81156014)(110136005)(8936002)(66066001)(83506002)(65806001)(93886005)(64126003)(68736007)(36756003)(25786009)(478600001)(86362001)(6246003)(6486002)(90366009)(7736002)(105586002)(106356001)(305945005)(77096006)(386003)(52116002)(23676004)(5660300001)(53936002)(2906002)(4326008)(2950100002)(6116002)(31696002)(3846002)(65826007)(6666003)(2870700001)(52146003)(229853002)(97736004)(2486003)(53546011)(67846002)(8676002)(76176011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2941; H:[192.168.0.3];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDE7MjM6M3BPemthT3RsTDBaQ1p2Vkx3b2tUeWlz?=
	=?utf-8?B?VldxelFLV2M1NGRIb0ljMDJ5WmRlSDhQamJPOHZPd0wrWWlzcWZoazZ0ZWNi?=
	=?utf-8?B?bU9CYUNVVUpEa091UHlmVDlMUDE0V0V5VUJycDJUYURHVTlVeEdsakloYXBM?=
	=?utf-8?B?Y0FNRloreTIrbEVQbDhKTVBSeXIxV3Nienh4Q1pvSUFnVnVHdHhqamxQR1ZT?=
	=?utf-8?B?MndQektEM1NtajVrcjh2dTFSTFd4L01iMFltVVVSRi9jQzFyZE1YSFAzRU8z?=
	=?utf-8?B?ZXR4WTk5dmF5SnZ5Y1RvVmJrbDcyMGVNS2lDcXJ1OWlSTzhNWFBNM29KbWRx?=
	=?utf-8?B?ZlFCWTRheTZzaG1WcXJlWVRNSGJpOGRNSDlYelU0MEJ0MU5mWGlCRE1hWVBt?=
	=?utf-8?B?QXpHNEVjVS9zRzdRVm1jZXJLOURWbWhyMGUvZks5RlNFeGRBRy9DSGRlbGJJ?=
	=?utf-8?B?b25KdkVpTjdtVjdRaGRHbmRqaDRFR29Ddzc5dHVtWjQrTk9GMkZDQm9Ud3FN?=
	=?utf-8?B?dEVVa0QwR05KZUx4S0FrRXRPZnhpR0NIWFRlSWVwNk05TkNGQXRrVkIzS2xi?=
	=?utf-8?B?d28wRWdQMnY3U2plcGVpa0VDQXc1d2NiUFljclV3dVhVV2VhRHpWZUtXTnky?=
	=?utf-8?B?Z0dDMjJQRkVJSkRJb3lxYWJNc1NXcjM0RU13WXhrU3p1c295RHRKMThodjkw?=
	=?utf-8?B?VHM1VHI5dy9XekhDcHRuQlREWC9ENFpLVzBMQWZyR0ZnMmtRdUZTRkt5TFEv?=
	=?utf-8?B?N1ZFZkovMzU3ejZsMUhnSlpQMGVDYUtuaTJPeC9RUHJzbzkyNkwxb2FlVm9i?=
	=?utf-8?B?TGlIS21RMlIyVjhEM0F0QWhEQTB5TDZoWld2cmtDeVA5VFMyWnJwRkRPTG9X?=
	=?utf-8?B?WkhGaUpNSzBPQjBLRUt2Y21tNXhDamg3dkY5ZnNDSDJyYVhtMmpTYzJHcVNV?=
	=?utf-8?B?MEpaNlZ6bHFjcGZCTXQ5MktKckxBdE1wc1hHcjVJU2htV2dmdGtsV3IzSnho?=
	=?utf-8?B?RkNpaDlhUWRkTFpDdXZseWlmeGN6UFVkNlp5WEVGMEI1ZGY2a2gwb1k5RCtP?=
	=?utf-8?B?dnZkbmYwQW5xY21NNFl6bzErL0lUd2RtTVlnYnhzMExJNGQ2N0V1MDFvUTN3?=
	=?utf-8?B?T2Y4WXYzdVdXbCtHdFRtTlNOaEc1QTFrelR1bWM0T0l2aUNjRStnQ1VLWnBh?=
	=?utf-8?B?T2xETzBqUmxMOTRMTzladDlUQS9RWGs4Q0FIamtCNGNyWjZJcFRQeG9iRTRv?=
	=?utf-8?B?Y1J2S3BZY0xVZGhDeHdkeGFQMHlhMlY4b3hINGs3L1hlZlVkU3drNEpqbmxz?=
	=?utf-8?B?OXpJaTk0UlNXNHljeFFyZEVLU0dub0ZtUHlWTGpyRDgvOFdTQUVmNndia0N6?=
	=?utf-8?B?bmhwRCtiNnNRd283TTJ1K2RHZy9nK3g5VDJHNDV6c0VCZW5URHE5alBjazdF?=
	=?utf-8?B?MnlrcUxBei9Tc2hzZTh2a2hEZHJUeUVzelpENWtwaVJDcHQwMEtvaEVUMlNT?=
	=?utf-8?B?YUhtR21zc2lMYnV0RFVjWXBja3JrckRHSHZsM3lqaURmd2szY3l4c1R3em1n?=
	=?utf-8?B?THRqbm02cmN0ZE0zQTE2NHBrTHM3blgvSVdoVFNWcnNkSEFxWktUSUZIbCtn?=
	=?utf-8?B?S0dPV3MvUGV0U240RTlQQTM2Snc2YlFYaHlYUkVYTklocGlqNWJFZDM3Umlh?=
	=?utf-8?B?SHYyMkxyenhsL1VnWG43QUJLcnNVZnZUZGVtK2EyaVVsaXFtaktyU3NLV0JM?=
	=?utf-8?B?VkVTWHY4OEhDMEVLOWwrQ3dNREN2WGZEN2RwT2tMU1EydHp3Lyttc1NPZFc3?=
	=?utf-8?B?and5OVZhOWtIdVhQRW05MUIzMFlyUkNoQXJPZ2RZRE1uWkZaSlZucnVVWDIr?=
	=?utf-8?B?dFpZeGRkc3lCTXdyUk84YXg1ZitRb2NTSGRiSzNEN3VsN2cxbmRBVjJlNGVU?=
	=?utf-8?Q?ZpWQnKD4iCokTXyeiNuc+XALiM8/EW8Q=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	6:WEBnpjkMr2akUvG1fe4urE4ZUzLFeBV/ofIPft9GSM36rMSsYyFH+CwD+VZl8g74LYKohytsNq1TsGtPPbVLN2lEKxjkA4dtyTSBW23KQmrni9N99gdD65+3+b6AtgQzFkFClqe9ZcDj6kMSPPvUAhba5z5ZaskTUO0WNBQoTc0yPIy+0xT1fpqUtK4o2/pJ8ibQGEc52CSpMFdnJZT02xi8VqGvQvJpc2nrwaqE8C8kJJ9gwXUXxNhrg5xsElGTyybThCRdIuUgz/JCf7GJiEBa3KZ6+N2KS5VMm2TsgvL1IwwquaeDCe6iyE+R/CmSLDxkT4xoA1X5Hx07Kll2Ni0N+JEiiyObI+wcLGNTdbg=;
	5:Q1pbhe2E/k9VtgfX8ZZaoZkOiSelq47mba5lTqcUrJBUZsoVWRJxd5WOY1QutV9PLOHX/buSNjLIYwcselrvxZEjQpTARh9sRo1albTXppQihja+FPdaonLMPYgXK8G2aQ0HtFA8caWowA9apyGKKnUjUgY6XQbLUiWNwkXEuAk=;
	24:egsJtcis2AryyvTwSat1Aol3zhgvPlbrOpQz626FapSsIhYRfr6rhlK+bVGJLOJAy9/Rpc55yiPP8nItsAayvJYYAiDQjnyK/vCGEMAUduc=;
	7:zNgrkokmS0fkcrAJuISTPXuS5+kR3hXxBEp6QtooGRZO1zefMrZN3FV1z8uu3Xzsm9VQCR5bZtmPMjJ+Zsnq7ijGcroy64EyzGCu/JEbqr+d5fYXdMr/VOk2qIAOQ6SLpr0PNnitqgmf0HFQWfBmn7Et7UYtiLLvPqsQIP+odY0A0mHJT3415ABwePJKMwf7IT3wOAUeAXIKCiBTO6JNS7HvYf6XXqjCnQHmU9rAxk+WnU3XWnXiU2c9gijT7+6u
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2018 17:55:48.9492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89575fe1-25c9-4ef1-2c94-08d5585361fd
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2941
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] gnomebase-meson.bbclass: add a meson-specific version
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
X-List-Received-Date: Wed, 10 Jan 2018 18:11:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01/05/2018 06:57 AM, Alexander Kanavin wrote:
> On 01/05/2018 01:47 PM, Burton, Ross wrote:
>> Do we even need gnomebase-meson with this?  I can see a future where 
>> GNOME is entirely Meson and then we could just switch the default 
>> GNOMEBASEBUILDCLASS from autotools to meson.
>>
>> (prior art being the tarball compression type)
> 
> 
> I'm fine with this. Just so everyone else knows: RP has actually made 
> the change already, and merged everything to master, so the YP supports 
> meson as a first class citizen now.
> 
> Alex

Technically I'd call it a 0.9-class citizen, as the SDK doesn't work yet 
:), but still a whole lot better than 0.

