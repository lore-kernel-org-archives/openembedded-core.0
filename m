Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.web10.1926.1602175217298294666
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 09:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=aw8ihAxw;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: kamensky@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=11975; q=dns/txt;
  s=iport; t=1602175217; x=1603384817;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=el/mDuMEwgfL9ImhaguYg/Kyhk7aEMnuROjLxDNCU/Y=;
  b=aw8ihAxwQhUUxVKDpz9OaLnchfpEaAScH3m7zkfAJl8eIUpvK67kWIsI
   wqDIqZyI9ndW8wTRz3TvlH4BNkbHjxkoGccGnmTVUvtupq5GxsdknRdEh
   p0scBVrb2SKVvZazwNkeOR1FKE3lVVvcOx+URfCKxtUMDNdlzcusEkkRh
   I=;
IronPort-PHdr: =?us-ascii?q?9a23=3AG5xw2hKRW8RU46kv9NmcpTVXNCE6p7X5OBIU4Z?=
 =?us-ascii?q?M7irVIN76u5InmIFeGvKk/g1rAXIGd4PVB2KLasKHlDGoH55vJ8HUPa4dFWB?=
 =?us-ascii?q?JNj8IK1xchD8iIBQyeTrbqYiU2Ed4EWApj+He2YkdQEcf6IVbVpy764TsbAB?=
 =?us-ascii?q?6qMw1zK6z8EZLTiMLi0ee09tXTbgxEiSD7b6l1KUC9rB7asY8dho4xJw=3D?=
 =?us-ascii?q?=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DsAQDYP39f/4wNJK1WChsBAQEBAQE?=
 =?us-ascii?q?BAQUBAQESAQEBAwMBAQFAgU+BUlEHcFkvLIgDA41SihGOaoJTA1ULAQEBDQE?=
 =?us-ascii?q?BGAsKAgQBAYRKAoIKAiU4EwIDAQELAQEFAQEBAgEGBG2FLwUoDIVyAQEBAQI?=
 =?us-ascii?q?BAREuAQEqDQEECwIBCBEDAQEBAS4hBwodCAIEAQ0FCBqDBYJLAw4gAQ6eOgK?=
 =?us-ascii?q?BOYgTGTV0gTSDAQEBBYUiDQuCEAmBOIJyhjGEEhuCAIFUghg1PoIaQgQBFoE?=
 =?us-ascii?q?ZLQKDSIItkFSKGgGBGJsEUgqCaIkAiw6BToUtgxOBKohclBeTG4F6iHaCa5J?=
 =?us-ascii?q?CAgQCBAUCDgEBBYFrI4FXcBWDJAlHFwINiwKDHQwXg06FFIVCdAI1AgYKAQE?=
 =?us-ascii?q?DCXyNTAEB?=
X-IronPort-AV: E=Sophos;i="5.77,351,1596499200"; 
   d="scan'208";a="835746612"
Received: from alln-core-7.cisco.com ([173.36.13.140])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 08 Oct 2020 16:40:15 +0000
Received: from XCH-RCD-004.cisco.com (xch-rcd-004.cisco.com [173.37.102.14])
	by alln-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 098GeF90030194
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 8 Oct 2020 16:40:15 GMT
Received: from xhs-rcd-003.cisco.com (173.37.227.248) by XCH-RCD-004.cisco.com
 (173.37.102.14) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Oct
 2020 11:39:49 -0500
