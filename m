Return-Path: <prvs=36519320f1=alex.stewart@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 542A760107
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 20:14:58 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w3NKAjF4023297 for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 15:15:00 -0500
Received: from nam02-sn1-obe.outbound.protection.outlook.com
	(mail-sn1nam02lp0021.outbound.protection.outlook.com [216.32.180.21])
	by mx0a-00010702.pphosted.com with ESMTP id 2hg1aydug2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 15:14:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=q1lVZmeh1Xf/lllyWP5sNVqhMyyV1aB8cSY3atG4RMk=;
	b=ijzbj2z+UWjJw1nPxMYTvrOH4VMUGom46fn2fNvSxn1AYLPPLbaTSbVYLWFbFLah+t8FIknXKs1xD6fvAV2Wxuzlq6ZfnY0xEibbr5uw2UHKCRRRnnAyC4YKhUbOUoa0P20MtjeG6aysFFSVUBh6GNcP7vay06jW9RzZdYoNSw0=
Received: from [10.2.72.122] (130.164.62.207) by
	CY4PR04MB1063.namprd04.prod.outlook.com (10.171.246.29) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.696.12; Mon, 23 Apr 2018 20:14:56 +0000
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20180321185559.30749-1-alex.stewart@ni.com>
	<20180321185559.30749-2-alex.stewart@ni.com>
	<e888d564-5755-deed-92e8-bda4e6b6dacc@ni.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
Message-ID: <8fd93659-a97d-6847-bcb0-f4d58978b415@ni.com>
Date: Mon, 23 Apr 2018 15:14:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <e888d564-5755-deed-92e8-bda4e6b6dacc@ni.com>
X-Originating-IP: [130.164.62.207]
X-ClientProxiedBy: BN6PR17CA0004.namprd17.prod.outlook.com (10.173.147.14) To
	CY4PR04MB1063.namprd04.prod.outlook.com (10.171.246.29)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB1063; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB1063;
	3:Kjs9p/iuCTcVaBa0tUFa3PKNagIynXT6MqtsZoeeNyPN93zJvCxmDnLzIfC3gf8OGbx2reBqGrZFd/BN+gQCwQDN5Kl9WS1sXAf9TviiNdEataUHCLVNoxW2sj+G0P9wAs+p81cat8/3TDcQJZ+sNBSZObmrj1zASB6xNXz4z5DNXpULHt3rIMqemwkMMlz/dcDPD3oUoUAdYX6+FpL36bI6BDCM83pbLgUW+pN3Ouj+/aGNfPcoub0PO5gF9SAi;
	25:q+0W6s6KO7m61r1BlWZRDNWmMCNKUhywgZyM2DMyuEUzY180wQRQNVVKolL0qDgSiaBh0VhMPP2Be6h++Ys28zIqaZqEIsHZIoansxBSTKkWfPxAv3HzXRHdSRCaY57P3trmYmnHyiLqlNIMbk1krHZ8s5JVJTZfYQM6QbXn3+hKmkzltXYUjgb+mlTewtg7XFbV4ErHcdRcxWsNt6RljUZAIg+vDm4xev5SL+XG+XHYA8963FEILNTeIAY8BcG0m0YFPxXT3i+OZ13hn+2j97Et74atcZ8czjNQ+HCNfO0jdmItCLC468tiXew2LZrIc+jxJ/N7XooTnnSk4aJucg==;
	31:pVvS4aACYCyNQQeTdpDR0+mO16qIwz8iHOWCpCM2IC4Eeu1xG5hRuNo5+VXSUyFLvx0/XFK8xbQyGNYvXtC80IdYJtIXS8tQrvXUs8AEm/YjPUTw5soYK9qIk8pm6BY6OUnsEfHjfVVa1a56DUyrjzGoTBJpySVo45acwqNrvVlBN453/qCYOtEiUXfJ2NJigYO+D2U+Ra1opepD3WFibeDXfe1e/5ZsDGmcGql0NU4=
