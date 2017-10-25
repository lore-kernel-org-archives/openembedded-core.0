Return-Path: <haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id B1CA9780BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 00:07:07 +0000 (UTC)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v9PNkLkq009947; Wed, 25 Oct 2017 18:47:51 -0500
Received: from nam02-bl2-obe.outbound.protection.outlook.com
	(mail-bl2nam02lp0084.outbound.protection.outlook.com [207.46.163.84])
	by mx0b-00010702.pphosted.com with ESMTP id 2dtg7wmh0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 25 Oct 2017 18:47:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=+CoPeXt4hbH2s2l05QCnyiXKL/BN5i8ymbKUOsxzXt8=;
	b=PYNZnj30y8KqABnc1rohdzJGmwyJIag6GWqI2JTUKRMbh0UjLqZHIDWP3xSX/bi+FobQ/fdQ9V3oqutPVOUpk46dcr6pVzo0lb+PtptmIdsvuaA6kphDAsnlNFRqSzCd4aEJoA70LyLpo0GiJGWFNxwNtIcFTom1esPbvPOT8i0=
Received: from harisdt.amer.corp.natinst.com (130.164.62.171) by
	BN6PR04MB0693.namprd04.prod.outlook.com (10.172.198.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.156.4; Wed, 25 Oct 2017 23:47:48 +0000
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
References: <1500479806.27323.202.camel@intel.com>
	<20171019191901.13245-1-haris.okanovic@ni.com>
	<1508794739.4587.162.camel@linux.intel.com>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <a1fc888b-92ef-6687-cf6e-0465abc729e2@ni.com>
Date: Wed, 25 Oct 2017 18:47:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1508794739.4587.162.camel@linux.intel.com>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: CY4PR04CA0070.namprd04.prod.outlook.com (10.171.243.163) To
	BN6PR04MB0693.namprd04.prod.outlook.com (10.172.198.14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2d04e5a-3c78-44bd-a0a7-08d51c02ccae
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627075)(201703031133081)(201702281549075)(2017052603199);
	SRVR:BN6PR04MB0693; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0693;
	3:ihMjCcLul9qYkVY7dz7vDuc2+2PdHQ73jdJ0J375StCS94zJa6KaU/PeTwl7lgECN9oFpzhGK7SRc73sWWQ1bF8Qd89pl1I8YYKy6w78n01oosfvqCJy/f1p+UkZPBvFQQoNeX28PLmSqcXMqIPa+ChJChwaV8wHh2embpEZnCyOhZQlaVbliANSBwcT0hb4HT70yw/RTyr/H7pJ1RukGPXG5oYKnHgg4ce2AqeD0sCaUX+PTpEdY/Lbync0p+Xj;
	25:bnyeZMd9cg6uuCNyG/s7PvCBfEUEh/FvwWro1Njt8YReh/9raSLoKK3zBdAr/3JSP+Jgl95h0B6uSgJ38KgZF+7/TTOHgF7hkwhVxa7TTRop9HN7gpC1sOfkAqqyv0enzdwkvteQHjrw4p/o+tylhyOU7APpuAwZPf5ImOqahWb911kAVNyRrH+kSj8DVKKMIdTi/2k8R2ikMtS0cQtOmLfhG8qm5sjHobMBLK7ffp0UV4NUANtAw2RAf4bqet3PbUjI7Y8jyUNoexPKAXYC8UfBtryCaAuRXxPoiOzAbGaDLTgR1/vxa9sasJHwNXbk+sjkI/apbMjjMw1sINNmHV09sfgUkKCKDkjLTXrCgPc=;
	31:Kml4Uh3ErL/R0IWMnKJOT2z1uYGFib8rURuk31r+7Xjh7tHPK6uOJ9P5w9Se0KO6+3M+mBUYYCU1UsHXhXnbwDc3SqOSQjT1ECXkwRnstnqQv9XRjzU/ABP1M+LC6gMvr3Dsvv//MM/W2TfbfsKZCpLocRoDRBB0nepnxJaNaBG8PZkQyUAwFvzVJ4beJF+0eNkVQjGAd61OgR6AcVGGwIo2prQDAr2eByE1K2HUhV0=
X-MS-TrafficTypeDiagnostic: BN6PR04MB0693:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0693;
	20:KegGUNydotBt/jzbA9nFMuouX8Ub2BfJ1cYLMsR+aeY9sA7fRrlHFojBozwiOFBDueqRor9UJqBM46Q/YwrGdP9BZdWaFueyd0T59SDUnmP87kChSM5evzqKfaXFTx9KEttlqMBlJdxBFFHtREMKKOJyjzXwEzbD47RWy9jdNCwAaZZbWocyPTGdn3Ouh0M8kNrAK7neIGJoq5/n1NYhjeYgn89kHnr1+oGEFLXY41cBBllLiIj+FueX/79k7CQXX3CKNEWF5OBYroadpTNlONu6mkGMTq8lbPdzJTZg6gE5yGMwYXbeqb+hpQSO2frSlwND3JveCWJj+wuGb77hd5YY4RXW+F+fJ5eo8VVWy0vio3k2cyzw9IbmU2/DKCgo2jd6DWdXgJwQ5MeglZk/Egf+aEQbA3KT1MQmLp/y07x8Jg8jnO48zH51ckFPJt1Pp2bZ5zUlfBICVEwGpB8NVYIDjHdUWvFhyiZE1u7rTvgfWZNx1MWZjcalq5rAL/Rb4FZGJuPiu4dfozHA6VwacxezpOr7UdnbPhXFmd0YrZzLakoh3oPkRG29opjKtZTegc0gP5IVoqUibsSd0dHL21SvoEY8m7Ry+vFAltBHN5E=
X-Exchange-Antispam-Report-Test: UriScan:(10436049006162)(788757137089)(145744241990776); 
X-Microsoft-Antispam-PRVS: <BN6PR04MB069360F2E85E7C46B58C94D1E5440@BN6PR04MB0693.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(3231020)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123555025)(20161123564025)(20161123562025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR04MB0693; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR04MB0693; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0693;
	4:j3XOH+GrqCk6YrSJHglQho6YhdT9T9Ac7IojaAdPyNNxNZmxL0Z6Ivz3vIEoe7BnjO+ySLrAsaBZMMjoLiVgKWhK3GOh99apehr+jFj0LAAdiqIkfuVnA8q8pWxYAaMBSvo+GYc3buDY5t67jbCbQ+flrQjnhkPZ8hrs1jAaeR6MEdquFxJV9QcVZIMQPG4JW+F64JimkmvcX7xiZKZKnGem7eikSoYkoHS2tTSNgAsmlF9U6MagXil00IbIz5SstI5icPYtKHDd7o8f9YO3SHPe8n9p+ykJCsCEdmZdUGBS/+0D0c3TshcRBIV1ye8pHx1XqibV9N70SpEH+riUkP05d0rFgJS6mWg1so4OCrc=
X-Forefront-PRVS: 0471B73328
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(346002)(376002)(24454002)(189002)(377424004)(199003)(229853002)(105586002)(305945005)(4001150100001)(16526018)(6116002)(3846002)(189998001)(64126003)(23676002)(230700001)(47776003)(8676002)(966005)(81166006)(65956001)(25786009)(97736004)(65806001)(6506006)(7736002)(50466002)(81156014)(66066001)(4326008)(8936002)(6486002)(68736007)(53546010)(6246003)(5660300001)(6306002)(36756003)(53936002)(101416001)(76176999)(575784001)(478600001)(316002)(31686004)(54356999)(50986999)(6512007)(58126008)(33646002)(2950100002)(106356001)(6666003)(2906002)(83506002)(31696002)(86362001)(65826007)(21314002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR04MB0693;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjA0TUIwNjkzOzIzOnlsNmxueXlUWmNpNXQ5SGd1aTNlanRUZTdY?=
	=?utf-8?B?Y2p1N3JuSGtUS1VvU1R0cWVzYnU4MkhLaGxMTTM3M2dvV3lSdFZtbTFZSVll?=
	=?utf-8?B?dlNMOElrRVE1M0hCVC9yUmd1VldpaVdTOTNLUjhzR0QvbWFyckpEVzVLLzl4?=
	=?utf-8?B?Q1ZtYUw3WndhS283VDBXRWJxZ0lHSHdBTTlmK0pnbUtMQ1dLc3lrcjk0SmFk?=
	=?utf-8?B?RnkwTjUwTW4rWUdENzhFWU84aElxMG9WZnpxWnNIMHRiY1JRT3JPSENQSm92?=
	=?utf-8?B?RDl5YSttZzdHbDhRcnVRUUs4MDRmRENqcWNYMGVFVjY4VXpUelhsNUV6WUxP?=
	=?utf-8?B?UHVkQmxIVGNrb29pbHE2Q1FqU0Y4bTNueWVoeE1hTEx3bnBheHkyUmdTL3Z0?=
	=?utf-8?B?cmsvak0yakFmbGpQeUhpa2xXOHl0RHo4NjhrLzVjbGd0MlhIOFVVVXJWaTU1?=
	=?utf-8?B?V2dVUkVuaU9zNHdROHdnTTVYa1VpREI5VDc0U3J1eTBMLzRLSVpFWU9iMjBI?=
	=?utf-8?B?UnlFd1U2dndjUWRNSUhvS2RHTTIzUk02SlppaE41RGtLTjdxZmtpOFJQdzda?=
	=?utf-8?B?TFA5dFl1VURPL0ZKSlEzOW9wdmwzZ2xWeXpLd3l5aGptMEdRa2pIdHlXK0ZH?=
	=?utf-8?B?Tzd2b1A5R0w5bE4wdXBWOTZQRFpMeUVsdFBnRFFxdkovOXRDdHRFTmZFUGMw?=
	=?utf-8?B?VDVQWkpSanRvTlVkOWtXc1UvS1NXVDdDKzhlUThaUE1QdnRZNjdGZzBDaDhV?=
	=?utf-8?B?M3NQK3N3SCtaT3hzU2RKd1p6UG1nT0FRUFd2N2pFOW9PdmJuekJMNjhpOEow?=
	=?utf-8?B?NUo2T0pINlFkekcwRG9CUlVrQnJzUmVVYk1wRjk1Yy9SY2xHZkR1bklUUURQ?=
	=?utf-8?B?QUVGY0NCcloxOW4zbUhDOEwrTHZmYkMyUW5mVEhzVHhSSnhiQ3BpTGxyZkpR?=
	=?utf-8?B?ZlpJcmtaM0t6ajRtQ1IyT3VtTTFONXRKMEF4aUZvOW56MUYxemtDOHZrY1RJ?=
	=?utf-8?B?eThiNjJyVTNyRytkUXhQTlVQYis1UzI2NFRQM2ptOEYzZ2pmSFdaTy9FalBk?=
	=?utf-8?B?eEFEa1lYMDQvTW1wTy9TVzdzeFpYRndIbkVySE9Bb2h1aW02cGtEWnluOFRF?=
	=?utf-8?B?bk1ERUh0SDdXR0RpR0k0a0lCNk5BWFJtUHpLQlgwaG1wN0d4NWdIVWhzc3c5?=
	=?utf-8?B?UXdPbjk2QjdEWFZmUW0vcUdLTmEwTmRFYUM0Zm9uZFN3UEVEcjNDRmZkbEFH?=
	=?utf-8?B?RlR6N256THpEVzIrL1BXQllKa0Erb1ZQUmRVclMrKzNYbkYzTE5WbFpYSEVs?=
	=?utf-8?B?SEU5ZzBpRzhaQ1pHVEFSOWpWRzBmOGh4eTBEQ2lNYXVJNFJTVFNHYkhLMlJi?=
	=?utf-8?B?S1owb2NBOE5tMjVabDNzejZSU20zb1FpODhzc2djN0RpdVgrTjRJMmFBakth?=
	=?utf-8?B?eWI2dzNLS2czdUxsanJobDNFdkN6eUhSaHQxTjFBY3d5QWNOaXZnVitYbUNH?=
	=?utf-8?B?RDh0cEFNcmNQd2FLNHRnb0MwdlNDZ3RBK3c0azdjRE9ZaFU0V09RdFdDdEgz?=
	=?utf-8?B?UTBEbHgvNEpJQ1A2eC9iSENKdE1nNndrNFVBeXhvaTZid3gyV1N2ZDVWeU5G?=
	=?utf-8?B?a0s2QWVzZ0pyVm5EVEJSaTN5Zm4vd0QyUmNIREhJZVJPLzFLQ2JHUHo3WnIr?=
	=?utf-8?B?MnlIbzB2cFhFVXdlV3hhVTNveitvSVRyWjJZOVh2SVNzQk5XT1p2WldUOFBl?=
	=?utf-8?B?b3hzd25EU2Q1eTM4L2t6dmREdUVUREp1aUwvdUVRRUtDYWdJa0U2clEzb1RY?=
	=?utf-8?B?N3BtdnFBTnJxMWdJdlVtblJycE5iTUlJV3g1OGs4d2JMVW9XOXpYajJaWVY5?=
	=?utf-8?Q?rO2GhDGXyQN6Xjl6g+1TM64dx0D+Ob2i?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0693;
	6:ExaqW2v9Qz+q1f6Ndqn7kB2i2aLwGIFdHuqubbqyhGh0HxwGtDa6HZjXSR/LDssGRrq4TMccrjNV9+Rk8C5M02Ov+zKZGtAPxMJKMHDonqsTMI1kWaKppzXmdSWz/78E7aKTRPc3/cf7wrNX63XvxsqPfFQxUnupnqBIocuqs5qkDaznQKz5OW/9Qsxe9JMaFRKO09hSuM69anpTHds1QO2zjAACKOQfoImzeyB5uiThctWBhtZfseabf3li7i2ekncM3AQIWXXc6kgiiMH+pN220S3rKvMS0ngg4G0src7UrwLON1ZG9ixS2i9rJ5zwxxsRdNv4b0qBsct4Yge1ng==;
	5:DFQ8HgzTjQWdYlPO/ICGKyfMLCWYiAJWiXry/BoPY97iRgDYU1nE0sddD9+E5eDdocYglG5iBrzuMUZdJtWWiQiXP1yclAieJgCwvWJjzOqdU/5OzIzgNuZIZdMYrp2ZyIJgqzx2uIJ3ape+SaHSCQ==;
	24:ZZtNn9KQWrzi7zeKk3KnSCBQ6sOJLrYqgJ4Y93vTaXKtrIG5k6y8fjGb0sA8uax8HP7ia35MTWEm24fMv4v+kM6565lLc30LtKhaI9LDZy8=;
	7:6kj7uKGDaI2uE7iGbIvP15ZoFtr1Fi4lZB8f1xlkZE78WYh/5yu4Z4N2YzvECoCbge8IzmEiI1Qpk8+aaJvID8pcJ0EfGxyn0/EtFBOrWGCM8lr53Bwr7rJgzLxcvnHK5WKeDXZzIA8Yp9Hy/iZ4+9LZG8bD9NnVoIXRV2mzy4UTBL5Nq1eFE5PezjU35iRJnbeZUXbNZjb8W/bp11/DA88n8ozQpiMDo9GGB0s+1dI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2017 23:47:48.8239 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d04e5a-3c78-44bd-a0a7-08d51c02ccae
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0693
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-10-25_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1710250304
Cc: josh.hernstrom@ni.com
Subject: Re: [PATCH v8] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Thu, 26 Oct 2017 00:07:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 10/23/2017 04:38 PM, Saul Wold wrote:
> 
> Haris,
> 
> We are really really close, one suggestion in the commit message and
> linux-yocto-rt needs a fix similar to linux-yocto.inc (or maybe code
> removed).
> 
> See below
> 
> Thanks so much for this work
> 
> Sau!
> 
> On Thu, 2017-10-19 at 14:19 -0500, Haris Okanovic wrote:
>> Some distros may want to provide alternate kernel "flavors" via feeds
>> or
>> within bootable images. For example, readily available builds which
>> provide certain diagnostic features can enable developers and testers
>> to
>> more quickly resolve issues by avoiding lengthy kernel builds.
>>
>> This change allows for building multiple flavors of the kernel and
>> module packages by templatizing kernel package names via a new
>> KERNEL_PACKAGE_NAME variable in kernel.bbclass. It defaults to the
>> old
>> name of "kernel", but can be overridden by certain recipes providing
>> alternate kernel flavors.
>>
>> To maintain compatibility, recipes providing alternate kernel flavors
>> cannot be the "preferred provider" for virtual/kernel. This is
>> because
>> OE puts the preferred provider's build and source at
>> "tmp-glibc/work-shared/$MACHINE/kernel-build-artifacts/" and
>> "tmp-glibc/work-shared/$MACHINE/kernel-source/" instead of
>> "tmp-glibc/work/*/$PN/" like other recipes. Therefore, recipes using
>> the
>> default KERNEL_PACKAGE_NAME="kernel" follows the old semantics --
>> build
>> in the old location and may be preferred provider -- while recipes
>> using
>> all other KERNEL_PACKAGE_NAME's build from the normal WORKDIR and
>> don't
>> provide "virtual/kernel".
>>
>> Testing:
>>   1. Prepended `KERNEL_PACKAGE_NAME = "tiny-linux"` to
>>      linux-yocto-tiny_4.9.bb so that it may build alongside
>>      the main kernel.
> I would also suggest using an example of KERNEL_PACKAGE_NAME_pn-linux-
> yocto-tiny = "tiny-linux", this can be added to a conf file such as
> local.conf file in order to allow for a kernel recipe to easily revert
> back to being a possible PREFERRED_PROVIDER_virtual/kernel if a single
> kernel is needed.
> 
> One additional code related comment at the very bottom.
> 

Sure. Updated testing section and successfully re-ran all steps.

> Sau!
>>   2. `bitbake linux-yocto linux-yocto-tiny` to build both kernel
>> flavors.
>>   3. Verified image and modules IPKs exist for both:
>>      tmp-glibc/deploy/ipk/qemux86/kernel-* for linux-yocto
>>      tmp-glibc/deploy/ipk/qemux86/tiny-linux* for linux-yocto-tiny
>>   4. Verified linux-yocto is the "preferred provider", and was built
>> in
>>      shared directory: tmp-glibc/work-shared/qemux86/kernel-*
>>   5. Appended `CORE_IMAGE_BASE_INSTALL += "tiny-linux"` to
>>      core-image-base.bb to include both kernel flavors.
>>   6. `bitbake core-image-base` to build an image.
>>   7. Verified image contains two bzImage's under /boot/, with
>>      "yocto-standard" selected to boot via symlink.
>>
>> Discussion threads:
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_pipermail_openembedded-2Dcore_2015-2DDecemb&d=DwICaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=CELKDprUza4SWI1u2Fypwugx9Xc02d2vjiezk0izIEM&s=PTcNwBf0unLuyw5-OdgBzLd6vCdbGwGgr1r1TkqSb8c&e=
>> er/thread.html#114122
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_pipermail_openembedded-2Dcore_2017-2DJuly_t&d=DwICaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=CELKDprUza4SWI1u2Fypwugx9Xc02d2vjiezk0izIEM&s=sI-EDX5g0v_gF7fpvHRlgMvP6dtdT5Iw4aJAQoa8-AU&e=
>> hread.html#139130
>>
> Also, can you add the tag for tracking bug/features:
> [YOCTO #11363]
> 

Done.

>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
>> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
>> Coauthored-by: Gratian Crisan <gratian.crisan@ni.com>
>> Coauthored-by: Haris Okanovic <haris.okanovic@ni.com>
>> Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com>
>> ---
>> [PATCH v2] Change STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR to
>> the
>> "work" directory in alternate kernel builds, instead of "work-
>> shared",
>> so
>> that the two builds don't clobber each other.
>>
>> [PATCH v3] An updated version of this change rebased onto the current
>> OE-core master. Changes:
>>   - Remove PREFERRED_PROVIDER check in linux-yocto.inc in alternate
>>     kernel builds, since alternate kernels aren't the
>>     PREFERRED_PROVIDER for virtual/kernel by definition.
>>   - Remove "virtual/kernel" from PROVIDES in alternate kernel builds.
>>
>> [PATCH v4] Another rebase onto master; no functional change.
>> Improved description and testing steps.
>>
>> [PATCH v5]
>>   - Warn when PN == KERNEL_PACKAGE_NAME (bug # 11905)
>>   - Add KERNEL_DEPLOYSUBDIR to avoid DEPLOYDIR collisions
>>
>> [PATCH v6] Add KERNEL_PACKAGE_NAME to kernel-module-split.bbclass for
>> module recipes; fixes lttng-modules build.
>>
>> [PATCH v7] Remove second definition of KERNEL_PACKAGE_NAME from
>> kernel-module-split.bbclass; apply a default in two places where
>> KERNEL_PACKAGE_NAME is referenced.
>>
>> [PATCH v8] Rebase onto current master and more fixups.
>>   - kernel-devicetree.bbclass: Fixup package names
>>   - depmodwrapper-cross: don't error when called from alt kernel
>> recipes
>>   - kernel.bbclass: Don't install /boot/image symlink in alt recipes
>>
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_harisokanovic_openembedded-2Dcore_tree_dev_hokanovi_&d=DwICaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=CELKDprUza4SWI1u2Fypwugx9Xc02d2vjiezk0izIEM&s=guWWLvqmyFm1pkNjrzqqwhkTkd_tmRlVAXoMv-zSyyI&e=
>> multi-kernel-packages-v8
>> ---
>>   meta/classes/kernel-devicetree.bbclass             |   8 +-
>>   meta/classes/kernel-module-split.bbclass           |   9 +-
>>   meta/classes/kernel.bbclass                        | 114
>> +++++++++++++--------
>>   meta/conf/documentation.conf                       |   1 +
>>   .../recipes-kernel/kmod/depmodwrapper-cross_1.0.bb |  14 +--
>>   meta/recipes-kernel/linux/linux-yocto.inc          |   2 +-
>>   6 files changed, 90 insertions(+), 58 deletions(-)
>>
>> diff --git a/meta/classes/kernel-devicetree.bbclass
>> b/meta/classes/kernel-devicetree.bbclass
>> index 6e08be4b70..4f80cc62eb 100644
>> --- a/meta/classes/kernel-devicetree.bbclass
>> +++ b/meta/classes/kernel-devicetree.bbclass
>> @@ -1,10 +1,10 @@
>>   # Support for device tree generation
>>   PACKAGES_append = " \
>> -    kernel-devicetree \
>> -    ${@['kernel-image-zimage-bundle',
>> ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
>> +    ${KERNEL_PACKAGE_NAME}-devicetree \
>> +    ${@[d.getVar('KERNEL_PACKAGE_NAME') + '-image-zimage-bundle',
>> ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
>>   "
>> -FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb
>> /${KERNEL_IMAGEDEST}/*.dtbo"
>> -FILES_kernel-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-
>> *.dtb.bin"
>> +FILES_${KERNEL_PACKAGE_NAME}-devicetree =
>> "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
>> +FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle =
>> "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
>>   
>>   # Generate kernel+devicetree bundle
>>   KERNEL_DEVICETREE_BUNDLE ?= "0"
>> diff --git a/meta/classes/kernel-module-split.bbclass
>> b/meta/classes/kernel-module-split.bbclass
>> index 1035525dac..73c7f18c78 100644
>> --- a/meta/classes/kernel-module-split.bbclass
>> +++ b/meta/classes/kernel-module-split.bbclass
>> @@ -30,7 +30,7 @@ do_install_append() {
>>   
>>   PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
>>   
>> -KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
>> +KERNEL_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME",
>> True) or "kernel" }-modules"
>>   
>>   KERNEL_MODULE_PACKAGE_PREFIX ?= ""
>>   KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
>> @@ -129,16 +129,19 @@ python split_kernel_module_packages () {
>>              postfix = format.split('%s')[1]
>>              d.setVar('RPROVIDES_' + pkg, pkg.replace(postfix, ''))
>>   
>> +    kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME", True) or
>> "kernel"
>> +    kernel_version = d.getVar("KERNEL_VERSION", True)
>> +
>>       module_regex = '^(.*)\.k?o$'
>>   
>>       module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
>>       module_pattern_suffix = d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
>> -    module_pattern = module_pattern_prefix + 'kernel-module-%s' +
>> module_pattern_suffix
>> +    module_pattern = module_pattern_prefix + kernel_package_name +
>> '-module-%s' + module_pattern_suffix
>>   
>>       postinst = d.getVar('pkg_postinst_modules')
>>       postrm = d.getVar('pkg_postrm_modules')
>>   
>> -    modules = do_split_packages(d,
>> root='${nonarch_base_libdir}/modules', file_regex=module_regex,
>> output_pattern=module_pattern, description='%s kernel module',
>> postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata,
>> extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
>> +    modules = do_split_packages(d,
>> root='${nonarch_base_libdir}/modules', file_regex=module_regex,
>> output_pattern=module_pattern, description='%s kernel module',
>> postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata,
>> extra_depends='%s-%s' % (kernel_package_name, kernel_version))
>>       if modules:
>>           metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
>>           d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
>> diff --git a/meta/classes/kernel.bbclass
>> b/meta/classes/kernel.bbclass
>> index 756707a3c2..48b718d777 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -1,6 +1,9 @@
>>   inherit linux-kernel-base kernel-module-split
>>   
>> -PROVIDES += "virtual/kernel"
>> +KERNEL_PACKAGE_NAME ??= "kernel"
>> +KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME",
>> True) == "kernel") else d.getVar("KERNEL_PACKAGE_NAME", True) }"
>> +
>> +PROVIDES += "${@ "virtual/kernel" if
>> (d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel") else "" }"
>>   DEPENDS += "virtual/${TARGET_PREFIX}binutils
>> virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native"
>>   PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
>>   
>> @@ -34,11 +37,32 @@ KERNEL_VERSION_PKG_NAME = "${@legitimize_package_
>> name(d.getVar('KERNEL_VERSION')
>>   KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
>>   
>>   python __anonymous () {
>> +    pn = d.getVar("PN", True)
>> +    kpn = d.getVar("KERNEL_PACKAGE_NAME", True)
>> +
>> +    # XXX Remove this after bug 11905 is resolved
>> +    #  FILES_${KERNEL_PACKAGE_NAME}-dev doesn't expand correctly
>> +    if kpn == pn:
>> +        bb.warn("Some packages (E.g. *-dev) might be missing due to
>> "
>> +                "bug 11905 (variable KERNEL_PACKAGE_NAME == PN)")
>> +
>> +    # The default kernel recipe builds in a shared location defined
>> by
>> +    # bitbake/distro confs: STAGING_KERNEL_DIR and
>> STAGING_KERNEL_BUILDDIR.
>> +    # Set these variables to directories under ${WORKDIR} in
>> alternate
>> +    # kernel recipes (I.e. where KERNEL_PACKAGE_NAME != kernel) so
>> that they
>> +    # may build in parallel with the default kernel without
>> clobbering.
>> +    if kpn != "kernel":
>> +        workdir = d.getVar("WORKDIR", True)
>> +        sourceDir = os.path.join(workdir, 'kernel-source')
>> +        artifactsDir = os.path.join(workdir, 'kernel-build-
>> artifacts')
>> +        d.setVar("STAGING_KERNEL_DIR", sourceDir)
>> +        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
>>   
>>       # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into
>> KERNEL_IMAGETYPES
>>       type = d.getVar('KERNEL_IMAGETYPE') or ""
>>       alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>>       types = d.getVar('KERNEL_IMAGETYPES') or ""
>> +    kname = d.getVar('KERNEL_PACKAGE_NAME', True) or "kernel"
>>       if type not in types.split():
>>           types = (type + ' ' + types).strip()
>>       if alttype not in types.split():
>> @@ -55,15 +79,15 @@ python __anonymous () {
>>           typelower = type.lower()
>>           imagedest = d.getVar('KERNEL_IMAGEDEST')
>>   
>> -        d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
>> +        d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
>>   
>> -        d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest
>> + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' +
>> type)
>> +        d.setVar('FILES_' + kname + '-image-' + typelower, '/' +
>> imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest
>> + '/' + type)
>>   
>> -        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' +
>> typelower)
>> +        d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' %
>> (kname, typelower))
>>   
>> -        d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-' +
>> typelower + '-${KERNEL_VERSION_PKG_NAME}')
>> +        d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-
>> %s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>>   
>> -        d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
>> +        d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower),
>> '1')
>>   
>>       image = d.getVar('INITRAMFS_IMAGE')
>>       if image:
>> @@ -121,9 +145,9 @@ base_do_unpack_append () {
>>   
>>   inherit kernel-arch deploy
>>   
>> -PACKAGES_DYNAMIC += "^kernel-module-.*"
>> -PACKAGES_DYNAMIC += "^kernel-image-.*"
>> -PACKAGES_DYNAMIC += "^kernel-firmware-.*"
>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-image-.*"
>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
>>   
>>   export OS = "${TARGET_OS}"
>>   export CROSS_COMPILE = "${TARGET_PREFIX}"
>> @@ -339,7 +363,9 @@ kernel_do_install() {
>>   	install -d ${D}/boot
>>   	for type in ${KERNEL_IMAGETYPES} ; do
>>   		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
>> ${D}/${KERNEL_IMAGEDEST}/${type}-${KERNEL_VERSION}
>> -		ln -sf ${type}-${KERNEL_VERSION}
>> ${D}/${KERNEL_IMAGEDEST}/${type}
>> +		if [ "${KERNEL_PACKAGE_NAME}" == "kernel" ]; then
>> +			ln -sf ${type}-${KERNEL_VERSION}
>> ${D}/${KERNEL_IMAGEDEST}/${type}
>> +		fi
>>   	done
>>   	install -m 0644 System.map ${D}/boot/System.map-
>> ${KERNEL_VERSION}
>>   	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
>> @@ -393,9 +419,9 @@ do_shared_workdir_setscene () {
>>   
>>   emit_depmod_pkgdata() {
>>   	# Stash data for depmod
>> -	install -d ${PKGDESTWORK}/kernel-depmod/
>> -	echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/kernel-
>> depmod/kernel-abiversion
>> -	cp ${B}/System.map ${PKGDESTWORK}/kernel-depmod/System.map-
>> ${KERNEL_VERSION}
>> +	install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
>> +	echo "${KERNEL_VERSION}" >
>> ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/${KERNEL_PACKAGE_NAME}-
>> abiversion
>> +	cp ${B}/System.map ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-
>> depmod/System.map-${KERNEL_VERSION}
>>   }
>>   
>>   PACKAGEFUNCS += "emit_depmod_pkgdata"
>> @@ -410,7 +436,7 @@ do_shared_workdir () {
>>   	# Store the kernel version in sysroots for module-
>> base.bbclass
>>   	#
>>   
>> -	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
>> +	echo "${KERNEL_VERSION}" >
>> $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
>>   
>>   	# Copy files required for module builds
>>   	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>> @@ -508,28 +534,28 @@ EXPORT_FUNCTIONS do_compile do_install
>> do_configure
>>   
>>   # kernel-base becomes kernel-${KERNEL_VERSION}
>>   # kernel-image becomes kernel-image-${KERNEL_VERSION}
>> -PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-
>> dev kernel-modules"
>> +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
>> ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
>> ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
>>   FILES_${PN} = ""
>> -FILES_kernel-base =
>> "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
>> -FILES_kernel-image = ""
>> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
>> /boot/config* ${KERNEL_SRC_PATH}
>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>> -FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
>> -FILES_kernel-modules = ""
>> -RDEPENDS_kernel = "kernel-base"
>> +FILES_${KERNEL_PACKAGE_NAME}-base =
>> "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
>> +FILES_${KERNEL_PACKAGE_NAME}-image = ""
>> +FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map*
>> /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}
>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>> +FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux-
>> ${KERNEL_VERSION_NAME}"
>> +FILES_${KERNEL_PACKAGE_NAME}-modules = ""
>> +RDEPENDS_${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base"
>>   # Allow machines to override this dependency if kernel image files
>> are
>>   # not wanted in images as standard
>> -RDEPENDS_kernel-base ?= "kernel-image"
>> -PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNE
>> L_VERSION}')}"
>> -RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE',
>> 'vmlinux', 'kernel-vmlinux', '', d)}"
>> -PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSI
>> ON}')}"
>> -RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>> -ALLOW_EMPTY_kernel = "1"
>> -ALLOW_EMPTY_kernel-base = "1"
>> -ALLOW_EMPTY_kernel-image = "1"
>> -ALLOW_EMPTY_kernel-modules = "1"
>> -DESCRIPTION_kernel-modules = "Kernel modules meta package"
>> -
>> -pkg_postinst_kernel-base () {
>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-
>> image"
>> +PKG_${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@
>> legitimize_package_name('${KERNEL_VERSION}')}"
>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-image += "${@base_conditional('KERNE
>> L_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
>> +PKG_${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitim
>> ize_package_name('${KERNEL_VERSION}')}"
>> +RPROVIDES_${KERNEL_PACKAGE_NAME}-base += "${KERNEL_PACKAGE_NAME}-
>> ${KERNEL_VERSION}"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} = "1"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base = "1"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image = "1"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules = "1"
>> +DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules = "Kernel modules meta
>> package"
>> +
>> +pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
>>   	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>>   		mkdir -p $D/lib/modules/${KERNEL_VERSION}
>>   	fi
>> @@ -543,7 +569,7 @@ pkg_postinst_kernel-base () {
>>   PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
>>   
>>   python split_kernel_packages () {
>> -    do_split_packages(d, root='${nonarch_base_libdir}/firmware',
>> file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='kernel-
>> firmware-%s', description='Firmware for %s', recursive=True,
>> extra_depends='')
>> +    do_split_packages(d, root='${nonarch_base_libdir}/firmware',
>> file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$',
>> output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s',
>> description='Firmware for %s', recursive=True, extra_depends='')
>>   }
>>   
>>   # Many scripts want to look in arch/$arch/boot for the bootable
>> @@ -626,21 +652,27 @@ MODULE_TARBALL_SYMLINK_NAME ?= "modules-
>> ${MACHINE}.tgz"
>>   MODULE_TARBALL_DEPLOY ?= "1"
>>   
>>   kernel_do_deploy() {
>> +	deployDir="${DEPLOYDIR}"
>> +	if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
>> +		deployDir="${DEPLOYDIR}/${KERNEL_DEPLOYSUBDIR}"
>> +		mkdir "$deployDir"
>> +	fi
>> +
>>   	for type in ${KERNEL_IMAGETYPES} ; do
>>   		base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
>> -		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
>> ${DEPLOYDIR}/${base_name}.bin
>> +		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
>> $deployDir/${base_name}.bin
>>   	done
>>   	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e
>> '^CONFIG_MODULES=y$' .config); then
>>   		mkdir -p ${D}/lib
>> -		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME}
>> -C ${D} lib
>> -		ln -sf ${MODULE_TARBALL_BASE_NAME}
>> ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
>> +		tar -cvzf $deployDir/${MODULE_TARBALL_BASE_NAME} -C
>> ${D} lib
>> +		ln -sf ${MODULE_TARBALL_BASE_NAME}
>> $deployDir/${MODULE_TARBALL_SYMLINK_NAME}
>>   	fi
>>   
>>   	for type in ${KERNEL_IMAGETYPES} ; do
>>   		base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
>>   		symlink_name=${type}-${KERNEL_IMAGE_SYMLINK_NAME}
>> -		ln -sf ${base_name}.bin
>> ${DEPLOYDIR}/${symlink_name}.bin
>> -		ln -sf ${base_name}.bin ${DEPLOYDIR}/${type}
>> +		ln -sf ${base_name}.bin
>> $deployDir/${symlink_name}.bin
>> +		ln -sf ${base_name}.bin $deployDir/${type}
>>   	done
>>   
>>   	cd ${B}
>> @@ -650,8 +682,8 @@ kernel_do_deploy() {
>>   			echo "Copying deploy ${type} kernel-
>> initramfs image and setting up links..."
>>   			initramfs_base_name=${type}-
>> ${INITRAMFS_BASE_NAME}
>>   			initramfs_symlink_name=${type}-initramfs-
>> ${MACHINE}
>> -			install -m 0644
>> ${KERNEL_OUTPUT_DIR}/${type}.initramfs
>> ${DEPLOYDIR}/${initramfs_base_name}.bin
>> -			ln -sf ${initramfs_base_name}.bin
>> ${DEPLOYDIR}/${initramfs_symlink_name}.bin
>> +			install -m 0644
>> ${KERNEL_OUTPUT_DIR}/${type}.initramfs
>> $deployDir/${initramfs_base_name}.bin
>> +			ln -sf ${initramfs_base_name}.bin
>> $deployDir/${initramfs_symlink_name}.bin
>>   		fi
>>   	done
>>   }
>> diff --git a/meta/conf/documentation.conf
>> b/meta/conf/documentation.conf
>> index a55e2836b5..2c88504fb9 100644
>> --- a/meta/conf/documentation.conf
>> +++ b/meta/conf/documentation.conf
>> @@ -247,6 +247,7 @@ KERNEL_IMAGETYPE[doc] = "The type of kernel to
>> build for a device, usually set b
>>   KERNEL_IMAGETYPES[doc] = "The list of types of kernel to build for a
>> device, usually set by the machine configuration files and defaults
>> to KERNEL_IMAGETYPE."
>>   KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be
>> auto-loaded during boot"
>>   KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the
>> build system expects to find module_conf_* values that specify
>> configuration for each of the modules"
>> +KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages.
>> Defaults to 'kernel'."
>>   KERNEL_PATH[doc] = "The location of the kernel sources. This
>> variable is set to the value of the STAGING_KERNEL_DIR within the
>> module class (module.bbclass)."
>>   KERNEL_SRC[doc] = "The location of the kernel sources. This variable
>> is set to the value of the STAGING_KERNEL_DIR within the module class
>> (module.bbclass)."
>>   KFEATURE_DESCRIPTION[doc] = "Provides a short description of a
>> configuration fragment. You use this variable in the .scc file that
>> describes a configuration fragment file."
>> diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>> b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>> index 44d013f29d..2eec921728 100644
>> --- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>> +++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>> @@ -23,17 +23,13 @@ if [ "\$1" != "-a" -o "\$2" != "-b" ]; then
>>       echo "Usage: depmodwrapper -a -b rootfs KERNEL_VERSION" >&2
>>       exit 1
>>   fi
>> -if [ ! -r ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion ]; then
>> -    echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/kernel-
>> abiversion" >&2
>> -else
>> -    kernelabi=\$(cat ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion)
>> -    if [ "\$kernelabi" != "\$4" ]; then
>> -        echo "Error: Kernel version \$4 does not match kernel-
>> abiversion (\$kernelabi)" >&2
>> -        exit 1
>> -    fi
>> +
>> +kernelabi=""
>> +if [ -r "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion" ]; then
>> +    kernelabi=\$(cat "${PKGDATA_DIR}/kernel-depmod/kernel-
>> abiversion")
>>   fi
>>   
>> -if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ]; then
>> +if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ] || [
>> "\$kernelabi" != "\$4" ]; then
>>       echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/System.map-
>> \$4" >&2
>>       exec env depmod "\$1" "\$2" "\$3" "\$4"
>>   else
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>> b/meta/recipes-kernel/linux/linux-yocto.inc
>> index 9c1f61be75..8a70eb5018 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> @@ -12,7 +12,7 @@ INC_PR = "r4"
>>   # PREFERRED_PROVIDER for virtual/kernel. This avoids network access
>> required
>>   # by the use of AUTOREV SRCREVs, which are the default for this
>> recipe.
>>   python () {
>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=
>> d.getVar("PN"):
>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>> d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != d.getVar("PN",
>> True):
> 
> I think this change is also needed in the *-rt recipes as they have a
> similar check, maybe that check just needs to be removed?
> 

I don't _think_ the check is strictly necessary, since building an image 
should always select PREFERRED_PROVIDER_virtual/kernel recipe. However, 
I don't know all use cases of kernel.bbclass and associated recipes, so 
I opted to preserve existing behavior to be on the safe side. I.e. 
Alternate kernel recipes are not be buildable unless KERNEL_PACKAGE_NAME 
is also changed.

I'll defer to someone else on entirely removing this sanity check. For 
now, I made the aforementioned change to other *-rt recipes as you 
suggested. Also verified linux-yocto-rt is not buildable unless 
`KERNEL_PACKAGE_NAME_pn-linux-yocto-rt = "rt-linux"` is added to local.conf.

> Sau!
>>           d.delVar("BB_DONT_CACHE")
>>           raise bb.parse.SkipPackage("Set
>> PREFERRED_PROVIDER_virtual/kernel to %s to enable it" %
>> (d.getVar("PN")))
>>   }
>> -- 
>> 2.14.2
>>

I'll post a V9 shortly.

-- Haris

