Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.47])
 by mx.groups.io with SMTP id smtpd.web11.856.1614191040636917148
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 10:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kS2yBmmg;
 spf=pass (domain: windriver.com, ip: 40.107.94.47, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOcJmq1WLCIBysz8MM60G7DMDJBB74NtqUni+n59VXpE54JDMXPP/NNY1nIkX3J34hU8QDSDxN1tU3216z9Gi64lYyd+Wrvh0t+/DCYjjgC3Ip+EH9CAbY/i6apbPA77EKGElEm7JGypdE7ZggGuxlJscsWmapBjj8E9BidijasNWokVKDhtqelFIxt66h471PtFtbZBA1r067R0Ih8fEFX+5DH/ln/wKLlSGNs8q3FtU3GOsBQKJjnrTEBbl0qxU/iyDNjC4PQ5aY6hCYj7NnMBww1/A6j1+sMOfRTLwuntQl5hsuUgGg0uYaRoCkJsUkGr3EyGkY2Pfax2CSS07w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXNOfP+2mQVZUMN1XJ7B0ptjJT/vF4HL8b1kQ/FnZcQ=;
 b=ZwiKzJi1sWad/9csb9y6Y+I9m/m5x/J01SMI7ur7Px6j3nYqqPtBRPaV5oTqoaQt8PFMYu3ACMb38YsiP/cenOiWyMII4g7bCSPOlsre5fx+cWtz7JXcoQujBHKbr0qJ5ccVdVsE9unJR/JQGXcwrpyBwmFppC1o2kOiLSWvzOmMx/rcvTsQoz4d9tHGjW5HpH9+C0V6XRAngIyD7PEWL84BtbA1Uz6k4EO5c8mGwiyk0Df580HI2OTFgIUScld1B89u9bVUYqvvXtkontbqMUX5culh6F8Nj1mTt6JN1eS0zfGCGJC9mIdk7oaxgjuUaCHfCYcSHhScNk6ccO/cBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXNOfP+2mQVZUMN1XJ7B0ptjJT/vF4HL8b1kQ/FnZcQ=;
 b=kS2yBmmg0/GXv4WpQJ8uhADPf2PJtiGeNd7ZoGRxVvaAvTf7Xn5QfIk5H4FBLa32h3RAg6nh+N16njDe62fHAnNilK8vfh/oDuURVZ0NuusDqVFfFXvRc79HDsJmi1PfF1+2XDieJPKd8Lr83linX8mgcr0BUfwm2iVu5prkmc8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30; Wed, 24 Feb
 2021 18:23:58 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e%7]) with mapi id 15.20.3868.034; Wed, 24 Feb 2021
 18:23:58 +0000
Subject: Re: [OE-core] Merge meta-rust to oe-core
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210224030201.349588-1-Randy.MacLeod@windriver.com>
 <a373f6be54f63987eb9cb0ce994b807fcca01062.camel@linuxfoundation.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <89c6f05d-5add-8906-c76a-bbaca574497b@windriver.com>
