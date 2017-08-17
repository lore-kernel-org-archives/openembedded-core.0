Return-Path: <haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id 4006378560
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 21:14:56 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v7HLAtA2025672; Thu, 17 Aug 2017 16:14:03 -0500
Received: from nam02-sn1-obe.outbound.protection.outlook.com
	(mail-sn1nam02lp0019.outbound.protection.outlook.com [216.32.180.19])
	by mx0b-00010702.pphosted.com with ESMTP id 2cdcn9a50j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2017 16:14:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=79CHSliMgicL7nlBQKRuN5NTqSlWpgRzS4uFJ+aTQu8=;
	b=YWjP5vrTIxFGHZHiWb6diSTHYIE+6bQzA9Cn0gLHouhgZM3/U1acD7gTYXw0JQhhSfG6+0jj25nCRcQsAJtV863ZpO2Vcliasd5rbeqkU9Tovu0AtM2ZuQ+Mn0r3xwcq3XzXQ7lAyGsEtkhjTGvqEz2jEb2eRmBy8S9OwrCvIxg=
Received: from harisdt.amer.corp.natinst.com (130.164.62.171) by
	BN6PR04MB0691.namprd04.prod.outlook.com (10.172.198.12) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1341.21; Thu, 17 Aug 2017 21:13:59 +0000
To: "Wold, Saul" <saul.wold@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1500479806.27323.202.camel@intel.com>
	<20170814212953.17050-1-haris.okanovic@ni.com>
	<1502899245.27472.78.camel@intel.com>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <bd92b907-d60b-adda-fe75-72eff6eeb21e@ni.com>
Date: Thu, 17 Aug 2017 16:13:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502899245.27472.78.camel@intel.com>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: YQXPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM (52.132.74.29) To
	BN6PR04MB0691.namprd04.prod.outlook.com (10.172.198.12)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10de7448-e046-4072-95d7-08d4e5b4e19c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BN6PR04MB0691; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0691;
	3:gKmtXR6kwb7M4D0ygcdz+qwk6Y5ZVYwoeOB5KPgInOjBySI8vcYCGkYdhFMOeo0iwgf04GBrQBsIE5N7KkQoTzVRbHyaKDH5XgC3++wYnkEIDrE3JbErP9apPfItNwPA9vrfMc2QOv0IsNA6azOaFSAiAmmINcaU8IIZsY4SAsrp0Q4D3jK5EVonoEeVM3+G4NLoZVDNnsIjH2wyZIK7/fc2gmHPBZbV1m3uN8zZ+IwSmUx6LEMYpy0drI7e3Yg+;
	25:pKHeHLJR3K5Ui3+sBdTwBiZv1Z8pMmARzFpOYyaO6obbdbm5tVQyTfviCrIQbZzCYrP1TWY1UZ36DoDcRV980uAitMBvatQZaygFYqWq6klU2pRsKzEgfmPUBJVhDiIHIIsFR1dMfummTeVMQuJ/GE4k3bhKn5qw6cbGWxMDHc6T2CtiLx8gws2qr1VHsKKqnVsYJNpObIyJgnnkkLDJJDP3Viv5kkjRTn0fGPBgLu0oe+UADVinO4aqEcVMCdGsk52pvxJyLrY4uj4c3iiDTmkU3LCWg7kveICdpdhrXFOkSRDClg56Y2AQz5iKpeNadZQTFD3+XV650pgZIEIguQ==;
	31:LCM0S3VBvzdN9k8kADfXNPBZY1OzFrSTcy+PM9S1MLTQJN+CITG5qGma/5c5PyHqx9AJx+fZRGoQhYl4B+ckk9wWOa3X84hwbeM9mV41LjTUdD+znmwBA0U5+K2UAhQtlaRM6v75QRyDvUvzj0WZWJwpG+fT96imukNCxSl2XnnIdXReOF80OyZ6FrA61UeJ7TE/JDoB4VrkzfPlcUNEmfjJ8lclzrdp62KkEAcxJ78=
