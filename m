Return-Path: <prvs=05646081c1=alex.stewart@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 0B1556093A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 20:09:03 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w0QK6QP7027444 for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 14:09:05 -0600
Received: from nam02-sn1-obe.outbound.protection.outlook.com
	(mail-sn1nam02lp0016.outbound.protection.outlook.com [216.32.180.16])
	by mx0a-00010702.pphosted.com with ESMTP id 2fqv3ejgnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 14:09:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=bxcbdbOPIZbNM534WQupleLosvWHiZOO7oLkVWocd6w=;
	b=j0b9Zr78U25QSD9AK01rGEZCt0oc2ZK0Y3HowbLL0swioee9DG2WCGsYApDO74L4wLqZHDkQQM8WD/HsssrwyKZYOvCSEJYvWjZI91tEgWpiD6bqFomkf9jTFREGOJ9xbiaqxQuKLJPJyFoTzz+cYOio9dHNkG49OgPQUl5F8AQ=
Received: from [10.2.72.94] (130.164.62.179) by
	BN1PR0401MB0964.namprd04.prod.outlook.com (2a01:111:e400:4d::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.428.17;
	Fri, 26 Jan 2018 20:09:01 +0000
To: openembedded-core@lists.openembedded.org
References: <20180112130644.21313-1-alex.stewart@ni.com>
	<CABcZANms2fcX1rmeY_vGsCmMcxhicCKEtDs0mOaX8uCt=8fgLA@mail.gmail.com>
	<8fc59c03-627a-78f3-70c7-cbcb97f90c60@gmail.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
Message-ID: <43e0601f-1368-e337-cff2-dae5d662c83d@ni.com>
Date: Fri, 26 Jan 2018 14:08:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <8fc59c03-627a-78f3-70c7-cbcb97f90c60@gmail.com>
X-Originating-IP: [130.164.62.179]
X-ClientProxiedBy: MWHPR21CA0068.namprd21.prod.outlook.com
	(2603:10b6:300:db::30) To BN1PR0401MB0964.namprd04.prod.outlook.com
	(2a01:111:e400:4d::14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 766f7fbb-b401-47da-0753-08d564f8a477
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:BN1PR0401MB0964; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0401MB0964;
	3:jaEHYjsdjgbtNKMkaa04Aark7XU/MVq31urdnWyI9+CSCt3Vvoe9c9lAEsT4jsrlHyqp66N/WQMogYs4uAc8YIj4d5ZVp/DSLzwSqgr+NCDZZ9wxpZW3EG+PZCOK/y1wjgpiKZ0wIkDKaTrzSHN0quC5n4meyQJ2vXjnO3ol5N1gKe3dSczHcrp6H5xLeXiuO3e+VlDYDwdN59Qu0GR59pAcD+Iuifmh5xVZH0pzqPd2Pzvi1/vzuAGEJZXHnwIC;
	25:DYReywat5z1QPYY7DLpQcXEHLTrmapEDsMTZ6yJMMQDe5Is/QgN7TPxP3cefv0lAH8WQTwHwbsnTCzc4wvspR+GQdJnpNW2DBuYBBvm+I53l7NYQLYbcJGsFhTlKNMJ6AgpEkHEx9yNggXYz3e9tiw1raxcltdvDKuZPHKdofIzLUj0kK9QTPTdgdfjPIpuEW7tofzIY6aG3gL4NytlwAPKONEP4OeZYaQf1otchlV11z8/tY9UOPbdYfexbk2podAVnBOGqA2lkB6cA//w1/6XqHWDfO2Yu3dzVkg8jrMpBRKFk1Qs6Vs5oOXg84BRD2ItLAOF0+nyeBxRadgO38w==;
	31:saj9Bd9S4y28Xb3GhUbtlCcxpf8qa2DyLtk92Or1imEIFHEDZb0mBJzfLiJhruJl7j725UQSWWI1kWyNx6Zd46+pGpMnZ6K95RQOtBIYN6LvzLdPI/pV+Bfu8CIYzmCfXLmhYOx4c1MbZqME5DoRidZfB/INfNkfbv19KAr7hncSQTl/R6wcaDGvZ89137lEhPVG3auaSgnytzP6N6Q1N+zIkjOtOhLzKZ6TgsfLj74=
X-MS-TrafficTypeDiagnostic: BN1PR0401MB0964:
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0401MB0964;
	20:QDrWdWNNqa5Tn5Q4uqgmQq3BkIeBSjlq2ItmP+Ihv2iK1eCWkkMh7+P7HMYyUBpsvnBJ7Sg4gtkWymwevuy2oX7r0+/X6gnCpEHD6zbvwtycNLWRn5PqfOOVEkyRWKLzJiMrrua1kLGMN0j+sp+lJQDk0mc7lkSWGr9JxKVOwyjBiAN1saha8tT/cdKAPwyLc80RxRdG3VnahdERmqd8da1l9LeCdQWjYD13oiweVq5snTuQ9AtyNc3KEvBnMXCKJadXlFPRTufCNfP9XbB6OQmqV1NrMi/1s0vz+/HoCK46SIaF272DQU0C2bEmrK3Tfi/nqQma59SifR/QLrqbHD5l4yU5kuvTPGHJ34MewSVjqWY/wKMK6G/FkBqhDw9hDTEdM1P1tgQAff1BYdr8fvCatb1Whta07KQE66C+F3Jnqf8dKjL94AQznan2V8kdC6llSjvM9UySYUbeNeWZsgzCV6KWpuE9MQoWnkZUKHmeIizmy23RhplhX1ADEzcHBpblUHaPtwWSzEzYktI1oGcSHaIB7es1JA6ZgNAiYgnqeAdAMtUvOJb+e+PqopaFTlRMD2QdCYUqzMZb1ZW4wmEd89vRPt7pQ3bt860RHys=;
	4:/bgMHsWti9PlFlVq7MnTEoCqKt0CLdeF3HLwwTYx5zPjGNmeXVu/vyX0AZAlRJ2967hqR+puW7Y2jyZraZt97QFYkI6kujmE42GEGALs8Qxtc1J1v1bun7R7aED/CWbeuM/0GINbySF8YZ4X370FrsiJUczIwMN26BLeCA60wvqiy9tXNZ1k3c1p6PMonqT3XThdY8Hh2UEc7mjz0RQWxQqQAG/N/ltgDn7wOxX5rlwjDoACrCPcR6VrdmOZf3VCFHc6iOtl1gVD7+m3K7/KSwWBBFcAIr+0J6KjftPCgq3RvN3UL4HSzxahl0/pGWER
X-Microsoft-Antispam-PRVS: <BN1PR0401MB096443219A1D1D20CE69A6CFFEE00@BN1PR0401MB0964.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3231076)(2400081)(944501161)(10201501046)(3002001)(93006095)(93001095)(6041288)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BN1PR0401MB0964; BCL:0; PCL:0; RULEID:;
	SRVR:BN1PR0401MB0964; 
X-Forefront-PRVS: 05641FD966
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(376002)(396003)(346002)(39380400002)(39860400002)(366004)(377424004)(199004)(189003)(83506002)(50466002)(53936002)(2950100002)(36756003)(97736004)(67846002)(6246003)(16526019)(81156014)(6486002)(8676002)(186003)(65956001)(81166006)(6916009)(5660300001)(47776003)(86362001)(65826007)(65806001)(66066001)(25786009)(53546011)(6666003)(3846002)(6116002)(16576012)(316002)(26005)(64126003)(2351001)(5890100001)(8936002)(229853002)(58126008)(31686004)(2361001)(105586002)(76176011)(478600001)(2486003)(36916002)(23676004)(7736002)(386003)(77096007)(2906002)(106356001)(2870700001)(68736007)(305945005)(52146003)(52116002)(31696002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR0401MB0964; H:[10.2.72.94];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjFQUjA0MDFNQjA5NjQ7MjM6VzEyWFBtcTloQmcwUDI2OFE3K0g1RzQ1?=
	=?utf-8?B?L0RFYkZ6b0hvUnJSbTZsWGIySGd0L1lEdDdqbjI2eXBySldETjY0TXNXZHZz?=
	=?utf-8?B?b2RzL3FKQlZTSFRRYUtBZjhJek9VWDJ1YUcwelg5bFBFaVdKRnAyOWE0STh5?=
	=?utf-8?B?NWVJNW9qYnZKaHJXU0U5NTJTUkxoaFFiWXlTcnFzNGRzcnBNd3oxVitZRXJp?=
	=?utf-8?B?MTdQbGRGZ1JWaDVmNUxKV0NqL0FQVWVhUUE4dTBwb0lzR1FVN25ERTcwM0Rk?=
	=?utf-8?B?QlR1NjFEQmdiUXNES0NIbjVtbUJsRGpHR2JKam1CTDFlc09hdmJxWWZGSHA5?=
	=?utf-8?B?Ty9MM2NHR3RjYjZVcExsZXpRSWNwRjBJL2dpV0g4ZTBSbVhUMnVXV1FObFIv?=
	=?utf-8?B?a0pSamhqNlAvNlJGZjhvL2VndnRrTGo5aVV5d3RZOVdCSTlvWERhU0lETVI4?=
	=?utf-8?B?R282MzR0OXJqSVp5cFN2dkxsL3JhbE5kZnpNN3lQSk1RQ00zckVhRW8rWjN5?=
	=?utf-8?B?clpiejNQWDdEd3BJSGpnYm0yMXVaNnF4N2F3bWp0bnNaVTlkVUs0aENieW5G?=
	=?utf-8?B?ZlZ2cGZoSUl1bi9JeDd2TVNIazVIOVZyVkVaVVEza3hTYjd5STJYb2hoLzIw?=
	=?utf-8?B?WXhXbW5RV0JaMFZvMUFwMjJlUURBYmNnMjI4SDFlcTFvMzI1bXV5bmV3UUls?=
	=?utf-8?B?eHVjMk1wVjhlMHhlK0dLRm40dmJUSm13dmMvallHdDMzTDRURWZQTzlneCtN?=
	=?utf-8?B?K1F3dFlwSHp1dlk1a3ptL3FzSzIzVFIyN1BuQzRtM1MvN3Z3ZGdEYnJvZm5I?=
	=?utf-8?B?cENubzlza01RMnN6TkEvK05uam12Wkl3R2NialdWOU5wWXRYeDBhSG9uSlhw?=
	=?utf-8?B?WFdzd2Evbk0zbjJlQ3YzVjNpSlNVTFM0cWJtSHc2cHQ0R2RkK2hpbG1kVjY4?=
	=?utf-8?B?MjE0b2NndDE2cnJPUUlGZlM1NENFYk1lSkZQek96ZWxyT0pFV3dMeGdzbWpV?=
	=?utf-8?B?am80TFhVUm82anFRalBjd25zc2dodEhINlNmY3plNWduSGRxSFBFMC8rZFJT?=
	=?utf-8?B?ZGJOSG9YUWxZcGdESzlKWTd3cDJSY05WOFhvZzdSK3RQTFFrU2wvelRER3Vv?=
	=?utf-8?B?bjQvaFpQY1UvWlhYZTdhVDZxeEFHWlNzbFF1TXRxQldObEJqUGIwbytSYXRU?=
	=?utf-8?B?c1VoWFBkZldzTzI0Rmt5OVNXaGhlcnFhaU1WaS8vY3ZzSXhyTFdtVEZuUXQw?=
	=?utf-8?B?Zjd3OW9HMjhCblJWTUYra0lybk5SUkpmVUdnT0hnN2krc1U5WE1FclZRMEIz?=
	=?utf-8?B?aVRVd3RwM29pSmM0Z0ZrTzVMd2k0UTBvT1ZKRWNYc0hBUzdJdmRiMUVlOVdX?=
	=?utf-8?B?YkJMblpqUldYM2dOaFRvSllqOU44THRHYytaTy9ramtuY0pCRk9ieGt2ZXB3?=
	=?utf-8?B?Z2hGdkl4b045dWJYM3k5RmRTaWhPcjh2Y0FJNmlSa0swUGpIblM2aUhMNzc3?=
	=?utf-8?B?M3phVWs3dHhGK1JrVjRIVThSdE5TWGJ0WU50enZuVENuVWRUektKTjBrTzJJ?=
	=?utf-8?B?bWJRUDhtNU5PYmtHeGJXbDNQYkY4S1ZwT1QxVmlqMkdibWNtNk4rb0tJNUZw?=
	=?utf-8?B?TGhmdTVBckhtQXRZOVBnanlyZFNXRUJBYmswT2hoUzRyLzYyQURYcmVpNEZV?=
	=?utf-8?B?MkFZcDFoUFpkbnBWc0R6azlQYWFIT09ESllPb3JqQnMrbHJ4UTFUZGxNUmlU?=
	=?utf-8?B?L0VTRWJ1ajhUa2ltM3ZrSm1Kb2VzTkhKa2xCc1o2TGFVM3Fad0hQeG9BNURP?=
	=?utf-8?B?eGFmb2M5am1Zbk5KTnpPUStTSnZwZnlCaVdMcFlRdzRjRjR1dVljR0dldG01?=
	=?utf-8?B?a0Z2bm5tN3BtTzlYL2c2aEJRUnBySGtkanJwZWJLQVZBRDgzRXo3MHVUMHBS?=
	=?utf-8?B?U0RCN1lhSG52R21sRlVIb2l5Zmg0M3VNSllSQzJuQVZnOG5NR24yZzJndWly?=
	=?utf-8?Q?MkUqmizl?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0401MB0964;
	6:/qctD7hKbEHyUYCiMaVLA/7fsaLyretkxSQ/Hde2KSQP8HaLNg+MQIxYmCGx74OoAtLNQ3QwuJHvLP92cW64WlWxXBqXg3eikzFB1uSr4CUMsEs8Lnh/njEqJH40rAIXAxPDXCym0q12PjLPfNdPGn54I/fj/59zc1YnpPRotk+ingKjNLAOrGp9ZYDsG9d+pN6s4kAa3tfYDm75HNlNkre4lZUC3GLXxeHj0DIT37T/CWmlnNInI8IrIXPOprfo7ZkIdPy5x1qF+f34FQrmVau38wfSgF3tS6f37uG+NbpBuw2YtS9sMNV+K2Pb2bVc6LsbeJ0KeOkgzbF3Lq6RK8WrCn/qoRsEiJCX0yM8HsM=;
	5:Pc4iYhMwF9J48VCwmun+B8tFQSWuCLwkuF3rLbjUCZbuwRzDKDPW0/5rsHW4TxSZxIp1pwLzXrJ84A2IvI9Agb7s3gWUc4xEWAvwa4sKMbv1xJ8SvkMV16Wu0Ej+3gJnLICnAF1qz0Mphdu9wn3zTC0GWnvXML+ifKuJFi/7s+w=;
	24:SSwbsDdSJXC09jJW5uf9JlTBW2gXAW2t2UixDRm8M0VcnaTKuS5+aqTMi9K8Om18VZA1YVsr7wlBuvhabJRuwFQ3NqBmiCzbx5wYBspbJuI=;
	7:o0ZUbn9B9N9g29tqPQR+XtEbCFHaGptLWrmM5FdpRlSTo0LPI+FDYZWeeww4CXT03AiXc80ZMABlHnMGaHpEJ3fDZGu+tpusKuyifyEtNVrj3d1ZqUqcj1Arw3hb7uJqXA4mqOZorhpIT69ONixGiiYW2LGKdzqjFNsYnk0OUVdj6SrPiXGDK6CZDeIdjxdDpUjrw06MC7aQAF8WO46fERl4ez3YXVxW+Kcx/ShDoe5G7zQAR/DNLkRWFC5xaEHL
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2018 20:09:01.2817 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 766f7fbb-b401-47da-0753-08d564f8a477
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR0401MB0964
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-01-26_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1801260263
Subject: Re: [PATCH v2] recipes-core: move hwclock.sh to util-linux
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
X-List-Received-Date: Fri, 26 Jan 2018 20:09:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 01/25/2018 12:43 PM, Khem Raj wrote:
> On 1/12/18 7:45 PM, Christopher Larson wrote:
>> On Fri, Jan 12, 2018 at 6:06 AM, Alex Stewart <alex.stewart@ni.com
>> <mailto:alex.stewart@ni.com>> wrote:
>>
>>      * Move the hwclock.sh initscript from the busybox recipe to util-linux.
>>        This script is generally useful for distros that get their hwclock
>>        implementation from sources other than busybox and we follow debian's
>>        example by providing it in util-linux.
>>
>>      :busybox/*
>>      * Remove the busybox-hwclock package, as it no longer has a purpose.
>>      * If busybox is configured to include hwclock, the busybox package will
>>        RDEPEND on util-linux-hwclock-init.
>>
>>      :util-linux/*
>>      * Provide the hwclock.sh script in util-linux-hwclock-init, which can be
>>        pulled by any packages that depend on its functionality.
>>      * util-linux-hwclock RDEPENDS on util-linux-hwclock-init for its
>>        initscript.
>>
>>      Signed-off-by: Alex Stewart <alex.stewart@ni.com
>>      <mailto:alex.stewart@ni.com>>
>>      Acked-by: Haris Okanovic <haris.okanovic@ni.com
>>      <mailto:haris.okanovic@ni.com>>
>>      Acked-by: Adrian Ratiu <adrian.ratiu@ni.com
>>      <mailto:adrian.ratiu@ni.com>>
>>      Acked-by: Ken Sharp <ken.sharp@ni.com <mailto:ken.sharp@ni.com>>
>>      Natinst-ReviewBoard-ID: 214983, 215755
>>
>>
>> Just a note that this will slow down the build for targets that wouldn’t
>> otherwise build the util-linux recipe.
> there is initscripts recipes, perhaps thats a better place for this.

I guess that depends on our rationale for what belongs in `initscripts`. 
Other distros seem to assert that `initscripts` is a minimum set of 
scripts to bring up a system (especially a sysvinit system) and they 
generally don't include the equivalent of our `hwclock.sh`. Including it 
in `initscripts` for us would mean that embedded devices without an RTC 
(but which use initscripts) and which otherwise have no use for hwclock 
implementations either get a broken script or end up building a package 
that they can't use.

That being said, this patch is actually deprecated in favor of

[OE-core][PATCH] recipes-core: breakout hwclock.sh from busybox (18-01-23)

which moves hwclock.sh into it's own hwclock-init recipe and package, 
that is DEPENDED by busybox (conditionally, if built with hwclock 
capability) and util-linux. So further discussion should be attached to 
that patch. Sorry for the confusion.

>> -- 
>> Christopher Larson
>> kergoth at gmail dot com
>> Founder - BitBake, OpenEmbedded, OpenZaurus
>> Senior Software Engineer, Mentor Graphics
>>

-- 
Alex Stewart
Software Engineer - LabVIEW Real-Time
National Instruments

alex.stewart@ni.com


