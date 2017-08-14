Return-Path: <haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id A687C783B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 21:29:13 +0000 (UTC)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v7ELPmMR029458; Mon, 14 Aug 2017 16:29:11 -0500
Received: from nam01-by2-obe.outbound.protection.outlook.com
	(mail-by2nam01lp0179.outbound.protection.outlook.com
	[216.32.181.179])
	by mx0b-00010702.pphosted.com with ESMTP id 2ca453dwyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2017 16:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rT41cR1pRdkUzbM/T0F/9Os+CKJYW5LnGw/8Gvp37F0=;
	b=Lpzvr4Ds5J7PLMAEZEXve9bTnxiJRfE5Cl4bCDh2FBGjbAIN1ORBirgrr5yFkp80l6cv3CqTNlA8ZMGskYhV7ZKwSX7sEGLWz62B15UyMCWK7UuBx2Zs1LBabIzHh8Zr4sS2K4JceQE7Hq0ZxcUQmzPZmV/dn0BZDVWUrnTyeh8=
Received: from harisdt.amer.corp.natinst.com (130.164.62.171) by
	CY4PR04MB0697.namprd04.prod.outlook.com (10.172.137.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1304.22; Mon, 14 Aug 2017 21:29:07 +0000
To: "Wold, Saul" <saul.wold@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20170808153020.17537-1-haris.okanovic@ni.com>
	<1502231583.24039.62.camel@intel.com>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <d32f322f-9d78-84a2-1caf-7b0370fa9ba4@ni.com>
Date: Mon, 14 Aug 2017 16:29:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502231583.24039.62.camel@intel.com>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: MWHPR2201CA0050.namprd22.prod.outlook.com (10.172.59.24) To
	CY4PR04MB0697.namprd04.prod.outlook.com (10.172.137.14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83ebce56-2fcf-4dea-00e1-08d4e35b7f51
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY4PR04MB0697; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0697;
	3:NzVH+iywB0RmUabUxIslNW5k3xUIGEpA2+uVlDv4t/KIymRTm0i5rgXBt6SitMklJ41gSS+BWzg7q3oX5F1rnHrOYT2CFf+wLFrN/uDvCgeFSiCs9V6cdiOZ2bSMTHrxkHLhUnmzMYv2Qhgoxz+oD9utizpuFHlHo4PtMtILSD0AGP6knK7b5cI/Anxu8ISheIDqc+5GJ1F/DgckQD8H/RzRfD3ZIp+K9WXvBh7Yub2ixIDAYrpHg9brJCZ0+Pr0;
	25:8O0fXTVJld1MpCW/JSJw1BDv4I0lfoN27U+YUtM3vmz7YJ/gGeqo27+VwzF2vNoRvq4D1WiF3yNYPJ5rm4/TExhKV902ntlQLtM7uDwSwUyx/hK9YTiJLkamC8iDuAXMKAiZx8Y7OAHGvCqjXU7dMX7EnjxSB+HazO11szy0LatPjA4XfH581eq0yid/PkqmYsWRsoDDWNqxkqO0hYmxdKkBZhq/VY44MIK5ta7WS/VT4gm7ObNEwXb2MwKpFp7o+FWM0RdA/jQBC0oYND4h8pXQCLCyXUSc9eVssx8fCOIrIyuDXR1Hcz5H3jP5FTmnQmb4B/+gQrz8U0oF1K2dhQ==;
	31:TKwHwgU0G2hEvIkXzVeb6F+b3HUQU1WFe2Z7oQ0mVPNR5X0W72JWcNXtqdGoYJLb2nIg9ekQ4FZZjIB5c6Rj0dyRPpaCK4NA8KdlcNxSmcYEP9s+tUdJks87xoFz7cGbNL97dsqheoZSc1V1mQwi2wlr9UvHsUMh2CKEejY/V0w/7Xn1whlpktzxPX3UIwRXi0hGKsrQQzv1JBt1+IBuyfl1wChrz0sAiQdz/lk/Huw=
X-MS-TrafficTypeDiagnostic: CY4PR04MB0697:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0697;
	20:/euJJxWBi4Pjc8SKy0RDnq0he5pApJm4jMvM6lQwXLbWrX2sQmfyDWwfhJm/fRXfEdgTgmSfo56Lb0Xq0O+ItL0aruPGCCfyd2HuTDWSNfd2CP1qrUs8oi/YocYCmklT6L2llJzRb5c/Jzm4RCoq//jmFjIm9iqgbNiG5CpCIysnYfS4w5lLYO37fHv95Nk6GmGoUSaXkRHKGU/+hkjc2x5hNSIpLMKFIh9g+fuBwJCwjlTxyFo+id0Vry2fNppDQw653BMTgCaqes1a1YUbis2WEEpEfMbT9PGEERbu7HGwkK9ZF7YGlx8uKhm82mx40LJQl26Suqe8ChGTdceUUy9xvJbumtbFzSZf4lD+A7+OVslj1GZpBfqjWh4T022q2UA4tKf2oVuNBZc5UVnLe1Xn3kOUbaqvlQhUjppoMUaY82sH6hSRGeNxxjQKw6D/xuAQuW+OE8DXp6exPVq+dOY5Eg0DplVqx/UTyscg6wC1zxy3rGuMngxGfkQLjngh5oLYQtNRO20f2hJin5wuq2kQ4DYhkGdJ8CzrrYDYz6oWGMgao/d8QP93EZK/JjcCRkkecD+/HnFv5dRp8qSYsjtYpzwqnVY3lHpL3aUOprI=
X-Exchange-Antispam-Report-Test: UriScan:(20558992708506)(10436049006162)(788757137089)(145744241990776);
X-Microsoft-Antispam-PRVS: <CY4PR04MB0697B49B460E34896F5C4AD4E58C0@CY4PR04MB0697.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(3002001)(6041248)(20161123564025)(20161123562025)(20161123560025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR04MB0697; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR04MB0697; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0697;
	4:3H7WDryAcZrg6bfgPy8NuwHBAU+ZaAMjYqyG9qS/R4VgBl/9iQoyHWuw8RvpjTSeW+7UN+o5ySrXOgA+qY1aKLDlZ88HLM+I5ZiXtZJzck8Saoj3HRH8Ox3qWQcA5PnHaD1QyU8t2mVJKChCYzJxZcctn3q3GQjlyRFkX1410g4qE2evicMejC9sOJk++RdmuCdUNKd4JR2gOnmXZAcwWKopiGSb1qey6BZvXRlQ4msF8TS2cBOwI4GA3SYyXdP6+4Fwu+7baIVQlTHwgi5Xi43MkM4A8BzNHOQo+8WZ6kZOVuF1f8A5iLnFC7DvvRwrufyF35nlLQ+d53himuner3O6AhIWbYwGaTaqMIwqQmoHxkm56iObCD7PlUAHqgeqrBOvKB97kGt1l3++LQeiMw==
X-Forefront-PRVS: 039975700A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(7370300001)(6009001)(43784003)(199003)(24454002)(377454003)(189002)(377424004)(305945005)(65806001)(83506001)(47776003)(23676002)(4001350100001)(65956001)(478600001)(65826007)(66066001)(36756003)(229853002)(6486002)(53546010)(25786009)(86362001)(575784001)(64126003)(7736002)(7350300001)(33646002)(50466002)(6666003)(2950100002)(189998001)(3846002)(345774005)(6116002)(230700001)(50986999)(6512007)(6306002)(2906002)(8676002)(101416001)(966005)(4326008)(106356001)(81166006)(42186005)(97736004)(2501003)(53936002)(105586002)(81156014)(6506006)(6246003)(76176999)(5660300001)(68736007)(31686004)(54356999)(31696002)(21314002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0697;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjA0TUIwNjk3OzIzOjNmL2JtLytwUHJCKzc2MDA3d3FxRm1iYVlW?=
	=?utf-8?B?SlVsNkdzU09NUGlqZXNpd2RqaERReTJTbTVMNjhZeWszU1lXc29FRWVDTTlu?=
	=?utf-8?B?Y2xZcHpjVEpQWXQxTG5sbTF3MEMyMEl3aUpKaDdza3J1bC9ZTkFHWTA2dDhH?=
	=?utf-8?B?S1IrMWI1OUZpU1dnMk5uZ0lPdFZUZmdERmQrbU1aV0VMRnBhamwrWlprZWhM?=
	=?utf-8?B?VXUxMllLeEoxUTVsSU1nVWtlS3J1aWZGemxEdUMvQlBoNk11N3FpcGFXWEU5?=
	=?utf-8?B?VCtFeFdqL2I5MWorWUt2dkozUnZ2Z0JubWlVWFlXa0ZyUUJGSldyMDBxeFhv?=
	=?utf-8?B?R2FneEZ1M2YxaEFZMWtidTB3MW5GNjlzUksxaGVNQVdmVzN6V3lUdGdPRng2?=
	=?utf-8?B?MXhxcWlkY29ZcEpwN0NaTUF5angwTnRFb0o2SGQ3NkJ6MlphZ2MrbmZmeC9s?=
	=?utf-8?B?bDl4ZXVpMnpJM2lkWnBhQTRyWlNPV2xJcnhWSDY4ZUFtcy9lSWQvQU5pZ0pk?=
	=?utf-8?B?MG4vYU9DZTczd1ZxV1NIUXp5ZjZCRFk2OGZZbmkvTFEva1kzT1BWVnQ1MW56?=
	=?utf-8?B?eFhpQzJIemRFRFA0V3BkYmhkaVVCaCtYSTJOc2U2RUFKL2FjN2pjMWt5bWUw?=
	=?utf-8?B?Mnd2am1EamFNallDL20wSForQjlqOWJ1b3BlSU9mbFZmN0poSW9tVm45YjBn?=
	=?utf-8?B?M3hHOGVTNE5wdW5BNkxkNmd2amEzQWRPOWFiWHpuWngzUjRqNVVabzJCdTRF?=
	=?utf-8?B?YURCUnVPM2QxYkd0THNreTlyTzczd0dFREZjREtyWWdCSCtFejgyYldRamV4?=
	=?utf-8?B?dU04azZXZnM0WkM3Y2gyR3FYSWkvelJhYUZKV3MwR1Exb0ovN1pUbUNzOFNS?=
	=?utf-8?B?SWN5Y3JwY0ZDUDg0RFJvQjVuWGh3T2syUUloRVBvakJSS2VPRmJZaHRXUGFG?=
	=?utf-8?B?QmxSYyt6RnBhMDY5QzB0Y1ZoQ3hDWU5XZFpDajEwSlJwdzRJdFdXWWdvUmQ0?=
	=?utf-8?B?UXJOdmhoWThuWkNqQUZsZWxwd3dJY01GeUIrRytQcExURWhxWnNCM0xuOG84?=
	=?utf-8?B?Um9nS1hQTEF1OGpmNmkyeUYvVXlFN0xxWkE2bnB6NUYvd3Q5QWFWc01ta3N1?=
	=?utf-8?B?NXIzSkVNNEJiMkVISjF0UnVsQ3lram9UcDMrNGR6KzYzblBQdVdua3BwdXdt?=
	=?utf-8?B?bm5XRGVXVjdBbUFwUnpYdHh5VnRmRFJNZktuZkRRM0psMzBtRndJNlhYSGRN?=
	=?utf-8?B?SUF6T3l3dFp5ZUoxeXhHV1ZWNk1EWEZ6YVI2Z1l6a1hYV1hlcFFWVWoybkdy?=
	=?utf-8?B?bmlvVmpITVVvckdTTTJhZUFLenc1c3oveUpDV1pTTE1UdTVMRU9xSGx6Rzh1?=
	=?utf-8?B?L1cvdHNVOTdaejRTQ2VkcjR2RDNpSUNndE9zQVRXdTA5L3ltS1B1eW0yODlG?=
	=?utf-8?B?VDJ3WWVFdzZIM2Y5azBxQ2lUVCsvc0dnSG5rby9xcmtsc2MvWTV1REh6Zi9o?=
	=?utf-8?B?RU9ieXR3WTdYVHRJZSthR0YzZ2lOTFU1ckphQUlMNytPMVVHUzc0UWZGSXRU?=
	=?utf-8?B?Z3dzRUN5bmJJWkdueDZOclgxK1ZvOWt6RVI4VU5xN2ExUkhxYXU1K3ZkZUZB?=
	=?utf-8?B?SDdCTDk1aTY4RzRIMTMvVnBod24veWF6TjVaUGo4WCtqM1FCSjdrTnA0QXJP?=
	=?utf-8?B?RVJBeGNkYlVQRlBPMGRkVEwxdUFlUDhaZzVoRElSaVN5dzVOUlFSME5GNkcz?=
	=?utf-8?B?T01Rdmp5UGx6WjcremhVV3gyQ3I4WmtCZzNxNGJHMW1qbjdYRHUrWWtieGZE?=
	=?utf-8?B?aGh3elNiSUc5c1dSZk4wWjZpZHdTRE96OWwxcGxINFM2c1duOVZrT0tNSEE3?=
	=?utf-8?B?L2FZblRlbmJOZVVsb0l4L2dzdXM3aVI5TStkbVhhS3pUN2NkSTU3MzVsNXlj?=
	=?utf-8?B?MjRsKzdzWFBnNW1KVklXaXIvbFNEMnhYNHZ5Q3hYK1hvWTRNUVNIMFFCS01J?=
	=?utf-8?B?bGJHNTRmRk1TUnFVZ1J6RTB5cHdtNXdLaDBTdz09?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0697;
	6:VT8gu0LLvb9jJr4Z7HycDmX+3lS+ooNQCEhaI8tgSUMt/uEnsNQCB373PvMzN+z1uY+vMkrUV8NLv+ls+E14hwcBXR5/jMeRZ8+R0q/NTVORvxbPy+mBRc8DxVsV74FuKGUr4Xrx3CBJ9FLBiysn54o3CLpLr0hQowbeeHOmAAwCTT3mPruslW2IfkSoW9lEpD/K9har9a0Ha8kQ4yInaUJhB0ikmKoO4zHgBQ7BMCWXrWCRyf/5o3k0SSccSfOnZWzFcDOS9NyUxeLbRxYiMrwFrMjw2FnHwUpU/DMEyMLkTheFVcEut9c55FjIdIGZ0sREw/SK+gdQt+xzKqOlRA==;
	5:iRxVvgM+QR5BKyuKYSU4Eoe8dd1mCc3PQ8f/BWY6vYSzYzLpzXgP0Rba4MIATCHyxnp8I044pyPse9oPbyQqlIH3QBWWzAhGTgsORbN4N565hiEq0sq3RyFVk37f2WjwWToCl5iThNZkz/Nspavqnw==;
	24:+zKY+bOs8HpLkc3dCjrryswR4u0U+kDr69+SRYaAyi1Z/QZvrBA9N3qxHuEG25qGPrI0F2g2sJ4ZLAIseBIWhggYqDi131eWl3Q+7fCR6w4=;
	7:wVywV4pLHvKXASG8ZXMQoDriaYHN8yFxqg6iNNb3SnGHeJd0J6QcJc5raVVHfp7hETEqx1l5dJ9OUFZTmdD/4liKvw20HvU24AYRW9r9oRof9GrrjbXVH68OfkhK9i05IBLEGZCi1fISCpbuPfbY4qfCD1FBt5LO+5rgB5qhK35RcMx58o9fP1tFVBiuWZHWIhSJuxRHYqjon4TVTubZvIgKrvCaGVQlbdLHHhiYPTM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2017 21:29:07.7421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0697
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-14_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1706020000 definitions=main-1708140352
Cc: "josh.hernstrom@ni.com" <josh.hernstrom@ni.com>
Subject: Re: [PATCH v5] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Mon, 14 Aug 2017 21:29:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 08/08/2017 05:33 PM, Wold, Saul wrote:
> On Tue, 2017-08-08 at 10:30 -0500, Haris Okanovic wrote:
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
> Thank you for continuing to work on this.  I did a simple test of
> building a single kernel and lttng-modules without your change and then
> added this patch and tried lttng-modules with no additional changes to
> my local.conf, just regular single kernel workflow.
> 
> I got the following issue:
> 
> ERROR: lttng-modules-2.9.3-r0 do_package: Error executing a python
> function in exec_python_func() autogenerated:
> 
> The stack trace of python calls that resulted in this exception/failure
> was:
> File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
>       0001:
>   *** 0002:split_kernel_module_packages(d)
>       0003:
> File: '/srv/sdb/releases/master/meta/classes/kernel-module-
> split.bbclass', lineno: 139, function: split_kernel_module_packages
>       0135:    module_regex = '^(.*)\.k?o$'
>       0136:
>       0137:    module_pattern_prefix =
> d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
>       0138:    module_pattern_suffix =
> d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
>   *** 0139:    module_pattern = module_pattern_prefix +
> kernel_package_name + '-module-%s' + module_pattern_suffix
>       0140:
>       0141:    postinst = d.getVar('pkg_postinst_modules')
>       0142:    postrm = d.getVar('pkg_postrm_modules')
>       0143:
> Exception: TypeError: Can't convert 'NoneType' object to str implicitly
> 
> ERROR: lttng-modules-2.9.3-r0 do_package: Function failed:
> split_kernel_module_packages
> ERROR: Logfile of failure stored in:
> /srv/sdb/releases/master/builds/corei7/tmp/work/genericx86_64-poky-
> linux/lttng-modules/2.9.3-r0/temp/log.do_package.80115
> NOTE: recipe lttng-modules-2.9.3-r0: task do_package: Failed
> 
> I believe the problem is that I tried to build lttng-modules standalone
> and so the kernel.bbclass does not get involved to set the
> KERNEL_PACKAGE_NAME default.
> 

Correct. I mistakenly though everything relating to kernel builds 
sources kernel.bbclass.

I added a default KERNEL_PACKAGE_NAME to kernel-module-split.bbclass, 
for the module-only case. However, I'm not sure if there's a better 
place for it. Thoughts? (PATCH v6 incoming)

> I see that your procedure above works for.
> 
> Thanks again for your work, sorry I am finding interesting issues
> still.
> 

Np. I'm glad we're resolving all these issues up front instead of 
dealing with a pile of bug reports!

> Sau!
> 
> 
>> Discussion thread:
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_pipermail_openembedded-2Dcore_2015-2DDecemb&d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=iuC18jvFNmy37KjmclOXXAfHiXfxfSi5MfqscPB9ips&s=IkiycfArbVDluMaryQbZLW8sYavV651AD-nHbJYSXEw&e=
>> er/thread.html#114122
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
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_harisokanovic_openembedded-2Dcore_tree_dev_hokanovi_&d=DwIGaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=iuC18jvFNmy37KjmclOXXAfHiXfxfSi5MfqscPB9ips&s=fxS_f3xD-AUKt4mPcvNNA-I1eyvs30_Z30sVQwdRlqs&e=
>> multi-kernel-packages-v5
>> ---
>>   meta/classes/kernel-module-split.bbclass  |   9 ++-
>>   meta/classes/kernel.bbclass               | 114 +++++++++++++++++++-
>> ----------
>>   meta/conf/documentation.conf              |   1 +
>>   meta/recipes-kernel/linux/linux-dtb.inc   |   2 +-
>>   meta/recipes-kernel/linux/linux-yocto.inc |   2 +-
>>   5 files changed, 81 insertions(+), 47 deletions(-)
>>
>> diff --git a/meta/classes/kernel-module-split.bbclass
>> b/meta/classes/kernel-module-split.bbclass
>> index 1035525dac..9716c5937b 100644
>> --- a/meta/classes/kernel-module-split.bbclass
>> +++ b/meta/classes/kernel-module-split.bbclass
>> @@ -30,7 +30,7 @@ do_install_append() {
>>   
>>   PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
>>   
>> -KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
>> +KERNEL_MODULES_META_PACKAGE ?= "${KERNEL_PACKAGE_NAME}-modules"
>>   
>>   KERNEL_MODULE_PACKAGE_PREFIX ?= ""
>>   KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
>> @@ -129,16 +129,19 @@ python split_kernel_module_packages () {
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
>> -- 
>> 2.13.2

