Return-Path: <andrew.goodbody@cambrionix.com>
X-Greylist: delayed 73185 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 23 Aug 2017 16:10:30 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0091.outbound.protection.outlook.com [104.47.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 0B23177BD2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 16:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CambrionixLtd.onmicrosoft.com; s=selector1-cambrionix-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=v2V3rgh6Ty6q2n56uPMsb4KFtZJ7b1g5nKd9Fqf0xpU=;
	b=o/W7xzJbyhtpQ+gzMWQ5W7ZAJ1E3M82dWPJFJ2pYTH6zJlrEVynYbbYVaqTAh7Un8kYiTmEDaEIft/x9cYk7NsCM92W98u8fekbfNikiQdX9vx2SK31AWwGRT7rErTc2YryL8gkYGojsFKzUT+uc3pa/3qzwpdkSk+u46JhJOZg=
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM (10.166.249.144) by
	LOXP123MB1128.GBRP123.PROD.OUTLOOK.COM (10.166.252.24) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1362.18; Wed, 23 Aug 2017 09:35:31 +0000
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) by
	LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) with mapi id
	15.01.1362.019; Wed, 23 Aug 2017 09:35:31 +0000
From: Andrew Goodbody <andrew.goodbody@cambrionix.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Change to kernel.bbclass broke kernel build when gcc does not
	support -ffile-prefix-map
Thread-Index: AdMbP/IAS7YtOOP4SGipYQJELqD0ggASnOkgABogb8A=
Date: Wed, 23 Aug 2017 09:35:31 +0000
Message-ID: <LOXP123MB01173387AE504E429A277AAC85850@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
References: <LOXP123MB011794376CC584AF9CC750B485840@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<6E51916E4A1F32428260031F4C7CD2B6119EBBEA@ORSMSX112.amr.corp.intel.com>
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B6119EBBEA@ORSMSX112.amr.corp.intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=andrew.goodbody@cambrionix.com; 
x-originating-ip: [46.17.166.30]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; LOXP123MB1128;
	6:UhGgBynxc+kfcEiFjK+1v5oqZc+S/cSlOgRutGi2QITneV9dTkiSOazSOvW8p3MMzEH3kCwuAB7pI7U29yOxdYO+Un2E06vWrVqs65XNUa+M4TV+m8jOxtkTzRajnnp1stiM5CX0qQC/QsL+3aK7tXur7TrWkOpCtVQ7FpDcsuNZMA7ebxn79lYcuCdpzBzcAeRgZrvHv+Cff+vKcIBZEDGYLa5Opc14+0LPSt2zikPIIFs+9jeHkLQyglJtwJzt01gKZdSVV7ZNhWFP9t3ww8yKA8y5O9VIV3CW1DY2olK/3sQRbTdnyGrBX2u29qDk9oGVAGricj/w8BEbeqjhQQ==;
	5:2OrITeyvaI7h7iLOkOM9eDp3DKFCk3n68nAMJWOoUx4L6Ey47TGH1wfXuqv17Lx7AiNHgaMSeRH9yZtNi9pxBENBh3vVkeR/Qkf1EgyrrkKM9XhzhAeWDISjox39auSNyEuAUEw+Kt80sKZAU/bpiw==;
	24:UAk3lMuIKLv0SbSSo3hdrNJcHuaNDkWkmvCXVyiVO8UYUy1FUEh+Gzvs7vr9NTBjLfdzC5tbp9+umwoQDd4pDgr7XH4RGerGc8cUd9bFwaE=;
	7:MKP8eXlo96YCpUmRV6RLcrAsF3HCeUdf0b8G+TWcpgFyC3uiP6qvfW5QZ3+BDd9CIjJmFDgnjkmwCBcmc+ZivpRHq/s3ms1PkAZaC1lXq3xt44/UeDGy1/NQn68gEeRg1Gb12kvX5Y5gL5MsF8fTr/YlmSCrRYsETE5Z1K6q7RkVgB7nbyeWQaucVwreBdeVpyrKuLK9rKEeDlvogGNpDwM+21KTgH88Hteg0M9nYEM=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: b3cca1c4-63f5-4c89-9e30-08d4ea0a4c04
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(2017082002075)(300000503095)(300135400095)(2017052603182)(201703131423075)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:LOXP123MB1128; 
x-ms-traffictypediagnostic: LOXP123MB1128:
x-exchange-antispam-report-test: UriScan:(228905959029699);
x-microsoft-antispam-prvs: <LOXP123MB1128FA6EA941FD559BC05C5485850@LOXP123MB1128.GBRP123.PROD.OUTLOOK.COM>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123564025)(20161123560025)(20161123555025)(20161123558100)(20161123562025)(201703131423075)(201703061421075)(2016111802025)(6072148)(6043046)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:LOXP123MB1128; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:LOXP123MB1128; 
x-forefront-prvs: 040866B734
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(199003)(189002)(76176999)(229853002)(50986999)(66066001)(77096006)(6116002)(9686003)(3280700002)(14454004)(966005)(3846002)(6306002)(189998001)(54356999)(102836003)(3660700001)(53936002)(230783001)(106356001)(105586002)(97736004)(33656002)(2906002)(25786009)(68736007)(81156014)(8676002)(305945005)(2501003)(7736002)(6506006)(508600001)(7696004)(101416001)(86362001)(55016002)(6246003)(2950100002)(81166006)(74316002)(2900100001)(8936002)(5660300001)(6436002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:LOXP123MB1128;
	H:LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: cambrionix.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: cambrionix.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2017 09:35:31.1088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6eddda96-aa38-44c8-ab83-12529d9cab1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOXP123MB1128
Subject: Re: Change to kernel.bbclass broke kernel build when gcc does not support -ffile-prefix-map
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Aug 2017 16:10:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> From: Bystricky, Juro [mailto:juro.bystricky@intel.com]
>=20
> Yes, the issue was reported by others as well, it should be fixed by this=
 patch:
>=20
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=3Dmaster-
> next&id=3D2b7646a113cca7698d8484fe14bdbb8683a5f8ab
>=20
> > From: Andrew Goodbody [mailto:andrew.goodbody@cambrionix.com]
> >
> > My build uses a version of gcc that does not support -ffile-prefix-map =
and
> > this is now broken after I updated the tree to include the latest commi=
t to
> > kernel.bbclass "improve reproducibility" 012a70da7ae0617 by Juro
> Bystricky.
> >
> > The patch introduces the line
> > cc_option_supported=3D`${KERNEL_CC} -Q --help=3Djoined | grep ffile-pre=
fix-
> map`
> > When gcc does not support -ffile-prefix-map, the grep will exit with a =
non-
> > zero return code which is caught and causes the do_compile step to fail=
.
> >
> > Thanks,
> > Andrew

Great, thanks,
Andrew

