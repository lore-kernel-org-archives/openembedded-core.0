Return-Path: <mkelly@xevo.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0069.outbound.protection.outlook.com [104.47.40.69])
	by mail.openembedded.org (Postfix) with ESMTP id C847378693
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 18:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=zOXVb0UT6O5YoLDuzEF2qzYJwRAkGmAVSSwFsV+bxZI=;
	b=uv+XXVksu5yTOfuP7QiVWPA0O/pjGW5wifyzt2SmIm8xpJXHShZHOQLKjlNjAxmgEB+fvSf8TvD4fHZnyetrfSX6VlLBsdlI7SomvDxy5DC5cPh87kqijWu5pU72lvcjY8E7s96tO8md3xVKuPEb70kvx5cMFzts8i+4gbMP4JE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [192.168.0.3] (71.35.172.156) by
	MWHPR0101MB2944.prod.exchangelabs.com (10.174.170.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.20.218.12; Wed, 15 Nov 2017 18:09:45 +0000
To: openembedded-core@lists.openembedded.org
References: <20171115175303.3557-1-mkelly@xevo.com>
	<20171115180259.2783.41801@do.openembedded.org>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <a1024589-7c42-6152-85e7-c981a1af017d@xevo.com>
Date: Wed, 15 Nov 2017 10:09:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171115180259.2783.41801@do.openembedded.org>
X-Originating-IP: [71.35.172.156]
X-ClientProxiedBy: CY4PR1101CA0021.namprd11.prod.outlook.com (10.172.74.159)
	To MWHPR0101MB2944.prod.exchangelabs.com (10.174.170.15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3a962c6-27e5-458e-420c-08d52c540d44
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:MWHPR0101MB2944; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	3:zJ3+J5xyGgUKxxFkrH20xI0NdcF+O99CosNjAf0xGOuakHaUhGTdbPTBM4k9HAEGZlpv8lcC8PdOtWnxmUaZHBSDChzBJxzM7VRxznBK4IFFSyc5I8V+ChG7XsmIGjNyzRK/5K/Bfo/13FbxykNy8nNJZHZ7nKEHHcYPzH3mTqBJm+wHALyT1qjkP/+utKyDM9B8qeuNPNYKSikbTfX3BNBYjl/wigHr4gVS014HgJvVV+wKCEN29ujtpsFe+be+;
	25:xo79SeUNpK8ixTu6zhMajF452+bJxxyKO6M78M0/vBiEB6Dsdx2pG68rvXFOdf3qw7DXJgF0R+ZsMgDk8QkbfFQIMlWvigmMCxYrvubkY2cWErQnNUxeY3yuQRez+T/nNIGthu6+jOHOne7+lQBIjBRzbRW/KR7MBBHgGsPpEmYDNDJNYsQeLvqe66htVfjp/0RxMDmv2q3OlyKfTnuORfmXSbJmXnQYPr7uDdlElE8n0zW+a/8yQ1A9rP4l6mEm6HKUjg17yH/NHIRpuhGJeyeKrw9bFvweAIQBsRpf2Z1yuqcF3fEifwuatPxXJDtQAGfzkoqc9sLLFSJylwxqsQ==;
	31:BYG/uO0rrH0c7SUUHbfc/GVs8c0U2ilYu9l2ANdGzA3/sXyRKIh1Jcqf+fDmC+werwAAzzD56rBQrw0jtN7y/kKTveTxvsouyT492XIal5wPDw+43LoQD6FSTrJH7Ws32Fe2jT+u5O72rcqo8eIeavrJrpVjOZ3P1q3s8GI5GgfqcI+Rr79LZhEnqFzqdPTpjKbP2sHZ/FG/9uoYliAJQEXk6wQTlusv0+GpBqig6+I=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2944:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	20:Tw2uSUjF+GBL2a5+3M/FZO8WQ11jhGnNyEZZmzzWRbAbq3JIEvpTx88DZUOun1UNKZlrEFVD/NNS/XJI0rrjOFOFruOlwQgW4HpNBJyIkJeanX92B1aCU/3BvMlvUth3XblmoExPQeTR7u18o9ZgJdMd3O+MlZmv4ijhoTnrP5PRbg3NfS284muQNRxsplV3KfewWBkYOLQqS4eguW3igXVQ0VsDZAndwpqP4RhhebNnlZN7Vgm9JDJxjow/+p9bySeM93iWJMOEVDABnr8HGCjSTuJK9BEGlY81HiKdBsuIeBs6skPCXfCvDgvn9Wf6UwC22yPANWRMB1R7Blr5Za+NZaLqZR+PpfBUmRvlKE01Csf2bc0W8QODVNKXIL/eUBNW7uHfhSmm7rbkjzjuFDYsvx8HgS2gG/h9h98Ddjc=;
	4:FdvQl8YSXXg0GwNElz+X13qqgVaiPwCLGLgyfRsWfA/8MZFck96Qk65Awz+tZp4TGi5237Hbp9Z5O7uvqip9QBMdi0fZAwJmL8mIGplMY+daEhA+WKj13r0KQVUDEgiHIDJik6td+G73V53o3CtBTVK8EsnwvLXTY4J+zxUzFrMXpcOktl/EQj4Rk+lull588HBWyVaNlFnluPpma7TUFBhrcnPi2umDKS6EKPnLe5XEEW03OxU0VoGSukNykevn1f4mk90PJQ3jgdpS1rFhiyUC189rM/dwV8rDK0PO4wpqFoC2MvHe6MlcSrjIRCjz
X-Microsoft-Antispam-PRVS: <MWHPR0101MB2944FC4F3610C9B384549B35AB290@MWHPR0101MB2944.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(100000703101)(100105400095)(3231022)(10201501046)(3002001)(6041248)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123558100)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0101MB2944; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0101MB2944; 
X-Forefront-PRVS: 0492FD61DD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(6049001)(376002)(346002)(39830400002)(24454002)(199003)(189002)(54356999)(53936002)(50466002)(189998001)(33646002)(76176999)(65956001)(2361001)(478600001)(6116002)(229853002)(101416001)(68736007)(66066001)(316002)(230700001)(3846002)(64126003)(16576012)(966005)(16526018)(58126008)(2351001)(47776003)(50986999)(36756003)(53546010)(65806001)(97736004)(77096006)(31686004)(106356001)(65826007)(81166006)(81156014)(345774005)(305945005)(117156002)(7736002)(6916009)(2950100002)(83506002)(6306002)(8936002)(5660300001)(6246003)(2906002)(31696002)(67846002)(6666003)(6486002)(25786009)(86362001)(23676003)(90366009)(105586002)(562404015);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2944; H:[192.168.0.3];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDQ7MjM6ekJCaXVmNjNLYW14aWZmNU5LTy8yS1N1?=
	=?utf-8?B?R1FHMEZCOCtIc1VKdm13Qk9uekNBWmtGa3Z0OC9aMXdiZUVzUm02ckw1clhD?=
	=?utf-8?B?WWZqVnQ5QzVqOXEzWnRmbUF3Q0tUVldJOXlvRGpvSlp6ZzlwUnA2eFdvYlpH?=
	=?utf-8?B?YzBqcW9VUlF3eTExNzRRaUZMcjlCRmtxZDhmczBVajdVKytrOVFxRU10WW92?=
	=?utf-8?B?Z2lNSnJPamVTRnVVdWdGOXREdmVteVhtdTJmRnAwNVlWNG5FZHhpaUJUVFBL?=
	=?utf-8?B?bVF4VndsY0xYRFd0SE1aSWdRSWhscU8vbVljeGR1TjhBK2UzWjhSeTlwVUxk?=
	=?utf-8?B?c0FwVVdZRENHOCtWTEN4bWhtR2pxOWFHeHFkNWhSemk1Mm4yamZIMktGallM?=
	=?utf-8?B?N04zOGE4dkovZ3ZPODJ5SUFLQndsUytvbzVkZkptS0kwdTVSSXFMUmszTUZ1?=
	=?utf-8?B?NkpQT2M1dkRQbEJ5djZ6TE5MaU1kTjdPaFloaDg4T0hQejhVZi92TWRwRXJF?=
	=?utf-8?B?cTNaMjUrTS9qbWJiWFZZRTZkanpPNWRYYzBocHBEWWh2V1BWNmkzYlM5Q0Vt?=
	=?utf-8?B?Y2Zja2lmbVplQmJtbFgvUnhkNlZXWGtMMzhzcEVxNkp6bFdMNlNyM1k1RzJM?=
	=?utf-8?B?QUsxQUY5a1ljNGZPaEdyaU8wTjUvUE9RbHFJMmhpU3ZUUXRIN2pGM011cHRx?=
	=?utf-8?B?TUxpQTFIRmErdVQwNWdkbG13Z3BGQjBWWG54dWVCYytkakVXU3I4ZlJtUS9L?=
	=?utf-8?B?TzFPbXVuRUY1Y3prUWZlbUI0Y0ZzRkhlOTlqWmtXczJFOGlwc01tM3NTdGpk?=
	=?utf-8?B?Qk5md0VTdlBoMHZuMVdnYk9NU0hra0UrSVFxMSs2elVRaXlTTlU3eXFFa2dx?=
	=?utf-8?B?ZXBwVXBPVkxqbUxCek1URmpSTWt2dFNBT3U4TDJVSDU2dE9zZGtrc3ZGVzhZ?=
	=?utf-8?B?eXhiS0xKUHVuWlNSL0FHTWNHd280andDQlAzVVlnYTM0TXUyZDZ4U3VDRVRF?=
	=?utf-8?B?dmVGWGRQdDdDZHEzRGFlenA3Wk1jUFA5b0dtZmJ2MEdHQVFVR2R5Y1o0Zzht?=
	=?utf-8?B?SDRoMEp1bkREMnFIbXIxZFYycm1iRVRNSHdJbGtzNzE1QTY1SlJrbitxb1Bz?=
	=?utf-8?B?a1VObUlySHhWam5xTnF1akFLQkVqREtpTUc0bmwvSWVOUHBpTkc5TEI5SXlk?=
	=?utf-8?B?TFBCZXU1bVhJQmxqaVBkS3N3cUFlYUdMbDZ6bVQyeGZLdVJJU2REdFNhdTUx?=
	=?utf-8?B?NVJHalp4RW01K2pMRUJFdkRKc2oyVXFCeXYyRGtmdHRpNjZtYnltQzhZRVdv?=
	=?utf-8?B?dE92dGhBbzFmMmdiZHFjdVZtcFBiUUpNYTFwd29WREpKdTM5YTd0TEYxcEds?=
	=?utf-8?B?ODY1a1V5MjhsYlJKMEVqNFdpVWpaTlk3b2Uyd2hIN1FQTGEwMnkxajhCdXEy?=
	=?utf-8?B?RlpUM3IzL2NHOHhXUFpFakFXRVl0d3E3UE16NXN3dWdINnFkbUIxbndxN21Z?=
	=?utf-8?B?NHpxbGFPamh3ZVByNkVmdWRCWlNIUTlVOEpHaEtDelRFQjh5dEJFYUIvL25v?=
	=?utf-8?B?T05hbzJDU09UbU9pOHBOYklQNVVCVDJNK2IrNHdORHQrdUFKYVEyZVlpNnpl?=
	=?utf-8?B?Q0h3NUxmM2dLbUNHOWYxNi9qM2llbkhCdnhnYm1UcUFlcU5nVmJDTmU0dEpp?=
	=?utf-8?B?Mm5OenR4SFJZRkJabWdnQUlaWHpIeHVzZytpLzJEVmoyYmxDWmhEUHpwUEJS?=
	=?utf-8?B?YTAwQnFVOGNDREs1SU0xUHJrUkZmYU04SUFRUVJ6S3VzRkNuQVlsdk9JQm5V?=
	=?utf-8?B?dHFab3EwNnd3SEU3RHV5S1VKNWZsS2I2V3h3c1ZNb1hwN2JJdTY4QS9JdmNN?=
	=?utf-8?B?Yk1RRm9iSTBzMXpQcFJoUnN6R0FuTjl1NkNnRWI4NWNMbjVVbk0zd2hqazV6?=
	=?utf-8?B?MC9MRXJpbjZGTlNHc0JEcmsxYnJ3Z0dOdk9iWUh6ajNnR0ZqQktleThzdEsz?=
	=?utf-8?B?MEU1OFhiVjB5bGZrNjhmdm1WY001VjJ4YTV2YXZnPT0=?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	6:Uvcri+b41ckb/RjmKXereDqw32lS/x3tzdC30lYOIBE8Z8P4NKiFHcDqccCEzKcUf+4bYhtPP1cKbnfL3pv7P8LZoJXsTfUoxG6EN0/8d48YU1WgtA+KtsaOcr9gMZwbof+g2QWzgi7F9NpBiKQ7Pv5AQg2KhlgJlBVmcvai5crhxo+J/8gbNGyUmn7tOtU6MHgM2xFDhvcnAUrP42FhvXOoG9l2AmIRPgr+9qyRth69KvPKebMDNUkqJNK9KWZAL2T72OWP36IdNA6vfHrcbO4CKpHx8jcktWgIkXJf7M5Aw4ueNoMg0pU9lsr3TRIVrweKhbX6PEJRheoNiL3fpzPXQ5Ph/QfLQbj914JIGtw=;
	5:Vr6kCW3EibrJAjlEkuk80x1+WFhlrh5bBG42gQQaaGrZMkTiXZ9SzH9SFzEzYOJBjBrw7QVBZppWNJBFwyEkwTl1IYpLaWXbz3eN9x8TSmjTc6hdQ7LXwJYlxXSXIZAE3jLxW87ekUHC6q0oP9rW1CbgoAQVZAjSRkt/bcV/r0I=;
	24:mGLjzvMocVmF5zLSSqbMc+OqnJSbG/dgRgRrmAptFdJYLdUkKvrWlcjAWoWJBZWlSyZKDBkV0rKXqwlRvvUwb6EgapRXuuwcHS0576Fb0fw=;
	7:8DzXI5IA498zvjO4LL6a6MQU+IFkc1RLLGyvPid/6GjboqxHpC2eNqaHczMaaJ6Rc43JicUX//ujUNFLBbfgT/Icx1tWdY8/ksrUcfM/dCZDgTDMLC6MMetmdzzf7dmqDEDEvhBh106NK/f9O3O7fq3skQpR2pyXPO6tv3o1wWOsjNF1TQbvV+sbrz32Jjrq+IRBntyC2+jxIH+ol7bJ60LzMPP+n2keFC+uVF1qT3c+uk28IYs6QPFxSK6G/Uzw
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2017 18:09:45.2682 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a962c6-27e5-458e-420c-08d52c540d44
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2944
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG1lc29uIGJ1Z2ZpeA==?=
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
X-List-Received-Date: Wed, 15 Nov 2017 18:23:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is expected, as the patch is intended to apply to Alexander 
Kanavin's poky-contrib akanavin/meson branch, not oe-core master.

On 11/15/2017 10:02 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: meson bugfix
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/9809/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>    Suggested fix    Rebase your series on top of targeted branch
>    Targeted branch  master (currently at a17f3ec910)
> 
> 
> 
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
> 
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 

