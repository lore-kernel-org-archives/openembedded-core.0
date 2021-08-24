Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.1378.1629823731200804770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=b+vn/dl7;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38708fe2c0=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17OGDZMW014082
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 09:48:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=oWZCRDtKKn1OZ/aDADpfdlMHL9vr6mF5Yubzd+OFl3g=;
 b=b+vn/dl7B53XNz0bNmbZUHVh846l5M6yIgfi03fO5ppPAQsWw8nQXCl9Y7PWNO1XNurX
 ikoh6lg2RVPQAu6LRGBFX/QCnTZ3FI3jhVGZlTDwWnGS9+Hiz/qRBDG4U6+0GMS28b86
 gE+b8fkRX2YeYib95oQYBJt6upPnUYF8JliRRSxUaxPsybNf/RgfvHw0huLTQ4zQLYbQ
 H/IINBerLlIXazL/w2AwketZ8znfJDsDaswssBiHcJG9Pyi8xRuA2uK87iiLfJRrLyCK
 /2fc0LoOzXL0OT9fcwJpcs1Ah3P96LlUhCO5p5GKHw/3A+h9gxYFMlUMb12/nmAvX4OF wA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ampa38jya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 09:48:50 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17OGmn1W023569
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 09:48:49 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2048.outbound.protection.outlook.com [104.47.73.48])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ampa38jy8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Aug 2021 09:48:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xdu7AERVrOnZ4qKd1rEQOOpZPSiRE/Zaa1z55vbRzh8P8bqLlc/nvVLWrzP7v0UNQOHY0gdWZFMnMSij1lMKPFjOa8yj+lZjEJwqmWmXWlpRxjI/jrkpq53Ddn3tkznVpXv5CHM65+ki0aUj5lktvu8EIt302Q2fnOFtBMcPUx8AOgZFi3EWj3LxJ+nyTLoWcW5Tyinr0w43eDtjSTGoPnatMMXajtU3bGBS1qFB8CFPZlv5x29Egm+4fl9EzBi/UyX/O6o9l1gtvCN1ypOvhJRZoZu2c5J3MQ8yYHxWDsXz4l24cZkwjpoUn4f40/CPMHUnk8ZawuI1ygUy60hrnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWZCRDtKKn1OZ/aDADpfdlMHL9vr6mF5Yubzd+OFl3g=;
 b=akZhrw2yrkaARouTCMkvaCPM91dX95pGmg4YceSx7YOiAMVxg3MAQ0dGYo+cMpq5PKQZaCxomUc8BXe0QswWV2YotZ7Sl+tEvol3cL0Yzg0T8eFEUTgTfXHaq9+bUbIuOXx7s+4S+ACj9G0/bghkxjgrDmp9xuQe0xjaqZnJvj6OpU/Mt2N+RHq7vpvY9ouLuDK0L6wgf3jCNyflqnjwjWncBitvjYj9LDSmFdJxmfJNHN1dbsdcQYnRIhQPx28XgVuyYxRAXX4hgRnbB/F/P31k37EUn5nT7K3m0uQHkU3marSCnt2cOhl+DFBTqahPBMTAN5RkeS9RB8nuJYkQvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lexmark.com; dkim=none (message not signed)
 header.d=none;lexmark.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1434.namprd11.prod.outlook.com (2603:10b6:4:9::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19; Tue, 24 Aug 2021 16:48:48 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4%6]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 16:48:47 +0000
Subject: Re: [OE-core] [v4] [RFC] Merge meta-rust to oe-core - Aug 19 update
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: steven@stevenwalter.org, johan.anderholm@gmail.com, derek@asterius.io,
        cardoe@cardoe.com, dev@codyps.com, tylerwhall@gmail.com,
        Khem Raj <raj.khem@gmail.com>, vinay.kumar@blackfigtech.com,
        saul.wold@windriver.com, martin.jansa@gmail.com, paul@pbarker.dev,
        Trevor Gamblin <trevor.gamblin@windriver.com>,
        anbelski@linux.microsoft.com, Vinay Kumar <vinay.m.engg@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        steven@stevenwalter.org