Received: from xhs-rtp-003.cisco.com (64.101.210.230) by xhs-rcd-003.cisco.com
 (173.37.227.248) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Oct
 2020 11:39:49 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-003.cisco.com (64.101.210.230) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Thu, 8 Oct 2020 12:39:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0xqkT3N3NqUqeefqWZhvYglfqlaDhZBnkHDN6MZsTDiiMIfsiHIC3wJDOrKrXkJPRnbXU8tAgTRujNwC1J8pG0HBIh6ZCxS+z+ID1mfX4x39G2UnSC8wYZxFKYwIfrw5T6GnA+NBBqEEBnKeFSmX3ss00CWFLoa+v2UGiPj9DMzu3IGShHwnjfYNRlAMWUtL/pIPsiTRzYKPFwMBnC7fg56TMZJp2JZOIJecfO6ID+QVS67FN6Cvy0+N/jq9v4R5pcJP9YEUNu4n39rEFqNKuKo2e4VCqfJle5O4w6fVGApRZ14EE+wi0iIFBpKo1yutuFj3gnv8gnStEM5M3njnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFG+gDghBtzbutO8YIIok7yd1HYO9VayPxWmWIScn/s=;
 b=ZrC4XD7MaTrJPDHVf8i7mjkHRJqiUDoHj2vXicU7jzCOvLBzEvWYmI0ci5XIWM2c8tvQVAwVPtsYncuPOePWRcF7+5FE3ZKwoYhpEeDCGuYZRZZ7YuJuaFo6sR6WtPh1XjLD2p5xSCIRXYu7ek+xkx6zboHTZJp3GMjL2L1ik6vllDmwP8aziKTFkvIlr62UzL0RuPPmIGGq+0TVwPyXjM2qv8HJNZRMkgeFqvto93dAERlLCOoT8tK2Non1Nf3+0F1T6/q97QNwjiD6J1a6hCLFYRzrkFn/cO/iu4vr1M8KCM/TZLP8x02oGxUVhVvpvJs6A3nMU26LiP1imBeS0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFG+gDghBtzbutO8YIIok7yd1HYO9VayPxWmWIScn/s=;
 b=H++vroifkTDE70LSdJQ+PTjJduGMwFffMzcfryVbEOwB7Efj6yXuH3dH4fC/U4YVtcTtbL+opvFv4Opg+8XF1y40cKnqyvpdpuSX7/FwUSuBptrAF6Vg2zyjqTfFnKCneu81bF0XVDDPfEKdruJUkPhN88UY+1Q14aoDxsLJ094=
