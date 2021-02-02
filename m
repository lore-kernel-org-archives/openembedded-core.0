Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web11.49650.1612255116400522337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 00:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=XkKT2Xtr;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: zBM+SlUfSuOfGgpo6HcoJqugDA9xdGi2an0cpgciSLcsq4LYgXpBdEOgbjOwbKlW23erD1tt+f
 SNs5rqxuyZqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="178259777"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="178259777"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 00:38:35 -0800
IronPort-SDR: ZiDSNhH6wtxGb8D3N/hhSAsziYIiYMvNEtKXd4M+r2Xy/uF7t/iHvNqTo07QYggCV1QeuYN7Cp
 A0o2nCPO3Y4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="413512606"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2021 00:38:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 2 Feb 2021 00:38:33 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 2 Feb 2021 00:38:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 2 Feb 2021 00:38:33 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 2 Feb 2021 00:38:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwZwR4QQ/KXy2r9gjHdlzmTBwIzkVIX2f/hpcC6kREtZGT5DeYbdW5qX05rARsjfD6fR2VLeHj6i72u60MkL1IsKUSIwCPqHr7CQRt5qrfq61AxIXzS9bT4fO2Rvgll3i9/WMlyb/Txvu2M8HL9qC0esSrWNbsH/BmmTQsgMlk7R28aYXo3Dd5Rel6zcKfDgl0eCeMZnpkFWUl9Gmnj0Lt01sIZM4BurOG93NIx39xNGzzdhzThWHbbTuCjgOLRmmK5HZ4+Mcpak/eIYl0KC+n7RP0rQXtlME1/HptZydm+u+BmFTbtBPD5ZmTeYoR+FWBUJqD1H6/aPl9YSVQDifQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk/VbC67Aw6UdwXp96S33CXzSvtYNRPNsnZrwhXfwxc=;
 b=DQaFsiM4ooc7JuSyDZDHkxsBEXU/RQfovaAQlvvQsjUU+q/ARL9vrqqqFp/BoxyOBhh3ycDT/P6SENQ4Hvj5pGjbsi69zVtlcZRYThp0MUB5iAlhj6av9Ij+wacV+L9mPNRiHazZLX+H/p1EExn/k51d6k1Mx6jZj3DL17D94TGbfBDRQZYnuUUWvLPwSN9vx7/3mHYp5lcC07Lux17a5W/K5A6NXuvMqaeGD4gD5LwWWp2DdSpOF1HcBQVA2KmaCbpUBPVxECgFIOil+WulGlslF1WRjtLWNn0io++OG7Ra91bhCZevGXV7eb4uy+VUiFoFOmWG3m1zzWyVEYsb4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk/VbC67Aw6UdwXp96S33CXzSvtYNRPNsnZrwhXfwxc=;
 b=XkKT2XtrfjUUh6vwxUXc0N483NPVxvBp7491gRHBhQ5V4tRi2j6yIWqqkeOsqW9DP/Q4n7cpPWOPZ3eqgfF6gHb4JjWphA6ZocSFhPLO0IsmvK0GQg7FHCB2rD+JTQwnvx73eM6clmaA83/3yxjC1XGd9ZHnSZ2HUwbxKXeh9TU=
