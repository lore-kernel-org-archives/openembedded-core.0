Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675A6C44522
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:57:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9834.1768996613146167610
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=icvusmOE;
 spf=pass (domain: intel.com, ip: 198.175.65.16, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768996613; x=1800532613;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=M2bZxKAMqNwbNJSscZtWXuE7SXpP6SnL347zajB4bf0=;
  b=icvusmOEFmwsPncDKOJDqYe+12tJDgji+/1p/ZU1GSZv7qnN43WiloUN
   jTRsOYSHtQl64HIPvXy65OyLm9sIX/G+UWxlI/YyyOD6/559tx2VLsYfh
   4CEfqJ/AsR4XjyJ15JanlK88RuIJ/nYRxM+oUVclpk3/vME8S6FdOD9FV
   xlFnfyi3Eq2+trLJPvSMdJWY7j990OkXepkjV51bdwbS1mWRCThB6jrJv
   nIGV1B0xQbbi4jG5C8BNgWDOUT9nJGH2ufPvCuGWt7jXYpDM7G1+YGVMe
   KqFGqrU/gO4GrAM4mfdYRAYon0DIhoMyE9jq9ao4N6mmBjQPnSZ93+89J
   A==;
X-CSE-ConnectionGUID: B4ZqiNM9SFaDRM5UVYOXDQ==
X-CSE-MsgGUID: CryDQBfSQ+Sp63yzaf/zoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70385799"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208,217";a="70385799"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 03:56:52 -0800
X-CSE-ConnectionGUID: HGewIokbS+CqMhUdX/Y9kw==
X-CSE-MsgGUID: K4Ox6iPISH61+nsDVSvuJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208,217";a="237671474"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 03:56:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 03:56:50 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 03:56:50 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 03:56:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cf6Y9dwmqjVQeUBbx0tvEOb2clnmpcEdPn/F9TY4OggtlNcwhwjaygDAbgZ49201JDDCtUn//EZSpWL5zElk/cP2OToy0pfvRrcDhfG8NdXOvpSIGS0k4GRJxkhSj5SUC+jQF+9CrSHY91LnDh75f4incza3zJz4dmbFs8MfLV5NmAaKM/ZqBlKLQ8/VFEUS0+oUiYGyaWxmf8X373PRL/qyG9JkYkjsnVpbu5AC7KoJ+FOebAhz4MeLMbbaQzA6PxMAaqe2FOABw5InTyJPKxhyJT5P/Z4Anm5ii/ln/oNFPH9pq9rAnY49/q0xZCAr5vSw5VvdNS/1lwy7mJXMDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIrPWmNdVDMJiCXihKsLC/dgF3LMDlzBNJbz0RhfioU=;
 b=usjTlg8z/7/8CdimDr4leK3/iP7xaQsQlrmUCn7QHH6jeuhPdvWZ6vjDUGIe60WnOOD4Vv3KJKoNWg7rTGluk+Ih1Johf22R0RQEvQOHrKqlqWhJV5wIw50TnvWGYfMnXk2O9Bm7skSKg8q8oRfxyNPY6E/BXPlL/MgBgboox0Z4l9pSkIAD1huzJzQxb/gY/D2Mj9DFO6J8njQDR6rJwOcEfAl1ibMDNfLKAeXF9xQI/LVxJLTx9ThgktgjH1xA/IreZC4PbOihpvgAasv5vzmPpEVTgbdOCLFjaLJmQZo8NmYzpe2Cx+MwVCQ3MumZjKWzfz7o+afC5PMplDhGEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by SJ2PR11MB7547.namprd11.prod.outlook.com (2603:10b6:a03:4cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 11:56:43 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%7]) with mapi id 15.20.9520.010; Wed, 21 Jan 2026
 11:56:43 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.3.1.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.3.1.rc2)
Thread-Index: AQHchBhDX8PZ2I/g/kG4erUw19Nit7VPm3hggAz1ff4=
Date: Wed, 21 Jan 2026 11:56:43 +0000
Message-ID: <SN7PR11MB7018229D5EA9755643B9A9B2F496A@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019bb476ef27-8b7fdc51-0e56-4f57-96dd-07d91ed02b9a-000000@us-west-2.amazonses.com>
 <188A35157A84AFC6.2436516@lists.yoctoproject.org>
