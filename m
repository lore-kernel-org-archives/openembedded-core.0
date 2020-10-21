Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.6370.1603251274225939738
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2020 20:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=R8xwspqu;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: W5JcF9aFmk0c15ww7L/jhDmFc2sGAEE1Kzbfzuy0EjR1URL6OBP87w9HarltcT2bmncr70+u1D
 0TvmKmzg94oA==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="166532522"
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; 
   d="scan'208";a="166532522"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 20:34:33 -0700
IronPort-SDR: sanahUpoxFVnkXBDkY8AOFVjUVxmZbSSc4RyLnmoNkrp2bRjt25tJ+S3o2i7VIKpiFG1GgOelb
 kPsVVXCLTEsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; 
   d="scan'208";a="466151208"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga004.jf.intel.com with ESMTP; 20 Oct 2020 20:34:33 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 20 Oct 2020 20:34:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 20 Oct 2020 20:34:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 20 Oct 2020 20:34:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rph8T4lrl7RpajkvApaz+yxtWx3MyUvh77fh8GcLpolxktfN5fnmSgrqWRF3IJrXi8dJVwspRvYkLBhl/az0U+hBlI/ciCNQPzavW+8F9UkEldfSs8VLGaxBNkcBMUuV+Krt5gQnKeuhY3ZFuF7BYzDSBdl44BmWz38iY+LqNv3wVkSLhYYLcNtirUw4VV+d6SHrhmVxFCtpCHHsUH+fP0Ix58xQzKdaQQAiH/zmvfAv2DVodlIx7MmLcdiP8BagjGmpwGSPpokUuXb+uP7tw6q+blrqAYLyHnP2i0t68/EKPnzcF9N4qTB0RHHTIMvhzEzahfTAbJBgcY8AE87+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkYcuSeWQCD52EZ/0u9cilRBa0xkpPStbPjtB6a34u8=;
 b=V8Sk5QLHBYhho5KxlwJtvY//A0vPs12yO3LT3TnLFfnqbzsD3+jIcNPqIWePwkjvQxzZAxhhT9TKRy4j2xla0QQCvxHkt9WN3rxL+8V+L1C/rUy4JZsmYWNvhXlmUR8vLsoGeyajk4tmiE0FQ4LjoZ2OXEj4PGFS+od+Y/XiCIvB/8wXzyRLmUCMcFpu1mUKbEpJVga22EyOjDpbiVadlL8DppxlVMTBH/T6b5LwrDKwyT11JJl7/lU5pT1EXOxzlepWmPKSX4SfK3bCNpDv7j2OyKOilPM69k+yHplRNWGB+1IDA4ddUtJogpQ899Vqjrn2UA1qY2sQVSRJoUZDIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkYcuSeWQCD52EZ/0u9cilRBa0xkpPStbPjtB6a34u8=;
 b=R8xwspqukjHJKg9e8MjXmKqNtZ4kTsKyjaQt+ZhG3D+nOjnzR34AWm3WgBPfinLLQcXrJEuDBihJ9FZk42L4gvXr7LWTEJQ9uB5fb7mIDcIsAlUzvH/XfarE++h0REo6PWsZOEPN0XepfXkbzaY7fBLGe41C/JYTskdwMVp1dpA=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BYAPR11MB3478.namprd11.prod.outlook.com (2603:10b6:a03:7b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 21 Oct
 2020 03:34:23 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::54ff:e9af:311:a985]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::54ff:e9af:311:a985%7]) with mapi id 15.20.3499.018; Wed, 21 Oct 2020
 03:34:23 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"yi.zhao@windriver.com" <yi.zhao@windriver.com>, "Sangal, Apoorv"
	<apoorv.sangal@intel.com>, "Chan, Aaron Chun Yew"
	<aaron.chun.yew.chan@intel.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>, "sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>,
	"Teoh, Jay Shen" <jay.shen.teoh@intel.com>
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-3.2.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.2.rc1)
Thread-Index: AQHWpv8YGcjMroQZV0ScEd/oabnWDqmhZ38g
Date: Wed, 21 Oct 2020 03:34:23 +0000
Message-ID: <BYAPR11MB362449F8E07D7D67B5BA08F2E31C0@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20201020163538.0C38244D07F@centos7-ty-4.yocto.io>
In-Reply-To: <20201020163538.0C38244D07F@centos7-ty-4.yocto.io>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [115.133.103.117]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 393382dd-582b-4008-8f73-08d87572341e
x-ms-traffictypediagnostic: BYAPR11MB3478:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3478AB5E9D252CDD04B3D5F8E31C0@BYAPR11MB3478.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z3CAL2EhfC8bJmIHIISNlsKSXUuxvLZxJrgscWov8+OHbf+yU1zSOAzr2lcik3ozTvWQl6c2lHHFQXfm3vv2VK6v5Sf0SgWHLBKG2P4L8OFkj8uG1YVqNX8Er3yNYa8T4kCJVAKnUzYvnakSh6gdFB7QcrBnr++t1U0U8mUQ4iQ2wseUmYyEatsT3Ame36mO7zEMeXZqhumuNeQeTYO+/JVp+RFN0P59PKm6ZK3iLajQ4Jssi2OxUkmDOd+XfLLaOpPLoiK5i1u8MCFGtst9oH4QpLU7n5moqGSoOjcYazyhRdy03VtBWvfnru4A4fegk6wtAuIYEaR5dUhFjEzWD8I3Jr9iSz4e85jSvc/HzaQ8hKdYkJcLtGLPUcZAwB2VmSTfPENGHtRO9kXMEC+Hrg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(53546011)(15650500001)(52536014)(7696005)(186003)(9686003)(83380400001)(8936002)(6506007)(33656002)(71200400001)(5660300002)(66476007)(66946007)(478600001)(4326008)(54906003)(55016002)(107886003)(316002)(66556008)(76116006)(26005)(966005)(110136005)(2906002)(86362001)(8676002)(64756008)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: cjPR5ig6e4TjqI9gEL/Yv7C0SR2548qTQkq32EgPOeEP9El92DpqfxhfKqFLSV36onIK5Kvo4VjBvGT2vzUAgL0mfq8m70xSQ7C3nfWzIeL1bW44dwPwZCD8T7+LHspzlAlgC7+m+s+Qj6mY0J8OrfzEKFyx2yjjnf+EevvfbfypwihU3HvRefIAEptWl2CmP2OHgS4Phbwo1KTA0YOA4aQkFCEtF9u/rF1bj4NBG9yy8mA239D9EoK78Tk72SY8PmjRL8m0NrT2Xg93yh6VkGWTmhtCIQsv+Htvbl8F1KS4wIKx1PCJnNkz9zzfZLpsIaEhnzPCaCFBZmsk5mJBYg6LuekGuuCHiAe6qr0/3v8HP37OFjKSesrOfvD2+DK4KhCs+6mPUdz4Uy5RCogj15ejOXx0NjkNl6tqK+81V6IAf1Pt80+RrbALh4128Q2BAcshB9+Qis+yXpnu7GQf8WKONREvs9DXEhC6YtZOQEJJ9GqygsNC79YTGCkI5Xm6024gCklAPcTtdboqXALxwcXQP/ELMCQBLCQQaFa/MfuSkgMZ/R02ihx4bE7y7jAif0+rNgr3/YEatvWnDXM2KA/RNCKstTJVPwU5sCVqgCjJ2cKhd9JquGpNX0NOWIECAdXXK326yhZ1K28aUW/wDw==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 393382dd-582b-4008-8f73-08d87572341e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2020 03:34:23.3075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0TkUPke4GE/rc3gKt36tlwElHlcFGu3dxQGnbuht+C1JkNewrs40LGzAx2JplSdLhE52AYDWJjib4JgMHx7sdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3478
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.2.rc1
We are planning to execute following tests for this cycle:

OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw

Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. Coffee Lake
3. NUC 7
4. NUC 6
5. Edgerouter
6. Beaglebone

ETA for completion is next Monday, October 26.

Thanks,
Sangeeta

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Wednesday, 21 October, 2020 12:36 AM
> To: yocto@lists.yoctoproject.org
> Cc: otavio@ossystems.com.br; yi.zhao@windriver.com; Sangal, Apoorv
> <apoorv.sangal@intel.com>; Yeoh, Ee Peng <ee.peng.yeoh@intel.com>; Chan,
> Aaron Chun Yew <aaron.chun.yew.chan@intel.com>;
> richard.purdie@linuxfoundation.org; akuster808@gmail.com;
> sjolley.yp.pm@gmail.com; Jain, Sangeeta <sangeeta.jain@intel.com>
> Subject: [yocto] QA notification for completed autobuilder build (yocto-3=
.2.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.2.rc1) was completed on the autobuilder a=
nd is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.2.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 9345d257ced432adc2d16af20ace58cc7c086aab
> meta-arm: b419151acd2761d0e2723f0d0c0bbbed00c45c5b
> meta-gplv2: 6e8e969590a22a729db1ff342de57f2fd5d02d43
> meta-intel: 0e4b3cb01735bdc5ebf50c547927f1f59b0248d2
> meta-kernel: dbf8bdfa6683404e5071feb47ef6aa347cab1b01
> meta-mingw: d2809d7c93bdb46014e1f8b3b0a4f42030078905
> oecore: ea8ba9a15bcec7f5fbce1f40170298f87a808249
> poky: 4e4a302e37ac06543e9983773cdb4caf7728330d
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