Received: from MWHPR11MB2000.namprd11.prod.outlook.com (2603:10b6:300:2b::23)
 by MWHPR11MB1950.namprd11.prod.outlook.com (2603:10b6:300:112::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Tue, 2 Feb
 2021 08:38:29 +0000
Received: from MWHPR11MB2000.namprd11.prod.outlook.com
 ([fe80::68d5:9f61:8df6:9a36]) by MWHPR11MB2000.namprd11.prod.outlook.com
 ([fe80::68d5:9f61:8df6:9a36%5]) with mapi id 15.20.3805.027; Tue, 2 Feb 2021
 08:38:29 +0000
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [gatesgarth][PATCH 00/25] patch review request
Thread-Topic: [OE-core] [gatesgarth][PATCH 00/25] patch review request
Thread-Index: AQHW+SUrUa1Xhwf2fkOtpYC5GOSPmKpEiU3w
Date: Tue, 2 Feb 2021 08:38:29 +0000
Message-ID: <MWHPR11MB2000C376C70B5AF486E66CB3B9B59@MWHPR11MB2000.namprd11.prod.outlook.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
Accept-Language: en-SG, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.189.39.146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0e6e69e-8693-4a95-64b9-08d8c755eab8
x-ms-traffictypediagnostic: MWHPR11MB1950:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB19508DD6FFCFA0680A631180B9B59@MWHPR11MB1950.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8R2XE7uCQjMXqM6LBB3fCIDF7gX6mS2TTyYXVAvKQRP4wX0xEyOVyNWdwIdhbyTUVyWGGahHNlzI5VKA9peG5B6tovqo71Lge8kmUPNM97NVwPGPa/WWx4gt5Ydw6BULaLZBoP98kiC3O6feriYrFgtGuPYZNZmpuLtFt6VcTL6J13PIwBfp/FJltwmCLh7C/CswA7c/1omCLZ1vvFQHIW9TFEPEahFS03/GmH7rRElKNlL+3hT32ZU/oOasDQN4i5utREGpWiSEFJfnPoPNVR/7dJnsxV2ofZ0TpAFkVTxGN7uS00W8Y01TRvQ/HKPqxWwkcHO2Rrmt0XM4f6eazf4V+ZogN7ykOxHLKIRZu36qdcOWWUsNAhf8eE6iO0cXTGzlb4Bw7XnGT1b41kSOsZ0LkCetm+Gmt8Wl+u1SDdlbKBu4Ag3EE/rX5DLx1zsmAb1zYIsXZsl7hc8gwsBsnjwAoT6RBE/d4hDSuFmtujVFzYkQs5Xcfe1cGYLFh25QVF4hSWcZGsYtwWPl4dRPuO8LAT5WlxrZSyIJRyqyCiRuKudz3pR2xgjYf+3xTzLBiemNftjbGDE/dypAbXZFnD+HikooFSUSFXhcOhYOqrw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB2000.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(346002)(366004)(136003)(316002)(110136005)(26005)(8936002)(7696005)(186003)(966005)(2906002)(478600001)(6506007)(83380400001)(64756008)(86362001)(66476007)(66946007)(52536014)(9686003)(66446008)(8676002)(5660300002)(33656002)(71200400001)(76116006)(55016002)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?qA88/bDGPltg516Yhit/GvAYC0LKAJExFsZsbJQNpxOtOaMLNZt4aoI/Qre/?=
 =?us-ascii?Q?9FQKG9HBWtMjITwKPMLpORdFic1kcjkfoZxq3o9AXzv93jyJMOOQYd/dsTVQ?=
 =?us-ascii?Q?PO5WIFjrgIe3XTcV3Q8PKDQH6OgorOnrahYWGYY3ypUDqAlbXieDkFOm8zvo?=
 =?us-ascii?Q?SqziW+Yiq8/dfDHcFSupaoBJmL3vE6ZU5CSnUVoWy6QktNPLBJXj8PeDY00c?=
 =?us-ascii?Q?fcI/MWRo1P/B/Mq4o19Q998T/laj2lphr9M2V19lalpD8t7jr8Fr4C4H8tlt?=
 =?us-ascii?Q?cuqd4N9cHOJM2xAXeqXzeZILjk2cj5K7ZG65kES31wxegvQGP4ogpi8k+nSR?=
 =?us-ascii?Q?DwnO0qSk4yNXHr8z7tVmNQToRQ68fSOfiPBjjuBJHxvx4QIdEOMrGAOW5wao?=
 =?us-ascii?Q?6F12uquivfpp/z+drQGVq9cD6bGcskXa9Dq5LGEWTIhyPaLoCPYAsTZXKaVW?=
 =?us-ascii?Q?GFjS5wQLhRZpM83t/oc0DDHy/8orcArJNo0CHulKqDibUeUcW+MmqFYKgc7d?=
 =?us-ascii?Q?R4Od7L3R0De7sfjwXi8D0IP+quj6kAj9YK2b7Y9+NZ1VQYVlvA6+HgUorrzV?=
 =?us-ascii?Q?VUnZVmjsd718itR6TIEnm7RvraT3QdA/U0zfdsjnxhajH4BrygBmCTV+PDqN?=
 =?us-ascii?Q?NBaARhtSHow1nmE/77QJ69pv7Bc+rVl6jVMS0+GqtoB/C1rWesGymxQBFsv6?=
 =?us-ascii?Q?Vp/bA7FBASuzUtZYc0lE5+2qdQ5XUdk2rHCTnV16HVcV1vbage12SIZl4i2J?=
 =?us-ascii?Q?tD9L7OOB+xNHPjPHsvZVs2eGFAAk5sgIYFaGbrgxgzgbP8eVgSfoHbZwic0Z?=
 =?us-ascii?Q?QMRtX+9AZ6Ixk94orNXwBlqLGwScxTKODb+dLywjXZz0exBR2AY86Wm7Yrrq?=
 =?us-ascii?Q?ngs/Turau0UR2W38LwizHjHX9XwCePG0HPxlKQev/lwKEGh2AJ9eXDxRM0xN?=
 =?us-ascii?Q?mAv7MwEa67CuaT/EoyfxQ29alIzPm/mFuy/xtTaKpFd7Uu0XbzqFnY+Shq01?=
 =?us-ascii?Q?n+rf73tKTfNpfuFn899sOoGDDURBqHvwmy/kVXPmiQCxT1KSmmWzTV7nhPwR?=
 =?us-ascii?Q?iN6iAw9n?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB2000.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e6e69e-8693-4a95-64b9-08d8c755eab8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 08:38:29.5826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X6G0ehc4UpQmBub0SgNdCVqRKCpwTI15y42FMBytcx31Q2u3U8L1BM6+dBG2HJMY32tk0TWysBpUIYeE/lclfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1950
Return-Path: chee.yang.lee@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: openembedded-core@lists.openembedded.org <openembedded-
>core@lists.openembedded.org> On Behalf Of Anuj Mittal
>Sent: Tuesday, 2 February, 2021 1:34 PM
>To: openembedded-core@lists.openembedded.org
>Subject: [OE-core] [gatesgarth][PATCH 00/25] patch review request
>
>Please review these changes for gatesgarth. Builds cleanly on autobuilder
>except for one intermittent failure while executing oe-selftest on a CentO=
S 7
>worker:
>
>https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1784/ste
>ps/10/logs/step2d
>
>This doesn't look related to the proposed changes and didn't happen again.
>
>Thanks,
>
>Anuj
>
>The following changes since commit
>4e8022635fc8543d135fed3091a9f555899d1b3c:
>
>  linuxloader: Avoid confusing string concat errors (2021-01-27 09:32:36 +=
0000)
>
>are available in the Git repository at:
>
>  git://push.openembedded.org/openembedded-core-contrib
>anujm/gatesgarth
>
>Anuj Mittal (3):
>  python3: fix CVE-2021-3177
>  sudo: fix CVE-2021-23239
>  gstreamer1.0: fix failing ptest
>
>Dorinda (2):
>  sanity: Verify that user isn't building in PSEUDO_IGNORE_PATHS
>  sanity.bbclass: sanity check for if bitbake is present in PATH
>
>Lee Chee Yang (4):
>  gdk-pixbuf: fix CVE-2020-29385
>  p11-kit: upgrade 0.23.21 -> 0.23.22
>  cve-check: replace Looseversion with custom version class
>  cve_check: add CVE_VERSION_SUFFIX to indicate suffix in versioning

Hi Anuj,=20
Please consider this patch too, so the above patches works on openssl=20

[PATCH 2/2] openssl: set CVE_VERSION_SUFFIX=20
https://lists.openembedded.org/g/openembedded-core/message/147339?p=3D,,,20=
,0,0,0::Created,,openssl,20,2,0,80153216








>
>Oleksiy Obitotskyy (1):
>  dtc: improve reproducibility
>
>Ovidiu Panait (1):
>  timezone: upgrade to 2021a
>
>Peter Bergin (1):
>  buildhistory.bbclass: avoid exception for empty BUILDHISTORY_FEATURES
>    variable
>
>Richard Purdie (3):
>  gobject-introspection: Fix variable override order
>  pseudo: Update to include passwd and file renaming fixes
>  image_types: Ensure tar archives are reproducible
>
>Ross Burton (2):
>  core-image-sato-sdk-ptest: these images need ptest
>  ovmf-shell-image: image is only buildable on x86-64
>
>Tomasz Dziendzielski (5):
>  externalsrc: Fix parsing error with devtool non-git sources
>  devtool: Fix file:// fetcher symlink directory structure
>  externalsrc: Detect code changes in submodules
>  lib/oe/patch.py: Don't return command stderr from runcmd function
>  python3: Use addtask statement instead of task dependencies
>
>Yi Fan Yu (2):
>  oeqa/selftest/cases/tinfoil.py: increase timeout 10->60s
>    test_wait_event
>  strace: increase ptest timeout duration 120->240s
>
>zhengruoqin (1):
>  ca-certificates: upgrade 20200601 -> 20210119
>
> meta/classes/buildhistory.bbclass             |   2 +-
> meta/classes/cve-check.bbclass                |  14 +-
> meta/classes/externalsrc.bbclass              |  16 +-
> meta/classes/image_types.bbclass              |   2 +-
> meta/classes/sanity.bbclass                   |  12 ++
> meta/lib/oe/cve_check.py                      |  60 ++++++
> meta/lib/oe/patch.py                          |  14 +-
> meta/lib/oeqa/selftest/cases/cve_check.py     |  36 ++++
> meta/lib/oeqa/selftest/cases/tinfoil.py       |   6 +-
> meta/recipes-core/ovmf/ovmf-shell-image.bb    |   1 +
> meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
> .../python/python3/CVE-2021-3177.patch        | 191 ++++++++++++++++++
> meta/recipes-devtools/python/python3_3.8.5.bb |   6 +-
> meta/recipes-devtools/strace/strace/run-ptest |   2 +-
> .../sudo/files/CVE-2021-23239.patch           |  62 ++++++
> meta/recipes-extended/sudo/sudo_1.9.3.bb      |   1 +
> meta/recipes-extended/timezone/timezone.inc   |   6 +-
> .../gdk-pixbuf/CVE-2020-29385.patch           |  55 +++++
> .../gdk-pixbuf/gdk-pixbuf_2.40.0.bb           |   1 +
> .../gobject-introspection_1.64.1.bb           |   4 +-
> meta/recipes-kernel/dtc/dtc.inc               |   2 +
> ...-Makefile-to-add-CFLAGS-not-override.patch |  36 ++++  ...-use-too-str=
ict-
>timeout-for-validati.patch |  32 +++
> .../gstreamer/gstreamer1.0_1.16.3.bb          |   1 +
> .../images/core-image-sato-ptest-fast.bb      |   3 +
> .../images/core-image-sato-sdk-ptest.bb       |   3 +
> .../0001-certdata2pem.py-use-python3.patch    |  37 ----
> ...0200601.bb =3D> ca-certificates_20210119.bb} |   3 +-
> ...{p11-kit_0.23.21.bb =3D> p11-kit_0.23.22.bb} |   7 +-
> scripts/lib/devtool/standard.py               |   6 +-
> 30 files changed, 554 insertions(+), 69 deletions(-)  create mode 100644
>meta/lib/oe/cve_check.py  create mode 100644
>meta/lib/oeqa/selftest/cases/cve_check.py
> create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-
>3177.patch
> create mode 100644 meta/recipes-extended/sudo/files/CVE-2021-
>23239.patch
> create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-
>29385.patch
> create mode 100644 meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-
>add-CFLAGS-not-override.patch
> create mode 100644 meta/recipes-
>multimedia/gstreamer/gstreamer1.0/0001-tests-seek-Don-t-use-too-strict-
>timeout-for-validati.patch
> delete mode 100644 meta/recipes-support/ca-certificates/ca-
>certificates/0001-certdata2pem.py-use-python3.patch
> rename meta/recipes-support/ca-certificates/{ca-certificates_20200601.bb =
=3D>
>ca-certificates_20210119.bb} (96%)  rename meta/recipes-support/p11-
>kit/{p11-kit_0.23.21.bb =3D> p11-kit_0.23.22.bb} (75%)
>
>--
>2.29.2

