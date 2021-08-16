Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27611.1629134975150166875
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 10:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LYtuXGxR;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3862dffb07=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17GGpstM030271
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 17:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=i15pGgRzTbRdsUeATBXLjhU8/m12QY5DeKqirg+UYs0=;
 b=LYtuXGxRXzwoA1IkDtnUXrpijqVfXltxPEnwCz5i5YITpTlLGGIvITyhXCwRGLwDbrq5
 iK0O/aP2EMzNizjgxa7eIi4lEQZHdKExA0pbPcTymfPSSyBFdGQRy3rZwdh3joIUDqi3
 J9ewOtatfE7GeOYJGCTfeF9ZoNvz/FTbgJSsQyicNMRvmiRx5JW7ZYkwLGtJ1hobbfNZ
 RTuekLTNJVUuXvkoWsa83y2f/sHkKm5RtN+GSbJGG7yx8DInk1hauuEMjeQqy3K3Mujp
 mLZBnP+JUNO+i7uYOpSnSZViPNcwlKXckVYkT6l2EQK7me+VU5IFRHN3ULq38aYL4LY0 /g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3af1k3rrpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 17:29:33 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17GHTXvO009710
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 17:29:33 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2046.outbound.protection.outlook.com [104.47.73.46])
	by mx0a-0064b401.pphosted.com with ESMTP id 3af1k3rrph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Aug 2021 17:29:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPA+5iv0lSYY31tHt9uhNneeP2mPKRnkISXgJ7t1Zk8r6HFyt1kjXjLgGxx8SGHJEsYZH1SLBqNS3LXDKSzTQEikxoWUe7oMLdpPJ22KuMlJjyW8nJVGoLUvCDAuv6Gj1FoOWkIprZFrp0nOQLloewnURH1ti0YpSO+NYCtiSE+YnY6KavADBEXBPcaO6WGm0M29jXX7gcUJLpNLaVCghwBasyDli8efzVpYgbquqIMpeX2HnGYLsIZ8MfeXCOm7VlMbzcHCDeKjfM0QrdzraPuqXHzPC+AHpkUBw3NLr6A6LSqIx3H/8+KItIQwHQfwiw0GLOT7p7PxFi7Bb2oZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i15pGgRzTbRdsUeATBXLjhU8/m12QY5DeKqirg+UYs0=;
 b=R8lWk0Mqc93P+ByOeimMZ5XFT/CV5hOkmNR6PV56xeUXYQt7+PHltquXCwfk667tEmSXq5MjBNwohrKwZznqURrX5gprsHfTwM09+IYosl6XbU40jsxHhUam8BgWto0/rpDcoQQpIj5I2kG1l4j1XBMFO40a4dC8AhOepnuEVo15vRuscOyCQ+wsGijEn9xAL2hKqp7d06jyyCyjM8/ccPEJTS8W8MW/zzVLXtxdB7w5AcS+jR/3iYEwcS2NvCrD+lWhg0HNZn8C9SN68toa9GepX7iXM8Uly9itf7IcLKW2xWGuh1YenWl79LYlFleLPyDASgO6uP4yBwetwVddWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB3782.namprd11.prod.outlook.com (2603:10b6:a03:fd::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Mon, 16 Aug
 2021 17:29:31 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4%4]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 17:29:31 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: Re: [oe-core][PATCH 1/1] blktrace: add rdepends
Thread-Topic: [oe-core][PATCH 1/1] blktrace: add rdepends
Thread-Index: AQHXkIE3qy7QFENVHkeNvZlpeta3+6tyv3GAgAOnbKA=
Date: Mon, 16 Aug 2021 17:29:30 +0000
Message-ID: 
 <BY5PR11MB39927DB3BC1107A38C689A0F88FD9@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20210813202416.138888-1-joe.slater@windriver.com>
 <YRePO49ByXUDHv+R@piout.net>
