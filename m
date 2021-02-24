Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.74])
 by mx.groups.io with SMTP id smtpd.web08.1388.1614198386574919406
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 12:26:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bUBbml3i;
 spf=pass (domain: windriver.com, ip: 40.107.223.74, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R35WkH5xUDUbGFof+87+4xHkyJTRq5mqPSS1H+8pbWVDoGttMHdWGXij9A9zWDtGOXOJdA5vOMr8VQDFZ3kkw7rS1ax1zuOxLHsz/2IIOf+g1f6aJ1MGkkZjsqw9sOscMAE9UikMadfimaYtXMwz+kfHMDGzoGRjOAupKTeIG5G6TSbs6rsQEcf1km9I0CZQL8TOne93SOQIZdQeBnkbTP7ndEIeT4SQfFp5nAhNU35V7GzgBWKZEDsXOT4XzYC8hePA5wH2adyAmlWp2QbFgp7hdGsMxNfU/VncMyr23Io8WitLTqk6ffj8PfdEr9vlWY7rR7Apgoor+kVsHHsdzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+oPff3EkNkF3fmQT7kK6Slkr+sLfm6e548zSu9tjroA=;
 b=CUYOvFmWuAPJWBXV02vKfQHU7JWAqby0aVB+ljuz3+ValgkbcIipyMWXBlHSlDfXBAggBjwuJHR1Nf+jMixWpNThorhPKQPPrvTidMxORA4SuIsQZxHvqzOKdF1xGmLrEMa99nzcu1j7S8VJPWacixXY1+v+bXd5YUJl/Ul9b3QjHoO2og696F2eBxTgG2FxXBv7ZT4FeWBW56BnaVt+K9h/AufQmlj5XjDkoNsSBod68AvmclB8gkSf4tnb0Late2EHfYVhzwkAcMS1cbIDP7C4mHd/J3skXiYylHusnNZvjovyxesPb90ekkhRvWmijY1YDVsxPA5tslVpRAHl/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+oPff3EkNkF3fmQT7kK6Slkr+sLfm6e548zSu9tjroA=;
 b=bUBbml3i8Bv2xOqonrsBDGFXBDb0UQcPcOSF9/P6FarY8qGLMgndU/RE5oKdFQ9pMavxqoMd6Mlb/n6juKXA3moQqkmizq9Hk6QoMOXR2MYuNUy6ESF2ESNaWR1o1cK2Qyc+lW3g2OTGv1tB9brLT4a7e1BpbVPOf4lZlPqAA8s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR1101MB2106.namprd11.prod.outlook.com (2603:10b6:4:54::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Wed, 24 Feb
 2021 20:26:24 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e%7]) with mapi id 15.20.3868.034; Wed, 24 Feb 2021
 20:26:24 +0000
Subject: Re: [OE-core] Merge meta-rust to oe-core
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210224030201.349588-1-Randy.MacLeod@windriver.com>
 <a373f6be54f63987eb9cb0ce994b807fcca01062.camel@linuxfoundation.org>
 <89c6f05d-5add-8906-c76a-bbaca574497b@windriver.com>
