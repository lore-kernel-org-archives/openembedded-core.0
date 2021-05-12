Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.5402.1620818798677944899
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 04:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=H7E2lpCo;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: h1KS/AnBhibRMiTkJ9lvuc3F4WOqqPyFFMPnKISb1gGIdvrb0qhOG+ZE5yAcuxBk9hWUdWPQxX
 NH/gQXmlw+oA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="263609972"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="263609972"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 04:26:35 -0700
IronPort-SDR: j7rwFIepnpWlD7qJk7up/p9WTtSD4jyj3pE426Nz7ClF9It3RWyCJSZocvPZyazShUzkhvAG0w
 GBGbLvR7MR+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="392707433"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga006.jf.intel.com with ESMTP; 12 May 2021 04:26:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 12 May 2021 04:26:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 12 May 2021 04:26:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 12 May 2021 04:26:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgjiRc5lZT5FvGpu0xR4flpEZDlnENjXN2/6dNcPqb9vf6F2EHv5WwxgOW9AjlsaQry25/LvjOM6fJThga81qiXJnGsQgVi5tXXVcQOxncLOO5ckY8HyuP41T5GuXmB1dInvd26HQcDqnaKEbo0DD38+3aErbAi3wuYQPodZf9EB3hc+ynzQqmWSXMDL0BfccUa9pShUsQILtgl29KumdZsjwxtTT4QhDk0VYMMJOOdK7pJW+V7DGRUXS1fvOWe62UNmCG7OBS7SNecLdHQNr9N3ynNvW5dSSIGYLGuaGmLkhmeyQd3ztnBse/nfg/9nK5rLx3HBKNMcBsoRssUPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mu4dfU9x6I4MMBby6+wn2h8fH/CiM0ZH8S5ZbPVX53M=;
 b=VHVGpPGN5ShKCVgs+evwnWz98FzsBKqmVY883QVwvsM/Af36ddrxttL/m9DgwtU6kweGxqD7H7Rm6Cww9iT9KJUrb5rTS3b/FDxt6hrX3gp/g0/1kB9FXGIX0o8Z5YG1mp/FfJZyntjFEoeGERAf18zzEB3oJ/CVXp4NbzyRKN1PUqYApPqFLMiGCSMYcwmCo7sDvpIUb639haVznnEEYx5NfnvgxI55Xtohv6ey4mG+6dkcmVRy3F/X1hOcqX1PJBkwF3yS0WHDkZUGo6jI3OYfkBUiQmj4T2fl196GD73o8jC1mK6fEVfogG6BT27eGi4qYJrnas4rRV0dRcGBfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mu4dfU9x6I4MMBby6+wn2h8fH/CiM0ZH8S5ZbPVX53M=;
 b=H7E2lpCoFR/ki8Sj5RYj4ViBHqbpu8Xo5+ZHwt+eY6dfd4dTbfQsVkUwvutXV99PIw+1mbJA9t7Om3t1SJSZbffNMDH0KMD3fSfzRjw34aFhtO6IQGGHn91eVNldYy49BN/kIQ+5Dk0qvJ0/Gp7Vega+9ROoNpMpdHYtscJ6tVM=
Received: from DM6PR11MB4105.namprd11.prod.outlook.com (2603:10b6:5:5::30) by
 DM6PR11MB3900.namprd11.prod.outlook.com (2603:10b6:5:19a::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24; Wed, 12 May 2021 11:26:32 +0000
Received: from DM6PR11MB4105.namprd11.prod.outlook.com
 ([fe80::448b:c046:6d5d:3395]) by DM6PR11MB4105.namprd11.prod.outlook.com
 ([fe80::448b:c046:6d5d:3395%3]) with mapi id 15.20.4108.032; Wed, 12 May 2021
 11:26:32 +0000
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 7/8] meson: update 0.57.2 -> 0.58.0
Thread-Topic: [OE-core] [PATCH 7/8] meson: update 0.57.2 -> 0.58.0
Thread-Index: AQHXRZyt+r6Tsz6ARUSB/5sZruFt36rftozA
Date: Wed, 12 May 2021 11:26:32 +0000
Message-ID: <DM6PR11MB4105F796CF8133DCFF0D73F9B9529@DM6PR11MB4105.namprd11.prod.outlook.com>
References: <20210510130110.939820-1-alex.kanavin@gmail.com>
 <20210510130110.939820-7-alex.kanavin@gmail.com>
