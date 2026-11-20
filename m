Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3864.1795173294761713216
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 03:14:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=WOYn9TpQ;
 dkim=pass header.i=@intel.com header.s=selector1 header.b=MepyQY+J;
 spf=pass (domain: intel.com, ip: 192.198.163.16, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795173295; x=1826709295;
  h=from:to:subject:date:message-id:mime-version;
  bh=ho2PQux8DMya6BfPaMjfwy+juFeSJMq3riD+VKNmj+c=;
  b=WOYn9TpQU80lO/OAmrYLdmXN1YE3fTzhaR4eNtW/XdoMtF5NmyywA0wC
   Om9UkZ6U2Nu37mSO+CyUKMTe/4JtC3dbwcrDXxq8B3sFGaBWwYfISQyI6
   2oRz0zcjPhCQsoLEBQ/BcIgNSqRPkJVm2vtfQnpyAvYQVr7a6TT30ShM0
   h/zTfMSJnfUBPx1ztszWv4M7r0krZTC7cAIXVeQGFZjBEPtH3ZS5DrEpk
   TKyffpr+X+7B5JE1JM5KyBh8RM2z6D1h4XZ6bodLljV2fSB8osfe3XT4p
   otrraHpFWhLz4+PtZ7R6JJf3QN2GH2KOn+UHXzihK+lvmzEpfl7UCqIfB
   A==;
X-CSE-ConnectionGUID: rX9wOQ5uQgOf7EGYDyMkaw==
X-CSE-MsgGUID: weUt+2UISgOCGgkOrA0j8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4077825"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208,217";a="4077825"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 03:14:35 -0800
X-CSE-ConnectionGUID: F5OmTZuCRqO+x4+vd56QfQ==
X-CSE-MsgGUID: hvA7Nv9+TLiOqoajg87XaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208,217";a="10895734"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 03:14:35 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 03:14:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 03:14:34 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 03:14:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htg/rJni2x6LZJ8Fg0SHfOiQ6QT/ajaFYervyac6rwI/1OMZUiZ1QCyka5DrS/2ayhQtolWmDoJBW4IoV3m15ha1s8rlZXuEBM9ZeVP0T4LFjvTtG/bacQ8XWeqgzdSg8k6eTnOV+QrY+0s+/XHNqG30DHSHCKQ8NbeuAjOFjjcUsQfp6NZbv314mAXT31At5dLu6vw4VJd+SHHJeBfQ+tTsxfs8dJ4Tp2KMPXvSmLjoQwTULBPDm1kxHrrMSPPMpdNLoNK9sBySPiMUHEHvC/aaIhFzPZBtt6dDe85xzblr6k0LMHl4cm57Hl6NLhuGGCHpcX+128PT04/y+z5ytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WCQrXMqyvAn0t8h8ATSZBRcRDVn6JmOd6uZQblczOE=;
 b=rRDoPIdTGR+7af7NMAQaRhC/S46Zok0LKbY8S1Uige6W/oyNn86ICVI0ax25H4fjiPRyZxvbz3tqYJ4U4KwzuPKEDepHGPKcUx6s+R9p3jRv7Z5+dx7vugjXSjXnQz2LpSJhO50yoWiXpESj+HBWr0AQAxuXWQI69ENBLde5As7aKRnoKWxgsrU5MFKNE7F732krI33Ol8CV0gAXOQQ6unTbQ40Uqwy2hjabSy1LeHIKdWnNM+zaox8gVZub31aeUCvO19z/e4LpFpGyghk7grx9ikd9vQEBur1GoSUNHBAPkpiKy2hdJZrQuuzvNXVCR/VavHZtVXWBKa4h5OT5mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WCQrXMqyvAn0t8h8ATSZBRcRDVn6JmOd6uZQblczOE=;
 b=MepyQY+JBmUgNLZZfWXip+m9EcR8aGsiU9VQs6POY+y5pPQ9XGzOIQQvdYGVg453cD7r4iqBvoyrmAQHFaWw64LN1xPpJhlB/Mhm2KLq9ZRi+jbgAL78glxmfx2v5231rXnkvgEVASJxrXSkPnrhSWFmmVZykIVls6VIe/jx8M4=
Received: from DS4PR11MB352303.namprd11.prod.outlook.com (2603:10b6:8:50f::18)
 by DM3PPFAB6A6CF3C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 11:14:26 +0000
Received: from DS4PR11MB352303.namprd11.prod.outlook.com
 ([fe80::c82:2fc8:5d51:9a1b]) by DS4PR11MB352303.namprd11.prod.outlook.com
 ([fe80::c82:2fc8:5d51:9a1b%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 11:14:26 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, OE-Core ML
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: QA execution for YP build yocto-6.1.1.rc1
Thread-Topic: QA execution for YP build yocto-6.1.1.rc1
Thread-Index: Ad144EzwP0WSCdVWTrmjPfFqkB86AA==
Date: Fri, 20 Nov 2026 11:14:26 +0000
Message-ID: <DS4PR11MB3523030812A06444806682B89DF4782@DS4PR11MB352303.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR11MB352303:EE_|DM3PPFAB6A6CF3C:EE_
x-ms-office365-filtering-correlation-id: ce20c44b-1214-4c94-070e-08df46f7705b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261026135527099003|261026121527099003|261026130827099003|261026140227099003|261022113327099003|261022105027099003|261022075727099003|261022115727099003|261028144727099003|261021135927099003|261021130227099003|261021133027099003|261021121427099003|261021123027099003|261102123227099003|38070700021|11063799006|56012099006|10067099003|18002099003|261009223027099003|6133799003|13003099007|8096899003;
x-microsoft-antispam-message-info: eUI0LFX1o8299/TyxQFcHkeqo7jNJ5Ja4OCIAl3DawivJvMTtC8DvhUx6d8D1JZ4uyhx2MTuQatt2rtHqZO/EHn6JF4ilBmX+l5EnJAT8J8LyMXggGOCob8MVOnRcJRE646XbvRdXGB/O5nzOdPhT049PoDbBQrRVFZeNNvsoMugkZrKQFmBFMxduxGeQruY4u7TqK7NP58BytYCHwh75c1eUU0THxgYNUK5YsoXo/bvzncVfvXbRiulUQlBkeOn3jpAe2nTfdC090q+t/Gs13E2ZPFqP6OLis2/y7xfMf3a1g7qNOXTey5ek4eJ5B0JdLxocS4sd8EVIjpyz7DTOOpGVqgxXI1zS/9+tEUd5Fx/oIloWaic2xaWFDXKdl9ywbqfxHAgUkzdku+i7c0qz0OcEvK6LgaGvXcWk1wR10WsKk4Gxz7mLEzh42XbZ9/eUeiwmPwKjKT7HcqLPjqNfqYSAN55+b3q3iUStPyQL6+ZhJtPFSbqA93ldWsMftrTf7rN3+CotLT2goWKOVifwWrmmhCEAu21llBZLbeBcs31Z7+VXryKOcRAISYWIcNOTg2kHsmPbSyvICzluU0CkYd5KPFaHLTd6T8HFhovF5eMsjoLLyYjtezy50kuxP7PbzxSXhkMae3RidfbmjEuW+eDa4QZarrXUyU/xoBa83g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR11MB352303.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026135527099003)(261026121527099003)(261026130827099003)(261026140227099003)(261022113327099003)(261022105027099003)(261022075727099003)(261022115727099003)(261028144727099003)(261021135927099003)(261021130227099003)(261021133027099003)(261021121427099003)(261021123027099003)(261102123227099003)(38070700021)(11063799006)(56012099006)(10067099003)(18002099003)(261009223027099003)(6133799003)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gtLEq+0K4ltHTRzrqvZBAWNVYH+E3J39cf4PALiCrZB355zGObb4u183m089?=
 =?us-ascii?Q?uU0sOTpoUW1y0eLKLLxT+4UIc3AZhHhHicfye1D/yfIlWCNU9os0+XcLqhtS?=
 =?us-ascii?Q?qvyvZRyy5HiVxO34vZEKoHl5VKKqV805H4u9hHQPyfFqge/9+q6JENjcXZx5?=
 =?us-ascii?Q?20wBahMcD2aNWtbGd8zrrhX0yY96jmeDkzXV30lFk9ahJ/yiWWCdS/ImlhEU?=
 =?us-ascii?Q?2TYdjayNBp7fwfK9n89X6EeZcl4YmaR6q5ChAWU05+p/NShJMdWsbbh+xeiL?=
 =?us-ascii?Q?HMUsO8SKwEMRR4kUdrtaRH1i/UFph8MLs0WGHun0GcAl2CUbPDRq4nMHG+J1?=
 =?us-ascii?Q?GQ2+3R1VFhxJIQ4q9/HV8aj0TUNvFierrlbctTuhKGuDtnoUmuC1VzGSwe1T?=
 =?us-ascii?Q?X51f6WehRulwnIsXyJZe5KrrXtpx0NOONk4AZqnBKv8KZkInCaR4l5t3lJM6?=
 =?us-ascii?Q?WdV2h5dmecChFHSZ3XaRtDgMhUKcy7bqGveMLkeA6ELhfPCpHDVArkpbLFrV?=
 =?us-ascii?Q?P1SWIJ1IEpFqfPHe7rniMgdqWStPeJjturgvq/D3GxrXvAGC3XCV0NsgzYg4?=
 =?us-ascii?Q?9lbsd84in/rPMmLiocCDq26kOYkaAtcMed5fbHh35avuO7iLn4wknhjsI23M?=
 =?us-ascii?Q?DsJRroixUeWWsRP+EhRjKQUjm30UBUo5mddjO3nFs7bkWskchYHROcdQ7Gtb?=
 =?us-ascii?Q?K20qecTgKpr/vQFp0EQ+Ph12LRQ07sfWZN/RH6JjzDCQmF5nrUIn8InJL1yM?=
 =?us-ascii?Q?+PNxWAnjFLVLEhlFgcc+iUrKIuTS9JDZpUhM0hSOibAARJKkNgu/xcnG0f5v?=
 =?us-ascii?Q?cIaXvtr/8yIUY2tmLhOATalyfDpGhP2aaw4EVpuJV5xAaXc+pHZaAnixBAiI?=
 =?us-ascii?Q?s8Icdab8GJreT+bTlIG55zedqA9DX20pNs7C2esoxRSrrIpulGPKS9Rc1DdD?=
 =?us-ascii?Q?CU8nRv1ALHjkW0ifQEqEFTuDMm/TbLYTecXXNSVqKQ2JvQQ8iqcGHFpchUJE?=
 =?us-ascii?Q?ufJnjhGtt63QtW90jYwUeYtzfXflTo8x7xSJxT54gZunmM1uFpfrApcLs4g0?=
 =?us-ascii?Q?Q22H23rivhFa6K6K0s44kOkmn7VJ7RHJUHk9Iku58zsuqf3iTv6sdkFlm7RP?=
 =?us-ascii?Q?pDrkf0+VrtW0kja7hi8yUSYF/j1W5oB8SMXejUZuVE/OHgY+OpHkKSOG8Nsc?=
 =?us-ascii?Q?qYiYw86/es1TXKel4avONALCYlRYEYYKdR9yEMJS+cwV/R4SabvYI5ZCtj74?=
 =?us-ascii?Q?SNnvMtx9Asa3Js/4nxYyAIWl4vnKJX5NXxIY+Yz9AAtgYx7G9XMgLcs2JqBT?=
 =?us-ascii?Q?BlhDYnCLPtpZo4SlPft2ebxCqLjzE4T1EIAwA+CG2bkL2mwj0PrEiJ+bGnzD?=
 =?us-ascii?Q?M7qnjxb6Mf+XUyJgKDCSgnfjO/RjqdiOcryX0J4t/zqrwP5gxK7gpvda1tLo?=
 =?us-ascii?Q?laVEZnPIRy4Mqc+MPw2ViJWCHIwTIwswXDqvQrHC+PGNuc56kvu43s/5mMUF?=
 =?us-ascii?Q?+ezzsF+Uh0aFSEn4UW62j5ARlGFhsXKQ+2g2ZsYA4bq4lH2Df0LQO/5g2wcd?=
 =?us-ascii?Q?r8ia7ynBB1yMqk7bEp3aU3nko2KXHrtQVQ1A0Las1Cc8dOO8rhnjBlyc2V6/?=
 =?us-ascii?Q?x4wLZCpJIyCOdkolcdwwnZkchH83zr99GoedXio3qbGbgJvowz6h504V0hWv?=
 =?us-ascii?Q?kpSi6pzQI/w6ro0uTnBeteZLt/sPyk20IcuGh2CJmcGchHyz?=
Content-Type: multipart/alternative;
	boundary="_000_DS4PR11MB3523030812A06444806682B89DF4782DS4PR11MB352303_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: l3U+U/Krc2VLueAKS9BO0cacpOk/nEXeeARZrd6xkntlfRW02//pCx1MaYmtm/YQ/eLanGIMmfDdIrSQ3wejUk2Zaxz+4SSN2+TU9lq1jYIJwyO+dhniRtGw7oV3o7EH7WGzbW1ewMlFexvkoOtEm62H8sfLMj1To2Flz6W95tawzj6OCZbWMZTRsLA5rFrWPc1DACMSlaxM5iUhxxddxYgCPQbyLntooLk8/RNIiB9azOjmQbG0Ax0ka6B4TR3SyHNlg7frGKfqC4XtZ0pux6+639Pyghz76CWI/Fdmr11AzoRhORkfQNqo33S4eCeUcd17mJZhPuXUKM6UMh5kQw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB352303.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce20c44b-1214-4c94-070e-08df46f7705b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 11:14:26.5635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dWF8Hy2Ni665jxWGDRs0nPL84ZZEUalCK+qS+xemc6WH3iKa2vN1NPD3dtspOZJ69FPvPs0FUCIn7IObUfXr+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFAB6A6CF3C
Return-Path: debal.ghosh@intel.com
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 11:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250775

--_000_DS4PR11MB3523030812A06444806682B89DF4782DS4PR11MB352303_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,



My bad; I somehow did not get this notif via qa-build-notification@lists.yo=
ctoproject.org<mailto:qa-build-notification@lists.yoctoproject.org>; possib=
ly due to the outlook outage last week



Intel YP QA is planning for QA execution for YP build yocto-6.1.1.rc1. We a=
re planning to execute the following tests for this cycle:


OEQA-manual tests for following module:

OE-Core

BSP-hw


Runtime auto test for following platforms:


Alder Lake

Amston Lake

Arrow Lake

Bartlett Lake-S

Panther Lake

Raptor Lake

Twin Lake


ETA for completion: 23/11/2026.


Best regards,

Debal Ghosh

-----Original Message-----


From: Paul Barker <paul@pbarker.dev<mailto:paul@pbarker.dev>>

Sent: 20 November 2026 16:03

To: qa-build-notification@lists.yoctoproject.org<mailto:qa-build-notificati=
on@lists.yoctoproject.org>; Ghosh, Debal <debal.ghosh@intel.com<mailto:deba=
l.ghosh@intel.com>>

Cc: Yoann Congal <yoann.congal@smile.fr<mailto:yoann.congal@smile.fr>>; Ric=
hard Purdie <richard.purdie@linuxfoundation.org<mailto:richard.purdie@linux=
foundation.org>>

Subject: Re: [qa-build-notification] QA notification for completed autobuil=
der build (yocto-6.1.1.rc1)

Hi Debal & QA team,

Do you have any update on QA for YP 6.1.1?

On Sun Nov 15, 2026 at 9:57 AM GMT, Yoann Congal wrote:

> On Sun Nov 15, 2026 at 6:42 AM CET, Pokybuild User via qa-build-notificat=
ion wrote:

>>

>>     A build flagged for QA (yocto-6.1.1.rc1) was completed on the autobu=
ilder and is available at:

>>

>>

>>         https://valkyrie.yocto.io/pub/releases/yocto-6.1.1.rc1

>>

>>

>>     Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/=
29/builds/5126

>>

>>     Build hash information:

>>

>>     bitbake: 7f7ae8cd58993a389adbd130b07ea5de8415d2f9

>> meta-agl: c36f0e0bbed6000f28cfd10417c280c9fdca37cd

>> meta-arm: 5f432e5ac06f7679a58ae4da5df40e62d8ea3b35

>> meta-aws: 945fa75b8f716f1e9ffa7d1e19780d729c7e28b8

>> meta-clang: 555882484074bbc97f3bd2e6ced7c34f1ad548f8

>> meta-intel: 25dd9e467e0675430073801c8b931af0a4758b30

>> meta-mingw: 2697806adf824708e86d57ad68e0978a0af812fb

>> meta-openembedded: bb956bf8ff7a32f31deaa83e96880d10ab564d14

>> meta-qcom: cba1f2af0105e17a3b04f319b5db92ed5fff068c

>> meta-virtualization: 7b0154418de3350fd23a0bd868742f2b570b24d3

>> meta-yocto: c5b4882e75c926e44e141efcdb7e3f75945389ab

>> oecore: 5b458838c126051c884c8cb5225c7265d1483ea6

>> yocto-docs: 28a708ecb3c2ce1669094f9f4c1bdcbc28438bcc

>

> This was an "all green" build, so OK to proceed with QA.

>

> Yoann

Best regards,

--

Paul Barker



--_000_DS4PR11MB3523030812A06444806682B89DF4782DS4PR11MB352303_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
p.elementtoproof, li.elementtoproof, div.elementtoproof
	{mso-style-name:elementtoproof;
	margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Hi all,</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">My bad; I somehow did not get this=
 notif via
</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans=
-serif;color:#467886"><a href=3D"mailto:qa-build-notification@lists.yoctopr=
oject.org"><span style=3D"color:#467886">qa-build-notification@lists.yoctop=
roject.org</span></a></span><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">;
 possibly due to the outlook outage last week</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Intel YP QA is planning for QA exe=
cution for YP build yocto-6.1.1.rc1. We are planning to execute the followi=
ng tests for this cycle:</span><o:p></o:p></p>
<p class=3D"elementtoproof"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black">OEQA-manual tests for following module:=
<o:p></o:p></span></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">OE-Core</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">BSP-hw</span><o:p></o:p></p>
<p class=3D"elementtoproof"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black">Runtime auto test for following platfor=
ms:<o:p></o:p></span></p>
<p class=3D"elementtoproof"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black">Alder Lake<o:p></o:p></span></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Amston Lake</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Arrow Lake</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Bartlett Lake-S</span><o:p></o:p><=
/p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Panther Lake</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Raptor Lake</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Twin Lake</span><o:p></o:p></p>
<p class=3D"elementtoproof"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black">ETA for completion: 23/11/2026.<o:p></o=
:p></span></p>
<p class=3D"elementtoproof"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black">Best regards,<o:p></o:p></span></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Debal Ghosh</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">-----Original Message-----</span><=
o:p></o:p></p>
<p class=3D"elementtoproof"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black">From: Paul Barker &lt;</span><span styl=
e=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#467=
886"><a href=3D"mailto:paul@pbarker.dev"><span style=3D"color:#467886">paul=
@pbarker.dev</span></a></span><span style=3D"font-size:11.0pt;font-family:&=
quot;Calibri&quot;,sans-serif;color:black">&gt;</span><span style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"><o:p></o:p></span></=
p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Sent: 20 November 2026 16:03</span=
><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">To:
</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans=
-serif;color:#467886"><a href=3D"mailto:qa-build-notification@lists.yoctopr=
oject.org"><span style=3D"color:#467886">qa-build-notification@lists.yoctop=
roject.org</span></a></span><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">;
 Ghosh, Debal &lt;</span><span style=3D"font-size:11.0pt;font-family:&quot;=
Calibri&quot;,sans-serif;color:#467886"><a href=3D"mailto:debal.ghosh@intel=
.com"><span style=3D"color:#467886">debal.ghosh@intel.com</span></a></span>=
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;=
color:black">&gt;</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Cc: Yoann Congal &lt;</span><span =
style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:=
#467886"><a href=3D"mailto:yoann.congal@smile.fr"><span style=3D"color:#467=
886">yoann.congal@smile.fr</span></a></span><span style=3D"font-size:11.0pt=
;font-family:&quot;Calibri&quot;,sans-serif;color:black">&gt;;
 Richard Purdie &lt;</span><span style=3D"font-size:11.0pt;font-family:&quo=
t;Calibri&quot;,sans-serif;color:#467886"><a href=3D"mailto:richard.purdie@=
linuxfoundation.org"><span style=3D"color:#467886">richard.purdie@linuxfoun=
dation.org</span></a></span><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Subject: Re: [qa-build-notificatio=
n] QA notification for completed autobuilder build (yocto-6.1.1.rc1)</span>=
<o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Hi Debal &amp; QA team,</span><o:p=
></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Do you have any update on QA for Y=
P 6.1.1?</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">On Sun Nov 15, 2026 at 9:57 AM GMT=
, Yoann Congal wrote:</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt; On Sun Nov 15, 2026 at 6:42 A=
M CET, Pokybuild User via qa-build-notification wrote:</span><o:p></o:p></p=
>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt;</span><o:p>&nbsp;</o:p></=
p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; A=
 build flagged for QA (yocto-6.1.1.rc1) was completed on the autobuilder an=
d is available at:</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt;</span><o:p>&nbsp;</o:p></=
p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt;</span><o:p>&nbsp;</o:p></=
p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans=
-serif;color:#467886"><a href=3D"https://valkyrie.yocto.io/pub/releases/yoc=
to-6.1.1.rc1"><span style=3D"color:#467886">https://valkyrie.yocto.io/pub/r=
eleases/yocto-6.1.1.rc1</span></a></span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt;</span><o:p>&nbsp;</o:p></=
p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt;</span><o:p>&nbsp;</o:p></=
p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; B=
uild URL:
</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans=
-serif;color:#467886"><a href=3D"https://autobuilder.yoctoproject.org/valky=
rie/#/builders/29/builds/5126"><span style=3D"color:#467886">https://autobu=
ilder.yoctoproject.org/valkyrie/#/builders/29/builds/5126</span></a></span>=
<o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt;</span><o:p>&nbsp;</o:p></=
p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; B=
uild hash information:</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt;</span><o:p>&nbsp;</o:p></=
p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; b=
itbake: 7f7ae8cd58993a389adbd130b07ea5de8415d2f9</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt; meta-agl: c36f0e0bbed6000=
f28cfd10417c280c9fdca37cd</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt; meta-arm: 5f432e5ac06f767=
9a58ae4da5df40e62d8ea3b35</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt; meta-aws: 945fa75b8f716f1=
e9ffa7d1e19780d729c7e28b8</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt; meta-clang: 555882484074b=
bc97f3bd2e6ced7c34f1ad548f8</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt; meta-intel: 25dd9e467e067=
5430073801c8b931af0a4758b30</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt; meta-mingw: 2697806adf824=
708e86d57ad68e0978a0af812fb</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt; meta-openembedded: bb956b=
f8ff7a32f31deaa83e96880d10ab564d14</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt; meta-qcom: cba1f2af0105e1=
7a3b04f319b5db92ed5fff068c</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt; meta-virtualization: 7b01=
54418de3350fd23a0bd868742f2b570b24d3</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt; meta-yocto: c5b4882e75c92=
6e44e141efcdb7e3f75945389ab</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt; oecore: 5b458838c126051c8=
84c8cb5225c7265d1483ea6</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;&gt; yocto-docs: 28a708ecb3c2c=
e1669094f9f4c1bdcbc28438bcc</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt; This was an &quot;all green&q=
uot; build, so OK to proceed with QA.</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">&gt; Yoann</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Best regards,</span><o:p></o:p></p=
>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">--</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Paul Barker</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
</div>
</body>
</html>

--_000_DS4PR11MB3523030812A06444806682B89DF4782DS4PR11MB352303_--
