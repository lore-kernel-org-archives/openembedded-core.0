Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D512E6815F
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 10:03:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8986.1771322598058279804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 02:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=n4cNZgyJ;
 spf=pass (domain: intel.com, ip: 192.198.163.9, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771322598; x=1802858598;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=5tK+DXE+SsWEno1+eyE31FnjxJj6YJIsdv+pLvgwJ10=;
  b=n4cNZgyJHdc8iytOUWKY9JO+g9WE+nqD1y5AlePKjnH2eEZksELdsVdR
   oHpB06jQPZ8S0mnpf/eFMh41ab2Bj7MYCHMLv1qKJFhaWq3ZOAZMQPT8+
   cUsbGkY4Gwy6Um8CbUdwBIpuPCnbkS5WoF2wACOUx2geXw5WKv1pdhuIO
   h3e7r9kBiS+vYPgnFXuuuGOACN+/H/Lj9IWLxkKXN4suriuJnb2Xk2GJ7
   rRiIjmYCrFhOrkYaW/9X4T+yWtskwZCfdY2lWBVjPB2cv+w/JJqYyQFQt
   VKRkEbUwJvQb1qP0uH3TB7nDtL6gPFdlqBpZKf6Vt7/6LfFrHYj76QpNY
   g==;
X-CSE-ConnectionGUID: N/6LT4UPRhme/YO9Gfj5HQ==
X-CSE-MsgGUID: bQn070rpQhGzsKyz9cxZ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83110778"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="83110778"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 02:03:17 -0800
X-CSE-ConnectionGUID: DFXP2q1NQB63oH/oI86mZA==
X-CSE-MsgGUID: p8XMaUsVQbGVgOE9BK1aPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="213940289"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 02:03:17 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 02:03:16 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 02:03:16 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 02:03:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhSkWEUHXzWlavgw5vukguqY98i51iywW7yRkqierpNsUh12Ufl1lKjgoOCoKTpZiuFD4uYILE9SVvTwhrLjhIFAwt1GkBQha9KI8SvnSqrQr5WvTPICBqgNfQthprJCDFK5HIrc036j67gZ3PZeicxXklOvqMonHNlveE3BsweJCpNY9MYZ58SGbyWKScXXPWaeUiG741Pd1OuDTzUsD2nWz6h4EO3F+ye+Z4qxMFczrhNVF9j5D04v5R9hJCGTpel4UvINpET5EnVlvqw7eGUjUhfczHFnHhPysmFGztiCA/UH81NbpKUad/Q28Un8poi4b/YIeupjNZVMfzpfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkQeKcDPNgLcG9Vqa3qaXJXQs221dQkaL1RX0i5kFjg=;
 b=hfQRzN4nLayGYZsccJ0OLEuiBW7y6RX6ZsJNwSAk8pD8+NkJeTf4qcH0CkrN8ElNBYzQdzcMuQIc3jua+odM+CXK2B4ly0K7um3JEHuF0UliJ8tlrgiLkFcd629cbdLH/zpCIr2Nlnq8WV2EdUrjpKicGpED+5KEyyuq1m9cMzVnoXBHSU0DIiyvS58frCCxzFxm6mVjlcPPpIHL0dxl4tSc05Ht6qqmk39l26r1jAzHQmO+1x24QhSqxm7Ec9ivZXLAd3zu/8dhVxlPC9r0ldJ9W62o9G6RSW/DxAbmVtPbDa5N3D6jJOsmvM5cH4Lqa1J20iVP1zevHbYUMMG4QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by SJ2PR11MB8588.namprd11.prod.outlook.com (2603:10b6:a03:56c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 10:03:14 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%7]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 10:03:13 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.16.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.16.rc2)