In-Reply-To: <188A35157A84AFC6.2436516@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|SJ2PR11MB7547:EE_
x-ms-office365-filtering-correlation-id: 901d9a19-f7d3-4fa6-f146-08de58e42561
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|13003099007|8096899003|7053199007|7142099003|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?LzDUFIcK+PV7uxSvuJK5ozjd4Fi7iX0XxPUpNNuskG2r2Yd0wL3XKLssDn?=
 =?iso-8859-1?Q?qtmM23s1moFEcRn3wRhBbLkaEm2RD6xX8Y6CiOtlJiubxUX1Ll4lAYMdmr?=
 =?iso-8859-1?Q?VDKzteIOAfkGnUPl88gFxTPkC1yGzGO/R1MJVA4R07FTn//Mu7Cp4OqZaV?=
 =?iso-8859-1?Q?tl3zOjRVwMFGSD/KMcRi9XtCtAz26JvoD5qwXoUD4gjXm2y+KHMsSAXl/D?=
 =?iso-8859-1?Q?6vzmlzKb3nJEv+DI+jz+zbwcxPFH26nTuKQNDJkTgYhsOsSlccjbWOh6uy?=
 =?iso-8859-1?Q?U4MDVaHWneEJuhAqcdbCMawq33gUHRfLsuhZYg5nrndFDTB6JLDxvENOUj?=
 =?iso-8859-1?Q?kBYW2DhaTmYucRGh3b0L+zsTtVr1RVmmjQdVZP39wROYhbxin7zb481puS?=
 =?iso-8859-1?Q?f8TU73CpJqPVgCtoqydkC2I838S7vszFzPXgpf3F1ACDJkBZwg9u64fdlK?=
 =?iso-8859-1?Q?YVaYB5k1O0Klvc1oRMuM130zwbC5L0yrd6DhDV4kK85LP2axEk7f7x61Ph?=
 =?iso-8859-1?Q?SuZfqqrpKHCNBfKSp2C1ooMSXsaJ8axpBIZ4sWlKzRy7KD7WoeXT3opZWp?=
 =?iso-8859-1?Q?xcYZZbe51v5CPdTpBnm8QrdE9XORewpJUcu/o6lpYw7inpKE9Pyxbm+HX+?=
 =?iso-8859-1?Q?v9CCDTZ4sO5MhMDfOHd497zTmF6OTDojTa7cYATkN2QXOeD7xrmQmfOE6I?=
 =?iso-8859-1?Q?8FtkhmKFn1V/RUUoBTm0qs3+vw19b2iBaRwwXFD5QkNqxn3EdnKv8xweJA?=
 =?iso-8859-1?Q?cAF1xZCr9CgHbcQWmRWl1LYRAIDnlDu9N5OlQPCpvv1w/UfusYicmoQlTk?=
 =?iso-8859-1?Q?9p0aKEoHKWwH+H+BABFGmomG2q3h5G9haFbAh12hio3yDzmxT0Cspd55oR?=
 =?iso-8859-1?Q?FX6UoDz+WCb6Tt78sOHkts3NCfudja0gMthKQXaC+8m4QNX8ERlXuMcD5/?=
 =?iso-8859-1?Q?lMPHX8rwbfpRgmQS83OL2zy5G8M5NvrnHrdqJLjEZaMkYIY5QHlrhXBMTM?=
 =?iso-8859-1?Q?t0qbNlQMlc/nRrfVNQemgT2nm4hS1BHJRX/bQhplP6vlk7Jl9EWi+IYiCE?=
 =?iso-8859-1?Q?0/y0cvemWmc3VwmtOvNAcOLacPH5wiTMDRnp31igL2qOe4lYsuJ6ZEu1XI?=
 =?iso-8859-1?Q?aeZOSc80xjYQqm9gUk6goTi07ftCI2jV1OyZ3qZzZ17gaybdgfDsj2v7LF?=
 =?iso-8859-1?Q?xJh0Bl8yzCCEg2Y9qYFYvWrfoZxHPmfPcNsMpR763xnxNRIN9YbHQ6p6o3?=
 =?iso-8859-1?Q?yCQlhCR1DcU/kXzDgrtRpyXAuN+yWqRiK8zwDP3MLNh4TjCo07RRp6lDRJ?=
 =?iso-8859-1?Q?qvSRoHWclUfZXnnhrtnMY9HKvk3QR0ZMVD4gZVyxHxxeZbRlU3m0nW1OU6?=
 =?iso-8859-1?Q?1bxM0jaGrCugfN/d1vKoQURjhh1GrZiRlrj0ZIRZdQoXtgv/1xRiHJDoXM?=
 =?iso-8859-1?Q?dFe+Lgk67rjH7N6TjFGYQUITJfNU95xECKM+KCe1epYs6D07IcfwPGGqGm?=
 =?iso-8859-1?Q?gkCttoM64ovJY0jbc3HFJ8BFjIcIAhHt11Gb1R85mcxYKhsexMRF9xpSIg?=
 =?iso-8859-1?Q?+Gg4BLy3JC8TMg5WdRh1Tn3iTZ7sz0njOWxp/Tv0ZDYe4M9/lZF/C/1F9O?=
 =?iso-8859-1?Q?7o8mwHPl/h3MtyZq0KzNFnZAOoP5LD0rDo?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(13003099007)(8096899003)(7053199007)(7142099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?y1IdZDA1vmXVHZEW2fAb8ZGnPG7QjnAecqjJRFVierYNbflx7T0zP2S7s4?=
 =?iso-8859-1?Q?8rghD2/4eAJYtVHBwmKdhQVfLjJytu+BJZyZOuCaI7wE/EF1Bas1GgSbGv?=
 =?iso-8859-1?Q?XtO5QbS4Jjn5gbLJ1pnKWznXOpbdQynMq6KfEK3sbSPbltaAtrFEGtJuvk?=
 =?iso-8859-1?Q?HnG3u+BZpPKg/+9Klt6m2V71xPhTiJEZGtxp/bIpCIB43t9fHcd5ZV8Nyo?=
 =?iso-8859-1?Q?CNAYpXlQCmK2oNFZIvY7B1zNr0ihiP8pdAYuwvbvmTQyTdKrgRTbKA89GW?=
 =?iso-8859-1?Q?yb70JmbkMNsyFSufoVU/eWZbHjkvnuTUUVv8P/q15r7ee+OszCnCb1tEZV?=
 =?iso-8859-1?Q?fDCTtYxVlM7nFnqbrit8pObbtnIholE3rSstffSz+hbj8lgED0mBZV+GoA?=
 =?iso-8859-1?Q?xiJVaDTQq2nuXWwjf9zseYCYH4FvdQ7E2BvNUR3+gWwlpGMfPecO7I56Sg?=
 =?iso-8859-1?Q?3whaEabTgcrNtX26ko6s1x6LpTMDtpTv1LoXa7N1TXFguP3jawCeYmsURX?=
 =?iso-8859-1?Q?ZYU07rDKevqwNn92lO4AFo8eRXQ+wHtHHTsfOTkbCmpY0jsBR6MwPVuYyn?=
 =?iso-8859-1?Q?8PDQtpVxGsM937gtHTFnWfM5znZxQ/8lTKtrQKd+A1CwwOvqBnAui11UMf?=
 =?iso-8859-1?Q?Jw4eFcegCxbcZvJnTHi2PdQGH7cAB/pvPoNY9zJByxnVPg32OJpqz6PIRi?=
 =?iso-8859-1?Q?MKunOFPrp4EWVZ9Mb29F1oZnI8lqsRsD8t9Yossr7Gu0+fc2oggcRcc07Q?=
 =?iso-8859-1?Q?1Ok2VLa2muuiXsqVRY9mq1bMuH20wdHlvhF5LnMheHeGvV1AXlw0Muo09a?=
 =?iso-8859-1?Q?wTk5O+g29RDtwkP+dpBxpqZD7cbm78TsRW334A2dJ0IcKhP39SalW4F1YT?=
 =?iso-8859-1?Q?cW0d1wbvtgwPB71K1pSTDHFLDzSbgFgUkg6xrHY9BCin+zp4abTkJGAf9n?=
 =?iso-8859-1?Q?i6LZ7dxD7K38IfZDhDcQq+JswKdRmiiLgCUv0GWvis5tnIkCTbFOkPlvI/?=
 =?iso-8859-1?Q?YVTH8gO0TO7vlSAsVw7Ku5aWsPNzJEHhsli2grUXa5ZNDFieERx8NjLmsv?=
 =?iso-8859-1?Q?omWxb5yeUCWmW8TUkAwm0reP0Fei+bH8Khgn2AUHPOa21EvdsYjUCduIrU?=
 =?iso-8859-1?Q?DmQAaOoRNWAXrVly1710OoBMuxXoU9t/9WrS1SppSbW1swtq/lkqJjGc1o?=
 =?iso-8859-1?Q?I88/V8PBGPlrylDro1v6nlZmi9XD6srcUaqwZzQ0NczFooQ6H4NvuGLJ/Z?=
 =?iso-8859-1?Q?h7FmIchPDHt4ctzNbL4cWnGitprCKYQQ5OZRXJK7GudNa9YEfBfeTePhUF?=
 =?iso-8859-1?Q?TpDmLe2bb94LUrq2KhPUTfzWiASxtDYSFi/AvCv5SkAFFLZNk89cdKQ0mH?=
 =?iso-8859-1?Q?48puf1G8HbIsYUjtKMyIiJ6Kt6vdjqz5ACwoOhVvJ0vFfcQQCb5ycmB5aW?=
 =?iso-8859-1?Q?sc+3jF5u2wgU4USCP1dBb6rkA9mRlWg44/iWnxGymEIXN6hSCH9P9SEUUY?=
 =?iso-8859-1?Q?EStgdQYNcj6RLkQApSOVuInCXUCII/OQFRQGk8nMBwHdaCMSRMup4YkvU2?=
 =?iso-8859-1?Q?abx62ut2dkNTZofb2jAsnt7wE8NgU26Ey8t57JY3hWOJqW9TwY7b0STKTI?=
 =?iso-8859-1?Q?QsuqmAWo6vih9KrZbheG04iexEDV+1ebT9Rm/LKp/PfKVCf5/3WCoOw4np?=
 =?iso-8859-1?Q?XLwRw+MewZB4UnndDWn7EAJuGIIAwUa9Io1sxR/EMM78OnWz8zyMu8VmLn?=
 =?iso-8859-1?Q?Cld2rweKWPE20UgxjAGBw4nXfV1xbE3wdTCBOsGNJztzc3?=
Content-Type: multipart/alternative;
	boundary="_000_SN7PR11MB7018229D5EA9755643B9A9B2F496ASN7PR11MB7018namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 901d9a19-f7d3-4fa6-f146-08de58e42561
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 11:56:43.5726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mOMz2Uf9uyLZE9FHzmYgNN2s1Jz51M3f1zDafWcbx2EicUtqN544BB9+wq4UjSnWbYPaHr7LimBqfcxvN1qfSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7547
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 11:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229807

--_000_SN7PR11MB7018229D5EA9755643B9A9B2F496ASN7PR11MB7018namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All,

QA for Yocto-5.3.1.rc2 is completed. This is the full report for this relea=
se:
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.
No new issue found.


Thanks,
Debal Ghosh

________________________________
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> on behalf of Ghosh, Debal via lists.yoctoproject.org=
 <debal.ghosh=3Dintel.com@lists.yoctoproject.org>
Sent: Tuesday, January 13, 2026 11:32 AM
To: qa-build-notification@lists.yoctoproject.org <qa-build-notification@lis=
ts.yoctoproject.org>; Yocto-mailing-list <yocto@lists.yoctoproject.org>; op=
enembedded-core <openembedded-core@lists.openembedded.org>; Pokybuild User =
<pokybuild@yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuil=
der build (yocto-5.3.1.rc2)

Hi all,

Intel and WR YP QA is planning for QA execution for YP build Yocto-5.3.1.rc=
2. We are planning to execute the following tests for this cycle:


OEQA-manual tests for following module:
OE-Core
BSP-hw


Runtime auto test for following platforms:

MinnowBoard Turbot - 32bit
Alder Lake-S
Meteor Lake-P
Arrow lake
Bartlett lake-S
Amston lake
Twin lake
Beaglebone
BeaglePlay




ETA for completion: 21/01/2026.


Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 13 January 2026 04:38
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.3.1.rc2)


    A build flagged for QA (yocto-5.3.1.rc2) was completed on the autobuild=