X-MS-TrafficTypeDiagnostic: CY4PR04MB1063:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB1063;
	20:CMv8sVOADZ5YKTzAad9UO9P4rca3M81mnUmF/9rX83cs+XLlQbcjfr1wVpOlzGRlN7ifkimD0RH3QBHrpVBMtufYGVxzHmjggel8q+IBWpwmVAnQ/hN0Bv3/v2TJ2ebsngLIAvrZY3XPt0rXjsv7i/oWwteU63TzMceEgm16VQkawd9i4beT1F++P9UL/ATwNAEzjq5czijJvFdtciz8WNRvxDaQuDBSQpiIQ8LwnFvcSBTL8B18qCDezpnri7r8Fmnk5PKlC0S5VX/GzrPVXBPftKksvrLb32eV8UNMawo+iINt+3UA3zZ7pmHAiRLuJHd7JcBOL6EK6GYeinVpVw3wWODIFi0jhNS2fSRixvYTFo5t7rRIqPWOTrze3V5BfltYQc+wYukwpq+7Ydri1y6gokkHJt9UFySZbsvMiEOzhfvDar94zcbmsHrujMiBLH7BUTssmbV4H8RNrkzfLYhSpDy5UQD9A6URo6JtSUR4JL5FCVrDY+Ql15hjjRXF+TV2Nr6IyK8NPpcJNF0Q5ROjMAbbvhtZF6K9wue3ZBu0xEPm7/uIa0tq1uZHRq8K6N4XqooT+OgRbJr7V/db940lCG7Qu3+K4GH06BqJqVc=;
	4:RQ7vu7mXBHOlGXo1PJ8xzVIzUUSKy99ewVrzOzzIK2MU6UzWXiUSJs1fv3KKzQGXA7Wpu4zYPB3OtzYTBhKX4UabUWvo70AArOVnXobbsZOof+tqwQrQbXe7pr9HV75MROAVFZDfrqoiJ1+2UEOJUxncUBj1nNSoL/eRg97FR3Lok/dtsmuhs1ZQUsH94/BlsNnF6u3ZTe0npNi9NyZqyC7bOY4pOlJAfMjEIfFCV/aV5+dXsRAvpmQ5tpxj4MF6IRGZOUIw06DzQ0mdQOEh9zUBlobNNeAIFRx0sXX0hCr64QRrW9S5tfYaxamRje3e
