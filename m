Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.web12.2260.1602107598251369382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 14:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=ml5KbV6J;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: kamensky@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=5053; q=dns/txt; s=iport;
  t=1602107598; x=1603317198;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hx0bXHNdi4S9/gv4Y88N4uf/tjwtR2EGPwlFoZsItW0=;
  b=ml5KbV6JfUtDzf1/KTbjsO7vpSBpv4pvTO3l1ynJCHxJth93PWJ71AAd
   /VqkLc++DxcCmcTl8ebF6kfcpDGQXRrd7kCOpuR/6kq599svA9DVGk6Lk
   20IbM/hPZMbWmAxIUhL6XMK3FWpELH3f6YZc/oPtwBJG/4t323nNPnS8Y
   I=;
IronPort-PHdr: =?us-ascii?q?9a23=3A2eGloxaRcX/x2TocWCkKmiD/LSx94ef9IxIV55?=
 =?us-ascii?q?w7irlHbqWk+dH4MVfC4el21QWRD4bc7elZj+nR9avnXD9I7ZWAtSUEd5pBH1?=
 =?us-ascii?q?8AhN4NlgMtSMiCFQXgLfHsYiB7eaYKVFJs83yhd0QAHsH4ag7RpXup8DoRHV?=
 =?us-ascii?q?P0Mg8mbujwE5TZ2sKw0e368pbPYgJO0Ty6Z746LBi/oQjL8McMho43IacqwR?=
 =?us-ascii?q?yPqXxNKOk=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CiCQB+OH5f/4kNJK1ggQmDISkoB3B?=
 =?us-ascii?q?ZLyyIAwONdoECl3mBQoERA1ULAQEBDQEBGAsKAgQBAYRKAoIHAiU4EwIDAQE?=
 =?us-ascii?q?LAQEFAQEBAgEGBG2FLwUoDIVyAQEBAQMBES4BASoNAQ8CAQgOAwQBAQEuKAo?=
 =?us-ascii?q?dCAIEDgUIGoMFgksDLgEOniACgTmIYXSBNIMBAQEFhSsYghAJgTiCcopBG4I?=
 =?us-ascii?q?AgRFDghg1PoJcBAEWgREBCwcBIQKDSIItkwaHZwGBGJtWCoJoiQCLDoZ7gxO?=
 =?us-ascii?q?BKYhblBaVFIh2lSsCBAIEBQIOAQEFgWsjZ3BwFYMkCUcXAg2IFIYXF4ECAQy?=
 =?us-ascii?q?CP4UUhUJ0AjUCBgoBAQMJfIsGgkYBAQ?=
X-IronPort-AV: E=Sophos;i="5.77,348,1596499200"; 
   d="scan'208";a="563105590"
Received: from alln-core-4.cisco.com ([173.36.13.137])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 07 Oct 2020 21:53:02 +0000
Received: from XCH-RCD-001.cisco.com (xch-rcd-001.cisco.com [173.37.102.11])
	by alln-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 097Lr1dr007817
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 7 Oct 2020 21:53:01 GMT
Received: from xhs-aln-002.cisco.com (173.37.135.119) by XCH-RCD-001.cisco.com
 (173.37.102.11) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Oct
 2020 16:53:01 -0500
