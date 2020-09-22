Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.4734.1600768701027185217
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 02:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=LZvMoiQy;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: J75nT4bslCMEiUQvCytpIKcxwtUmuFbifTEDFSlm8sOkkxXBq50/D9TlFWFTNtTW3n5F13Ej2r
 q+eWuCQId+rA==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="245411955"
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; 
   d="scan'208";a="245411955"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2020 02:58:19 -0700
IronPort-SDR: qw0NqnkVXrAx5Sjl1/cHloS3nYzjuZ473w7ASIX7dToBgdKnGOA6gVeqE0qCs/sqixncUJQX5g
 3h7abbJBFupw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; 
   d="scan'208";a="290346776"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga007.fm.intel.com with ESMTP; 22 Sep 2020 02:58:19 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 22 Sep 2020 02:58:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 22 Sep 2020 02:58:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 22 Sep 2020 02:58:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1jflYJTd70fOZe+pqAvxyfUJf+pj66XkwiENbQOlzj5qnWafaydoto/vGKpiv5HCtqJ5d6p7nYMhyAT6fIwjL+UdqAcM4cOURLIHkWOhrbHC8p/gEcbgObwhTUEnPKFdFR+I2LLSOQdol8Hx/FSZtcw/RxqHXHfjG2WFahaP66WKa+5UotjSiqQCFZy7pMRK56JQb7Pi+vCCH9JZbmWC/zOxTg0aWfjANLYOfFVSH1awp4sZWErFopGr3ZNP2REq89cI6xBR6Xvfgw0uFVfBNjzmCyKUVbacoVQDjtbfH5ehFoAwLFlcGulo0j+cu78CbEIddjMWKTl8VHHDL6fMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmhOjVhMYzHioTxVFIc5txzA5PL1ORobHo7Jc+2wUZA=;
 b=SEIdLnJkeUMHL6ifovBKyMUiMz6aMK2NBE7XneJqDR142slAsqTpPpn+ZXJe2nq2av5ZQGIbtXgpqSAlTtCibigXAeC5vjYlqWgD6QswnRhAmqcEkougI02duZAU0PKPMVkO7UyZavGXqocRBbJdEraOeCt1+LDSmXMu6gN0TzNv4x89J4Kr2YU70bcUfeoriLrt4jAEP2yc+PHHFW2TR50ji+lRJFaJH0A44FuWit6gE4HXJSHJcgghE7R8hNNNXqvXTmxDfUiNf+raaZHp1VVvnIMYHkoI3b3Xc07YRCQO4+3XrDWvDd/a6iQSvFrUBacmIfbgAQcbjmgtXyHg/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmhOjVhMYzHioTxVFIc5txzA5PL1ORobHo7Jc+2wUZA=;
 b=LZvMoiQyfca2Sb6srSwzIeRHbAZBkT0x2NVgg9n4GasqScg3TYacJwaXBolYVVA0S7n3NqMsyeJdYtRMalIUUYjoFNmm3RcXNLCqru/ZlZv4/9IgIoB+fsCCw5dvLJYi5YGr/pvZWsawYKpvPQ1YWquj4x+H5PMP5312pes0Enc=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BYAPR11MB3719.namprd11.prod.outlook.com (2603:10b6:a03:fa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.20; Tue, 22 Sep
 2020 09:58:15 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::86c:9bbb:7b9f:c30d]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::86c:9bbb:7b9f:c30d%7]) with mapi id 15.20.3391.024; Tue, 22 Sep 2020
 09:58:15 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"yi.zhao@windriver.com" <yi.zhao@windriver.com>, "Sangal, Apoorv"
	<apoorv.sangal@intel.com>, "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, "Chan,
 Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"akuster808@gmail.com" <akuster808@gmail.com>, "sjolley.yp.pm@gmail.com"
	<sjolley.yp.pm@gmail.com>, "Tummalapalli, Vineela"
	<vineela.tummalapalli@intel.com>, "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
Subject: Re: QA notification for completed autobuilder build (yocto-3.2_M3.rc1)
Thread-Topic: QA notification for completed autobuilder build
 (yocto-3.2_M3.rc1)