In-Reply-To: <20210510130110.939820-7-alex.kanavin@gmail.com>
Accept-Language: en-SG, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.189.49.89]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3cd30a0-5a7a-4634-aca7-08d91538cb6f
x-ms-traffictypediagnostic: DM6PR11MB3900:
x-microsoft-antispam-prvs: <DM6PR11MB390002A776189867B98FA051B9529@DM6PR11MB3900.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:227;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SVMMEGJnHg5BeWdhZx1PS0f+56o+/3M3+QfUphjfOpA72Ps++2SNfa6BKRGzXlXRkQ0pQON5hUUEo49sxiDR1GcUM26Ch0Glu5GrPGXbfPgyxN8D04g2vdFPKNqkpjuulIwuYw9Q+dCfVetUPyhqbCVYWm5SoZQg+M4G3wXdvNry1x/vtzFr+L4TQqVE7UJ3dKgYq7wicZKzkllyv44Zf3BLZacGQ5l/ijveeskCJOA6fBNqZf5Lnn8Vn+x4r/97bNTtjDujqmCQxHFkw0O2BG+o1lfl4yjdVBAc9lCKIol8di10kjbc0GHmuyN0HPQynEeE4+FKDhritzvLNmbn+uXK/xZkzV6ywjj+0j8cGk5JkacNW5rf4+cfx+QJpwHu44egwyaaxyHmfFGayF+WmhX1ri3qSvYmRFXiw4xOK7hOFFiQG5LxGSHtpncrHhjb2RIUBhxlftl6uVrXmmxOM57tfPf4Em30UHJ8ka8gOomkIJoJCbjagOFzg/s6WzGpv0WU4XrdIPFac01I+mKFifPTFg6P/9o9/YukBeemctwwe4oxGIOFfrUthOvqKFqstSnvXCgmvxVJO2/TrcdMABDQtcg68l2jArVk8V0R/pCTlrTRoAeZz+8xoL+5M6+sIsX8cEtz/6dXCodwkSL8DTWxZh7Dy00gTH/DZaPdwcA6Tgq2AioJG6nYTCTfJ3GtIt8lYdOWDgMSDsajm+0PBjxWyLWfpT5G8dk2m9n7pOE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4105.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(346002)(39860400002)(366004)(478600001)(52536014)(316002)(26005)(966005)(110136005)(15650500001)(122000001)(66946007)(5660300002)(76116006)(30864003)(55016002)(8936002)(83380400001)(186003)(66556008)(7696005)(2906002)(8676002)(64756008)(6506007)(66446008)(9686003)(33656002)(38100700002)(53546011)(71200400001)(66476007)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?AVU38vDsetvu5s/TVt1zBD8u/tbcD3Q2ADW6oX5sZ9CRGjBQhLigegrpCLk0?=
 =?us-ascii?Q?dki4bV6eQZICLo8PP8t3tgvWsWq9tk1VP5A8Sp7VCYZIQKFl5KF73ORR/eot?=
 =?us-ascii?Q?2/0PtdC7omonBC1hyI0DNgVZAIBqdqgH3YSxLW74zqNZIfwBl4/8Yle2XGeK?=
 =?us-ascii?Q?U8gEBv9a7ADbakFqYzyhbdhQMMLtQlJfP+T0sFKpWDOxsAxMJ9ZKa4hbe5f/?=
 =?us-ascii?Q?bn7ZYKIK4EJ05EfX9n+KRBEiL0aUvkGUGDIbIzSGWcGDfXZRplwAF4gJqnv8?=
 =?us-ascii?Q?Ords1YfrEeuYqIWTAM7ip2S3zZfK+6fWHcrQVeRJdF0JONr9DW44NATeZeje?=
 =?us-ascii?Q?ytCzBQ7YX0c77FK7RCUnBtrDsnDh0U8e8/kapvqfR3/FWIcyUoNsA85PTDNg?=
 =?us-ascii?Q?U9PdiYzxbPOfKJFawgdDOqO5XZ+mOQunje26lWnQeE6007vitvM/93qK+4QT?=
 =?us-ascii?Q?Urtn7O50tnTNVOOe9a5VwQrc+rBq3AuAoml1+HJzCZcpT7H+HxwUmxs0paN8?=
 =?us-ascii?Q?VrsHAJD1wZwPGn5CH/EW7X1vHHuaIO6b1OIf3sW/uYzekGDL90BDOJLPFuaz?=
 =?us-ascii?Q?C1tjomXMTfPUpDXmWIpDE173mkMiO4tyP7Ki8M2XWPoAmlbS0ZS4F6ETDqPD?=
 =?us-ascii?Q?dNdpUtP5ckIlIeuZEGB+KtrSmJ9JtEI6kPydbWaFtUWZMCjfngNT1lF09R4e?=
 =?us-ascii?Q?X4puCg5ET7V9+vhTbRHqvOOhQ6wM26uZEKedwsdDIsI/qpg8jEQINJQEgb6+?=
 =?us-ascii?Q?pvfNirU5+6PP9le7FX5AdioX6TUAGN0lKFwHvAs8MJqfEgPwOgMgG6e8etA0?=
 =?us-ascii?Q?/2pYhY2MT3/DvSjM7TejBd8fLDncDaKz5XvMF5uLSFIG4QeTK3XJqBLF4aNO?=
 =?us-ascii?Q?2RfNmay9FY/jrnJCK6NHXY4qpLy5oV1kxxASLFrmTqczS6boDRdya7iH3wNh?=
 =?us-ascii?Q?MIGGJAM7XSVRjyIgDhYyXzB9zQhmrPJpUkwhskVpklrKacDxhpyrkZXDGYqd?=
 =?us-ascii?Q?dFwEuA0FZGm3VzQI9uGwiwQgTJnuoKHltpk2Rl6GecsGygbn2Sqgn46NmYFF?=
 =?us-ascii?Q?91Cn63DdtEgh+BL8Se/Lvh1y/XCdjeli89ZrIrGFwYeoSn4pAbThdFs8XevG?=
 =?us-ascii?Q?zmFLlvybTtVZdkFwrMGyXtjnv9SPU9lufftgDOqa7bK+64Q+mD8E+l2v6y1b?=
 =?us-ascii?Q?V0ZZoAMe071YutL3TKJOdX6oAX7NDTos5Qvw1T0wRwTjiCnNGGSWzKrD0mRU?=
 =?us-ascii?Q?2C+F2ZznAmg2aHm0XYV5He6VgVp2QfXmkT1M0zXKws1wOVxE12SJd2+3oXPz?=
 =?us-ascii?Q?YM0=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4105.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3cd30a0-5a7a-4634-aca7-08d91538cb6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2021 11:26:32.3682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UVN4o31JEBmnYULIglo+7fmJ8CHfw1pKpDdPB0w+FZk8ANIGTvqaIW1rvDqWxfC2qm9zUwVp8vgu2V9v/JA+NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3900
