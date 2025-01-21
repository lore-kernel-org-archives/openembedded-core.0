Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D19EC0218D
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 14:38:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by mx.groups.io with SMTP id smtpd.web10.10949.1737443466060886191
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 23:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=kVmZ3u/b;
 spf=pass (domain: intel.com, ip: 198.175.65.17, mailfrom: munirah.izyani.mohammad.amin@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737443467; x=1768979467;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=ORWkhPNbt36AI0ONqtlgn7ZPV1sTW4xGvM8rFNL+m80=;
  b=kVmZ3u/bSbjuyiohyJnTosnWE3Zdd5CiaWZ9bmLM2Sq04uE6cEENaOrz
   9N+rnqzll5fnM1Q/tQ0509jkLHZyg4BnMosaQJ2sGzZSgaJQG0hrG9GNv
   nK+i7PLS41ECLAIHqZq40/qyilhH+w2RhFYA/yyCIPjgoRrYEk7lv0iuZ
   gngWyLXvOMhyi27o5QyPu7pOhZ6ma/NQjl3hCemJChUYb+xMSrkEZ5FFu
   RWgvjSRhwKUYX3mIk0T8md9ascGC4DW8NEtLVLfJr3kpy/H5KWEUZXp0A
   ksjrarAkiQo2OojSntGZ/JxW00CNCFxCDvxVVwcZrgo5bOabDdQNB24Wh
   g==;
X-CSE-ConnectionGUID: PmdAZ3d0TiWge6hTB722Kg==
X-CSE-MsgGUID: 7CgxsQPQSY+jq467W4J2LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37865854"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208,217";a="37865854"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 23:11:06 -0800
X-CSE-ConnectionGUID: OthRkkPsQQmDGQiYzG1cuQ==
X-CSE-MsgGUID: o3B5eXezQeGcL3y5JEvpyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208,217";a="137563445"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Jan 2025 23:11:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 20 Jan 2025 23:11:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 20 Jan 2025 23:11:05 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 20 Jan 2025 23:11:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rY9a5DoWISc7h39i6c4C3eeo3ky+0dN3AvA6jk3VC/n6u7iNdk/mhcJ+pqabqt7iemveyyFAw87XifZZVUfAUvF0sNHi/zza6t+MGGkret30LgVCWSEtdWCPL5C3W0AdvOxMEk+POdnVfyinJ29kEk3cPs/4u2rUwSwVxmudKPsZZSuzeWa88zUW3EDnnMhaTq9l8c10wMPOlxrWBRELqDvGAn7C3iz5vzVAzPpA/f5xDLdILH00v32O/Ow2nibKFKpPNhvEw2dMQir37bZrbFNiFKPeeb9aO86Ch9Zvl2gwghQSJ6CM/TbBijwjv6YYkufsc1BSuSFime+JV90FeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zo0pX7j7SWxRWeoXaFTlu+BxX4VrFXrGOxMsLUxDDZE=;
 b=gxE0Zqqk5i/B0I4gTBv9hR/oiSn6YVXPbawHXx9wmU3TX+O+uLKRnVootzwAWoARTkVPNjsNF6KJbwMBGmy8IIbeuo0jAJCF6RDv9kL9PrJE5fl6SVpMNnoEiVebHq77M307MubziQxYQFoqh/3c7DL3bVDv5ol1+Av3mYJaMUXc+KZg/oclIHK5cW9Pf5ZLtnFwuk+Z742X85thsV+miBQEkAxYrW+Nw+OCdX0gyeOgE+GskkFudk8eLtlyOEw+/kr3T+Uo2vGEeIGVLXRNnWouCbo6egvhK84WMN9I2oIbPkgqZ+0H0RO0LCL0Buj11nVh/DXQp09i1sou9dOXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5635.namprd11.prod.outlook.com (2603:10b6:5:35f::14)
 by MW4PR11MB6960.namprd11.prod.outlook.com (2603:10b6:303:226::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 07:10:27 +0000
Received: from CO6PR11MB5635.namprd11.prod.outlook.com
 ([fe80::8cfa:1a7f:d9ee:42cf]) by CO6PR11MB5635.namprd11.prod.outlook.com
 ([fe80::8cfa:1a7f:d9ee:42cf%2]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 07:10:27 +0000
From: "Mohammad Amin, Munirah Izyani" <munirah.izyani.mohammad.amin@intel.com>
To: "Yocto (yocto@lists.yoctoproject.org)" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-5.1.2.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.1.2.rc1)
Thread-Index: AQHbZfthhNWYoaek00S80gITBlHx1bMg2sU7
Date: Tue, 21 Jan 2025 07:10:27 +0000
Message-ID: <CO6PR11MB5635D88D33D4066159EE48888CE62@CO6PR11MB5635.namprd11.prod.outlook.com>
References: <CAOSpxdYu46-Ex3O_uyVhKc7rqSJhoYO8VXBOjTGm1tOOt4y=3Q@mail.gmail.com>
In-Reply-To: <CAOSpxdYu46-Ex3O_uyVhKc7rqSJhoYO8VXBOjTGm1tOOt4y=3Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5635:EE_|MW4PR11MB6960:EE_
x-ms-office365-filtering-correlation-id: b8a6db05-f0e6-4155-7ce2-08dd39eaaede
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|13003099007|7053199007|8096899003;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?vyh0YiRKU4MzvKJRM7gh9RmTIpADb5wMzAc5GhvsZoR7EmjPZ3p8grmdiu?=
 =?iso-8859-1?Q?D90N2MrABdN19g4jklcrEhC3fY9PrAXBQvN0M06rJfU83JZzWPnufNS5IE?=
 =?iso-8859-1?Q?zGH4i/76LSgsHzi21kKkO5Ny1ssg/w4cclpDGGVTMDsq5PoSRpkH/ucWeN?=
 =?iso-8859-1?Q?ReH6/wjJRmGlbn7JcY0EpQUIQD0BEyR12UEH8j53RT4uvDdSC1k99BY1L9?=
 =?iso-8859-1?Q?mZRgSYskLp714IWO0oH94Z7/oHaBpuNYu9S6NR+HHtbw+Fmixa6OgiSWfG?=
 =?iso-8859-1?Q?DmXjKd44KUoqNRgyNnzQiM2EFPFTjxppDll8mOYsXBPvssnjEO5pWGPVBe?=
 =?iso-8859-1?Q?3RtfGSHCEr8roYWT1HKWaXtxl5iQ6MMnhfnwUwjcx2eABzxisMOn7uiwjw?=
 =?iso-8859-1?Q?lJZvU6cXLamIZgzeeGfEZBe7FF6q2B9he3sH9Mrx/9mpQz+o5vkxrZ+o9V?=
 =?iso-8859-1?Q?SMmnQf3ZfxIompXSJw0byUbiw0qMKyUwaqQ/gFR717/6xUEmAYstpnaPwI?=
 =?iso-8859-1?Q?ZM9uMCIkMKkrk6jZ2drl0QtNiiZUlLgOfSqCwnzqU4GF230BpDuMondW48?=
 =?iso-8859-1?Q?U5HUmDFLf0e0wTGeSHvEFOnRK0o6tjtV+M0FDFwq+pAMiz+1oxqrdnVq4J?=
 =?iso-8859-1?Q?sSQhk84BK+S0sZpq7aeK8nffBnEoki100rR3knlXMJd4avOegAyo0E9T2S?=
 =?iso-8859-1?Q?2ZrQT5DnpZxgoK73vWHeXy//gN8B+cBczSVHEJdJav9E+NGTNOMVQtnLUN?=
 =?iso-8859-1?Q?vOGXg7+CExoe9VDwys8a++lgEdIEe7JpDO2Z6KQQPb9fdq6IOEeALKdelO?=
 =?iso-8859-1?Q?8uiTGqrbwfBQiqpaP9c3IDtzj9H/N4oXkeTSPK9czkzOBYvCqHJmq/pT8D?=
 =?iso-8859-1?Q?/kxJYIdQXVTvGzwrHQW6fsa9WGJuinM05cuONDtpG7h7nwcacrIrdet8z2?=
 =?iso-8859-1?Q?i2NBiuRuhUrZTMpZP2Zzc0PSV44CprjlzO/6S7ZA2WevseTjPdOHGKgd8j?=
 =?iso-8859-1?Q?HgvUxqwqUwa2h1trzc43bqkb8txzx/eEbqBR1h/SEqqJmET1xInaieWR6o?=
 =?iso-8859-1?Q?Up0FetUZabci+sm5GPSDoySlzfEOFJ91NSgmMYkUNbFHAO0jJbSGNoUE/O?=
 =?iso-8859-1?Q?ccaQwSnW/EIzYLLRKuOeWgAdaGk3uauHHWCfLwFMyukyAapJizZ3oQ5+UL?=
 =?iso-8859-1?Q?7N5tTr2FGTnBu27kH23iWdv4Gg+CL0YJVRBzvM0+xPekPSXgs2tPaOr3WL?=
 =?iso-8859-1?Q?c25YZapv0kHnoTLhKidr6TOFrQevVdcShFBE9jNhuOAm/u3OFs3aayFzB2?=
 =?iso-8859-1?Q?xEzxTCNY7ZmPOXU+fXcaYklhpCnennXYdo/pK8HRuSL3xbEn0zf3G77je/?=
 =?iso-8859-1?Q?35cKIRjY+q7ajJi4Ris6z3oUld5C11VNT0+v37iyN05KuBgtRpYxjKGMR+?=
 =?iso-8859-1?Q?MWsLoUM4y3Inog7T?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5635.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(13003099007)(7053199007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vH+rRI2kNU2Q+2+qXkME8ubT8Osko4FIa357iyrrZFrGLTy+rII+69LYj2?=
 =?iso-8859-1?Q?9yDKOcS8Ow0Y6eOP65iwwSUS+X56nsTeNSEuEYMffBq7UHb/cSzDdJovrx?=
 =?iso-8859-1?Q?tshACZKjCqJlzhHHQb1wrwzq23Df31fLP0/zb5BFY0Ce+e1Lt/toQngRRD?=
 =?iso-8859-1?Q?uE8JUvTCaFVB1Qjf7letWI7+AurjvyVEa8LR6DLkL/ALYjBRpi9gRini3w?=
 =?iso-8859-1?Q?AYvrUMcNSTbHFho8FQvwwaB71NkjGYr+1RJ9Bs+jXprHWCi+XyRUnhqosL?=
 =?iso-8859-1?Q?+jCb2yfzTw/F75WVrt59HBQQ/jvNmi6K+i1Ix6iivNxj4pey2lYKpiA9hI?=
 =?iso-8859-1?Q?bd0R3a0Phbh2Ar80Y458HOl501c4l+MBGdpT00gqo1SG1Q5qe56XzCBvxd?=
 =?iso-8859-1?Q?p9hrCFgb5IvCsNhCxjF1O0z4IDdHk4DGi1x8J40ZI27uektt6qba188Xto?=
 =?iso-8859-1?Q?uGKOjsvdSkGiTWywOOFrl/ci62P7oTYV+6GqV59/rdlArkDDPB7U92LrJM?=
 =?iso-8859-1?Q?+OEZZPXrfDOfBsRr5+DK/CyaSr/n3BQimaOl9EmJpEwdPfvj++rN6TueDC?=
 =?iso-8859-1?Q?KTL2zZGEak4jJBPZyIAppjbu6I6AKU+7NWmzmRNe4dfWz9O3x8/zkfWTVJ?=
 =?iso-8859-1?Q?Q2aZ+o1qjd0uRTrQrd+QUtlnd57dZWEIpL5Pz8tNR6F15mCywk/tyWKC4s?=
 =?iso-8859-1?Q?mo4k7Iw4GpKnd8brSr40WEVJPf8QkXCzp+h8LM4LG8ETNzjYdXXBW1suDL?=
 =?iso-8859-1?Q?Ax86iOB2T0DviAF9jOKxh9FhIhMCl1YE88WGJ7OxyPsLK+xUJSAu5lG5d2?=
 =?iso-8859-1?Q?bBDLzDYmCRZ86l5b0137aChyYUjvfCTgnGVp7MXhHfgbTJelnI7dKXBMX0?=
 =?iso-8859-1?Q?Qyu45v816WwXgxflVYTD04mGZP/Sbl+XDGh9Nascv/aitgTIBCtqOPHshA?=
 =?iso-8859-1?Q?fkFs4+3AiB66OacxRFPzdA/Qe1NVJ13w/mW/izQBo4mcMKgPzjVPGDlncK?=
 =?iso-8859-1?Q?0eOpr9rVKD7sKPybYuVfexMneH11927WfWhBzp4SfrGb40Pm0fWy4FmlwQ?=
 =?iso-8859-1?Q?cjP0F6Cg4BODVEqQUiZuZOZLZfoUphvXg6NZjwMkVGdWkX91G24ZEXe6Ej?=
 =?iso-8859-1?Q?pvYXl5gWy4YKUavBakQA3tIZcj8/V9WigI8OViDtfvSE/SSBiD6rfuaLBg?=
 =?iso-8859-1?Q?7Nzm9HjF1TypcDpWWgvxAblB5+4lwy5S+AlBLiBBEuXefZ+RGQimHD9jCV?=
 =?iso-8859-1?Q?KiP9b3yLmtKxPrtZurNAioUQBZ+mE4B0IIWf1YZfOsZh/S5EPvhXasLfxr?=
 =?iso-8859-1?Q?69VoCjVTSgm2AYsTO2XTuWl8/8QGKKjxfa8jAzsyD+wBueGTZQJQLtMiFF?=
 =?iso-8859-1?Q?pPGOMwOg3D0Fm4RMUwF1/g08fzNXZq3HUvH9ez/a7swAFLHs+J9UrCOMjP?=
 =?iso-8859-1?Q?tNyG8JElI6gXAvadsBYYZol3pGfB2PjGMusKaNpNad+ytMq8L3VVeHtKXw?=
 =?iso-8859-1?Q?hfzXveT9MQfRPCkzuUcBxFy4AxZkfaewqn0Sv9NBQFln/bJHz5EeztX/oi?=
 =?iso-8859-1?Q?g4yVmVRnvDXpgF7ipyZUlKkiqpcUELO7zyouXJ2+GCHBzALSocspD9Ozn7?=
 =?iso-8859-1?Q?iCU124Oq1wHDUl8KIeBHU3vXmqztfuWSrmcxdpPZdnuSyin3YOgmOQsOmR?=
 =?iso-8859-1?Q?uVoFZga9T2Bd1imeBp8=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5635.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a6db05-f0e6-4155-7ce2-08dd39eaaede
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 07:10:27.5278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pdVQ5hlxx7ZxI6URmTA5Psp1spsGpg0Rf+E6/+15Y4JKYyR0Jo5D/B7DxZPzUOeMYyGh0Frng8PWKO11WqP6PH49tl8g58Kn0YDnMKjuHjyWDnXtPPNQfNHZJQSvIiTs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6960
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB5635D88D33D4066159EE48888CE62CO6PR11MB5635namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 14:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210094

--_000_CO6PR11MB5635D88D33D4066159EE48888CE62CO6PR11MB5635namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All,

QA for yocto-5.1.2.rc1 is completed. This is the full report for this relea=
se:
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.

Thanks,
Munirah


________________________________
From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> on behalf=
 of Steve Sakoman <steve@sakoman.com>
Sent: Tuesday, January 14, 2025 4:39 AM
To: Yocto (yocto@lists.yoctoproject.org) <yocto@lists.yoctoproject.org>
Cc: qa-build-notification@lists.yoctoproject.org <qa-build-notification@lis=
ts.yoctoproject.org>
Subject: [yocto] QA notification for completed autobuilder build (yocto-5.1=
.2.rc1)

A build flagged for QA (yocto-5.1.2.rc1) was completed on the
autobuilder and is available at:


    https://valkyrie.yocto.io/pub/releases/yocto-5.1.2.rc1


Build URL: https://valkyrie.yoctoproject.org/#/builders/29/builds/801

Build hash information:

bitbake: 1452e74cc4ddfaadc6537a049877a66cec253c8d
meta-agl: 4ba957670efcaca623b69f24a377cf7666af193c
meta-arm: 0ef5fd96829b68977e6eb0d3b5e092283ce89f6f
meta-aws: 758084f63000fde083af5c76d2bda438e804c709
meta-clang: c709a5196f1e8654425b43b478064395386c36d4
meta-intel: d2e28940027808ea56f9d38deadb200a99a89805
meta-mingw: 77fe18d4f8ec34501045c5d92ce7e13b1bd129e9
meta-openembedded: 5d54a52fbeb69dba7b8ae11db98af4813951fa61
meta-virtualization: 247ea9c3880a257003ce2cc566fcdbb307ea4374
oecore: 62dfe689246d648f9970a5476716e486b1a33765
poky: ff9ca74e170480578fcdb1f7bcd897f0e69e46a5



This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org

--_000_CO6PR11MB5635D88D33D4066159EE48888CE62CO6PR11MB5635namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi All,<br>
&nbsp;<br>
QA for yocto-5.1.2.rc1 is completed. This is the full report for this relea=
se:&nbsp;<br>
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-con=
trib/tree/?h=3Dintel-yocto-testresults" id=3D"OWA509c7994-0fe5-3e38-ce14-fc=
9a25523db0" class=3D"OWAAutoLink" title=3D"https://git.yoctoproject.org/cgi=
t/cgit.cgi/yocto-testresults-contrib/tree/?h=3Dintel-yocto-testresults" dat=
a-linkindex=3D"0" data-auth=3D"NotApplicable" style=3D"margin: 0px; text-al=
ign: left;">https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-co=
ntrib/tree/?h=3Dintel-yocto-testresults</a><br>
&nbsp;<br>
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D<br>
No high milestone defects.<br>
&nbsp;<br>
No new issue found.<br>
&nbsp;<br>
Thanks,<br>
Munirah</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div dir=3D"ltr" id=3D"divRplyFwdMsg"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;yocto@=
lists.yoctoproject.org &lt;yocto@lists.yoctoproject.org&gt; on behalf of St=
eve Sakoman &lt;steve@sakoman.com&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, January 14, 2025 4:39 AM<br>
<b>To:</b>&nbsp;Yocto (yocto@lists.yoctoproject.org) &lt;yocto@lists.yoctop=
roject.org&gt;<br>
<b>Cc:</b>&nbsp;qa-build-notification@lists.yoctoproject.org &lt;qa-build-n=
otification@lists.yoctoproject.org&gt;<br>
<b>Subject:</b>&nbsp;[yocto] QA notification for completed autobuilder buil=
d (yocto-5.1.2.rc1)</span>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">A build flagged for QA (yocto-5.1.2.rc1) wa=
s completed on the<br>
autobuilder and is available at:<br>
<br>
<br>
&nbsp;&nbsp;&nbsp; <a href=3D"https://valkyrie.yocto.io/pub/releases/yocto-=
5.1.2.rc1" id=3D"OWA36401205-22fd-6e9a-5f4d-9c6f531c7d8a" class=3D"OWAAutoL=
ink" data-auth=3D"NotApplicable">
https://valkyrie.yocto.io/pub/releases/yocto-5.1.2.rc1</a><br>
<br>
<br>
Build URL: <a href=3D"https://valkyrie.yoctoproject.org/#/builders/29/build=
s/801" id=3D"OWA6503d628-6e3c-df5f-2073-11e485b4db2c" class=3D"OWAAutoLink"=
 data-auth=3D"NotApplicable">
https://valkyrie.yoctoproject.org/#/builders/29/builds/801</a><br>
<br>
Build hash information:<br>
<br>
bitbake: 1452e74cc4ddfaadc6537a049877a66cec253c8d<br>
meta-agl: 4ba957670efcaca623b69f24a377cf7666af193c<br>
meta-arm: 0ef5fd96829b68977e6eb0d3b5e092283ce89f6f<br>
meta-aws: 758084f63000fde083af5c76d2bda438e804c709<br>
meta-clang: c709a5196f1e8654425b43b478064395386c36d4<br>
meta-intel: d2e28940027808ea56f9d38deadb200a99a89805<br>
meta-mingw: 77fe18d4f8ec34501045c5d92ce7e13b1bd129e9<br>
meta-openembedded: 5d54a52fbeb69dba7b8ae11db98af4813951fa61<br>
meta-virtualization: 247ea9c3880a257003ce2cc566fcdbb307ea4374<br>
oecore: 62dfe689246d648f9970a5476716e486b1a33765<br>
poky: ff9ca74e170480578fcdb1f7bcd897f0e69e46a5<br>
<br>
<br>
<br>
This is an automated message from the Yocto Project Autobuilder<br>
Git: git://git.yoctoproject.org/yocto-autobuilder2<br>
Email: richard.purdie@linuxfoundation.org</div>
</body>
</html>

--_000_CO6PR11MB5635D88D33D4066159EE48888CE62CO6PR11MB5635namp_--

