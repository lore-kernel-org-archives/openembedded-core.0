Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.53])
 by mx.groups.io with SMTP id smtpd.web10.8510.1595555324828359489
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 18:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=A03P10N6;
 spf=pass (domain: windriver.com, ip: 40.107.236.53, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaQIfi4qIa6sTAEyZAfy291QIxrPrdJuOhlnAZH2TLTScc+sw7wt0rPeRRadNRT2MXNpxZbgWDggvjQoNT8TLUHhLTcJvCcFtASFZKVgpdPWgp5YyfmY5yhgs9fM2iJfSd3D9dCXTr+w/4wvHZHgqPTrnRS7UafHJFQtPqmlJ5e81oIH1/fb/YTMLIyqCNRNFUWXVFQ2Qq/j7sB90O1EBNsSJYoK5XRIe21/0Iz3NSXKnAwHcVuY8qbZolq8WmgGwhC++Bo4zDQe1TUA8YnRZv4dAgiopSygfXkvnZ8sR31c4CdUYJowLIzu+zAJMz+zQBAuyVZZd9gsk23ZHGNUZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJNXCo5TxJMwSdCZbvS33mndU0fq/ueHSZ/ifc1ABRk=;
 b=mmdvPnUqbR+724DA4Rgutx7xXyndETfNg88tKE8WHK+GnWEjshIoK0anFsJxywfuAXGNyN+F2DGsH+vzxzUcmeYw1YD6J6jpG8UspRk0JETJM2LKGPxoTZZPtJRu01ALgTOLy1p3eeBx+5RwW9L2YxDwJOEizPdupoNkFIBudHD5RCwoH9q0K1AdyqHcckGmFJBcz4N9xJn8I3Ryk38YAq1QjHJHPVvAjx0ong4Z8iOGeMwADHlR7UFPgltiRTS9L3E2oNAsEnixuDfXaiwmv+6Sy51Iq1v/Zr4clqeuR78lyKRrbeCdt6KRRxSuRd57Cxmu3RCv1+3qJ1exb4uyhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJNXCo5TxJMwSdCZbvS33mndU0fq/ueHSZ/ifc1ABRk=;
 b=A03P10N6CwgNmY6QGYpLOui/pmHizuX7JxSz+io1gNFYkQK/UBWUBXzvFNzUyrkWNSX9ZwjzudpvDWtWJSHHOtGU3pHWAbfqpIho3ME1Ae510XWnOPY5GyztUXlmbGZyG/sOEw4+zR+bci65nQV5tnPatbHkpUMTWBcfKwjAglk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB2560.namprd11.prod.outlook.com (2603:10b6:805:55::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 24 Jul
 2020 01:48:42 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4%7]) with mapi id 15.20.3216.024; Fri, 24 Jul 2020
 01:48:42 +0000
Subject: Re: [OE-core] [PATCH] layer.conf: fix adwaita-icon-theme signature change problem
To: Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Martin Jansa <martin.jansa@gmail.com>
CC: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <CA+chaQdLigicck-6Q53upOEBNxGei1a_465P6kOb_ZV8ungYMw@mail.gmail.com>
 <20200723065120.2942320-1-changqing.li@windriver.com>
 <CAMKF1srLZhLYaK2Lx9+pGSVZzHPzZqGfdZmeTky=CbHikaEhhQ@mail.gmail.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <e8de39b2-4cd2-4487-c2aa-afb5f9cd2547@windriver.com>
