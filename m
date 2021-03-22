Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.10167.1616403453457548065
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 01:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=xgna/ITV;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: l42XLgQf/aqmlvrGLM+C2qDDmpVtfc9sfDkKaswrwclQ2qf09g7nFid5Cr+W22okUsQKfhUT0H
 R4LThbPna+ag==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190323571"
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; 
   d="scan'208";a="190323571"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2021 01:57:32 -0700
IronPort-SDR: +2QFK1pC5GbNC5EwrvNGDpFBnmfWD5igbqRkz5iad8Jgoyty6fWucPJzYR5LAmycDNRk5bKCrf
 L/dQDPMrXj1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; 
   d="scan'208";a="442076644"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2021 01:57:31 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 01:57:31 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 01:57:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Mon, 22 Mar 2021 01:57:30 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.51) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Mon, 22 Mar 2021 01:57:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpLQfEBQFWllpCbx6PbC8Kk6mxWcmv885uP3WHSOsnso7dK/JrQiphMg9PF6282C1Zd7c+c/D7hyRmGGL/uWuSuZ1BONv/J72ippgcDER8xoFOzjGO1FrsS1AZ4Y5a0gE9pHEdgXbWj0nnM+3zEHmU2qFnKWvYUIBrteFWGY8YiPQHVJMTlJPeU3cfx21DXPoUr8y3M3TT+i6UkuNyMsJbX2d0ahvkZMFu01CX4tGoiZtvPDHtKjfWlIK7bgteMLJEwBZjzoTvjhCwEvR7EXE5Kfgv1jaYVATiZvrfBoDcKKmt+3NNWF8DfQwzKy7MGXwN/hJnhz+oaFoioXJ0YISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIdtMp+lxTOwVv1yyzXWtVsvkV6FZBLeVPzeH99jxH4=;
 b=JrKBFj9LRhy6ifaqD7NfrD2orqGs5+q+KR8G6bHKwp7bhS8e8XP6DcaRWP+ji54NhYZZ/oGCXKkZpeLwBaicY1zIl9PO01xVZY3u7w2qR6qQpHEeiD4bWhfW512Qpgv9mSixaa8K3Qz4aorR/+5YFGd5IcqvmSbfQUJOQeDjQvRo+Rqyjci2FGMeJeins7ublp9jAO9Sn1AYFwtvo5Aozu6+dAeeTqqmRrdzx2T7lk65kCdQo0xvbB7byt3kSfbJ26u7hrOfJl+QPsm7jHXedDW+KonQwD1puV52koSxtC7DUUF+vPooXPEusCGohTAArWafhksB7So5/UglrMiwFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIdtMp+lxTOwVv1yyzXWtVsvkV6FZBLeVPzeH99jxH4=;
 b=xgna/ITVyqMZygofqk9h4bKjEsAY+9Trls1JilPdsFC46Aiuifsc7GqAEWFB8VvYQf56H5lKgCelqXdHTTTCpKuczV4nT9js2dVYn2UOg2kUXVYJMPWKJR1NTy3k3oS9WYCMeIasz/wMCKHeNGQYycAjf4yXLA2KAlttEqtsb9I=
