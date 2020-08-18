Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.75])
 by mx.groups.io with SMTP id smtpd.web10.58841.1597717876473870944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 19:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Q51v4Oo1;
 spf=pass (domain: windriver.com, ip: 40.107.220.75, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZoNFgjGOdLgBz1OSTVCWLDkMY95UjsIs0ZRaISPnrKFrtSVif3s3SAebk3arpB544xHFlZ8Ns/HIMs0WrbpheSGq0q2t/TsHwhftyAfr20Bpew/flV+yt5ZBbYgA3AeYbcTmMNoT2tKygFaBtCji7AbjKjRTJGNVMFwlZSv8cVAhMV2dxKshyJ3qv4iNxEnsPPJcdQp4eMFHjrQI/A351QgYiWRIuUc3EMdFFSYK0Dixs/am+Q4KBXzF4Tny7wL+LL3y8JRQEYJs0wXOo8gJM31TbAZHJr8I1KTCmAVvlrNc8c4JEGTHDlUwfxfM9sXsxKlZOGG3IwWGsRjetb3sGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFaqsUgaOeHl9bNQAW9UtWt4IGIw3um5g3DKN6ye4YM=;
 b=TbueF8U7Pd9fx1OpcReOFK8wHIdL0X5A1e6dJaIRPj2yWp3TlMQU2bC4v87WZhDxElihSsjZtRbShQMWgfuTPZD8fR/wtXxcAM9XfzCbtLwHD2MGvacN9yrWk+WoF0ECa+jwrD7qtsha+TOoV971xp90jagx2dt6CLRtkawkv2uxCnyyAPYy394rSdkpTPA7RPr6sbSgIKMoqA7Kk+Jja3vkRnPUtOOfDTX0B0ZMAHlVC9FH43icdyOm20hIpVsQTceKu1tTezI0H7A1NKdQhLWmYOIDqWJAWILb0bBjHCL5Y1XhC5kGydcPSV/d1bliVEatHHQMv0XvlgygWfHYLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFaqsUgaOeHl9bNQAW9UtWt4IGIw3um5g3DKN6ye4YM=;
 b=Q51v4Oo1gcVpDFhsy/Oag9PVwQg9zPPpvwb/Rsjl1O0NNWNJZFaz7tpdbdq2nIym5rdS5sLd0Exl/cmIgify2T0oe6E6noyaWMIwdPSKA8nvhqYM5vgc97+oXeswIEKMTSYb52TBMRHwVmzCO4zU5Puc3mGrrvC6TxSVYBJepc8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB2560.namprd11.prod.outlook.com (2603:10b6:805:55::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.24; Tue, 18 Aug
 2020 02:31:15 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::2d48:250:daff:8270]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::2d48:250:daff:8270%5]) with mapi id 15.20.3283.027; Tue, 18 Aug 2020
 02:31:15 +0000
From: "Changqing Li" <changqing.li@windriver.com>
Subject: Re: [OE-core] [PATCH V3] gpgme: fix multilib header conflict
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <a6acd2d8a5d7389363d3e45b230c253ccbdc5e91.camel@linuxfoundation.org>
 <20200817025713.832019-1-changqing.li@windriver.com>
 <500487f787b56af2e2b3f4fe33769d33a5e31fd7.camel@linuxfoundation.org>
