Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44708.1795621821300820090
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 07:50:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=FqsQz3lc;
 dkim=pass header.i=@intel.com header.s=selector1 header.b=b8yc6Sn4;
 spf=pass (domain: intel.com, ip: 198.175.65.20, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795621821; x=1827157821;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=kKVVvumv1tbtfNIjqmIn5CurW1rmkGYKc9c6PcZXAdU=;
  b=FqsQz3lcC27EBJ9sKg7pDinxu2bzwJ9yVCdSGOfBbR4zF1UM5ckB7Kms
   ZWoLhgDGjnh2H72LZ32tDMR6nnar7wXVdXdJXFUQf84+sXu6oMUX+FHGm
   fKagWtEXKo4/EdlIDewlK9BRuUthNYZH7IhP+hnulPA6bR57qHVRquq3h
   b3+uhpyzwQ2GABA/xlyZMHz3Ppx0D0Hl+mWLZqRPs8S9KxoVSOvxg2obM
   wdix9R9wOwmdqAlLig2uPr1Po63jLiKS5pzTvwyUkKPQNUt5/c/KgL6XQ
   /pZAEsvWsRRnYGrXXxxidbhNxVk+PZoo7mVAaY/OVoHEor/IQGqxAfm3g
   w==;
X-CSE-ConnectionGUID: uLxWRuBsQF6aeSiggyJgQg==
X-CSE-MsgGUID: G3MKR8b4QSORvgV2GGaJOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4561523"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4561523"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 07:21:20 -0800
X-CSE-ConnectionGUID: 2IsOr6evTFCf+r+MWITcbg==
X-CSE-MsgGUID: IRTEFt/TQlWj/0xe3iabOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11778099"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 07:12:10 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 07:12:09 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 07:12:09 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 07:12:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xp6SMFF+1k08Q9CwWhjaw8m1/BKziMSMNXkq+l9yg9K2hPGHJ+0qf7oOD3Kj+9oHxx3lGDKlGJoouz7iJnyPt6XRwM6CSFnN04c7vfnqGAy3s+d+gReZOxgTpfPdtRpKJxFBbyQLt4Skiaf2FJgqGHutrHWSdlbqPXdughqOoBIKXZ0Vi6sqOmpwG4jFfuaHqf1HgqTjKDfhPY1gOfZL0rv8sT5m9MnwYKpnEV3Pac9aWR4m4+uSpOzX7opXTQFq8QtLioG3lQodOaVXo+n8teHLtrIf5aF/15RpuKuERHsTUWjYiMsrflH//8CXjFNfkj11a5RSHPZVhK4vyMs8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2a5/lnIdo06v7OSF2Fy283X+MEFxBY1gPBJKbsrJUtE=;
 b=Of9vsLAUrO4nhohuqldqoWcOUm0/5aDR1Vaqp6zHlmisJN5gV2GiJafpZ/JfzCRlwln8aNZDEdmb55GPs5PaZOUKvotlvPm8qtXdwegtXYW1+f71p4zahK3icncGTrMyQgC1fxKOAWfd0DBLNSh7daMvEu5tWZi0M7HjERQDNlv3fhij2PyulcdGRfUl/iKuuOp+ADSaQw5oZu5eYUeEtzrj57awk/cAMOmWirApKHOWZU9Nwm8bvY7A1XYjulja+gLlgqsAc+H6Of1udjIuWhwA5yYEdukXvcF6YTD59biBPbp5G5r3vN9M/7Q4VHIIh1ZEcG9LWk02sQ3XZiOwHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2a5/lnIdo06v7OSF2Fy283X+MEFxBY1gPBJKbsrJUtE=;
 b=b8yc6Sn4q1ZD7tgiRGdyDAfJdLXafu19wGm0TCB0WNnwMfowgRUCO/xFsoj8Am+86Yuws9unk9o6x8qaPcEvcoaaFWWDF+2yW3opablfYIm7y/v5xNzqHEzSz41YLn02ZU+MYCgJexVnGOOC1lClAm7CE3Aod4gyF61A6mWZRzs=
Received: from DS4PR11MB352303.namprd11.prod.outlook.com (2603:10b6:8:50f::18)
 by MW3PR11MB4524.namprd11.prod.outlook.com (2603:10b6:303:2c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 15:12:07 +0000
Received: from DS4PR11MB352303.namprd11.prod.outlook.com
 ([fe80::c82:2fc8:5d51:9a1b]) by DS4PR11MB352303.namprd11.prod.outlook.com
 ([fe80::c82:2fc8:5d51:9a1b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 15:12:07 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, OE-Core ML
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.0.5.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.0.5.rc1)
Thread-Index: AQHdeP5uvSeNZjZT00OimGyqGdR75rc+3ffw
Date: Wed, 25 Nov 2026 15:12:07 +0000
Message-ID: <DS4PR11MB3523032CAEB6877482D11BD525F4432@DS4PR11MB352303.namprd11.prod.outlook.com>
References: <010101a1f96f774d-78432ac4-7ac8-4131-a918-627d037a8112-000000@us-west-2.amazonses.com>
In-Reply-To: <010101a1f96f774d-78432ac4-7ac8-4131-a918-627d037a8112-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR11MB352303:EE_|MW3PR11MB4524:EE_
x-ms-office365-filtering-correlation-id: b82f13dd-2e8f-498a-11db-08df4b0678b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|23010399003|376014|366016|6133799003|261009223027099003|22082099003|18002099003|260925021311599003|260925022911599003|260925021911599003|10067099003|11063799006|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261026130827099003|261021123027099003|261022113327099003|261022105027099003|261022075727099003|261022115727099003|261021135927099003|261021133027099003|261021130227099003|261026135527099003|261021121427099003|38070700021;
x-microsoft-antispam-message-info: l/eRz3Da6J6+g2wu8BjEpEbv1zm7961wUQPwnl7rvCO03fq7Ml2M2c3RIDKq72BB93RsuLRlvUs1MEjYeP/tkf56XIvoyxA4qCe30EeSWL3pBK3laeZm2vvLWcQUE2ZpZzgTrGv+ErQchuiTnRhgfz5mL+4sgq0wlC1UoWfa4Qt+9vZiRtUX/j/ambedY8MFVJSZ0kAq3EW3xkG5A/HOMk0LZvMmUz97TSDPtMS/i4oxXWZA8LNiLeOYXMtZ0ggcZ5zpe5d00CGVjvFra+Gisp/hdY7YLELrZf/qqmSnoRb5eqcGySWtvKJVN60i9wwfcqOOeKm4yKZ60kg+REd5AUTu+cSZPtWuyH5s2DbG57zzfzjIN961i90Adnb6vC5HaDD8/JTHTdc6K2A2P5To7H4w5QF8x4fYjvYyq6Ynr8rJBddsFH/qBVCUzs1HxTWepJl3/vjfL4f2/Ne8z/Gd6Qrr8Q+0uTqnOkDOQW9C5pbCJQ8pUIPtoLy4XJ3XQisjQPbjl0daheSpt68LAtaQfMedZ5k8Hs9EiZCxQV8TXZLG4wR8h8Uk3rOVrWNkRLGqBJP7WJGzB6KN3tj/SeTsLIk0/czPvpie8uZZhEahvnP64SthdN3g/ws0VlOVt3ni7IVqIo4yLbbYbWR/YnMFra8bViOTSI+9MXFlK73Tz3w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR11MB352303.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(23010399003)(376014)(366016)(6133799003)(261009223027099003)(22082099003)(18002099003)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261026130827099003)(261021123027099003)(261022113327099003)(261022105027099003)(261022075727099003)(261022115727099003)(261021135927099003)(261021133027099003)(261021130227099003)(261026135527099003)(261021121427099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0t8/k8WV2C/aJd++heFNaxEJmZR+MepNdzSJNul4rg9jJfWrVTCFVKKaZDWN?=
 =?us-ascii?Q?z8D4YqcsUwTXffEZX+xlekF4EknghfJKeeU1ZOTT5xrZx5a+Xpq9FKwTnrML?=
 =?us-ascii?Q?LQHXcXNmNlzXR9WJ5XjMVUekxTFHU7+MKXHHs6HS5sqO7KIV9Pwd3vkDMjSc?=
 =?us-ascii?Q?DMuj9xJzcRLUC++F+U0erqxDp8y+L9TqK5I3i6APEHT1Vqvv/Se+8X53KUbv?=
 =?us-ascii?Q?d58SdcJ2CFsXKr/yl9+6zQaQfMsi482PtL7K1ISdb8oHK6ux0Ls+0ZEBiiV5?=
 =?us-ascii?Q?2eRp2xymHaaRCJA74lff4a8gI9A5iRqhXjT+pEo8OMKo5fpE4833WGWmoCvJ?=
 =?us-ascii?Q?zQ1iNumf2qXqE6sVvtXHJjQEOHT4l0cKCMqLVlm6Py/kl8GJJJItzp6mvcIT?=
 =?us-ascii?Q?LcslLcWQu1fN7Xf/XI260T6JaLTQIhOEsIm2K9pCz/YCo0PsZLUY7OoylC2r?=
 =?us-ascii?Q?u6s0we1IXHehdAHPslTsmKGBxFztxQDFHVpvUOg0e6cDfABPjb7matwdw15g?=
 =?us-ascii?Q?CBBtdyLcReEkoq8SdK73FhYahO7KZILw+ZdFWNBVaLngxPpBPDOiK4pgrt0C?=
 =?us-ascii?Q?8FOB/sdufkqzVDU3sJZvavS6fUzgQwgyLotcnDtAsZQpOMXgpIF1JqtIzmsO?=
 =?us-ascii?Q?AvwjcvHfHvsD+HZbMS2hkz8qleSBjGVUCFpBL2Ah8LF8PkoLYkOSVHCkHhit?=
 =?us-ascii?Q?BlIekUm1bwsTXFUwIz0Sn5a/uAG1ml9qU5w87vi+ULhNA70lOeBLoaE1Wfb3?=
 =?us-ascii?Q?l5Vc7VI/fzlTZGk2GogpvnH/hHO5jVA49U1I5Ea9UT1F/AdL+bNIjW3bvaDh?=
 =?us-ascii?Q?0YlyTLFVuuGaJ5PC9SYkOI6NH7SZa76ZeaX39yQUG/j94idWUYntgob67ZnH?=
 =?us-ascii?Q?YxtjBkMtVbE2mSjYzTv6ExZHVw7ix2iq105I7AQl1HACeArSZKs3cesUijo3?=
 =?us-ascii?Q?aFoh8M+Bc6ntbTh5lCzsmvDotOjR+AiPVvziz7tt45UudQlIjoxfGMkdLY2W?=
 =?us-ascii?Q?3LI6cb1U/ZczLMWgnBef0xXAQh1KyKOAdSJMnyJHRbNXkt+cjAdb5P+/rx5x?=
 =?us-ascii?Q?9R7V5YRXGDvZ167mS5Y07tpgSikuMlXuwB1oEWN6W/xWGrcBsGMZFnwom3I7?=
 =?us-ascii?Q?IytBiUGzY4lCAA+PnZCUoYsmpywsuVLXTGKeuN7LvWqZ/Dzb6bRfdLfoPeVt?=
 =?us-ascii?Q?cBoJ8wFLVaTqL4We+5i+KzcjiiQ7HgDaLq1h7V9riGyfUQE38qsbZAlIl2MT?=
 =?us-ascii?Q?3OKciyWnqpdjUQja5Pidylj8q/ItHSBthueDQflfzy2+VNA+hHtuyYGlpsCu?=
 =?us-ascii?Q?BaZAY1zCF7Eu9Ic61dcrPSn9hSRizvRxg/VYim1j0tcubUuocbhPlC/5D2nI?=
 =?us-ascii?Q?ey1XaoHXhzF3tFf+XiWz0RTf6cS6Q9DXCVcyqb560gxwDeanjtM+TMRc6RDw?=
 =?us-ascii?Q?G/OMt6YF61lEOxFAYeRioLZK59t09bZ6LJumLYF1GJnth1e/xMRcpLIKSEwH?=
 =?us-ascii?Q?pYobEbSG2JZA9QvctXzpfBES0ylp32kNIdhN4TEwPUsPg3dGl5sukeL3TE4G?=
 =?us-ascii?Q?7tWwNUwxkF+4HESNJTEi5QvEEl88ifa0Z/tCl4/cCuL0Is+/JcGWNYrLAhKw?=
 =?us-ascii?Q?2/C45pSyh5lKFysieZ+Sy0wK8r7mvvG9Grca+Km9XE33Y2mlrL2NhKMhBI/V?=
 =?us-ascii?Q?hwkPhtg8y4O6N5SLolR0vdDZJRPwZKacf9LjWb+Lp/rR5GgBgkzia3AkhciP?=
 =?us-ascii?Q?Xa6fdX9ciQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mZ/S4pQX7ov9o3vLKhHLzGFC9lRn1CUQ1pOKpA1TCXb5rYm5Jx0JyINtl1nWF7l3v9ucWup03yyoqyRA/FJl9QJOlH948Z6+OqLMFuMi0u9c6TimLNHuLsLPgCAIA6au+Dd+Z28KCR20Y9wkoWsb+Y1I+1ZbM4FnDaCT04omarhiGx3EIKIw3/+jdc2td9UUFRN3okY/2/9xxf0YhVLN20+lPuiQuqbhMe9xxqF3WA76a4OBO7hGzHVn2pj1X9iihR/m8jVSyTyD7CZbQCgao/E6pN5cZpULj/dDQ43RvlHSgnt6yJiCuEtmRuLGU733I+H3ihBCXXL5+GZ80+6KuQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB352303.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b82f13dd-2e8f-498a-11db-08df4b0678b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 15:12:07.6950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tTypOlhS270mtIbTHrgbDMzvwDERUUkMNAzoT2bWNFcW6rQLpszd46XOwgSXjeFdXgNweob56rLEdOXPDKCDdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4524
Return-Path: debal.ghosh@intel.com
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 15:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251196

Hi all,

Intel YP QA is planning for QA execution for YP build yocto-6.0.5.rc1. We a=
re planning to execute the following tests for this cycle:

OEQA-manual tests for following module:

OE-Core
BSP-hw

Runtime auto test for following platforms:

Alder Lake
Amston Lake
Arrow Lake
Bartlett Lake-S
Meteor Lake
Raptor Lake

ETA for completion: 27/11/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: Pokybuild User via qa-build-notification <pokybuild=3Dyoctoproject.or=
g@lists.yoctoproject.org>=20
Sent: 20 November 2026 20:20
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-6.0.5.rc1)


    A build flagged for QA (yocto-6.0.5.rc1) was completed on the autobuild=
er and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-6.0.5.rc1


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/5161

    Build hash information:=20

    bitbake: 6e260eb6ab1631607ea414d9ff8ede1155faa5d9
meta-agl: f5bae8295caf377908099079d810321d3acc2463
meta-arm: 673e8d7c5dcd14de58092eb73e6ecc5eee5c1735
meta-aws: a498da240af9a9c80a8a3d4bd494c2e12165c74e
meta-clang: ef0d22f21910a0c30c967eeb17d8f209806e2d81
meta-intel: fcd2544222aa8e2f6caf100b854971cf1618a8fe
meta-mingw: 5876c193da3ad86b5e23012374b5350e49b0c755
meta-openembedded: c0fcd7cca3760ef24e087ac4a31b8f357cb204da
meta-qcom: baecdeaf8f7fed25f553d4cc8f6ee554f548c6b6
meta-virtualization: f27e2594ab43f4e596eb8e287e7e446ef4064810
meta-yocto: e941c69844c28fc40c4f149251f7281207525abe
mixin-wrynose-linux-firmware: d0fd372d1da9cacca04585f7a1b088fdfb32b77e
oecore: 16a03ed6c2db2fa1d7edac4f288a74958a00eb9f
yocto-docs: a361ccfc75eb853805e5acd4ab32b439f6d0af06


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#768): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/768
Mute This Topic: https://lists.yoctoproject.org/mt/122367495/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


