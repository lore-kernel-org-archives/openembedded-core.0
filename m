Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.web12.4942.1602133548831050780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 22:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=V1t0/wOs;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: kamensky@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=11556; q=dns/txt;
  s=iport; t=1602133548; x=1603343148;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8oHG7ldsitd63a+oJDWXEzgNIXWAVY/Vaj1bMb9lZ54=;
  b=V1t0/wOsI/wsihFg8LO4zrLY06wx4hswxofmlp0ZZYjjFlpWc2Dd3SvE
   S6cJSrV00M08k22hl7BOkwrPHm2QFDpanFm82tX7fNaYmZPAYE9kRBwoE
   l/AVgoMJVKfx9eUHeUFLADtqCEHWOizapFHJpC4QvoJDHYdG1zPqzHYw/
   o=;
IronPort-PHdr: =?us-ascii?q?9a23=3Az2aigxfzzA8HyQXscV+ClVxBlGMj4e+mNxMJ6p?=
 =?us-ascii?q?chl7NFe7ii+JKnJkHE+PFxlwaQAdfU7vtFj6zdtKWzEWAD4JPUtncEfdQMUh?=
 =?us-ascii?q?IekswZkkQmB9LNEkz0KvPmLklYVMRPXVNo5Te3ZE5SHsutaFjbo3n05jkXSV?=
 =?us-ascii?q?3zMANvLbHzHYjfx828y+G1/cjVZANFzDqwaL9/NlO4twLU48IXmoBlbK02z0?=
 =?us-ascii?q?jE?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CwBQBTnX5f/5BdJa1gHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgU+BUiMuB3BZLyyIAwONdooRjmqCUwNVCwEBAQ0BARgLCgI?=
 =?us-ascii?q?EAQGESgKCBwIlOBMCAwEBCwEBBQEBAQIBBgRthVwMhXIBAQEBAwERLgEBKg0?=
 =?us-ascii?q?BDwIBCBEDAQEBAS4hBwodCAIEAQ0FCBqDBYJLAy4BDp1nAoE5iBMZNXSBNIM?=
 =?us-ascii?q?BAQEFhSoNC4IQAwaBOIJyikEbggCBVIIYNT6CGkIEARaBRgKDSIItmm0BgRi?=
 =?us-ascii?q?bBFIKgmiJAIsOgU6FLYMTnhqTGoF6iHaCa5JAAgQCBAUCDgEBBYFrI4FXcBW?=
 =?us-ascii?q?DJFAXAg2OHwwXg06FFIVCdAI1AgYKAQEDCXyNTAEB?=
X-IronPort-AV: E=Sophos;i="5.77,349,1596499200"; 
   d="scan'208";a="556990103"
Received: from rcdn-core-8.cisco.com ([173.37.93.144])
  by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 08 Oct 2020 05:05:47 +0000
Received: from XCH-ALN-001.cisco.com (xch-aln-001.cisco.com [173.36.7.11])
	by rcdn-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 09855l3R008098
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 8 Oct 2020 05:05:47 GMT
Received: from xhs-aln-003.cisco.com (173.37.135.120) by XCH-ALN-001.cisco.com
 (173.36.7.11) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Oct
 2020 00:05:46 -0500
