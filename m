Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web09.44175.1628898707430846352
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 16:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=v/fo3z5I;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10075"; a="215675638"
X-IronPort-AV: E=Sophos;i="5.84,320,1620716400"; 
   d="scan'208";a="215675638"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2021 16:51:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,320,1620716400"; 
   d="scan'208";a="591369367"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga001.fm.intel.com with ESMTP; 13 Aug 2021 16:51:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 13 Aug 2021 16:51:43 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 13 Aug 2021 16:51:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 13 Aug 2021 16:51:43 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 13 Aug 2021 16:51:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgRXa1NZJNGr77//bwPt5CxLxREVIqfdD3oLdhP/HaH+pZ8R23Q0hdNg8egnDOf80gGODXhUFSVNd69XsPygY3Gyya/sxCBNV/I9wrKc/r9ab9n1cAdX68iDE+A4JCsHEiZqF/ppu0PqHj/ibZSJHU8ltsIubv3AEc7u9rN+yLwX3r8Nv7SxOoapiHtgL6Ta+LsfOJA5fztNJ6uTnkR/Q8q70wUSmv3cDVKTPCtg56TgvutiVVCU8oHiV+dJOrQe6lxLosXrog3/Pw69iEDhyImlHTpXqFSwlx3rsa5G8Y7vSxuAAg1kgWFJ17kTltE9PFcZlTkeia73w1TIyzYJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXeI63mrUqbYX/BmdE3Baxgbzo3uYe1t3u+vg8Dwal4=;
 b=awcWlMOLey83AnezeB6WsI2/58Er9jnzSOL3Q1ng8YQ4jmQ+SYP+p+t92rRMkyjC7KNTbC+Sqm+LdAUnsKGC+X8pUv/f82UEEtswB5DYL5Iw0L74EFJ62NxntKr0hFQnZ9dzsK1kDas/SPw76PiiRfI7umq57Ty157X0IvPGRMVpAZppFx9Pi/Ix0TtdGdMEHvQWf5HWpznIZ7qxIfzDbzKKJ0ElXvcrn6n3YllrVkBytsAxlVveXHNq2oMHICnPmFHmUpu499c9fhW0k/qHDmFRUeFMlGSVcKvlZcla08XTsQcN0P+Cv4WXczl0NhrnvgdVJv8bucA9Ce2O5fKaZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXeI63mrUqbYX/BmdE3Baxgbzo3uYe1t3u+vg8Dwal4=;
 b=v/fo3z5I9Tom9TyVCZc+QBecUkSJFwJF4/habhmRqAtUqm1FLlUJb8ItGPRs82eIFqRFX4ibG+l00GE2gjbFU/bwybz5jNQamOzoNI7ol9eHUDKJ56pDdolgvm5SiEr33lJZYYWXrdC5v5nOaH+yEMzSkQmUkM2hyTmdRGmGKPg=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BY5PR11MB4353.namprd11.prod.outlook.com (2603:10b6:a03:1b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Fri, 13 Aug
 2021 23:51:39 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::d7c:227b:e92b:611c]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::d7c:227b:e92b:611c%9]) with mapi id 15.20.4415.020; Fri, 13 Aug 2021
 23:51:39 +0000
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [hardknott][PATCH 00/23] pull request (cover letter only)
Thread-Topic: [OE-core] [hardknott][PATCH 00/23] pull request (cover letter
 only)