Date: Wed, 24 Feb 2021 13:23:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <a373f6be54f63987eb9cb0ce994b807fcca01062.camel@linuxfoundation.org>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SN4PR0201CA0048.namprd02.prod.outlook.com
 (2603:10b6:803:2e::34) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SN4PR0201CA0048.namprd02.prod.outlook.com (2603:10b6:803:2e::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 18:23:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6b44684-787a-4e9b-3d44-08d8d8f15a3b
X-MS-TrafficTypeDiagnostic: DM6PR11MB4692:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB46927CF2B7795A61793BD033F89F9@DM6PR11MB4692.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CXn0FGK14aJ6T4ljOrI0AM1bUZ4wWWwFaua0T/D+1i5mYW0NtL5nCKbbPUEIYiAJqYXHMyfPE0kkmXR98o5NXo9h1I+lxbeUCTCqFUPBLQnjY8FXD18e4XM3HOTDdvXbp527pdC0/bwT0UbUdmbn3AisePEsp+knhmpze8KrvDSS4RgtRsp8u/kbVp+KC6WhAsifwfCklFAtrz6Co9Mhev0RVzNYoIjN5lAxerVzPy3eSVMqZ+bkzaFyw7SSVVOnH6fzWOERXhxqvaa2d/QyTKtvZ2RMZwpb0iNkFI8AKy9tzMDCC2wmwvKaO9b0+EAQscSMZw17XEyQ8KpU/lm8OabfCjLY+2rsDVAhVN40X0gl7qIFv15m9xfrv6Mcf3OKDd7vrjCER9VSwon1vkyaj6MfAJFvEYABNPZh0uxtaEAmPRU9XzQkxhvOTfr48JkcrqDoTn6hhsWmTOrO2qvvscIMo8rNdPVXber5dS4DGfOA3RZFM2xgherUbIRrbdu9cWcdvvO1AeiDDKudx23Os6GZr5poc7zC1ZnLBrxl3c281Us05QXAUXJMMYe9yjKFY/DCt4mXDNRTdweq6QdWWtkrwrYiNpcWxrWW4mTrC18=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39850400004)(186003)(8676002)(26005)(956004)(6666004)(478600001)(36756003)(2616005)(16526019)(66946007)(66556008)(66476007)(316002)(16576012)(86362001)(31686004)(6486002)(31696002)(2906002)(83380400001)(8936002)(5660300002)(53546011)(52116002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?gmJlzHLdKcIEmBWm1b4SxMezUXff71dKlUv09XOWAICJ2ZPMUHsprSv+WDuc?=
 =?us-ascii?Q?ZQV7GilV2ldp4JC95ewEy7WlWM4D14WKoqea7K6JX/wiBnJ4VFzocC2T7oxw?=
 =?us-ascii?Q?ElVSOQVx5NidtVgA/CD4TpQa00SO05+QkLlfhIkD2Ar1ePSiiVYI9r+m5iF1?=
 =?us-ascii?Q?R2O1zwGlrlakMJuoVRFFS2yAN0c9HO1yR7laB1lbqsMKgPoRrF0bOOONtmm0?=
 =?us-ascii?Q?/DiEikqhEuDYpW3+SvOXJNrI0M/ZvdyTOv10hpw/NHrEouxCVI43sGFB2KW7?=
 =?us-ascii?Q?/yD0/IYKzZPbljeQQGS4fUuVj/bfe7EJvpF3/PcW4Ta3/ErpjvU8rrjh0I+l?=
 =?us-ascii?Q?nwv2N0+VO9fg/TzBya+QyJIm+obEvMweMXHv8WBcXBlLbjAHlsXqJzBOZ0Yl?=
 =?us-ascii?Q?Abp39T/VBsPC1zvTKGwPXDLrFP4sGgz0vRYxnT8sCTJTpTXI8y3t8ZqLCkNm?=
 =?us-ascii?Q?kPApzFHx90u28zkzYYnydj0ybWWDQb3ifVdZyljo6qupZRHY4lMtti0qeF+e?=
 =?us-ascii?Q?m3gF0tSIOjo2WlDxTTZJkgjVEZMLk2nbl3ii6GvJA0kG+S7MQHVJTKaMwGyF?=
 =?us-ascii?Q?WtouDocctiDcyLCTnUXEkIvP6NP/OwmuR76z7n2ASYd4YfCOEEX4XnTis+2J?=
 =?us-ascii?Q?PumOx6jlD2YZaq40awYB1cEa2NloxuyXFoxxECbkER8s6d1oNm2XSBPaF5em?=
 =?us-ascii?Q?TMGxiySpSa8A3P0tkGv+t9tbJbGuLbXNXcOMi+lqNhZiIpdEIwQF+Rp7LbnH?=
 =?us-ascii?Q?1FySJ55H4RMujNlRhOSTJ3bz6MLJD8h4mBzoAwMWtt3mOvyzgbZF9HKgXcgr?=
 =?us-ascii?Q?tLCHPatuyWGu99VAMFAK3l/G0m0FGXInPCw+v0NgMY47t2C73mIPBdyTEapu?=
 =?us-ascii?Q?yIun0pYSEH/PdXJXLCnNedsFdxPT9SOFGLRDIDkiTGk0/Eup3mp6jFFjpE06?=
 =?us-ascii?Q?YjEC99Otr7cGk8VpERM1JPgORIJsIlUlDEJQRQ3eDHnij4jdM0BUAVB9WMlq?=
 =?us-ascii?Q?/gGKpcpCWTDWQdYbr4wpcrmWEWuJtZZWEWEUZZcZIo8IwO/ChaJkynjlbkFS?=
 =?us-ascii?Q?9mP+Dz6sEo1lJ6XE8w8x6CqSXRi4fBb5XvZTMuOa1Kex3nCK+y46cWmRZKua?=
 =?us-ascii?Q?D8f6QQ0BzFJiFFVkyzrr/COBYTybcNNqv6A1Xt8NlaXuO86QYz7sz3pN/bbk?=
 =?us-ascii?Q?g1+Dqgzd2WhT3C/QdWA6ug0QSOsqILeaKMduutLlcplILhoPGsdu1kjFeJ8H?=
 =?us-ascii?Q?MdjH7RR26EWHRkpVRnudq3zkVBOF/nwL417kUW+Sd+t0cgeQo0tlQEjuFMB0?=
 =?us-ascii?Q?/rvyAKxlcF4KG84Ob3/O1Ehf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b44684-787a-4e9b-3d44-08d8d8f15a3b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 18:23:58.6724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZuR4bPP3RHAPtrPpfx86aIe6ol9kA+8GfdHz5TfvR33TV29L3CwLO1BZh6Fu2ZC6cgYVll1UaR+OmQYUeXOURpzPJKphBm7+2TabZv0RsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2021-02-24 4:39 a.m., Richard Purdie wrote:
> On Tue, 2021-02-23 at 22:01 -0500, Randy MacLeod wrote:
>> Clean-up the merge of meta-rust to oe-core by squashing most of the
>> meta-rust history so we are left with:
>>
>>  =C2=A0=C2=A035da4b252f rust: add a language demo image to test reproduc=
ibility
>>  =C2=A0=C2=A0088374371b cargo/rust/rustfmt: exclude from world
>>  =C2=A0=C2=A07df10d2a22 meta-rust: merge commits
>>  =C2=A0=C2=A04187796cd6 rust: mv README.md to recipes-devtools/rust/READ=
ME-rust.md
>>  =C2=A0=C2=A003b9c60ef4 meta-rust: move code to oe-core from meta-rust l=
ayer
>>  =C2=A0=C2=A02c62874204 libgit2: pull in updates from meta-oe
>>  =C2=A0=C2=A024cb3db88c libssh2: pull in additional commits from meta-oe
>>  =C2=A0=C2=A0e9a0a3bad2 Add libgit2, libssh2 from meta-oe for rust
>>
>> The full diffstat is below. (1)
>>
>> I didn't really notice the scripts shown below since they are mostly har=
mless.
>> I'll review them and remove them in v2 if they don't make sense for oe-c=
ore.
>=20
> This is better, thanks. My feedback from a quick glance:

Thanks for the comments.

>=20
> a) Need maintainer entries for the new recipes