Received: from xhs-rtp-002.cisco.com (64.101.210.229) by xhs-aln-003.cisco.com
 (173.37.135.120) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Oct
 2020 00:05:46 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-002.cisco.com (64.101.210.229) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Thu, 8 Oct 2020 01:05:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVNL2Qo+lcMBElMKVgnpASzCkIU/OFl5fmpgCoQNrObvh+UdfC3jLcLhSqSi6Ar0Fp6YfKb8zpTwCc2mGfYrwax6rFMK5jnrslI1NPVQe+l1+HIFGS9mN+DU9IQkCsAvWvC0fhYd6wWH2ljYlf5CoSvDe2MC5Sk/1WKCTA+kSd6FLTVrj9TAIcXPhwRInVgJBWeSX6Rj0WwmgJ0zHa/V2ooDDx4Wyll2ebSud+5glk6FCr6eGUXQqZfMOGjXLyhj4QS0vGeMZkZvAs01EeJ9Y/7zfY0oQK5KYQX+Dy7WkQyR5mBQIyyWAV2/IFHVf32pIYYR7NkHJSsFxJPvuhfZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KROkad5Abu/Uy6dr/EJEd+seRRSDomYa473YvBx5h9M=;
 b=UO6d9bgvPiimLHW+A6ft/mAltH0VYF+lsKkyC2ykAdsJxrZL0L8l3QyAEgbLVDZlXctMO1aSUVrKwgm8rWgKZubCr/O2oVbuSADVgsvXkqPhyZS7sHH67Y3btDmzCHGkl2R/4t9qlyG9upsFuRfyh7M2VtFx1idPizZgFR3HhcgSzZ+k1953uaSJQcy6bA1Z19GWZRTtB9TogPnxu6ZYH8gVU0GDlThJerbx7T1sBO7Jbr79+gf3dYXteWfYU8/65/K7yDU9FireOPjXFNRIn9TrTMv7emlRxy0NI0G1bcIq26qkAZtlk9gPnO+tgNVz89Ib3tCGjYKQKWYG2P2+JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KROkad5Abu/Uy6dr/EJEd+seRRSDomYa473YvBx5h9M=;
 b=EQuEuzyC2pUJuglCrlx22lAeQ5KHjAFLdxJqb/+/AjvxX1lwlxhXXuFzYpusXPyJKLBD2RWU0e5IiNfADnmosL63B/gLjzZKi6JAtpXjw9zJErPm7Mcgr3rqeAcogoGqP5MVtkzR1BtOuM0+PdDE8Te93WyTyI7GeCgBLxXuov0=
Received: from BYAPR11MB3047.namprd11.prod.outlook.com (2603:10b6:a03:8b::32)
 by BY5PR11MB4436.namprd11.prod.outlook.com (2603:10b6:a03:1c3::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.39; Thu, 8 Oct
 2020 05:05:44 +0000
Received: from BYAPR11MB3047.namprd11.prod.outlook.com
 ([fe80::dd53:b1a0:340f:ede5]) by BYAPR11MB3047.namprd11.prod.outlook.com
 ([fe80::dd53:b1a0:340f:ede5%4]) with mapi id 15.20.3433.045; Thu, 8 Oct 2020
 05:05:43 +0000
From: "Victor Kamensky" <kamensky@cisco.com>
To: Khem Raj <raj.khem@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 1/2] qemu: add 34Kf-64tlb fictitious cpu type
Thread-Topic: [PATCH 1/2] qemu: add 34Kf-64tlb fictitious cpu type
Thread-Index: AQHWnPYSUOwaUzuUI0mSLYhjUPZNHKmNJvo+
Date: Thu, 8 Oct 2020 05:05:43 +0000
Message-ID: <BYAPR11MB30473E504B56CCAB88B832CCCD0B0@BYAPR11MB3047.namprd11.prod.outlook.com>
References: <20201007203838.19096-1-kamensky@cisco.com>
 <20201007203838.19096-2-kamensky@cisco.com>,<ebd29fd2-a720-37a2-4122-014898b7c6c8@gmail.com>
