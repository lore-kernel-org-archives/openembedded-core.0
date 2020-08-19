Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.85034.1597828166814168451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 02:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=h/mJXp2p;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: suHNhZ7twtGXCn43qN9GL2ahz4xGcYO12UcbI23pTyGXm9ulAJ4xvChQTcn+96I0n9PCx5dYbL
 A7WARRqKYiCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="152490188"
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; 
   d="scan'208";a="152490188"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2020 02:09:23 -0700
IronPort-SDR: 5ggdnLqoeq7kFplXU4t3jOF3k1RRgx5YojmQUlxeDDZbbmvFNOGCuxmYL9PYmC1GGhlrCqIhu8
 rObLfIYBoTBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; 
   d="scan'208";a="329271087"
Received: from fmsmsx603-2.cps.intel.com (HELO fmsmsx603.amr.corp.intel.com) ([10.18.84.213])
  by fmsmga002.fm.intel.com with ESMTP; 19 Aug 2020 02:09:22 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 19 Aug 2020 02:09:22 -0700
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 19 Aug 2020 02:09:22 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 19 Aug 2020 02:09:22 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 19 Aug 2020 02:09:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsKm7CNpW9Z/IHENvq7bBEUHAdZ/oA9gsrvG3oCGK9T3ywpqJ6Xzk4NimS+Ce0uEQbrWoSYBDBjt6qMJIHRWMrJ2RNaFUnh8Wv0poR9zfZvCvdTQO1IB4ZwTfqnPV7y89dxNgJOUbK6Tfa4dPl7yubg7XJvpcUCb3LjFPhzTqwecsi+iFdXgrbeLduuoIjW8M2+YTmZn1bDM+D5EYQLyZ7Epo0JfBqxUAgMoPVet/qTqA6ph/4Ddcz6+wOG3/3NgvdQwoIlzqduSBb9U3YxByeEh6LOy+m2bwbUnDVHRGX+bG0nhgXiYJLtIplvO91aljuQdeGYOJAYEoT1ttUUYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YN5Mlaz6A5OuR+HdIGlswt30pSr+2c+rl+Q/2YMUrNg=;
 b=HgqhHvN9VX9FBF817Ier5UALIVt4wL4vG4nOvl5yzezxs9ToUW+VkOF+QgumpL8Kblg6Eo+pnTttFlvcb1CCxrM8kgRp9CquaEpUbzrIDPQnYN4OBH6BwY8dB2BXJ3zYpYZwu86fknFDTjD17UDlcwqVTbUCcDvoAeU1KL/y22JJM7EfigpfpKj6QGQf5h/NyWIkQZ8vzzmIa/hHH8V4EDBFfhhlKd2Lc2eFk3YILZlmYpCDABsPgOEke7sUwLO3Jq6bWoI9clY8lZ9Kpfvn8SvbVdUlHpRf2UeJWuIR+KtWrasqbrfJd9uKba23sKAnjYSBkuXqCVRUXU89D8SZ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YN5Mlaz6A5OuR+HdIGlswt30pSr+2c+rl+Q/2YMUrNg=;
 b=h/mJXp2pKf69Q2vf7URrBF34iL3jIhF+Ux/hGBkL8SwmIU6OSEjU+j1sCWCeMOEs66k8FfE32rR2sZZR/dgwRL1dJ++97H1gdznwTFKy+stWEQabcJNyDkRbOOQkUzNjRXYBvQVA9jfZ8FkcuBUsYgq4ompbRH+1c5IoZBA49Wc=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BYAPR11MB3254.namprd11.prod.outlook.com (2603:10b6:a03:7c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Wed, 19 Aug
 2020 09:09:18 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::86c:9bbb:7b9f:c30d]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::86c:9bbb:7b9f:c30d%7]) with mapi id 15.20.3283.027; Wed, 19 Aug 2020
 09:09:18 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"yi.zhao@windriver.com" <yi.zhao@windriver.com>, "Sangal, Apoorv"
	<apoorv.sangal@intel.com>, "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, "Chan,
 Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"akuster808@gmail.com" <akuster808@gmail.com>, "sjolley.yp.pm@gmail.com"
	<sjolley.yp.pm@gmail.com>
Subject: Re: QA notification for completed autobuilder build (yocto-3.0.4.rc1)
Thread-Topic: QA notification for completed autobuilder build
 (yocto-3.0.4.rc1)