Message-ID: <4cedf397-b3da-2060-5251-a398a18ef384@windriver.com>
Date: Wed, 24 Feb 2021 15:26:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <89c6f05d-5add-8906-c76a-bbaca574497b@windriver.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::31) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR02CA0018.namprd02.prod.outlook.com (2603:10b6:a02:ee::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 20:26:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6507e98-633d-4730-828b-08d8d90274a3
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2106:
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB2106B7AA73E3A27675339D47F89F9@DM5PR1101MB2106.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h1BQD6SXzrPszvgnwfCrnwvjz/AblnphYk0miZNa0p6SG0OedQI5UAHmxnlLyxghoHYpoTTxKfC3aC3eQDzqTf0vcmn92dO5wSkH9hT54OrRjT1wDuAw++aUkkhTG8APjM+Ci2e9T51WcvIsas0dsI0wC03B7EvfoCLahHeQVeltc/3yjcKuZecjrYJbehVlQ27f2r5jnc9wy94XTCUrvFO6mISvNloUreyNQzNlDIqF7zhN0MP1puNvIp8Z8tfZEEB3D5E+GigpekwqlK8bDovqofgEOpiPCI5EpjhIksnnn1yhQVcCfHUZg1ItfzXcixWtnslmw+KaWeWXBGXq04ZKJVHJ4g6Kloz8f8uRQZum1Gk7D/h9ACcPQOASUH/3xt8f1t96E0RY1Uqaq55Ew0ox/CyVQgnUtW1KIiK6PuFv1OQCQwGHm4UoP97hiCAydJhw7fM9/X4JHZaRtLa3kQ8G6iUF9l7t4k1c+VOKdHmO+hSj92j7VDb01crTOG94Or1yq9x3lOzDygXilJUdoAwAlUyITQX0UsKY8uHMmg11cLPT77BU3jdUzARxwTQ0xN67/o6TCCI1mcvrmBsSrjMJUxxRo1X4RQ5YwR5mHYUloYjT14tPHDn6NZZRuiljzXFSFDLr0VuUp/tL4vyW5cBIZCKfy8JlfWUL1zuIEt+9FNRAtUBOkPajjexRiEDT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39850400004)(376002)(346002)(83380400001)(8676002)(16526019)(66476007)(186003)(66946007)(66556008)(86362001)(316002)(6486002)(31686004)(36756003)(8936002)(956004)(2906002)(478600001)(31696002)(53546011)(52116002)(26005)(2616005)(966005)(5660300002)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?bsgrkrPAZYoCTOzvhHIDD2oU3mGgCt95onBhw3PvFZ1wGs82dbEg7U/wQp3A?=
 =?us-ascii?Q?3cEPQA6T12FZkpQF4s05g/XhIngV5LDm173MX1yclcpJBGPSB+PaCZN06Yuh?=
 =?us-ascii?Q?hB2Tsoojg5PcJWHwa+Bu9Hll5Vm2qrrnKEs+LUiYkZ2o1ThKIM8OiC7HxFIq?=
 =?us-ascii?Q?FJbY3RWOt2MXvQTPTY3I5qTY7bKxDWSITFPtfGx8rDRcV3WMDQ64Tqt16g8M?=
 =?us-ascii?Q?T2ElX1rWCYll/++NQVnoI9FSMwozq+auLSdMcgd/x4iyXt/oYg9zsEBqm8Dz?=
 =?us-ascii?Q?q5WW4ImAdxtgllZb7BoKdcm5jBw92fXMeVkQHHuzfQjX5tYc36aeTFistKeN?=
 =?us-ascii?Q?TxWNGz50dZTjzzRAqakC+YlajjS7Ma2P2AFefWFKCyDv/U6fgRV4OL67Y6cp?=
 =?us-ascii?Q?SU+/y3vi6w3RQYl3dKelzSKKIcXGmvOdeDw9dfPS4cW38U2B1f+mUDKl1YCN?=
 =?us-ascii?Q?D94JT7aBqUPzFpyogr+nuMgVzNhKSNBbGbRW/BobhTszu8isnibrStylMvB6?=
 =?us-ascii?Q?vI50bQkXniKhTetIrYXIPA/H/QkeR5lrsrwtI8UYgSErit9ozcTSWon9SYG4?=
 =?us-ascii?Q?yo6iJbuIqb5psEIg6wqLwtRI6TXuyEuhMk1ihqcoqVXqd1zHhAJBPcn24URG?=
 =?us-ascii?Q?mUuvKVmm1b+zoVCIx/tkrPMrKUnjzRkcNchn/adpSXFc1lWgPTS3bE/1RDhn?=
 =?us-ascii?Q?nRkfcL+OpXMGdifT3XZGiuWLNnqh6DQiJz0U6V/w+ZhEfxAzc6/6Cy/CJSJL?=
 =?us-ascii?Q?GkTfzlfeZQGpZImy1V1TbAF0vGrrXudzuGrs53i4Z5a602X1WiqDo8HVSEib?=
 =?us-ascii?Q?bv3tVjfw0akH8gaLaqk3dQSLNtNd3PoTkfmbEhEFvyQ40g+XTPhwi3AQACAB?=
 =?us-ascii?Q?uHTVcD4oxQaEi+hr/B59Zkg+yUozvlJEdX9ZQ+43TFrTbzkJImFYad7oNiPf?=
 =?us-ascii?Q?n1x9oWqS+DIa+DZUgqisZ9hfL+XZPwuS5+dvaOL1+02kVIzzwxvx0HPpgh+t?=
 =?us-ascii?Q?A0LlCbtF7GjqW4+La0k3xs14Qt75gE6Ha13S4ihLah/HntFpbVs+y18MA7zz?=
 =?us-ascii?Q?CCImUFAGLJ4XrzTWXJMg6MV/pSSZaIV02W+dfHNJjTtfiZrWsLRumeEbJkGm?=
 =?us-ascii?Q?vHzBLllnyLXmzCcr+pzGDE5khe1/6fb9iho9rUqqcjvc3ldVv6hXVw2ChcPW?=
 =?us-ascii?Q?8jphv7dZZttYJQm7hNFh8Uk34STJu1poqwDrsiMRq0yaXOWk5Fk7xIXXxfQv?=
 =?us-ascii?Q?8uBUxLu5h/SKHbLdREGF/MvX+WHhLVBHwECHb89nL6vhMBReG6F0bzEiFl9V?=
 =?us-ascii?Q?K5gK++6Le4zzZvJXiLRIB08S?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6507e98-633d-4730-828b-08d8d90274a3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 20:26:24.3969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyJ3YDjpLVs74PGQYs+9L4Z+hjFQdLSgDgAwTsO7fCUnkaObhOH7VPVA/n8fxA7GhrEVH8O8iBhiVtNF7QFFABwJP6eyN0bKPU2UMBeQqY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2106
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2021-02-24 1:23 p.m., Randy MacLeod wrote:
> On 2021-02-24 4:39 a.m., Richard Purdie wrote:
>> On Tue, 2021-02-23 at 22:01 -0500, Randy MacLeod wrote:
>>> Clean-up the merge of meta-rust to oe-core by squashing most of the
>>> meta-rust history so we are left with:
>>>
>>> =C2=A0=C2=A0=C2=A035da4b252f rust: add a language demo image to test re=
producibility
>>> =C2=A0=C2=A0=C2=A0088374371b cargo/rust/rustfmt: exclude from world
>>> =C2=A0=C2=A0=C2=A07df10d2a22 meta-rust: merge commits
>>> =C2=A0=C2=A0=C2=A04187796cd6 rust: mv README.md to recipes-devtools/rus=
t/README-rust.md
>>> =C2=A0=C2=A0=C2=A003b9c60ef4 meta-rust: move code to oe-core from meta-=
rust layer
>>> =C2=A0=C2=A0=C2=A02c62874204 libgit2: pull in updates from meta-oe
>>> =C2=A0=C2=A0=C2=A024cb3db88c libssh2: pull in additional commits from m=
eta-oe
>>> =C2=A0=C2=A0=C2=A0e9a0a3bad2 Add libgit2, libssh2 from meta-oe for rust
>>>
>>> The full diffstat is below. (1)
>>>
>>> I didn't really notice the scripts shown below since they are mostly=20
>>> harmless.
>>> I'll review them and remove them in v2 if they don't make sense for=20
>>> oe-core.
>>
>> This is better, thanks. My feedback from a quick glance:
>=20
> Thanks for the comments.
>=20
>>
>> a) Need maintainer entries for the new recipes
>=20
> Fixed by adding myself but making it clear that other maintainers
> are welcome. Once libssh/libgit2 are in master, I'll do the same for
> them since they are unassigned in master-next.
>=20
>> b) The scripts in scripts/ look at the very least inappropriately named
>> =C2=A0=C2=A0=C2=A0 for OE-Core, I suspect we don't want/need those.
>=20
> Working on that next (after 2 more meetings...).