Message-ID: <701de434-9faa-d181-09b7-530065ff5221@windriver.com>
Date: Tue, 18 Aug 2020 10:31:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <500487f787b56af2e2b3f4fe33769d33a5e31fd7.camel@linuxfoundation.org>
X-ClientProxiedBy: HK2P15301CA0022.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::32) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HK2P15301CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.1 via Frontend Transport; Tue, 18 Aug 2020 02:31:13 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88e9f0fa-022a-4863-4f93-08d8431ec75c
X-MS-TrafficTypeDiagnostic: SN6PR11MB2560:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2560CDBB51B85B86FEFE4A85825C0@SN6PR11MB2560.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kCn8re06v6WpXgCPm8vOujB4u0L13EYX4xKjPYUr6PVmOSJ2cKLlsK7LK8zv+bawodajW9qqV6ClBKEa2CDCuW6pbJVdlHg1ht05i7ux+Phk7sdxiz+g0tYudsy8uDPcOEmhcwbKvbLjikQ/SAYjaOZlf4Np5bymluZ5n/HnxRgNnYN47yNVLWhYkgwTSGXDcDqvt/GERg0ioHuEJzV/ZNH25CE0gtdzj5I0v03/oBi7xQgM7TY+4Rfz61O1dtAs0ZutaV9lGK+6sMc7/kiN1EGA/lLkCXixOijPUe6NI0Jb8SJCmQZ5ABsX8wM9JT8rEEqtUh/F0+vHB0DhBIveMPJqX07/KTcKZzKR+gDRjWBpXjHm4CCglYu+bNlyHQDpdjwoTOGKc/Nxw6YF0k5xKVOrZyv+lcP2rIdUVkfX+R0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(346002)(376002)(366004)(396003)(53546011)(316002)(36756003)(186003)(66946007)(66476007)(6706004)(66556008)(478600001)(16526019)(16576012)(2906002)(26005)(31686004)(52116002)(44832011)(8936002)(8676002)(956004)(6486002)(86362001)(2616005)(5660300002)(31696002)(6666004)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	tgoCz51GldAJF0EKr6x6ZFLoj8RdygZbJz5aOBalX6ccuxbmuF3/N5TLX5+eMldBTtUCK0qyQQN1GiBue7jJXwbYRIdSyGBlgtvTXa9sCNNxbhvW8mBH5rEm3c5JyKfQ6iQrDvfySOBwkxKoq9q/tFT23l8sI97+bDGTNZnDgupvYX+l8I8kTS8CPHRrWIY2qlT12ah+OIwZ52++Cdz7WWZvyaR1H0eMAXzS97B52FJth3v6ir+Mc+WHN+xdNJJNoPPVSdDyY/ZSFd23Q7jxzU/mFpgLKykjDJ2lMCkInXz4L9Zsd8WuPSXxoQElpE2scG1DfjQK3AXRtMJ5inAz/1zKchyd88HXWYNSy3cwQg62X3IA2NCD1OE0wW0jO0ZV/Wt/vpx/TO02VdtX8posCVuGz5aNjnxaPg9zwogrbx0tw7bEpN6JE42x+iQahEXcjDJobyVcNIZJ+LdKjUjhVwtEWGFvjEKcmF+8xxaE1vAjRrZQuPEZbabiZsuRaykx3VRPJZnpTX6hxgupoWFCCqfWm3uNG+zweoJKudC8y4MUcXbc8QqcLev0Z9BprldrULpxE86wZ12PiPWqYIeuwOxRRZxtUB18vJoXwgdLaT4TH9PkecMmwr4+7HIx0UlFqi0gqeyneRotOE2gwBGZTQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e9f0fa-022a-4863-4f93-08d8431ec75c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 02:31:14.8828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQ5+/uoZFKNb2/eLNaFQ10xxo4fdCP+IV/KC3KLxPwN0TxcxIONIoltzrPEvP05HgKDowN8d1qRqbeMvevdXy5Xq0yc4ghQbTawOoIRqXus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2560
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 8/17/20 3:41 PM, Richard Purdie wrote:
> On Mon, 2020-08-17 at 10:57 +0800, Changqing Li wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> fix error:
>> file /usr/include/gpgme.h conflicts between attempted installs of
>> gpgme-dev-1.13.1-r0.core2_64 and lib32-gpgme-dev-1.13.1-r0.core2_32
>>
>> diff of gpgme-32.h and gpgme-64.h
>> 21c21
>> <  * Generated from gpgme.h.in for i686-pokymllib32-linux-gnu.
>> ---
>>>   * Generated from gpgme.h.in for x86_64-poky-linux-gnu.
>> 109c109
>> < #if 64
>> ---
>>> #if 0
>> 111c111
>> < #error GPGME was compiled with _FILE_OFFSET_BITS =3D 64, please see
>> the section "Largefile support (LFS)" in the GPGME manual.
>> ---
>>> #error GPGME was compiled with _FILE_OFFSET_BITS =3D 0, please see
>>> the section "Largefile support (LFS)" in the GPGME manual.
>> 113,114c113,114
>> < #if (_FILE_OFFSET_BITS) !=3D (64)
>> < #error GPGME was compiled with a different value for
>> _FILE_OFFSET_BITS, namely 64, please see the section "Largefile
>> support (LFS)" in the GPGME manual.
>> ---
>>> #if (_FILE_OFFSET_BITS) !=3D (0)
>>> #error GPGME was compiled with a different value for
>>> _FILE_OFFSET_BITS, namely 0, please see the section "Largefile
>>> support (LFS)" in the GPGME manual.
> Please use unifed diff format as we use in patches as its much more
> readable.
>
> This one raises interesting questions, perhaps we should be enabling
> large file support everywhere within gpgme instead of this patch?
I checked GPGME manual and the src,=C2=A0 LFS support is enabled by default

with Autoconf macro AC_SYS_LARGEFILE for both gpgme and lib32-gpgme.

This header is generated during build according current configure.

> The other patch (libffi) looks necessary but I'd much prefer if it diff
> -u.
I will refresh both patch with diff -u, thanks,
> Cheers,
>
> Richard
>