Thread-Index: AQHWjQ4yCMWxBsUgc0KoFt+1yvsaHal0cwMw
Date: Tue, 22 Sep 2020 09:58:15 +0000
Message-ID: <BYAPR11MB3624BA868E46991C99BD957AE33B0@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20200917161808.159C43A0D66@ubuntu2004-ty-2.yocto.io>
In-Reply-To: <20200917161808.159C43A0D66@ubuntu2004-ty-2.yocto.io>
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
x-ms-office365-filtering-correlation-id: 6fe58910-2f09-446e-1f2a-08d85ede0642
x-ms-traffictypediagnostic: BYAPR11MB3719:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3719F5EAAE49D4A3683EBF64E33B0@BYAPR11MB3719.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UIg2DRZVhRvNeYpmFAoqgMSfWiJeXAP25z9goXLBKxK/qVvWV1H3nfoeUMSqBHLPBhbT7LUuOObe+63ZII3WfV9QZgcuklJ/2DMq4l352S+4BHjitw/K/g0o9TKAtY2PMbydZKvcYA68kbR8UgTpBrB+tcfnIuTD3zxVIRVuiMhJpNscUaeotzmZm5i2OZKkQZU/ASBC9DHIP34RPsxg4MD4hemFn6pa/9u7Yze8IgYaX0QvbCP0LzODIsMYfa4sG8/PiIEoZlsRt8OM0Rv0y0Ia5b8MeVF1J+Ne4V29a9cu4EeSpnVzFWv5KAYEFjOWYoBzMualnuA3ZX1RT9PybUPbKrHNFz86Tof21pSDEeaxWu/cIqMh3uSbKlqPBfcbhKyPaWsLrRlgasfAtIm45A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(55016002)(15650500001)(5660300002)(966005)(71200400001)(83380400001)(86362001)(33656002)(52536014)(4326008)(107886003)(9686003)(2906002)(54906003)(478600001)(186003)(6506007)(53546011)(76116006)(8676002)(8936002)(316002)(26005)(66476007)(64756008)(110136005)(66556008)(66446008)(7696005)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 7CW9rsImZsT7UCfOJ6fN7ebWnupz/whpPGbJOtMPvLbds7iZg14xvwEF+VKmGh8TsxdkzpKXIagQUMrFk+N2TA3smI1HLHHbaluCy4bqA/sYXV21CRWhyqrpNOFdmM3KBWnLspm8Ctbe35iEG3wjWIlgaQFOf5UliwsVCOdkO4Foy2KnqIZJkIBbplsYyBD9YlulSxch4GJORSl4lnq5vBAqjjZJ2S/m/ODzc+tWaPt5AJv/HcLvH3v+HiPwzM1GD1u789jUreI2uay2lpZIMO0FibT8xUO56RRSd427PCKKOHYmfgByPhN2a7mlZObv7fVlcWEKFPmUCVgnUTFt/KTnH4o+pwZVh7r/gCQfEfe01d1Oz75lG1NhVNr/kG259ERQNHtXV6Oefkdb5jR/rBMpXJkK2JNhFD8qE1aVOq/gcX1iIGMUCEu5OKyIKniFGzK7LRjN4MYNsS8uPMwOs9WhScUUuEJHi39Z/LrSaUOjCGo4dXV48A7jH7wAQrGUIxAiX2erzYABVvGhxXkzeKtN49Aw0B7B/9W6iSZYlRBwbX15Acdg1EMPHbXQnP4xKq/IE3eeKJ8OED9AlTuZW7mVbigp/X0o7aecy1MnsMFdjjybNDhWL7q2tNfiSDWi6IrWTI8MTPptB6vlr+kG+g==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe58910-2f09-446e-1f2a-08d85ede0642
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 09:58:15.1883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DOHFi5LbjQiQQvhboQD4AY2fU3nPidcCB0V1cDlz3QV/yW6jLZsh0TYlu419zNeYhU0OYjy/+LOHugUC4Jx82g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3719
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

This is the full report for yocto-3.2_M3.rc1: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
Beaglebone can not boot up, hence all beaglebone test case are blocked in t=
his release.
No high milestone defects.
 =20
2 new defects and 3 ptest failures are found:

1. The beaglebone can not bootup (BUG id:14052)
This bug blocked all beaglebone test cases.
2. failure in oe-core manual test: test_dependency_explorer_is_launched (BU=
G id:14055)
3. valgrind ptest failed (BUG id:14051)
4. parted ptest failed (BUG id:14050)
5. pango ptest failed (BUG id:14049)

=3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14052
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14055
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14051
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14050
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14049 This is the full =
report for yocto-3.2_M3.rc1: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

Thanks,
Sangeeta
> -----Original Message-----
> From: Pokybuild User <pokybuild@ubuntu2004-ty-2.yocto.io>
> Sent: Friday, 18 September, 2020 12:18 AM
> To: yocto@lists.yoctoproject.org
> Cc: otavio@ossystems.com.br; yi.zhao@windriver.com; Sangal, Apoorv
> <apoorv.sangal@intel.com>; Yeoh, Ee Peng <ee.peng.yeoh@intel.com>;
> Chan, Aaron Chun Yew <aaron.chun.yew.chan@intel.com>;
> richard.purdie@linuxfoundation.org; akuster808@gmail.com;
> sjolley.yp.pm@gmail.com; Jain, Sangeeta <sangeeta.jain@intel.com>
> Subject: QA notification for completed autobuilder build (yocto-3.2_M3.rc=
1)
>=20
>=20
> A build flagged for QA (yocto-3.2_M3.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.2_M3.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 29081375659e3dcf1c578cd98ab2c8a2e9f07ca8
> meta-arm: 1f3cf5812c91cdc15f63737bf9b30cce665b2999
> meta-gplv2: a8da8eb127a56561bf633ab53bec57fb5dbba537
> meta-intel: f7580d72763653893c06e1d9ece7a77c4adb8485
> meta-kernel: cb7f0dc5bb1ea0998c8d4fcb486148d4cab575f4
> meta-mingw: 30a051401c0a73dfff486ca4d0303b434816200f
> oecore: 4e7506882cabf3936f0269c2a98f61c7d595d613
> poky: c6bc20857cd1bdfd25dfc50e413be84d1d12b189
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
