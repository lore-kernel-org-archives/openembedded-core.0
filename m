Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.31485.1612762164959551305
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 21:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=hZ674RN+;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: kKQy1ME/ljNA63ynlLwBDskEpE5j0Rutfp51U0eIVHWX7sxc5z8wYQEhs/LbOQwWQ9uLU8Hj0j
 JPkh7jcmVwPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="181726622"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; 
   d="scan'208";a="181726622"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2021 21:29:23 -0800
IronPort-SDR: seGMS4jCbebENm2cW8oqd+aFolElyaoUxq2siVEDPNnRUTsCoVMXhHs4Mal354zDnGUxIvvXu0
 RWadr7gN+qlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; 
   d="scan'208";a="435493315"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by orsmga001.jf.intel.com with ESMTP; 07 Feb 2021 21:29:23 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 7 Feb 2021 21:29:23 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sun, 7 Feb 2021 21:29:23 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 7 Feb 2021 21:29:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvjbPfSWnEy+zxRdTHVzKkdIHOYvyaGG0w3dXYwFgTvNg7HgdBD4Yx/epySfV62uFHwyhEuhBU7aLUyS0dI/W+afuWQptIBtdcOBr0cZYlV6Q53/8Vtj/ojfzzgiU9wwykiJsq5EHZ0BE+GYVa1CADkJI8218ne6CFoFcj9twx+TPZmpyK6Zs1M27wyH9plnPAM8Ge/3QNJQ2fLqa9hwj9wqvH1Kzv3dr+CPAjbix6jUgczrD88K/Z7Q/dtV+52U/FICbZQL92sZqaNr8rODqJ2U3B72e9TOiqq4IfccK3cKhJMkFqmlBToIwWU2xnEhtj+K/AQhoKWGDZGHqnsb1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SMB1NHPsT6ZVsY2QtVPU9qn39lp4GgVUSNmSbxWyHs=;
 b=bcZltg1eRc7Syhr0JbhKwzWLefpH8lewd8iBQTtxI7x6F0GRgTu75tPMsDggb1NHhHFfxX3iN9N5Kh7qc14VdQejyq9y5LxoQeX+LRGlsvuk5mSSfdM5FfkuD8vF27zxIQcRL8wyqe1EJktj9N/+H5RcDGtKtzmxfU8f35yOYDrEcfe92CLtarh/S45NfqL8NdvkdPZRaKf3u5nH0TepgaGLWh/yt3Vc8JZ+oegpUZJEXxGsEd2rLuyWkLdSJytbKgrHNDpJ9o1KBpJHx2rFoZ4B/Ma6B/mgOCldQmcJT3tD19t/Qg4pxS51b+Lzde1zez7CAncI3QKJXS1zKc1DoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SMB1NHPsT6ZVsY2QtVPU9qn39lp4GgVUSNmSbxWyHs=;
 b=hZ674RN+xypi+gZJUi5Ripur3QA12xfZ3bMoQbfgvKOGfvoeJe2LtCx2VuI2kXMbAntCAgklF/nAINZwi83taens62x9hMZsyx9jtHRMajPX99fQuTAxDeW5mVtlAmAHyVTvCwkKBOTzvX8knghmCVVqZZXxGcFwJs/RUn0BqR0=
