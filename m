Return-Path: <haris.okanovic@ni.com>
X-Greylist: delayed 1120 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 26 Oct 2017 00:06:53 UTC
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id 602A6775DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 00:06:53 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v9PNkM5U015550; Wed, 25 Oct 2017 18:49:09 -0500
Received: from nam02-bl2-obe.outbound.protection.outlook.com
	(mail-bl2nam02lp0080.outbound.protection.outlook.com [207.46.163.80])
	by mx0b-00010702.pphosted.com with ESMTP id 2dtgrvmav5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 25 Oct 2017 18:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=saE2Kk694sTGl8bjY2gNsbFwdfFxOKKTTPAUfmpfmUA=;
	b=I60o7o+2OSlAG9nAL7rVTcRSx+BooBOZT5dAeQanGABqr0kqjGCUL9EhJ65HnzPP+eObgzDiM2D/+YgS3d5lzdHbwo+8B57oojF+OcWxDW2fu6mb1ZpbpzWq4jvz2u9BT6OjhqeLxqqLu/jC1tbmN7thxYRTvHTBDndOUvLMys8=
Received: from harisdt.amer.corp.natinst.com (130.164.62.171) by
	BN6PR04MB0690.namprd04.prod.outlook.com (10.172.198.11) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.156.4; Wed, 25 Oct 2017 23:49:05 +0000
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1500479806.27323.202.camel@intel.com>
	<20171019191901.13245-1-haris.okanovic@ni.com>
	<CADkTA4MToFo5X28sZPYBg1xAZJuGV5B-K334iTtkNCyeuqTzGw@mail.gmail.com>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <cfa45a5a-5fc7-5929-263d-f289402797dc@ni.com>
Date: Wed, 25 Oct 2017 18:49:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4MToFo5X28sZPYBg1xAZJuGV5B-K334iTtkNCyeuqTzGw@mail.gmail.com>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: CY4PR04CA0064.namprd04.prod.outlook.com (10.171.243.157) To
	BN6PR04MB0690.namprd04.prod.outlook.com (10.172.198.11)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eaa4467-c534-46ea-c562-08d51c02fb27
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627075)(201703031133081)(201702281549075)(2017052603238);
	SRVR:BN6PR04MB0690; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0690;
	3:1AyWQqLDAmNCa8EkKro4TIE5/vZQmr0guBbcbLshPKQ4GuPRTftORXKijh9eqGNYfn0aiwAfufcGaToouVfrxREkwbk1eFO8u9i5cNfmiIQQU0kMnE6m7AaM22K/bmUPR4qXNYuWzCkf3UnZK2ArIdzR9sl+Wx3lYmqqbt7Y1O1g0keFkMEdN6sCJtqnw2AFOXK7wH3uJJqP4lknhuG17Um/hQFNbt+yBCa+Y6GN4j85bQw1uIJN3w9V23NP2CnB;
	25:Yy9IQvjmpf46kJrLYH2DZ52hEIMFsKhkUXdcsn4VvdPRfODpFwB40f0280yOaEZ9aQzMOKNAMAbCYYvBZlsnPsnm/Ud104KRPfoA291Pu7jUTAAy0QxH7SJ70oPvmRqC5jE0PXl98aauhZWx72ilKO5RzXbJdYGtePfUtFwkl2PkbPikHf+kx/cgjrh3nW/PepgbYXI7onJ9amehGvfs1p8ANoguJYDUh0eRu7Ihz4su7EFMMTbybfDiY2LG4zYTjn2kCPMqEDcfhtf2w1M1hXC51Hb+3DLpzaQL5S2UX9TzOhnCggCRX+6bpO0pcYLGr4nH8wB6p6+Q/T+RYIPX/w==;
	31:wva/OO6i7p19aedP0iNLSd7h52D9m1axaIbX+vulvteBefw/OwI5qGLguVBwdCGubti9Fs7Ip9FY0zLwwGGnKJOMB1V6g7/6zzDRD7DMLpzFz5l0Mwvo9dNgroL3VGZklqFSAD7NXugIgx4Kq3RfeUGc2JCNQsK9gAhEjY1kRIZWfI4sEIdZ01/LB6ySg9jFSm7NHqjp+x5fUj47xyJef5Vk3lvpU6udVjiAN9kZXeA=