Received: from xhs-aln-003.cisco.com (173.37.135.120) by xhs-aln-002.cisco.com
 (173.37.135.119) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Oct
 2020 16:53:00 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (173.37.151.57)
 by xhs-aln-003.cisco.com (173.37.135.120) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Wed, 7 Oct 2020 16:53:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hriwoBLlztoqa1z0KMRGvisWfbdTiBeFYLH344vc+z9Ci48zya2aZW1E3BP2QbxkGl/8aUHuJX/Dn52qIisStEI1maNvHgNbXLfv9wIIFGC62MBaG7QctVMiAdKq+dVpF3FpYBHlb0PERVY/bvJMW189KNJ1AT0R0TeXCxEdYukeYRovP7KYfYF0Outcr+XVGQAqv07DNQHggGYXcEnJgHIrrzclHzSqQsfihWsxMDt3Q7mzdTx1GKnVS7LGqa+BEMrdlFwIAQM4MSWaH4tjD37H0W3gERIkK1r8RgB9Fo3jSsGP+DwacBz98yrS1V2umoFZPY+4gBTF0ghAEcj7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXYTxZ++ADQ8UWoMM/CNMsedhzmXFyL8zphmYixAWl0=;
 b=DQHsU88bFgnIzdydSHxyl4T1k2XzbqOO7IOmQXQYHkXg2E/U+EOMfJ7OBXRawv1x4zvXDtI/qwk2XCAcg1ylKIpxKidl6w9N5Ysr9Ab5fegapSz/LYeCquEBbDZpoATV3dpoFpXTOImGZFWavMhf08s/+ZT69ZA6fKcV+ad18F5DZG8EgdmGQyjjQUfzyIc+/0f4xF4P0aMXKP9ZDYZBtKPkgSVXlN+RIj6tEAhFWAMlAWYume3d2aSg2dyjEd7N9pskn0bvHhPQ0JdzQlh9d6G8elRAtmMNKNine6x3EWzZYfWjoDTO/yUrHTPTGK2TpLZE5Jxo/LnNfhG6YqyV+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXYTxZ++ADQ8UWoMM/CNMsedhzmXFyL8zphmYixAWl0=;
 b=McwcH1wG6wiktWEj53mj7I/xvcwG68/nUFqtguzADC8GZug/svNgnscRxRr+64PL1rsgRHdFadMbE65kYJpLucIHiWZODnLZuUAiZK/ee6yFuOL5FypMCcg6V7ikahvfXM8J3svLTj9XEJGyVVzFkwGrHFbFrQaJ0YGDIj8YIl4=
