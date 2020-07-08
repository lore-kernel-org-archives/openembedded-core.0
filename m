Received: from EUR06-AM7-obe.outbound.protection.outlook.com (EUR06-AM7-obe.outbound.protection.outlook.com [40.92.16.35])
 by mx.groups.io with SMTP id smtpd.web11.1417.1594233440160454409
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 11:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=N3KNNA5a;
 spf=pass (domain: outlook.com, ip: 40.92.16.35, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0vWFZb/wCxbg10lGPx5XeSd9ABzPD7MhV86tBVNf5swCop4SnxvA33PtLoevvg0xGNuq/j1o75S9Hv17Gwr31P4AG/GVhuRU9HtnFQOD+Ze0K6ymVLDwJ4K6Z1NVDOGheNxSZtERSvWs6X/1myLdw0hnzEG6sNe5rH89koeGVa9LyJkA1d87c54HPEf1clRYD7q1z+UkHEwlJtHKTMj9ICw0Zn0rkObvHAgR7Hr2rYathPA6slAPPGSSGXUsVTqb082OQTnobzJcEAVy3+Ir5FFBYa7jXRyrMmTWJfszWxASoT5DZD6BRbqPXHkpC0SpdPswjggC637x4pCHwTGEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dp9ooZdg2P5IyTL0mG8yVWq/3eHdQfAC4ON9JTwRkRU=;
 b=jpCGSwxDOy69aF39RMluOvO0f20GWubmjqj7VKpWrEDK8EG7Rvia8IDY2WdsIk1aBOql2NDZocfmDvtIloUP3+gcwjz4VlvrSrLzYCft9RZ3Ez75wXkbIofQnxD7s9FpTNDw4IXAyz17yHgWL1C3ve/vUrRCHisjxsDjX3jAs8qaGyuFxcoF2tU3lF2PZPGhLj+yIY+GMGbLpXIxs2GlvgFn2S/movuswrUXk5c+h5F545Kj6wY6zrJ8MjGqIPjnJC2WmP66CDG+MmAA4HUpwUql6BysCF8RNSi0m+H9hlJlZSDx+IS5vMi84yizqNQ2c1UZs0T5oa7DqOlnXk/+Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dp9ooZdg2P5IyTL0mG8yVWq/3eHdQfAC4ON9JTwRkRU=;
 b=N3KNNA5a+qqKqPlfasmQrxON31nE5WtdF8E/52knCxhnYXReypyPS64wNzJfbCWyf1/WNzA4CJT18nshNXgTccgVxIi8P99rjrt2NzJPG6eEpxOFQqyeLnQTqndHEZWqD+83tkDiu3fG4ySkHrXkJl7P8AUh09tW8aFaOl14fsV6Gx7uzbyomWhCIrCgZbJKByN6vk/8MWGviC3LwBpQy7LqGI45GaI3aMqn3CnDcQdhHOJjF4rx/z/eGh6hZfrBmz4hWDYAGilfhlGYasSoUiXuWqd7WIFihtO8IC0b79zChlnQCurW8Bt+kKvckkYPOpDY1PaEQwhjf8gaoQmfzA==
Received: from AM7EUR06FT061.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::4c) by
 AM7EUR06HT100.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::207)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Wed, 8 Jul
 2020 18:37:17 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc36::49) by AM7EUR06FT061.mail.protection.outlook.com
 (2a01:111:e400:fc36::95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Wed, 8 Jul 2020 18:37:17 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:53F7A218E04D0E453401DCA5B7483981329F6011E90C6CB7AD4549A925216A49;UpperCasedChecksum:F848A3E0268C207EE5B4F6F771E51DE8C7D33ED02E2E30361B27603606BDF642;SizeAsReceived:8970;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3174.021; Wed, 8 Jul 2020
 18:37:17 +0000
Subject: Re: [OE-core] [PATCH 2/2] rootfs-post: add sanity check for ROOTFS_POSTCMD
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200708110936.17099-1-kweihmann@outlook.com>
 <AM7PR05MB6881E32F96C6B2D662250CFAA8670@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <1f6807cd44de94bcf6d9d4eb47a29a3fa3861893.camel@linuxfoundation.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM7PR05MB688168801B8CD0016C5FE9C9A8670@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Wed, 8 Jul 2020 20:37:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1f6807cd44de94bcf6d9d4eb47a29a3fa3861893.camel@linuxfoundation.org>
X-ClientProxiedBy: AM5PR0701CA0054.eurprd07.prod.outlook.com
 (2603:10a6:203:2::16) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <990b6b6b-42d3-2983-9975-caf9b31abf0e@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.150.33.67) by AM5PR0701CA0054.eurprd07.prod.outlook.com (2603:10a6:203:2::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.8 via Frontend Transport; Wed, 8 Jul 2020 18:37:17 +0000
X-Microsoft-Original-Message-ID: 
 <990b6b6b-42d3-2983-9975-caf9b31abf0e@outlook.com>
X-TMN: [3zgfK/t2x/1GsWbyTCEVvorsOosqOolK]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: e5ed196e-6ed9-4ce6-6015-08d8236df105
X-MS-TrafficTypeDiagnostic: AM7EUR06HT100:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HEJvCkdzEe3JTVkAA4QynYhPJGAfl7dOoigvExupMBmRCQKcmzSYgAa0z5zmxuhEkWE5s/PE8pVKGn2ovO4asdn8VknRgpUuer9TigjAhZGr5eCuCyBpu172P84vfHgPaNyH737dkswYejXvTIvgfAR0preCtWtcHbmf7jtT4IP2WRk6Unc0cPGH5WVGiCPOwOB7Ukvg6bvBg/Khuri6UQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	mPeAQGqC79SkGcAwtWMHwSfgJ5279j6db92Jt4tkboEy+Z0e9SDPj0SlbRmgcvfeKYDVeDW8qn7NR+ZHF0ahmrwoin6z5E4SXAHhaO/0IKzUHa0MK+eitMfFiGVT1KOHABfyIRrQKcX9fJizi6UrZQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ed196e-6ed9-4ce6-6015-08d8236df105
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 18:37:17.8289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR06FT061.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT100
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Then please ignore the second patch - if I find some time, I'll try to 
add that to the sanity class - but for now the first patch solve a real 
problem for me, while the second is nice 2 have at the moment

On 08.07.20 14:08, Richard Purdie wrote:
> On Wed, 2020-07-08 at 13:09 +0200, Konrad Weihmann wrote:
>> It warns about trailing blanks before the delimiter, as otherwise the
>> task can't be removed properly
>>
>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>> ---
>>   meta/classes/rootfs-postcommands.bbclass | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
>> index 984730ebe8..e33715f016 100644
>> --- a/meta/classes/rootfs-postcommands.bbclass
>> +++ b/meta/classes/rootfs-postcommands.bbclass
>> @@ -57,6 +57,14 @@ python () {
>>       d.appendVar('ROOTFS_POSTPROCESS_COMMAND', 'rootfs_reproducible;')
>>   }
>>   
>> +addhandler rootfs_postcmd_sanity_eventhandler
>> +rootfs_postcmd_sanity_eventhandler[eventmask] = "bb.event.RecipeParsed"
>> +python rootfs_postcmd_sanity_eventhandler() {
>> +    for x in (d.getVar("ROOTFS_POSTPROCESS_COMMAND") or "").split(";"):
>> +        if x.endswith(" "):
>> +            bb.warn("'%s' ends with a blank, making the task unremovable" % x.strip())
>> +}
>> +
>>   systemd_create_users () {
>>   	for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
>>   		[ -e $conffile ] || continue
> 
> I think this belongs with other sanity tests in insane.bbclass. I'd
> prefer not to have another event handler in the system just for this
> (they're high overhead).
> 
> Cheers,
> 
> Richard
> 