In-Reply-To: <YRePO49ByXUDHv+R@piout.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8ef14cf-cb8e-4dfd-758c-08d960db681d
x-ms-traffictypediagnostic: BYAPR11MB3782:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BYAPR11MB3782CA87E39E05260EC19B4B88FD9@BYAPR11MB3782.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mxlIsmLxfgKhQTRjxIv5GU2Z5Bn7V67/mazX6GeN+6WGRYJWsPrbym6QUBh9RyuDwUy5nEv/vUYornhbw9B+1TI34WaWjfzm21DGuz/eiF1qzUDbcOzOjflMB1cegF1uGNUp+NaReAv+BIlzHWi5Df4TjOpS03nF/kA0qpihdLI7cj11DGmmZnR7eVdqU4WG3UZqpxbNarStxW4KjWlatUP8QfhFK98YX0IGUWYtmtuUiaVOfsm71zFknoS3JCmLwRxFAz79o3MJ9J7kbOREWJnNULx55jWo/oFvkdwAd7o69ua4R26T5rZYhL6y/+67Qc1QOnFY85+0dEwH3WBSRM9hM5NBqKG9ZyIX1K/53BKJoyzjTdbcXlpArq1oZy0uncOjEpICm858Eawb3SFFs+TFLaes33mUPwjW2GhKOserPlDPebZYC547aDVWLGya2fM2UjKs/sWZOdzlXldJGx6sWR0XQ5gTuN5+2q151zF8pJ3+VZ1dX+DAZdM/bIqLhE72FiLkqpereh4r8qdjgaAChas8qwdYhJRaiRz7F0+oFde84HAkmO/JW4cq26VZItXbm8I+NgQnNLTdyb7b4Gl3TCauW1JaPCtMLfp3PxK1xt4F56/Lncqr8Z9TA8eyvp4MezTE226uRiHT/0nl8DLuZs/UfoRWjTyRekdisu1VTKSNjtjybtyrXvIt6SfNXDLiF331XR1xBSEPBsEBO76MkmS9CnPoby4AqrVjxv2ya6tli2k9wEWn5xUYp5i5qe5z20ItoV4JxnwarDXQXn+deP3q7qS9DtV7/cRh+VKOkVs5n5tCYuTPlI7n8nJ2jgn1eU2ufs4byG6ApQy5fw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39850400004)(376002)(366004)(71200400001)(64756008)(478600001)(122000001)(66556008)(316002)(5660300002)(9686003)(6506007)(54906003)(38070700005)(2906002)(7696005)(107886003)(55016002)(52536014)(33656002)(66946007)(66476007)(76116006)(966005)(66446008)(8676002)(186003)(38100700002)(6916009)(86362001)(8936002)(26005)(4326008)(53546011)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Idk5OeWPSYTCOwoZRF3uYlylJis/L4gEUTCt/4FlFQeNoTpOOikQIlcyvenC?=
 =?us-ascii?Q?XZHF8mH5oeZTYBGtE4Iq0e7E6ZUc4VfGGgXSsfxfH0z43vxP2XxE/f1NtQRc?=
 =?us-ascii?Q?Ra3BFoEwqcXWvivaxN6oHPjzglZawG4yxi2xzR2aEFPzn73t/kInT1LdvdNk?=
 =?us-ascii?Q?ha5KpULrp5X/RMxMtzrgeseo+whbn3zTYrtv86gSAsefN2scMUePD0ByGr67?=
 =?us-ascii?Q?SxDvZ++PPoghLaVRXft0Jof45kEoJgbUoGviylGYAYCwKXkxSiZ6EOKDKweo?=
 =?us-ascii?Q?PzD9ilS9PZ2O9kZgGGFBDjoYNin1KV0jBEbLOaqQSwmcZ67S0hg5HIWhq4e3?=
 =?us-ascii?Q?/TW4zJqlEZ/D0+q05X/dFwZ1VglZvqbD348nkA7TRjst2RHfgtfq4LbWRIdj?=
 =?us-ascii?Q?XcZPd3vlVoJnk8ci5BeXMawvgM2GpfooCQWu6QgIPNRkHfrvMgdBhusAldFA?=
 =?us-ascii?Q?2oY537EL6TtGWoaUuBTfTCfsPhiTFVO3s/Mc5b9x/m4QwLqQJRtl5xMfSVkK?=
 =?us-ascii?Q?FY0yH4q6+spqWJZBdXY86n73n0DpyvWofQQ2+EnBKv46Jf2W6d5+VfkvGCkk?=
 =?us-ascii?Q?hWqvF0mR9dvs7OBTj8j6CgOrm2sftIb0DmA2W8mYFzhlDkRZuCOZTtpYQSjK?=
 =?us-ascii?Q?mrF5dCVi8VuPCIgSdvc19EDwPZhDTcgbfB6u8wodYuoJgvTF4LzRMHumQRtB?=
 =?us-ascii?Q?NXo28vepMU4A8+QaNZEHaZZ4DIaBa4JuItKjgL3actPSIAGuan/LMeAWj70N?=
 =?us-ascii?Q?DIRvMVTt7xb38m4C81DVqlMqjU21inqGNNlfqY96ouhJUO/6/HTE3xugoAOV?=
 =?us-ascii?Q?LakkXlrBJOZHWNW1aYu5lnyeqpnaSI6VI6j1oHIzslXQ8SWhqCbo3Y7lZJVg?=
 =?us-ascii?Q?/YMnhUjOJ63wMcHA7jS0or4GBg1W7o23EIP+ASCCcBI+uzffz4yRfP9JL61N?=
 =?us-ascii?Q?wYeAL/Z9irFRMXVm/ef3pyxwKccxHFEdSZ9tIvCdsH5Si/kngVszSPFQPKzx?=
 =?us-ascii?Q?Q4UHfIadWH92mtaF0HAfOxiPHfyQrrFfmpIvYMQd81ladT1qZvp021W5283a?=
 =?us-ascii?Q?aEXaeuadpzd4dJ6IBkDdEV5sXS27QivWdB+VOBhsuR3uNDPVfbeVSol9NyON?=
 =?us-ascii?Q?ImE8Njir59LkLojuyXRgqekjudB+Z+QBzwtL7bOSBm9+rF6Rwrrm98zeV9ST?=
 =?us-ascii?Q?xD3h6MpMdu9ehMBcrw3Wj8PS7HDUgRMdGMALKsooJmTniOFd6IuCs4E9HpRC?=
 =?us-ascii?Q?edXJd+IQeLYwAYSMPoHA7Kl1Vpz7eHkTfGbSQ89bO3ojJg/kOKVaIBBrFcZY?=
 =?us-ascii?Q?Bq8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ef14cf-cb8e-4dfd-758c-08d960db681d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2021 17:29:30.8492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I/aoCMokHlBcFz90mr6itCjpHFuQxxBl8zcOIDWkGWphD6VgtpHyEp38PwE9gtia8+Ch5wPnmxp0bmSJXraQzvUc3XwAQ7WrTG40mAlUnxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3782
