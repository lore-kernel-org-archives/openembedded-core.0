Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.60])
 by mx.groups.io with SMTP id smtpd.web10.188.1620311795765112453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 07:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=VgKjNmcj;
 spf=pass (domain: spinetix.com, ip: 40.107.2.60, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQgYmXwjIe5AuQrG+CDQAcxGeH+0Va+N9VuKCwbciMzwjdKnZ8soqgYtOhRL1d4KInVYXNEoD4aXDLM7pkN7OlsC1xml8HmlmKMoxUxBj+AbR1CmFmpIniFcBRu7W1iYlyro2g6b/gXtd9q3new4djxANc5WBPFX5bGdtBWzRjHUfG3vPExKDxxBYhMbE0LMI3x2/Ecdf4Yp4eoC23mklE+dt5TVdGKyTVQRX0Vl6SU4kaIZVKLNd6l+92LzkviqpizPUoKh6dNsyz1pSVK1RaL6TiJszYEKngNjSKvyGdIm2S13VnPOOASFic7U5Q8LwiYC75cLOfdRLWyaRqWA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DYSSF21zt98H4ejMSrbPHhytLRy+nsN0qR+eEG4IGY=;
 b=CJ4FDWee3LB2OhnMCoPeT/sqrHg0hIpWA575k+j7Ep+i20sFA5eJmRX6eYEClDQ6G1yvA4RDMbGdD3vPaZfU3FNwGePVGjiGt+roqv3kuDy2vXQ1EKQGNWqxIO5fYChrU0wKkjO3l7eQmisbzhW3+Ka8mcuK8ucf5tYiGANjFs/nKodb/+yZToGFUBHRAc+cghqoAFtZe8ZZAH+RdL9sYf4QvDzhnb+lECPn8x934fqi2TjgdGRcskewS7MDNy3H4XArp8mENmX8sqRMiXlqOYsNR8jURJxbno9/vIaIVjQ4Tj0ny8rvdfhsN0VczrWHWehYJvxmP+sL3owlwICRCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DYSSF21zt98H4ejMSrbPHhytLRy+nsN0qR+eEG4IGY=;
 b=VgKjNmcjTvfAG6lll/ZJOyTYgwtM4I7fVDRP/17dfNwQMkrIB4aOMhYGVLaE+gNH0Ntw+l4kRqB97+kTk+cX37stz2LDJUe6Nu52F8eas9Yfa0Fnfh5TezsRIEAII1aFryCQQiF882ZhUUnoth+ooMQ4HWtIniOwQf6yD2aPC9s=
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB6PR0101MB2311.eurprd01.prod.exchangelabs.com
 (2603:10a6:4:44::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.40; Thu, 6 May
 2021 14:36:31 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::d4be:af2c:d43:bcc9]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com ([fe80::d4be:af2c:d43:bcc9%7])
 with mapi id 15.20.4108.025; Thu, 6 May 2021 14:36:31 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: Steve Sakoman <steve@sakoman.com>
CC: Steve Sakoman <sakoman@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Mark Hatle
	<mark.hatle@kernel.crashing.org>
Subject: Re: [OE-core] Unihash warning building kernels in Yocto 3.1.7
Thread-Topic: [OE-core] Unihash warning building kernels in Yocto 3.1.7
Thread-Index: Adc94keMh2EjTyR0Qb2I9MEwyjYHOwADn9mAAAAPM4AA5WHzsAA+4KIAAAC5NWA=
Date: Thu, 6 May 2021 14:36:31 +0000
Message-ID: 
 <DB6PR0102MB26309EBF540D2928933078C988589@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
References: 
 <DB6PR0102MB26302BA4C54F13FC351F8C0A885E9@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
 <CAGDS+nk51u31+-NR2k1u-y375RL0TyCEkm9L=7Va7eQcuRQwCA@mail.gmail.com>
 <CAGDS+nkq70RdM5SRVTabnsY5i4aB-VuDeeFraA9kyc=1HoCREw@mail.gmail.com>
 <DB6PR0102MB26301A3BB6E92C6EAFE8200788599@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
 <CAOSpxdZwJ5t0P1cB+6jx0+9bcMgrg8Lc7M=f7Ghth8d_wF8smw@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdZwJ5t0P1cB+6jx0+9bcMgrg8Lc7M=f7Ghth8d_wF8smw@mail.gmail.com>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sakoman.com; dkim=none (message not signed)
 header.d=none;sakoman.com; dmarc=none action=none header.from=spinetix.com;
x-originating-ip: [178.198.240.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fe1e693-19c9-4290-87bf-08d9109c5763
x-ms-traffictypediagnostic: DB6PR0101MB2311:
x-microsoft-antispam-prvs: 
 <DB6PR0101MB23113244C2A02CBEECC05FEE88589@DB6PR0101MB2311.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:119;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Q3Ctls+T87QA46V0D3jhXnFJIjZwRb5jXjDppWOGSXccUKgk6BTFZO09X3R2hwPLrML533Gwy2unSyItNVwf+5BD2CBzpKzk/2OLKoQDUM7oG7s+8zhA2XDMJmA0496uKUDwz6eeC1uf/6AIsJGF69+HAjao6ZBGcWW4kuu7hfagOh1wI7Qx4YUIIKUreVTBqrwq/eeKlDKyPd8NjmGz6g0CWZr+K+rAbr7yL7r7rkqw87MUa7I9ZLjlzTqQ8YCOhap8JbPNAaSvk3zX622uSbdi8wD6fvUxIgW8Dk0Auy/usH0GkVfHv9iGh9XyMkqNjc7cApWEUW33Q3xd5kuGjuWMngUtoWSr2d5mHBE0CBJ92RnIXDCxBbj9AZjMpqIq/88Wmd/cz28Syghus1zf/wMiRPio4bB58I4t3hU6MCTDVxNDAa6umdzzf7IGO3lzXlHdZhnAONAUUBUMn/p/AhHTLzTkB9SNQzr6OW110yO3Iezsx9tNNI2KyJtfTRzbDf0EfCFXacWCVuQmcH9wDnk3ySLzitqDhLOzJXkayZt53ASS7NqIBGO9HfB/O0NFNPQT66nme806S3DPgTTIZRC3vnJLpEWuoKWkIXAfH51ZmMQqznxGdlyp4bqB+Wzuk2nWyXYhPO2FuwSQftJsrg06wW2sH3YltrX6HeLwTOcIGRawhUzLUGgxKYj8RWam
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39830400003)(376002)(366004)(66556008)(66946007)(8676002)(54906003)(316002)(66446008)(64756008)(66476007)(86362001)(53546011)(76116006)(5660300002)(7696005)(52536014)(6916009)(8936002)(186003)(45080400002)(83380400001)(4326008)(966005)(71200400001)(26005)(478600001)(6506007)(9686003)(55016002)(33656002)(2906002)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?euBBhkvC2D2l0oN1aHcyximq6KMKsI4NnLpjCQlVv4xIgdTEVcdr/TYpZCZr?=
 =?us-ascii?Q?sTf3V0KippghA22tKUnelsaBUe4umk/Sl1HaR/aqayxAP796Zf6UTN222Ios?=
 =?us-ascii?Q?bmH/tY85R0EyIW2GCGA36eS8e6SgNhc2ucX8k00eGGOyNHYGcozpydgkoXcP?=
 =?us-ascii?Q?C5lGdjRhVQhdxdLl/Up+syTSFzp1AzsvbOGT4CgUvZ6WiLyn6qy0Jt9FkhWD?=
 =?us-ascii?Q?WPjJMacvs4HI21b0Dg6l9m61dhY5kZqvM1mvDinZWEDju/lFJhbrdtZECLoe?=
 =?us-ascii?Q?KdtAJchHHWo8Mbf/IL2gq+iPv+bWTqJMnutBHRJ2F+Lz47OC1ofXgERSMZ5N?=
 =?us-ascii?Q?r2jKrz8N3qmnngyajHsWYkfF1hlgaaotc+qlDXjkFiFJ8ZPaoOtivzSTa3n4?=
 =?us-ascii?Q?1FI8t4xsWapssKH/Qoi+EhNbvsn7bL9OnaRm/ka/6z1ZLbRMBUT92YPo5TKq?=
 =?us-ascii?Q?9m39alIQwr40mLKpL8AHyczEmN8Wzy8eoHVACdJUgwJZC+ZchuejWOQDgVXi?=
 =?us-ascii?Q?qan8JkGbE7yPJgU4gr42Y4eg2m1t0xBCPGKtT0yINyBzEGYODFDQex1ZVJ6r?=
 =?us-ascii?Q?0YGRhUGs1G6dvenRCkX3COw66xvcKyjk/IjaTM6OhGOzxpxyEH1kO3dyljRS?=
 =?us-ascii?Q?VT0FPILumZ2ux+18kj4uJxpgh2dDz+E2fOJl5+s74u/0Qaj8Sefx/ffhlEPR?=
 =?us-ascii?Q?A/0sFVb+iY27ze/UQBlRRat/aJaiPJ6owAfFdKGXMBFLj48OnTZX94rwqxMR?=
 =?us-ascii?Q?M1PiRok/7feKlvhNhtWMuruQlDT0u1MK/IXr3w06ST797YhRlhvXKNxf26V+?=
 =?us-ascii?Q?r2wRj4ZfiGqEjHwfvrr9NtT9enVSqz+96ozXExVnLa+zjkYSNC2GnS66I9hR?=
 =?us-ascii?Q?NcgTmuCEtQh5bmZwBqv1vc3r1bWYthAcPe7gkvey8ViIVWfE6oYaFGwaS4tG?=
 =?us-ascii?Q?glvY1qTXWG42TRWodKRntGZVlo4OuaSzxNSaVBaI+pO947LTCAjxNNw3u9sW?=
 =?us-ascii?Q?yeYbbKaSIJ05M0BftZdLRfG95xJqcPCkEQKsRvnwiq/eyv9peu9vp6sYBbkM?=
 =?us-ascii?Q?yt5daom54A9Zn1d14evFsVTfRyjHkO+9cDlADs6zrK3goODl4EmQ2Ch1Xk2D?=
 =?us-ascii?Q?dnn9vmcOyg3jAIgoAYe8TOXaBmFvoZ2VlZWvOZCcdbnTU1b5XVirGHf5+jnt?=
 =?us-ascii?Q?XB4hKkjxHOPFQZ0Vgt75WHo/zRVjEemqoy4ex4ggv91zh4NMYc+7uTBzvpQ3?=
 =?us-ascii?Q?3KQoHOugovGyKxlqOGI7v30oPOecyMMsx3/W+6OkSH4DuhHG37HYCDxSPMJR?=
 =?us-ascii?Q?WX5DpK36NIZx9CiIfavyJbCv?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe1e693-19c9-4290-87bf-08d9109c5763
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2021 14:36:31.4760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c1ZdZnND4UF9q4WVWZIbUqKeOEfscXnrQ2Dsx6PAUYULa6SmrslR1wblVojByvu1Heqda0zh9LF28YDUjpAILa0grlCSaW1yAE9WNa9NXYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0101MB2311
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Steve Sakoman <steve@sakoman.com>
> Sent: 06 May 2021 16:14
> To: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
> Cc: Steve Sakoman <sakoman@gmail.com>; openembedded-
> core@lists.openembedded.org; Mark Hatle
> <mark.hatle@kernel.crashing.org>
> Subject: Re: [OE-core] Unihash warning building kernels in Yocto 3.1.7
>=20
> On Tue, May 4, 2021 at 10:17 PM Diego Santa Cruz via
> lists.openembedded.org
> <diego.santacruz=3Dspinetix.com@lists.openembedded.org> wrote:
>=20
> > Any news on this one? I have been doing our own builds with the
> equivalent of that patch for our BSPs with a linux-intel derived kernel =
recipe
> plus another internal kernel recipe (both using kernel.bbclass) and I ha=
ve not
> found any issues with it.
>=20
> This is in the group of patches I am currently testing.  So far it looks=
 good.
>=20

Great, thanks!

> Steve
>=20
> > > -----Original Message-----
> > > From: Steve Sakoman <sakoman@gmail.com>
> > > Sent: 30 April 2021 20:46
> > > To: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
> > > Cc: openembedded-core@lists.openembedded.org; Mark Hatle
> > > <mark.hatle@kernel.crashing.org>
> > > Subject: Re: [OE-core] Unihash warning building kernels in Yocto 3.1=
.7
> > >
> > > Trying again with Mark's correct email address!
> > >
> > > On Fri, Apr 30, 2021 at 8:43 AM Steve Sakoman <sakoman@gmail.com>
> > > wrote:
> > > >
> > > > On Fri, Apr 30, 2021 at 7:00 AM Diego Santa Cruz via
> > > > lists.openembedded.org
> > > > <diego.santacruz=3Dspinetix.com@lists.openembedded.org> wrote:
> > > > >
> > > > > Hello,
> > > > >
> > > > >
> > > > >
> > > > > I just updated to Yocto 3.1.7 (from 3.1.5) and I got the followi=
ng
> warning
> > > while building a kernel recipe.
> > > > >
> > > > >
> > > > >
> > > > >   do_install: Task do_install requested do_package unihash, but =
it was
> not
> > > available
> > > > >
> > > > >
> > > > >
> > > > > I tracked this down to OE-Core commit
> > > 0c28edf4bf0d2f92bf3a47406041c63acd90bacf ("package.bbclass: hash
> > > equivalency and pr service") and it makes sense since do_package run=
s
> after
> > > do_install and in dunfell we can find the following in kernel.bbclas=
s
> > > > >
> > > > >
> > > > >
> > > > >   do_install[prefuncs] +=3D "package_get_auto_pr"
> > > > >
> > > > >
> > > > >
> > > > > Merging OE-Core commit
> 36fe4db8ae827a93abe9fce6740459d215411965
> > > ("kernel.bbclass: Remove do_install[prefunc] no longer needed") shou=
ld
> > > normally solve this warning by removing the above line, but I do not
> know if
> > > that change is safe in dunfell.
> > > > >
> > > > >
> > > > >
> > > > > Could that be merged in? Or is there something else that could b=
e
> done
> > > to avoid the warning?
> > > >
> > > > I can do some testing with that patch.  cc-ing Mark to see if he h=
as
> > > > any comments since he is the patch author.
> > > >
> > > > Steve
> > > >
> > > >
> > > > > Our build system flags a production build as bad if there is a w=
arning,
> so
> > > this is kind of annoying.
> > > > >
> > > > >
> > > > >
> > > > > Best,
> > > > >
> > > > >
> > > > >
> > > > > Diego
> > > > >
> > > > > --
> > > > > Diego Santa Cruz, PhD
> > > > > Technology Architect
> > > > > spinetix.com
> > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> >
> >=20
> >
--=20
Diego Santa Cruz, PhD
Technology Architect
spinetix.com


