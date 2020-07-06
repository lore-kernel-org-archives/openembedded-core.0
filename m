Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.56])
 by mx.groups.io with SMTP id smtpd.web10.53184.1594021796856471093
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 00:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cIhK8E76;
 spf=pass (domain: windriver.com, ip: 40.107.244.56, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDVcQF5u1EUyINWotFmlsKEEqZTqjN6seT78jGo3CSMN3mAQ85AOklsDBsJbOd5o1Mj/oCElfYGcGRDAWRyi5Uvs9MM4dP26F+pKVNF+DLs8JnnRXuW7BF1M8JKojoyK83adW4XLDTItku9/umcO4Nc7Oa6YbRecKcsSL47JqBMHgGYb2Cx+EaDJ8bSXqMo9cBWWpELr6K+a2AlO7AYXJdEXv4qNuUP+4HCXUekU2IoYfEBdCdYW6WSAiK77xu0umZFDK8E+zO6X/rLJjpb/YA233rAWbRfhEBj/XR/IXjG1wMEfF3n6XnG4wD9CVenldBTOSMZKA6W8GxJvA4X8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrispPpsGpTtAJXU8Z0URu3pN1R5XAgArd8jmKB6MdM=;
 b=ZXEQ4+VnlZO1mn8OVCye8HRg9kCli1Ip9sFFv4cS520WyUZ0aYLKeg9zg9PlArdbueg6fYVDLgpJMD2mguxS9lFB5slA90KTnezKoolFH7jtCy6hQe8vOKeg8l9kugFVYT3EHNtal4XUR4IdZCkeddp/7ZocxRhHkmaI9IFAf+AlM2XReWC47myT91YcmUIywJJ0n4Xxlw4OuujGYC0oklcZ+x1ywh18454vEalNVzPYuPu+lL761F7+p6zjxCK58EFFgUnS3kdK78SnVjMmnxv6lxkl0iGWqwubTp1FzojcpxZiWsQ/zztNmSDulungsoO2RsjGM+UcFHrT9Vprkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrispPpsGpTtAJXU8Z0URu3pN1R5XAgArd8jmKB6MdM=;
 b=cIhK8E76byYq3A2IKafBzZus61hMMTGbZE85YjVeGERPcxEqausXyjcos6gKgHHs9mBYz8gMu1eMpDCKfvkqNpjYsOT6+NxXo6mFbp/H4C8SvSKSJd6K8LZ72RiK6Z/9i9TT5yjKSzSny+IZOKSmiDZ+p14DXZHu1J7V4P8pkQs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3720.namprd11.prod.outlook.com (2603:10b6:a03:fc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Mon, 6 Jul
 2020 07:49:55 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360%3]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 07:49:55 +0000
Subject: Re: [OE-core] [PATCH v2] netbase: use git fetcher
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200629043119.1798934-1-mingli.yu@windriver.com>
 <c3e569088010a8242703f559f99de658e427f32b.camel@linuxfoundation.org>
 <3c5fff8d-aa64-5f36-7db1-2570bbbbf520@windriver.com>
 <aa8752ad52e2075016d4f14b84bbef8e9b40b7cd.camel@linuxfoundation.org>
 <161F17664CF658A2.26531@lists.openembedded.org>
Message-ID: <d2824500-e41d-c528-2288-bd8eb14f0d07@windriver.com>
Date: Mon, 6 Jul 2020 15:47:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <161F17664CF658A2.26531@lists.openembedded.org>
X-ClientProxiedBy: HK2PR0302CA0003.apcprd03.prod.outlook.com
 (2603:1096:202::13) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by HK2PR0302CA0003.apcprd03.prod.outlook.com (2603:1096:202::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.8 via Frontend Transport; Mon, 6 Jul 2020 07:49:54 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f467139-5361-47a8-22ca-08d821812c52
X-MS-TrafficTypeDiagnostic: BYAPR11MB3720:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB372060BDE34908F00BFCEA0FF1690@BYAPR11MB3720.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7jRFexRZyENNVbdG+xu3xTYUTIe/tt/Ksy58K57xwQM8KYSG+uVkJ5NlBbB3ta8CnFOZhH0IYJLKJHVlGUYsnrpOWjpUmddmRjZSzVy32fFVvVlDM+25cXg4ZDW0eMcmnB1U/p8VC9H9Zj65oMFq71bqJkYJMvGVtV+nWkAZa2Gw+NpVCgltXvRHtsh1b4rLev8lZFOoQ0zlDtN3xXXY4w9erDPL5k1rU5ZdfqLiAeFHIgUP36e0IMH6xDajrgMNACjZUFq0AWiKHw9NapbPpcbBiB1hLUX02k0F1eZWdn4PTK41xdN+y/bHn217ve6nbg5xuF9NmjMXA5PnigJS81uVlrccOsNq/zxSPWtqzAHQGfmQ48OKXBasVPS3fcbHn5F8UkaEgfR5rlJBf5+i8R4lqvudpxe5kGUD9e/aH1ANDUIIEMx/EJgI8wCYhWtkkJRt2nnU5mCXrclf7juibZvBij2H/TJjTL0VwpQLBE3sgFOZp9xeykqJgqAQDiiDMLOmFWqCOhKgt3Ct2nsZtQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39840400004)(396003)(376002)(366004)(346002)(136003)(5660300002)(31686004)(6486002)(83380400001)(2616005)(956004)(2906002)(31696002)(86362001)(66556008)(66946007)(66476007)(36756003)(8936002)(6666004)(26005)(966005)(53546011)(186003)(478600001)(8676002)(316002)(16576012)(16526019)(52116002)(6706004)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	9PTCuKtxkZ+qw3AF8fYS61Cs4URRPR7NUEuDy/uAjaWaXqWBHmorYfKVHvMkDioLuosqOl1UuI7jtA6gYMdO6nuwHjI7xY9tHGw0JK/AywAQHBmJKrVzdcQC6OxSblxRNw3CYdXBbvBSHeXsGEy1fCsTZBI0Cw8dntIemWh4aVFPAlrBNJv+GbmJnAUSLpOVgRwagW9tvWveqfzFUrk3VwbZBxgjo9ee24HhIDc+KExi16bvvNASMxsYF/GzAOTPAn7L4x4dGGIY/SQHKJ/2qWb0t96gEA/AWBi51o5LrpRZTdhg7rvK9HM9Nd5Rv/LTknvxYstupT7dJJMYPl1MF15dEhLGhqE1c2FKqnPJ+2ndj+N5uO5Y7EuV2cUGqNBO/KAJd4mbMHLJoiuSQ5BmFqNaB1iEWc7i09AS6XZZ0QrnMOd25LgewSxgKbVZ6f8N3ixMyKdeeWTKJ4tRVBnMn/AyjFsloNXJ14XM4wD9aqw=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f467139-5361-47a8-22ca-08d821812c52
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 07:49:55.3132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrzShsLNAOAQfrST+VPolCvKi4NLjYufVbkr8euC10lAEkKgyEUi2S2cFDzv01WiocXKbamrxl19bNuZu+ev+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3720
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/6/20 2:52 PM, Yu, Mingli wrote:
>=20
>=20
> On 7/2/20 12:35 AM, Richard Purdie wrote:
>> On Wed, 2020-07-01 at 10:05 +0800, Yu, Mingli wrote:
>>>
>>> On 7/1/20 4:08 AM, Richard Purdie wrote:
>>>> On Mon, 2020-06-29 at 12:31 +0800, Yu, Mingli wrote:
>>>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>>>
>>>>> Use git repo as the the previous URL only stores
>>>>> the latest source file and fails to locate the
>>>>> source tar file if we don't upgrade timely.
>>>>>
>>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>>> ---
>>>>> =C2=A0=C2=A0 meta/recipes-core/netbase/netbase_6.1.bb | 6 +++---
>>>>> =C2=A0=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/meta/recipes-core/netbase/netbase_6.1.bb=20
>>>>> b/meta/recipes-core/netbase/netbase_6.1.bb
>>>>> index bc0049c020..c13685e8ad 100644
>>>>> --- a/meta/recipes-core/netbase/netbase_6.1.bb
>>>>> +++ b/meta/recipes-core/netbase/netbase_6.1.bb
>>>>> @@ -6,10 +6,10 @@ LICENSE =3D "GPLv2"
>>>>> =C2=A0=C2=A0 LIC_FILES_CHKSUM =3D=20
>>>>> "file://debian/copyright;md5=3D3dd6192d306f582dee7687da3d8748ab"
>>>>> =C2=A0=C2=A0 PE =3D "1"
>>>>> -SRC_URI =3D "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
>>>>> +SRC_URI =3D "git://salsa.debian.org/md/netbase.git;protocol=3Dhttps=
"
>>>>> +SRCREV =3D "0fc1e4ce39328f7388badace0aaf7b7294d5ed61"
>>>>> -SRC_URI[md5sum] =3D "e5871a3a5c8390557b8033cf19316a55"
>>>>> -SRC_URI[sha256sum] =3D=20
>>>>> "084d743bd84d4d9380bac4c71c51e57406dce44f5a69289bb823c903e9b035d8"
>>>>> +S =3D "${WORKDIR}/git"
>>>>> =C2=A0=C2=A0 UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/n/netbase=
/"
>>>>> =C2=A0=C2=A0 do_install () {
>>>>
>>>> This still breaks all oe-selftest:
>>>>
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/109=
5
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/108=
7
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/108=
3
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/109=
8
>>>>
>>>> oe-selftest -r reproducible.ReproducibleTests.test_reproducible_build=
s
>>>
>>> It's weird, I did run reproducible build locally with "oe-selftest -r
>>> reproducible.ReproducibleTests.test_reproducible_builds" and It succee=
ds
>>> at my side.
>>>
>>> BTW, the netbase only introduces 3 files as below:
>>> # rpm -ql netbase
>>>
>>> /etc
>>>
>>> /etc/protocols
>>>
>>> /etc/rpc
>>>
>>> /etc/services
>>>
>>> And I did the three files' checksum and the checksum turns out to be t=
he
>>> same when with the commit and without the commit.
>>>
>>> Anyway, I will investigate the issue again.
>>
>> This is the diffstat output on the result:
>>
>> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200630-_j=
n1koza/packages/diff-html/=20
>>
>>
>> It shows this is a timestamp problem, the timestamps aren't always the
>> same. It should be using SOURCE_DATE_EPOCH.
>=20
> Hi RP,
>=20
> Many thanks your hints!
>=20
> But I still don't understand why the reproducible test succeeds at my=20
> side and the corresponding SOURCE_DATE_EPOCH in my env as below:
>=20
> $ cat=20
> /builda/yocto/builds/poky-build6-st/reproducibleA/tmp/work/cortexa57-pok=
y-linux/netbase/1_6.1-r0/source-date-epoch/__source_date_epoch.txt=20
>=20
> 1581895519
>=20
> $ cat=20
> /build/yocto/builds/poky-build6-st/reproducibleB/tmp/work/cortexa57-poky=
-linux/netbase/1_6.1-r0/s-epoch/__source_date_epoch.txt=20
>=20
> 1581895519

 >>> import time

 >>> time.ctime(1581895519)

'Sun Feb 16 23:25:19 2020'

That's to say, both reproducibleA and reproducibleB build in my env has=20
the timestamp 2020-=E2=80=8B02-=E2=80=8B16=C2=B7=E2=80=8B23:=E2=80=8B25:=
=E2=80=8B19.=E2=80=8B000000 with your reproducibleB=20
build as=20
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200630-_jn1k=
oza/packages/diff-html/=20
which you pasted.

Thanks,

>=20
> Thanks,
>=20
>>
>> Cheers,
>>
>> Richard
>>
>=20
>=20
>=20