Thread-Index: AQHcn2P/fOsZuyzCX0W5udpuUN6sqLWGqPdQ
Date: Tue, 17 Feb 2026 10:03:13 +0000
Message-ID: <SN7PR11MB70181409902E431E5217A0F4F46DA@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019c6759c149-effcd63a-6c4d-496b-9059-b54370d7c341-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019c6759c149-effcd63a-6c4d-496b-9059-b54370d7c341-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|SJ2PR11MB8588:EE_
x-ms-office365-filtering-correlation-id: b603fbc6-8c09-4e8b-6f8d-08de6e0bc3aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|7053199007|7142099003|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?B3GdFrVQNdfwP9arFnTSB2qyc5aSYA4CW1qg4Gr+Rg9Dr8uqfwH1L74OVMCy?=
 =?us-ascii?Q?LnFwaEq9OaG0hWnVgglyypB+zXrN8ajZeVuCh25gU0qM47muwd4wjzIqG3Ir?=
 =?us-ascii?Q?p4VX0c/zLXIaToHM98u64j2atgJ6OfJMCS0f5+u58wy/WluxpJfn1b5u/liu?=
 =?us-ascii?Q?5rlQ6aq9xNa/hfSSzNVxl7R8DLoSxB6S0ZPrqdXr5kwhcJZ6aDHQiOCP77kj?=
 =?us-ascii?Q?o/SaA22uQhHxPZCZZuUGFuiI8FvyKA9Gt98B4+n8z5Un/PjDdI7gHSWAhiGg?=
 =?us-ascii?Q?Brf8Y1pTlT1UHpEtCacF+7e7JHNaXP17UaIzb8gZa80t6PHdk3ApNuG6HOGA?=
 =?us-ascii?Q?rs04VuRSSHZVQswg7HQbWlfkCO+p1OMmSWb7Ga/1KoLqWJm3wg2WFn5dDC78?=
 =?us-ascii?Q?OAjaD7wrJ70cGse97qEi3a/41g1huJuOVbZFBLUiie//4YOniOv8aTsveAIO?=
 =?us-ascii?Q?NWLNTz3WYJzF/K2iQTPOMD/68tZBOlAYtw+TGJ8QXLSVt/s6Ok9G/Qj9DwQ2?=
 =?us-ascii?Q?WgG8Ke0+LLcLP+lnN1KTWfHPvD+Gs6if6O83UsZoUGw18lMKzhMkJa1MQ5p/?=
 =?us-ascii?Q?AIEZFPxIXTaGFqJyvkTd7FZzsFruPzeEjtfNwW2dr2TOUIYuof+rVxRBewjp?=
 =?us-ascii?Q?mJjPZ5hrMeMVE4irWm73tfW9Pn/Vpx6NfCy3mVE4PP3bag10K0vpx98zaZ4O?=
 =?us-ascii?Q?AZMEwbUVRoS5mG/RqEwL0P7RNbZU/fwwKjk2Sa4QAcWDMQlIscrkZma2Sgbu?=
 =?us-ascii?Q?xfYD0KayqW4nZq2mHo1fCW5msqEvmUimBuJ1lU9IvSlL/HHe6/GQ8NhnGfvK?=
 =?us-ascii?Q?mX5SBxrEPAx8l5vq9nfjPo2tSTOeABoRMBIZJFL0+DByOZVw4UtMnEQocB/k?=
 =?us-ascii?Q?TnlH26TkZEHjtwIv4BJsdoxe167k+RyaxASgu4VFPOTtTSWw1+tPLxPp4Bit?=
 =?us-ascii?Q?u9PXhnWUtPxfz83YJEAUy/CHO/pGCgeo6bHaqRhKbsTmZU3gEY7P8BxIj4Qn?=
 =?us-ascii?Q?lDJ+0hMlZMaC/iVPtQN18+k6mbn7mefzRZMyuGIL96qrESJlaShboxnGK7To?=
 =?us-ascii?Q?3juUSWiH84MzSymR6rt4dhlT7SSAtxfjYoGjIhpZSJgU6OJFueetQmgGoGFi?=
 =?us-ascii?Q?Z2njh5g/2PJmHuK39xfVyn0beWAmGoL5rAUwYVneZT1P6NMaabYdKS/NkqU1?=
 =?us-ascii?Q?dlwvJSuSjHKXlLtlePG28mm2IB3+1xdO3L2Ou+QghfGAE36LyV781aTAzOx2?=
 =?us-ascii?Q?eMXxojlQAEnbJfynGXQQfIG6TZOV1EMhq9GfuvRy5nGcxDJUIkI9yww+f1nr?=
 =?us-ascii?Q?wlpCE4kkPzgEssk5moY8ukv2+5gUGAcx/zdAoumrOBIknd+N+7uTol63WqXc?=
 =?us-ascii?Q?ka6fxCmiwOqugiU/MW/F63Advz0EE+4D46XTuTBdWSCBV70PMHO9Ci4Ovbeg?=
 =?us-ascii?Q?Pk9KvN1q5lKyecFuNaKRaANe0ytEmOW9TP9E6Lsu2KelRt6Uv0UN9nBgLdXh?=
 =?us-ascii?Q?ZKUew3hoxacAhIukmdrCKlDrDDOVo8ZIXCY0eeAFfTADW4JY1IZZlql19PgT?=
 =?us-ascii?Q?L+8VIKqoGRxHSC4r756P0jTzW2HdrhGExSpEFOQk?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(7053199007)(7142099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xDDMxtMiJwhtVmoHfkgRsadN0VPegwjcABiuVPW0ZXXzq3uslDbpk/0quKc8?=
 =?us-ascii?Q?7ncASbB1dh9kRiOOeQPP4FyRMqF9aMfxcH8/F8qjdm8kzMTU/zI0IHK2hPsU?=
 =?us-ascii?Q?czQxYBx0CyjJbAQXQfneItZq6UZu+5JK7rUW7fgqjUdph2wjaDXgBkGBziGh?=
 =?us-ascii?Q?sPEuTheQMXqfTndk9wRRqmsZ6OAzN4G8EFWo+76sX1Xc3QXTZ2vod6x5ws4T?=
 =?us-ascii?Q?JmYDdh5r9iR6CSj+0ilGyiwk5dr5PWMmLjfgKzcH6WIjCsfvb2Dg7Vjr8jJy?=
 =?us-ascii?Q?jKVbD60jaBZ/qWFElLU/Y4uykHvG1XPxi22B2O9uBNMlxkDA+vsL48FjdlAe?=
 =?us-ascii?Q?0mlx3uaMhugX4PLb5SvL2b71L3yMFIKyzDIjqxZWKQcVtG2J58xh4+xjpiCx?=
 =?us-ascii?Q?kbAePP6bQ2SJvu9oOcK027a0mfhCzdRVRouN4P52gtVEpOJM/PqcWKCzArwT?=
 =?us-ascii?Q?aZ4k+Jwqt8kd/YHrUMUhYthrNjMW9fB+hSx/aBJudoiHH0LR9X8iC3kDA2GI?=
 =?us-ascii?Q?lg3P7zN8waowtiBBtJ+fIXKFh7ktzHBlBjGD79hqe3W20LUFIy8+7/7nSw8b?=
 =?us-ascii?Q?649GFdBgCIxSh2MhyImArUw5uTnbhJd4dtWCORXiqxW+VYsQYTHjOkiKjKQ6?=
 =?us-ascii?Q?uGb3m88UM9bfTLQJ9Bxfw0rO9bnsz3pjanAK0MVuJI/pInTKsZmkLj6H0MG1?=
 =?us-ascii?Q?YeCVuAZ9EOV5FsvayoVYxtjEbINCwls8QX9RqI4QWou6gvs1d3Z+ucgib/U4?=
 =?us-ascii?Q?bEeq9JxVJOU9B0Iy9o+eQ+i1NMh2MoraXCPeNWXhT9H1P3i+sD4q0OD8CVRG?=
 =?us-ascii?Q?JKiEFsdG1p/m8l/nPCn0+h9tYD+H5cM0odFuTgWOE4Nz5sc4OFo4Xh5isLpi?=
 =?us-ascii?Q?Fete0o9LKz7FmFEHq3Qs5xl1KiiWNx/MwBVqO7UjcJtH4MhkO+NaQjaf6XCB?=
 =?us-ascii?Q?zCpyjT5hDM4uLIdHTTzjI361kfpaYryKO1y7lyVKOqxb9Pnfe9TC7NiOeFDT?=
 =?us-ascii?Q?natwEArlIhZH1AJhpHsEtT6U5jyPE5Z8z0nqXiSPVZ3kz/nHkpylAu1Hgj3W?=
 =?us-ascii?Q?brDNukilLt0LxCdfe7S5am6EuniRCElimYLH3+Pwxv3V9olTBo6E1Bx07uf8?=
 =?us-ascii?Q?DEafFOE0+vy6oiixcoetuNMUzGmrhLUlkZp/5xDYDwvJPm30A22yDc6JNQRb?=
 =?us-ascii?Q?aJOvVj3lznMEQtzOQ70M3QPvxluEtUfrfjqJ4Ao0jzK3CCFWZ/WrE4C2OqGQ?=
 =?us-ascii?Q?hpnOC43Rcyk5NTYdBSBJOm6IzOmQ6ev0w4uLOQUN6mKaFSXTIicggbydDWyD?=
 =?us-ascii?Q?VL9hsr/kKOD1891Kd4R7RySbffjYi3f252ugLqgCZuCAc12KfLQyXehra7M+?=
 =?us-ascii?Q?z32GNuAUfP0NBI67siE0f01y0U/v3laTSwJmWkmMjEWwsuoa3FGPTTqcAqq0?=
 =?us-ascii?Q?Cr+DXcRholIggESOEJhI8fEt+eS42OhN/fmMpJLAetnFLhD9B/dqUWAat46w?=
 =?us-ascii?Q?V5e+addnMvzEXGNZKk+Vacbu009SC+zrWkCEHo8Ra4hMwRu9bj9tziPKIIDz?=
 =?us-ascii?Q?Gxu78dGSFqL0ndi1RwVK7r5pnEJEQWEzigmW5o2aT2Bbt4t/NGzadnT61iCN?=
 =?us-ascii?Q?BLiGtPGGV6HL3FKrjjTu/0mV74hihVyKiF3ZfgPZ9TSx8V671CaZV2derPoI?=
 =?us-ascii?Q?8aqYWxd/bXynSZccySotXSpXmWQeIpItB+pYXFpKQcKqUthJ/rheQ4YClaQ5?=
 =?us-ascii?Q?XAL1WI0ZKw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b603fbc6-8c09-4e8b-6f8d-08de6e0bc3aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 10:03:13.9286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4toiq7rpjG0czbgoyMEtMx5vSCueB89KBg/AcIgcCh0loMEpwyrXnvRZ8YHAX6uRJEn9XvufyA0s8az+dQz/EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 10:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231236

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.16.r=
c2. We are planning to execute the following tests for this cycle:


OEQA-manual tests for following module:
OE-Core
BSP-hw


Runtime auto test for following platforms:

MinnowBoard Turbot - 32bit
Meteor Lake-P
Alder Lake-S
Raptor Lake-P
Beaglebone


ETA for completion: 25/02/2026.


Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 16 February 2026 22:18
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.0.16.rc2)


    A build flagged for QA (yocto-5.0.16.rc2) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.0.16.rc2


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3228

    Build hash information:=20

    bitbake: 10118785e4a670bce4980e1044c0888a8b6e84af
meta-agl: 8611917335f6d1f5b29ea495c8f4c2c914183e8a
meta-arm: a81c19915b5b9e71ed394032e9a50fd06919e1cd
meta-aws: 1a9605b6c4787bf20fc90c8801c36822760b4bc9
meta-clang: 613362523f3bf85ff4862e2f1f00113b8d2028be
meta-intel: 5d153e35b4e752505efeae368f188fac5e31cf33
meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
meta-openembedded: 7a5075cef77b5f7af454e9868e1d0019f2fd1394
meta-qcom: ec80a36bce11d8182b4bb2a6fa0359adfeccde0a
meta-virtualization: 8b1543e121deda2445f80f74d85c10316d5b31f4
meta-yocto: 9bb6e6e8b016a0c9dfe290369a6ed91ef4020535
oecore: a1f4ae4e569bc0e36c27c1e4651e502e54d63b28
poky: 1d54d1c4736a114e1cecbe85a0306e3814d5ce70
yocto-docs: 369f3307368eaea605983e80047377fd19ebd6bf


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#653): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/653
Mute This Topic: https://lists.yoctoproject.org/mt/117841921/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



