Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.61])
 by mx.groups.io with SMTP id smtpd.web10.682.1614821303418399156
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 17:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZYtI7hBj;
 spf=pass (domain: windriver.com, ip: 40.107.236.61, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bemgPRwN3BSQSQ7HGLpyaHlPo//NO7129kVKRh5hmwV46lZDsqwuV4FhH7v8gXuTvwE2DzjcKRDMzPI2PrLabVflsshEbd0xMf0LyH1ThWOVsiGWT5BBsZmaUeRpXA2LuYxhD4hJDQJ1fBvxIx5uQfRW2yZILNksGL9ymI1opOdMUn2MoLTAL+dboZfN0kd5XsRA1/U79vZLfn3huoxFt5ePrtuVWO82zy/zptyE028lGfSmUgh5M0Rs9OvXIODB665T7/7Nuab2gWhwNPTDPRWnn79nH87BbVA4tQgHj05BF6mRHYsiAu0HEZuNjeRY6o15QSUTsIAjsqrmTSXAPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwFPAgbgp3Jypn+VctLT+4mm9Ry9L3WaJH0j7TkTaTM=;
 b=UuYklZ1we2fYV0FWO4JTsX/b9KcDgTq4Z522MU25aXiMnlmXvbQ3vY8Q9mnqYPtaUk4fse0PnnQqI9Mfzev+snS29//ENLVGx8EU4k/bgx1XNPzmNZt2ux52Y5Q6OqdYtfA52WWrqAokl1O4uKMfBal8Jh+IUpv2qCtLRNcDWqBwz7UHTPrW0+kCouygVKvnj6/piIVwttfppzN6afTjIt2CxyugngDFyRyxGMIFNAV+SVBhcBaMA87HgjB4ezZt4W/3LXfptPcRQ/ZmiN8yydppj81kNLG8i4C0Ngq53nOAyvrAvirZnMEqJzvcTqcie3g/eTKzF4BhBfi/YWBW5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwFPAgbgp3Jypn+VctLT+4mm9Ry9L3WaJH0j7TkTaTM=;
 b=ZYtI7hBj62my/TfKnm01ILrDK9iPFbqCxQx84nNbvs4EHTT8nGJTzFwxQNvd8/sCbU3MbQ9l07YscEKwlMz7mFQke/J/1Iu0MUq2lu8CF1+xKjZJaz1+0wXmY7zqYIppEvkN+6NHwk77RO1KlcVlvAsf7hqy2x1szFpF5uXJN6U=
Authentication-Results: lexmark.com; dkim=none (message not signed)
 header.d=none;lexmark.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB2603.namprd11.prod.outlook.com (2603:10b6:5:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 4 Mar
 2021 01:28:18 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3890.031; Thu, 4 Mar 2021
 01:28:18 +0000
Subject: Re: [OE-core] [v2] Merge meta-rust to oe-core
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
CC: steven@stevenwalter.org, johan.anderholm@gmail.com, derek@asterius.io,
 Paul Barker <pbarker@konsulko.com>, cardoe@cardoe.com, dev@codyps.com,
 tylerwhall@gmail.com
References: <16668FEB024AAA5B.31532@lists.openembedded.org>
 <20210225014823.397741-1-Randy.MacLeod@windriver.com>
 <ad16b82158c2fa88c01b8b0962cc0455595b5b64.camel@linuxfoundation.org>
 <20210225173758.ao34u4demrbahfz2@jama>
 <9267b04d-4f3a-9efc-d2cb-41206bd9b762@windriver.com>
Message-ID: <b5603901-60c8-4919-de92-25dbb71a522d@windriver.com>
Date: Wed, 3 Mar 2021 20:28:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <9267b04d-4f3a-9efc-d2cb-41206bd9b762@windriver.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SN7PR04CA0242.namprd04.prod.outlook.com
 (2603:10b6:806:f3::7) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SN7PR04CA0242.namprd04.prod.outlook.com (2603:10b6:806:f3::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 01:28:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b629c56-7dc4-429f-f99f-08d8deacca6b
X-MS-TrafficTypeDiagnostic: DM6PR11MB2603:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2603BFBEB8429A5CDE6BE520F8979@DM6PR11MB2603.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HAP7XP36OGUJzTU8Q5KG6Zywje9eCRvkZyDTmdYtJd+P6cJ2aH++0vGUb0LACRJozq0RFypx4VtQR/bAZfQDErQB9wOos+eyV989+OO9wyYGCK5Iv/+M7GwKQqstfHdCknsMBM7vxS2CuESYy63Vpqe8vJElDrijIYz2mMH1lWfVCJocn80yDizLrCFeDl8+qQz1mtkaVr3SCm7VDwUbRaSYhZybrMWCcTBuJbBZms5idoWECCWxVCTBtWiSEvOSdqbSOahHmmvLx9xbGYroLVUop4nUQJca8R5yu/uhfu5g4/FWDJEbyc0hTxyEoBRT0Med0DsJgiLUuCnF51QdTYfLWDI9RL+hWIRhiZNxPQzYM3WBI5jzAETRDaxMzbsCoHUAWTxjwGamz/i+Vd0urs1Sm5uQECTLLIvfGvEk1jxpnX97JBPR+cFZOQ9X7fDFMolQjsavaLuNpYnFp9pRKk2p2NSPQ70dLrZhuE20VzavCe1DTtaOUPh0Z+mBPUUC7dpq4fuO3X6McEd5XEuREOIVp1KYcfAxpKD9dImBwPtomnZDGJLTrY1wuzjLz/9Km1Cb20NnqeVL1TsfKiDR1AJRcwNl6a0s7KP7O82lwishn3YAAuiwATGc9oDuroTytDGGmmFLxGAo8nmQF13ecBdN6xtLkJxlM0+aVxPYNZco+4mBGk/ozqYaVE/ZpHLr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(39850400004)(396003)(376002)(5660300002)(36756003)(7416002)(4326008)(16526019)(86362001)(26005)(2616005)(66556008)(66946007)(8936002)(186003)(52116002)(83380400001)(956004)(316002)(31696002)(966005)(31686004)(53546011)(2906002)(6666004)(16576012)(8676002)(478600001)(6486002)(110136005)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Cgc4ig4qkp2Q8/5/L/nqJoW4T1qU2txrW36mAJtKN5xNMQkUUng+bXVTOupR?=
 =?us-ascii?Q?7wwfeHXKCJFNgNTm4JgIEmnSmdG/Nratk6jjeHDN32OjO8WxcqNZLnnF+0e3?=
 =?us-ascii?Q?wvEn8Hp2Gpqxuud/4lB9jhEgvBC41TpQzvNTffDOp34AXKFtfreDqD6GsybG?=
 =?us-ascii?Q?0NujNKspm+VvDWL9OikMWBcnBX5tq65vA9TQhWVjMb0+IitwTgJsdTTmhalD?=
 =?us-ascii?Q?GJj1fVN1wLboBBUgwbeoFtcYKBhT9FbFahObQ3N7hW1DIjoJd1P+VzhdHTby?=
 =?us-ascii?Q?cj44xd/uBolSTu2K5c9ilIsTOHRlT6jH+CgLERkofnovDMwXIFri0bh2X++C?=
 =?us-ascii?Q?0D80fgZbO+FdHTRxDk6LZmNiGOYDif6/yXH8M5x38Oujs8xtnX7LNLtnIc7Z?=
 =?us-ascii?Q?G7AsZ6SsOc5xApy6hL1awONFOdvybgu6uPsQS0NUL2e/ujJvit/eb2uccAmF?=
 =?us-ascii?Q?15kQ0zBWvT/ZUyyz6qk9j1FScZpnYO/b8AzOOZVuNi0UfHSZUKRaFQtqz8w0?=
 =?us-ascii?Q?ZiixU1ZrPXkTmHEhmOajkd4GCdiZcHkELqkgfnPPAjXzsYpUoaes344g8PnW?=
 =?us-ascii?Q?M3xpqseDrpjE8m4PX5hEsTYbw2cyTHgC5tpT7VDpJ6ADt4uKbPGD6GrvTzFt?=
 =?us-ascii?Q?ngr1t+fXlWo1eKHtjNrmcZTS6HOCoMuhLnFi2TlI6Dmen8H4HPD/3jEwOY+P?=
 =?us-ascii?Q?BtVPht7WpKS6pfTDAInjjml7/pNVq/3rt3g8ornuMLycAXxc+l4FGusoprMc?=
 =?us-ascii?Q?VGE6z32toqhvnhZ2PS1WW3Bswo1TX1g0FFc80e5Xs8D6jWA7k2y8OcHDcr7I?=
 =?us-ascii?Q?0d4WJ/RRW+46JkFD2mpf+am/saBRA9BvlQQ/f78keEwpoldFj8c601j1xTVJ?=
 =?us-ascii?Q?HmGVIW1A+fCN0pcDyMDXNd+pf1iIbKzjQhQF+Q8iTpP9UBBAu7J/H7nDIVJr?=
 =?us-ascii?Q?bWp0NMO90jQcZx5QOTbuXo1pn80LgFoXEfygZCVp8jzC8iW8CeGvcH1gzrc5?=
 =?us-ascii?Q?E7yHWvnLTjBHmoFWBJyUEdcg/7H4pbq9QsopscjOBteKKCAi++mTxme+pRRZ?=
 =?us-ascii?Q?b04txuS3EWFCdq+wlmskLBENMwCTv9/+Xl6who2ya34y3iUTfMdKOhbsbL9F?=
 =?us-ascii?Q?pdqZa887Ejgblz8KHZ77ecj8Bo5a654dWKUAphygElqjoNEd5MlM+qFYRjBo?=
 =?us-ascii?Q?7ndJipRLxskfMfQf3vSqDPYQ2dRuiEYrf7p2CqnN5ZpYg7DWS6h1ob7yRD/5?=
 =?us-ascii?Q?7My2Ej06w7xOnrGHdCzG1pZb/4L4IaGOl5x7lIgEz5X49dctacbosWzTePcF?=
 =?us-ascii?Q?p0zR/CrK19gYCGN9Ffgvdm9x?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b629c56-7dc4-429f-f99f-08d8deacca6b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 01:28:18.6119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jX95HOVOWdLpNExpJB9/yatMpiul+URpcIBllhB5j4iR1xYGkIQw9sh4wQg5h9JAzgIDWIeiXda3u2z+H1VbALgcb0/ZJh0Q9WvA+x846ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2603
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2021-02-25 4:40 p.m., Randy MacLeod wrote:
> Richard,
> I won't have a v3 today.
>=20
> I'm adding some of the people have worked on meta-rust as an FYI.
> Sorry that I haven't been CCing y'all earlier.
>=20
> If you'd like to be dropped from the thread say so on list or to me=20
> privately.
>=20
> One brief comment below but I haven't had much time
> to work on this today yet.


FYI, the Rust merge to oe-core was discussed at yesterday's monthly
Yocto technical call and there was unanimous agreement that
we would NOT merge Rust in 3.3 but rather wait until the next release.

We're waiting because there are still a few bugs to be resolved
and so far only librsvg is blocked on the lack of Rust. When we
uprev python-cryptography, that will also need Rust so we really
need to get the known problems fixed in the coming weeks so
that we can be ready to merge early in 3.4. That will leave us
plenty of time discover any new issues and then have a well-tested
release including Rust in the autumn of 2021.

I'll continue merging patches from meta-rust and publishing updates
in my poky-contrib branches every week or so until 3.4 opens up.


Thanks everyone,
../Randy


>=20
> On 2021-02-25 12:37 p.m., Martin Jansa wrote:
>> On Thu, Feb 25, 2021 at 04:55:43PM +0000, Richard Purdie wrote:
>>> On Wed, 2021-02-24 at 20:48 -0500, Randy MacLeod wrote:
>>>> Added or updated these commits:
>>>>
>>>> =A0=A0=A0=A086109491bc maintainers: Add myself as maintainer for rust=
 pkgs
>>>> =A0=A0=A0=A0...
>>>> =A0=A0=A0=A0b411e322b3 rust: remove container build scripts used by m=
eta-rust
>>>> =A0=A0=A0=A0c646d47ebc rust: update the README to conform to being in=
 oe-core
>>>> =A0=A0=A0=A0e19d823567 meta-rust: merge commits
>>>>
>>>> The last commit update was just squashing a new commit from meta-rust=
:
>>>> =A0=A0=A0=A0f8b9103 Remove checks for Rust versions we don't build an=
ymore.
>>>>
>>>>
>>>> To Do List
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>
>>>> 1) cargo-bitbake - the README suggest adding this using desktop
>>>> =A0=A0=A0=A0cargo but once we get the SDK merged, it should be added =
there.
>>>> =A0=A0=A0=A0Someone suggested using devtool for this rather than carg=
o-bitbake.
>>>>
>>>> 2) Fix the SDK libcrypto, libstdc++ glibc-2.33 problem. I'm running a
>>>> git bisect using poky, meta-oe/master, meta-rust+SDK patches.
>>>>
>>>> 3) Add a test case to either:
>>>> =A0=A0=A0=A0- just build rust-hello-world or
>>>> =A0=A0=A0=A0- run it in qemu
>>>>
>>>> N) Fix *some* of the remaining bugs in:
>>>> =A0=A0=A0=A0=A0=A0=A0https://github.com/meta-rust/meta-rust/issues
>>> I put this into master-next to see how it looked. The build hasn't=20
>>> completed
>>> yet but so far:
>>>
>>> rust-native doesn't build on debian8:
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/40/=
steps/13/logs/stdio=20
>>>
>>>
>>> oe-selftest:
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1855=
/steps/14/logs/stdio=20
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1887
>>> (others will likely show the same issues)
>>>
>>> which is basically three tests failing:
>>>
>>> oe-selftest -r sstatetests.SStateTests.test_sstate_noop_samesigs
>>> oe-selftest -r sstatetests.SStateTests.test_sstate_sametune_samesigs
>> Not sure how to read these, but it might be fixed in upstream by:
>> https://github.com/meta-rust/meta-rust/commit/920328c8d8dd553e69309733d=
874229af4fa159f=20
>>
>> the sstate-diff-machines.sh doesn't show with an issue for rust-native=
=20
>> with this one applied.
>>
>> And it did show an error without it:
>> =A0 =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata=
=
=20
>> between qemux86 and qemuarm =3D=3D=3D
>> ERROR: rust-native different signature for task=20
>> do_populate_sysroot.sigdata between qemux86 and qemuarm
>> NOTE: Starting bitbake server...
>> NOTE: Started PRServer with DBfile: OE/cache/prserv.sqlite3, IP:=20
>> 127.0.0.1, PORT: 46469, PID: 57036
>> Hash for dependent task rust/rust_1.49.0.bb:do_install:virtual:native=
=20
>> changed from=20
>> 7334d76a4757c1b893a8c2b8c85ada005788b3adeff5a33fe509c43f994d91c1 to=20
>> 162ccf6462851630b0816fdb5fbe68f6b158b81f4ce3ed45ec4c1f258f93212c
>> Unable to find matching sigdata for=20
>> virtual:native:OE/meta-rust/recipes-devtools/rust/rust_1.49.0.bb:do_ins=
tall=20
>> with hashes=20
>> 7334d76a4757c1b893a8c2b8c85ada005788b3adeff5a33fe509c43f994d91c1 or=20
>> 162ccf6462851630b0816fdb5fbe68f6b158b81f4ce3ed45ec4c1f258f93212c
>>
>> ERROR: 1 errors found in=20
>> BUILD/sstate-diff/1614274412/signatures.qemuarm.do_populate_sysroot.sig=
data.log=20
>>
>=20
> I have that in my patchset locally:
>=20
> commit e19d82356755a42a46221cb1a0fbacf6339560a1
> Author: Randy MacLeod <Randy.MacLeod@windriver.com>
> Date:=A0=A0 Tue Feb 23 21:26:23 2021
>=20
>  =A0=A0=A0 meta-rust: merge commits
>=20
>  =A0=A0=A0 Merge most of:
>  =A0=A0=A0=A0=A0 git log --oneline --no-merges 5cda04c..029f1ea
>  =A0=A0=A0 with two layer.conf exceptions explained below.
>=20
>  =A0=A0=A0 f8b9103 Remove checks for Rust versions we don't build anymor=
e.
>  =A0=A0=A0 920328c rust-native shouldn't depend on TARGET variables
>=20
> and I confirmed that it's in master-next.
>=20
>=20
> ../Randy
>=20
>>
>>> oe-selftest -r distrodata.Distrodata.test_maintainers
>>>
>>> so the maintainers entries aren't quite right which is easy to fix and
>>> the sstate signatures aren't behaving correctly which may be more fun,
>>> depends what is wrong. Those tests explain they're broken (which is wh=
at
>>> we have the tests for) but more investigation would be needed to
>>> understand how/why.
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>>
>>>
>>>
>>>=20
>>>
>=20


--=20
# Randy MacLeod
# Wind River Linux