You're right, they are not useful for oe-core.
Removed.


>=20
>> c) Not entirely sure about the languages demo image, its not how we test
>> =C2=A0=C2=A0=C2=A0 any other language
>=20
> Removed.
>=20
>> d) There aren't any tests in meta/lib/oeqa!
>=20
> To come. Is:
>  =C2=A0 meta/lib/oeqa/selftest/cases/gotoolchain.py
> a good first step as I mentioned earlier?

??
I'll start on that next.

>=20
>> e) The rust README starts "This OpenEmbedded layer provides" and has a=20
>> few other
>> =C2=A0=C2=A0=C2=A0 issues.
>=20
> Fixed.
>=20
>=20
>=20
> To Do List
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> 1) cargo-bitbake - the README suggest adding this using desktop
>  =C2=A0=C2=A0 cargo but once we get the SDK merged, it should be added th=
ere.
>  =C2=A0=C2=A0 Someone suggested using devtool for this rather than cargo-=
bitbake.
>=20
> 2) Fix the SDK libcrypto, libstdc++ glibc-2.33 problem. I'm running a
> git bisect using poky, meta-oe/master, meta-rust+SDK patches.

Coming along.

>=20
> N) Remaining bugs in:

   *Some* of the remaining bugs in:
       https://github.com/meta-rust/meta-rust/issues
>=20
> ---
>=20
>=20
>=20
> Would it be worth adding this to master-next in the next few days
> to confirm that rust-hello-world builds for all the supported machines?
> I suspect that will work but I've mostly used Ubuntu so it'd be good
> to get some coverage testing.
>=20
>=20

Updated commit history:

86109491bc maintainers: Add myself as maintainer for rust pkgs
791684e0c1 cargo/rust/rustfmt: exclude from world
b411e322b3 rust: remove container build scripts used by meta-rust
c646d47ebc rust: update the README to conform to being in oe-core
e19d823567 meta-rust: merge commits
...

This last commit also squashes a new commit from meta-rust:
    f8b9103 Remove checks for Rust versions we don't build anymore.

I'll test it and if you have capacity on the AB tonight,
I can send you a v2 in an hour or so.

--=20
# Randy MacLeod
# Wind River Linux
