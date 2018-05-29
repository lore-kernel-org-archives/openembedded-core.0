Return-Path: <hannu.lounento@vaisala.com>
X-Greylist: delayed 32488 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 May 2018 17:14:23 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01on0059.outbound.protection.outlook.com [104.47.1.59])
	by mail.openembedded.org (Postfix) with ESMTP id 85793748CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 17:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=RmKTd+rQAJKMMlvMCWOm+YiSty2uJ3I495BAhgz98hY=;
	b=knwPGIIwLbkoWeL6t6EX9v1v1wiQOkhW4sUNvsSxkqDnzv7lSNaXvFWDo+Ky4zIx/4XVLkTJnskvB4L5I0ddWH/gFZC0z5YQSvlWTc2f3pqj6zEqH+coQEEp0Io5w3otaXN6WbghqjRMaP7nSaZX53gtp7k63jbaRo88UJBvAR4=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=hannu.lounento@vaisala.com; 
Received: from localhost.localdomain (193.143.230.131) by
	VI1PR0602MB3501.eurprd06.prod.outlook.com (2603:10a6:803:10::28) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.797.11;
	Tue, 29 May 2018 04:40:34 +0000
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	openembedded-core@lists.openembedded.org
References: <20180525123739.73219-1-niko.mauno@vaisala.com>
	<CABcZANnPjLCrjSksPCDkN0it1jwBS6_MtJjOkCT=NG=Wf-zR6A@mail.gmail.com>
	<0980e127-6744-378f-479a-e841f0a0d20e@vaisala.com>
	<95c10f0a911c861e5bd87275f1d55a1b8e73c7af.camel@andred.net>
From: Hannu Lounento <hannu.lounento@vaisala.com>
Message-ID: <ba2445ee-c119-f3b4-8bc4-2c1bfcad0fa7@vaisala.com>
Date: Tue, 29 May 2018 07:40:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <95c10f0a911c861e5bd87275f1d55a1b8e73c7af.camel@andred.net>
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: AM6PR0102CA0030.eurprd01.prod.exchangelabs.com
	(2603:10a6:209:14::43) To VI1PR0602MB3501.eurprd06.prod.outlook.com
	(2603:10a6:803:10::28)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR0602MB3501; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0602MB3501;
	3:FSAJjxOTDN3LayvZvt0Oa45/9KgCBA0g0dqKKTt9zaES4L12rnSTlGmrh4rvFz7XviZslJexX5WkiBZlZYf1TQdVUqvnnyvlKd0j/LWnWQW/EFqVxsFWUJmI/UWm2MQYapm9QtiFOr41YNeqxJ48+jH6Mi577LdyM+ZhCYtYVA9cPenQ9E1eHJ4JFaUMKYMuKD4q4RgnVu34gmolFXxSgyEHsrrmuihyoR9/w/Xwzoc116B16r+pe+bICSReahvL;
	25:TTYUvtOiJSmwtloVjP+9qR+KKsuzHze7aYeRlgDlWbnc+A16BdaPQxR+upjHD0eDHXP2Q6mCCpYY6Wd2b0NXQjN+IIWNF+IZh/lYX9dmFDtkT1ytQDXO63zeIfA1S09iOYRXw8MrWGEvD2aAdGwGxqfBGqiIMG7vA/mFBA2dosdT1hImZX4M22uaO4QXC9bn3dFAmlZHGzgI2sOLZPtco7KXPR9YStTFkuldg+5dgDTYZf6Dzo9tr2i6geZIKt7Vwm7n8/v28bZzC3Mn+WkBzaoOkluGeBzoMMa1ZQxinLo4THuZK8o/2pbIsS73pAKVyfSn2kdg6R+OnESPyYcr5w==;
	31:BpKvMwpv9lhl1/7q0sR1Q5k7c7BgikP/OR4+O9ER7935Y6nGdr9UTKxQXC8rTRikZdEseO5Ye3/raCG+zNET63rk4+s9dpnTxJz9jfZO1Z2wjXQeN/14cmxuYScSu7Uya8oaAe9RvWLYnlWDMTelF3LjSs40WIx/ofcOAwTzqtm2sBPIwbbaLMQaIOp641eoEnWQBi4ZzPN9ujCsjFt45JCVAX4um8NGeHVA3qkYxZw=