Received: from DM6PR11MB4105.namprd11.prod.outlook.com (2603:10b6:5:5::30) by
 DM6PR11MB4737.namprd11.prod.outlook.com (2603:10b6:5:2a2::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.25; Mon, 8 Feb 2021 05:29:16 +0000
Received: from DM6PR11MB4105.namprd11.prod.outlook.com
 ([fe80::4817:b500:8d20:d405]) by DM6PR11MB4105.namprd11.prod.outlook.com
 ([fe80::4817:b500:8d20:d405%5]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 05:29:16 +0000
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] initrdscripts: init-install-efi.sh install extra files for ESP
Thread-Topic: [OE-core] [PATCH] initrdscripts: init-install-efi.sh install
 extra files for ESP
Thread-Index: AQHW+SZURnFAosRe5UijI1u+Rgak2qpNwydg
Date: Mon, 8 Feb 2021 05:29:16 +0000
Message-ID: <DM6PR11MB4105B67987BB5BE8AC6035ABB98F9@DM6PR11MB4105.namprd11.prod.outlook.com>
References: <165FD7EBB6BFC42D.25123@lists.openembedded.org>
In-Reply-To: <165FD7EBB6BFC42D.25123@lists.openembedded.org>
Accept-Language: en-SG, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.189.29.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60089024-af8a-4839-293d-08d8cbf27a52
x-ms-traffictypediagnostic: DM6PR11MB4737:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB4737F085B5445792062B3DD3B98F9@DM6PR11MB4737.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rPWG0tmO6KistoE5y9ENcucABi/GfZxP0oYtnADq4UlDR6Xh1xpMA+1TZwcD6QACYJH4CcrqsG7Je8Uvic5dz4V8aqARTrbiGxRlPVd6wKcqqvkJZd+rTf/qd/5oAkyxPXeZqK+YrIK3r73wsCuqQi/sDmuO8GB3X22JZl0um11JUn14tfuQr/HLnUAY/e2ki4LwAvFqK5KSYWuNbEkv8+Gj+k6Nv3pJ1fwgenwkzt2+glfogepoF1XFZJ+IDBh2RASRrmyhFJjHFWrhlGCegVy2xXIbfsbIIkTi+om5buGNerLA9jSlrmfs9LI3e4MCoqiD2b+0jmenJHbo3KZ9mWOPXYPWXPRYkE4eUyYY07ychmoqMfMYWJWgk+QM5tWvI979nSzThiUi0oAdJ22g8V6eHYZbEebHLrH2bkHcWddOurBo9BWxdA6bh8ER2dIuhC8lvEkNsOlRD44a7frrXOKHhDqHLTDAp0Sh+jk0KCa3ncz5tOyWJCZzs2LMNuKb6h2viayG9bAoYJsxOzfgbg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4105.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(376002)(39860400002)(136003)(346002)(33656002)(316002)(186003)(2906002)(8676002)(9686003)(83380400001)(8936002)(55016002)(52536014)(26005)(5660300002)(64756008)(110136005)(478600001)(66946007)(66476007)(66556008)(6506007)(71200400001)(76116006)(66446008)(86362001)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Fg8iry3W+ToOIuNqmj6SLQBIaSWtAYs5RadrFocZaRVQzEtQ+8tOMzgcYAM2?=
 =?us-ascii?Q?AGAHuj2eHh9u/r0BR1o+eaiwMIcUbN86AD9T2JfS2W4w44k5OjKpg/gLarG3?=
 =?us-ascii?Q?/EvUILjnlBkT+euKA0aqqdv0+mBPscwDYmNDA+Kmrul98uNjgFrKF31Dfyls?=
 =?us-ascii?Q?pFx/kDvGoYs4UIQvtOTDu6oiGtXc3VPacm9tjBoK5RSO9+IwCfgKShdnNzsm?=
 =?us-ascii?Q?LRbtl4o6DM6/biNhxGGyV2x8IPjsVpuwu37ug/Yd9ec5hZ1cfxgdZTEcQ6hC?=
 =?us-ascii?Q?rGnEzPgNEnZxh9rb3vp122p/UweVac63oCp4CxcyiYNbOHhgi1y5Ms5ons+1?=
 =?us-ascii?Q?r0PEQ4rf7HdqGj3VSbKTDrqJi+GHXitDuKNdXga0L3dy/fUPaClpEcvi4OjB?=
 =?us-ascii?Q?xI8S07bC0Yv4Rc3LoStudevCV+tY5qtWCSEtX6LCbttVbnsVihB4aR9ukjS3?=
 =?us-ascii?Q?eRuetMwL+8wyUnTXNNvBCjPUmaG/31Dn5Yl6vVF060jAHWvYzYkBNYUtucKG?=
 =?us-ascii?Q?FCJsmdW+ZzohUZxT1TADDUHhNxncegPBaIos///izoJLpXZam+fgBZpxMEYH?=
 =?us-ascii?Q?GQltkVfOS4lik1xg7JuNo5hUIq3pX/CeuKlfPZHO5tI03vJIt2Aj3wQMm/vi?=
 =?us-ascii?Q?Hkf96lMmrEeXXW3Ww29wAVvYJB/EFyAvwei7bal7hVlh0471TVpwtqeDcYly?=
 =?us-ascii?Q?7lAVwBYEB8bzbdIYeeTLg9djtuBHqvS0Vhz/4lKuNcRMD8/yKNWFeGRPZJBm?=
 =?us-ascii?Q?gXOAqPn2XG3UXTVjCz7mEE5+lIfbENBNh+XV7i7s3z6CoJXCf5Jwm+Bd+3VQ?=
 =?us-ascii?Q?nGTIA/doyN1iIUwtycdmwvwR4jCAQmYRyCSIwi7UQNBIk/UuTZqLGrIr4JFn?=
 =?us-ascii?Q?hejpZzszjV2AyqF+xsbVKmgjBklO4PxZRoROEn9ksna+VOjURAs+i4kYnHDu?=
 =?us-ascii?Q?xOpDsmuD9SlnQGF5+Yuc1+6TZpmJAOTlG93kizwih7zrRNqYidH2oLIR515J?=
 =?us-ascii?Q?A2JbjCYeOPoyE2DU8MiZ2kr9sxsCKz850ZCqCCzS71TWjZ1Q3g3O/KIAFNCT?=
 =?us-ascii?Q?M3IIMOros2HxxVlw4cjmg5aIHN/qEQLQ5xDD64JdviA8WGf5LMmY3KXb6r5d?=
 =?us-ascii?Q?BkUXaGiMu/ca4G0X/UeZ5zV2AN8+mWgUPtsUS+M8KogelyrT8EpQ+5S7Y9Qd?=
 =?us-ascii?Q?rQtvdhNODj2DVtf1Az9K7lZR9ceGbqn3x86Pk5kuLmSU1xLbkBeUSuDpt9Eq?=
 =?us-ascii?Q?ZcnRRB5VEgrZ6lEAdFsF81u0wrMR20vL3HI0G1UYaFr8k1ZcOcoitHNUmJQj?=
 =?us-ascii?Q?tCI=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4105.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60089024-af8a-4839-293d-08d8cbf27a52
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 05:29:16.5985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9dP8Rce1jRh3l01kHEhbjbxAWPp4SZEs1p/c3PsUAilHJ9+r8nguGMeb71fyXFTccUfCmZ3h27bDTLQPpSv9sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4737
Return-Path: chee.yang.lee@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

>-----Original Message-----
>From: openembedded-core@lists.openembedded.org <openembedded-
>core@lists.openembedded.org> On Behalf Of Lee Chee Yang
>Sent: Tuesday, 2 February, 2021 1:43 PM
>To: openembedded-core@lists.openembedded.org
>Subject: [OE-core] [PATCH] initrdscripts: init-install-efi.sh install extr=
a files for ESP
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
>2.17.1

