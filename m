Return-Path: <mkelly@xevo.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0041.outbound.protection.outlook.com [104.47.38.41])
	by mail.openembedded.org (Postfix) with ESMTP id 91E2A77EA6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 17:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=+CWlGTZrKrvDqm3N28eD2pEp49v/BV3sbh4pVj2GmgM=;
	b=HN0ZMYx/SZJc3s6D4y0Cpi/rVgMeAofqABx2O0jPgFlWl5rGqdoyt3f0E4RbjnoF6RRlIz+2JmXMoOq2tteF8UUZNr4CT+DIxxRvEvbNHu4gHmmovd7jr+B2xmCGTAZ7pVnplVx3K/Nd7UQKVQ9UD87FwXPDJqwQWI7wzgfJ5HA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [192.168.0.3] (71.35.172.156) by
	CY4PR0101MB2933.prod.exchangelabs.com (10.171.223.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Wed, 15 Nov 2017 17:33:46 +0000
From: Martin Kelly <mkelly@xevo.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1510744037.git.alexander.kanavin@linux.intel.com>
	<e92a4137ae84734d1e3b5805964054305ce2388d.1510744037.git.alexander.kanavin@linux.intel.com>
	<6031cd63-6acf-2737-8f0d-9a5516af80d4@xevo.com>
Message-ID: <e505f2c7-b71c-e486-1d01-38d467a3eb5d@xevo.com>
Date: Wed, 15 Nov 2017 09:33:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <6031cd63-6acf-2737-8f0d-9a5516af80d4@xevo.com>
X-Originating-IP: [71.35.172.156]
X-ClientProxiedBy: CY4PR1101CA0005.namprd11.prod.outlook.com (10.172.74.143)
	To CY4PR0101MB2933.prod.exchangelabs.com (10.171.223.138)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 536adcab-b222-4f46-c425-08d52c4f06a9
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:CY4PR0101MB2933; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	3:p4usSiDA/PBu0NtddODU1RfL8iiR4ZuBbOYdDWxbxHTES/U+nWyFAYnq4xraOEWVk++76sJ6f/O5KrLwnjXcRiStz32rEjQ92v8Ptl3Bqkra3EbtVvUUC1w80S1oi6ZFUQtQ1XaYR/GNV94FwZsdcx/xVIS05OC5a430kvdoh2goHtjhOX413QIrXNIxye68hhGKmxJfc/n+A7huqy2pIQxYK1MojyUVo883f0FQNXCjP2KzKD/kcVVS8jH5o2ce;
	25:9oLRiPUbetF5RlRikmN21exRkvQ03DJG1eF4YncDWNXnX9QB1jCN0TVGr/2z1dqOJUmNg+r9QRx8qEywKHNfVGP286Y9u8Wijl9Io9W5wj0zmOEQpzzMcxBKqNUU/0DcqxRlWkkCmTOZ4mB2ZaMOhnEXh/iMyVcGrpRTVrPBIDj+mSKPgwMHxV4iIJjSxCj0Te49IeK8JSrRYcTOUabhlueceI3ZSZ2tSIKo7IU0F0LiA2EkUDS2IohqaTZUjDEy5btFyApgqdejAkAPhSqY+Syyh03R4m3HOdWSmtNYAngZFBYKP3BwzX9+YP4oF6linH7ET3JjgOsipeFBsTCuVQ==;
	31:+QaYxXy8Nl+pY4X/X62rgzELt+NeTbFBIXm769wB8Z6eG6KwZCGf/J4V6I8bjilSSf/517w1z5YGXH7C7CupDTevNE4W0SJXSx0FxZGyZOy0ZALXH29Yi1sGyFcpLhnQgbImxdzlm3bcDLC/V+iHTj3Hb9uv+IdKz8jt9FTqs4SbLLKeRsdJk4ulpfIe4vw2Y9hNeyY64qqLyWcw33W0NJ37fh6y90J1uLoSG7jXy0U=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2933:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	20:fXJlvnJ0JATuRNPYzunJ2qseosLYNkDei6k0LwbcCaZ7xADs4J9GvQ4xME1PgfoeX/JyiZ6vmfY57WKMmGZ1A8e0h29q4x6MB1VjLWvsO2upVQkNa90iSbktnHjo9q2+dV5l1AoEE44MKqLFgkF9Ed7fUkKJgQUsG5fZ0eGUYVy7p1ayWeqKSCBNGhSSJ4ZTXPB7wwpXmt0h0GNpeDAn30BkQAS2YbuhkgQJCjFWkL4nd1Ss2S2jul1RwZp/tVM2ZjIdzJEzptElvxfDIuXhElbNZAYAtfRuUfom3fk8U4nJz1msjivnHPVyFAfHTJL37ZcRnSKKKHj8fPN5RGUidNogh+4otz9bmBrcQRiQt2v3k4ZFXcplNzq2RbMOS1BMu55gDClFRVhdoeKRG9J3ISgLHGhduTYl7mGtIJcTeSg=;
	4:BhoH3uPQxE0MTILfvbtFHLq3FgYuYcmKQ0jcO1PlCX27H87eIJTJjIzKMia+aO6ERfiujsjGW1llPG5zT5rJUQBBfELcofM1hPWZ6XPMY6nVQFIpBg0+pdS2ThaqqAQWklDE1J3Gq8gxN2pgI1vnzAhBfqEvuaUTpaFXaLDGdv//3Op2N+haOqz4hZV2GZFZc7k33MIEJbSt0FN5ux1CrbIbh0PmtIv5mwgupYzpqtiX0oU8nfCmhBI0yEFmdFkz7r5fZlrZ/MtMJTzz4wwCSdECSa7qKpyoiq/VqDTGuofoLl0KSzdJAgiLQWJuhoJrGMruOO+PlV/Gq1Fd9kP4J4VvBemws2bcTryXMex7jMZzFU4npCO65eEVZkeqCJdz
X-Microsoft-Antispam-PRVS: <CY4PR0101MB2933CE58837B5790DD3D4199AB290@CY4PR0101MB2933.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(788757137089)(228905959029699); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(3231022)(6041248)(20161123562025)(20161123560025)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2933; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2933; 
X-Forefront-PRVS: 0492FD61DD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(6049001)(39830400002)(346002)(376002)(199003)(189002)(24454002)(77096006)(5660300001)(478600001)(53936002)(6486002)(6246003)(8676002)(33646002)(16576012)(58126008)(6306002)(68736007)(53546010)(64126003)(2870700001)(2906002)(316002)(6666003)(23676003)(81156014)(105586002)(65826007)(86362001)(90366009)(67846002)(16526018)(81166006)(189998001)(2950100002)(53386004)(575784001)(106356001)(8936002)(97736004)(65806001)(47776003)(36756003)(66066001)(65956001)(31686004)(50466002)(31696002)(101416001)(25786009)(83506002)(3846002)(7736002)(117156002)(229853002)(6116002)(76176999)(54356999)(50986999)(305945005)(11771545001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2933; H:[192.168.0.3];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzM7MjM6enFnSnBEOXE0MDNOc0VmQWFwemxvWkk3?=
	=?utf-8?B?S0xOM0F3aTZ2R0pzWjJmTlBSek1lZTJXZmlmazlOV0tWN01GVHRXd1JwV3JI?=
	=?utf-8?B?UmlPbWd0OWVYTFhmWkg2ZmlMRkN2KzdLdFpOWVdyYjhqUjlacEJqN0MzK3lz?=
	=?utf-8?B?UUxRRVY0M2grY25tak44MGZvQzRzWUFkeWl4TE1ENnBWcjljTU1IcjhvYmU4?=
	=?utf-8?B?Qm5NQkRueXN5Ui9sTklrT2hhMVNaVXA3OGZyT05sNUVKcVZtWTVNSTRDemRq?=
	=?utf-8?B?Zll5Uk5vUHRLNXZxMVdhakNMT0x6RmQxSTFJMmduQlNYamNFeCtMMGFuVERK?=
	=?utf-8?B?YTdLZkRZdU10WUVLemQzcTJaOEhLSTFEM0IrVmtqZVVBVis3aXNvYzAzYk9F?=
	=?utf-8?B?ZTNlWHFLa0tubWpZT0ZIR013d0RtcXp6ODc1UDlCZmNUbUd4ckhCVWZxQkFX?=
	=?utf-8?B?MCtSUk54ZzBvd3V3d3pHU1BBSDNNb09vZi9mLzkzbHBkVU1UWm5PTEVuS2Rj?=
	=?utf-8?B?cDVGRW1mQXhNaWFBSE90WXZMUmJHYWVXWDBYUnFxZVIyWU9RMnN4dGJpY0NV?=
	=?utf-8?B?L3NlMnVOT1BhTjR6WWF1ZnNzQmF5WWpkU3AzNFZMVktXaDVTSURvVk1IbkMr?=
	=?utf-8?B?UlUxWnRKNmNXZXg5WHdjL3BTNTh1WUd5Sy9Pd1ZCdjhCYk15T2V0MjZic1dP?=
	=?utf-8?B?MWRtdGNFT0llS1FlbjAyQWpzMGIvcWFEYXRwODBxcE5jc2srYlRkL3c2aFRu?=
	=?utf-8?B?bFJjYWp2K2phbGxYNlZ4aHNUR2tmTFBrUVhKUmh4U09abG9IamU3YVVJRE4w?=
	=?utf-8?B?TGlxTlhMMWZlZ2hza0RWR2VLNTV4elo3UVF3QWs3aVFBZnhTVERFdEhkaFE0?=
	=?utf-8?B?ckZNd1hLR3hPN3lHMFZvY1ltTmZ0by91MldWRGluejVlY2JFbW1yOXZUc3FN?=
	=?utf-8?B?eWJNK0E1WGYxYnBSNng5QTNxb3BwRWEzVEt6THM5UmdRN0VXVlNjOE1LZzMv?=
	=?utf-8?B?bXVibzU2U2t6OUphM1A5WmV4Q3hHdUx3ZDZPVGk2bUg2VXgvcXdTbEdya0JE?=
	=?utf-8?B?d09ZZVZTckZrdlFSeWcxVHh3dUdyQ2YvcXlsNmlzenk0VjBWSTFma205QWJD?=
	=?utf-8?B?NGVmeDVzWkVDbjJkVHk1U1dBQTBiV2U1NWprTm1BZERFaDRKQVc5NWhZdVNa?=
	=?utf-8?B?aGtaVzRleXBZYStjc29Od0dwdm1TZHloUFFKOGF0Z1RrUngreGorVzUvWG1K?=
	=?utf-8?B?Z3FpaC9Gb01PZWxsOXMvQ3hLZEVoRlpnSnBMdlFYLzhhdlNkV2h5ZFlUSXZ2?=
	=?utf-8?B?TmNrTXBQanFOejBwaXkza3FPUlNpVUg4Y3Q1NmpuOXZhdGRCSzg4L1JLN3Vj?=
	=?utf-8?B?dGxLdW1MSU1QaEUwQU8xRXlRY2ZpcTNDdkZlOWdYWTFSTmFxck92ZkYvdGV6?=
	=?utf-8?B?dU1qZGJnektHNGt1QjJwWGRaYkZoQUc2MEhDWlBMd2FSS0o4M053NWdrcTlZ?=
	=?utf-8?B?bnRPM1BoMm5rMnRTZmlFUGo0djBmU2dSMUwwdjBuM01Lb3ZaSzRCQm1rbGpt?=
	=?utf-8?B?RlBSR1lQNHpNcjhGRXlTS2ZpWnN5OGM1NnFiVG81YVU0aU5DSHkxV2MxQ1kx?=
	=?utf-8?B?MktSQzF0NHU4cjFhZ0RQUmZiUGJkcU9veEdOT28rUmtxb0h1MDE5ZjIwTWdT?=
	=?utf-8?B?WFYwYkx4ekRacVd0MmV5TE9qb1dRM1JsbTVxaXhHZmVZbUhDaG8wajBVNHRi?=
	=?utf-8?B?TkZpVXZrZVFSRkt5VmV1YzlweDN6MWxjTEs2TFZEb1dDR2RtRW9MS0dGTStx?=
	=?utf-8?B?S2d5ODFUZ2NWUVlNenJSMENIVjdrOGNNSzdPWk5seVFiZU5nM0w3Um1wVVZw?=
	=?utf-8?B?RVdyWElLRHlJZ3BtekJmQjdMT3JsdjRHZHdqa0ZJZ3U2Q2F3ZTNJWEtMZm1a?=
	=?utf-8?B?TmhjTXFMYitRdUNZVG9QcUxrM3NmbHExV2ovQmRuRnlYWHl5ZUQzeUR0bkRj?=
	=?utf-8?Q?o0/OTGX9?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	6:WgFuVYemoLy7jAqBL+a8RHWxRAELZPnS09ifOk30j4wfGfWholjaH76R5zs05biZmDBFApHia1cfYtsOrZglYgCvvK1Ja2g3vEzeE+pEDtXaj7FvI/JMYZNrW3dxSTGM/nWa8SIwIc6jpKRv//Z4tFda8Q1kHFE9yaaKg8/5bivhZdyFdB2Pks5mLoZEqZtRe0YFfrXpy2os3cab6x+CcmVLDV+EPKFZp4/8hZwPUKJCT58sm0ikW7pBnMdTcTgom/jbzd7veyHaLhv6/GL1n49/e21fH3mYbksIH28aaqtAf022oGhbmiLSXnMCpIfvC9Ihj9xMuLD0ohzTEHmxLjmPcORMga4pJh9rYpprJvA=;
	5:2nk5PJw07ChXBm4IAp3gDi5KMSFUVUFTPAK0eeLcQvqQieNR/zSyJV+WrXs3oC/YIe1K2d/ncJYmxG54lWxY2sA36xiWlmqLHimTIJ6MOjdd31BABG0LSTZZtsfee+UQHJqHddHcIsX1Ley4DauaELsHVUKMb5kMUkIPyhVYHCg=;
	24:rE5ZMMTTzpH70A5Vewcs9Q/9pgaxpp0wt6RKmQH2y6IMXoYJSbmr9yDa9Grf1fttIjT8AVASJyh1L6H/i9FNcanQEGHQOVsSGuCFkSt1QAo=;
	7:xKdUvqqvSshUkvS+3bo7YAJlTy6G9N43yqDUMoRsdOnp+BMp9osQ00cCByPBP1nn7yCtfVpGFyB+TLtP14Dm0ycP37q7hcKj4qitlESjcg1SkYNv8h/pnB1x6wN1jMk5WRADMek2k6zd2XCLUrSt+YFX7qXY6gNLifp/QEHzln1fg/Mn6jQZwM9/LRhSOqM25gi3EWy6bdeWTpDBU37zX14wbVJcxU5YM5B05PR0+OvpzRyqGiWjRmCGM+LdEbB9
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2017 17:33:46.6902 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 536adcab-b222-4f46-c425-08d52c4f06a9
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2933
Subject: Re: [PATCH 1/7] meson: add a recipe and class from meta-oe
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
X-List-Received-Date: Wed, 15 Nov 2017 17:33:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Correction: I took another look after merging in my meson patch, and I 
think your branch is fully current.

On 11/15/2017 09:27 AM, Martin Kelly wrote:
> Hi,
> 
> It looks to me like there are some changes here on top of a forked 
> meson.bbclass from meta-oe. Did you rebase the changes on top of current 
> meta-oe's meson? From a look at the git logs and file contents, it looks 
> like it needs a rebase or we may drop some patches.
> 
> On 11/15/2017 03:08 AM, Alexander Kanavin wrote:
>> The original recipe has been provided and improved by:
>>
>> Ross Burton <ross.burton@intel.com>
>> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> Adam C. Foltzer <acfoltzer@galois.com>
>> Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> Linus Svensson <linussn@axis.com>
>>
>> I have added a couple patches to fix up gtk-doc and
>> gobject-introspection in cross-compilation environments.
>>
>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> ---
>>   meta/classes/meson.bbclass                         | 103 
>> +++++++++++++++++++
>>   ...ix-issues-that-arise-when-cross-compiling.patch | 113 
>> +++++++++++++++++++++
>>   ...rospection-determine-g-ir-scanner-and-g-i.patch |  41 ++++++++
>>   meta/recipes-devtools/meson/meson_0.43.0.bb        |  19 ++++
>>   4 files changed, 276 insertions(+)
>>   create mode 100644 meta/classes/meson.bbclass
>>   create mode 100644 
>> meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch 
>>
>>   create mode 100644 
>> meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch 
>>
>>   create mode 100644 meta/recipes-devtools/meson/meson_0.43.0.bb
>>
>> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
>> new file mode 100644
>> index 00000000000..f6cf24c33a7
>> --- /dev/null
>> +++ b/meta/classes/meson.bbclass
>> @@ -0,0 +1,103 @@
>> +inherit python3native
>> +
>> +DEPENDS_append = " meson-native ninja-native"
>> +
>> +# As Meson enforces out-of-tree builds we can just use cleandirs
>> +B = "${WORKDIR}/build"
>> +do_configure[cleandirs] = "${B}"
>> +
>> +# Where the meson.build build configuration is
>> +MESON_SOURCEPATH = "${S}"
>> +
>> +# These variables in the environment override meson's *native* tools 
>> settings.
>> +# We have to unset them, so that meson doesn't pick up the cross 
>> tools and
>> +# use them for native builds.
>> +unset CC
>> +unset CXX
>> +unset AR
>> +
>> +def noprefix(var, d):
>> +    return d.getVar(var, True).replace(d.getVar('prefix', True) + 
>> '/', '', 1)
>> +
>> +MESONOPTS = " --prefix ${prefix} \
>> +              --bindir ${@noprefix('bindir', d)} \
>> +              --sbindir ${@noprefix('sbindir', d)} \
>> +              --datadir ${@noprefix('datadir', d)} \
>> +              --libdir ${@noprefix('libdir', d)} \
>> +              --libexecdir ${@noprefix('libexecdir', d)} \
>> +              --includedir ${@noprefix('includedir', d)} \
>> +              --mandir ${@noprefix('mandir', d)} \
>> +              --infodir ${@noprefix('infodir', d)} \
>> +              --sysconfdir ${sysconfdir} \
>> +              --localstatedir ${localstatedir} \
>> +              --sharedstatedir ${sharedstatedir}"
>> +
>> +MESON_C_ARGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS}"
>> +MESON_LINK_ARGS = "${MESON_C_ARGS} ${LDFLAGS}"
>> +
>> +MESON_HOST_ENDIAN = "${@bb.utils.contains('SITEINFO_ENDIANNESS', 
>> 'be', 'big', 'little', d)}"
>> +MESON_TARGET_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES', 
>> 'bigendian', 'big', 'little', d)}"
>> +
>> +EXTRA_OEMESON += "${PACKAGECONFIG_CONFARGS}"
>> +
>> +MESON_CROSS_FILE = ""
>> +MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
>> +
>> +def meson_array(var, d):
>> +    return "', '".join(d.getVar(var, True).split()).join(("'", "'"))
>> +
>> +addtask write_config before do_configure
>> +do_write_config[vardeps] += "MESON_C_ARGS TOOLCHAIN_OPTIONS"
>> +do_write_config() {
>> +    # This needs to be Py to split the args into single-element lists
>> +    cat >${WORKDIR}/meson.cross <<EOF
>> +[binaries]
>> +c = '${HOST_PREFIX}gcc'
>> +cpp = '${HOST_PREFIX}g++'
>> +ar = '${HOST_PREFIX}ar'
>> +ld = '${HOST_PREFIX}ld'
>> +strip = '${HOST_PREFIX}strip'
>> +readelf = '${HOST_PREFIX}readelf'
>> +pkgconfig = 'pkg-config'
>> +
>> +[properties]
>> +needs_exe_wrapper = true
>> +c_args = [${@meson_array('MESON_C_ARGS', d)}]
>> +c_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
>> +cpp_args = [${@meson_array('MESON_C_ARGS', d)}]
>> +cpp_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
>> +gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
>> +
>> +[host_machine]
>> +system = '${HOST_OS}'
>> +cpu_family = '${HOST_ARCH}'
>> +cpu = '${HOST_ARCH}'
>> +endian = '${MESON_HOST_ENDIAN}'
>> +
>> +[target_machine]
>> +system = '${TARGET_OS}'
>> +cpu_family = '${TARGET_ARCH}'
>> +cpu = '${TARGET_ARCH}'
>> +endian = '${MESON_TARGET_ENDIAN}'
>> +EOF
>> +}
>> +
>> +CONFIGURE_FILES = "meson.build"
>> +
>> +meson_do_configure() {
>> +    if ! meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" 
>> ${MESON_CROSS_FILE} ${EXTRA_OEMESON}; then
>> +        cat ${B}/meson-logs/meson-log.txt
>> +        bbfatal_log meson failed
>> +    fi
>> +}
>> +
>> +do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
>> +meson_do_compile() {
>> +    ninja ${PARALLEL_MAKE}
>> +}
>> +
>> +meson_do_install() {
>> +    DESTDIR='${D}' ninja ${PARALLEL_MAKEINST} install
>> +}
>> +
>> +EXPORT_FUNCTIONS do_configure do_compile do_install
>> diff --git 
>> a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch 
>> b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch 
>>
>> new file mode 100644
>> index 00000000000..ca3d7095066
>> --- /dev/null
>> +++ 
>> b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch 
>>
>> @@ -0,0 +1,113 @@
>> +From 15e054dce6ff11d2cb219c8c09a31b26f0e58b62 Mon Sep 17 00:00:00 2001
>> +From: Alexander Kanavin <alex.kanavin@gmail.com>
>> +Date: Fri, 4 Aug 2017 16:16:41 +0300
>> +Subject: [PATCH 1/3] gtkdoc: fix issues that arise when cross-compiling
>> +
>> +Specifically:
>> +1) Make it possible to specify a wrapper for executing binaries
>> +(usually, some kind of target hardware emulator, such as qemu)
>> +2) Explicitly provide CC and LD via command line, as otherwise 
>> gtk-doc will
>> +try to guess them, incorrectly.
>> +3) If things break down, print the full command with arguments,
>> +not just the binary name.
>> +4) Correctly determine the compiler/linker executables and 
>> cross-options when cross-compiling
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> +
>> +---
>> + mesonbuild/modules/gnome.py        | 18 +++++++++++++++---
>> + mesonbuild/scripts/gtkdochelper.py |  9 +++++++--
>> + 2 files changed, 22 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
>> +index 6ec7040..4cfaefd 100644
>> +--- a/mesonbuild/modules/gnome.py
>> ++++ b/mesonbuild/modules/gnome.py
>> +@@ -713,6 +713,10 @@ class GnomeModule(ExtensionModule):
>> +                 '--mode=' + mode]
>> +         if namespace:
>> +             args.append('--namespace=' + namespace)
>> ++        gtkdoc_exe_wrapper = 
>> state.environment.cross_info.config["properties"].get('gtkdoc_exe_wrapper', 
>> None)
>> ++        if gtkdoc_exe_wrapper is not None:
>> ++            args.append('--gtkdoc-exe-wrapper=' + gtkdoc_exe_wrapper)
>> ++
>> +         args += self._unpack_args('--htmlargs=', 'html_args', kwargs)
>> +         args += self._unpack_args('--scanargs=', 'scan_args', kwargs)
>> +         args += self._unpack_args('--scanobjsargs=', 
>> 'scanobjs_args', kwargs)
>> +@@ -741,14 +745,22 @@ class GnomeModule(ExtensionModule):
>> +                 raise MesonException(
>> +                     'Gir include dirs should be 
>> include_directories().')
>> +         cflags.update(get_include_args(inc_dirs))
>> ++
>> ++        cross_c_args = " 
>> ".join(state.environment.cross_info.config["properties"].get('c_args', 
>> ""))
>> ++        cross_link_args = " 
>> ".join(state.environment.cross_info.config["properties"].get('c_link_args', 
>> ""))
>> ++
>> +         if cflags:
>> +-            args += ['--cflags=%s' % ' '.join(cflags)]
>> ++            args += ['--cflags=%s %s' % (cross_c_args,' 
>> '.join(cflags))]
>> +         if ldflags:
>> +-            args += ['--ldflags=%s' % ' '.join(ldflags)]
>> ++            args += ['--ldflags=%s %s' % (cross_link_args, ' 
>> '.join(ldflags))]
>> +         compiler = state.environment.coredata.compilers.get('c')
>> +-        if compiler:
>> ++        cross_compiler = 
>> state.environment.coredata.cross_compilers.get('c')
>> ++        if compiler and not state.environment.is_cross_build():
>> +             args += ['--cc=%s' % ' '.join(compiler.get_exelist())]
>> +             args += ['--ld=%s' % ' 
>> '.join(compiler.get_linker_exelist())]
>> ++        elif cross_compiler and state.environment.is_cross_build():
>> ++            args += ['--cc=%s' % ' 
>> '.join(cross_compiler.get_exelist())]
>> ++            args += ['--ld=%s' % ' 
>> '.join(cross_compiler.get_linker_exelist())]
>> +
>> +         return args
>> +
>> +diff --git a/mesonbuild/scripts/gtkdochelper.py 
>> b/mesonbuild/scripts/gtkdochelper.py
>> +index a2cbf5a..19331bd 100644
>> +--- a/mesonbuild/scripts/gtkdochelper.py
>> ++++ b/mesonbuild/scripts/gtkdochelper.py
>> +@@ -44,13 +44,14 @@ parser.add_argument('--ignore-headers', 
>> dest='ignore_headers', default='')
>> + parser.add_argument('--namespace', dest='namespace', default='')
>> + parser.add_argument('--mode', dest='mode', default='')
>> + parser.add_argument('--installdir', dest='install_dir')
>> ++parser.add_argument('--gtkdoc-exe-wrapper', dest='gtkdoc_exe_wrapper')
>> +
>> + def gtkdoc_run_check(cmd, cwd):
>> +     # Put stderr into stdout since we want to print it out anyway.
>> +     # This preserves the order of messages.
>> +     p, out = Popen_safe(cmd, cwd=cwd, stderr=subprocess.STDOUT)[0:2]
>> +     if p.returncode != 0:
>> +-        err_msg = ["{!r} failed with status {:d}".format(cmd[0], 
>> p.returncode)]
>> ++        err_msg = ["{!r} failed with status {:d}".format(cmd, 
>> p.returncode)]
>> +         if out:
>> +             err_msg.append(out)
>> +         raise MesonException('\n'.join(err_msg))
>> +@@ -58,7 +59,7 @@ def gtkdoc_run_check(cmd, cwd):
>> + def build_gtkdoc(source_root, build_root, doc_subdir, src_subdirs,
>> +                  main_file, module,
>> +                  html_args, scan_args, fixxref_args, mkdb_args,
>> +-                 gobject_typesfile, scanobjs_args, ld, cc, ldflags, 
>> cflags,
>> ++                 gobject_typesfile, scanobjs_args, 
>> gtkdoc_exe_wrapper, ld, cc, ldflags, cflags,
>> +                  html_assets, content_files, ignore_headers, namespace,
>> +                  expand_content_files, mode):
>> +     print("Building documentation for %s" % module)
>> +@@ -111,6 +112,9 @@ def build_gtkdoc(source_root, build_root, 
>> doc_subdir, src_subdirs,
>> +     if gobject_typesfile:
>> +         scanobjs_cmd = ['gtkdoc-scangobj'] + scanobjs_args + 
>> ['--types=' + gobject_typesfile,
>> +                                                               
>> '--module=' + module,
>> ++                                                              
>> '--run=' + gtkdoc_exe_wrapper,
>> ++                                                              
>> '--cc=' + cc,
>> ++                                                              
>> '--ld=' + ld,
>> +                                                               
>> '--cflags=' + cflags,
>> +                                                               
>> '--ldflags=' + ldflags]
>> +
>> +@@ -206,6 +210,7 @@ def run(args):
>> +         mkdbargs,
>> +         options.gobject_typesfile,
>> +         scanobjsargs,
>> ++        options.gtkdoc_exe_wrapper,
>> +         options.ld,
>> +         options.cc,
>> +         options.ldflags,
>> +--
>> +2.14.1
>> +
>> diff --git 
>> a/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch 
>> b/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch 
>>
>> new file mode 100644
>> index 00000000000..f00b9b2a2d1
>> --- /dev/null
>> +++ 
>> b/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch 
>>
>> @@ -0,0 +1,41 @@
>> +From 84cb251a33190ec82faeaad321518af4b309c55e Mon Sep 17 00:00:00 2001
>> +From: Alexander Kanavin <alex.kanavin@gmail.com>
>> +Date: Fri, 4 Aug 2017 16:18:47 +0300
>> +Subject: [PATCH 2/2] gobject-introspection: determine g-ir-scanner and
>> + g-ir-compiler paths from pkgconfig
>> +
>> +Do not hardcode the name of those binaries; gobject-introspection
>> +provides them via pkgconfig, and they can be set to something else
>> +(for example when cross-compiling).
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> +---
>> + mesonbuild/modules/gnome.py | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
>> +index ba7e4cd..00472af 100644
>> +--- a/mesonbuild/modules/gnome.py
>> ++++ b/mesonbuild/modules/gnome.py
>> +@@ -380,8 +380,6 @@ class GnomeModule(ExtensionModule):
>> +             raise MesonException('Gir takes one argument')
>> +         if kwargs.get('install_dir'):
>> +             raise MesonException('install_dir is not supported with 
>> generate_gir(), see "install_dir_gir" and "install_dir_typelib"')
>> +-        giscanner = find_program('g-ir-scanner', 'Gir')
>> +-        gicompiler = find_program('g-ir-compiler', 'Gir')
>> +         girtarget = args[0]
>> +         while hasattr(girtarget, 'held_object'):
>> +             girtarget = girtarget.held_object
>> +@@ -392,6 +390,8 @@ class GnomeModule(ExtensionModule):
>> +                 self.gir_dep = 
>> PkgConfigDependency('gobject-introspection-1.0',
>> +                                                    state.environment,
>> +                                                    {'native': True})
>> ++            giscanner = os.environ['PKG_CONFIG_SYSROOT_DIR'] + 
>> self.gir_dep.get_pkgconfig_variable('g_ir_scanner')
>> ++            gicompiler = os.environ['PKG_CONFIG_SYSROOT_DIR'] + 
>> self.gir_dep.get_pkgconfig_variable('g_ir_compiler')
>> +             pkgargs = self.gir_dep.get_compile_args()
>> +         except Exception:
>> +             raise MesonException('gobject-introspection dependency 
>> was not found, gir cannot be generated.')
>> +--
>> +2.13.2
>> +
>> diff --git a/meta/recipes-devtools/meson/meson_0.43.0.bb 
>> b/meta/recipes-devtools/meson/meson_0.43.0.bb
>> new file mode 100644
>> index 00000000000..bbb48d9197c
>> --- /dev/null
>> +++ b/meta/recipes-devtools/meson/meson_0.43.0.bb
>> @@ -0,0 +1,19 @@
>> +HOMEPAGE = "http://mesonbuild.com"
>> +SUMMARY = "A high performance build system"
>> +
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
>> +
>> +SRC_URI = 
>> "https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar.gz 
>> \
>> +           
>> file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
>> +           
>> file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch \
>> +           "
>> +SRC_URI[md5sum] = "b0d389cc5937928c2f5114656dc5a99a"
>> +SRC_URI[sha256sum] = 
>> "c513eca90e0d70bf14cd1eaafea2fa91cf40a73326a7ff61f08a005048057340"
>> +UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
>> +
>> +inherit setuptools3
>> +
>> +RDEPENDS_${PN} = "ninja python3-core python3-modules"
>> +
>> +BBCLASSEXTEND = "native"
>>