X-MS-TrafficTypeDiagnostic: BN6PR04MB0690:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0690;
	20:gHvsN2HmVzy8hbwno9YWUTrVmk04zRhUFgw1XBlmIzrZXDrG1kVR0nJQBh5wuGDlsjjxnPwf7IsxzW46+sGFz0XjHFFXx2kT/XhQ0/8VFX0o7+R8jRyyCY6BRVBcw3+LF04VqpCMp5+3buDUXKQM22To+TMPHDnAH6sz2fjtI/Tb0rShUB/aXeJWB59YKGzbpi51l7G4WmRAAjwRbrxJBLjfiKpVgvGbpGNFBURf670zp2UXSp0/eHEIIE5bAUAp1KAeGZKsR8677h2/uwy5+HHvLBqTlwxR4VCn7sUaQMNOTkZJKRdW1f5/PjgGen3Eb939gdkWanAAZ++3JL4tR1ftTgjSGLCFVZHcO8JJjdWCdR8qR4TcF94Al2eSXXMZ7v8GpLHJbLKNwFkhgK4+ZfUv3NPVirSwYCKD/ZlJP7XcK7KD2Z1TZg+xWSs5lP5LzTFP64PrmhYf/i/GMIvVWPo64eYvw6QQwm2NlgFKgTZ+DLoft6HeNCaU5o+zJeHmjrAkALXY6CL4lkinAfSkM0wM14vgpVxvNJc2zKs4nocup+Nf2PAuZUZoKTYlxloUWiH1pOAopBjki2efYE++Z8R24VlJTiZbfBd9xz0sGRU=
X-Exchange-Antispam-Report-Test: UriScan:(10436049006162)(788757137089)(145744241990776); 
X-Microsoft-Antispam-PRVS: <BN6PR04MB0690DFD6148FB1228188C556E5440@BN6PR04MB0690.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(10201501046)(100000703101)(100105400095)(3231020)(93006095)(93001095)(6041248)(20161123564025)(20161123562025)(201703131423075)(201703061421075)(20161123560025)(20161123558100)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR04MB0690; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR04MB0690; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0690;
	4:UXYeFAyCkQvMUlYCy0TVpJb4rd392iXUzM2jH/JSWcHmnIh9+/HmtRB9AyX6CqFofKb4CynZYb3QGa1DyEJkTgG8Szg9iYp+xlrI5kv2mK8gQEwnMlTG9TuD3glnuBHC4GGxTDlBKDPfW2ocXsNq0K7kRlsMuC/VBZpc4mSsghpVz3qA9ilf/nY6xKfUylkBe8wCKeA2FE3NlIdNCq0V5QQJJp2eBw4Br7NrHu88volhiJjsjufJErtW6GfizCjPN8roeZr5/0BTkvQoQG+bIyDrbhUDtkh8tDNS2PR6k1BKqKSJW5ELLAlN1cuMdf7YMp79MaBRNlWhLcXsczCRyHI7erJl+yrzvk4QcbV/cDI=
