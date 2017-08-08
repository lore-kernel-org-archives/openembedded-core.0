Return-Path: <haris.okanovic@ni.com>
X-Greylist: delayed 1627 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 08 Aug 2017 15:54:18 UTC
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id E91577197E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 15:54:18 +0000 (UTC)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v78FQGIm030128; Tue, 8 Aug 2017 10:27:11 -0500
Received: from nam01-bn3-obe.outbound.protection.outlook.com
	(mail-bn3nam01lp0181.outbound.protection.outlook.com
	[216.32.180.181])
	by mx0b-00010702.pphosted.com with ESMTP id 2c5ayvje6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2017 10:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=9K8Ieg/O00SC1kEbn/ZhUjL0NaYX/bSVawI5pI+gjPE=;
	b=J3TOlGzjIu1p3QLjjHYnTLXt5ulCRVMyWfnig3ZdN5BAczvPpgSq8KyMzPWdxqVGAvHYHf6ce0rsqxOn8T/HIwwXu3Zx8D3+icZmvPYMwRyB5ozxFfepvoEHKvR2qNwXoasNvqnGyGnUcInwNrZBJbaBSWNUHSgmappM3E7byKw=
Received: from harisdt.amer.corp.natinst.com (130.164.62.171) by
	CY4PR04MB0696.namprd04.prod.outlook.com (10.172.137.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1304.22; Tue, 8 Aug 2017 15:27:09 +0000
To: "Rees, Kevron" <kevron.m.rees@intel.com>, "Wold, Saul"
	<saul.wold@intel.com>
References: <20170705173334.25041-1-haris.okanovic@ni.com>
	<1500323515.27323.139.camel@intel.com>
	<0f5ef046-a46c-b24d-8572-775d1fa1b1cf@ni.com>
	<1500479806.27323.202.camel@intel.com>
	<CAFW5wYYqeW1DDjJ2RXu-OfSuUgAWj=7qjOXLbCNA+Kq1z4gjkA@mail.gmail.com>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <9a0cd3b6-2e77-527a-8c56-e0b4f636dc0d@ni.com>
Date: Tue, 8 Aug 2017 10:27:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFW5wYYqeW1DDjJ2RXu-OfSuUgAWj=7qjOXLbCNA+Kq1z4gjkA@mail.gmail.com>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: DM5PR20CA0031.namprd20.prod.outlook.com (10.171.161.145) To
	CY4PR04MB0696.namprd04.prod.outlook.com (10.172.137.13)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e18746d-3b5c-4c33-2c20-08d4de71ef50
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY4PR04MB0696; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0696;
	3:1qBB8uklZ2PPGJWzdQQ/L8/DF7bDvonBSCM20GsQlZPDARuxxvWm6xo1kXdmTUWmaq7J/TAU/Or+p4m5CTJqjFPN/fz4Dm3PTR4Ge5Baevj+Bevlo737MRBNQF310aL7ggFmrwVuuFM4ep3DGrWnVScLP+6tbKog6czyUYbnuo+G72K4OMXIykKd8wDm19h8uQpERhDNxi/CTh5x80iuWdJ/JubA8UzQ0QIefWgk1LqdRgFxdvB8Zd9aA1J5pATU;
	25:AdhafPkGPRL+RxFx2c7md/4VqD+0g3nOhRGZGuW0/LLqKIpyGu3gVM8ItZ4/3ZCtUXIZKoc4yeJFQxii0R9REaboA5b2hcqAf+qUOwBlFCvNr/TOpFBwAKpo67BeGidAyculneXwk2A4H3L6owVktvMgOirqm+90h3aB/08KIizITkDCRJGgshlHamT7PNpZC9n0MVIxC5Asn2ri6vVaw3778ybjW9JCk1K5ZTpS/xgsa2gufCudd/rDH1eHlVoygGu7nKLrNCCAg1TiTFlHmucBTkQ8g4bgaqJxXxGxTHG2YBss2gDhhJOMrMe9PVvF5L9q9BZRqbYRBO0PYq9jkQ==;
	31:CBf8j/1CsqhVPy2HtS9m4/XbLsy0VfGkdmIjB0frjGFremr8jjsXEtQb12tcfwGCYkLIuiZ8R9XK6c7uLQMZOLhbxCQmsFjzcFZd38F1Lp8msnmLxZN7pRbLEKMspgfjvL3eODk3VUkzxHX7ZSv0t+ZRz8diOGMPwuAHySjZopLxVy+F82z2+VzvpP9njkD7YzEFLsrrh15gncvngAOXB3sWTRtKOh5ORYksgd8Z4qM=
X-MS-TrafficTypeDiagnostic: CY4PR04MB0696:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0696;
	20:EJuYTBLoChHvmXADiYt8DuLLW0xbaMmmiA4QDgrLO5gpJWYp/l49ajxFgOFHYUJka4ij3rqjk+ucd1TAbEz0BUozRvX4FXv/zNVGAO2XekadIIKgbxTGUFqSvy33+pqCTd7KqnBtYYomcMd4Lwwk+XuUACwid6zkzfjeqURYgyjNIa3cyHQMTmfZvMs2Pay0qJsqUfxzi6a5haUDKt9pQo8sNkQUEzsxX0boVPACy6Kkbm3Fe3P16M9pJ87zNpeGX8xMlwUJLXO2CDhRbV5RTxayewH8Ay2jFaYVCw58PVS5QcGFRzpR+idvlaJlDcJVJjknd4hSQ1Lu1u31OU9cFD/GdjKY6SDZtw9B16ljhzRaDsVVirt5EueIfaq+sGqtqjWlRqIxngBc/bsXpRd2oevQZ0d/blvGlXFeLnxlq2VKTVU0dkJiOLUA6bydRxdZmuvvLPDlc30GUz6UNvbcwjRp80XVbMXPk6l0nQKFVL4cDfpnuJP5nezIhofu92Vj2/wiIo8yUF0Yo5nQiQkiE7chl/T6elfB8XQnqNgHrVmKn5Cy/MB4HFgyY0LdItEwwkH1MkzaGeTgWBpBxPzKCC0ejqY+yMKwQt7LheaCItE=
X-Exchange-Antispam-Report-Test: UriScan:(10436049006162)(788757137089)(264703809997249)(5213294742642)(228905959029699)(145744241990776);
X-Microsoft-Antispam-PRVS: <CY4PR04MB069614EEEF838DABF84CA4AEE58A0@CY4PR04MB0696.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(10201501046)(100000703101)(100105400095)(3002001)(93006095)(93001095)(6041248)(20161123555025)(20161123562025)(20161123560025)(20161123558100)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR04MB0696; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR04MB0696; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0696;
	4:WyHquqbI7cAzy1w6tybF+MNtO8qgJvl7hKL2yNmJFIo91k/VuJxpFCNMrDUToDGKidsSCdEmGbQmw7WtiR3BNvXJ4c1E1rLCefVSRLJWE1gLe9CgkBSLolk1lGVBYf4qkMB9Vn0i03UEJEhrfCoCpcEflYYUD0dDRUs6GHBCKnPvce4DhrVgv2RnZ7/v+LWCZVwCt/9Tvfw7wvIgG+n8P9AvVWJtQCmpQVE+nTkLVovrACG3zET8GtkFnkB/Gpt1yqdS/qbCe3/5UM1AQEHLmUQLIfkriNDGJTiHBZc/s0iDyR/uHzcaH0X+jVwnviX+PD9QUcM1lDZxnltl+svUv/Jm23wzCI2JC4JOyLwK0j0Skw3oDIlJCRgi3efplvWWDeAqNoHFxoLXyuKwFreeuXarN+eOpjL6mnrXnQEj9KD9INilBBE119JMpEJlni1u2bUiQDNcFIBEo8XPsXFqsg==
X-Forefront-PRVS: 03932714EB
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(7370300001)(4630300001)(6009001)(39850400002)(39450400003)(39400400002)(39410400002)(39840400002)(24454002)(189002)(377424004)(377454003)(199003)(106356001)(64126003)(229853002)(47776003)(4001350100001)(478600001)(36756003)(53546010)(25786009)(65956001)(38730400002)(6666003)(65806001)(966005)(101416001)(76176999)(66066001)(6506006)(4326008)(68736007)(31686004)(54356999)(50986999)(93886004)(2906002)(7350300001)(2950100002)(97736004)(7736002)(53936002)(31696002)(81156014)(8676002)(42186005)(50466002)(6512007)(54906002)(6306002)(81166006)(6486002)(83506001)(33646002)(305945005)(6246003)(5660300001)(65826007)(575784001)(6116002)(105586002)(3846002)(189998001)(230700001)(86362001)(23676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0696;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjA0TUIwNjk2OzIzOkE0ZUFXYWEzbVF1ZUZ4OE0yMkh5MFlzQUYr?=
	=?utf-8?B?NU4rWlZLeUhiaDhaMWp5RzlJbEdzaTdNMytwUC84WFYwc2J2dm9uZUU1bklS?=
	=?utf-8?B?Mm1uZHJVV3d0RitzeE5SbEVKYWlFbnkzUFQ2WUdIakJUT2tsN1p5K0p2dERx?=
	=?utf-8?B?SDRiUW1yUmMwVnhMTVM2R3VjclFkNGtDVGtndjlBVS9aQnpyL0NsWnpxaG9F?=
	=?utf-8?B?U3FpT0pjdTNFQk1lT3g4RVdVV0M2U2ppSDZIMnR0cGh3Qm1kT1lHZ1JQU1pm?=
	=?utf-8?B?KzdpSlNBT2YvaUNXTVFDbGZEcXhHMndMREQ1aFdCSFZNZnNHMHI2a0J6ODlL?=
	=?utf-8?B?N1JLUTdRWTUzR0xDZm13bjdjZEc2ZnAwbmcwMEVsWU9LUGF4MkdlelV1YzEr?=
	=?utf-8?B?MkhVQzZ5L1J5cGhIcG1vbFlLcnBLUzlxZHNncndGUEhpTzFTaWo5WEc3YlRw?=
	=?utf-8?B?R0UvbWlkUGNQR1dyNmFxNGFVK0VIem1ZWm9zYXNRNTRpNDBYM0h5b1h6ZGRF?=
	=?utf-8?B?dWY1TXkvQzc2S3FnZWpRNDlZd1B3YXdzeGNGRVFFTDZvbk1jdTF0M1lxQUND?=
	=?utf-8?B?SzNxcjZ1V3JjZ1ZQSktYNFhBcUUvaDdDQVo5cnR5a01FL3VJdU9QYVpmRzFI?=
	=?utf-8?B?S1FnamI1Y3hqNTNhRDQxellkTGh2ZEFMOHZxa2RRb3cyTFcxVzExK0pTRER6?=
	=?utf-8?B?bWt6bTdKNlE5MGFYT3hsTDF5a3pWSElqYXFKV1M0VVdXeXgzRHBUMS9qN2Jk?=
	=?utf-8?B?MUR0ckFNR0xSUEJOOWFFbWtsdkg5M1ZaYVNjNU83dGt1Zm1Nc1JRTnRSTWJU?=
	=?utf-8?B?Mkc1eVM2SmwyUW9qLzZRL1Z6SGhiM09nVXl3YlJINWRBbDRoUlU0QjJDZUhn?=
	=?utf-8?B?ZFUzRHhHcHZPR1VDZXRHTkFJZ3FoczhoNUVhVzltbk9nRm5raFJaSkZtRlZG?=
	=?utf-8?B?Y2NOOU94NjBVTjRxa2liN2ZvNThiNm5WTVM1OUo1MHZXYytxZTZWYVBMUnYw?=
	=?utf-8?B?K0Z0KzRybmFzVzdtSEQxbERYWm1CL0Y3TjhrVnp0eTh5bjIrOTVGU0sxdlJo?=
	=?utf-8?B?am5RemtjS3RKSElQSHA0bDl1OW5QT0ZhUU45M2pJZzhmM0x5NFFyWk5OUDhq?=
	=?utf-8?B?ajFaQjVPT1JueEM0emZ6R2Q1a3Z0MDJkYWxsa0FsMW9TcUdEVlJTNE80ayta?=
	=?utf-8?B?cmdaYnM5d2dHblM3bmRybWdTdnd2cC9PY2tXaGJqOXZMblBFR09RSnVlTFdk?=
	=?utf-8?B?SktDZEExRTFIZVBXU0MxY3UwL0hReXZnelRBa3JveDE5WmFEb2xvZWJVWkNu?=
	=?utf-8?B?TEdVWlk3L3Q0dFR2ZG53eHBCdGVsQ2Zsa2tVV0pTZWdRRFUycHk3Q0F5Y3VP?=
	=?utf-8?B?cDBhV09RU1hSay9pdkMrU1RlazRnUE1XSDFNSDFCbXVhRWZyWjhLWFpKeTRS?=
	=?utf-8?B?dll6VHo5aVpOa1ZnNW9FbjloRjdFVWM3M0dRTEJ6aUdzdWZhN1ZHNzMxRlpY?=
	=?utf-8?B?TzdQYXozcW1ScUpBWk9HcDhvSmhpZjRjb3g4bDNMdTFuYXo2RXlyaFJXTUIv?=
	=?utf-8?B?aDlPdHl2YUdPTWxIRjEwQkpkcU5RNjlUMWNrVjFPQlFzOEhLQTNmbjVSTUc0?=
	=?utf-8?B?N24vY1R1aWx1WCtheHBjN3hGdkxxd29PRzQ5S0FoQzFJMm82cWFPM3NwQlMx?=
	=?utf-8?B?bDB0UnNvOGpXSExETEdYZ3pVZjJ5ZzVjcmJlYXpNSjI4R1V2VHkwLytORG8z?=
	=?utf-8?B?YUpqU3FuRG80UklXV2FiL0pnb3hjRldPaXpBWjJhUjBmSFVoWHM1MG5EUmls?=
	=?utf-8?B?VURYcEVBVVNIM3lDSFlFQzVXZkZRYkc5VjdhZ0FBWnhmMTZtQUlrdU1kRFk4?=
	=?utf-8?B?TDRwQ2J2ZE5WY0YyT1l4aFBJaG5Nci8xUkNRQUp1Q2x0WWpsUkdkL3BwblBB?=
	=?utf-8?B?bGluUFErUVlEM202MkJjV2tKZjN5TzlHckdYRGMyWnZWZTMxR2drQ2Zmb3VG?=
	=?utf-8?B?aU52a1JYVzJLY3FJeC9jOFFka2FFb2M4V3hEdEh3blk3R0Z6QldpQVlqK2lH?=
	=?utf-8?B?ZVhPNlZyOTQ1MFZXQVhoVUkwQnYwNHBnbzN1SE11c1Jiai93TUlnS1l3SXhr?=
	=?utf-8?B?TnQ2MlFaYjNtc2RPOEpLdU10VDhNYzFobU5BV09yd2JTTEYwc1J4R3ArMmRQ?=
	=?utf-8?B?RWw4UXNLdVZPNEpFU3lnbGkreEdRPT0=?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0696;
	6:IihaT1Ede5EJweLxDvFd4jvJWx/9PQsyDLSyHT9FqThrNyVtx2aDsLz10tc25ztLUdnh2CWmxmNOn+OB6W6PmF/AHjvP5hzA8V1eIzyVC1LRDwxN03qa+4kzdqITfL1TiT3hHjzGnbbRm46cecmhMju46Ti0xCN8MjQNp18DK8YyUXFainI0rPGjY3LXAUGGqD4mroTtq7UUZnwObbq+n1mI/QCTQHISF3kzfq6cu3z+LBjGStv2Ph8rwAVldD/lkaoigvRpuht7gzPCfnKJd1Yg3kqPIc+yQe5+KhibnlhgDFf1Ln/0wG2Upqqa7MNMQ3nydtqC6syaL4fGhy6JTg==;
	5:8F2eAa2eIl6WOWL1soJ1h538HDmf4orv0luSg/BJGfgg9dPyaXAUaVnjpciW8x3GfBDe65U7QiPx84pIUgcqnPolCG6Kj4jZzfzGddsiUIv16TilrKcCZyw34AtammWtb94zT+4rKNeocjDcNacV3g==;
	24:lz81kjey7Ciw00Cxgf/f1OUQEntOH7yVwjcHI/2lATTejufBxp8KNbE4pz3SorJ2rx+S4jgUEakCZZPc0GfMYX8OAiMqff8Vs1DX8jomELQ=;
	7:CJNwQ4aBaConvcCnR/2C10vyiGiVd8hC8O9wXljyU+jWRNTs93M0l6y1IhikOL5xkult/ApLI6rq+erhPeaPwbT6+gxyrNv/Ii4b+qlK4+MbCsdh8DnAn6NJCQKfTyijlvvwMWvwETbIS12OvHgQyamjAx0RhNQQ5ERnazJTO3XlfzxmDj2HXUwl3BHcOJkN0Ad2JULnyaksEmQrF1Hw+1arvcjvDKM6etLK4kEwWUw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2017 15:27:09.1418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0696
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-08_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1706020000 definitions=main-1708080252
Cc: "josh.hernstrom@ni.com" <josh.hernstrom@ni.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Tue, 08 Aug 2017 15:54:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 07/27/2017 01:01 PM, Rees, Kevron wrote:
> On Wed, Jul 19, 2017 at 8:56 AM, Wold, Saul <saul.wold@intel.com> wrote:
>> On Tue, 2017-07-18 at 08:34 -0500, Haris Okanovic wrote:
>>>
>>> On 07/17/2017 03:31 PM, Wold, Saul wrote:
>>>>
>>>> On Wed, 2017-07-05 at 12:33 -0500, Haris Okanovic wrote:
>>>>>
>>>>> Some distros may want to provide alternate kernel "flavors" via
>>>>> feeds
>>>>> or
>>>>> within bootable images. For example, readily available builds
>>>>> which
>>>>> provide certain diagnostic features can enable developers and
>>>>> testers
>>>>> to
>>>>> more quickly resolve issues by avoiding lengthy kernel builds.
>>>>>
>>>>> This change allows for building multiple flavors of the kernel
>>>>> and
>>>>> module packages by templatizing kernel package names via a new
>>>>> KERNEL_PACKAGE_NAME variable in kernel.bbclass. It defaults to
>>>>> the
>>>>> old
>>>>> name of "kernel", but can be overridden by certain recipes
>>>>> providing
>>>>> alternate kernel flavors.
>>>>>
>>>>> To maintain compatibility, recipes providing alternate kernel
>>>>> flavors
>>>>> cannot be the "preferred provider" for virtual/kernel. This is
>>>>> because
>>>>> OE puts the preferred provider's build and source at
>>>>> "tmp-glibc/work-shared/$MACHINE/kernel-build-artifacts/" and
>>>>> "tmp-glibc/work-shared/$MACHINE/kernel-source/" instead of
>>>>> "tmp-glibc/work/*/$PN/" like other recipes. Therefore, recipes
>>>>> using
>>>>> the
>>>>> default KERNEL_PACKAGE_NAME="kernel" follows the old semantics --
>>>>> build
>>>>> in the old location and may be preferred provider -- while
>>>>> recipes
>>>>> using
>>>>> all other KERNEL_PACKAGE_NAME's build from the normal WORKDIR and
>>>>> don't
>>>>> provide "virtual/kernel".
>>>>>
>>>>> Testing:
>>>>>    1. Prepended `KERNEL_PACKAGE_NAME = "tiny-linux"` to
>>>>>       linux-yocto-tiny_4.9.bb so that it may build alongside
>>>>>       the main kernel.
>>>>>    2. `bitbake linux-yocto linux-yocto-tiny` to build both kernel
>>>>> flavors.
>>>>>    3. Verified image and modules IPKs exist for both:
>>>>>       tmp-glibc/deploy/ipk/qemux86/kernel-* for linux-yocto
>>>>>       tmp-glibc/deploy/ipk/qemux86/tiny-linux* for linux-yocto-
>>>>> tiny
>>>>>    4. Verified linux-yocto is the "preferred provider", and was
>>>>> built
>>>>> in
>>>>>       shared directory: tmp-glibc/work-shared/qemux86/kernel-*
>>>>>    5. Appended `CORE_IMAGE_BASE_INSTALL += "tiny-linux"` to
>>>>>       core-image-base.bb to include both kernel flavors.
>>>>>    6. `bitbake core-image-base` to build an image.
>>>>>    7. Verified image contains two bzImage's under /boot/, with
>>>>>       "yocto-standard" selected to boot via symlink.
>>>>>
>>>>> Discussion thread:
>>>>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_pipermail_openembedded-2Dcore_2015-2DDe&d=DwIBaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EXsasUKMXo4dlk7nFW3VDV8Z06QZKhwHTWyH5F0E6-c&s=vJgjJOYKOYNz18XjXjP-gc0MvGMrdm1Z8EbcLuaxFqA&e=
>>>>> cemb
>>>>> er/thread.html#114122
>>>>>
>>>>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>>>>> Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
>>>>> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
>>>>> Coauthored-by: Gratian Crisan <gratian.crisan@ni.com>
>>>>> Coauthored-by: Haris Okanovic <haris.okanovic@ni.com>
>>>>> Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com>
>>>>> ---
>>>>> [PATCH v2] Change STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR
>>>>> to
>>>>> the
>>>>> "work" directory in alternate kernel builds, instead of "work-
>>>>> shared",
>>>>> so
>>>>> that the two builds don't clobber each other.
>>>>>
>>>>> [PATCH v3] An updated version of this change rebased onto the
>>>>> current
>>>>> OE-core master. Changes:
>>>>>    * Remove PREFERRED_PROVIDER check in linux-yocto.inc in
>>>>> alternate
>>>>>      kernel builds, since alternate kernels aren't the
>>>>>      PREFERRED_PROVIDER for virtual/kernel by definition.
>>>>>    * Remove "virtual/kernel" from PROVIDES in alternate kernel
>>>>> builds.
>>>>>
>>>>> [PATCH v4] Another rebase onto master; no functional change.
>>>>> Improved description and testing steps.
>>>>
>>>> So I finally had a chance to get back to this and test build with
>>>> it, I
>>>> saw the following WARNING, which lead to the ERROR:
>>>>
>>>> WARNING: Variable key FILES_${PN}-dev (${includedir}
>>>> ${FILES_SOLIBSDEV}
>>>> ${libdir}/*.la ${libdir}/*.o ${libdir}/pkgconfig
>>>> ${datadir}/pkgconfig
>>>> ${datadir}/aclocal ${base_libdir}/*.o ${libdir}/${BPN}/*.la
>>>> ${base_libdir}/*.la) replaces original key FILES_linux-yocto-dev
>>>> (/boot/System.map* /boot/Module.symvers* /boot/config*
>>>> ${KERNEL_SRC_PATH}
>>>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build).
>>>> ERROR: linux-yocto-4.10.17+gitAUTOINC+e92bd55409_6648a34e00-r0
>>>> do_package: QA Issue: linux-yocto: Files/directories were installed
>>>> but
>>>> not shipped in any package:
>>>>     /boot/System.map-4.10.17-yocto-standard
>>>>     /boot/Module.symvers-4.10.17-yocto-standard
>>>>     /boot/config-4.10.17-yocto-standard
>>>> Please set FILES such that these items are packaged. Alternatively
>>>> if
>>>> they are unneeded, avoid installing them or delete them within
>>>> do_install.
>>>> linux-yocto: 3 installed and not shipped files. [installed-vs-
>>>> shipped]
>>>> ERROR: linux-yocto-4.10.17+gitAUTOINC+e92bd55409_6648a34e00-r0
>>>> do_package: Fatal QA errors found, failing task.
>>>> ERROR: linux-yocto-4.10.17+gitAUTOINC+e92bd55409_6648a34e00-r0
>>>> do_package: Function failed: do_package
>>>>
>>>> Something seems to be causing the FILES_linux-yocto-dev info to be
>>>> overridden, I have not tracked down the culprit yet.
>>>>
>>>
>>> `FILES_linux-yocto-dev` is set to the default value from OE's
>>> bitbake.conf. `FILES_kernel-dev` on the other hand is set by
>>> kernel.bbclass; when `KERNEL_PACKAGE_NAME` expands to `kernel`.
>>>
>>> I think the real issue here is that QA checks care about
>>> `FILES_${PN}-dev` at all even though that particular package name
>>> isn't
>>> listed in `PACKAGES` variable. I.e. `FILES_${PN}-dev` should be
>>> disregarded since the `linux-yocto` recipe doesn't create package
>>> `${PN}-dev`.
>>>
>>> Thoughts?
>>>
>> It's hard to special case this. After you sent this, I realized what I
>> did was set the KERNEL_PACKAGE_NAME to linux-yocto and because the
>> KERNEL_PACKAGE_NAME matched the actual recipe name we got the strange
>> ${PN} interaction, we might be able to add a test to flag that as an
>> error or warning in the kernel.bbclass.
>>
>> I am also seeing an issue when I build a 4.9 kernel and then set-up a
>> 4.10 kernel with the kernel-abiversion getting mis-matched from the
>> depmodwrapper.  Have you tested with different versions?  I know it
>> should work with a old kernel/userspace -> new kernel, but not from a
>> new kernel/userspace -> old kernel.
>>
> 
> I've also hit this issue.  Here's the error message if that's helpful at all:
> 
> WARNING: core-image-base-1.0-r0 do_rootfs: [log_check]
> core-image-base: found 2 warning messages in the logfile:
> [log_check] warning:
> %post(tiny-linux-4.10.17-yocto-tiny-4.10.17+git0+e92bd55409_6648a34e00-r0.qemux86)
> scriptlet failed, exit status 1
> [log_check] Warn: update-alternatives: bzImage has multiple providers
> with the same priority, please check
> /home/tripzero/Projects/poky-contrib/build/tmp/wo
> rk/qemux86-poky-linux/core-image-base/1.0-r0/rootfs/usr/lib/opkg/alternatives/bzImage
> for details
> 
> ERROR: core-image-base-1.0-r0 do_rootfs: [log_check] core-image-base:
> found 1 error message in the logfile:
> [log_check] Error: Kernel version 4.10.17-yocto-tiny does not match
> kernel-abiversion (4.10.17-yocto-standard)
> 

See my earlier response to Saul.

Can you send me your build procedure -- I.e. sequence of bitbake commands?

> 
> 
>> Sau!
>>
>>
>>>>
>>>> Sau!
>>>>
>>>>>
>>>>> ---
>>>>>    meta/classes/kernel-module-split.bbclass  |  9 ++--
>>>>>    meta/classes/kernel.bbclass               | 85
>>>>> ++++++++++++++++++---
>>>>> ----------
>>>>>    meta/conf/documentation.conf              |  1 +
>>>>>    meta/recipes-kernel/linux/linux-dtb.inc   |  2 +-
>>>>>    meta/recipes-kernel/linux/linux-yocto.inc |  2 +-
>>>>>    5 files changed, 59 insertions(+), 40 deletions(-)
>>>>>
>>>>> diff --git a/meta/classes/kernel-module-split.bbclass
>>>>> b/meta/classes/kernel-module-split.bbclass
>>>>> index 1035525dac..9716c5937b 100644
>>>>> --- a/meta/classes/kernel-module-split.bbclass
>>>>> +++ b/meta/classes/kernel-module-split.bbclass
>>>>> @@ -30,7 +30,7 @@ do_install_append() {
>>>>>
>>>>>    PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
>>>>>
>>>>> -KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
>>>>> +KERNEL_MODULES_META_PACKAGE ?= "${KERNEL_PACKAGE_NAME}-modules"
>>>>>
>>>>>    KERNEL_MODULE_PACKAGE_PREFIX ?= ""
>>>>>    KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
>>>>> @@ -129,16 +129,19 @@ python split_kernel_module_packages () {
>>>>>               postfix = format.split('%s')[1]
>>>>>               d.setVar('RPROVIDES_' + pkg, pkg.replace(postfix,
>>>>> ''))
>>>>>
>>>>> +    kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME", True)
>>>>> +    kernel_version = d.getVar("KERNEL_VERSION", True)
>>>>> +
>>>>>        module_regex = '^(.*)\.k?o$'
>>>>>
>>>>>        module_pattern_prefix =
>>>>> d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
>>>>>        module_pattern_suffix =
>>>>> d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
>>>>> -    module_pattern = module_pattern_prefix + 'kernel-module-%s'
>>>>> +
>>>>> module_pattern_suffix
>>>>> +    module_pattern = module_pattern_prefix + kernel_package_name
>>>>> +
>>>>> '-module-%s' + module_pattern_suffix
>>>>>
>>>>>        postinst = d.getVar('pkg_postinst_modules')
>>>>>        postrm = d.getVar('pkg_postrm_modules')
>>>>>
>>>>> -    modules = do_split_packages(d,
>>>>> root='${nonarch_base_libdir}/modules', file_regex=module_regex,
>>>>> output_pattern=module_pattern, description='%s kernel module',
>>>>> postinst=postinst, postrm=postrm, recursive=True,
>>>>> hook=frob_metadata,
>>>>> extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
>>>>> +    modules = do_split_packages(d,
>>>>> root='${nonarch_base_libdir}/modules', file_regex=module_regex,
>>>>> output_pattern=module_pattern, description='%s kernel module',
>>>>> postinst=postinst, postrm=postrm, recursive=True,
>>>>> hook=frob_metadata,
>>>>> extra_depends='%s-%s' % (kernel_package_name, kernel_version))
>>>>>        if modules:
>>>>>            metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
>>>>>            d.appendVar('RDEPENDS_' + metapkg, ' '+'
>>>>> '.join(modules))
>>>>> diff --git a/meta/classes/kernel.bbclass
>>>>> b/meta/classes/kernel.bbclass
>>>>> index 7670c7107a..7fa4509961 100644
>>>>> --- a/meta/classes/kernel.bbclass
>>>>> +++ b/meta/classes/kernel.bbclass
>>>>> @@ -1,6 +1,8 @@
>>>>>    inherit linux-kernel-base kernel-module-split
>>>>>
>>>>> -PROVIDES += "virtual/kernel"
>>>>> +KERNEL_PACKAGE_NAME ??= "kernel"
>>>>> +
>>>>> +PROVIDES += "${@ "virtual/kernel" if
>>>>> (d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel") else "" }"
>>>>>    DEPENDS += "virtual/${TARGET_PREFIX}binutils
>>>>> virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native"
>>>>>    PACKAGE_WRITE_DEPS += "depmodwrapper-cross virtual/update-
>>>>> alternatives-native"
>>>>>
>>>>> @@ -33,10 +35,23 @@ KERNEL_VERSION_PKG_NAME[vardepvalue] =
>>>>> "${LINUX_VERSION}"
>>>>>
>>>>>    python __anonymous () {
>>>>>
>>>>> +    # The default kernel recipe builds in a shared location
>>>>> defined
>>>>> by
>>>>> +    # bitbake/distro confs: STAGING_KERNEL_DIR and
>>>>> STAGING_KERNEL_BUILDDIR.
>>>>> +    # Set these variables to directories under ${WORKDIR} in
>>>>> alternate
>>>>> +    # kernel recipes (I.e. where KERNEL_PACKAGE_NAME != kernel)
>>>>> so
>>>>> that they
>>>>> +    # may build in parallel with the default kernel without
>>>>> clobbering.
>>>>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) != "kernel":
>>>>> +        workdir = d.getVar("WORKDIR", True)
>>>>> +        sourceDir = os.path.join(workdir, 'kernel-source')
>>>>> +        artifactsDir = os.path.join(workdir, 'kernel-build-
>>>>> artifacts')
>>>>> +        d.setVar("STAGING_KERNEL_DIR", sourceDir)
>>>>> +        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
>>>>> +
>>>>>        # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into
>>>>> KERNEL_IMAGETYPES
>>>>>        type = d.getVar('KERNEL_IMAGETYPE') or ""
>>>>>        alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>>>>>        types = d.getVar('KERNEL_IMAGETYPES') or ""
>>>>> +    kname = d.getVar('KERNEL_PACKAGE_NAME', True) or "kernel"
>>>>>        if type not in types.split():
>>>>>            types = (type + ' ' + types).strip()
>>>>>        if alttype not in types.split():
>>>>> @@ -53,22 +68,22 @@ python __anonymous () {
>>>>>            typelower = type.lower()
>>>>>            imagedest = d.getVar('KERNEL_IMAGEDEST')
>>>>>
>>>>> -        d.appendVar('PACKAGES', ' ' + 'kernel-image-' +
>>>>> typelower)
>>>>> +        d.appendVar('PACKAGES', ' %s-image-%s' % (kname,
>>>>> typelower))
>>>>>
>>>>> -        d.setVar('FILES_kernel-image-' + typelower, '/' +
>>>>> imagedest
>>>>> + '/' + type + '-${KERNEL_VERSION_NAME}')
>>>>> +        d.setVar('FILES_' + kname + '-image-' + typelower, '/' +
>>>>> imagedest + '/' + type + '-${KERNEL_VERSION_NAME}')
>>>>>
>>>>> -        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-
>>>>> image-' +
>>>>> typelower)
>>>>> +        d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s'
>>>>> %
>>>>> (kname, typelower))
>>>>>
>>>>> -        d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-
>>>>> ' +
>>>>> typelower + '-${KERNEL_VERSION_PKG_NAME}')
>>>>> +        d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-
>>>>> image-
>>>>> %s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>>>>>
>>>>> -        d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
>>>>> +        d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower),
>>>>> '1')
>>>>>
>>>>>            priority = d.getVar('KERNEL_PRIORITY')
>>>>>            postinst = '#!/bin/sh\n' + 'update-alternatives --
>>>>> install /'
>>>>> + imagedest + '/' + type + ' ' + type + ' ' + type + '-
>>>>> ${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
>>>>> -        d.setVar('pkg_postinst_kernel-image-' + typelower,
>>>>> postinst)
>>>>> +        d.setVar('pkg_postinst_' + kname + '-image-' +
>>>>> typelower,
>>>>> postinst)
>>>>>
>>>>>            postrm = '#!/bin/sh\n' + 'update-alternatives --remove'
>>>>> + '
>>>>> ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
>>>>> -        d.setVar('pkg_postrm_kernel-image-' + typelower, postrm)
>>>>> +        d.setVar('pkg_postrm_%s-image-%s' % (kname, typelower),
>>>>> postrm)
>>>>>
>>>>>        image = d.getVar('INITRAMFS_IMAGE')
>>>>>        if image:
>>>>> @@ -126,9 +141,9 @@ base_do_unpack_append () {
>>>>>
>>>>>    inherit kernel-arch deploy
>>>>>
>>>>> -PACKAGES_DYNAMIC += "^kernel-module-.*"
>>>>> -PACKAGES_DYNAMIC += "^kernel-image-.*"
>>>>> -PACKAGES_DYNAMIC += "^kernel-firmware-.*"
>>>>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
>>>>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-image-.*"
>>>>> +PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
>>>>>
>>>>>    export OS = "${TARGET_OS}"
>>>>>    export CROSS_COMPILE = "${TARGET_PREFIX}"
>>>>> @@ -371,9 +386,9 @@ do_shared_workdir_setscene () {
>>>>>
>>>>>    emit_depmod_pkgdata() {
>>>>>            # Stash data for depmod
>>>>> - install -d ${PKGDESTWORK}/kernel-depmod/
>>>>> - echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/kernel-
>>>>> depmod/kernel-abiversion
>>>>> - cp ${B}/System.map ${PKGDESTWORK}/kernel-
>>>>> depmod/System.map-
>>>>> ${KERNEL_VERSION}
>>>>> + install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
>>>>> + echo "${KERNEL_VERSION}" >
>>>>> ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-
>>>>> depmod/${KERNEL_PACKAGE_NAME}-
>>>>> abiversion
>>>>> + cp ${B}/System.map
>>>>> ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-
>>>>> depmod/System.map-${KERNEL_VERSION}
>>>>>    }
>>>>>
>>>>>    PACKAGEFUNCS += "emit_depmod_pkgdata"
>>>>> @@ -388,7 +403,7 @@ do_shared_workdir () {
>>>>>            # Store the kernel version in sysroots for module-
>>>>> base.bbclass
>>>>>            #
>>>>>
>>>>> - echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
>>>>> + echo "${KERNEL_VERSION}" >
>>>>> $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
>>>>>
>>>>>            # Copy files required for module builds
>>>>>            cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>>>>> @@ -486,28 +501,28 @@ EXPORT_FUNCTIONS do_compile do_install
>>>>> do_configure
>>>>>
>>>>>    # kernel-base becomes kernel-${KERNEL_VERSION}
>>>>>    # kernel-image becomes kernel-image-${KERNEL_VERSION}
>>>>> -PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image
>>>>> kernel-
>>>>> dev kernel-modules"
>>>>> +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
>>>>> ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
>>>>> ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
>>>>>    FILES_${PN} = ""
>>>>> -FILES_kernel-base =
>>>>> "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
>>>>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
>>>>> -FILES_kernel-image = ""
>>>>> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
>>>>> /boot/config* ${KERNEL_SRC_PATH}
>>>>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>>>>> -FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
>>>>> -FILES_kernel-modules = ""
>>>>> -RDEPENDS_kernel = "kernel-base"
>>>>> +FILES_${KERNEL_PACKAGE_NAME}-base =
>>>>> "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
>>>>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
>>>>> +FILES_${KERNEL_PACKAGE_NAME}-image = ""
>>>>> +FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map*
>>>>> /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}
>>>>> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>>>>> +FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux-
>>>>> ${KERNEL_VERSION_NAME}"
>>>>> +FILES_${KERNEL_PACKAGE_NAME}-modules = ""
>>>>> +RDEPENDS_${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base"
>>>>>    # Allow machines to override this dependency if kernel image
>>>>> files
>>>>> are
>>>>>    # not wanted in images as standard
>>>>> -RDEPENDS_kernel-base ?= "kernel-image"
>>>>> -PKG_kernel-image = "kernel-image-${@legitimize_package_name('${K
>>>>> ERNE
>>>>> L_VERSION}')}"
>>>>> -RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE'
>>>>> ,
>>>>> 'vmlinux', 'kernel-vmlinux', '', d)}"
>>>>> -PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_V
>>>>> ERSI
>>>>> ON}')}"
>>>>> -RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>>>>> -ALLOW_EMPTY_kernel = "1"
>>>>> -ALLOW_EMPTY_kernel-base = "1"
>>>>> -ALLOW_EMPTY_kernel-image = "1"
>>>>> -ALLOW_EMPTY_kernel-modules = "1"
>>>>> -DESCRIPTION_kernel-modules = "Kernel modules meta package"
>>>>> -
>>>>> -pkg_postinst_kernel-base () {
>>>>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-
>>>>> image"
>>>>> +PKG_${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-
>>>>> image-${@
>>>>> legitimize_package_name('${KERNEL_VERSION}')}"
>>>>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-image += "${@base_conditional('K
>>>>> ERNE
>>>>> L_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux', '',
>>>>> d)}"
>>>>> +PKG_${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@leg
>>>>> itim
>>>>> ize_package_name('${KERNEL_VERSION}')}"
>>>>> +RPROVIDES_${KERNEL_PACKAGE_NAME}-base +=
>>>>> "${KERNEL_PACKAGE_NAME}-
>>>>> ${KERNEL_VERSION}"
>>>>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} = "1"
>>>>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base = "1"
>>>>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image = "1"
>>>>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules = "1"
>>>>> +DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules = "Kernel modules
>>>>> meta
>>>>> package"
>>>>> +
>>>>> +pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
>>>>>            if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>>>>>                    mkdir -p $D/lib/modules/${KERNEL_VERSION}
>>>>>            fi
>>>>> @@ -521,7 +536,7 @@ pkg_postinst_kernel-base () {
>>>>>    PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
>>>>>
>>>>>    python split_kernel_packages () {
>>>>> -    do_split_packages(d, root='${nonarch_base_libdir}/firmware',
>>>>> file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$',
>>>>> output_pattern='kernel-
>>>>> firmware-%s', description='Firmware for %s', recursive=True,
>>>>> extra_depends='')
>>>>> +    do_split_packages(d, root='${nonarch_base_libdir}/firmware',
>>>>> file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$',
>>>>> output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s',
>>>>> description='Firmware for %s', recursive=True, extra_depends='')
>>>>>    }
>>>>>
>>>>>    # Many scripts want to look in arch/$arch/boot for the bootable
>>>>> diff --git a/meta/conf/documentation.conf
>>>>> b/meta/conf/documentation.conf
>>>>> index 35b9103b4a..e061b98de3 100644
>>>>> --- a/meta/conf/documentation.conf
>>>>> +++ b/meta/conf/documentation.conf
>>>>> @@ -248,6 +248,7 @@ KERNEL_IMAGETYPE[doc] = "The type of kernel
>>>>> to
>>>>> build for a device, usually set b
>>>>>    KERNEL_IMAGETYPES[doc] = "The list of types of kernel to build
>>>>> for a
>>>>> device, usually set by the machine configuration files and
>>>>> defaults
>>>>> to KERNEL_IMAGETYPE."
>>>>>    KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need
>>>>> to be
>>>>> auto-loaded during boot"
>>>>>    KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which
>>>>> the
>>>>> build system expects to find module_conf_* values that specify
>>>>> configuration for each of the modules"
>>>>> +KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages.
>>>>> Defaults to 'kernel'."
>>>>>    KERNEL_PATH[doc] = "The location of the kernel sources. This
>>>>> variable is set to the value of the STAGING_KERNEL_DIR within the
>>>>> module class (module.bbclass)."
>>>>>    KERNEL_SRC[doc] = "The location of the kernel sources. This
>>>>> variable
>>>>> is set to the value of the STAGING_KERNEL_DIR within the module
>>>>> class
>>>>> (module.bbclass)."
>>>>>    KFEATURE_DESCRIPTION[doc] = "Provides a short description of a
>>>>> configuration fragment. You use this variable in the .scc file
>>>>> that
>>>>> describes a configuration fragment file."
>>>>> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
>>>>> b/meta/recipes-
>>>>> kernel/linux/linux-dtb.inc
>>>>> index 0174c80d85..da6467bf9f 100644
>>>>> --- a/meta/recipes-kernel/linux/linux-dtb.inc
>>>>> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
>>>>> @@ -4,7 +4,7 @@ FILES_kernel-devicetree =
>>>>> "/${KERNEL_IMAGEDEST}/devicetree*"
>>>>>    PACKAGE_WRITE_DEPS += "virtual/update-alternatives-native"
>>>>>
>>>>>    python __anonymous () {
>>>>> -    d.appendVar("PACKAGES", " kernel-devicetree")
>>>>> +    d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-
>>>>> devicetree")
>>>>>    }
>>>>>
>>>>>    normalize_dtb () {
>>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>>>>> b/meta/recipes-kernel/linux/linux-yocto.inc
>>>>> index 637506a2a8..4e0ce029da 100644
>>>>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>>>>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>>>>> @@ -12,7 +12,7 @@ INC_PR = "r4"
>>>>>    # PREFERRED_PROVIDER for virtual/kernel. This avoids network
>>>>> access
>>>>> required
>>>>>    # by the use of AUTOREV SRCREVs, which are the default for this
>>>>> recipe.
>>>>>    python () {
>>>>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=
>>>>> d.getVar("PN"):
>>>>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and
>>>>> d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) !=
>>>>> d.getVar("PN",
>>>>> True):
>>>>>            d.delVar("BB_DONT_CACHE")
>>>>>            raise bb.parse.SkipPackage("Set
>>>>> PREFERRED_PROVIDER_virtual/kernel to %s to enable it" %
>>>>> (d.getVar("PN")))
>>>>>    }
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_mailman_listinfo_openembedded-2Dcore&d=DwIBaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=EXsasUKMXo4dlk7nFW3VDV8Z06QZKhwHTWyH5F0E6-c&s=aB_EDwul_sqlOGvfQSdFA8PpByxlshLeXbBRePWTJHs&e=