Thread-Index: AQHXjoS53JwggcZGeUuDAw8bMse9WatyHxbA
Date: Fri, 13 Aug 2021 23:51:39 +0000
Message-ID: <SJ0PR11MB48963EE49A4F5A94259A0B25F8FA9@SJ0PR11MB4896.namprd11.prod.outlook.com>
References: <169A30C9C6286DDA.29477@lists.openembedded.org>
In-Reply-To: <169A30C9C6286DDA.29477@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74f362c6-5a46-47c6-4b42-08d95eb54b55
x-ms-traffictypediagnostic: BY5PR11MB4353:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB435345848335281F4142BB2BF8FA9@BY5PR11MB4353.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8esYfFxzj24AwfGOj2RFhzNsxSf62s6pSZ55U6kGnEpEi/5g4RBdT3ZpruibEF9TtP/SCpgGjnisQeU0ycG2f6CO883kBxXgvpPJ5l5T7wmjI8FtL2Lneb/e7NdZYC06EWQd9wRX0GTClOdncXa5qly7A/OrUfKzN2GOxOv8lVetvRtwdaLuLhB2ZLmWp3X65n2MtTHdtx3tN1f+zwTdfJbWOhXqx93UI/u3Z4Qps56g2Tz4sGzDKzIq/pgX2b79ARuta81rcaDXvZxTmqRXgrrrSP6lbgbfhP20b9Un0eRVBmfaGReaPIg+MQzNkNnrj/9wxO5Ino3VKXwamykZsutNLo2DZQ5ZqL52AQtV8mbNWzi4vGNkqD9oulJQ8HU8PnUYuJO3l4u8AmNegqemTi+KRdlw4zmY13k5wDqtaSFN+Qb7W2ZMuycFjIQ65kAKDzu++37iG1RLphB7dcun/xZ8ovQG00VCnv6bbIrlprXQsbqwsgAtBtObpbz9jl+b2EFlt0K+lCqE8OVKsOsDak8efzvehDM9DyyVBaalEOi0mG44N+ukBpELaY7NhQkX+fireZPh9VmxsCShODrwnIXLmJYgEqKK5vFE7oTI/CH7sBSYygIR7YVVnBUV/NbRm58WwCcgn66SRRH+1j9hDEm6rJBAdUKTeEnKH7xNWJmdocI32yqI1llmooOMQmITFe0vO/zcdtk6UoV4cYklMw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(33656002)(316002)(5660300002)(38070700005)(8676002)(2906002)(9686003)(66946007)(6506007)(66476007)(53546011)(122000001)(8936002)(66556008)(64756008)(86362001)(66446008)(7696005)(52536014)(186003)(110136005)(71200400001)(478600001)(38100700002)(83380400001)(55016002)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OMwSNyEoxjQR9q2w0fjS/QLJGCaKYPL48aePLTNtlTKEcGTcKqPIVzaeuHMB?=
 =?us-ascii?Q?ms+pKHgzIp39y4pXUqx6M3qLl2MAYY84r8xlo+usys5xI5CPARDuPXnBu2r1?=
 =?us-ascii?Q?SLd63n9OEWKHZH6Q9aB7J2ESLd8cXyPyXbjjyXkI8d6tsAjhpREToVGG+5MK?=
 =?us-ascii?Q?zYvG+eMab7e1JKPMLasc3neALTUWggHgx4erzNyQLbzGrBvo4WP+U4Xe3SeS?=
 =?us-ascii?Q?3zJGIW7PsBXrnkk3jZbXgu2khxZHqJh0yyix90MV8LVtuZ+oS4cZAIiMPkpn?=
 =?us-ascii?Q?y0q1TfZ7FX3yFp8TsOjd0ooP/vVMkk9Tqfa8INWzYE02b3yYWQugOLy3H3Vk?=
 =?us-ascii?Q?Dj/Fln1F/TFzGmazRwZzR/n7ZPpaqxbkQ1GmaRzs4v31ZUTv2UQHh05Hk/oB?=
 =?us-ascii?Q?vU9pimN8vyeaNbM0Eji5/BiKA78pbFRXPmkCCtErNy8F4S8aERJMS76DeTKb?=
 =?us-ascii?Q?3+DBtQcAyt1geiZKrF/IyeVmHMEY6adHM8nG2HsNlvCXOldwtX5PITFklej8?=
 =?us-ascii?Q?jUSCRaEAu92BiVdkzq1yXpZraPE0lER00u71O2izHGf6r/sTkKIUXuJMFmeY?=
 =?us-ascii?Q?amJpoyEcsSurppDk92dLuh7CwxzeLtTTBV5MkOcpiOipgn/3IIfxiAI15kiz?=
 =?us-ascii?Q?be1sx7gAOAfYnBmaalh0qgZi3tLEUME2kQr1QXKHWt1nJUIVNQKVsB02HWBJ?=
 =?us-ascii?Q?tmFk3HVLZbrut7bty4FUVNTIWpDuL0p8jVNhuwmAki5zxiAZW4h7gVwu5aAQ?=
 =?us-ascii?Q?oIOuI4D/z+k1jgOv50/CUbmBmo3K9/w0qWaVa+fihkLN8xc4mPybnRPeK62h?=
 =?us-ascii?Q?3MMcBEVfgcFNM45W+8SrzC+euj6PUCguaBGN664eWsLsOsViVcLsyFeQ/AcF?=
 =?us-ascii?Q?yXRj9pk4RW8gbLytWl50bbtCjqB4C0BCMRt2lP/SZ/DZT1RftU5icLqq3qnN?=
 =?us-ascii?Q?X7Zb+F2Oh63fp8rY9KzsxiWdgF4kCYDi40F23InNgaaweyZ+gzkNu8tKjP8a?=
 =?us-ascii?Q?dBTepoyw4p8rWfOI3dxMtEEAQPk0B36PYCklMoFOkCc8QQ1m0WtHP2aIJNJn?=
 =?us-ascii?Q?w8+sGWoKCbnAVUizjpQrRadHXoIe4KJ+KNX/6VUV86AdCLBnqi+mhOtn7HMn?=
 =?us-ascii?Q?RcsF8QtuxziThheAa0BMhj70fipwgO/bfe2T53v74f1hmF5T2+BSDE3mMhbU?=
 =?us-ascii?Q?ym2fikBlv2tiMyTgFAglLowfwoy1jTAK8AR3nmhu4WGCwZHI7Baw1r88ABa7?=
 =?us-ascii?Q?bMHPfXwv1rk2H+OhWPs7PEFwT63kXyW4NxfEgk7zgurhfQUCgTQKHBzuYz6p?=
 =?us-ascii?Q?XlYYWU9qSfoLZaAIkx65+mDB/10cAsSOvLPAp8kgCVrpiHHpDQqyzG2WFpDP?=
 =?us-ascii?Q?k+BPSbWWuBZtSGLan3YP/I/oJlhy?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f362c6-5a46-47c6-4b42-08d95eb54b55
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2021 23:51:39.4687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xQGyDPLunNZZ+6sSvM0A3cNRMCG3zFVn/8oSfgSWRrFOQ18t+56ryq1zQXrcYjOzj1QweIJR46cFNQyPZ4/ENg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4353
Return-Path: anuj.mittal@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Anuj Mittal
> Sent: Wednesday, August 11, 2021 03:44 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [hardknott][PATCH 00/23] pull request (cover letter on=
ly)
>=20
> Please merge these changes.
>=20
> Thanks,
>=20
> Anuj
>=20
> The following changes since commit 2fd915eda136e20ab52baea6bb908d08ef8f5c=
bc:
>=20
>   oe-setup-builddir: update YP docs and OE URLs (2021-07-31 17:56:12 +080=
0)
>=20
> are available in the Git repository at:
>=20
>   git://push.openembedded.org/openembedded-core-contrib stable/hardknott-=
next
>=20
> Alexander Kanavin (2):
>   devtool: print a warning on upgrades if PREFERRED_VERSION is set
>   nettle: update 3.7.2 -> 3.7.3
>=20
> Bruce Ashfield (4):
>   linux-yocto/5.10: update to v5.10.53
>   linux-yocto/5.4: update to v5.4.135
>   linux-yocto-rt/5.10: update to -rt47
>   linux-yocto/5.10: enable TYPEC_TCPCI in usbc fragment
>=20
> Chen Qi (1):
>   zstd: fix CVE_PRODUCT
>=20
> Joe Slater (1):
>   util-linux: fix CVE 2021-37600
>=20
> Jon Mason (1):
>   parselogs.py: qemuarm should be qemuarmv5
>=20
> Khem Raj (1):
>   stress-ng: Drop defining daddr_t
>=20
> Lee Chee Yang (2):
>   aspell: fix CVE-2019-25051
>   qemu: fix CVE-2021-3527
>=20
> Matthias Klein (1):
>   runqemu: Fix typo in error message
>=20
> Michael Opdenacker (3):
>   cve-check: fix comments
>   cve-check: update link to NVD website for CVE details
>   cve-check: improve comment about CVE patch file names
>=20
> Mingli Yu (2):
>   curl: fix CVE-2021-22925
>   curl: fix CVES
>=20
> Richard Purdie (3):
>   sstate: Fix rebuilds when changing layer config
>   license: Exclude COPYING.MIT from pseudo
>   oeqa/runtime/cases/ptest: Increase test timeout from 300s to 450s
>=20
> Ross Burton (1):
>   qemu: fix virtio vhost-user-gpu CVEs
>=20
> hongxu (1):
>   createrepo-c: fix createrepo-c failed in nativesdk
>=20
>  meta/classes/cve-check.bbclass                |  19 +-
>  meta/classes/license.bbclass                  |   2 +-
>  meta/classes/sstate.bbclass                   |   1 +
>  meta/lib/oeqa/runtime/cases/parselogs.py      |   3 +-
>  meta/lib/oeqa/runtime/cases/ptest.py          |   2 +-
>  meta/recipes-core/util-linux/util-linux.inc   |   1 +
>  .../util-linux/CVE-2021-37600.patch           |  38 ++
>  .../createrepo-c/createrepo-c_0.17.0.bb       |   4 +-
>  meta/recipes-devtools/qemu/qemu.inc           |   9 +
>  ...ix-memory-disclosure-in-virgl_cmd_ge.patch |  43 ++  ...ix-resource-l=
eak-in-
> vg_resource_crea.patch |  41 ++  ...ix-memory-leak-in-vg_resource_attach.=
patch |  48
> ++  ...ix-memory-leak-while-calling-vg_reso.patch |  50 ++  ...ix-memory-=
leak-in-
> virgl_cmd_resource.patch |  58 +++  ...ix-memory-leak-in-virgl_resource_a=
tt.patch |
> 49 ++  ...ix-OOB-write-in-virgl_cmd_get_capset.patch |  49 ++
>  .../qemu/qemu/CVE-2021-3527-1.patch           |  42 ++
>  .../qemu/qemu/CVE-2021-3527-2.patch           |  59 +++
>  .../stress-ng/stress-ng/no_daddr_t.patch      |  32 --
>  .../stress-ng/stress-ng_0.12.05.bb            |   2 -
>  meta/recipes-extended/zstd/zstd_1.4.9.bb      |   2 +
>  .../linux/linux-yocto-rt_5.10.bb              |   6 +-
>  .../linux/linux-yocto-rt_5.4.bb               |   6 +-
>  .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
>  .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
>  meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-  meta/recipes-
> kernel/linux/linux-yocto_5.4.bb  |  22 +-
>  meta/recipes-support/aspell/aspell_0.60.8.bb  |   4 +-
>  .../aspell/files/CVE-2019-25051.patch         | 101 ++++
>  .../curl/curl/CVE-2021-22901.patch            | 453 ++++++++++++++++++
>  .../curl/curl/CVE-2021-22924.patch            | 298 ++++++++++++
>  .../curl/curl/CVE-2021-22925.patch            |  50 ++
>  .../curl/curl/CVE-2021-22926.patch            |  79 +++
>  meta/recipes-support/curl/curl_7.75.0.bb      |   4 +
>  .../{nettle_3.7.2.bb =3D> nettle_3.7.3.bb}      |   2 +-
>  scripts/lib/devtool/upgrade.py                |   3 +
>  scripts/runqemu                               |   2 +-
>  37 files changed, 1537 insertions(+), 87 deletions(-)  create mode 10064=
4
> meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-vhost-user-gpu-f=
ix-
> memory-disclosure-in-virgl_cmd_ge.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0002-vhost-user-gpu-f=
ix-
> resource-leak-in-vg_resource_crea.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0003-vhost-user-gpu-f=
ix-
> memory-leak-in-vg_resource_attach.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0004-vhost-user-gpu-f=
ix-
> memory-leak-while-calling-vg_reso.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0005-vhost-user-gpu-f=
ix-
> memory-leak-in-virgl_cmd_resource.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0006-vhost-user-gpu-f=
ix-
> memory-leak-in-virgl_resource_att.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0007-vhost-user-gpu-f=
ix-
> OOB-write-in-virgl_cmd_get_capset.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3527-1.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3527-2.patch
>  delete mode 100644 meta/recipes-extended/stress-ng/stress-ng/no_daddr_t.=
patch
>  create mode 100644 meta/recipes-support/aspell/files/CVE-2019-25051.patc=
h
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22901.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22924.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22925.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22926.patch
>  rename meta/recipes-support/nettle/{nettle_3.7.2.bb =3D> nettle_3.7.3.bb=
} (96%)
>=20
> --
> 2.31.1