X-Forefront-PRVS: 0471B73328
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(376002)(346002)(189002)(199003)(24454002)(4326008)(230700001)(25786009)(81156014)(54906003)(508600001)(66066001)(36756003)(101416001)(68736007)(106356001)(54356999)(105586002)(50986999)(53546010)(76176999)(65826007)(966005)(65956001)(65806001)(47776003)(5660300001)(305945005)(53936002)(6246003)(31696002)(86362001)(575784001)(8936002)(6306002)(58126008)(97736004)(50466002)(33646002)(3846002)(2950100002)(6916009)(6116002)(6666003)(189998001)(81166006)(2906002)(39060400002)(23676002)(6486002)(16526018)(7736002)(83506002)(31686004)(6512007)(64126003)(6506006)(8676002)(229853002)(21314002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR04MB0690;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjA0TUIwNjkwOzIzOnVWV2JBTGlRSFBjaytsOVVtYzFZR3RyTG8y?=
	=?utf-8?B?aFEvNGhpQndLM3FmSGRkTWZPUzZpM0dvSlNKQndISXdybVpuT0VWRlFPYjAz?=
	=?utf-8?B?RG8zVmxEWE5ZeGhjQmdtc21RQ0x5NzZRNS9RaGVpYkJCem9qOEhYT3QwRWlM?=
	=?utf-8?B?U0dvcHNFeXR1VHI0ZDRMbndwdUxObWNJR2tqanNRTXFRZVBhZk9BSi9TU0ll?=
	=?utf-8?B?bFBYUVBXRFlpNytmSFFXb0dRWmhDV0lvYXZsMFFmUE1xM3FWRFV0OTI0NlBx?=
	=?utf-8?B?elZ2NlpZS0N6VzVwT29RQU5iQzRFUURTOW1GcTNTeGFLN2s3eXZydUJKaVFT?=
	=?utf-8?B?dFlCMzhML0xFMThLRTd1NEVQSzhnN1ZZRDl2MFRVUWZVTXQyeTFRbTUzaTNZ?=
	=?utf-8?B?SXgyMVFzdWR5RHdqK0JXRFNuL0pGOUZXRE56RVV3WndVMGNRYXQxM1VCVzRZ?=
	=?utf-8?B?ME94d2JKN2NXQU5jRS9XOStsWW9UekU3d0JlZXdlTWVYWGxhbWRlZmdjUW5P?=
	=?utf-8?B?UEkzWG5lTkJvdjBmUjlmUWVhTUdFRHNpNVJKTUNWbGtlNFV2VjB1K2pHNlNH?=
	=?utf-8?B?cyt6TkpETGRpTmhJZzNzcXdvb0ZGZGdVNXFkMi9Ka3RKWEVySWh3dTJsdktZ?=
	=?utf-8?B?eVhHam96ai9QNUVPd2U5ZkNxY2QyYXFTM3RqRTl4Sy9MdkQzZU9sQ1BIaEc0?=
	=?utf-8?B?aFAreUJybTE1OXo1a1krV0JhWHBtS3pJTkdITVZxc3htSUQ1VHJ5MmVTZU9m?=
	=?utf-8?B?SlBmUzhDUXg4WFVqRzNpaHhQQjl6aHdYNjNMMWxpU1JNQUZFQThabVVqZWNL?=
	=?utf-8?B?bnloUkhyNzJxbGFTczRqQVZaOFJ4OXg4Nk5RU0N2RjBOZG5CMHV3VzVGTU9Z?=
	=?utf-8?B?MDhZUGRaRmZSTnBLTlZ6anZRS1BKU3REazdubW5NYU5OU01td0FjM3l3TDYx?=
	=?utf-8?B?N1RnbnNURkZpS0llRE4xMCtDODN1Zm9sQTlidW9EWnpraXpFR1BEWStIbCtw?=
	=?utf-8?B?RFVRaWZMMUx4S1hoY1hRWHQ4a1hOWG55d2l5RHM1L3RNeXBXL0pTQjFOTkhI?=
	=?utf-8?B?cWdiSUNnUC9nZUNaNG9mK3YzUk1LYUszb3NtaUlJT1ZBSlRzQ3pxOTJmNUpJ?=
	=?utf-8?B?VHZVR2ZPd2srU1dBVHUvUEd1NXhORms2V1NXdEkzU0xpRnhpMDdOWU8xSEVT?=
	=?utf-8?B?eXRUSzNVVjFuYWhGTHlLRk4wWHZNNyttTmUwbFlkMHQ4VGpnSTB2OG5PbCs2?=
	=?utf-8?B?eS9RamdIQkR5dVFDeXIwcDMwT3ZzZStDT3NCbG1yUmRBY2JieDU3RzU5cTVC?=
	=?utf-8?B?c1ZIb0dQbTd6bi84ZzhjS1c4RERtMGxXU1dKeXVJRlEzNitkejdWTHhiUXI5?=
	=?utf-8?B?dDVpV0xOc1NpSzFsOGI1dXJWVnVycDVJN3FveEQ5UzZIakF1L2c0TDJBZjVl?=
	=?utf-8?B?V2wrekM3Y3lDWGp3YjJlWURma00rcHhOaEFmSFNkTGtubjhYSy9rUmVRQnJa?=
	=?utf-8?B?ZmNjRDFqZ0ZMZkJPbHJ0ank2aVhtMjRQeXg0WjEwWVdGM2dWM0tBam9sblM2?=
	=?utf-8?B?QWhLL2U5V3FMU3o4VlZweUFMekl4ZWRFeFBVaVZ0NUR1d2gzbTdrendnTCtz?=
	=?utf-8?B?dnkwQXNRZFZ3Wk5TRExCcjMvTnJrMVNCUkZHbnNBTnlPY2xndzUxL1pRK21I?=
	=?utf-8?B?bTIvR2FLeTBUQytPU1I2dzZ2am56ZkkyWFBaZkFySlVFSFY4bWE5ZEs3bVMy?=
	=?utf-8?B?QmhkVkN5NTFCS0tZcnN0eUMrRlF4Nm1jU0I2WFJGV1o4SVAvNmZydjlod2FS?=
	=?utf-8?B?WDNvWFUrQ2V6T0NKV3l5cGZqS0U3bWZJWWlpMEdFRElUV1RNVVF5K2dPNCti?=
	=?utf-8?Q?3/XWUHCqV4TLfARh/k0HgBBLqs4uadZz?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0690;
	6:DLyXk4t0AU53i2/5y8EmgzHpvaTkW6dzVb6l0Nzwf8CzLZKX/46uy9u6W3/OoaP3C8Rdz/hY+YwbXdmDMrliIyzD2nmAeqOGvAn2LBErMt73ojvf4R/O6A3iRhzeS6ayx6rsPJHU/zCOcpCYgWpzymsKuW27dFIfowWHXVy1aB+lhsHeoYI0Jn2NEOZFtARMh7UMXYBJXjjukNFzPXHgBUisSEwbsypVz4sCDmflolH9kp446VLbxQV7hcy018TgZRS1Awpfm3bbJfFcLFQTigq8QOjzjxMArZEl0LU2ytCEzjy+qqJstCnS5+iVAVkj1D8GIY0GxQfiSTKTQ8WSCQ==;
	5:NaFNJnj2IyCA2DwaibTQhaAg7aTfMlz6R8DyDuBhqrFhiMnF9n5qG7N4gxlwdgSI3c6CF7A+PVaikDDQWxn7MVpWpJzysZ8wVpIHKCVD/HzU8ky00TU5ek6MSFAv+HSoxDtXDBffZ9FszKR/eGbXug==;
	24:dhAnbbq+glhaabRdbxmTJNOFrw1g3z6bVlPG1s3KP2g9I5cZJzHaGkUgx1j3ZTsSRUfhzZLIvFaA42Uc9eNTv+OX9mBx5p7fsIzdHd63nmg=;
	7:jiLbhX5ncXtwr3osGNWFgbbTfOGjjUcmtwXWDUajauBtNowACu8++xMTPVVy0lsv0JYieFeMQLsiUGaMk/oJo+gqcmKauDmoj8fBVhUylaMV/r2yeUlR4LYWGyVp5jUGnG0vWKhobcZFiV8klLdhB/HsxNGYgIbRIX1orfmpvDQDjDIZ8Bmacln1pwnLuTpRMqewOBxhWzHB1u15qRCnoV/KXW+dEUscCkKGaSNBIyI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2017 23:49:05.9805 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eaa4467-c534-46ea-c562-08d51c02fb27
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0690
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
Cc: "Wold, Saul" <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, josh.hernstrom@ni.com
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
X-List-Received-Date: Thu, 26 Oct 2017 00:06:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/25/2017 03:00 AM, Bruce Ashfield wrote:
> On Thu, Oct 19, 2017 at 3:19 PM, Haris Okanovic <haris.okanovic@ni.com> wrote:
>> Some distros may want to provide alternate kernel "flavors" via feeds or
>> within bootable images. For example, readily available builds which
>> provide certain diagnostic features can enable developers and testers to
>> more quickly resolve issues by avoiding lengthy kernel builds.
>>
>> This change allows for building multiple flavors of the kernel and
>> module packages by templatizing kernel package names via a new
>> KERNEL_PACKAGE_NAME variable in kernel.bbclass. It defaults to the old
>> name of "kernel", but can be overridden by certain recipes providing
>> alternate kernel flavors.
>>
>> To maintain compatibility, recipes providing alternate kernel flavors
>> cannot be the "preferred provider" for virtual/kernel. This is because
>> OE puts the preferred provider's build and source at
>> "tmp-glibc/work-shared/$MACHINE/kernel-build-artifacts/" and
>> "tmp-glibc/work-shared/$MACHINE/kernel-source/" instead of
>> "tmp-glibc/work/*/$PN/" like other recipes. Therefore, recipes using the
>> default KERNEL_PACKAGE_NAME="kernel" follows the old semantics -- build
>> in the old location and may be preferred provider -- while recipes using
>> all other KERNEL_PACKAGE_NAME's build from the normal WORKDIR and don't
>> provide "virtual/kernel".
>>
>> Testing:
>>   1. Prepended `KERNEL_PACKAGE_NAME = "tiny-linux"` to
>>      linux-yocto-tiny_4.9.bb so that it may build alongside
>>      the main kernel.
>>   2. `bitbake linux-yocto linux-yocto-tiny` to build both kernel flavors.
>>   3. Verified image and modules IPKs exist for both:
>>      tmp-glibc/deploy/ipk/qemux86/kernel-* for linux-yocto
>>      tmp-glibc/deploy/ipk/qemux86/tiny-linux* for linux-yocto-tiny
>>   4. Verified linux-yocto is the "preferred provider", and was built in
>>      shared directory: tmp-glibc/work-shared/qemux86/kernel-*
>>   5. Appended `CORE_IMAGE_BASE_INSTALL += "tiny-linux"` to
>>      core-image-base.bb to include both kernel flavors.
>>   6. `bitbake core-image-base` to build an image.
>>   7. Verified image contains two bzImage's under /boot/, with
>>      "yocto-standard" selected to boot via symlink.
>>
>> Discussion threads:
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_pipermail_openembedded-2Dcore_2015-2DDecember_thread.html-23114122&d=DwIFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=IQK-3FiOavEFVw7leFD0d4BvVhNPMEK_t-k_zxTTplY&s=Mi4q3g-xO_2-FIVwIT0ndJOC_NzE0e4Z_VZm4iIkI14&e=
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_pipermail_openembedded-2Dcore_2017-2DJuly_thread.html-23139130&d=DwIFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=IQK-3FiOavEFVw7leFD0d4BvVhNPMEK_t-k_zxTTplY&s=-PHnINRO8z8mw3j15b6oAimJJFkMcyk_kr2c9mReYx0&e=
>>
>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
>> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
>> Coauthored-by: Gratian Crisan <gratian.crisan@ni.com>
>> Coauthored-by: Haris Okanovic <haris.okanovic@ni.com>
>> Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com>
>> ---
>> [PATCH v2] Change STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR to the
>> "work" directory in alternate kernel builds, instead of "work-shared",
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
>>   - depmodwrapper-cross: don't error when called from alt kernel recipes
>>   - kernel.bbclass: Don't install /boot/image symlink in alt recipes
>>
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_harisokanovic_openembedded-2Dcore_tree_dev_hokanovi_multi-2Dkernel-2Dpackages-2Dv8&d=DwIFaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=8Bziuw3IaCGjyrSAphuGwHmVdHcVwza-srUYwL9U_Ms&m=IQK-3FiOavEFVw7leFD0d4BvVhNPMEK_t-k_zxTTplY&s=WcRCf1pg_c3VTEyiF11sSomaRy_dFiFJE74X4QEFi80&e=
>> ---
>>   meta/classes/kernel-devicetree.bbclass             |   8 +-
>>   meta/classes/kernel-module-split.bbclass           |   9 +-
>>   meta/classes/kernel.bbclass                        | 114 +++++++++++++--------
>>   meta/conf/documentation.conf                       |   1 +
>>   .../recipes-kernel/kmod/depmodwrapper-cross_1.0.bb |  14 +--
>>   meta/recipes-kernel/linux/linux-yocto.inc          |   2 +-
>>   6 files changed, 90 insertions(+), 58 deletions(-)
>>
>> diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
>> index 6e08be4b70..4f80cc62eb 100644
>> --- a/meta/classes/kernel-devicetree.bbclass
>> +++ b/meta/classes/kernel-devicetree.bbclass
>> @@ -1,10 +1,10 @@
>>   # Support for device tree generation
>>   PACKAGES_append = " \
>> -    kernel-devicetree \
>> -    ${@['kernel-image-zimage-bundle', ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
>> +    ${KERNEL_PACKAGE_NAME}-devicetree \
>> +    ${@[d.getVar('KERNEL_PACKAGE_NAME') + '-image-zimage-bundle', ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
>>   "
>> -FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
>> -FILES_kernel-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
>> +FILES_${KERNEL_PACKAGE_NAME}-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
>> +FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
>>
>>   # Generate kernel+devicetree bundle
>>   KERNEL_DEVICETREE_BUNDLE ?= "0"
>> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
>> index 1035525dac..73c7f18c78 100644
>> --- a/meta/classes/kernel-module-split.bbclass
>> +++ b/meta/classes/kernel-module-split.bbclass
>> @@ -30,7 +30,7 @@ do_install_append() {
>>
>>   PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
>>
>> -KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
>> +KERNEL_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME", True) or "kernel" }-modules"
>>
>>   KERNEL_MODULE_PACKAGE_PREFIX ?= ""
>>   KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
>> @@ -129,16 +129,19 @@ python split_kernel_module_packages () {
>>              postfix = format.split('%s')[1]
>>              d.setVar('RPROVIDES_' + pkg, pkg.replace(postfix, ''))
>>
>> +    kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME", True) or "kernel"
>> +    kernel_version = d.getVar("KERNEL_VERSION", True)
> 
> Minor 'nit, is this just a cleanup and not part of the technical bits
> of the patch ?
> When making changes to a complex recipe .. it really is a better idea to do this
> in a separate patch.
> 
> If I've missed how this is related to the new KERNEL_PACKAGE_NAME, then
> disregard that comment. i.e. you really can't mix the new variable and
> the d.getVar
> call in the do_split_packages. Either way, no issue .. that use of a
> variable just
> jumped out to me as unrelated to the actual package name varying.
> 

Kernel images and their modules are tightly coupled. To the best of my 
knowledge, there's no guarantee two different versions (or even two 
different configurations of the same version) of /boot/*Image can 
successfully load the other's modules. It's therefore necessary to 
package an alternate kernel's modules separately so that it can be 
installed along side alternate kernel images. Otherwise, those alternate 
images are not very useful unless they're configured without module 
support. I argue that module support is common enough to include these 
changes in the same patch, but I suppose that reasoning is somewhat 
subjective and debatable!

>> +
>>       module_regex = '^(.*)\.k?o$'
>>
>>       module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
>>       module_pattern_suffix = d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
>> -    module_pattern = module_pattern_prefix + 'kernel-module-%s' + module_pattern_suffix
>> +    module_pattern = module_pattern_prefix + kernel_package_name + '-module-%s' + module_pattern_suffix
>>
>>       postinst = d.getVar('pkg_postinst_modules')
>>       postrm = d.getVar('pkg_postrm_modules')
>>
>> -    modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
>> +    modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, kernel_version))
>>       if modules:
>>           metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
>>           d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 756707a3c2..48b718d777 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -1,6 +1,9 @@
>>   inherit linux-kernel-base kernel-module-split
>>
>> -PROVIDES += "virtual/kernel"
>> +KERNEL_PACKAGE_NAME ??= "kernel"
>> +KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel") else d.getVar("KERNEL_PACKAGE_NAME", True) }"
>> +
>> +PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel") else "" }"
>>   DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native"
>>   PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
>>
>> @@ -34,11 +37,32 @@ KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION')
>>   KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
>>
>>   python __anonymous () {
>> +    pn = d.getVar("PN", True)
>> +    kpn = d.getVar("KERNEL_PACKAGE_NAME", True)
>> +
>> +    # XXX Remove this after bug 11905 is resolved
>> +    #  FILES_${KERNEL_PACKAGE_NAME}-dev doesn't expand correctly
>> +    if kpn == pn:
>> +        bb.warn("Some packages (E.g. *-dev) might be missing due to "
>> +                "bug 11905 (variable KERNEL_PACKAGE_NAME == PN)")
>> +
>> +    # The default kernel recipe builds in a shared location defined by
>> +    # bitbake/distro confs: STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR.
>> +    # Set these variables to directories under ${WORKDIR} in alternate
>> +    # kernel recipes (I.e. where KERNEL_PACKAGE_NAME != kernel) so that they
>> +    # may build in parallel with the default kernel without clobbering.
>> +    if kpn != "kernel":
>> +        workdir = d.getVar("WORKDIR", True)
>> +        sourceDir = os.path.join(workdir, 'kernel-source')
>> +        artifactsDir = os.path.join(workdir, 'kernel-build-artifacts')
>> +        d.setVar("STAGING_KERNEL_DIR", sourceDir)
>> +        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
>>
>>       # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
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
>> -        d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
>> +        d.setVar('FILES_' + kname + '-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
>>
>> -        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' + typelower)
>> +        d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (kname, typelower))
>>
>> -        d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-' + typelower + '-${KERNEL_VERSION_PKG_NAME}')
>> +        d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>>
>> -        d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
>> +        d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
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
>>          install -d ${D}/boot
>>          for type in ${KERNEL_IMAGETYPES} ; do
>>                  install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} ${D}/${KERNEL_IMAGEDEST}/${type}-${KERNEL_VERSION}
>> -               ln -sf ${type}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${type}
>> +               if [ "${KERNEL_PACKAGE_NAME}" == "kernel" ]; then
>> +                       ln -sf ${type}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${type}
>> +               fi
>>          done
>>          install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>>          install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
>> @@ -393,9 +419,9 @@ do_shared_workdir_setscene () {
>>
>>   emit_depmod_pkgdata() {
>>          # Stash data for depmod
>> -       install -d ${PKGDESTWORK}/kernel-depmod/
>> -       echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/kernel-depmod/kernel-abiversion
>> -       cp ${B}/System.map ${PKGDESTWORK}/kernel-depmod/System.map-${KERNEL_VERSION}
>> +       install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
>> +       echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/${KERNEL_PACKAGE_NAME}-abiversion
>> +       cp ${B}/System.map ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/System.map-${KERNEL_VERSION}
>>   }
>>
>>   PACKAGEFUNCS += "emit_depmod_pkgdata"
>> @@ -410,7 +436,7 @@ do_shared_workdir () {
>>          # Store the kernel version in sysroots for module-base.bbclass
>>          #
>>
>> -       echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
>> +       echo "${KERNEL_VERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
>>
>>          # Copy files required for module builds
>>          cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>> @@ -508,28 +534,28 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>>
>>   # kernel-base becomes kernel-${KERNEL_VERSION}
>>   # kernel-image becomes kernel-image-${KERNEL_VERSION}
>> -PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
>> +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
>>   FILES_${PN} = ""
>> -FILES_kernel-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
>> -FILES_kernel-image = ""
>> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>> -FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
>> -FILES_kernel-modules = ""
>> -RDEPENDS_kernel = "kernel-base"
>> +FILES_${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
>> +FILES_${KERNEL_PACKAGE_NAME}-image = ""
>> +FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>> +FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
>> +FILES_${KERNEL_PACKAGE_NAME}-modules = ""
>> +RDEPENDS_${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base"
>>   # Allow machines to override this dependency if kernel image files are
>>   # not wanted in images as standard
>> -RDEPENDS_kernel-base ?= "kernel-image"
>> -PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
>> -RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux', 'kernel-vmlinux', '', d)}"
>> -PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
>> -RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>> -ALLOW_EMPTY_kernel = "1"
>> -ALLOW_EMPTY_kernel-base = "1"
>> -ALLOW_EMPTY_kernel-image = "1"
>> -ALLOW_EMPTY_kernel-modules = "1"
>> -DESCRIPTION_kernel-modules = "Kernel modules meta package"
>> -
>> -pkg_postinst_kernel-base () {
>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image"
>> +PKG_${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-image += "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
>> +PKG_${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name('${KERNEL_VERSION}')}"
>> +RPROVIDES_${KERNEL_PACKAGE_NAME}-base += "${KERNEL_PACKAGE_NAME}-${KERNEL_VERSION}"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} = "1"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base = "1"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image = "1"
>> +ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules = "1"
>> +DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules = "Kernel modules meta package"
>> +
>> +pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
>>          if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>>                  mkdir -p $D/lib/modules/${KERNEL_VERSION}
>>          fi
>> @@ -543,7 +569,7 @@ pkg_postinst_kernel-base () {
>>   PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
>>
>>   python split_kernel_packages () {
>> -    do_split_packages(d, root='${nonarch_base_libdir}/firmware', file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>> +    do_split_packages(d, root='${nonarch_base_libdir}/firmware', file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>>   }
>>
>>   # Many scripts want to look in arch/$arch/boot for the bootable
>> @@ -626,21 +652,27 @@ MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
>>   MODULE_TARBALL_DEPLOY ?= "1"
>>
>>   kernel_do_deploy() {
>> +       deployDir="${DEPLOYDIR}"
>> +       if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
>> +               deployDir="${DEPLOYDIR}/${KERNEL_DEPLOYSUBDIR}"
>> +               mkdir "$deployDir"
>> +       fi
>> +
>>          for type in ${KERNEL_IMAGETYPES} ; do
>>                  base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
>> -               install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} ${DEPLOYDIR}/${base_name}.bin
>> +               install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} $deployDir/${base_name}.bin
>>          done
>>          if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>>                  mkdir -p ${D}/lib
>> -               tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
>> -               ln -sf ${MODULE_TARBALL_BASE_NAME} ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
>> +               tar -cvzf $deployDir/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
>> +               ln -sf ${MODULE_TARBALL_BASE_NAME} $deployDir/${MODULE_TARBALL_SYMLINK_NAME}
>>          fi
>>
>>          for type in ${KERNEL_IMAGETYPES} ; do
>>                  base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
>>                  symlink_name=${type}-${KERNEL_IMAGE_SYMLINK_NAME}
>> -               ln -sf ${base_name}.bin ${DEPLOYDIR}/${symlink_name}.bin
>> -               ln -sf ${base_name}.bin ${DEPLOYDIR}/${type}
>> +               ln -sf ${base_name}.bin $deployDir/${symlink_name}.bin
>> +               ln -sf ${base_name}.bin $deployDir/${type}
>>          done
>>
>>          cd ${B}
>> @@ -650,8 +682,8 @@ kernel_do_deploy() {
>>                          echo "Copying deploy ${type} kernel-initramfs image and setting up links..."
>>                          initramfs_base_name=${type}-${INITRAMFS_BASE_NAME}
>>                          initramfs_symlink_name=${type}-initramfs-${MACHINE}
>> -                       install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.initramfs ${DEPLOYDIR}/${initramfs_base_name}.bin
>> -                       ln -sf ${initramfs_base_name}.bin ${DEPLOYDIR}/${initramfs_symlink_name}.bin
>> +                       install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.initramfs $deployDir/${initramfs_base_name}.bin
>> +                       ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
>>                  fi
>>          done
>>   }
>> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
>> index a55e2836b5..2c88504fb9 100644
>> --- a/meta/conf/documentation.conf
>> +++ b/meta/conf/documentation.conf
>> @@ -247,6 +247,7 @@ KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device, usually set b
>>   KERNEL_IMAGETYPES[doc] = "The list of types of kernel to build for a device, usually set by the machine configuration files and defaults to KERNEL_IMAGETYPE."
>>   KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be auto-loaded during boot"
>>   KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the build system expects to find module_conf_* values that specify configuration for each of the modules"
>> +KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages. Defaults to 'kernel'."
>>   KERNEL_PATH[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
>>   KERNEL_SRC[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
>>   KFEATURE_DESCRIPTION[doc] = "Provides a short description of a configuration fragment. You use this variable in the .scc file that describes a configuration fragment file."
>> diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>> index 44d013f29d..2eec921728 100644
>> --- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>> +++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>> @@ -23,17 +23,13 @@ if [ "\$1" != "-a" -o "\$2" != "-b" ]; then
>>       echo "Usage: depmodwrapper -a -b rootfs KERNEL_VERSION" >&2
>>       exit 1
>>   fi
>> -if [ ! -r ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion ]; then
>> -    echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion" >&2
>> -else
>> -    kernelabi=\$(cat ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion)
>> -    if [ "\$kernelabi" != "\$4" ]; then
>> -        echo "Error: Kernel version \$4 does not match kernel-abiversion (\$kernelabi)" >&2
>> -        exit 1
> 
> Why is the kernel abi check being dropped ? Or is is somehow relocated and the
> diff is just hiding it from me ?
> 
> I see you referencing the depmod wrapper change in the v8 summary, but it
> isn't clear to me that removing the check completely is a good idea.
> 
> The changes look good to me in general, just my comment and question
> above.
>
The abi check moved down a few lines...

> Bruce
> 
>> -    fi
>> +
>> +kernelabi=""
>> +if [ -r "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion" ]; then
>> +    kernelabi=\$(cat "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion")
>>   fi
>>
>> -if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ]; then
>> +if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ] || [ "\$kernelabi" != "\$4" ]; then

...to here.

Depmodwrapper conditionally passes a `-F .../System.map` parameter to 
depmod when installing the main kernel, dropping it otherwise (now with 
a warning instead of an error). This shouldn't alter depmod's behavior 
since -F is only significant when paired with -e, which not presently 
being used. It's necessary since an erroring depmodwrapper prevents 
installing alternate kernels into offline images.

>>       echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/System.map-\$4" >&2
>>       exec env depmod "\$1" "\$2" "\$3" "\$4"
>>   else
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
>> index 9c1f61be75..8a70eb5018 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> @@ -12,7 +12,7 @@ INC_PR = "r4"
>>   # PREFERRED_PROVIDER for virtual/kernel. This avoids network access required
>>   # by the use of AUTOREV SRCREVs, which are the default for this recipe.
>>   python () {
>> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != d.getVar("PN"):
>> +    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != d.getVar("PN", True):
>>           d.delVar("BB_DONT_CACHE")
>>           raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to %s to enable it" % (d.getVar("PN")))
>>   }
>> --
>> 2.14.2
>>
> 
> 
> 

-- Haris