Received: from BYAPR11MB3047.namprd11.prod.outlook.com (2603:10b6:a03:8b::32)
 by BYAPR11MB3496.namprd11.prod.outlook.com (2603:10b6:a03:8b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.42; Wed, 7 Oct
 2020 21:52:59 +0000
Received: from BYAPR11MB3047.namprd11.prod.outlook.com
 ([fe80::dd53:b1a0:340f:ede5]) by BYAPR11MB3047.namprd11.prod.outlook.com
 ([fe80::dd53:b1a0:340f:ede5%4]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 21:52:59 +0000
From: "Victor Kamensky" <kamensky@cisco.com>
To: Paul Barker <pbarker@konsulko.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>,
        "Richard
 Purdie" <richard.purdie@linuxfoundation.org>,
        Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] qemu: add 34Kf-64tlb fictitious cpu type
Thread-Topic: [OE-core] [PATCH 1/2] qemu: add 34Kf-64tlb fictitious cpu type
Thread-Index: AQHWnOrpwcqny1rVNUyUZnq6UY2RDKmMpRj+
Date: Wed, 7 Oct 2020 21:52:58 +0000
Message-ID: <BYAPR11MB3047DE4238846255A324C998CD0A0@BYAPR11MB3047.namprd11.prod.outlook.com>
References: <20201007203838.19096-1-kamensky@cisco.com>
 <20201007203838.19096-2-kamensky@cisco.com>,<CAM9ZRVst-JLA3aOa+U2Sd1Cqj8ARsAyVhCu0Yhhk5we+FKsmdQ@mail.gmail.com>
In-Reply-To: <CAM9ZRVst-JLA3aOa+U2Sd1Cqj8ARsAyVhCu0Yhhk5we+FKsmdQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: konsulko.com; dkim=none (message not signed)
 header.d=none;konsulko.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c8:1003::8c4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d265b63-8204-4ad8-71ed-08d86b0b5b4c
x-ms-traffictypediagnostic: BYAPR11MB3496:
x-microsoft-antispam-prvs: <BYAPR11MB3496B56F0E79D0F3414FCA3BCD0A0@BYAPR11MB3496.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: frBCVe8yhlArIP65iAePJBSH+Agv50tXYxIKJl1GVRQrESmx+LkvSTxmMyuMDN7r4VLXKXNcLwQpssa8YL6M0KuPbEDvXq7iKxhn3quBjfEe/rBf9336a/7HEDBTkkFGtbfuWKvwVZ/7NJVKR18rPZFcXBJv2Twj0koJpikpuw/gw5+7NPkFKSCQvEhGYzuCYm2a1duizLJLthaOGZh0ozXRXdiEnMGZf92rxjY/6Zik6t102p3WP6gZbPp0v8aAg4Sp2Ox/+bheR47za/6ua7RTigLUiFuuGLE6W0Fi1TSFVcxD9n2kn/OJwmD4Xb2RpbwIguP4nzIorp/lJqL1UHM/iQxBxYH6Su5639V+XhYxT+7pLUUCaLRyx8Mt+s3Cb7VHTlTGyJTGs5Sf35OnQg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3047.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(346002)(136003)(366004)(39860400002)(966005)(2906002)(7696005)(33656002)(6916009)(86362001)(5660300002)(54906003)(8676002)(6506007)(53546011)(71200400001)(83380400001)(478600001)(83080400001)(8936002)(64756008)(66946007)(66556008)(66446008)(66476007)(76116006)(52536014)(55016002)(9686003)(186003)(4326008)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: HbVaBDJn6L7PH3M1kd8rnkCaTEw6dxAfozYO8hwaXl9gTFDmRidv13Hm49xIPu4Wt6KnmRvXGozaZ5twhZJ9sgzs0VNa0NPLHlHHwFpuOPuWCKs8XNkpg/yphQG8RvuDEVQC9sTnwa7KQyKBm+UGTrQQZFWFMgcWSW8mM3xDaeE5yQMfReC117HkFEsJIayZjw2cGrYJVKao9cFmQGrlGRkHjhcZQ60fOxpvVWdcdK2J+ORlJeWAObg7bnD+fd5cvy3xAgMgnU00SeRfhRsJqoZ8d1AMux95vleThaAMXYs9S6tNt6XHyc4uZUxRCrpPlN6ElcuDJmaJh126jGdBeNimMuZzVke0IB+hIBH2JlbEYu4FYUspxZuriseLYHHtzHZk93Ku61fuUbBp5Do03iTdwsnNl1yXN5ftG8ayO1TtavReO0pk8NENZ8KY2jl7fg2CcGUU84PWdkAm5DbpJN8XYCaA/aFyM6USxdj9VzledsIQcPN9LUiyHtukRrEafYEcsppjyLIUCmoJTPJfI0cYsEu2skhDEzkXwZypTnq3iVbY3Xv3ODIURA8Jzv4fWKdKmEDXs8rlF58vOoWpkOFHnWqoNM+1vvltdbnDqE+PJnCoqGNmz9pF6nlUJXpvHN3uWXaJdHH7sL3fq/6GPCDEDKLwS6sq/d7VE8UWnr0=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3047.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d265b63-8204-4ad8-71ed-08d86b0b5b4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 21:52:58.7400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zyWHLJYsZDtG8z34snJgwrIHf+93NBDLTVeqv/Qs0YVkw6Ptu47dIh4sPhjDupErh3TsM8Q+Gg5WhtTT4BpX+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3496
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.11, xch-rcd-001.cisco.com
X-Outbound-Node: alln-core-4.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Paul,=0A=
=0A=
Please forgive my horrible email agent that I have at work.=0A=
Please look for 'kamensky>' for responses inline.=0A=
=0A=
________________________________________=0A=
From: Paul Barker <pbarker@konsulko.com>=0A=
Sent: Wednesday, October 7, 2020 1:46 PM=0A=
To: Victor Kamensky (kamensky)=0A=
Cc: openembedded-core; Richard Purdie; Khem Raj=0A=
Subject: Re: [OE-core] [PATCH 1/2] qemu: add 34Kf-64tlb fictitious cpu type=
=0A=
=0A=
On Wed, 7 Oct 2020 at 21:39, Victor Kamensky via=0A=
lists.openembedded.org <kamensky=3Dcisco.com@lists.openembedded.org>=0A=
wrote:=0A=
>=0A=
> In Yocto Project PR 13992 it was reported that qemumips=0A=
> in autobuilder runs almost twice slower then qemumips64 and=0A=
> some times hit time out.=0A=
>=0A=
> Upon investigations of qemu-system with perf, gdb, and=0A=
> SystemTap and comparing qemumips and qemumips64 machines=0A=
> behavior it was noticed that qemu soft mmu code behaves=0A=
> quite different and in case if qemumips tlbwr instruction=0A=
> called 16 times more oftern. It happens that in qemumips64=0A=
> case qemu runs with cpu type that contains 64 TLB, but in case=0A=
> of qemumips qemu runs with cpu type that contains only=0A=
> 16 TLBs.=0A=
>=0A=
> The idea of proposed qemu patch is to introduce fictitious=0A=
> 34Kf-64tlb cpu type that defined exactly as 34Kf but has=0A=
> 64 TLBs, instead of original 16 TLBs.=0A=
>=0A=
> Testing of core-image-full-cmdline:do_testimage with=0A=
> 34Kf-64tlb shows 40% or so test execution real time=0A=
> improvement.=0A=
>=0A=
> Note for future porters of the patch: easiest way to update=0A=
> the patch and be in sync with 34Kf definition is to copy=0A=
> 34Kf machine definition and apply the following changes to=0A=
> it (just change 15 to 63 of CP0C1_MMU bits value)=0A=
>=0A=
> [kamensky@coreos-lnx2 qemu]$ diff ~/34Kf.c ~/34Kf-64tlb.c=0A=
> 2c2=0A=
> <         .name =3D "34Kf",=0A=
> >         .name =3D "34Kf-64tlb",=0A=
> 6c6=0A=
> <         .CP0_Config1 =3D MIPS_CONFIG1 | (1 << CP0C1_FP) | (15 << CP0C1_=
MMU) |=0A=
> >         .CP0_Config1 =3D MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0C1_=
MMU) |=0A=
>=0A=
> Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13992=0A=
=0A=
Forgive my ignorance as to the range of MIPS processors available but=0A=
does any real MIPS CPU have 64 TLBs?=0A=
=0A=
kamensky> I am not up to date wrt 32 bit only MIPS CPUs out there.=0A=
kamensky> I've experience with MIPS64 real CPUs that could=0A=
kamensky> operate both in 64 bit and 32 bit mode. In fact in our=0A=
kamensky> case even in time when we used 32bit user-land kernel=0A=
kamensky> itself was running 64 bit kernel (as OE MIPS multi-lib test=0A=
kamensky> case). In 32bit case h/w memory map quite unfriendly=0A=
kamensky> to linux kernel, kernel can see directly only 512Mb of=0A=
kamensky> unmapped phy memory KSEG0/KSEG1, and bigger amount would=0A=
kamensky> require CONFIG_HIGHMEM that drag additional mappings=0A=
kamensky> for kernel access of the memory.=0A=
=0A=
kamensky> MIPS32 spec itself does allow 64 TLBs, for sure. =0A=
=0A=
If such a CPU model exists=0A=
shouldn't we be using this instead of inventing a new model?=0A=
=0A=
kamensky> Note about other available MIPS 32bit existing CPU=0A=
kamensky> model with bigger number of TLBs below.=0A=
=0A=
I'm a bit worried that targeting a unique, fictitious CPU model will=0A=
lead to us wasting time debugging obscure failures that other projects=0A=
have never seen and that would never occur on real hardware.=0A=
=0A=
kamensky> I do share your concern up to some extent. But I think=0A=
kamensky> the risk is minimal.=0A=
=0A=
kamensky> Please note in qemumips64 machine case we already=0A=
kamensky> use fictitious CPU type as "MIPS64R2-generic". AFAIK=0A=
kamensky> there is no such real CPU out there, it is generic thing=0A=
kamensky> inside of qemu. For sure, there is=0A=
kamensky> no such real combination as "MIPS64R2-generic" cpu type=0A=
kamensky> and machine "malta". So up to some extent a lot things=0A=
kamensky> under qemu are fictitious. =0A=
=0A=
kamensky> I've looked at other MIPS only CPUs that qemu supports.=0A=
kamensky> There is definition of "mips32r6-generic". Another fictitious=0A=
kamensky> CPU type but defined in qemu already. That one configured=0A=
kamensky> with 32 TLBs, but when I've tried it with qemumips it flat out=0A=
kamensky> did not boot. Which brings us to other practical issue: proper=0A=
kamensky> match between qemu cpu type and our qemumips kernel=0A=
kamensky> configuration, question about qemu CPU emulation correctness=0A=
kamensky> and whether it is bug free, etc, etc ..=0A=
=0A=
kamensky> By modifying 34Kf cpu type that worked for us before, and doing=
=0A=
kamensky> minimal low risk changes in one limited small aspect of the=0A=
kamensky> system, that brings us performance gains, IMO is worth doing.=0A=
=0A=
Thanks,=0A=
Victor=0A=
=0A=
--=0A=
Paul Barker=0A=
Konsulko Group=0A=