X-MS-TrafficTypeDiagnostic: VI1PR0602MB3501:
X-Tenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0602MB3501;
	20:CwfNscKDL8IamIWxgvwc+TwMPcmikN3kkc/HoqK+NuQWaTaYrC50GbXLZ2iYHaxTXbpcN6lwBr+2FRIkhJ7+F8mSuOEEs8w1B6U4CUjvPSS82Dbw0mbHi8douk2OEzDnFWyTT32EqNEuYXGyQnu+VfsZc+at6W7/Xiaac+sRfYk=;
	4:lgKGBhf5ex8N6BUndNTM1T9pqJGhDNrEVtvYGi9HPg+UQ0oYLZPnt78acyyRb5VJyqGIgjosGeypF4yLRI8p97xi+LderMVKBEtQuY0Egy1evwoSHn5dOvCGw0xE4wZPaTaT+XjdhJ3+8qi+Edha2mrGirWAIW7SSFkh9BmDJkBkDHHduqLtQChqi0K4cOshePh4lcWNyj0GhZUJpQbJHu4qEaw/kHgjigNnKjutTSrDZrvYXJzLyruNjfD1OrdWl3VSxHTltsifXsdoRc34WA==
X-Microsoft-Antispam-PRVS: <VI1PR0602MB35013AD8412F4C4A745F5C8C8E6D0@VI1PR0602MB3501.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(6072148)(201708071742011)(7699016);
	SRVR:VI1PR0602MB3501; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0602MB3501; 