X-MS-TrafficTypeDiagnostic: BN6PR04MB0691:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0691;
	20:Fuq+fLTqlVhtoO9u0fGdSAg1hnTmGeSQwpusXkNHnLaeDYK1FY+rZ14AN9B3bZ48b+zGZT+aZJBdRKE3PAtJ7ydGFujXlXGKD4Wg/BCfojJ3kkz+vBFUHU53TzzvAyXgw7Lxt/W4bhX4EsnFny+PM3dCUvV9Z0BnwFhqsRStiCo0lFQ5voXGkDb/Tk1tmmQf68lS45M2CmKrxhbSjSEjv5eCUA6DOlNWoz106Svp4isq5i7/ZRp96bqNVLZQkEoG70PjRyKcx6+uuCRK4wqAnB3ITIgJBng7VnnFz4jRVFg54d6EfTYJaqyUfqlW4Ss1HuOSz4Lbs8V/z5XY7tIbp7Del7azy0664IEM+i8o2KKXu6FFjrvx3/X+dNpkNL6FoIDU1m78IFiRUH47Bz9TNBHpCVJBfX135Xe3qOJTaph6sNSky0umDbfMroQyyB8TBvwg+8hY/x5vWIVjhA1EMzFvCmTVNqMuP0kgu0SWCx3rUWUykJO4Xc7bD2PiB3/NmyH0zeK2Gf2v8P6b792uXv2lblmgOJXVdIok/74k9Pr76bPT6HfXPLLzlOCF7w4+/qqJC/61+xXpa0YtIdYd8Yfz5zvP1s2tIQKTU5fNH7M=
X-Exchange-Antispam-Report-Test: UriScan:(10436049006162)(788757137089)(145744241990776); 
X-Microsoft-Antispam-PRVS: <BN6PR04MB069140CC3EAAA9984B202F29E5830@BN6PR04MB0691.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(3002001)(6041248)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR04MB0691; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR04MB0691; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0691;
	4:clXgz8xIxKWgE4j6KpjBRUfVP+96Zu61Cpn7XhVv8d1zQkREw9sQ2VFyDB1vPGoei2UbZ5azP+KxfYiJsGBMfYAHj/gOz1UFj3/Y++Gfhr0APkHG+ejRQO7AGWQMP90x32zS/gTQ/o/WK6qPXH2ZGH9JoCFVrWdSq9WOXq3RG0qTAFckuIcvObMyVELpFQjX1J/J6j7gaQUXCutLFwPHDgKnMtmqWXxzUBybJT99k7kMtvXF5tXWfwZ9kw7KyXDnZ5JvyPzj4LfqdCxkx8r717acbeEEEEOdVD4hJEhLFdTmKuENBqlrg+GgKkuF39kVuf75c725NMNh9EWgMqDzN9lrf2odDkisvngbmAn7HyM=