X-Microsoft-Antispam-PRVS: <CY4PR04MB1063EF9BD0B78A4EBA726AD1FE890@CY4PR04MB1063.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231232)(944501410)(52105095)(6041310)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:CY4PR04MB1063; BCL:0; PCL:0; RULEID:; SRVR:CY4PR04MB1063; 
X-Forefront-PRVS: 06515DA04B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(376002)(396003)(39860400002)(39380400002)(346002)(366004)(50944005)(8676002)(6486002)(44832011)(2616005)(81166006)(229853002)(11346002)(6666003)(47776003)(3846002)(6116002)(956004)(2906002)(476003)(478600001)(316002)(16526019)(16576012)(53936002)(186003)(6306002)(67846002)(446003)(31686004)(386003)(76176011)(90366009)(58126008)(2870700001)(5660300001)(25786009)(26005)(6916009)(6246003)(31696002)(50466002)(7736002)(575784001)(77096007)(86362001)(52146003)(59450400001)(36756003)(23676004)(8936002)(36916002)(65956001)(53546011)(65806001)(305945005)(65826007)(52116002)(64126003)(2486003)(66066001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB1063; H:[10.2.72.122];
	FPR:; SPF:None; LANG:en; MLV:nov; PTR:InfoNoRecords; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjA0TUIxMDYzOzIzOjgycXdTdkl5Z3g3UEVUaTMxclZQZno3a2V2?=
	=?utf-8?B?Y2ltSDRvZExDdld4ZVREc3NmOHZiYXdFRDVTMTFnTXpvdi9ESVJjc091Um1T?=
	=?utf-8?B?YVJjNVdTbDIrY1UxMzNRZG1SZzBtOC9aUDNmeThldG4zSFR5SDBhdE0wcHFj?=
	=?utf-8?B?M2VPRTVQVXd4bnJFdnhYenF4ck5odnkwS0FGZTlqK1orTHFWMmkvYTNkVnB2?=
	=?utf-8?B?N3c3ZGMwTXJCRk02SUp4Y1hna3dhQ1FrSVBuRWxyQk5FcHpWNGZhYUloUXJq?=
	=?utf-8?B?UCtBS0Z2ZTJnWlhoVmgvYnQ0elkvcHNKMXJwT0hNdm5UNXpuL2Y2azZOSXYy?=
	=?utf-8?B?OVl0b0ZNcnZRalBSbUZpaksvbEFxOU5rVnlzazFoU1hjYkhSUkdHLzQyMWpm?=
	=?utf-8?B?Y01MQWt6SEdwM1IveWUxVlBOZTVFVWNpUFdrY29nMHJpNDZyQVJsbUF4V0xO?=
	=?utf-8?B?WXErK3ByblNxcHRSRWZIZlJCRDZWazFqSElEbnI4K3VKcjBLQTdIVUdHSGtE?=
	=?utf-8?B?azU3VVdSczZzUWlhditsTnJIQUltbnQyc0F4UExUMEpWY20xNU5vTjRLUCs4?=
	=?utf-8?B?ZXBIc0ZjcGJlcnlDVmJZaFBOQVVFZ3Z0V3VFNTloc1kySlBMTVpyY3BaUkVE?=
	=?utf-8?B?T1ZURjJ2RjY1OEd3RkNSVmhLcHVHNE01SmxsMDNURTR5cHAwbmF6YXVlYk5U?=
	=?utf-8?B?Y0NEWDR3c0JZaFFPdWJoZkYzc1ZyTlZQem1vQWVjUjJLUDd1TVFJa245VU9z?=
	=?utf-8?B?V05Rd3FQSUtndHhPRytaSHdKekIwcERqZGlYdXdJNzFiYWd3SWxTS281TTlL?=
	=?utf-8?B?TzEwWUV5NUwxN3RMK25YSXNnekpUeDM5cy9TZzNIODJMR295U2dxa2wvTUJH?=
	=?utf-8?B?MDZjN3o0NkJKb3RnYmpwQUQvR1hkb0dWNnVIK0ZRYWR6b0l3alZKNHRqYWlv?=
	=?utf-8?B?TzIzZ283QVBiQU1FdDJvVm5mV3NpVUUzTW50eUtyRmZNSzhtcFlpSlptQWxF?=
	=?utf-8?B?U1dEN2ZVNUtxbDY1M2VpbSt0Zk5EZGp6ZGcrc09OOTBKNG5pNHNHOWZOcmti?=
	=?utf-8?B?MEIyeUt1RnhWbjMzbzh3R2p5TGRIeG1iZGFXVE0yK2Y2QWcwcjAwR2VzcHZw?=
	=?utf-8?B?bjIrNnNBWkxiYWJ4SU1MTmVtSW02QjdQQ1Fxa2F2aUdrcEhHUkZaV0Z6Zy84?=
	=?utf-8?B?UlB2bitOdVowRjE1K080SnpxK054QWVjMzJCbVVVaUNWUkdMMDZOVjhRT0JZ?=
	=?utf-8?B?UWRKWXdPOTYwME1BSWdvNzMzVEptMHJBN3dBSWdtd2NGQ2RKZ2FDdUNNbURv?=
	=?utf-8?B?QytNbDRxOFkwdWtOSVdxRUJxZExOVjAzUjczdHE3KysxUDJ2eE9OTlhMTDlJ?=
	=?utf-8?B?ZmhveXB5WU5aWExSTWdJMXpJQVFLRmdvaHo5eFJPMVA3NVdxNWZPK3pubTlL?=
	=?utf-8?B?OVI3QWlFcEZIQUpDZC9ZRThub1ZlV2dKM0xTdDUwaCtsK1AyQW9uMlFRZGlB?=
	=?utf-8?B?TVJKRXo5WnJLNC9qeXpReFRiVXlzeHNjQmIrOXVSQWEvS1dIK0RzdXU0TmhY?=
	=?utf-8?B?UmVHWWNKeS9acHNHN0xIVEN2WTdRT3FGWXdlTUVmWDdvR2ptdVhLUGM4RWZV?=
	=?utf-8?B?WFpIMWxvdExmYWJrTlpTMTdPMkZ5WWttRDJuaVhndU5hM010RTRFV25WbU9Y?=
	=?utf-8?B?UUxJVWtkMzMwTng0RGdpMkFvTGNQRjlUQnJ5cjZoZ0RxTDgwc1hPMmtPaUJN?=
	=?utf-8?B?M2tPUDVrSWRWQ2pYUndQeDhIeHhGMERkdzQ1TDZpVWJNdVhEZU9UaDB1WElq?=
	=?utf-8?B?Szk4SlFwbHNEbUc0NURFL2duaHJyeFE3dEVSM1JIV1NHMUY3Q0U3M1NTMHpW?=
	=?utf-8?B?ekhiYVNzQVJLU2h3enI3c3RDODR2eHpwc01oSzU4TGRuZENXdnBJZnpTdVZa?=
	=?utf-8?B?bE55NmlRREpBPT0=?=
X-Microsoft-Antispam-Message-Info: y8N68iLCxKN6ejGP0rc9LtHpX9kdX7G1DOa4JkQ/qb+dav9eqyoy1P7vtRM3wCg3v8f/3Bru1148dDULN87eCEPHHbYS684+KQV0xGw/ZGtYW6fqypuXpPBB7J7TNneDA9sLwZdurtbFkdC82HDlfkBbNzBjNZfYfRlh+s5BSf3RHaa7mXenWfRsWVXfuC2g
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB1063;
	6:sT+hQ4cNqe2JdMhm3/CW4KoGnJN1IDCu3gBtKorDCqnMwmXlMSTUK0HL5y76vSG69fbVgfDWFYJkSZZUHMN2Zk/ni7HcBCYpYeniLJNirwyTk94DZEtAvU6jQI05dCJppNDSRwUrqcEQoKgHt4ib5RP2r23HqdavJ05eR3hBAqYprC+P8RzvxtJ+qXqE8dc2WR4m+nkhMqemVlWlCQdKtSXC0kiqjd03WajbMHcjcYoXO5Mqui25G2DD7Egh631zqMjUzolSYVySXZnZQjdR5lkFg5ARs/Qrv8Y0zCILWBTbXt2+Q0IkRcn6UlDyCVradprgjvmpW/9CGdptjG4C1B91mxqRXMVkTdZA6SeSHonsicI+Zu6yJ8GtYXzvWIJXC0sqCjWqBrRHEY9AwuFPIwxQlX37hozwEZSyDzvRS0inLQnMbvDUpFH19FDWRM5LDPg3GPFUqzRxlKSF78v4dQ==;
	5:amqkUy9VcqR/OKX5BF/mkNVuqG/+6STjWbIa1QfaOZ9o78iIzXwypbb7GN9qKE4iI3a1zkigjbImbMfklRm5vkjRRNuuGIKfTjZMZUDolIi34zI3Kk7OX+84g22dtX3/shvYxI1FTAUm9llBZd8Zge/xNKuKDZEueSuonCyyq6U=;
	24:fIq7sS9HA0zhYDrQwoVfn2iOV60QAJ+dfSNWAevnm+pKCHkUQwGub1gNEhBxr8Z/UT6Z2ke6cYzrKL0rcj/N6D9xPlU9o4yjStaccHaF4hU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB1063;
	7:vle89VbjLaoqsbptPZfvGiPNyDCz99VwhUzC1t9PkzZCtXuCemmh/YP1iDzSMWvGFcHj1UTapXDXjW191kAxoS7kUTufjXxfkm2wT6aTLCNmzhFNfrDpV/AwM2PrYQWV3y3JL4YBEp9cqM45WG9N9JrIsab7gbZ5RE5+nxrRN38eu4xjPvqRnuMm/M6OA8+aevfC0goM1s4KiymJcceauhA0WbVWwFjEgy4Kwzw2FjYhGGqV8NTd1dhZzAFZUYII
X-MS-Office365-Filtering-Correlation-Id: b10ffebd-4073-4fef-84f0-08d5a956e1ec
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2018 20:14:56.2792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b10ffebd-4073-4fef-84f0-08d5a956e1ec
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1063
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-04-23_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1804230201
Subject: Re: [PATCH v2 1/1] recipes-core: breakout hwclock.sh from busybox
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
X-List-Received-Date: Mon, 23 Apr 2018 20:14:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Bump x2.

On 04/09/2018 02:57 PM, Alex Stewart wrote:
> Bump.
>
> Did this patch get blacklisted for inclusion or does anyone have any 
> outstanding concerns about it?
>
> On 03/21/2018 01:55 PM, Alex Stewart wrote:
>> * Move the hwclock.sh initscript from busybox into its own package and
>>    recipe (hwclock-init). This script is generally useful for distros
>>    that get their hwclock implementation from sources other than
>>    busybox (like util-linux).
>>
>> :busybox/*
>> * Remove the busybox-hwclock package, as it no longer has a purpose.
>> * If busybox is configured to include hwclock, the busybox package will
>>    RDEPEND on hwclock-init.
>>
>> :util-linux/*
>> * util-linux-hwclock RDEPENDS on hwclock-init for its initscript.
>>
>> Signed-off-by: Alex Stewart <alex.stewart@ni.com>
>> ---
>>   meta/recipes-core/busybox/busybox.inc              | 16 +++--
>>   meta/recipes-core/busybox/busybox_1.27.2.bb        |  1 -
>>   meta/recipes-core/busybox/files/hwclock.sh         | 83 
>> ----------------------
>>   meta/recipes-core/hwclock-init/files/hwclock.sh    | 83 
>> ++++++++++++++++++++++
>>   meta/recipes-core/hwclock-init/hwclock-init_1.0.bb | 31 ++++++++
>>   meta/recipes-core/util-linux/util-linux.inc        |  1 +
>>   6 files changed, 124 insertions(+), 91 deletions(-)
>>   delete mode 100644 meta/recipes-core/busybox/files/hwclock.sh
>>   create mode 100644 meta/recipes-core/hwclock-init/files/hwclock.sh
>>   create mode 100644 meta/recipes-core/hwclock-init/hwclock-init_1.0.bb
>>
>> diff --git a/meta/recipes-core/busybox/busybox.inc 
>> b/meta/recipes-core/busybox/busybox.inc
>> index d1675c37aa..50cc837335 100644
>> --- a/meta/recipes-core/busybox/busybox.inc
>> +++ b/meta/recipes-core/busybox/busybox.inc
>> @@ -20,19 +20,17 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
>>     EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} 
>> CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}' 
>> HOSTCPP='${BUILD_CPP}'"
>>   -PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog 
>> ${PN}-mdev ${PN}-hwclock"
>> +PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog 
>> ${PN}-mdev"
>>     FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
>>   FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* 
>> ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* 
>> ${systemd_unitdir}/system/syslog.service 
>> ${sysconfdir}/default/busybox-syslog"
>>   FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev 
>> ${sysconfdir}/mdev.conf ${sysconfdir}/mdev/*"
>>   FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
>>   FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
>> -FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
>>   -INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd 
>> ${PN}-mdev ${PN}-hwclock"
>> +INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd 
>> ${PN}-mdev"
>>     INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
>> -INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
>>   INITSCRIPT_NAME_${PN}-mdev = "mdev"
>>   INITSCRIPT_PARAMS_${PN}-mdev = "start 04 S ."
>>   INITSCRIPT_NAME_${PN}-syslog = "syslog"
>> @@ -284,9 +282,6 @@ do_install () {
>>       if grep "CONFIG_UDHCPD=y" ${B}/.config; then
>>           install -m 0755 ${WORKDIR}/busybox-udhcpd 
>> ${D}${sysconfdir}/init.d/
>>       fi
>> -    if grep "CONFIG_HWCLOCK=y" ${B}/.config; then
>> -        install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
>> -    fi
>>       if grep "CONFIG_UDHCPC=y" ${B}/.config; then
>>           install -d ${D}${sysconfdir}/udhcpc.d
>>           install -d ${D}${datadir}/udhcpc
>> @@ -375,6 +370,13 @@ python do_package_prepend () {
>>       else:
>> set_alternative_vars("${sysconfdir}/busybox.links.nosuid", 
>> "${base_bindir}/busybox.nosuid")
>> set_alternative_vars("${sysconfdir}/busybox.links.suid", 
>> "${base_bindir}/busybox.suid")
>> +
>> +    # If busybox is configured to provide a hwclock implementation, 
>> add a
>> +    # package dependency on hwclock-init for the /etc/init.d/hwclock.sh
>> +    # initscript.
>> +    with open(d.getVar('B') + '/.config', 'r') as fp_conf:
>> +        if 'CONFIG_HWCLOCK=y' in fp_conf.read():
>> +            d.appendVar('RDEPENDS_busybox', ' hwclock-init ')
>>   }
>>     pkg_postinst_${PN} () {
>> diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb 
>> b/meta/recipes-core/busybox/busybox_1.27.2.bb
>> index 36a6342aaf..78d8e14a6b 100644
>> --- a/meta/recipes-core/busybox/busybox_1.27.2.bb
>> +++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
>> @@ -8,7 +8,6 @@ SRC_URI = 
>> "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>>              file://busybox-udhcpd \
>>              file://default.script \
>>              file://simple.script \
>> -           file://hwclock.sh \
>>              file://mount.busybox \
>>              file://syslog \
>>              file://syslog-startup.conf \
>> diff --git a/meta/recipes-core/busybox/files/hwclock.sh 
>> b/meta/recipes-core/busybox/files/hwclock.sh
>> deleted file mode 100644
>> index be5f94d86c..0000000000
>> --- a/meta/recipes-core/busybox/files/hwclock.sh
>> +++ /dev/null
>> @@ -1,83 +0,0 @@
>> -#!/bin/sh
>> -### BEGIN INIT INFO
>> -# Provides:          hwclock
>> -# Required-Start:
>> -# Required-Stop:     $local_fs
>> -# Default-Start:     S
>> -# Default-Stop:      0 6
>> -# Short-Description: Set system clock
>> -# Description:       Set system clock to hardware clock, according 
>> to the UTC
>> -#                    setting in /etc/default/rcS (see also rcS(5)).
>> -### END INIT INFO
>> -#
>> -# WARNING:      If your hardware clock is not in UTC/GMT, this script
>> -#               must know the local time zone. This information is
>> -#               stored in /etc/localtime. This might be a problem if
>> -#               your /etc/localtime is a symlink to something in
>> -#               /usr/share/zoneinfo AND /usr isn't in the root
>> -#               partition! The workaround is to define TZ either
>> -#               in /etc/default/rcS, or in the proper place below.
>> -
>> -[ ! -x /sbin/hwclock ] && exit 0
>> -
>> -[ -f /etc/default/rcS ] && . /etc/default/rcS
>> -
>> -[ "$UTC" = "yes" ] && tz="--utc" || tz="--localtime"
>> -case "$1" in
>> -        start)
>> -                if [ "$VERBOSE" != no ]
>> -                then
>> -                        echo "System time was `date`."
>> -                        echo "Setting the System Clock using the 
>> Hardware Clock as reference..."
>> -                fi
>> -
>> -        if [ "$HWCLOCKACCESS" != no ]
>> -        then
>> -            if [ -z "$TZ" ]
>> -            then
>> -                       hwclock $tz --hctosys
>> -            else
>> -               TZ="$TZ" hwclock $tz --hctosys
>> -            fi
>> -        fi
>> -
>> -                if [ "$VERBOSE" != no ]
>> -                then
>> -                        echo "System Clock set. System local time is 
>> now `date`."
>> -                fi
>> -                ;;
>> -        stop|restart|reload|force-reload)
>> -        #
>> -        # Updates the Hardware Clock with the System Clock time.
>> -        # This will *override* any changes made to the Hardware Clock.
>> -        #
>> -        # WARNING: If you disable this, any changes to the system
>> -        #          clock will not be carried across reboots.
>> -        #
>> -        if [ "$VERBOSE" != no ]
>> -        then
>> -            echo "Saving the System Clock time to the Hardware 
>> Clock..."
>> -        fi
>> -        if [ "$HWCLOCKACCESS" != no ]
>> -        then
>> -            hwclock $tz --systohc
>> -        fi
>> -        if [ "$VERBOSE" != no ]
>> -        then
>> -            echo "Hardware Clock updated to `date`."
>> -        fi
>> -                exit 0
>> -                ;;
>> -    show)
>> -        if [ "$HWCLOCKACCESS" != no ]
>> -        then
>> -            hwclock $tz --show
>> -        fi
>> -        ;;
>> -        *)
>> -                echo "Usage: hwclock.sh 
>> {start|stop|show|reload|restart}" >&2
>> -        echo "       start sets kernel (system) clock from hardware 
>> (RTC) clock" >&2
>> -        echo "       stop and reload set hardware (RTC) clock from 
>> kernel (system) clock" >&2
>> -                exit 1
>> -                ;;
>> -esac
>> diff --git a/meta/recipes-core/hwclock-init/files/hwclock.sh 
>> b/meta/recipes-core/hwclock-init/files/hwclock.sh
>> new file mode 100644
>> index 0000000000..be5f94d86c
>> --- /dev/null
>> +++ b/meta/recipes-core/hwclock-init/files/hwclock.sh
>> @@ -0,0 +1,83 @@
>> +#!/bin/sh
>> +### BEGIN INIT INFO
>> +# Provides:          hwclock
>> +# Required-Start:
>> +# Required-Stop:     $local_fs
>> +# Default-Start:     S
>> +# Default-Stop:      0 6
>> +# Short-Description: Set system clock
>> +# Description:       Set system clock to hardware clock, according 
>> to the UTC
>> +#                    setting in /etc/default/rcS (see also rcS(5)).
>> +### END INIT INFO
>> +#
>> +# WARNING:      If your hardware clock is not in UTC/GMT, this script
>> +#               must know the local time zone. This information is
>> +#               stored in /etc/localtime. This might be a problem if
>> +#               your /etc/localtime is a symlink to something in
>> +#               /usr/share/zoneinfo AND /usr isn't in the root
>> +#               partition! The workaround is to define TZ either
>> +#               in /etc/default/rcS, or in the proper place below.
>> +
>> +[ ! -x /sbin/hwclock ] && exit 0
>> +
>> +[ -f /etc/default/rcS ] && . /etc/default/rcS
>> +
>> +[ "$UTC" = "yes" ] && tz="--utc" || tz="--localtime"
>> +case "$1" in
>> +        start)
>> +                if [ "$VERBOSE" != no ]
>> +                then
>> +                        echo "System time was `date`."
>> +                        echo "Setting the System Clock using the 
>> Hardware Clock as reference..."
>> +                fi
>> +
>> +        if [ "$HWCLOCKACCESS" != no ]
>> +        then
>> +            if [ -z "$TZ" ]
>> +            then
>> +                       hwclock $tz --hctosys
>> +            else
>> +               TZ="$TZ" hwclock $tz --hctosys
>> +            fi
>> +        fi
>> +
>> +                if [ "$VERBOSE" != no ]
>> +                then
>> +                        echo "System Clock set. System local time is 
>> now `date`."
>> +                fi
>> +                ;;
>> +        stop|restart|reload|force-reload)
>> +        #
>> +        # Updates the Hardware Clock with the System Clock time.
>> +        # This will *override* any changes made to the Hardware Clock.
>> +        #
>> +        # WARNING: If you disable this, any changes to the system
>> +        #          clock will not be carried across reboots.
>> +        #
>> +        if [ "$VERBOSE" != no ]
>> +        then
>> +            echo "Saving the System Clock time to the Hardware 
>> Clock..."
>> +        fi
>> +        if [ "$HWCLOCKACCESS" != no ]
>> +        then
>> +            hwclock $tz --systohc
>> +        fi
>> +        if [ "$VERBOSE" != no ]
>> +        then
>> +            echo "Hardware Clock updated to `date`."
>> +        fi
>> +                exit 0
>> +                ;;
>> +    show)
>> +        if [ "$HWCLOCKACCESS" != no ]
>> +        then
>> +            hwclock $tz --show
>> +        fi
>> +        ;;
>> +        *)
>> +                echo "Usage: hwclock.sh 
>> {start|stop|show|reload|restart}" >&2
>> +        echo "       start sets kernel (system) clock from hardware 
>> (RTC) clock" >&2
>> +        echo "       stop and reload set hardware (RTC) clock from 
>> kernel (system) clock" >&2
>> +                exit 1
>> +                ;;
>> +esac
>> diff --git a/meta/recipes-core/hwclock-init/hwclock-init_1.0.bb 
>> b/meta/recipes-core/hwclock-init/hwclock-init_1.0.bb
>> new file mode 100644
>> index 0000000000..74200450ac
>> --- /dev/null
>> +++ b/meta/recipes-core/hwclock-init/hwclock-init_1.0.bb
>> @@ -0,0 +1,31 @@
>> +SUMMARY = "Initscript for hwclock utility"
>> +DESCRIPTION = "\
>> +Installs an initscript that updates the system clock based on the 
>> available \
>> +hwclock implementation."
>> +
>> +SECTION = "base"
>> +
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = 
>> "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>> +
>> +SRC_URI = "file://hwclock.sh"
>> +
>> +S = "${WORKDIR}"
>> +
>> +inherit update-rc.d
>> +
>> +INITSCRIPT_PACKAGES = "${PN}"
>> +
>> +INITSCRIPT_NAME_${PN} = "hwclock.sh"
>> +INITSCRIPT_PARAMS_${PN} = "defaults"
>> +
>> +do_install () {
>> +    install -d ${D}${sysconfdir}/init.d
>> +    install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
>> +}
>> +
>> +PACKAGES = "${PN}"
>> +
>> +PACKAGE_ARCH = "all"
>> +
>> +FILES_${PN} = "${sysconfdir}/init.d/hwclock.sh"
>> diff --git a/meta/recipes-core/util-linux/util-linux.inc 
>> b/meta/recipes-core/util-linux/util-linux.inc
>> index 5e40b2019a..6df5723d5e 100644
>> --- a/meta/recipes-core/util-linux/util-linux.inc
>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>> @@ -302,6 +302,7 @@ python populate_packages_prepend() {
>>   }
>>     RDEPENDS_${PN}-bash-completion += "util-linux-lsblk"
>> +RDEPENDS_${PN}-hwclock += "hwclock-init"
>>   RDEPENDS_${PN}-ptest = "bash grep coreutils which util-linux-blkid 
>> util-linux-fsck btrfs-tools"
>>     do_compile_ptest() {
>

-- 
Alex Stewart
Software Engineer - LabVIEW Real-Time OS
National Instruments

alex.stewart@ni.com