References: <aa7653eb-336f-ee08-3126-e6c790a9226f@windriver.com>
 <20210813151947.55142-1-vinay.m.engg@gmail.com>
 <CANUMPcXHhkPrtXrfN5rfzctXEy8h-Hi4L+vKmaAmPSgC33udcg@mail.gmail.com>
 <169C1FA457B99CA0.23238@lists.openembedded.org>
 <15a0f2e3-dbad-2512-3e5e-f2b84c946964@windriver.com>
 <169D3274AAECC435.19323@lists.openembedded.org>
 <fed5f2e5-000c-b7be-1d0e-2dc26afa6bd5@windriver.com>
 <87dacc6ecc7af109db0039894254c77b43ae8323.camel@linuxfoundation.org>
 <3e7ff50b-57f8-0503-b514-e53a82e0b2d5@windriver.com>
 <e36985f82120c87f598289c672eafdacb5e37d86.camel@linuxfoundation.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <19febc9a-66ef-c627-5db8-25be9e87e996@windriver.com>
Date: Tue, 24 Aug 2021 12:48:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <e36985f82120c87f598289c672eafdacb5e37d86.camel@linuxfoundation.org>
X-ClientProxiedBy: YQXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::38) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.7] (198.48.226.187) by YQXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:14::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 16:48:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ba1127a-5417-47a1-c417-08d9671f0b0c
X-MS-TrafficTypeDiagnostic: DM5PR11MB1434:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB143421E44142FD59624736C1F8C59@DM5PR11MB1434.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Nm0HpVdXRbRJ+VDkfG75805IJnejFyHSIKzi0y3mIMCYaqlB1cR07LRHhxIfGuAdmgWGrHgA1urFguxdiZfTBf6w2PsR9WymWVx5Qd+Ou0x04LyA/uouvtC/qo9kZbtzIaVRSwx1WpSDe2fV0uKyxX7sQrIVndlj4fv+rnGc1HmNyiH9YnU2Cf2DqgFl7hxIwZ/uSL4kGX9NwbH27KcEhaXrBVbJk7oZjXXlsR+zGSvoZ4LyBrsNFCcRNdeXI9NNIZapu2kKN28BC3uAlNfoKUZdKCc72eOmBZm3dOjny9BEqmdMY8Lh+BSdPmktA1rsb4Y/aO+ORDt2CC2ojk5RKVMtgfVjMywOo/FksK3npZtQ7ovM24FwYWh1DV33ZIkq7HoLP3eHfoJ90e9FqUaRuLkSMMBw7zGE5NA9FWKBx4pELDgWyel3EdnK/1NzGpHOUTAn4PZ6TzFn3+NdnOG05mpcopC8uvOOi1PS8YF8Nm6jqNsLIAlQgsmms0fw6qmoZhsUUrhCOrZ9MLfKjGR7C4ukF6glL/1GG9hJdraZDnGzAEAO5GbJjs0KCFofMWfKk0drWNv1xstMenM0y7LhnnU9uyktbCmRiCIMyHLK/JWxtfvhvZXMtcsk9xI1B6nwZbZZg04bY3nC6Fhs0TxiBSTKvOEDC+5RJNfIL+A+ZdHCWAxgo0ECYIaZwgdSkpiE4jEUIugz2+3brKoR3LqlxWP+q31ig8UDK6FOnNpcwGrs727izxnyr32o5MrrdigieajtweTRBMsGwuDsrptddX/qWZRq2HdpVpUxgMs0LtyeHjbneG/gcwuvrSvSdxCmGrHXzs3OGEp4Igx5gpKbQQmRwis6rDolKktZSQcI8cJIGAkZD8XLy8nigKbiKbyWaIU6ED9fzhlEO/QJlBw/9w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39850400004)(376002)(136003)(346002)(6666004)(6486002)(2906002)(86362001)(66946007)(83380400001)(31696002)(15650500001)(53546011)(66556008)(52116002)(186003)(66476007)(16576012)(4326008)(316002)(8936002)(956004)(966005)(478600001)(54906003)(36756003)(8676002)(26005)(110136005)(31686004)(5660300002)(2616005)(38100700002)(38350700002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NUQxRTkvNk1oSUozUkNHL3ZKQUlNdzl3MHBxampNdmYxd0g4ZDZWdVJhdkNo?=
 =?utf-8?B?NFhtbTljSG1CYlBzRmpVenNUSXVqVDZ3d0hyZGxJRmM0aHNaOHh0NEltNkN6?=
 =?utf-8?B?d1VUbDFoSjZiK0ZpbGV4YVc4NlZRcmlSb1Bzd0YwVjhhcUdINHNRMS9DYnMz?=
 =?utf-8?B?ZmZoeDZ6RXd2VnR0NFJwaEFzM0RQaGFydkl2TDJQM1o2ZTk1Yzc3OUozM1VZ?=
 =?utf-8?B?WldnTjdPTWxhTmpMUXdQZlhna2xLVlZkSXVnMGNlQm9YeVhtZ3ZMekZaZFlN?=
 =?utf-8?B?WUdtSUkzempyczRwaXlUcEU0Y3h5YW9Rck5RRkI1NDJFUFlFOVErWEhTdEtz?=
 =?utf-8?B?cjRycVFTeis3aXJ0bk5kTStRamtkRGFJMWEyWkNJNitmVFRvTU5NZVhaa0s4?=
 =?utf-8?B?T2JzWDVpbnhPcDZZa0FNTm5Bc0dUcFZXN1VWVWpLVHpUWVhTYTRsQm1NUnA1?=
 =?utf-8?B?Rk9CN0EvUEsrWDRhSVg2b3ZEUVhwekZCLzVoMjdtb28vN2xBMXAvOHFpMTUv?=
 =?utf-8?B?U1VUdC9XdWZJY2d6WUZKL003aFhPOWRqMzYxc0RMSW5KMnJhN1QvY2FrN2xk?=
 =?utf-8?B?SHhEQXU4djg5VTdYMksyL3laU05TTWI1QTJUOGR4VU1VcGpLYnRKQXdWc2ts?=
 =?utf-8?B?K3EwVnBOVVYzYUdFdHdnbzhQNkVxVFpIQ1dqaHlZZEsxWnQwRU0wOVM4MHBT?=
 =?utf-8?B?Tm5oVTRZc2VLWTU2TXZ4Z2hhRjZMR0R2NEFzYk9MWHRPMm5NdlBXVVRweFVC?=
 =?utf-8?B?R3g4QjNjZ0w4WXp5aG1ybDYxSlFTeXNoLzJTc09rRzR6Y2d5NmtVMHdEMDRy?=
 =?utf-8?B?L3hVMEtNa1dDbXdUT3JWcS9Gd2wzZ1NqbHB5ZnErMTNZamUxUmVzMThaNWZE?=
 =?utf-8?B?bExzeS80YWRFOW44YzJnMkRpYUlva21qVEY5cDkzeGhXNHBNS3YyYTdla3l1?=
 =?utf-8?B?RmhwRjVoUnlPclNXeHR6MU1ZSVhZMW5UTlhyZzBzc3Q2QTJueDNocXY5SEVX?=
 =?utf-8?B?MjVid01PZ2VMKzF3MHUwNHRDMTcxeHdGME9vRFlmU2NmN0hHRElTckJ1c0dK?=
 =?utf-8?B?WndkVFRvMTY2c0RFSnUwVmkvL0oycHBRTWpMdjh0K252YXczSHFHS2YwWnlC?=
 =?utf-8?B?d3NrWitpRVNPTlVZV3ZuZTQ4UFhVNUNzOG5Ud0M5bGdpRERwUXMyQ1Z2K2NR?=
 =?utf-8?B?ek84Y2RqRG5hYVh1dzJhQTRGa3cxL0tPK3NrU0RyWmRxdzZHdzFSZWZMYjVw?=
 =?utf-8?B?UlRGRzFyZTAxQ0Q1VGw0Tk4yZmRQUlJrQndibzVFbGhIeEhSaG05SlVRa3Jj?=
 =?utf-8?B?YUZLUGlIeFZCR0FJOXR5c2p5ajdIUVFvRE9Xckt0VFZvbjJ5K2VFRW1qejh1?=
 =?utf-8?B?TFh3OHFNcTZPdTFpRnc4OWZyeE1rWmhIUW5iSHllZ2VtVzRrcHpLQmVQQTJB?=
 =?utf-8?B?bU9ITTZzU0JrWVhRL2Y5QWhIWkd1azV5dWl3OVVKMkZKMVN0Z0xjUUtHUWty?=
 =?utf-8?B?bVduL25WSFpjMnV5anQ2QmJlN2lPdDhYbUZKTW1JZkR1b1pHSXRKcU1oL25y?=
 =?utf-8?B?KzhKS29BN2g5bEV3ZnprQVZVVERpUXVEVHBnMVJYS0UwWXNaQThCczFBOUZF?=
 =?utf-8?B?czc0SHMzanVrVUc5RUV6WitSZnN4Rm90enU4SndhZTA0STNZTXRYNHB1bzV5?=
 =?utf-8?B?c01xUndzMi8rOGtuQ2grb0RYY2U3TlN4V3J5STd6d28rcG9IWFRQbU9yTkdG?=
 =?utf-8?Q?AmjJrOYJn1GiYlyGiaBAi7wBbX3+gNUSkZLuz5V?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba1127a-5417-47a1-c417-08d9671f0b0c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 16:48:47.8437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEXNZgr0aV7b2NPTDazs/PjDFiB4hNYeBPwVk2E1/mDhoSLlHbj8Pui0BNncF7pcuXDzz547toYTQyXzSC7E3U6IXlBwsTU3YZTrFLd4LD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1434
X-Proofpoint-ORIG-GUID: pkr1ibFpQxwsfvALS3LahGqmwqF1PLgz
X-Proofpoint-GUID: R-H0xlR80wKSnfU2-rRntyHhYychs7ra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-24_05,2021-08-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108240111
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 17OGDZMW014082
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

Add Steven Walter in hopes that he or someone else
who uses meta-rust will help out.

On 2021-08-23 5:21 a.m., Richard Purdie wrote:
> On Sun, 2021-08-22 at 08:45 -0400, Randy MacLeod wrote:
>> On 2021-08-22 7:19 a.m., Richard Purdie wrote:
>>> On Sat, 2021-08-21 at 23:12 -0400, Randy MacLeod wrote:
>>>> On 2021-08-20 10:48 p.m., Randy MacLeod wrote:
>>>> With a patch from Richard, and the http_proxy check removed,
>>>> $ git diff | grep "^[+-]"
>>>>   =C2=A0--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
>>>>   =C2=A0+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
>>>>   =C2=A0-http_proxy =3D "http://example.com/"
>>>>   =C2=A0+http_proxy =3D ""
>>>>   =20
>>>> we have fixed the oe-selftest that was failing.
>>>>   =C2=A0Any volunteers to stub out the http[s]_proxy code in cargo ?
>>>> I've written up a commit log that could use some review and pushed a=
n update
>>>> to:
>>>>     =20
>>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Drmac=
leod/rust-redo-aug-17-2021-a
>>>>
>>>
>>> I'm not sure you need to change cargo, I think if you remove the bit =
in the
>>> bbclass that injects http_proxy, the tests are ok. That will perhaps =
break
>>> anyone using proxies but for now, I think that is a reasonable step o=
f getting
>>> this moved forward?
>> That's what I hoped for as well but not what my testing showed.
>>
>> I removed (commented out actually) the http_proxy injection here:
>>  =20
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Drma=
cleod/rust-redo-aug-17-2021-a&id=3Da4808f787caf8d0b44cf3946cf204164f24f91=
d4
>>
>> but the test still fails unless I mangle the test:
>>
>>      meta/lib/oeqa/selftest/cases/sstatetests.py
>>
>>
>>      -http_proxy =3D "http://example.com/"
>>
>>
>>      +http_proxy =3D ""
> Right, my point is that doesn't remove it. You need to delete it, not c=
omment it
> out.
>
> The issue is that bitbake does variable expansion on the scripts before=
 running
> them.
>
> It can't tell that this is a comment, just that the script differs afte=
r
> variable expansion.
>
> Cheers,
>
> Richard
>
>
>
Richard has fixed several new issues and is testing this in master-next:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/log/?h=3Dmaster-next

using the YP autobuilder.

We're seeing some odd intermittent build failures especially when using
the uninative class (used by default in poky) perhaps on older hosts but
we're not 100% sure of that correlation yet. See below and:

https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/581/st=
eps/13/logs/stdio

If we can't get this fixed in the next day or two, we'll miss the fall=20
release.

../Randy


error: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found=20
(required by=20
/home/pokybuild/yocto-worker/reproducible-debian/build/build-st/reproduci=
bleA/tmp/work/x86_64-linux/rust-native/1.54.0-r0/rustc-1.54.0-src/build/b=
ootstrap/debug/deps/libproc_macro_error_attr-9c7a09885c50c72e.so)=20

 =C2=A0=C2=A0=C2=A0 -->=20
/home/pokybuild/yocto-worker/reproducible-debian/build/build-st/reproduci=
bleA/tmp/work/x86_64-linux/rust-native/1.54.0-r0/rustc-1.54.0-src/vendor/=
proc-macro-error/src/lib.rs:284:9=20

 =C2=A0284 | pub use proc_macro_error_attr::proc_macro_error;
 =C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ^^^^^^^^^^^^^^^^^^^^^

 =C2=A0error: aborting due to previous error
 =C2=A0error: could not compile `proc-macro-error`







--=20
# Randy MacLeod
# Wind River Linux