Return-Path: chee.yang.lee@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Looks like this patch failed buildepoxy.EpoxyTest.test_epoxy test

https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/3417/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3416/step=
s/12/logs/stdio



>-----Original Message-----
>From: openembedded-core@lists.openembedded.org <openembedded-
>core@lists.openembedded.org> On Behalf Of Alexander Kanavin
>Sent: Monday, 10 May, 2021 9:01 PM
>To: openembedded-core@lists.openembedded.org
>Cc: Alexander Kanavin <alex.kanavin@gmail.com>
>Subject: [OE-core] [PATCH 7/8] meson: update 0.57.2 -> 0.58.0
>
>Rebase patches; dropped chunks (and cross-prop-default.patch) have been
>removed upstream.
>
>Move native-only patches to all-patches, as they're a pain to rebase
>separately.
>
>Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>---
> meta/recipes-devtools/meson/meson.inc         | 10 +---
> .../0001-Make-CPU-family-warnings-fatal.patch | 18 +++---  ...sues-that-a=
rise-
>when-cross-compiling.patch |  8 +--  ...-not-manipulate-the-environment-
>when.patch | 14 ++---  ...pport-building-allarch-recipes-again.patch | 10 =
++--
> .../meson/meson/0003-native_bindir.patch      | 58 +++++--------------
> .../meson/meson/cross-prop-default.patch      | 23 --------
> .../{meson_0.57.2.bb =3D> meson_0.58.0.bb}      |  0
> ...on_0.57.2.bb =3D> nativesdk-meson_0.58.0.bb} |  0
> 9 files changed, 43 insertions(+), 98 deletions(-)  delete mode 100644
>meta/recipes-devtools/meson/meson/cross-prop-default.patch
> rename meta/recipes-devtools/meson/{meson_0.57.2.bb =3D>
>meson_0.58.0.bb} (100%)  rename meta/recipes-devtools/meson/{nativesdk-
>meson_0.57.2.bb =3D> nativesdk-meson_0.58.0.bb} (100%)
>
>diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-
>devtools/meson/meson.inc
>index 10e7d8a1ce..12a48fc992 100644
>--- a/meta/recipes-devtools/meson/meson.inc
>+++ b/meta/recipes-devtools/meson/meson.inc
>@@ -12,16 +12,12 @@ SRC_URI =3D
>"https://github.com/mesonbuild/meson/releases/download/${PV}/meson-
>${P
>            file://0003-native_bindir.patch \
>            file://0001-python-module-do-not-manipulate-the-environment-
>when.patch \
>            file://disable-rpath-handling.patch \
>-           file://cross-prop-default.patch \
>            file://0001-modules-python.py-do-not-substitute-python-s-
>install.patch \
>            file://gi-target-dep.patch \
>+           file://0001-Make-CPU-family-warnings-fatal.patch \
>+           file://0002-Support-building-allarch-recipes-again.patch \
>            "
>-SRC_URI[sha256sum] =3D
>"3a83e7b1c5de94fa991ec34d9b198d94f38ed699d3524cb0fdf3b99fd23d4cc5"
>-
>-SRC_URI_append_class-native =3D " \
>-    file://0001-Make-CPU-family-warnings-fatal.patch \
>-    file://0002-Support-building-allarch-recipes-again.patch \
>-"
>+SRC_URI[sha256sum] =3D
>"f4820df0bc969c99019fd4af8ca5f136ee94c63d8a5ad67e7eb73bdbc9182fdd"
>
> UPSTREAM_CHECK_URI =3D "https://github.com/mesonbuild/meson/releases"
> UPSTREAM_CHECK_REGEX =3D "meson-(?P<pver>\d+(\.\d+)+)\.tar"
>diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-
>warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-
>CPU-family-warnings-fatal.patch
>index 300797f9ee..bcccfabd17 100644
>--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-
>warnings-fatal.patch
>+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-
>warnings-fa
>+++ tal.patch
>@@ -1,34 +1,33 @@
>-From 198e2de24adf5845e3ba389b533cf43440ee8acb Mon Sep 17 00:00:00
>2001
>+From b64032a2eb1fb760f4ffd5b4b666e2433cf80d39 Mon Sep 17 00:00:00
>2001
> From: Ross Burton <ross.burton@intel.com>
> Date: Tue, 3 Jul 2018 13:59:09 +0100
>-Subject: [PATCH] Make CPU family warnings fatal
>+Subject: [PATCH 1/2] Make CPU family warnings fatal
>
> Upstream-Status: Inappropriate [OE specific]
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>-
> ---
>  mesonbuild/envconfig.py   | 2 +-
>  mesonbuild/environment.py | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py -index
>ba35d16..2d3c34c 100644
>+index c6a4df3..4d58c91 100644
> --- a/mesonbuild/envconfig.py
> +++ b/mesonbuild/envconfig.py
>-@@ -262,7 +262,7 @@ class MachineInfo:
>+@@ -266,7 +266,7 @@ class MachineInfo:
>
>          cpu_family =3D literal['cpu_family']
>          if cpu_family not in known_cpu_families:
>--            mlog.warning('Unknown CPU family {}, please report this at
>https://github.com/mesonbuild/meson/issues/new'.format(cpu_family))
>+-            mlog.warning(f'Unknown CPU family {cpu_family}, please repor=
t this
>at https://github.com/mesonbuild/meson/issues/new')
> +            raise EnvironmentException('Unknown CPU family {}, see
>https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for
>directions.'.format(cpu_family))
>
>          endian =3D literal['endian']
>          if endian not in ('little', 'big'):
> diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py -
>index 756dd81..4d2c2b6 100644
>+index fc9b703..eea8345 100644
> --- a/mesonbuild/environment.py
> +++ b/mesonbuild/environment.py
>-@@ -434,9 +434,7 @@ def detect_cpu_family(compilers: CompilersDict) ->
>str:
>+@@ -436,9 +436,7 @@ def detect_cpu_family(compilers: CompilersDict) ->
>str:
>              trial =3D 'ppc64'
>
>      if trial not in known_cpu_families:
>@@ -39,3 +38,6 @@ index 756dd81..4d2c2b6 100644
>
>      return trial
>
>+--
>+2.24.0
>+
>diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-
>that-arise-when-cross-compiling.patch b/meta/recipes-
>devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-
>compiling.patch
>index 471f1500da..ce90e515da 100644
>--- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-
>arise-when-cross-compiling.patch
>+++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-aris
>+++ e-when-cross-compiling.patch
>@@ -1,4 +1,4 @@
>-From d3ef01a4208a801acad380a4aaceb6a21f8fa603 Mon Sep 17 00:00:00 2001
>+From 2f9c59e0489e569c5382404667c10f5c200a72ad Mon Sep 17 00:00:00
>2001
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Date: Fri, 4 Aug 2017 16:16:41 +0300
> Subject: [PATCH] gtkdoc: fix issues that arise when cross-compiling @@ -
>20,11 +20,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>  1 file changed, 4 insertions(+)
>
> diff --git a/mesonbuild/modules/gnome.py
>b/mesonbuild/modules/gnome.py -index bcf77b9..6a4b472 100644
>+index dc2979e..c9ff9bd 100644
> --- a/mesonbuild/modules/gnome.py
> +++ b/mesonbuild/modules/gnome.py
>-@@ -974,6 +974,10 @@ This will become a hard error in the future.''')
>-             args.append('--{}=3D{}'.format(program_name, path))
>+@@ -1053,6 +1053,10 @@ class GnomeModule(ExtensionModule):
>+             args.append(f'--{program_name}=3D{path}')
>          if namespace:
>              args.append('--namespace=3D' + namespace)
> +        gtkdoc_exe_wrapper =3D
>state.environment.properties.host.get('gtkdoc_exe_wrapper', None)
>diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-
>not-manipulate-the-environment-when.patch b/meta/recipes-
>devtools/meson/meson/0001-python-module-do-not-manipulate-the-
>environment-when.patch
>index eb0e90dbdd..fdadc6869b 100644
>--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-
>manipulate-the-environment-when.patch
>+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-
>manipu
>+++ late-the-environment-when.patch
>@@ -1,4 +1,4 @@
>-From 689e28c49b85311f93f39df70cbee702fc44afb6 Mon Sep 17 00:00:00 2001
>+From 2264e67d7c2c22ca634fd26ea8ada6f0344ab280 Mon Sep 17 00:00:00
>2001
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Date: Mon, 19 Nov 2018 14:24:26 +0100
> Subject: [PATCH] python module: do not manipulate the environment when
>calling @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin
><alex.kanavin@gmail.com>
>  1 file changed, 12 deletions(-)
>
> diff --git a/mesonbuild/modules/python.py
>b/mesonbuild/modules/python.py -index 07be318..b770603 100644
>+index 422155b..aaf5844 100644
> --- a/mesonbuild/modules/python.py
> +++ b/mesonbuild/modules/python.py
>-@@ -71,11 +71,6 @@ class PythonDependency(ExternalDependency):
>+@@ -70,11 +70,6 @@ class PythonDependency(ExternalDependency):
>                  old_pkg_libdir =3D os.environ.get('PKG_CONFIG_LIBDIR')
>                  old_pkg_path =3D os.environ.get('PKG_CONFIG_PATH')
>
>@@ -26,9 +26,9 @@ index 07be318..b770603 100644
> -
>                  try:
>                      self.pkgdep =3D PkgConfigDependency(pkg_name, enviro=
nment,
>kwargs)
>-                     mlog.debug('Found "{}" via pkgconfig lookup in LIBPC
>({})'.format(pkg_name, pkg_libdir))
>-@@ -84,13 +79,6 @@ class PythonDependency(ExternalDependency):
>-                     mlog.debug('"{}" could not be found in LIBPC
>({})'.format(pkg_name, pkg_libdir))
>+                     mlog.debug(f'Found "{pkg_name}" via pkgconfig
>+lookup in LIBPC ({pkg_libdir})') @@ -83,13 +78,6 @@ class
>PythonDependency(ExternalDependency):
>+                     mlog.debug(f'"{pkg_name}" could not be found in
>+LIBPC ({pkg_libdir})')
>                      mlog.debug(e)
>
> -                if old_pkg_path is not None:
>@@ -39,5 +39,5 @@ index 07be318..b770603 100644
> -                else:
> -                    os.environ.pop('PKG_CONFIG_LIBDIR', None)
>              else:
>-                 mlog.debug('"{}" could not be found in LIBPC ({}), this =
is likely due to
>a relocated python installation'.format(pkg_name, pkg_libdir))
>+                 mlog.debug(f'"{pkg_name}" could not be found in LIBPC
>+ ({pkg_libdir}), this is likely due to a relocated python
>+ installation')
>
>diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-
>allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-
>Support-building-allarch-recipes-again.patch
>index f6175a194c..dcc1ce9c27 100644
>--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-
>recipes-again.patch
>+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-
>re
>+++ cipes-again.patch
>@@ -1,19 +1,18 @@
>-From ac1021a3abf612e8be9b19eecb97062e0c314701 Mon Sep 17 00:00:00
>2001
>+From 656bf55fed01df2d2e2ad6d9d9887173cb16b85c Mon Sep 17 00:00:00
>2001
> From: Peter Kjellerstedt <pkj@axis.com>
> Date: Thu, 26 Jul 2018 16:32:49 +0200
>-Subject: [PATCH] Support building allarch recipes again
>+Subject: [PATCH 2/2] Support building allarch recipes again
>
> This registers "allarch" as a known CPU family.
>
> Upstream-Status: Inappropriate [OE specific]
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>-
> ---
>  mesonbuild/envconfig.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py -index
>2d3c34c..b9e7908 100644
>+index 4d58c91..ff01ad1 100644
> --- a/mesonbuild/envconfig.py
> +++ b/mesonbuild/envconfig.py
> @@ -36,6 +36,7 @@ from pathlib import Path @@ -24,3 +23,6 @@ index
>2d3c34c..b9e7908 100644
>      'aarch64',
>      'alpha',
>      'arc',
>+--
>+2.24.0
>+
>diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
>b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
>index ed85116c4f..89257b9e05 100644
>--- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
>+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
>@@ -1,4 +1,4 @@
>-From 1546e1f95a119175b7a4e4272a26dd85505e5ede Mon Sep 17 00:00:00
>2001
>+From 30e97d4090a3d3f5b7ddcaf27cfa17f3c8c1d462 Mon Sep 17 00:00:00
>2001
> From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> Date: Wed, 15 Nov 2017 15:05:01 +0100
> Subject: [PATCH] native_bindir
>@@ -18,23 +18,22 @@ Signed-off-by: Ricardo Ribalda Delgado
><ricardo.ribalda@gmail.com>
>
> ---
>  mesonbuild/dependencies/base.py | 19 +++++++++++--------
>- mesonbuild/dependencies/ui.py   |  6 +++---
>- 2 files changed, 14 insertions(+), 11 deletions(-)
>+ 1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/mesonbuild/dependencies/base.py
>b/mesonbuild/dependencies/base.py -index cd77b4b..7e3f338 100644
>+index 14380d4..d0c443f 100644
> --- a/mesonbuild/dependencies/base.py
> +++ b/mesonbuild/dependencies/base.py
>-@@ -192,7 +192,7 @@ class Dependency:
>+@@ -179,7 +179,7 @@ class Dependency:
>      def get_exe_args(self, compiler):
>          return []
>
> -    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[=
str,
>T.Any]) -> str:
> +    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[=
str,
>T.Any], use_native=3DFalse) -> str:
>-         raise DependencyException('{!r} is not a pkgconfig
>dependency'.format(self.name))
>+         raise DependencyException(f'{self.name!r} is not a pkgconfig
>+ dependency')
>
>      def get_configtool_variable(self, variable_name):
>-@@ -280,7 +280,7 @@ class InternalDependency(Dependency):
>+@@ -267,7 +267,7 @@ class InternalDependency(Dependency):
>              return True
>          return any(d.is_built() for d in self.ext_deps)
>
>@@ -43,7 +42,7 @@ index cd77b4b..7e3f338 100644
>          raise DependencyException('Method "get_pkgconfig_variable()" is =
'
>                                    'invalid for an internal dependency')
>
>-@@ -658,8 +658,11 @@ class PkgConfigDependency(ExternalDependency):
>+@@ -645,8 +645,11 @@ class PkgConfigDependency(ExternalDependency):
>          return s.format(self.__class__.__name__, self.name, self.is_foun=
d,
>                          self.version_reqs)
>
>@@ -57,16 +56,16 @@ index cd77b4b..7e3f338 100644
>          p, out, err =3D Popen_safe(cmd, env=3Denv)
>          rc, out, err =3D p.returncode, out.strip(), err.strip()
>          call =3D ' '.join(cmd)
>-@@ -685,7 +688,7 @@ class PkgConfigDependency(ExternalDependency):
>-             env['PKG_CONFIG_LIBDIR'] =3D new_pkg_config_libdir
>-             mlog.debug('PKG_CONFIG_LIBDIR: ' + new_pkg_config_libdir)
>+@@ -674,7 +677,7 @@ class PkgConfigDependency(ExternalDependency):
>+             if key.startswith('PKG_'):
>+                 mlog.debug(f'env[{key}]: {value}')
>
> -    def _call_pkgbin(self, args, env=3DNone):
> +    def _call_pkgbin(self, args, env=3DNone, use_native=3DFalse):
>          # Always copy the environment since we're going to modify it
>          # with pkg-config variables
>          if env is None:
>-@@ -699,7 +702,7 @@ class PkgConfigDependency(ExternalDependency):
>+@@ -688,7 +691,7 @@ class PkgConfigDependency(ExternalDependency):
>          targs =3D tuple(args)
>          cache =3D PkgConfigDependency.pkgbin_cache
>          if (self.pkgbin, targs, fenv) not in cache:
>@@ -75,7 +74,7 @@ index cd77b4b..7e3f338 100644
>          return cache[(self.pkgbin, targs, fenv)]
>
>      def _convert_mingw_paths(self, args: T.List[str]) -> T.List[str]:
>-@@ -905,7 +908,7 @@ class PkgConfigDependency(ExternalDependency):
>+@@ -894,7 +897,7 @@ class PkgConfigDependency(ExternalDependency):
>                                        (self.name, out_raw))
>          self.link_args, self.raw_link_args =3D self._search_libs(out, ou=
t_raw)
>
>@@ -84,7 +83,7 @@ index cd77b4b..7e3f338 100644
>          options =3D ['--variable=3D' + variable_name, self.name]
>
>          if 'define_variable' in kwargs:
>-@@ -918,7 +921,7 @@ class PkgConfigDependency(ExternalDependency):
>+@@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDependency):
>
>              options =3D ['--define-variable=3D' + '=3D'.join(definition)=
] + options
>
>@@ -93,34 +92,3 @@ index cd77b4b..7e3f338 100644
>          variable =3D ''
>          if ret !=3D 0:
>              if self.required:
>-diff --git a/mesonbuild/dependencies/ui.py
>b/mesonbuild/dependencies/ui.py -index d897d76..a598d2e 100644
>---- a/mesonbuild/dependencies/ui.py
>-+++ b/mesonbuild/dependencies/ui.py
>-@@ -325,7 +325,7 @@ class QtBaseDependency(ExternalDependency):
>-         self.bindir =3D self.get_pkgconfig_host_bins(core)
>-         if not self.bindir:
>-             # If exec_prefix is not defined, the pkg-config file is brok=
en
>--            prefix =3D core.get_pkgconfig_variable('exec_prefix', {})
>-+            prefix =3D core.get_pkgconfig_variable('exec_prefix', {},
>-+ use_native=3DTrue)
>-             if prefix:
>-                 self.bindir =3D os.path.join(prefix, 'bin')
>-
>-@@ -528,7 +528,7 @@ class Qt4Dependency(QtBaseDependency):
>-         applications =3D ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
>-         for application in applications:
>-             try:
>--                return os.path.dirname(core.get_pkgconfig_variable('%s_l=
ocation' %
>application, {}))
>-+                return
>-+ os.path.dirname(core.get_pkgconfig_variable('%s_location' %
>-+ application, {}, use_native=3DTrue))
>-             except MesonException:
>-                 pass
>-
>-@@ -538,7 +538,7 @@ class Qt5Dependency(QtBaseDependency):
>-         QtBaseDependency.__init__(self, 'qt5', env, kwargs)
>-
>-     def get_pkgconfig_host_bins(self, core):
>--        return core.get_pkgconfig_variable('host_bins', {})
>-+        return core.get_pkgconfig_variable('host_bins', {},
>-+ use_native=3DTrue)
>-
>-     def get_private_includes(self, mod_inc_dir, module):
>-         return _qt_get_private_includes(mod_inc_dir, module, self.versio=
n)
>diff --git a/meta/recipes-devtools/meson/meson/cross-prop-default.patch
>b/meta/recipes-devtools/meson/meson/cross-prop-default.patch
>deleted file mode 100644
>index 772395e879..0000000000
>--- a/meta/recipes-devtools/meson/meson/cross-prop-default.patch
>+++ /dev/null
>@@ -1,23 +0,0 @@
>-meson.build files that use cc.run() in native builds can silently fallbac=
k to
>-meson.get_cross_property() in cross builds without an exe-wrapper, but
>there's -no way to know that this is happening.
>-
>-As the defaults may be pessimistic (for example, disabling the support fo=
r a -
>feature that should be enabled) emit a warning when the default is used, s=
o
>that -the recipe can explicitly set the cross property as relevant.
>-
>-Upstream-Status: Submitted
>[https://github.com/mesonbuild/meson/pull/5071]
>-Signed-off-by: Ross Burton <ross.burton@intel.com>
>-
>-diff --git a/mesonbuild/interpreter.py b/mesonbuild/interpreter.py -index
>3c3cfae0..10e741ae 100644
>---- a/mesonbuild/interpreter.py
>-+++ b/mesonbuild/interpreter.py
>-@@ -1890,6 +1890,7 @@ class MesonMain(InterpreterObject):
>-             return props[propname]
>-         except Exception:
>-             if len(args) =3D=3D 2:
>-+                mlog.warning('Cross property %s is using default value
>-+ %s' % (propname, args[1]))
>-                 return args[1]
>-             raise InterpreterException('Unknown cross property: %s.' % p=
ropname)
>-
>diff --git a/meta/recipes-devtools/meson/meson_0.57.2.bb b/meta/recipes-
>devtools/meson/meson_0.58.0.bb
>similarity index 100%
>rename from meta/recipes-devtools/meson/meson_0.57.2.bb
>rename to meta/recipes-devtools/meson/meson_0.58.0.bb
>diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.57.2.bb
>b/meta/recipes-devtools/meson/nativesdk-meson_0.58.0.bb
>similarity index 100%
>rename from meta/recipes-devtools/meson/nativesdk-meson_0.57.2.bb
>rename to meta/recipes-devtools/meson/nativesdk-meson_0.58.0.bb
>--
>2.31.1