Received: from BYAPR11MB3047.namprd11.prod.outlook.com (2603:10b6:a03:8b::32)
 by BYAPR11MB2663.namprd11.prod.outlook.com (2603:10b6:a02:ca::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Thu, 8 Oct
 2020 16:39:09 +0000
Received: from BYAPR11MB3047.namprd11.prod.outlook.com
 ([fe80::dd53:b1a0:340f:ede5]) by BYAPR11MB3047.namprd11.prod.outlook.com
 ([fe80::dd53:b1a0:340f:ede5%4]) with mapi id 15.20.3433.045; Thu, 8 Oct 2020
 16:39:09 +0000
From: "Victor Kamensky" <kamensky@cisco.com>
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
        Ross Burton
	<ross@burtonini.com>
Subject: Re: [OE-core] [PATCH 1/2] qemu: add 34Kf-64tlb fictitious cpu type
Thread-Topic: [OE-core] [PATCH 1/2] qemu: add 34Kf-64tlb fictitious cpu type
Thread-Index: AQHWnUTSUOwaUzuUI0mSLYhjUPZNHKmNmJuAgABGcoCAAAIyIQ==
Date: Thu, 8 Oct 2020 16:39:08 +0000
Message-ID: <BYAPR11MB30476A66D1C6A0E1B1C3D6D6CD0B0@BYAPR11MB3047.namprd11.prod.outlook.com>
References: <20201007203838.19096-1-kamensky@cisco.com>
 <20201007203838.19096-2-kamensky@cisco.com>
 <CAAnfSTs-Dk42iUJU=akr7wpEYZwc9xxCB-hAJMcZpeV6FuvyuA@mail.gmail.com>
 <CANNYZj9Ggm94_2wOsP3Q=AT2iZVyyiE-Keh3AOHjo5EX1EFEtQ@mail.gmail.com>,<CAMKF1srHSjgB2MGri=HqHfuzTUkzwPRqiLtoq6=-phDmRBH-UA@mail.gmail.com>
In-Reply-To: <CAMKF1srHSjgB2MGri=HqHfuzTUkzwPRqiLtoq6=-phDmRBH-UA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c8:1003::63]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a89072f-2b02-4f16-8403-08d86ba8ae24
x-ms-traffictypediagnostic: BYAPR11MB2663:
x-microsoft-antispam-prvs: <BYAPR11MB26635F1C6F184727DDF452C6CD0B0@BYAPR11MB2663.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NhqzuTQ1IfP9uOqZZj2/AfM0KzH9e87zOgSmQac1VRlkHV+KtvCtInusYXA5TCGpkT11OX321yazZduwL+k9ra6ed3t0DiboHSOr5A0sXBnMI8pnjcT3i+dpQEh3IUfXKqy9tng4U4Dnwl4JB4z+BctxTASeOvHtJsR4tW7NGjcDSUtnBZp4asY+2AGtktM3VQIo4qODSlJ/Ml9ajOGMCocSAtvqPOAtb7AJgFTXz6uOZoQFF0HzGvPW5pRcE7Iy8TUPnaL1MQ39uA6HjG8JGKETikckcE3zLeObwIxYnqXNdP72NAchrg1fe/9C3LLims2wT3gHsK0gNjD/aGqElQZfKEdtfE6t0BNU6cWfsovVh7UGHIEEf9F7KbX4+ySORxCF1vIF1q9f8QNGj8gPpA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3047.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(39860400002)(376002)(396003)(366004)(33656002)(478600001)(76116006)(66556008)(66946007)(64756008)(66446008)(66476007)(55016002)(5660300002)(9686003)(316002)(110136005)(8936002)(54906003)(71200400001)(53546011)(2906002)(6506007)(83380400001)(4326008)(8676002)(83080400001)(86362001)(966005)(52536014)(186003)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Lo/s0p6A0LAnBDJ4ledcGo8wrwZejSIQIETBX1uK3eeJuFQnPF3vkrd+RKqHqU4CA2tQpgFzntt6mzB0t0MYE+Jrw9qd6tTSpV4yYK7E9c0Jq6q2z0rg8vIfmcYvs3dzrEywElrICnVxaxKFExT48jHGx2joo8mnvr1bfnfjOIYUSjp2R4pn/WXYDY4yY6hNlAc4feVlx/YEBzujUzKxa/EwqQwVQxifkt/aA82+9lZcxt/OGsXRVYxruGCsWaFPyCV9/c00kGJHuxcx487ecQmi0ewS3bcRDYz5AnCd9RFhbjopbOzFJE1M+ab9dSkHMtXOXyUMtwKe6KizR+GQl0bk/hlV9NaIXEafDVjb9AoZH6BsD/s5l0kz+CpMkQLRvg0DGS1gOq+SAK2y0Z05sZZY7+hMRN31QKWmmh1tQ14R6Jwe+cZJwnY+2A0IcefqKilXUONsCwimqGTtgnFaU014wH9kfWk8LgNtrt6EdaNznRgJfbAUrpT9NZAyHTVXdSb3oyfNDGI9CmU4rZnCjYObf310jhWIDOhS6ErPUN5/TfL04VD6HwXtPseNzyqTETSVeVe2+VDEP2Qne3q4hjVofBx1XZgxDCFJMnSHG2QQQVq4DObmDu4wLyDLfVEp+6P4ua2MDe/W2kjgMIvzaIGTWEobi0VC83LM8AwU1ZY=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3047.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a89072f-2b02-4f16-8403-08d86ba8ae24
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2020 16:39:09.2163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fap1KFj8sWPPdhO9/iMxMWJpYq/nkcNe0DjF8smbYzSdyv66T39OUphJzhtRoeFaoBQyg0VGbFFZqsJrs1bXvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2663
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.14, xch-rcd-004.cisco.com
X-Outbound-Node: alln-core-7.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Khem, Alexander,=0A=
=0A=
Please response inline, look for 'kamensky>'=0A=
=0A=
________________________________________=0A=
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Khem Raj <raj.khem@gmail.com>=0A=
Sent: Thursday, October 8, 2020 9:05 AM=0A=
To: Alexander Kanavin=0A=
Cc: Victor Kamensky (kamensky); OE-core; Ross Burton=0A=
Subject: Re: [OE-core] [PATCH 1/2] qemu: add 34Kf-64tlb fictitious cpu type=
=0A=
=0A=
On Thu, Oct 8, 2020 at 4:53 AM Alexander Kanavin <alex.kanavin@gmail.com> w=
rote:=0A=
>=0A=
> Thanks - I note that Upstream-Status is missing, are you planning to appr=
oach qemu upstream with this?=0A=
>=0A=
=0A=
Thinking about upstreaming, I think it might be worth proposing it upstream=
.=0A=
=0A=
kamensky> Yes, the same was briefly discussed during today's big triage mee=
ting:=0A=
kamensky> I will try to submit it to qemu upstream, and argue our case. it =
won't=0A=
kamensky> hurt to try it anyway.=0A=
=0A=
kamensky> I as far as Upstream-Status concerned. Yes, it looks I've messed =
up,=0A=
kamensky> I've added 'Upstream Status' to OE patch. Did not realize that it=
 should=0A=