Date: Fri, 24 Jul 2020 09:48:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CAMKF1srLZhLYaK2Lx9+pGSVZzHPzZqGfdZmeTky=CbHikaEhhQ@mail.gmail.com>
X-ClientProxiedBy: BYAPR05CA0098.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::39) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by BYAPR05CA0098.namprd05.prod.outlook.com (2603:10b6:a03:e0::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.10 via Frontend Transport; Fri, 24 Jul 2020 01:48:40 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c39d8136-69f2-44ac-6ab5-08d82f73b18c
X-MS-TrafficTypeDiagnostic: SN6PR11MB2560:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB256034B15856117929C4AE6082770@SN6PR11MB2560.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a/GDh+JE9Xqw8t6qfTKC1brd0r6IWsObE/D/F99Do60auFFTyl+pCChf3HRyoAHasb+oF+XjddJ0KdBxdiRNWPn/scjlY7m1xVMveuENrjWhqOhphY24FAD03Bz36ok+2qaAps4CkCMUSJyQMZWz+FT/7kkwhnf6CxBTpJ2kXmjy/rH+t+kU7Ax95fPpCJIdetjlr5QdXEq1Mjq4Y+DnYUKaP3yK21gaXn9mC2w/P8HVsA5sXD5AtYdlLXGSG2USPgCgor829Rcrt+nP0KoJL3/WDbElFkZkEDE5UUo6JRgvARUHWCvRstBrElsJovWd5TRx6ax6ZajdhppgIDMhLB5tokftF38vrJdYVlL0YKev8oOJVxsCxzI9uEYgHVkqt3dqUFA433JzSjYqE1lfpPjl9nxRJdbb9Ga2X6A/MQE2vhlx2/pkcPYBNxXp8havyYFlCZ+QoNWvgO8JtjgKNse7ed3zygjKTXKSaYZ1dXoM1aYFZUv2GWh0nJ7OvXAg9PNo+i8YdA+zDU+2SPFTcA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(136003)(346002)(376002)(366004)(16576012)(8936002)(66556008)(66476007)(110136005)(66946007)(6706004)(31686004)(4326008)(86362001)(6486002)(31696002)(8676002)(5660300002)(316002)(2906002)(53546011)(26005)(186003)(16526019)(478600001)(52116002)(83380400001)(36756003)(44832011)(2616005)(956004)(6666004)(966005)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	BSAHHAQYRqOz8yvdNTAtoM4toOanch22U/eF57EFjqpGPe9xQO0YiDunnHdgSwL5/bzDsr9sUElLxFfsaRv6nIV05ogvBvS3A93W8CxwupGWINr8JaRE0ymllW9bu9JM91ePo8SWHy4KMHFIQJI2c+KBBPs4jmPO7ZACfvlTq8vjs8Sltpxs9WYdQQt4PH9nV/3aRLdwS45Han7ig0LjIuqsvqxRpRXTOPx6trRTo3kM9VdS/K4IS6dTHbst4o2q7c0Uh3y+JIt1GOELPTf23iRrsScNVWz45rMowm4psqv1aMB8CqBcH/Aey4j3k81047mCgzO2SvnKVWv0lXpvI9GjJIxL1KM4vgdy6dZqp7kH2U4lgvRnJiFYEYHCGcHK+aFRlbLhkBndF9aD62QvYaezz2uio+fqF2btxHC1ypHFrBH31ff5dSF+gUgDisb7YGs18vdHg1A0D6ovEaIYY8QzE7+WeP8TiucQ7tkq13I=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c39d8136-69f2-44ac-6ab5-08d82f73b18c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 01:48:42.0938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvJYYD0dmOyWu6CBpFVPikJgSRY5veYFsc9Qx1pp+b88bdT0Nn2wQqfQuZCfYz6xfgFe3iwafTEcbgJFDj8f9yLy5lldm2JnkSu/c3mVVWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2560
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 7/23/20 4:35 PM, Khem Raj wrote:
> infact the error is not limited to just one theme recipe but all which
> inherit this class see
>
> http://jenkins.nas-admin.org/view/OE/job/oe_world_workspace-compare-sign=
atures/980/console
>
> so are we forcing same kind of fix everywhere ? seems a bit of kludge to=
 me

Yes,=C2=A0 I also noticed that=C2=A0 there are several recipes under other=
 layer=20
have same problem,

and that's why I say this fix maybe not a good idea.=C2=A0 but signatures=
=20
generated very early,

SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS not work if set in the=20
gtk-icon-cache.bbclass.

Any other good idea? Thanks.

>
> On Wed, Jul 22, 2020 at 11:55 PM Changqing Li
> <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> allarch package adwaita-icon-theme inherit both allarch and
>> gtk-icon-cache, since commit 31e3d34c8a9c3e8481aa837aa0bf52adf095fe62
>> [gtk-icon-cache.bbclass: add runtime dependency], it start depend on
>> non-allarch packages gdk-pixbuf and gtk+3, which make it's signature
>> changes when machine changed.
>>
>> like for task do_prepare_recipe_sysroot:
>> "Hash for dependent task
>> gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot changed from
>> a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e407f4 to
>> 1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b1520f"
>>
>> the only way to fix this is remove the task dependency.
>> SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS not work in class, so add it in
>> layer.conf.
>>
>> Maybe we have other recipes under other layers have similar problem, we
>> can only add one by one to its layer.conf, seems not a good idea. but
>> add *->pixbuf will influence other packages
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/conf/layer.conf | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
>> index 098ef12ac6..c115c87043 100644
>> --- a/meta/conf/layer.conf
>> +++ b/meta/conf/layer.conf
>> @@ -80,6 +80,8 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
>>     weston-init->kbd \
>>     connman->xl2tpd \
>>     lttng-tools->lttng-modules \
>> +  adwaita-icon-theme->gdk-pixbuf \
>> +  adwaita-icon-theme->gtk+3 \
>>   "
>>
>>   # Avoid adding bison-native to the sysroot without a specific
>> --
>> 2.17.1
>>
>>=20