Received: from DM6PR11MB4105.namprd11.prod.outlook.com (2603:10b6:5:5::30) by
 DM6PR11MB4531.namprd11.prod.outlook.com (2603:10b6:5:2a5::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Mon, 22 Mar 2021 08:57:27 +0000
Received: from DM6PR11MB4105.namprd11.prod.outlook.com
 ([fe80::4817:b500:8d20:d405]) by DM6PR11MB4105.namprd11.prod.outlook.com
 ([fe80::4817:b500:8d20:d405%5]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 08:57:27 +0000
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Steve Sakoman <steve@sakoman.com>
Subject: Re: [OE-core] [gatesgarth][PATCH 01/30] initrdscripts: init-install-efi.sh install extra files for ESP
Thread-Topic: [OE-core] [gatesgarth][PATCH 01/30] initrdscripts:
 init-install-efi.sh install extra files for ESP
Thread-Index: AQHXCTQ+NCfrkPT1g0i6Q7Hmoi+zPqqPvgyg
Date: Mon, 22 Mar 2021 08:57:27 +0000
Message-ID: <DM6PR11MB41059D92EEB011F17928471EB9659@DM6PR11MB4105.namprd11.prod.outlook.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
 <47cf6739ab182e66d1b73cd99bab961d06f41336.1614009417.git.anuj.mittal@intel.com>
In-Reply-To: <47cf6739ab182e66d1b73cd99bab961d06f41336.1614009417.git.anuj.mittal@intel.com>
Accept-Language: en-SG, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [219.92.186.165]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41cdfb2d-baaa-442e-8e19-08d8ed1084a0
x-ms-traffictypediagnostic: DM6PR11MB4531:
x-microsoft-antispam-prvs: <DM6PR11MB4531032E7BCE3C8F737EC35CB9659@DM6PR11MB4531.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:356;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AL5Y0e7PG5JX+DqsHcTOAOsrvJEfz0ZRvmTkOB3oIiMO6U+zDR/E9EJvolz6/UzCuyk5aZwPFjMcNOr8KEidr/H6ygh9fQFcbAo6gfQDBAwRQEkLx0UvjIfW9wb/1SEJ65qkBDceUOgZqZoqNtxre52o61V+VdHV6F0rqv7LYGPtJhkDOhnTS7jmk4LBTl+7HuumP02fe5IPeBfyY31RefidweVX5FzQQjWJpeTvaER8ZV6zi5OIFFWm+/IBCx/MuepcsWXzoDqFVtoXK3b68PPUdqZXzysHP2QcgAWfhq7WaYXl+BlqgJaoOBdVvUdkAkgWdXtFbB8xOYLY9nPKgqPbUQVdoNxskI9mFM0ikgyhOgL2TbHsqzpg1C5Qie05YOdC08FktRIEnP1MDClSk08dk7eLBrZZIie30DF38BtpQkQ+PsERgqvOD+K+5jiD7MvFzINTtYrE0LKawANBO0f/YG84CXhJyHTVGXTdf/ardMIY1pk8d70t76T/t/hAwaqUYf4E1p8YBcGP9zlXcNNp3YATtzE14oYz/q09FkHvJNxzKPpZRphp/qo/D8ckW5LSWnwaQWSQ9r7EiLO2pk2EtW1364+AdW4Vk/cJ0lSfK9STZKgT8aFtMc9l239ocOSmXP/L9OyK/XgX8Ob4nUn8lT0lZZPQVZHf4jpVCvw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4105.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(136003)(376002)(396003)(346002)(8936002)(66476007)(316002)(110136005)(38100700001)(66446008)(83380400001)(55016002)(6506007)(186003)(5660300002)(52536014)(2906002)(66556008)(86362001)(8676002)(71200400001)(64756008)(7696005)(26005)(478600001)(66946007)(33656002)(9686003)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?D1XHt30Tp8KR5dMKSsmkxf77QSNg2otBXx+FHGzHNc94ekviYgL0zYOkfbFl?=
 =?us-ascii?Q?f8/mWBPukq5iymgZ/Ep4lWvPD5irMp52K3EXfAmSMrycWSkpoCkLJJskOCZI?=
 =?us-ascii?Q?0g3MT4F/TEsV0gqbiCbyj65VQXPrz4FbEm9Tl+fbh+YULe392A/jsP3I3A7n?=
 =?us-ascii?Q?pNHeVS6fDsv4vzt/+kdDQwJsBjngda1msdzwU11eK+UFD8z1jctz7VlH2iWB?=
 =?us-ascii?Q?T1r7EpjvlmSwRU8Q1/NWEILNdG6GYvqqRYEWI9gZoLZrCHEIsQAkOEKPbDKd?=
 =?us-ascii?Q?Nfs90I7u5zyjPDIuCeySHOHa8AZ0xYmiKm/X2es3cOMpJLEt26UKiJ0VTDwK?=
 =?us-ascii?Q?JqkLHKNhbNYA0z+TTpXXVbRulZ4Mvt5Tg7jHCT8+mOVPAX0g/d7GjVaM8Cfh?=
 =?us-ascii?Q?VqAkEhtw8igq4afB7QK6ywq8CqLIcuIbMeUwnq+4fb8UnEo8QcCkGfS1Aj+D?=
 =?us-ascii?Q?Hb4b9Dl+ueMVG5JomQmniJRK2wmYQ/93UcvLetdkQkmAhymITsQRX2Lntt91?=
 =?us-ascii?Q?yNvseGpal9etA8ggTmrWE/dimSt+vUhGb5oDJBdKkcKbLCcDF2Ll4BmrWtpC?=
 =?us-ascii?Q?JJ7q6ZfNguVrM4DmoIzQGu8V/TwjKLd5MHn07FBd91R/0PGafewwgdjbJcqS?=
 =?us-ascii?Q?W9Vt+SpERC059biUgXbpX72o5v0Eg9I4Mgx1JcxEe2ho4hgWlzWOSgkdE6qu?=
 =?us-ascii?Q?YL3H/VHl2Ma+uHiKp/kxNEYEB1jCu1E0myuxtqT/0WcQ3dhw0KF4aJRtn9dC?=
 =?us-ascii?Q?OO/39ZCH1I48pig96n1IAqkzrKCWltvo1LWZ89lLvLeEqjDV04qtWvb5BDPM?=
 =?us-ascii?Q?iXTLiJQv5hpURNqam8YPL7dFQBbF8W+S8ZFUykeVnkiUTKCyMeuFefv0yX1A?=
 =?us-ascii?Q?Dc1rGFfkfIRvxqVOovwpw6o9HsgAiQ50cWGivzrEiab36B8GfmQHUsW2iljC?=
 =?us-ascii?Q?luzMncJEFukhgLaksNf89CWJuR3x+J2XD4lgC6yNDkIMqPy9ksshJwjpL7g8?=
 =?us-ascii?Q?0wyR6QpFspXNwwft2DvXCheEhG2gkF29G33fh74UT3kRWaWOiJ07a/XAM4g1?=
 =?us-ascii?Q?pJ6qjGshygMDnxdX1zID+LXndtVRHhaUPg4MTGybXHgw4mS9AL6B7nIp53fT?=
 =?us-ascii?Q?UGhRfLTDe8fkUFybOL+YaxPckajvzNpMUQpglzmFEwoDGiV4po7jejQ09UFM?=
 =?us-ascii?Q?jY2NyoRdc5qmFNR6K5Un25c2bNwVxE6VquZjei8R5kfeXVD69/K/pa/3TLAs?=
 =?us-ascii?Q?svJQgo1/LGKUN6SrGF0iIYnBsGCdHVMPYbsX8+HVx396Im3kNb1cMSyLrtcm?=
 =?us-ascii?Q?nkdxhqJzrHAKFCG3iWBwGEe0?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4105.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41cdfb2d-baaa-442e-8e19-08d8ed1084a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 08:57:27.2020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oosKU6ydlDXtcGpDrapbO0H7P+JKvf0lwIUeJEP4ajx9tSVLgqUxIGx5f6vvkepbx8AG8Bl+H4QpwliJ5611CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4531
Return-Path: chee.yang.lee@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,=20

Can this backport to Dunfell too?

>-----Original Message-----
>From: openembedded-core@lists.openembedded.org <openembedded-
>core@lists.openembedded.org> On Behalf Of Anuj Mittal
>Sent: Tuesday, 23 February, 2021 12:00 AM
>To: openembedded-core@lists.openembedded.org
>Subject: [OE-core] [gatesgarth][PATCH 01/30] initrdscripts: init-install-e=
fi.sh
>install extra files for ESP
>
>From: Chee Yang Lee <chee.yang.lee@intel.com>
>
>Currently the install script copy only few hard coded item while setting u=
p target
>ESP, kernel artifacts, all .efi in EFI/BOOT, grub & boot cfg and loader.co=
nf.
>While ESP can be much complex, eg: contain multiple initrd.
>
>Add a ESP folder to carry any other files to setup onto ESP.
>
>Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
>Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>(cherry picked from commit 6eaca9cf20c42501fba27dea3a6446bad948e859)
>Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>---
> meta/recipes-core/initrdscripts/files/init-install-efi.sh | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/m=
eta/recipes-
>core/initrdscripts/files/init-install-efi.sh
>index b6855b5aac..f667518b89 100644
>--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
>+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
>@@ -279,6 +279,11 @@ fi
>
> umount /tgt_root
>
>+# copy any extra files needed for ESP
>+if [ -d /run/media/$1/esp ]; then
>+    cp -r /run/media/$1/esp/* /boot
>+fi
>+
> # Copy kernel artifacts. To add more artifacts just add to types  # For n=
ow just
>support kernel types already being used by something in OE-core  for types=
 in
>bzImage zImage vmlinux vmlinuz fitImage; do
>--
>2.29.2