kamensky> be added to the added patch itself.=0A=
=0A=
Thanks,=0A=
Victor=0A=
=0A=
> Alex=0A=
>=0A=
> On Thu, 8 Oct 2020 at 09:30, Ross Burton <ross@burtonini.com> wrote:=0A=
>>=0A=
>> Excellent work to identify a relatively simple way to dramatically=0A=
>> improve performance. Nice one!=0A=
>>=0A=
>> Ross=0A=
>>=0A=
>> On Wed, 7 Oct 2020 at 21:39, Victor Kamensky via=0A=
>> lists.openembedded.org <kamensky=3Dcisco.com@lists.openembedded.org>=0A=
>> wrote:=0A=
>> >=0A=
>> > In Yocto Project PR 13992 it was reported that qemumips=0A=
>> > in autobuilder runs almost twice slower then qemumips64 and=0A=
>> > some times hit time out.=0A=
>> >=0A=
>> > Upon investigations of qemu-system with perf, gdb, and=0A=
>> > SystemTap and comparing qemumips and qemumips64 machines=0A=
>> > behavior it was noticed that qemu soft mmu code behaves=0A=
>> > quite different and in case if qemumips tlbwr instruction=0A=
>> > called 16 times more oftern. It happens that in qemumips64=0A=
>> > case qemu runs with cpu type that contains 64 TLB, but in case=0A=
>> > of qemumips qemu runs with cpu type that contains only=0A=
>> > 16 TLBs.=0A=
>> >=0A=
>> > The idea of proposed qemu patch is to introduce fictitious=0A=
>> > 34Kf-64tlb cpu type that defined exactly as 34Kf but has=0A=
>> > 64 TLBs, instead of original 16 TLBs.=0A=
>> >=0A=
>> > Testing of core-image-full-cmdline:do_testimage with=0A=
>> > 34Kf-64tlb shows 40% or so test execution real time=0A=
>> > improvement.=0A=
>> >=0A=
>> > Note for future porters of the patch: easiest way to update=0A=
>> > the patch and be in sync with 34Kf definition is to copy=0A=
>> > 34Kf machine definition and apply the following changes to=0A=
>> > it (just change 15 to 63 of CP0C1_MMU bits value)=0A=
>> >=0A=
>> > [kamensky@coreos-lnx2 qemu]$ diff ~/34Kf.c ~/34Kf-64tlb.c=0A=
>> > 2c2=0A=
>> > <         .name =3D "34Kf",=0A=
>> > >         .name =3D "34Kf-64tlb",=0A=
>> > 6c6=0A=
>> > <         .CP0_Config1 =3D MIPS_CONFIG1 | (1 << CP0C1_FP) | (15 << CP0=
C1_MMU) |=0A=
>> > >         .CP0_Config1 =3D MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0=
C1_MMU) |=0A=
>> >=0A=
>> > Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13992=0A=
>> >=0A=
>> > Upstream Status: Inappropriate=0A=
>> >=0A=
>> > Signed-off-by: Victor Kamensky <kamensky@cisco.com>=0A=
>> > ---=0A=
>> >  meta/recipes-devtools/qemu/qemu.inc                |   1 +=0A=
>> >  ...Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch | 118 ++++++++++++=
+++++++++=0A=
>> >  2 files changed, 119 insertions(+)=0A=
>> >  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf=
-64tlb-fictitious-cpu-type-like-34Kf-bu.patch=0A=
>> >=0A=
>> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtoo=
ls/qemu/qemu.inc=0A=
>> > index bbb9038961..6c0edcb706 100644=0A=
>> > --- a/meta/recipes-devtools/qemu/qemu.inc=0A=
>> > +++ b/meta/recipes-devtools/qemu/qemu.inc=0A=
>> > @@ -31,6 +31,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.=
tar.xz \=0A=
>> >             file://0001-qemu-Do-not-include-file-if-not-exists.patch \=
=0A=
>> >             file://find_datadir.patch \=0A=
>> >             file://usb-fix-setup_len-init.patch \=0A=
>> > +           file://0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-3=
4Kf-bu.patch \=0A=
>> >             "=0A=
>> >  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"=0A=
>> >=0A=
>> > diff --git a/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-=
fictitious-cpu-type-like-34Kf-bu.patch b/meta/recipes-devtools/qemu/qemu/00=
01-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch=0A=
>> > new file mode 100644=0A=
>> > index 0000000000..b6312e1543=0A=
>> > --- /dev/null=0A=
>> > +++ b/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictiti=
ous-cpu-type-like-34Kf-bu.patch=0A=
>> > @@ -0,0 +1,118 @@=0A=
>> > +From b3fcc7d96523ad8e3ea28c09d495ef08529d01ce Mon Sep 17 00:00:00 200=
1=0A=
>> > +From: Victor Kamensky <kamensky@cisco.com>=0A=
>> > +Date: Wed, 7 Oct 2020 10:19:42 -0700=0A=
>> > +Subject: [PATCH] mips: add 34Kf-64tlb fictitious cpu type like 34Kf b=
ut with=0A=
>> > + 64 TLBs=0A=
>> > +=0A=
>> > +In Yocto Project CI runs it was observed that test run=0A=
>> > +of 32 bit mips image takes almost twice longer than 64 bit=0A=
>> > +mips image with the same logical load and CI execution=0A=
>> > +hits timeout.=0A=
>> > +=0A=
>> > +See https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13992=0A=
>> > +=0A=
>> > +Yocto project uses 34Kf cpu type to run 32 bit mips image,=0A=
>> > +and MIPS64R2-generic cpu type to run 64 bit mips64 image.=0A=
>> > +=0A=
>> > +Upon qemu behavior differences investigation between mips=0A=
>> > +and mips64 two prominent observations came up: under=0A=
>> > +logically similar load (same definition and configuration=0A=
>> > +of user-land image) in case of mips get_physical_address=0A=
>> > +function is called almost twice more often, meaning=0A=
>> > +twice more memory accesses involved in this case. Also=0A=
>> > +number of tlbwr instruction executed (r4k_helper_tlbwr=0A=
>> > +qemu function) almost 16 time bigger in mips case than in=0A=
>> > +mips64.=0A=
>> > +=0A=
>> > +It turns out that 34Kf cpu has 16 TLBs, but in case of=0A=
>> > +MIPS64R2-generic it is 64 TLBs. So that explains why=0A=
>> > +some many more tlbwr had to be execute by kernel TLB refill=0A=
>> > +handler in case of 32 bit misp.=0A=
>> > +=0A=
>> > +The idea of the fix is to come up with new 34Kf-64tlb fictitious=0A=
>> > +cpu type, that would behave exactly as 34Kf but it would=0A=
>> > +contain 64 TLBs to reduce TLB trashing. After all, adding=0A=
>> > +more TLBs to soft mmu is easy.=0A=
>> > +=0A=
>> > +Experiment with some significant non-trvial load in Yocto=0A=
>> > +environment by running do_testimage load shows that 34Kf-64tlb=0A=
>> > +cpu performs 40% or so better than original 34Kf cpu wrt test=0A=
>> > +execution real time.=0A=
>> > +=0A=
>> > +It is not ideal to have cpu type that does not exist in the=0A=
>> > +wild but given performance gains it seems to be justified.=0A=
>> > +=0A=
>> > +Signed-off-by: Victor Kamensky <kamensky@cisco.com>=0A=
>> > +---=0A=
>> > + target/mips/translate_init.inc.c | 55 ++++++++++++++++++++++++++++++=
++++++++++=0A=
>> > + 1 file changed, 55 insertions(+)=0A=
>> > +=0A=
>> > +diff --git a/target/mips/translate_init.inc.c b/target/mips/translate=
_init.inc.c=0A=
>> > +index 637caccd89..b73ab48231 100644=0A=
>> > +--- a/target/mips/translate_init.inc.c=0A=
>> > ++++ b/target/mips/translate_init.inc.c=0A=
>> > +@@ -297,6 +297,61 @@ const mips_def_t mips_defs[] =3D=0A=
>> > +         .insn_flags =3D CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_MT=
,=0A=
>> > +         .mmu_type =3D MMU_TYPE_R4000,=0A=
>> > +     },=0A=
>> > ++    /*=0A=
>> > ++     * Verbatim copy of "34Kf" cpu, only bumped up number of TLB ent=
ries=0A=
>> > ++     * from 16 to 64 (see CP0_Config0 value at CP0C1_MMU bits) to im=
prove=0A=
>> > ++     * performance by reducing number of TLB refill exceptions and=
=0A=
>> > ++     * eliminating need to run all corresponding TLB refill handling=
=0A=
>> > ++     * instructions.=0A=
>> > ++     */=0A=
>> > ++    {=0A=
>> > ++        .name =3D "34Kf-64tlb",=0A=
>> > ++        .CP0_PRid =3D 0x00019500,=0A=
>> > ++        .CP0_Config0 =3D MIPS_CONFIG0 | (0x1 << CP0C0_AR) |=0A=
>> > ++                       (MMU_TYPE_R4000 << CP0C0_MT),=0A=
>> > ++        .CP0_Config1 =3D MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0=
C1_MMU) |=0A=
>> > ++                       (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 << CP0=
C1_IA) |=0A=
>> > ++                       (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0=
C1_DA) |=0A=
>> > ++                       (1 << CP0C1_CA),=0A=
>> > ++        .CP0_Config2 =3D MIPS_CONFIG2,=0A=
>> > ++        .CP0_Config3 =3D MIPS_CONFIG3 | (1 << CP0C3_VInt) | (1 << CP=
0C3_MT) |=0A=
>> > ++                       (1 << CP0C3_DSPP),=0A=
>> > ++        .CP0_LLAddr_rw_bitmask =3D 0,=0A=
>> > ++        .CP0_LLAddr_shift =3D 0,=0A=
>> > ++        .SYNCI_Step =3D 32,=0A=
>> > ++        .CCRes =3D 2,=0A=
>> > ++        .CP0_Status_rw_bitmask =3D 0x3778FF1F,=0A=
>> > ++        .CP0_TCStatus_rw_bitmask =3D (0 << CP0TCSt_TCU3) | (0 << CP0=
TCSt_TCU2) |=0A=
>> > ++                    (1 << CP0TCSt_TCU1) | (1 << CP0TCSt_TCU0) |=0A=
>> > ++                    (0 << CP0TCSt_TMX) | (1 << CP0TCSt_DT) |=0A=
>> > ++                    (1 << CP0TCSt_DA) | (1 << CP0TCSt_A) |=0A=
>> > ++                    (0x3 << CP0TCSt_TKSU) | (1 << CP0TCSt_IXMT) |=0A=
>> > ++                    (0xff << CP0TCSt_TASID),=0A=
>> > ++        .CP1_fcr0 =3D (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W=
) |=0A=
>> > ++                    (1 << FCR0_D) | (1 << FCR0_S) | (0x95 << FCR0_PR=
ID),=0A=
>> > ++        .CP1_fcr31 =3D 0,=0A=
>> > ++        .CP1_fcr31_rw_bitmask =3D 0xFF83FFFF,=0A=
>> > ++        .CP0_SRSCtl =3D (0xf << CP0SRSCtl_HSS),=0A=
>> > ++        .CP0_SRSConf0_rw_bitmask =3D 0x3fffffff,=0A=
>> > ++        .CP0_SRSConf0 =3D (1U << CP0SRSC0_M) | (0x3fe << CP0SRSC0_SR=
S3) |=0A=
>> > ++                    (0x3fe << CP0SRSC0_SRS2) | (0x3fe << CP0SRSC0_SR=
S1),=0A=
>> > ++        .CP0_SRSConf1_rw_bitmask =3D 0x3fffffff,=0A=
>> > ++        .CP0_SRSConf1 =3D (1U << CP0SRSC1_M) | (0x3fe << CP0SRSC1_SR=
S6) |=0A=
>> > ++                    (0x3fe << CP0SRSC1_SRS5) | (0x3fe << CP0SRSC1_SR=
S4),=0A=
>> > ++        .CP0_SRSConf2_rw_bitmask =3D 0x3fffffff,=0A=
>> > ++        .CP0_SRSConf2 =3D (1U << CP0SRSC2_M) | (0x3fe << CP0SRSC2_SR=
S9) |=0A=
>> > ++                    (0x3fe << CP0SRSC2_SRS8) | (0x3fe << CP0SRSC2_SR=
S7),=0A=
>> > ++        .CP0_SRSConf3_rw_bitmask =3D 0x3fffffff,=0A=
>> > ++        .CP0_SRSConf3 =3D (1U << CP0SRSC3_M) | (0x3fe << CP0SRSC3_SR=
S12) |=0A=
>> > ++                    (0x3fe << CP0SRSC3_SRS11) | (0x3fe << CP0SRSC3_S=
RS10),=0A=
>> > ++        .CP0_SRSConf4_rw_bitmask =3D 0x3fffffff,=0A=
>> > ++        .CP0_SRSConf4 =3D (0x3fe << CP0SRSC4_SRS15) |=0A=
>> > ++                    (0x3fe << CP0SRSC4_SRS14) | (0x3fe << CP0SRSC4_S=
RS13),=0A=
>> > ++        .SEGBITS =3D 32,=0A=
>> > ++        .PABITS =3D 32,=0A=
>> > ++        .insn_flags =3D CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_MT=
,=0A=
>> > ++        .mmu_type =3D MMU_TYPE_R4000,=0A=
>> > ++    },=0A=
>> > +     {=0A=
>> > +         .name =3D "74Kf",=0A=
>> > +         .CP0_PRid =3D 0x00019700,=0A=
>> > +--=0A=
>> > +2.14.5=0A=
>> > +=0A=
>> > --=0A=
>> > 2.14.5=0A=
>> >=0A=
>> >=0A=
>> >=0A=
>> >=0A=
>>=0A=
>>=0A=
>>=0A=
>=0A=
>=0A=
>=0A=
