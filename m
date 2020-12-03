Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.69])
 by mx.groups.io with SMTP id smtpd.web08.7770.1606987786201743300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 01:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mY/ZnY2P;
 spf=pass (domain: windriver.com, ip: 40.107.70.69, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggUFcKInZfoN4HXUJsseGUpjj/hj3lfdJpRM3sTTMaqAPEPjkzYnDqI71x0XsNJhb8AxvxRZmVlHl5OJRdgN6C0oJSnxS2fKara/yhompT/DCX5rdMxuCGk1koDDJxlVQxv09GWye34ielvOR5DJWyIab8uMypnfcyWfTFUtAfREEdEfm6TDsguUwRsy9HAr+256OFxo5aBT7a0FHCYuosFKSWYDWfJuQkoOZMPrG/hMzbaM7CR4tkxU5z7NUa6qKyJlsPfEflyd6yF+r0OTbfoGANk+G/e5NX9ryapWRix7A1o0Ma9aDmBNELpWterQrKjiFHqMigVxfKpfo3QCpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbVbLuZrOlWOHVVeU0Hpkm7UpymlM/3wTGyHJvQ5FtQ=;
 b=jzRCJZy0rcOiLv9mqb/yBBLxOUmLXDrncr4JYzuz0FLZlRWo3uH3YOsDxvp4H2NQFPnWfbJ58dRBiuiIZRiLtIgUioxk91IhLmWGNmPvn81GkxJg/ILTEckZwLHE3P0+8Fh5xpoO+P1Sly7w6DNkgr6DqaXgAbB1rthz75KyZ1vYXzGK9Pw2bCWVbph234BVf8gQWsLiYQMSC/h6L3X+ltl2HI/8QGLcJp1lVM1X/pgWSl/Wu1pK3Wk9A9W2gXdQhP4exIpIQV7f+a9b87TFgQJGzbAeZwZjVc9evA4rkIs4IyqxSHDSC2UAJF21GVh/mt1E/wC6hZAch16dGBAbKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbVbLuZrOlWOHVVeU0Hpkm7UpymlM/3wTGyHJvQ5FtQ=;
 b=mY/ZnY2PA0fkwv9R4J3/LOVPhS/Q94hzze/g88jrPV0NmXp2DkYWmgPawxkrsFemjlD9ztBOvzaFfYflueyiB2VP8e11nqX422bIcL8QxAiD5YbscIxX3HwJ4FRfy610i4PuDt2UpbrANtt4vREvd6UjM2jOJsYVvNLLBCUf+Lk=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3292.namprd11.prod.outlook.com (2603:10b6:5:5a::21) by
 DM6PR11MB3593.namprd11.prod.outlook.com (2603:10b6:5:138::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.25; Thu, 3 Dec 2020 09:29:43 +0000
Received: from DM6PR11MB3292.namprd11.prod.outlook.com
 ([fe80::fcf7:a1ca:17c2:f169]) by DM6PR11MB3292.namprd11.prod.outlook.com
 ([fe80::fcf7:a1ca:17c2:f169%6]) with mapi id 15.20.3632.018; Thu, 3 Dec 2020
 09:29:42 +0000
Subject: Re: [OE-core] [PATCH 2/2] connman: set service to conflict with systemd-networkd
To: Jack Mitchell <ml@embed.me.uk>, Yi Zhao <yi.zhao@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20201102092012.15968-1-yi.zhao@windriver.com>
 <20201102092012.15968-2-yi.zhao@windriver.com>
 <f4fb20c8-e735-bc5e-bd42-3d1f8823dffd@embed.me.uk>
 <bdfe3b74-d0ff-6d53-4a8a-2195b9b49497@windriver.com>
 <3cb971ce-8358-5355-0698-2330f436d1bc@embed.me.uk>
From: "kai" <kai.kang@windriver.com>
Message-ID: <9158216a-ff01-1cef-e740-df48c83503a1@windriver.com>
Date: Thu, 3 Dec 2020 17:29:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <3cb971ce-8358-5355-0698-2330f436d1bc@embed.me.uk>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:203:c8::11) To DM6PR11MB3292.namprd11.prod.outlook.com
 (2603:10b6:5:5a::21)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HKAPR03CA0006.apcprd03.prod.outlook.com (2603:1096:203:c8::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.8 via Frontend Transport; Thu, 3 Dec 2020 09:29:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e134186a-ac14-4e5e-037c-08d8976df70e
X-MS-TrafficTypeDiagnostic: DM6PR11MB3593:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB359390E9E1AC011F746B8B8D95F20@DM6PR11MB3593.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aiL7MutspD6tq+EhDDZMcLfRlPn7Yb4F5QJUTq49oY8TUmhK4Ukim0ks960kSeE8mkvv6i2LoI1XZ4a4n13CbltdH94j7YDkuucKnvfOUdL/Wob64ZmNW03RwfZDG8DZ8W8qXonSrSh5uLzB0yw6LZRYehtE4hjnAtwumQb72R4AFcb5Kh95yOxqyS/95HvWqYGV+EP6cVLhGohbrwJG1gsH2UGZHJnBidMMAWp4p1vPLfjRKTksfWycclP3Mi73FClz3h0I4V04oUO3l0uFX0w3g092fSPXbtXf70QTCaiNfxiJN6wWJBrXQx7gY3o1Ow8oqKUmS2s6mCw4G+ncoOj+PRWZRJBOqk50M7S9+HGMKCv15XiezRa3JF64dXdhVH/g8tkwqOuBUOCExPWCU2EJBljGi8GSljBxZDDFEleWXToOOVrInWaVB3Cib5LLby3RUG9qKAx6rKlsfRntYnVG8PBkxQhpBHz5c06WSNP6sOl3vSI9JIi29W0BcG6bEijl2jnABltRmzBdoHPvlA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3292.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39850400004)(136003)(376002)(396003)(16526019)(2906002)(16576012)(6706004)(36756003)(83380400001)(5660300002)(316002)(8676002)(8936002)(66556008)(66476007)(86362001)(66946007)(6486002)(2616005)(6666004)(110136005)(31686004)(956004)(31696002)(966005)(478600001)(26005)(53546011)(52116002)(186003)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?2GVb8Hx9L90VHLPhoB85H9FVaw/CUqaOSf/0lmv88DdB7Ut/CycRjK9hEYLf?=
 =?us-ascii?Q?wuOhNTC+PwOEFp1SNXLuYyl6HLtChl3nKNcMRVlSaiNxELtmNjppzR4t/VuO?=
 =?us-ascii?Q?uY7Zg4CGV/3Pyx3fnVT6pN46PMT1vtzCNPMRgs8r1YnEirziz1kRNQ0ws3VS?=
 =?us-ascii?Q?X1ULSpMF8Xav7nE5SM3IQdkUVhrt1uI49uCzORdce7zfDXc8JCLddCoS8kOf?=
 =?us-ascii?Q?IwkDfbRTLiR059RZreC0kiXC0z8GFsyaTzvyglkJpfKZlLvtDwYYm3B3laZ3?=
 =?us-ascii?Q?co4VnvCMP0fe6F5fGe8Sl77eaQ3L7ut/oN6TmSANXBcXTPR8vRG33iCmJb1s?=
 =?us-ascii?Q?e5jL7WKGHH2YWb1ob8QEy1IRxdIkEtWObyHkkDI4+rKEkyOQB51cDkxmyvr6?=
 =?us-ascii?Q?U2qr/to0ttOSLT4nxr6hhhmnEA4I6Oq+af6OSAVG56WwddEo1nOs3v61M2vp?=
 =?us-ascii?Q?qfLCftxakX58SXh79UVw+mzP91FBwXBHDQfOSizse9MJLWubKAoX9oCays0K?=
 =?us-ascii?Q?HjGz8deX6hPungsh2ayjBdS6CazmP4M2+5SYxbQ8kkGy93aDKUo846OExadP?=
 =?us-ascii?Q?FZQKdUeIBtjk6exoroXT8ls0WIPBc9pzUz+lEPJplFIbqNnqhWVFeml1eRrk?=
 =?us-ascii?Q?V82QCxsMv+TP4lxyN/gJdbMhBFS9VuL5v6rMHKNpItbs1/Rno+mhtUmT0GdD?=
 =?us-ascii?Q?OTx1DqngWGN9iaLCFV4R3nVZAPLiS+60t5Cdf+rJFTwD55+MZSOSyD1r3TXG?=
 =?us-ascii?Q?Xzkqt+Ny7KcV7A7GQ+UauNIm0wMhYa4J5wiTMl9LKmb/3uifoKZga8m7cU0J?=
 =?us-ascii?Q?SHpIgL8ixYwQgYh3l4yeH4BEqhcy3VAXdaqD5N8ukpFmRkqqRjK1e0wR7fLw?=
 =?us-ascii?Q?7UPLfiVBrx4BOsvBrtVLsQhpv5pJAsVwOBFpRZdR/Br+y9GZBeZO1FLddtJO?=
 =?us-ascii?Q?Prcf9C79MBsKfX0RCdbMi5nKmDNHagsklf9R5cAdbCXTrGTz8U9bBrCe7Frz?=
 =?us-ascii?Q?bsvB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e134186a-ac14-4e5e-037c-08d8976df70e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3292.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 09:29:42.7543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5aRCypdo5mFXH+FhVSMpS9tysnko02G/uJp6iceO49/Qk0cuoE0cInLOu5J+PRYmTNBg/cF66HTG2mL4QT+0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3593
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 12/2/20 8:11 PM, Jack Mitchell wrote:
> On 02/12/2020 02:20, Yi Zhao wrote:
>> On 12/1/20 5:02 AM, Jack Mitchell wrote:
>>> On 02/11/2020 09:20, Yi Zhao wrote:
>>>> Do not run systemd-networkd and connman simultaneously. These two
>>>> network managers may conflict with each other.
>>>>
>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>>> ---
>>>>   ...stop-systemd-networkd-when-using-con.patch | 29 ++++++++++++++++=
+++
>>>>   .../connman/connman_1.38.bb                   |  1 +
>>>>   2 files changed, 30 insertions(+)
>>>>   create mode 100644 meta/recipes-connectivity/connman/connman/0001-c=
onnman.service-stop-systemd-networkd-when-using-con.patch
>>>>
>>>> diff --git a/meta/recipes-connectivity/connman/connman/0001-connman.s=
ervice-stop-systemd-networkd-when-using-con.patch b/meta/recipes-connectivi=
ty/connman/connman/0001-connman.service-stop-systemd-networkd-when-using-co=
n.patch
>>>> new file mode 100644
>>>> index 0000000000..dd012750a4
>>>> --- /dev/null
>>>> +++ b/meta/recipes-connectivity/connman/connman/0001-connman.service-=
stop-systemd-networkd-when-using-con.patch
>>>> @@ -0,0 +1,29 @@
>>>> +From 9fea099d0a3ece37d80ad70d32ebb8a93f8f3280 Mon Sep 17 00:00:00 20=
01
>>>> +From: Yi Zhao <yi.zhao@windriver.com>
>>>> +Date: Fri, 30 Oct 2020 13:48:45 +0800
>>>> +Subject: [PATCH] connman.service: stop systemd-networkd when using c=
onnman
>>>> +
>>>> +Stop systemd-networkd service when we use connman as network manager=
.
>>>> +
>>>> +Upstream-Status: Inappropriate [configuration]
>>>> +
>>>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>>> +---
>>>> + src/connman.service.in | 1 +
>>>> + 1 file changed, 1 insertion(+)
>>>> +
>>>> +diff --git a/src/connman.service.in b/src/connman.service.in
>>>> +index 79e75d6..014eafe 100644
>>>> +--- a/src/connman.service.in
>>>> ++++ b/src/connman.service.in
>>>> +@@ -6,6 +6,7 @@ RequiresMountsFor=3D@localstatedir@/lib/connman
>>>> + After=3Ddbus.service network-pre.target systemd-sysusers.service
>>>> + Before=3Dnetwork.target multi-user.target shutdown.target
>>>> + Wants=3Dnetwork.target
>>>> ++Conflicts=3Dsystemd-networkd.service systemd-networkd.socket
>>>> + Conflicts=3Dsystemd-resolved.service
>>>> +
>>>> + [Service]
>>>> +--
>>>> +2.17.1
>>>> +
>>>> diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb b/meta=
/recipes-connectivity/connman/connman_1.38.bb
>>>> index 027c41e9af..45c2934dec 100644
>>>> --- a/meta/recipes-connectivity/connman/connman_1.38.bb
>>>> +++ b/meta/recipes-connectivity/connman/connman_1.38.bb
>>>> @@ -3,6 +3,7 @@ require connman.inc
>>>>   SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz =
\
>>>>              file://0001-plugin.h-Change-visibility-to-default-for-de=
bug-symb.patch \
>>>>              file://0001-connman.service-stop-systemd-resolved-when-w=
e-use-co.patch \
>>>> +           file://0001-connman.service-stop-systemd-networkd-when-us=
ing-con.patch \
>>>>              file://connman \
>>>>              file://no-version-scripts.patch \
>>>>              "
>>>>
>>> Hi Yi,
>>>
>>> This breaks our usecase where we have been using connman and
>>> systemd-networkd in tandem for a long time. IMO this should be reverte=
d
>>> as if the two applications are conflicting then the correct fix is tha=
t
>>> they should be configured so that they don't both try to configure the
>>> same interfaces. As systemd-networkd doesn't ship with any rules by
>>> default it shouldn't be doing anything to interfere?
>>
>> Currently, A systemd-networkd configuration file 80-wired.network from
>> systemd-conf package is also installed by default on HW BSPs. Comman is
>> the default network-manager in Yocto. It will manage the wired interfac=
e
>> automatically. But with this configuration file, the systemd-networkd
>> will also try to manage the wired interface as connman does. They may
>> conflict with each other.In addition to revert this patch, I think we
>> should consider whether to install this configuration file by default.
>> Maybe it=E2=80=99s better to install it as an example and users can ena=
ble it as
>> needed.
>>
>> Thanks,
>> Yi
>>
>
> Hi Yi,
>
> I see, thank you for pointing that out. I agree that we shouldn't be
> shipping custom catch-all networkd snippets. Perhaps it should be
> something appended by the Poky distro rather than installed by default?
> I assume it is included so that network interfaces come up with a DHCP
> address by default so people can ssh into the machine without an extra
> config.

Hi Jack,

The original defect is=20
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13057 . There is no=20
network on core-image-small, so I provided
the default config for systemd-networkd. Because systemd-networkd is=20
more basic than connman and networkmanager that maybe neither
of them is installed.

The conflict should be resolved but I don't have solution yet right now.

Regards,
Kai

>
> Cc kai.kang@windriver.com as it looks like they were the original author=
.
>
> Regards,
> Jack.
>
>>> With this patch I can no-longer run both services as it's a hard
>>> conflict with no option to either revert locally, or bbappend this pat=
ch
>>> out.
>>>
>>> Regards,
>>> Jack.
>>>
>>
>>=20
>>