er and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.3.1.rc2


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3041

    Build hash information:

    bitbake: 663021740bc086bd959a8457ad9ddb6da52a8278
meta-agl: fcc4176504cd4b5b9d27d20797b11be5330e9f10
meta-arm: 955b1d8e6921d8e03388c5013dfaebbb0cfc5099
meta-aws: dde608c015c80442356bd180202f955cc9b61267
meta-clang: cf20f8bd1366d41094c945597b95dd746e87b871
meta-intel: 9182026daca13f7efca0bb6ff1eacb039946c476
meta-mingw: 00323de97e397d4f6734ef2191806616989f5e10
meta-openembedded: a4e768dcfae181dd99e39c4286fa0729ca7f4e47
meta-qcom: dc5f692bff1032c40a19f4ab4cd7eb63afcfaab1
meta-virtualization: 28d26fd95397bf575e65fcca0cbb302b1e9bc7ff
meta-yocto: 6973ca663aaa9c3ab517ee960ab7985a5bf54c07
oecore: dd10706cfafb5574b7cf316fca2300d166ef71b0
yocto-docs: 102a33294e63a5581c413555040f790161fc80ff



This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org










-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#641): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/641
Mute This Topic: https://lists.yoctoproject.org/mt/117234373/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



--_000_SN7PR11MB7018229D5EA9755643B9A9B2F496ASN7PR11MB7018namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi All,</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 10px 0px 0px; fon=
t-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToPro=
of">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 10px 0px 0px; fon=
t-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetic=
a, sans-serif;" class=3D"elementToProof">
<span style=3D"font-size: 12pt; color: rgb(0, 0, 0);">QA for </span><span s=
tyle=3D"font-size: 11pt; color: rgb(0, 0, 0);">Yocto-5.3.1.rc2</span><span =
style=3D"font-size: 12pt; color: rgb(0, 0, 0);">&nbsp;is completed. This is=
 the full report for this release:&nbsp;</span></div>