Thread-Index: AQHWcsHfJuA3Tf/D70ijCx0lKk/WD6k/Ku7Q
Date: Wed, 19 Aug 2020 09:09:18 +0000
Message-ID: <BYAPR11MB3624CCC0E73C6F4B2DE23F59E35D0@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20200815050617.E1710247EA@centos7-ty-4.yocto.io>
In-Reply-To: <20200815050617.E1710247EA@centos7-ty-4.yocto.io>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [42.189.136.88]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 606f7ee7-cd02-4179-6c11-08d8441f8dbf
x-ms-traffictypediagnostic: BYAPR11MB3254:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3254D44522A97FBD81EECF5FE35D0@BYAPR11MB3254.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +aHjbts+tCv8mQvwm72jBDoOMWozpDr958nCiPyd27qCbgfmZMkArwZzqVs8Fw9GlFI+XFjnVBOKdlGWaYnaAO14gI8eRprDR4foggN0lbdDUDtthA1Myw098+VdfYYTXIGTWlvQeV4fcExDiXWeSPRJr4JLS4Ll+U4zek82w/TV9jNTCmpolkt9pWK/XMRtP96r/ZdT1c6OZgx1L3nQAqL7NwoLVZKLbo1oHZnl2J69izQar9kHbKWQyL8S5lTxmwAvDtdCdfB0tsKyAmmx74nx+CWr3rq6jincEpT/VpUenrvPvWfNVqBgCpqBtpRnYLoWSYHMvPvD1NPOcuF76bZ94G/gwh/G1tA1KZ/Ofvu0awZx2xibVXLVSn11CdbrfOKLpz/qfUno1Pp9/UDZ9A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(15650500001)(8676002)(26005)(316002)(9686003)(55016002)(66476007)(54906003)(5660300002)(52536014)(66556008)(53546011)(6506007)(86362001)(8936002)(7696005)(110136005)(64756008)(66446008)(186003)(4326008)(33656002)(478600001)(2906002)(83380400001)(966005)(71200400001)(66946007)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 3CUHROo8yvuyyFf4kAheI4GFndtTmfY3iNoM+KK/W32OMAdKAE08j4jWGNgMME/xTaAPgT46fnZAwZt0M5gp1Phmm5u6ri9wIewmkC7D5H5mdIQMZs5nRIqLtSlIhCMN2EG5V9FGvXqG4Xnc93w2aMohSl0orOR7QANZ377fsgxXy1wZKy7Tk7N0AxJrwAQKE3pR5aqlxjOpM8pJMmhDm9s3v/18ls+NXzsWsuKFvviyQ8LwQ3U+eiyehyEh8bpgK68GrfKGjcY8RcA+1p/CPyUEo5fnfaotCMSlHDUyKnMvov0KX9UfoUOSp+iPMOdvy9xi+vXZgBVy/ywvZV1QG9I30FhRPoHS+HEogF9CA0oDVptzWOQdvdoXk/KdnXsncyT80oubdd0xA2KF51U/dMjSU+zFy65kLifzU6RCT1YA79CYCmNoGQJ91mg1jiS19YABFzMo/P/ssf+mkNlTmol/sgt5nKHa7/pOV+25WJqIRdCvje0Fx6rJWWKx88kvKkNLACi8OtT5fa6E+Dx6KSzPSvblcgNsM9oCxKzGUn6qsJ2V+lMV4Er0OxQFPAv/W7dY7KhHGehGJA48I/hgpYxZ6UWqfecwVUMTXYsz0th9FWlBNRtyX9ECWsiaW7wTSPQBrK/J9RtYJpmlTf7/Cg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 606f7ee7-cd02-4179-6c11-08d8441f8dbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2020 09:09:18.4273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j4Ocavt0eX1943ine6BBG9ZBITjSnEIDPLD6ENlBvQ6pBfeFXDVlvjhDUVIn0J6fBUgth+sQ+F31HeiBW98WIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3254
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

This is the full report for yocto-3.0.4.rc1: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects. =20
No new defects are found in this cycle.

Thanks,
Sangeeta


> -----Original Message-----
> From: Poky Build User <pokybuild@centos7-ty-4.yocto.io>
> Sent: Saturday, 15 August, 2020 1:06 PM
> To: yocto@lists.yoctoproject.org
> Cc: otavio@ossystems.com.br; yi.zhao@windriver.com; Sangal, Apoorv
> <apoorv.sangal@intel.com>; Yeoh, Ee Peng <ee.peng.yeoh@intel.com>; Chan,
> Aaron Chun Yew <aaron.chun.yew.chan@intel.com>;
> richard.purdie@linuxfoundation.org; akuster808@gmail.com;
> sjolley.yp.pm@gmail.com; Jain, Sangeeta <sangeeta.jain@intel.com>
> Subject: QA notification for completed autobuilder build (yocto-3.0.4.rc1=
)
>=20
>=20
> A build flagged for QA (yocto-3.0.4.rc1) was completed on the autobuilder=
 and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.0.4.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: fd279f857c98d492f43cc62d9ebae18ce6412b6e
> meta-arm: 38de27d05f104f989adfed5c5363464dd600b316
> meta-gplv2: 0f4eecc000f66d114ad258fa31aed66afa292166
> meta-intel: ce6f8ddd2d7f42a9fe530d30332b0d9695e4904b
> meta-kernel: cb7f0dc5bb1ea0998c8d4fcb486148d4cab575f4
> meta-mingw: 756963cc28ebc163df7d7f4b4ee004c18d3d3260
> oecore: 9cad716656b427e625a470a820b8b29b1ec9f976
> poky: f2eb22a8783f1eecf99bd4042695bab920eed00e
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