X-Forefront-PRVS: 0402872DA1
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(7370300001)(6009001)(189002)(377454003)(199003)(377424004)(24454002)(81156014)(8676002)(81166006)(53936002)(106356001)(105586002)(76176999)(6512007)(6306002)(54356999)(50986999)(305945005)(50466002)(229853002)(7736002)(2950100002)(6666003)(6246003)(64126003)(31686004)(54906002)(6506006)(42186005)(6486002)(2501003)(7350300001)(230700001)(65806001)(47776003)(66066001)(65956001)(3846002)(101416001)(53546010)(97736004)(4001350100001)(36756003)(23676002)(31696002)(2906002)(966005)(68736007)(33646002)(4326008)(83506001)(25786009)(5660300001)(65826007)(478600001)(6116002)(86362001)(575784001)(189998001)(21314002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR04MB0691;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjA0TUIwNjkxOzIzOnEzZ0VjejZQVXVzTGptY1c1VWdiN2tFbEFD?=
	=?utf-8?B?TXI0KzN2VzE4bVlOcU9SYUJVa0pTVVRaaG4za0dwOExRNDhGN0ZEM3RBWGZy?=
	=?utf-8?B?YlNnYjdKTE1nOWRHNTR5c09CajVERjBkTE9kWGtkOG54MG9aNTlJVk1UeWdP?=
	=?utf-8?B?UklHQ0Y5SE01SUg3OFFZSFo0dEpBVDR6ZVlCTjdPVzZRaWl4a3YwSHVwR0xK?=
	=?utf-8?B?TXdVL25FWmZHNWRKa08yaDRlZ3RxdkhIRjZRL3dVckh1RUVEVXVtam8vTDdG?=
	=?utf-8?B?OVd4ZHNra2kwZUQvZFl2REV6L1A4dGN3cEFPL0RXeUFIaWxGQXlJQlNkQjNO?=
	=?utf-8?B?QWh2WEkzRER3MzQwczZFbnFSZ1NKbncrYTJNeE9CUkdhYkJSYThpWnE1M1Bu?=
	=?utf-8?B?R0VmUy9CVlpWMVd4TUpFbkZKTHBQd2ZDdGVuZGdnRXVpK2ZMNG05MjVIOC9Y?=
	=?utf-8?B?cjRvVkJKTW9QYVF1bXhGM2NwVE55cnNJek9Ic25Oend6RWlVZGZnWTQ1UUor?=
	=?utf-8?B?Ynk2UC85cXN5ZkZOWXpRNFVibWplYWo0Y0dJT1pZUWpTYldXVEtFS2oySW1u?=
	=?utf-8?B?K0g2OTJEcHVHN05zVVRQUy8rSlhXL24yLzV2VjZJOG4zZlJaQ0tMamwwRkFC?=
	=?utf-8?B?OTlVUXI2TTIxN2RvZEp2ZmN6ZGNxczdnLytyOG91Y3NjS2dmSVNsWitlc3hu?=
	=?utf-8?B?N29VaGR0NGFWM29ISjFhUFJReWNjdmVYakZXcURWczNZOXdLSE5JS0U5TzJW?=
	=?utf-8?B?UmFEVWxsU0sxU2ZEY3c5MUlGNE1QT0M3NXplMkpCTWt0S0Jqajd5d2J4TXk2?=
	=?utf-8?B?aW9EdldPS21Wc2NKOCs3dXFTNEVudFF5SUIva3hiWG13dnVHcDBiRDF4Ujlh?=
	=?utf-8?B?T2RhcVdSb0xBVWlPS3NuSUxScDRoYXhLZG14d3R0bi9EWkJjOU1mVFdmVytO?=
	=?utf-8?B?K3c5WDFZT0dBajB3eVRYTG1YaXBSSVowbnkzVUJGS3hCcTJXaGlIQUQ3NmRq?=
	=?utf-8?B?OTBCMXZjbTcreDMweTNEUnMyZXdiOGFOS2xpUU5mM2c3RDh0S3IxNDBjYWNw?=
	=?utf-8?B?MFlraVY1ZXdmSWJwbG5nNDFvbHZJN0pvMkpRTFYya1FHUmhUR0lYYlp0d0Ja?=
	=?utf-8?B?QlNyRmp5WklmVC9XaEM5UTRVZERmRGdWSHJQendTNjFDZkRoYU10bmxneW14?=
	=?utf-8?B?MnBnTlkxdnNvU25wRHc3aEhEL3Q4S2FvZ2Ric28zdUU4K0J4NVIrVWZlSE9P?=
	=?utf-8?B?dmo1ZWc5SjZZV3lWampPK1JQbGo1VzY1MXFNVW5pWmlZSWxMeDdsRU45bWVR?=
	=?utf-8?B?cjJ5RXZYNGhFTDRXQUh1cUV6YWJrU29BZ2Z5eGxYcUlzbnhxQjkvNXUvR0JF?=
	=?utf-8?B?RVI4YU1wWGxrdndneDRndmk3TkVXTmtFTERadi83THBVblduOXkwL01YVERx?=
	=?utf-8?B?NlFRRHVJQUhwd2svOEE2aTNHekY0RUlOM1czOFlXM1RCa1krWi9OMGhBM0FE?=
	=?utf-8?B?ODErUnVXYml5aW9DUjlnRDcyT0UxQ3A4U292VkVsbXgyekg5VVZRbXcyQ3dN?=
	=?utf-8?B?NjJjUVJTaFVhREEwQ2R6cEcybUYxZlF3aFFVdjVNNDBTa2FQS05QZnRCUjBS?=
	=?utf-8?B?eXM5cmxqTW9JOTlPbmZHSmdMMFBhNXc0amxFYlM5Ly9PMVR4UTBBZDRkOUMw?=
	=?utf-8?B?TXJDeHIrMkNXZWFKd2dYbStNQUxkaHhKbXcyWnltUEd4ZXlyNUs5bjZtV2lW?=
	=?utf-8?B?UE9SeXd2YThYOWVoNTZITlc0N1l6WFlYNXpPRVNmNVgzZHJLOXVHeXU3Rzhx?=
	=?utf-8?B?OGtxVkZyZnF1SGg5OS93Y01XUWpjaHV3VVZIb3NBZU9PcmdSYjZndjV6U2dt?=
	=?utf-8?B?S1FoRjZKWFIzUVZPeFVkYlpBNjAwcXhzRDUvTmJna2lVU0VPKys2R3l4SEpH?=
	=?utf-8?B?UXVEQnlKUzBCR0hpdmVQVmlhMnNFdE81RWg0a2JieDF5ejVNRVBLeWNLLzNQ?=
	=?utf-8?Q?QYgxYO?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0691;
	6:VCVexwUkzBX7svwQ1sAWyHNurT15Smg4nfO8zPSfVt9joOK3hmYI7DMTXh6dBc6h8fOCR0lH561RWLn1QsyRN0qiqKbSJsw37j8PdcbDq5jM3Fqz8WZc0aBk4bXNPk26soxhfhCXOiEN7sie4IhVgr4hegEdR6NBqn9kudgqXnaOzA2v3SnZHDIIJE1tFT3wmiEoQvtnNlOEmfPH4rU8O7UAOvyJKUa+oxeQPWQXpKaDk8xjVDk+VakUgQpD+cD04HENIyrSGYzZeRqg7Hh6mCeJ8Bcp5yqR+yAEHlmvuEbEp3wy78vugveYR3nR2GRApbRBZFn46r6/Xe39WHPSyg==;
	5:XJUss5Ph9iC+ErjiQbVOsqczTeiQLGktYD9GJTLoyICUu1C4v+k96vnLr1kvEPs8ofitEMCmcK8KfK9BAU8cxDObjb8YUGifTF21Gb+UyduO5hW4+Xd+jPGp9hUcLtld9fzhMkfhl1sKBUe9dL4zDw==;
	24:B8hquHa9ydMYiXp2QmNWRBa4iQsPbSPvBIdXTlHFIvd3aMW1czotAufwBdjXpbw0UhlWpRP2wTrFhChn6cCnlXNBzk7GDAOYnY3SA9MMXYI=;
	7:6zyH5fWuX9dFv8wEg54fhhldCqQcgWUqXnXI4XxnBpP96Wd7kOpQ5kkJw/q6oeF4aX7ebNru8n1nkyjNg0fNqms7LS92hok9oxuJQ1nDciC8gF6KdaPRFyp7RjVAVeTId6ut9yNBmWvYNm/+6XWHrTg6GmqQKT5Y2CZPo9jRVOeLjr0jNUIuGz7ryTdqXmE67T90CZz7M3NMLh8v0lS1Cp2MNLm0NlUI+8jceujXHvU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2017 21:13:59.3019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0691
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-17_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1708170342
Cc: "josh.hernstrom@ni.com" <josh.hernstrom@ni.com>
Subject: Re: [PATCH v6] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Thu, 17 Aug 2017 21:14:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 08/16/2017 11:00 AM, Wold, Saul wrote:
> On Mon, 2017-08-14 at 16:29 -0500, Haris Okanovic wrote:
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
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_pipermail_openembedded-2Dcore_2015-2DDecemb&d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=0QcXD-YEVpGbAgVAWiuCmMnvCng6N5j5KrqqwqXHW2E&s=88YT5OEfyAkDMCqrZzRoGH6Z8DsSjP8nfCmrq4fronk&e=
>> er/thread.html#114122
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_pipermail_openembedded-2Dcore_2017-2DJuly_t&d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=0QcXD-YEVpGbAgVAWiuCmMnvCng6N5j5KrqqwqXHW2E&s=2NjYYuy80NctfYU9vcnLPueVm9rALs-0nFjVd5cnY8w&e=
>> hread.html#139130
>>
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
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_harisokanovic_openembedded-2Dcore_tree_dev_hokanovi_&d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=0QcXD-YEVpGbAgVAWiuCmMnvCng6N5j5KrqqwqXHW2E&s=HlNgsQzUBE7Qo-WEzXqkx8xf814iqTLQbr-EqAENFKs&e=
>> multi-kernel-packages-v6
>> ---
>>   meta/classes/kernel-module-split.bbclass  |  14 +++-
>>   meta/classes/kernel.bbclass               | 114 +++++++++++++++++++-
>> ----------
>>   meta/conf/documentation.conf              |   1 +
>>   meta/recipes-kernel/linux/linux-dtb.inc   |   2 +-
>>   meta/recipes-kernel/linux/linux-yocto.inc |   2 +-
>>   5 files changed, 86 insertions(+), 47 deletions(-)
>>
>> diff --git a/meta/classes/kernel-module-split.bbclass
>> b/meta/classes/kernel-module-split.bbclass
>> index 1035525dac..59f19f3de2 100644
>> --- a/meta/classes/kernel-module-split.bbclass
>> +++ b/meta/classes/kernel-module-split.bbclass
>> @@ -30,7 +30,12 @@ do_install_append() {
>>   
>>   PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
>>   
>> -KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
>> +# Default KERNEL_PACKAGE_NAME should match kernel.bbclass
>> +# Redefined here since some recipes only build modules and therefore
>> +# don't consume kernel.bbclass to get this default.
>> +KERNEL_PACKAGE_NAME ??= "kernel"
>> +
>> +KERNEL_MODULES_META_PACKAGE ?= "${KERNEL_PACKAGE_NAME}-modules"
>>   
> Sorry, I missed that you sent this on Monday when I replied to your
> "thoughts?" question from V5.
> 
> I think we should really be checking if KERNEL_PACKAGE_NAME is set
> already when you use it and default to kernel if it does not exist
> rather than having 2 places where KERNEL_PACKAGE_NAME is ??= set.
> 
> Sorry about the timing.
> 

Np. I removed a second definition from kernel-module-split.bbclass and 
applied the default of "kernel" in the two places it's used. Clean 
rebuild of lttng-modules, linux-yocto-tiny, and linux-yocto still works!

I'll post a v7 shortly.

-- Haris

> Sau!
> 
>>   KERNEL_MODULE_PACKAGE_PREFIX ?= ""
>>   KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
>> @@ -129,16 +134,19 @@ python split_kernel_module_packages () {
>>              postfix = format.split('%s')[1]
>>              d.setVar('RPROVIDES_' + pkg, pkg.replace(postfix, ''))
>>   
>> +    kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME", True)
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
>> index 7670c7107a..0760bfb2c9 100644
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
>>   PACKAGE_WRITE_DEPS += "depmodwrapper-cross virtual/update-
>> alternatives-native"
>>   
>> @@ -32,11 +35,32 @@ KERNEL_VERSION_PKG_NAME = "${@legitimize_package_
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
>> @@ -53,22 +77,22 @@ python __anonymous () {
>>           typelower = type.lower()
>>           imagedest = d.getVar('KERNEL_IMAGEDEST')
>>   
>> -        d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
>> +        d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
>>   
>> -        d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest
>> + '/' + type + '-${KERNEL_VERSION_NAME}')
>> +        d.setVar('FILES_' + kname + '-image-' + typelower, '/' +
>> imagedest + '/' + type + '-${KERNEL_VERSION_NAME}')
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
>>           priority = d.getVar('KERNEL_PRIORITY')
>>           postinst = '#!/bin/sh\n' + 'update-alternatives --install /'
>> + imagedest + '/' + type + ' ' + type + ' ' + type + '-
>> ${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
>> -        d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
>> +        d.setVar('pkg_postinst_' + kname + '-image-' + typelower,
>> postinst)
>>   
>>           postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + '
>> ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
>> -        d.setVar('pkg_postrm_kernel-image-' + typelower, postrm)
>> +        d.setVar('pkg_postrm_%s-image-%s' % (kname, typelower),
>> postrm)
>>   
>>       image = d.getVar('INITRAMFS_IMAGE')
>>       if image:
>> @@ -126,9 +150,9 @@ base_do_unpack_append () {
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
>> @@ -371,9 +395,9 @@ do_shared_workdir_setscene () {
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
>> @@ -388,7 +412,7 @@ do_shared_workdir () {
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
>> @@ -486,28 +510,28 @@ EXPORT_FUNCTIONS do_compile do_install
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
>> @@ -521,7 +545,7 @@ pkg_postinst_kernel-base () {
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
>> @@ -604,21 +628,27 @@ MODULE_TARBALL_SYMLINK_NAME ?= "modules-
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
>> @@ -628,8 +658,8 @@ kernel_do_deploy() {
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
>> index 35b9103b4a..e061b98de3 100644
>> --- a/meta/conf/documentation.conf
>> +++ b/meta/conf/documentation.conf
>> @@ -248,6 +248,7 @@ KERNEL_IMAGETYPE[doc] = "The type of kernel to
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
>> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-
>> kernel/linux/linux-dtb.inc
>> index 0174c80d85..da6467bf9f 100644
>> --- a/meta/recipes-kernel/linux/linux-dtb.inc
>> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
>> @@ -4,7 +4,7 @@ FILES_kernel-devicetree =
>> "/${KERNEL_IMAGEDEST}/devicetree*"
>>   PACKAGE_WRITE_DEPS += "virtual/update-alternatives-native"
>>   
>>   python __anonymous () {
>> -    d.appendVar("PACKAGES", " kernel-devicetree")
>> +    d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-devicetree")
>>   }
>>   
>>   normalize_dtb () {
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>> b/meta/recipes-kernel/linux/linux-yocto.inc
>> index 637506a2a8..4e0ce029da 100644
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
>>           d.delVar("BB_DONT_CACHE")
>>           raise bb.parse.SkipPackage("Set
>> PREFERRED_PROVIDER_virtual/kernel to %s to enable it" %
>> (d.getVar("PN")))
>>   }