<div style=3D"text-align: left; text-indent: 0px; margin: 10px 0px 0px; fon=
t-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(12, 102, 228);" class=3D"element=
ToProof">
<a style=3D"color: rgb(12, 102, 228);" rel=3D"nofollow" class=3D"external-l=
ink OWAAutoLink" id=3D"OWA7c05aad5-8184-6376-208a-f0c39a63ea1e" href=3D"htt=
ps://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?h=
=3Dintel-yocto-testresults">https://git.yoctoproject.org/cgit/cgit.cgi/yoct=
o-testresults-contrib/tree/?h=3Dintel-yocto-testresults</a></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 10px 0px 0px; fon=
t-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToPro=
of">
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D<br>
No high milestone defects.</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 10px 0px 0px; fon=
t-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToPro=
of">
No new issue found.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 10px 0px 0px; fon=
t-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToPro=
of">
Thanks,</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 10px 0px 0px; fon=
t-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToPro=
of">
Debal Ghosh</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;qa-build-notification@lists.yoctoproject.org &lt;qa-build=
-notification@lists.yoctoproject.org&gt; on behalf of Ghosh, Debal via list=
s.yoctoproject.org &lt;debal.ghosh=3Dintel.com@lists.yoctoproject.org&gt;<b=
r>
<b>Sent:</b>&nbsp;Tuesday, January 13, 2026 11:32 AM<br>
<b>To:</b>&nbsp;qa-build-notification@lists.yoctoproject.org &lt;qa-build-n=
otification@lists.yoctoproject.org&gt;; Yocto-mailing-list &lt;yocto@lists.=
yoctoproject.org&gt;; openembedded-core &lt;openembedded-core@lists.openemb=
edded.org&gt;; Pokybuild User &lt;pokybuild@yoctoproject.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [qa-build-notification] QA notification for comple=
ted autobuilder build (yocto-5.3.1.rc2)</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">Hi all,<br>
<br>
Intel and WR YP QA is planning for QA execution for YP build Yocto-5.3.1.rc=
2. We are planning to execute the following tests for this cycle:<br>
<br>
<br>
OEQA-manual tests for following module:<br>
OE-Core<br>
BSP-hw<br>
<br>
<br>
Runtime auto test for following platforms:<br>
<br>
MinnowBoard Turbot - 32bit<br>
Alder Lake-S<br>
Meteor Lake-P<br>
Arrow lake<br>
Bartlett lake-S<br>
Amston lake<br>
Twin lake<br>
Beaglebone<br>
BeaglePlay<br>
<br>
<br>
<br>
<br>
ETA for completion: 21/01/2026.<br>
<br>
<br>
Best regards,<br>
Debal Ghosh<br>
<br>
-----Original Message-----<br>
From: qa-build-notification@lists.yoctoproject.org &lt;qa-build-notificatio=
n@lists.yoctoproject.org&gt; On Behalf Of Pokybuild User via lists.yoctopro=
ject.org<br>
Sent: 13 January 2026 04:38<br>
To: yocto@lists.yoctoproject.org<br>
Cc: qa-build-notification@lists.yoctoproject.org<br>
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.3.1.rc2)<br>
<br>
<br>
&nbsp;&nbsp;&nbsp; A build flagged for QA (yocto-5.3.1.rc2) was completed o=
n the autobuilder and is available at:<br>
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a data-auth=3D"NotApplicable" c=
lass=3D"OWAAutoLink" id=3D"OWA3f4aa35c-4f89-3fe3-b227-74d1df5eedf6" href=3D=
"https://valkyrie.yocto.io/pub/releases/yocto-5.3.1.rc2">
https://valkyrie.yocto.io/pub/releases/yocto-5.3.1.rc2</a><br>
<br>
<br>
&nbsp;&nbsp;&nbsp; Build URL: <a data-auth=3D"NotApplicable" class=3D"OWAAu=
toLink" id=3D"OWA9a1eb706-d3d4-eeab-770d-a33dff605f77" href=3D"https://auto=
builder.yoctoproject.org/valkyrie/#/builders/29/builds/3041">
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3041</a>=
<br>
<br>
&nbsp;&nbsp;&nbsp; Build hash information:<br>
<br>
&nbsp;&nbsp;&nbsp; bitbake: 663021740bc086bd959a8457ad9ddb6da52a8278<br>
meta-agl: fcc4176504cd4b5b9d27d20797b11be5330e9f10<br>
meta-arm: 955b1d8e6921d8e03388c5013dfaebbb0cfc5099<br>
meta-aws: dde608c015c80442356bd180202f955cc9b61267<br>
meta-clang: cf20f8bd1366d41094c945597b95dd746e87b871<br>
meta-intel: 9182026daca13f7efca0bb6ff1eacb039946c476<br>
meta-mingw: 00323de97e397d4f6734ef2191806616989f5e10<br>
meta-openembedded: a4e768dcfae181dd99e39c4286fa0729ca7f4e47<br>
meta-qcom: dc5f692bff1032c40a19f4ab4cd7eb63afcfaab1<br>
meta-virtualization: 28d26fd95397bf575e65fcca0cbb302b1e9bc7ff<br>
meta-yocto: 6973ca663aaa9c3ab517ee960ab7985a5bf54c07<br>
oecore: dd10706cfafb5574b7cf316fca2300d166ef71b0<br>
yocto-docs: 102a33294e63a5581c413555040f790161fc80ff<br>
<br>
<br>
&nbsp;&nbsp;&nbsp;<br>
This is an automated message from the Yocto Project Autobuilder<br>
Git: git://git.yoctoproject.org/yocto-autobuilder2<br>
Email: richard.purdie@linuxfoundation.org<br>
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#641): <a data-auth=3D"NotApplicable" class=3D"OWAAutoLi=
nk" id=3D"OWA6951fb5c-85ba-ad7d-0ae8-5563639e8e64" href=3D"https://lists.yo=
ctoproject.org/g/qa-build-notification/message/641">
https://lists.yoctoproject.org/g/qa-build-notification/message/641</a><br>
Mute This Topic: <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D=
"OWA64299653-9e4f-7614-d6d6-e54897a2c441" href=3D"https://lists.yoctoprojec=
t.org/mt/117234373/9976127">
https://lists.yoctoproject.org/mt/117234373/9976127</a><br>
Group Owner: qa-build-notification+owner@lists.yoctoproject.org<br>
Unsubscribe: <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA=
4cfbe799-c209-bd59-915e-fa1feaebfe17" href=3D"https://lists.yoctoproject.or=
g/g/qa-build-notification/leave/14426999/9976127/44033455/xyzzy">
https://lists.yoctoproject.org/g/qa-build-notification/leave/14426999/99761=
27/44033455/xyzzy</a>&nbsp;[debal.ghosh@intel.com]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
<br>
</div>
</body>
</html>

--_000_SN7PR11MB7018229D5EA9755643B9A9B2F496ASN7PR11MB7018namp_--