X-Forefront-PRVS: 0687389FB0
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6069001)(346002)(39380400002)(376002)(396003)(366004)(39850400004)(199004)(189003)(65806001)(47776003)(316002)(106356001)(65956001)(65826007)(66066001)(2486003)(23676004)(52146003)(5660300001)(58126008)(52116002)(3846002)(67846002)(44832011)(6116002)(76176011)(97736004)(86362001)(186003)(7736002)(16526019)(305945005)(36756003)(31696002)(31686004)(956004)(6486002)(478600001)(8936002)(486006)(2870700001)(81156014)(26005)(476003)(8676002)(81166006)(6666003)(446003)(50466002)(53936002)(229853002)(93886005)(105586002)(2616005)(6246003)(64126003)(68736007)(11346002)(2906002)(25786009)(6506007)(386003)(6512007)(53546011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0602MB3501;
	H:localhost.localdomain; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjA2MDJNQjM1MDE7MjM6WmR5cVd1TThVZVVBaENENTJmMGdaclZy?=
	=?utf-8?B?SWF1S0hpbmlPRnlZczlkNjE1QmlxMWg0OG5KcVFjQVAwblBxcWphNDhXVm9a?=
	=?utf-8?B?dDZxbWdUd2NneDlTYTJ4R1NycXdjb0trZ3ZaUHZEZEo1R3BIN3p4cWp0dStC?=
	=?utf-8?B?ZUhOYmlUTTFxMUV5VjhLaVN0aThwcWRRVit1NXhndXJVbythNXZIcGp5bWJn?=
	=?utf-8?B?cmh3aSsxVnZ6MTlySHl0Wk5VVmt0U0hTT3RUV2ZuQTBMYm1qYlJrbG51dEJr?=
	=?utf-8?B?c25RaWd2M04zRmJBY0xIVVZDM1hMaCt4SzJpYllnTFlPT2Z6SGJzcUhyRmJq?=
	=?utf-8?B?N0VxcmVGa3ZoaWo3T0JXTFFtYXZIOVNpQ1pZS3JQR0VORkJtVlhnWDVzOVFm?=
	=?utf-8?B?dE9Wek1rOC93UjdrWERuT2VFZlZydTJOMDg1WWtkTVdxQUREcjY2SEpSNlVn?=
	=?utf-8?B?ZHhRNVJHT21OVHRlM2ZUa1NadFJYRzhFZmlaeElnT0JINEpkbXhvbTRvL25P?=
	=?utf-8?B?TzB2cDZ4R3VISkEyQ3I2Z0I2Y1M5QVZ0bHkvVXVoM1c1YitqRGllMjdGYVVN?=
	=?utf-8?B?NGNwS29tb0pXMDhaZmk2USt4SHRxQTRLcHBrNTVTbEpLb2JpazNJdVZaU3N3?=
	=?utf-8?B?ajhUbHFDZ3ZrMDlEc2xUWEtnbkJocTUvVlIyWlRNTGFjWkxaZS83NTRqejJi?=
	=?utf-8?B?ZnBidkQvdi9mcUJUU3l2NjFHWHRNN2ZRaUU4YnJ3UldKdjczMXM3Z0RxbnlH?=
	=?utf-8?B?K3dxUWdtaS9qaGdtb3krcDFkMmVuVS9PWlUrdXFHbWNkd1lOVmYxYVBqbFBa?=
	=?utf-8?B?R2JuVmx1dzRkbnVKbTErYVRxWXluZlhTRjUwWjVwQVFjbkxsVmRNT0FLRy9V?=
	=?utf-8?B?KzdwN0l5L0ExWERUNThyc3NQdHZUYjVzYkc5MGdpbVRZNTIrYTZyWmlSN1Bs?=
	=?utf-8?B?YngrK3VqSXdXVDNEUEh6Z1N0c3gxczVaTzBuWHRreHAxcnp1NzRZNlFOWDlr?=
	=?utf-8?B?U0dnQXZMdmpSZFIxY1UxS1RjTUNRV3dkdm5IYUl5bkdoQUYwaTdsb2g1VmlS?=
	=?utf-8?B?eFVwZ1JvdG9wd2l2QkovOWt2K1VWOUdGWjRhak44TkQ0WE9mbzZYMEFEUWFU?=
	=?utf-8?B?Q0JUd3ZabTFGdjNzbWJUcDFHRjIvL2pKR2xTK2pQempqa2hGdlFJYzRIdGJJ?=
	=?utf-8?B?bjQ4ZW0vZWt2cWVZMzU1M3pQKzRseWxjam13clNTYm1jSzVFODVScFdMVkho?=
	=?utf-8?B?QVVjVVkxcnBSZXMvQ21DbkJ0ZlE5QmlRSnJRWjhUQTFoVEdaTXJIdVBHMHJB?=
	=?utf-8?B?b3dOUnJ3U0syZkVObFJHU1E0RVZtUzBqTGFvY2Z6MmlpNHcwb24vdXRHaFRK?=
	=?utf-8?B?RVA2bUYzUzBFa2FDVnhXQzBWdXJ0aTEvVG9YQTREOFR6Z3l3K0VTWmZJVUhG?=
	=?utf-8?B?WkRpUTJjcVRINXBaRDQ2L0dwbXFtdktmRFNmS2FTZi8xWkZtZ3c1SzVXNERM?=
	=?utf-8?B?a0VzVFlyRG5BY1NTSWYwaE9qcUttTkFzQThjSFg5RzMxUjlqL04xTE5vMktZ?=
	=?utf-8?B?NXFxTjVKYmRJTkNDMTJOQUlPaE81bUhQY005NGo1emJkT1dQZVBSbzVzcmlr?=
	=?utf-8?B?TFp3N3ltaFRWQmZBenVlVFNlRzIxUHBnRUxnL1VzeFN0RDRYak5CWklWNzJN?=
	=?utf-8?B?eGVCWkQwZjdUdVNhU2cwaXIvREpJUXVOVFR5ZmhwV1g1VzcrQTlGUmxzOUM2?=
	=?utf-8?B?enRxeSt6UkxiRzVkeDFxbkxnbDlzZlZ5emE4RzdVek1rdGFKU0ZoYW5VTDNF?=
	=?utf-8?B?YVNHcWhla2N1eDdLU1VrS040Rkk5QXprL09YNXk4TjdIR0dWTW52N215R0Jq?=
	=?utf-8?B?dC9uRDRaNm1uU1Fhbk9nRkdNaUZxZjY2KzdIbXdlSldLaVNSRWh2M0MyQTht?=
	=?utf-8?Q?PfiT62aOtvEMnEsCpNWYc4gc4sNt4uwE=3D?=
X-Microsoft-Antispam-Message-Info: JAxYJU5s7aDTFxl2KH4bBkQFlJU71IRiY6VIIeZY+jiUBEIOWDF7AOfWOIB8dF4LzyiVE3LO1hBbgnFcgC5uoXwr9mQ+9KJnKsPDyZH99h6gz7mdTo9lneK78qgVUQRB61ECfwY3jApD6WWnORIzF4d/ZyGuyD7MyGlnpZzw6PTWpNekEKA5pWem5qFtuE2v
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0602MB3501;
	6:6NW4tJBGi6vxNotf6KikmPo43IPAcWwv0J+zocUzMHHU1qfTXvTAcmdfusoxqt/n8lbYZKs96FeDbMFsbtMfqL3L+zPZTtdEpDbH1rVoLAwN8I02uonYE4385dnrX25D8d8kXI5H8/0WFOp8SYoKU3QpMYC5b0NTprHx49bKzOSfthWzfUbj9DcaaTV4pEigbcvlqRk6oz2f3KCiCFig8jBZg2+c5GjXDEsSFoZSnKkHVBQ4sM251nDCjN4oK9pT9uAOdcPl0fP7+sbhKoN1zU31laMZkwkN1GtRT5mhdDSOdpD1Ut0enVDiSMvxrqLUsT6VDXeL0dSDyOsWh9W/VKcyiQxQeplMgWJy3h4KZjRbvZUxU2sYXzn/gBDADNRY8Vuj8nsByXT+sCT8K2WjDTfwdYwgiHjMH+epHhl0LZBZaFINlyNony8vTerqCXejLbGpbaTQiJ7SrN6mZRWP8w==;
	5:qZlFWCyUtd7PGjB35ANmzQflmQ2pYjfVOIWX8KWzgGcITLRVzCnzvxXvt8gMYFXqMFOjUlpGBob5s9Mg0+pgN44IzzdANYnHYoqkvYkPUaQMnBCzn8v81gW0Zu0ZTzBlQM2psouOB9uSa3yjG1S13sqzVU044l5oZMxMfMmcA3k=;
	24:sFPzv5IZwXgcQ9y331RqFzyC3gLe4whMLgfPPMEj7/Sx+7Kdk5B7QMx3qKb8fyfVuhrbbqxdkz3jUcz4uGZlswCMJmPcyOAup9ADzUGSHx8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0602MB3501;
	7:gB6xvsbDDLzslkIgTc2csO61m6AkNzlJJiF0TIP2ErrWk783C5KdchuW/Ktn3X8NZVxa7yX10st+xj7O0eoiKoN+e69otq3c1HTeP62Rk7TtDooEmmWGKx0PcM7p6yELuKQQ34Lotg+teHNpkiNm1NpURV0yWK9oSk7G/Xe4qw3oJ2cWveVXMWudVMbYhV4gizMbIMxnhwOrxt4NlUuh9spfvihBm+Z/zJWoGjOqB8tN7NcmMkLKwSr9ErtndtP/
X-MS-Office365-Filtering-Correlation-Id: 22bc13ae-edf1-49ab-6d0a-08d5c51e5113
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2018 04:40:34.0367 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bc13ae-edf1-49ab-6d0a-08d5c51e5113
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0602MB3501
Subject: Re: dealing with CMake ExternalProject
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
X-List-Received-Date: Tue, 29 May 2018 17:14:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28/05/18 15:21, André Draszik wrote:
> You can simply instruct ExternalProject to refer to an existing (local)
> directory, instead of a remote git repository.  Either by patching it in
> your parent project's recipe, or trying to get upstream to integrate such a
> change:
> 
> Something along the lines of this works fine for me here:

This looks like a reasonable change to the upstream project; we'll try it.

Thanks,
-- 
Hannu Lounento
hannu.lounento@vaisala.com