Fixed by adding myself but making it clear that other maintainers
are welcome. Once libssh/libgit2 are in master, I'll do the same for
them since they are unassigned in master-next.

> b) The scripts in scripts/ look at the very least inappropriately named
>     for OE-Core, I suspect we don't want/need those.

Working on that next (after 2 more meetings...).

> c) Not entirely sure about the languages demo image, its not how we test
>     any other language

Removed.

> d) There aren't any tests in meta/lib/oeqa!

To come. Is:
   meta/lib/oeqa/selftest/cases/gotoolchain.py
a good first step as I mentioned earlier?

> e) The rust README starts "This OpenEmbedded layer provides" and has a fe=
w other
>     issues.

Fixed.



To Do List
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

1) cargo-bitbake - the README suggest adding this using desktop
    cargo but once we get the SDK merged, it should be added there.
    Someone suggested using devtool for this rather than cargo-bitbake.

2) Fix the SDK libcrypto, libstdc++ glibc-2.33 problem. I'm running a
git bisect using poky, meta-oe/master, meta-rust+SDK patches.

N) Remaining bugs in:

---



Would it be worth adding this to master-next in the next few days
to confirm that rust-hello-world builds for all the supported machines?
I suspect that will work but I've mostly used Ubuntu so it'd be good
to get some coverage testing.


--=20
# Randy MacLeod
# Wind River Linux