In-Reply-To: <ebd29fd2-a720-37a2-4122-014898b7c6c8@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c8:1003::8c4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0d03c49-3746-4406-4b0d-08d86b47cf6d
x-ms-traffictypediagnostic: BY5PR11MB4436:
x-microsoft-antispam-prvs: <BY5PR11MB4436F6A38790EB883362F1CACD0B0@BY5PR11MB4436.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mE/Ae9bw0CklZM7uUnEHbvNERVke8+o4QL6yxfAMAdRh8ayX4L1cYPTHDztBC+GyJAkQ+LGjpd6PJAlePuIo8uaTWoOX1TI3OowMuBxy+VOmR2LKk4BDFUS+7gRYYadI6beVkNbVKYQw8tKOEB9jwSIePOLMir9C5t9hWu41uEm16jjF8MF9ioMxM+KmxGEGCM1pROHF140xuh04yfs6t5a4GBlh0OBPF4bOctaX/nu/yTCrK8ZHMtwJ/YgOpq7Vwz2lkSiidcZ8eth5nuAgF37mq733y+GN9mlxbEmi4W2N880yjKVVmRFhyITXQbozM5qRYgcVgIdJ1UNluIg5iSMyFGR40mZM8RSR+xSX3xwULLNnZWQksecjluQ863RVEMygPhFPnHJPjKqslCWuK2v0GMtrtgr+vC9zHYDLW5KSpNMp6mZVa02VK+6PVCPDGxY10mPCfJ9WrRupv+iDNQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3047.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(346002)(376002)(396003)(366004)(2906002)(316002)(478600001)(9686003)(5660300002)(8676002)(7696005)(186003)(53546011)(8936002)(6506007)(86362001)(66476007)(33656002)(83380400001)(71200400001)(66556008)(52536014)(64756008)(4326008)(83080400001)(76116006)(55016002)(66446008)(966005)(66946007)(110136005)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: LN0Kyl18zQqSfxqTNzjqoDSyIL7q+X2G19EmPHgymON1mlXP3JgjaAADajkiA4sKeHChi/UWfRYnwykHmc9sezTR0BRuyVZ0UWOOk0HV7BVsLk/QE5bWHOCwxPfAeHNYRtFBBhr8nU+6FV1gWSnygp348bHqfEdlqcsHcIll64ZxYaU0ojjWGcWoFidXEf0jKR+7ErbPYsTt8+cD/1OB91C78an+n2dL7BA4AHk29gLRQHUNSjdj1UeI4peIm1AeLa/uv53n6xP0vAscUIj1LksDkI34WDt8SLHNtm8OBzsANZ9jNnWxpmcYL2RQ5EYrkNOMd9N4RifpFbLb5POHBedqL4uNAqi44nkVRxyVGMDgtQa1m1lp6y4Ud6MFqtzawwMqXgMXOhd8TBsV9eNXxAYHtpYFd1J6gBolFBFYoKkosVY/4BvpxeJMOFxMdn2lUzFaSRe+RdTJEU4FVaPRI+7gSvCfaFARghAmS8PRBCq9I4Xoi6g1V2CQaaDJo5Yx3jB8rZyxIe8r2Nr+Z5F+ffDjBRd/BHeoQTZW7tisn/TCUebON7F4YQGyJ/TCnnyiaIW5+VSMjGCX17L/cmU7k8iyWVxe21i+l6/52FV4dKGON+exvBbjAYpFJqVh29Jj82bxKeAng2Ktmrp3q1EYXlKYQJgFyz2+EHDaOlkN8DI=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3047.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d03c49-3746-4406-4b0d-08d86b47cf6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2020 05:05:43.7800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2vLAfItX8VR5VKbTVFKh+fT4rpd5Kn7H25wbASl6e/J85qss/EC85/gd/EzzPML/hi/sYg9zYavTkq2EKuk+yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4436
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.11, xch-aln-001.cisco.com
X-Outbound-Node: rcdn-core-8.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Khem,=0A=
=0A=
As you saw in my response to Paul and you offered explanation=0A=
why, mips32r6-generic did not work for me.=0A=
=0A=
But I think impact of 32 TLBs vs 16 TLBs vs 64 TLBs is fair question.=0A=
It could be done with 34Kf as the base cpu model.=0A=
=0A=
Here I've done another round of testings in my setup, after removing=0A=
all my instrumentation and removing -fno-omit-frame-pointer=0A=
options in qemu. I've tested core-image-full-cmdline:do_testimage sample=0A=
of 5 runs. In ratio column 1 unit it is execution time of qemumips64=0A=
machine. 34Kf-xxx of course runs qemumips. This tables summarizes=0A=
my results and shows difference between these options:=0A=
=0A=
machine/cpu   avg (s)   stdev (s)    ratio=0A=
=0A=
qemumips64        231          6      1.00=0A=
=0A=
34Kf-16tlb        605         12      2.61=0A=
=0A=
34Kf-32tlb        340         15      1.47=0A=
=0A=
34Kf-64tlb        272         14      1.17=0A=
=0A=
So, yes, 32 TLBs would give noticeable improvements as well,=0A=
but 64 TLBs still better.=0A=
=0A=
Thanks,=0A=
Victor=0A=
=0A=
________________________________________=0A=
From: Khem Raj <raj.khem@gmail.com>=0A=
Sent: Wednesday, October 7, 2020 3:05 PM=0A=
To: Victor Kamensky (kamensky); openembedded-core@lists.openembedded.org=0A=
Cc: Richard Purdie=0A=
Subject: Re: [PATCH 1/2] qemu: add 34Kf-64tlb fictitious cpu type=0A=
=0A=
Hi Victor=0A=
=0A=
Thanks for investigating it, these are hard problems to root cause.=0A=
I am fine with this patchset as it is. one comment/question I have is if=0A=
you tried 32 TLBs since r6 implementation does allow 32 TLBs this would=0A=
make it less fictition and perhaps any 32bit mips issues could be shared=0A=
with mips32r6 implementation. I am curious if that would result=0A=
in better performance or 64 TLB emulation is better.=0A=
=0A=
On 10/7/20 1:38 PM, Victor Kamensky wrote:=0A=
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
>>          .name =3D "34Kf-64tlb",=0A=
> 6c6=0A=
> <         .CP0_Config1 =3D MIPS_CONFIG1 | (1 << CP0C1_FP) | (15 << CP0C1_=
MMU) |=0A=
>>          .CP0_Config1 =3D MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0C1_=
MMU) |=0A=
>=0A=
> Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13992=0A=
>=0A=
> Upstream Status: Inappropriate=0A=
>=0A=
> Signed-off-by: Victor Kamensky <kamensky@cisco.com>=0A=
> ---=0A=
>   meta/recipes-devtools/qemu/qemu.inc                |   1 +=0A=
>   ...Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch | 118 ++++++++++++++=
+++++++=0A=
>   2 files changed, 119 insertions(+)=0A=
>   create mode 100644 meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-6=
4tlb-fictitious-cpu-type-like-34Kf-bu.patch=0A=
>=0A=
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc=0A=
> index bbb9038961..6c0edcb706 100644=0A=
> --- a/meta/recipes-devtools/qemu/qemu.inc=0A=
> +++ b/meta/recipes-devtools/qemu/qemu.inc=0A=
> @@ -31,6 +31,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \=0A=
>              file://0001-qemu-Do-not-include-file-if-not-exists.patch \=
=0A=
>              file://find_datadir.patch \=0A=
>              file://usb-fix-setup_len-init.patch \=0A=
> +           file://0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf=
-bu.patch \=0A=
>              "=0A=
>   UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"=0A=
>=0A=
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fic=
titious-cpu-type-like-34Kf-bu.patch b/meta/recipes-devtools/qemu/qemu/0001-=
mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch=0A=
> new file mode 100644=0A=
> index 0000000000..b6312e1543=0A=
> --- /dev/null=0A=
> +++ b/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious=
-cpu-type-like-34Kf-bu.patch=0A=
> @@ -0,0 +1,118 @@=0A=
> +From b3fcc7d96523ad8e3ea28c09d495ef08529d01ce Mon Sep 17 00:00:00 2001=
=0A=
> +From: Victor Kamensky <kamensky@cisco.com>=0A=
> +Date: Wed, 7 Oct 2020 10:19:42 -0700=0A=
> +Subject: [PATCH] mips: add 34Kf-64tlb fictitious cpu type like 34Kf but =
with=0A=
> + 64 TLBs=0A=
> +=0A=
> +In Yocto Project CI runs it was observed that test run=0A=
> +of 32 bit mips image takes almost twice longer than 64 bit=0A=
> +mips image with the same logical load and CI execution=0A=
> +hits timeout.=0A=
> +=0A=
> +See https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13992=0A=
> +=0A=
> +Yocto project uses 34Kf cpu type to run 32 bit mips image,=0A=
> +and MIPS64R2-generic cpu type to run 64 bit mips64 image.=0A=
> +=0A=
> +Upon qemu behavior differences investigation between mips=0A=
> +and mips64 two prominent observations came up: under=0A=
> +logically similar load (same definition and configuration=0A=
> +of user-land image) in case of mips get_physical_address=0A=
> +function is called almost twice more often, meaning=0A=
> +twice more memory accesses involved in this case. Also=0A=
> +number of tlbwr instruction executed (r4k_helper_tlbwr=0A=
> +qemu function) almost 16 time bigger in mips case than in=0A=
> +mips64.=0A=
> +=0A=
> +It turns out that 34Kf cpu has 16 TLBs, but in case of=0A=
> +MIPS64R2-generic it is 64 TLBs. So that explains why=0A=
> +some many more tlbwr had to be execute by kernel TLB refill=0A=
> +handler in case of 32 bit misp.=0A=
> +=0A=
> +The idea of the fix is to come up with new 34Kf-64tlb fictitious=0A=
> +cpu type, that would behave exactly as 34Kf but it would=0A=
> +contain 64 TLBs to reduce TLB trashing. After all, adding=0A=
> +more TLBs to soft mmu is easy.=0A=
> +=0A=
> +Experiment with some significant non-trvial load in Yocto=0A=
> +environment by running do_testimage load shows that 34Kf-64tlb=0A=
> +cpu performs 40% or so better than original 34Kf cpu wrt test=0A=
> +execution real time.=0A=
> +=0A=
> +It is not ideal to have cpu type that does not exist in the=0A=
> +wild but given performance gains it seems to be justified.=0A=
> +=0A=
> +Signed-off-by: Victor Kamensky <kamensky@cisco.com>=0A=
> +---=0A=
> + target/mips/translate_init.inc.c | 55 +++++++++++++++++++++++++++++++++=
+++++++=0A=
> + 1 file changed, 55 insertions(+)=0A=
> +=0A=
> +diff --git a/target/mips/translate_init.inc.c b/target/mips/translate_in=
it.inc.c=0A=
> +index 637caccd89..b73ab48231 100644=0A=
> +--- a/target/mips/translate_init.inc.c=0A=
> ++++ b/target/mips/translate_init.inc.c=0A=
> +@@ -297,6 +297,61 @@ const mips_def_t mips_defs[] =3D=0A=
> +         .insn_flags =3D CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_MT,=
=0A=
> +         .mmu_type =3D MMU_TYPE_R4000,=0A=
> +     },=0A=
> ++    /*=0A=
> ++     * Verbatim copy of "34Kf" cpu, only bumped up number of TLB entrie=
s=0A=
> ++     * from 16 to 64 (see CP0_Config0 value at CP0C1_MMU bits) to impro=
ve=0A=
> ++     * performance by reducing number of TLB refill exceptions and=0A=
> ++     * eliminating need to run all corresponding TLB refill handling=0A=
> ++     * instructions.=0A=
> ++     */=0A=
> ++    {=0A=
> ++        .name =3D "34Kf-64tlb",=0A=
> ++        .CP0_PRid =3D 0x00019500,=0A=
> ++        .CP0_Config0 =3D MIPS_CONFIG0 | (0x1 << CP0C0_AR) |=0A=
> ++                       (MMU_TYPE_R4000 << CP0C0_MT),=0A=
> ++        .CP0_Config1 =3D MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0C1_=
MMU) |=0A=
> ++                       (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 << CP0C1_=
IA) |=0A=
> ++                       (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_=
DA) |=0A=
> ++                       (1 << CP0C1_CA),=0A=
> ++        .CP0_Config2 =3D MIPS_CONFIG2,=0A=
> ++        .CP0_Config3 =3D MIPS_CONFIG3 | (1 << CP0C3_VInt) | (1 << CP0C3=
_MT) |=0A=
> ++                       (1 << CP0C3_DSPP),=0A=
> ++        .CP0_LLAddr_rw_bitmask =3D 0,=0A=
> ++        .CP0_LLAddr_shift =3D 0,=0A=
> ++        .SYNCI_Step =3D 32,=0A=
> ++        .CCRes =3D 2,=0A=
> ++        .CP0_Status_rw_bitmask =3D 0x3778FF1F,=0A=
> ++        .CP0_TCStatus_rw_bitmask =3D (0 << CP0TCSt_TCU3) | (0 << CP0TCS=
t_TCU2) |=0A=
> ++                    (1 << CP0TCSt_TCU1) | (1 << CP0TCSt_TCU0) |=0A=
> ++                    (0 << CP0TCSt_TMX) | (1 << CP0TCSt_DT) |=0A=
> ++                    (1 << CP0TCSt_DA) | (1 << CP0TCSt_A) |=0A=
> ++                    (0x3 << CP0TCSt_TKSU) | (1 << CP0TCSt_IXMT) |=0A=
> ++                    (0xff << CP0TCSt_TASID),=0A=
> ++        .CP1_fcr0 =3D (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |=
=0A=
> ++                    (1 << FCR0_D) | (1 << FCR0_S) | (0x95 << FCR0_PRID)=
,=0A=
> ++        .CP1_fcr31 =3D 0,=0A=
> ++        .CP1_fcr31_rw_bitmask =3D 0xFF83FFFF,=0A=
> ++        .CP0_SRSCtl =3D (0xf << CP0SRSCtl_HSS),=0A=
> ++        .CP0_SRSConf0_rw_bitmask =3D 0x3fffffff,=0A=
> ++        .CP0_SRSConf0 =3D (1U << CP0SRSC0_M) | (0x3fe << CP0SRSC0_SRS3)=
 |=0A=
> ++                    (0x3fe << CP0SRSC0_SRS2) | (0x3fe << CP0SRSC0_SRS1)=
,=0A=
> ++        .CP0_SRSConf1_rw_bitmask =3D 0x3fffffff,=0A=
> ++        .CP0_SRSConf1 =3D (1U << CP0SRSC1_M) | (0x3fe << CP0SRSC1_SRS6)=
 |=0A=
> ++                    (0x3fe << CP0SRSC1_SRS5) | (0x3fe << CP0SRSC1_SRS4)=
,=0A=
> ++        .CP0_SRSConf2_rw_bitmask =3D 0x3fffffff,=0A=
> ++        .CP0_SRSConf2 =3D (1U << CP0SRSC2_M) | (0x3fe << CP0SRSC2_SRS9)=
 |=0A=
> ++                    (0x3fe << CP0SRSC2_SRS8) | (0x3fe << CP0SRSC2_SRS7)=
,=0A=
> ++        .CP0_SRSConf3_rw_bitmask =3D 0x3fffffff,=0A=
> ++        .CP0_SRSConf3 =3D (1U << CP0SRSC3_M) | (0x3fe << CP0SRSC3_SRS12=
) |=0A=
> ++                    (0x3fe << CP0SRSC3_SRS11) | (0x3fe << CP0SRSC3_SRS1=
0),=0A=
> ++        .CP0_SRSConf4_rw_bitmask =3D 0x3fffffff,=0A=
> ++        .CP0_SRSConf4 =3D (0x3fe << CP0SRSC4_SRS15) |=0A=
> ++                    (0x3fe << CP0SRSC4_SRS14) | (0x3fe << CP0SRSC4_SRS1=
3),=0A=
> ++        .SEGBITS =3D 32,=0A=
> ++        .PABITS =3D 32,=0A=
> ++        .insn_flags =3D CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_MT,=
=0A=
> ++        .mmu_type =3D MMU_TYPE_R4000,=0A=
> ++    },=0A=
> +     {=0A=
> +         .name =3D "74Kf",=0A=
> +         .CP0_PRid =3D 0x00019700,=0A=
> +--=0A=
> +2.14.5=0A=
> +=0A=
>=0A=