X-Proofpoint-GUID: m3Pbc9qJC1WardjD8TX4OswmBLLrIlXj
X-Proofpoint-ORIG-GUID: 1IUMkVq1X1iOi9FLOE8-yYlOJaVLOmcw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-16_06,2021-08-16_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=745 bulkscore=0 mlxscore=0
 phishscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108160110
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I will get rid of the RDEPENDS.   Joe

> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: Saturday, August 14, 2021 2:39 AM
> To: Slater, Joseph <joe.slater@windriver.com>
> Cc: openembedded-core@lists.openembedded.org; MacLeod, Randy
> <Randy.MacLeod@windriver.com>
> Subject: Re: [oe-core][PATCH 1/1] blktrace: add rdepends
>=20
> Hello,
>=20
> On 13/08/2021 13:24:16-0700, Joe Slater wrote:
> > bno_plot.py uses gnuplot.  Also change shebangs to
> > python3 because we do not support python2.
> >
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
> >  meta/recipes-kernel/blktrace/blktrace_git.bb  |  6 +++-
> >  .../blktrace/files/python3-shebangs.patch     | 30 +++++++++++++++++++
> >  2 files changed, 35 insertions(+), 1 deletion(-)  create mode 100644
> > meta/recipes-kernel/blktrace/files/python3-shebangs.patch
> >
> > diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb
> > b/meta/recipes-kernel/blktrace/blktrace_git.bb
> > index d00b1bd0be..36ce282481 100644
> > --- a/meta/recipes-kernel/blktrace/blktrace_git.bb
> > +++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
> > @@ -10,11 +10,15 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D393a5ca445f6965873eca0259a17f833"
> >
> >  DEPENDS =3D "libaio"
> >
> > +RDEPENDS:${PN} +=3D "gnuplot"
> > +
>=20
> This breaks many builds on the autobuilders with:
>=20
> stdio: ERROR: Nothing RPROVIDES 'gnuplot' (but /home/pokybuild/yocto-
> worker/genericx86-64/build/meta/recipes-kernel/blktrace/blktrace_git.bb
> RDEPENDS on or otherwise requires it)
> stdio: ERROR: Nothing RPROVIDES 'blktrace-dev' (but /home/pokybuild/yocto=
-
> worker/genericx86-64/build/meta/recipes-kernel/blktrace/blktrace_git.bb
> RDEPENDS on or otherwise requires it)
>=20
> because gnuplot is part of meta-oe
>=20
> >  SRCREV =3D "366d30b9cdb20345c5d064af850d686da79b89eb"
> >
> >  PV =3D "1.3.0+git${SRCPV}"
> >
> > -SRC_URI =3D "git://git.kernel.dk/blktrace.git"
> > +SRC_URI =3D "git://git.kernel.dk/blktrace.git \
> > +           file://python3-shebangs.patch \
> > +          "
> >
> >  S =3D "${WORKDIR}/git"
> >
> > diff --git a/meta/recipes-kernel/blktrace/files/python3-shebangs.patch
> > b/meta/recipes-kernel/blktrace/files/python3-shebangs.patch
> > new file mode 100644
> > index 0000000000..70a35c2c3a
> > --- /dev/null
> > +++ b/meta/recipes-kernel/blktrace/files/python3-shebangs.patch
> > @@ -0,0 +1,30 @@
> > +blktrace: Use python3 shebangs
> > +
> > +blktrace can use either python2 or python3, but we really want
> > +python3, so modify the shebangs.
> > +
> > +Upstream-Status: pending
> > +
> > +Signed-off-by: Joe Slater <joe.slater@windriver.com.
> > +
> > +
> > +diff --git a/btt/bno_plot.py b/btt/bno_plot.py index 3aa4e19..d7d7159
> > +100644
> > +--- a/btt/bno_plot.py
> > ++++ b/btt/bno_plot.py
> > +@@ -1,4 +1,4 @@
> > +-#! /usr/bin/env python
> > ++#! /usr/bin/env python3
> > + #
> > + # btt blkno plotting interface
> > + #
> > +diff --git a/btt/btt_plot.py b/btt/btt_plot.py index 40bc71f..8620d31
> > +100755
> > +--- a/btt/btt_plot.py
> > ++++ b/btt/btt_plot.py
> > +@@ -1,4 +1,4 @@
> > +-#! /usr/bin/env python
> > ++#! /usr/bin/env python3
> > + #
> > + # btt_plot.py: Generate matplotlib plots for BTT generate data files
> > + #
> > --
> > 2.25.1
> >
>=20
> >
> >=20
> >
>=20
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
