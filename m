Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15413.1795517351243307160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:49:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=XGkdAkKD;
 dkim=pass header.i=@intel.com header.s=selector1 header.b=Zm5kJCEC;
 spf=pass (domain: intel.com, ip: 198.175.65.14, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795517352; x=1827053352;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=Aqp5jB1usqZNXTIs3CzkqgLeJlIabJ3yeZol1skciAM=;
  b=XGkdAkKDTVnoBF0vWOXaibWm9TNlumwV+Q4B314gIZqlhgv732GOHjlO
   waOpfClKr58QV1fRCHNU1u30W+nXV1Jo6s6NWbOZMDSNtIzE6HIsB/Wf4
   OS73I6L6+PWtR3T84HFhALX2NdoN/WrQnLseUag7IlcP4nNAr/8U0nh71
   TgznHswTl3wFCZfipPAo1qTVEQ4i10nqxOLgXm/ZABeixpaNXdgH7vXJ2
   Y48x/+Nc1mgz8WcwsAKB+hodWXdzl96VHCa8RZxyQvbjhfwExcJeCxP56
   SqIZAvoBSY5/BwXP9CCskHpLkejXn44N5oXLoGW3BadMFi1Wf2e3PR7Lg
   Q==;
X-CSE-ConnectionGUID: O8kMmkrzTWGf7j0s8zLz2g==
X-CSE-MsgGUID: tbK51IAJTr2nQsHByOrj1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4244572"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208,217";a="4244572"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 02:49:11 -0800
X-CSE-ConnectionGUID: jUiRJkGBS9+vOTrW9SzXxw==
X-CSE-MsgGUID: DMfRsIAMQoeTUHFeLfwYcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208,217";a="11716508"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 02:49:10 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 02:49:10 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 02:49:10 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 02:49:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMOfu6rxMSCcpuQphduU2AModSQIctxFquJuVQN7YE0C9FW89YXNnT770+ZQoqcJUga1Ung/m/BldSR5iJMHezINtpoMXEqZPhWIwAUKPBBIQz//H+dXrDpU39lOl2slLLAV2RAUgiII+pTlV7O04SPVrpIS5W1+6xIA7p7DZVYVAxQAijIcQEtlCo1ATrVWX1nrtRNTRCNywDdhjPQspJFjv+2dWyeeqR3GMQVjwvAg9FkOonHfMPIPXB0jDgn5WD3sdQABPBhJV1vy+qzsnBWhwvg6VGv+JhrDsrIDpMZzDnuejh9cecHv50MUP4juKviGTPEsz3yOgt64SGYwfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n25j9P+1xZ8b1D7wXIRVngrTX43YiNGuLEkrVklFfzY=;
 b=p7nCgZuXHbnyMgro4IQLO3nWI+w5aKUivIkOLzNcuifaTW41IcrcHCRBOn3I26nLjzmdErzdXiQh7UHdm4Mi++BIuk+e3dHpcnfoDBXKZcesuwa/O0o2bkvcDV+/FesZ5aZiCP4hljG4cevIxRYGrA5niViPEaU/gaXBlsr17XVJhnfZ44r+tNErsSH4cLDw/u3eTQBcwNotktV6C2fMia1X3+wImNCdV4CDnhgnwaZm7U3kc3N0nt8E9jFzUb+d8GklQJ8o6tkubwOgFq8Tnza+4dx2sCLDHxaVBYmYdRjOWtXcBjuZ21AgxQSklPBgO9CM2NS3aB/20+qMkPzdiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n25j9P+1xZ8b1D7wXIRVngrTX43YiNGuLEkrVklFfzY=;
 b=Zm5kJCECifs9GmwoV006Ac+QnizlBVhQW5fM6Y1TxxLCOtieIA0Q22LeRrJ9jJ19qV6re4HpEbq8HKmbUtcGCnovHbkzRLkqWpODpNw2PndKXsfqieHnDMkzJTx5YUMQ6rPSP/EOnpZC/rXHE3qieKcLBmpMfT+EAMBnFDzHSnY=
Received: from DS4PR11MB352303.namprd11.prod.outlook.com (2603:10b6:8:50f::18)
 by IA4PR11MB9035.namprd11.prod.outlook.com (2603:10b6:208:55e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.17; Tue, 24 Nov
 2026 10:49:02 +0000
Received: from DS4PR11MB352303.namprd11.prod.outlook.com
 ([fe80::c82:2fc8:5d51:9a1b]) by DS4PR11MB352303.namprd11.prod.outlook.com
 ([fe80::c82:2fc8:5d51:9a1b%4]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 10:49:00 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, OE-Core ML
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: QA execution for YP build yocto-6.1.1.rc1
Thread-Topic: QA execution for YP build yocto-6.1.1.rc1
Thread-Index: Ad144EzwP0WSCdVWTrmjPfFqkB86AADIJSNg
Date: Tue, 24 Nov 2026 10:49:00 +0000
Message-ID: <DS4PR11MB3523039AE8224FD57E8AD90AA8F4442@DS4PR11MB352303.namprd11.prod.outlook.com>
References: <DS4PR11MB3523030812A06444806682B89DF4782@DS4PR11MB352303.namprd11.prod.outlook.com>
In-Reply-To: <DS4PR11MB3523030812A06444806682B89DF4782@DS4PR11MB352303.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR11MB352303:EE_|IA4PR11MB9035:EE_
x-ms-office365-filtering-correlation-id: 22a4070b-ff61-4243-5d61-08df4a188c1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|6133799003|261009223027099003|22082099003|13003099007|8096899003|56012099006|261021133027099003|261026121527099003|261102123227099003|261021123027099003|10067099003|11063799006|261022105027099003|261026130827099003|261026140227099003|261021130227099003|261026135527099003|261028144727099003|261021135927099003|261022115727099003|261021121427099003|261022113327099003|261022075727099003|38070700021;
x-microsoft-antispam-message-info: vP6Mc77k2sZ/RJDedPCsuv4cGq5IJzlSwyz0lmRuz3UmhTXCBpbQKvbl3eiphyJ6Crdv9LYjt3h1Awx6ODmh098yIl/OyulFoqGDzpm1FI1scEKG6yJ8+SO7XH/vgC9bHJ5J2Ge79FAfmJKiSO9Hz2BwiNdWr0AABQpdH7RolcgK5yn1JjK30w3TfhcudeY1KtC2p7x56Ij9CvXxa7rLtZ/GMRz1xashkyQ9UW9ZXLRQYOU8slpbCmDUAFizaTgEKm3So00jpvQLTKzmLi+b2GOFw6NKXhaZt/RlFi2te7D2p2qvt7z+eKC1HQsFdSC5b66FFur0ZnkmZD2xTR/MaQjxSX+D0Hzh4jgRKBi3mvW/F2Bs2d7Khphcpt7OwE2pa6fxIOXkvEX6cpsJJljFE68lyT5GyC6C8PSa29+I1vs3jRELyW4kydwaBQOuoVF8BFBStdcTPFWM13eBp1NseQF1PITfuFAidzRT4HC6PihcFqbvjtm1nm0fnD69x5IbjR2moFwiYnMd6f1QR7BS0tRVatnr2KbkePsp+oqc4n7S0eQR0bgsmRgq3C4UxdALmJMMXWvkvuHYLyYPkwazhI79bW+ZNvRT94ck3zwJsIgHtAGUvCgWWe/k6GK58dR2NTqOaqLk2z+AXyjEOutNPmjumhF92ZH71clOKZMVyac=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR11MB352303.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(6133799003)(261009223027099003)(22082099003)(13003099007)(8096899003)(56012099006)(261021133027099003)(261026121527099003)(261102123227099003)(261021123027099003)(10067099003)(11063799006)(261022105027099003)(261026130827099003)(261026140227099003)(261021130227099003)(261026135527099003)(261028144727099003)(261021135927099003)(261022115727099003)(261021121427099003)(261022113327099003)(261022075727099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9HXeWYpEqMkIFGM1RSJDObvuBBse/8hP27zU8/Y6/yH+gyP1yf8a3YLbLO5Y?=
 =?us-ascii?Q?N6ooWIJiRaatjz+BN/66aW3wArT3vNGdLM+tbXxyrNnrzxlv6RWeCYkIR7G2?=
 =?us-ascii?Q?6N1uw7XKYx6Z6WmNkQYAL/TnfaFzmBiyzokj78rQyr/x02wKdg1y5HM0PSci?=
 =?us-ascii?Q?XFQqH7eYIUCqrzA5Ue8tZch+0n2WoScFh6IaQSji761/1VAfK9ml+nXuAbtu?=
 =?us-ascii?Q?UktnqExiZSUER8b8QDq3ipHu7QOkRlWwP7Xda9dq1ZgIieayhIjkhw6g1Fj8?=
 =?us-ascii?Q?sMYLPZj1wAyMwzUST+YhfddK1oiuVw+sige9AeXZze4vDZtkeTU2p95aw2kU?=
 =?us-ascii?Q?OuWqQRRlW2x1PtaFCmFCrP9h914aH1OmUMnihRvR7P1RVF+HLZTSeFA2m0WC?=
 =?us-ascii?Q?PBEZr/cJUCzg6N2+oKGUXERRyUqXANcW0vp5Zvs44Bzut+mN0TXTYRwhCYtJ?=
 =?us-ascii?Q?1cHZmSnYXmtUSoG/aNWLRrh4H8CxhwgK6ZhcF2qtQIITdcW6LD+neEZXcvsc?=
 =?us-ascii?Q?/GD78i3XSJ9MT8ZsUNTzSQKEVvT0/iXTWe/VYMQXkl/ZhB/6tKzJ/fZS069A?=
 =?us-ascii?Q?SwAsxjRmok8dAQbQeKelPSvVEoYZT3wNs3um8+B5xRC9gZ3T7Z9yN+YiX+17?=
 =?us-ascii?Q?C2SujhafbPSas9h2gePYGjq0jeZ1SMjhqttzXxywtG7W+psCOOebB0QW0Owy?=
 =?us-ascii?Q?eKTpfPQbQip5WYpOl1BjLM12YoRDzAd5kQwc5KryxzaoC6xBaEPpnifmkUhF?=
 =?us-ascii?Q?qr5qD1M0keI/O2Rp2Ez8AuUgc393oMTRntRPtPmU4Lh2imJgfIc+/Z75w9mn?=
 =?us-ascii?Q?ExLBPMGHyVTc3ph0X0qdRlhMPA2AmvtV8e/CpCDr12qUb7VWm1pXidqZkae6?=
 =?us-ascii?Q?DdyUIFKpX12wDGsX7xTjUKsS8rOnSQly9EeMgyvg4oSwnL3mh6CFSjfmyI5D?=
 =?us-ascii?Q?T9GHBYTXLyHMkU1ekcL33vMD//7F0NwQgD3ROR8lQTJjrdcXnduWr3+t5N8l?=
 =?us-ascii?Q?9tbEIub1Ng6T9OY8Qn3gMbKYSJcVCIEnx6s3kRB7qTpae0gpG9azcTQKvRVd?=
 =?us-ascii?Q?VKcAgTmgUHQJhGcUQMlCVs/ODCbl8OAljbaRz/gmM7uHVVY+eG4ObF4M88D8?=
 =?us-ascii?Q?X2QegV1ZhA33+BxHc63YnyDhlrYU9bM36LkgL0rSldP/aLelXINhz2FI815n?=
 =?us-ascii?Q?ipUYBpBtjDr6DwLQlu+RD0/ww5jI+UTKzhmY6c+3l9eCJJlv2Gvh7ByAJpHX?=
 =?us-ascii?Q?Pd4gfRdlhR7etLkszRrnSeNZcq9fsUWdk1xyM8y4VeriJIgsRQBzF7l2nnEw?=
 =?us-ascii?Q?7lnDnigWuMCxJzp/0AM9nM62fynw0HFzG5EU4DJeU6KdAopbiOpY/LPvp+Z/?=
 =?us-ascii?Q?NvdLhYVh6ZkzxjP5Pd7M+/Rt0GPpwosjDLeX4DjrPZi5bGKu/+uqbAjCkDoh?=
 =?us-ascii?Q?J6XKZJCt+Ey6GD+aDUJ67jUgJFW5XnSuuPLgoXPNl5//WO3S8gn1TSi64fU2?=
 =?us-ascii?Q?7xnjbnuTi7x/p0T8JveqZBoqmKqRQldOakTZzSCrr0jQIi39ruIOr0UffcJ0?=
 =?us-ascii?Q?AIadGGxW92v8KU6JoPIYAn/6786udjkjhrU9BV+/OFRv7AS4KtGomh3BYspH?=
 =?us-ascii?Q?nd2led4QRI4wrwoQPx9goAGw2PmNC1jmtt770DpfKfeLCFnQRj1+H3EZvqqQ?=
 =?us-ascii?Q?LlQM0C1k+3TVoK6vxG89bJw3pE+Wbj3kvLRRZB4qF4KXIsbSfLGmJDHeZi9f?=
 =?us-ascii?Q?SeKeGd25Rg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DS4PR11MB3523039AE8224FD57E8AD90AA8F4442DS4PR11MB352303_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: COWVkXQpJxdQzm+2+HUefLFZ0RiDbu1dGPDRYfyd+eK/RVKo+zD7uSx4O4IvaHFAFcJ6LcqgM7f+Up5NLu3jnJKmaAsuE0kujK7gUUQ1tFxWW3Ocx4n8Trk9s1yF8JyoaUL1nx7Jp11UfqxDS3v4K0Zqwg7qf7xgQSqALYm6oUUhOPgK1FTACJRsfLAGGb+qXOS7vAVzGpF+L5O8GYtPby9ThKnLO+In3q+76gBxHG4dHboZbbbDckY5yG64mPaqqJzKgY9auq6uJAo+fI0P9ng9wO3b6gRRLfkM5JYdVFQS0ohT9CQPArTlLzz5/thZrHGRzsWE54qyDj9WWdccuw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB352303.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a4070b-ff61-4243-5d61-08df4a188c1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 10:49:00.0222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CWB7PwJ9Avuxi3tobRb1v4sDXHAgZKqIYLICmZd5qYQAWr2WFY6iprRtYRiJBB6WEjAtL26YjopRJEC5qTRo8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9035
Return-Path: debal.ghosh@intel.com
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251007

--_000_DS4PR11MB3523039AE8224FD57E8AD90AA8F4442DS4PR11MB352303_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,



QA for yocto-6.1.1.rc1 is completed. This is the full report for this relea=
se:

https://git.yoctoproject.org/yocto-testresults-contrib/tree/?h=3Dintel-yoct=
o-testresults



=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D

No high milestone defects.



No new issue found.



Thanks,

Debal Ghosh


From: Ghosh, Debal
Sent: 20 November 2026 16:44
To: qa-build-notification@lists.yoctoproject.org; Yocto-mailing-list <yocto=
@lists.yoctoproject.org>; OE-Core ML <openembedded-core@lists.openembedded.=
org>; Pokybuild User <pokybuild@yoctoproject.org>
Subject: QA execution for YP build yocto-6.1.1.rc1


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



--_000_DS4PR11MB3523039AE8224FD57E8AD90AA8F4442DS4PR11MB352303_
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
p.elementtoproof, li.elementtoproof, div.elementtoproof
	{mso-style-name:elementtoproof;
	margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
span.EmailStyle21
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
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
<p class=3D"MsoPlainText">Hi All,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">QA for <span style=3D"color:black">yocto-6.1.1.rc=
1</span> is completed. This is the full report for this release:
<o:p></o:p></p>
<p class=3D"MsoPlainText"><a href=3D"https://git.yoctoproject.org/yocto-tes=
tresults-contrib/tree/?h=3Dintel-yocto-testresults">https://git.yoctoprojec=
t.org/yocto-testresults-contrib/tree/?h=3Dintel-yocto-testresults</a><o:p><=
/o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=
=3D=3D<o:p></o:p></p>
<p class=3D"MsoPlainText">No high milestone defects.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">No new issue found.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Thanks,<o:p></o:p></p>
<p class=3D"MsoPlainText">Debal Ghosh<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
Ghosh, Debal
<br>
<b>Sent:</b> 20 November 2026 16:44<br>
<b>To:</b> qa-build-notification@lists.yoctoproject.org; Yocto-mailing-list=
 &lt;yocto@lists.yoctoproject.org&gt;; OE-Core ML &lt;openembedded-core@lis=
ts.openembedded.org&gt;; Pokybuild User &lt;pokybuild@yoctoproject.org&gt;<=
br>
<b>Subject:</b> QA execution for YP build yocto-6.1.1.rc1<o:p></o:p></span>=
</p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Hi all,</span><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">My bad; I somehow did not get this=
 notif via
</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans=
-serif;color:#467886"><a href=3D"mailto:qa-build-notification@lists.yoctopr=
oject.org">qa-build-notification@lists.yoctoproject.org</a></span><span sty=
le=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:bla=
ck">;
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
886"><a href=3D"mailto:paul@pbarker.dev">paul@pbarker.dev</a></span><span s=
tyle=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:b=
lack">&gt;</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&=
quot;,sans-serif"><o:p></o:p></span></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Sent: 20 November 2026 16:03</span=
><o:p></o:p></p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">To:
</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans=
-serif;color:#467886"><a href=3D"mailto:qa-build-notification@lists.yoctopr=
oject.org">qa-build-notification@lists.yoctoproject.org</a></span><span sty=
le=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:bla=
ck">;
 Ghosh, Debal &lt;</span><span style=3D"font-size:11.0pt;font-family:&quot;=
Calibri&quot;,sans-serif;color:#467886"><a href=3D"mailto:debal.ghosh@intel=
.com">debal.ghosh@intel.com</a></span><span style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:black">&gt;</span><o:p></o:p></=
p>
<p class=3D"elementtoproof"><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black">Cc: Yoann Congal &lt;</span><span =
style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:=
#467886"><a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>=
</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans=
-serif;color:black">&gt;;
 Richard Purdie &lt;</span><span style=3D"font-size:11.0pt;font-family:&quo=
t;Calibri&quot;,sans-serif;color:#467886"><a href=3D"mailto:richard.purdie@=
linuxfoundation.org">richard.purdie@linuxfoundation.org</a></span><span sty=
le=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:bla=
ck">&gt;</span><o:p></o:p></p>
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
to-6.1.1.rc1">https://valkyrie.yocto.io/pub/releases/yocto-6.1.1.rc1</a></s=
pan><o:p></o:p></p>
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
rie/#/builders/29/builds/5126">https://autobuilder.yoctoproject.org/valkyri=
e/#/builders/29/builds/5126</a></span><o:p></o:p></p>
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

--_000_DS4PR11MB3523039AE8224FD57E8AD90AA8F4442DS4PR11MB352303_--
