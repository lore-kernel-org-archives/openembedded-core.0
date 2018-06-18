Return-Path: <DEVARSHT@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0078.outbound.protection.outlook.com [104.47.34.78])
	by mail.openembedded.org (Postfix) with ESMTP id C104360670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 05:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PRywRAwJlyZZagXDfInhYCO2Ga8uUjbp7/hFrY7xYkM=;
	b=ocRufuRtOop9jFkvyIkjoo6ATTaKOcgOM3QcdNihsVoXRxWTUOw2zQqLkKWHRtSDAv/CHj9SOcp3lxp0fz/fZ3tbi8YFd86zd5ou4YNSVEq+OKuiUj8mQEdS93Jm+B6Aw4uOAnQ6uTeJMexjEDxQpsfWX0Ub0RsUnaKl0nWe6/M=
Received: from CO1PR02MB094.namprd02.prod.outlook.com (10.242.163.26) by
	CO1PR02MB176.namprd02.prod.outlook.com (10.242.165.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.863.16; Mon, 18 Jun 2018 05:12:57 +0000
Received: from CO1PR02MB094.namprd02.prod.outlook.com
	([fe80::f873:613:595:f43d]) by CO1PR02MB094.namprd02.prod.outlook.com
	([fe80::f873:613:595:f43d%13]) with mapi id 15.20.0863.016;
	Mon, 18 Jun 2018 05:12:52 +0000
From: Devarsh Thakkar <DEVARSHT@xilinx.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [PATCH] matchbox-terminal: Update commitID
Thread-Index: AdQDsdq/rDmgu8j5QH2GTULR/DEIOwDEQJVQ
Date: Mon, 18 Jun 2018 05:12:52 +0000
Message-ID: <CO1PR02MB0942141B18F23481B68BE3ABC710@CO1PR02MB094.namprd02.prod.outlook.com>
References: <CO1PR02MB094A87B564E37542202D983BC7D0@CO1PR02MB094.namprd02.prod.outlook.com>
In-Reply-To: <CO1PR02MB094A87B564E37542202D983BC7D0@CO1PR02MB094.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=DEVARSHT@xilinx.com; 
x-originating-ip: [219.65.63.222]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CO1PR02MB176;
	7:weinFGw8C8Dzq5D4oaVOKLHJYR0uFDqS9/v2NUmiKWTeQlUg1dWfhjWgNcrTjNBxxOV4Dtw3AWeQwK4plupumV6+8laPqfm2VawGOx81rXdFmXOxYqmHkZm9UjDQ42esdWRG0FmMk+Ivje1uY+m8lDbIHXeSBVgqrcsCHLCb8h6n0qDPrRcaBQ4Tz9zPiJSaevSpscgBbqNpyxJfYjibpTIi2JOvn7uAnIan+ksbxO4qQYucpOpnrKbS5+AC6GV7
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(396003)(39850400004)(376002)(346002)(39380400002)(366004)(51914003)(13464003)(189003)(199004)(7696005)(106356001)(478600001)(74316002)(305945005)(68736007)(6246003)(45080400002)(8676002)(81166006)(81156014)(66066001)(9686003)(107886003)(53936002)(7736002)(6306002)(86362001)(575784001)(8936002)(476003)(33656002)(14454004)(4326008)(486006)(6436002)(25786009)(229853002)(72206003)(55016002)(7110500001)(966005)(6506007)(97736004)(1720100001)(2900100001)(2501003)(186003)(26005)(76176011)(102836004)(53546011)(59450400001)(54906003)(110136005)(316002)(5250100002)(99286004)(5660300001)(10710500007)(6116002)(2420400007)(3660700001)(446003)(15650500001)(105586002)(3280700002)(11346002)(2906002)(3846002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO1PR02MB176;
	H:CO1PR02MB094.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: af9a5c12-1500-4dd6-b0ff-08d5d4da24d1
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(48565401081)(5600026)(711020)(2017052603328)(7153060)(7193020);
	SRVR:CO1PR02MB176; 
x-ms-traffictypediagnostic: CO1PR02MB176:
x-microsoft-antispam-prvs: <CO1PR02MB1769044B14C0E57BC3AA498BC710@CO1PR02MB176.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(189930954265078)(85827821059158)(264703809997249)(192813158149592)(228905959029699);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:CO1PR02MB176; BCL:0; PCL:0; RULEID:; SRVR:CO1PR02MB176; 
x-forefront-prvs: 0707248B64
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: 1Y5HJxI2tmEBcw/ORZ4HHHE6Cn5xo/Wsz46DEBtw2J1zqiFlxgnlvs3cKzm7xZj7t4DcHgB9C0ba9kaCCxV85GJYAkm1uy28TOJCcnEMoUzY5N6kF6Re6eHHgzMQh0ZNdaCJVdO2/bJjvL+ozH6Bk1bD35gUZEATVzv5Z3b+6F/6ZfNc6eTeTUqfV6wDJxm1xhiAZgEw7G075L+VEMCBM+3guLqmzQ4Mo7TiIPvwot0ukrVoUQnOto3/vdhMDHkcbqIVsa3Xs9il9jfGvxspcwJOoiXwLQ7lUcIbyoQ2vFOvf6tbFfWMgjefuSijn5zZ
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af9a5c12-1500-4dd6-b0ff-08d5d4da24d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2018 05:12:52.7693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB176
Cc: Maulik Desai <maulikd@xilinx.com>,
	Varunkumar Allagadapa <VARUNKUM@xilinx.com>
Subject: Re: [PATCH] matchbox-terminal: Update commitID
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
X-List-Received-Date: Mon, 18 Jun 2018 05:12:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Gentle reminder.

> -----Original Message-----
> From: Devarsh Thakkar
> Sent: Thursday, June 14, 2018 1:10 PM
> To: 'openembedded-core@lists.openembedded.org' <openembedded-
> core@lists.openembedded.org>; 'richard.purdie@linuxfoundation.org'
> <richard.purdie@linuxfoundation.org>; 'Burton, Ross' <ross.burton@intel.c=
om>
> Subject: Re: [PATCH] matchbox-terminal: Update commitID
>=20
> Hi Richard, Ross
>=20
> > Message: 2
> > Date: Mon, 11 Jun 2018 14:39:53 +0100
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > To: Devarsh Thakkar <DEVARSHT@xilinx.com>,
> > 	"openembedded-core@lists.openembedded.org"
> > 	<openembedded-core@lists.openembedded.org>
> > Cc: Maulik Desai <maulikd@xilinx.com>,	Varunkumar Allagadapa
> > 	<VARUNKUM@xilinx.com>
> > Subject: Re: [OE-core] [PATCH] matchbox-terminal: Update commitID
> > Message-ID:
> > 	<642b938d82295e3b7ce922dad711c63904d62ca5.camel@linuxfounda
> > tion.org>
> > Content-Type: text/plain; charset=3D"UTF-8"
> >
> > On Mon, 2018-06-11 at 12:39 +0000, Devarsh Thakkar wrote:
> > > Hi Richard,
> > >
> > > Thanks for the quick review.
> > > Replies inline.
> > >
> > > > Message: 5
> > > > Date: Sun, 10 Jun 2018 09:29:14 +0100
> > > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > To: Devarsh Thakkar <devarsh.thakkar@xilinx.com>,
> > > > 	openembedded-core@lists.openembedded.org
> > > > Cc: maulikd@xilinx.com, varunkum@xilinx.com, JAEWON@xilinx.com,
> > > > 	Devarsh Thakkar <devarsht@xilinx.com>
> > > > Subject: Re: [OE-core] [PATCH] matchbox-terminal: Update commitID
> > > > Message-ID:
> > > > 	<56788cd154d9af0b6c9ea2ef78de23b1909fd7ee.camel@linuxfoundati
> > > > on.org>
> > > > Content-Type: text/plain; charset=3D"UTF-8"
> > > >
> > > > On Sat, 2018-06-09 at 04:59 -0700, Devarsh Thakkar wrote:
> > > > > Pull in change which adds support for command line options (-e
> > > > > and --command) which can be used for launching programs or
> > > > > running commands in matchbox-terminal via command line.
> > > > >
> > > > > Signed-off-by: Devarsh Thakkar <devarsht@xilinx.com>
> > > > > ---
> > > > >  meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb |
> > > > > 2
> > > > > +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-
> > > > > terminal_0.1.bb b/meta/recipes-sato/matchbox-terminal/matchbox-
> > > > > terminal_0.1.bb
> > > > > index 4488191..b7fbee7 100644
> > > > > --- a/meta/recipes-sato/matchbox-terminal/matchbox-
> > > > > terminal_0.1.bb
> > > > > +++ b/meta/recipes-sato/matchbox-terminal/matchbox-
> > > > > terminal_0.1.bb
> > > > > @@ -10,7 +10,7 @@ DEPENDS =3D "gtk+3 vte"
> > > > >  SECTION =3D "x11/utils"
> > > > >
> > > > >  #SRCREV tagged 0.1
> > > >
> > > > I'm guessing the above comment is no longer valid, nor is the
> > > > value of PV?
> > >
> > > Yes the comment is no longer valid I will remove that in V2.
> > > But the PV is still valid as matchbox-terminal package version is
> > > still 0.1 ( as set in AC_INIT at
> > > http://git.yoctoproject.org/cgit.cgi
> > > /matchbox-terminal/tree/configure.ac) even after this commit.
> >
> > No, after your change its not the 0.1 release, its 0.1+git<revision>,
> > its a different version sometime after 0.1.
> Thanks for sharing, I got your point. I guess there are below possible so=
lutions
> here :
> 1) set PV=3D"${BPV}+gitr${SRCPV}" were BPV=3D0.1
> 2) move the tag 0.1 to ccbc3c70946b04313c6166ab0dfef21e5e83c289 for
> matchbox-terminal
> 3) Update a new tag at 0.2 at to
> ccbc3c70946b04313c6166ab0dfef21e5e83c289
>=20
> Kindly let me know which of the above is preferred way.
>=20
> Thanks,
> Devarsh
> >
> > Cheers,
> >
> > Richard
> >
> >
> > ------------------------------
> >
> > Message: 3
> > Date: Mon, 11 Jun 2018 12:39:20 +0000
> > From: Devarsh Thakkar <DEVARSHT@xilinx.com>
> > To: "openembedded-core@lists.openembedded.org"
> > 	<openembedded-core@lists.openembedded.org>,
> > 	"richard.purdie@linuxfoundation.org"
> > 	<richard.purdie@linuxfoundation.org>
> > Cc: Maulik Desai <maulikd@xilinx.com>,	Varunkumar Allagadapa
> > 	<VARUNKUM@xilinx.com>
> > Subject: Re: [OE-core] [PATCH] matchbox-terminal: Update commitID
> > Message-ID:
> > 	<CO1PR02MB0944771307967F828960631BC780@CO1PR02MB094.n
> > amprd02.prod.outlook.com>
> >
> > Content-Type: text/plain; charset=3D"us-ascii"
> >
> > Hi Richard,
> >
> > Thanks for the quick review.
> > Replies inline.
> >
> > > Message: 5
> > > Date: Sun, 10 Jun 2018 09:29:14 +0100
> > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > To: Devarsh Thakkar <devarsh.thakkar@xilinx.com>,
> > > 	openembedded-core@lists.openembedded.org
> > > Cc: maulikd@xilinx.com, varunkum@xilinx.com, JAEWON@xilinx.com,
> > > 	Devarsh Thakkar <devarsht@xilinx.com>
> > > Subject: Re: [OE-core] [PATCH] matchbox-terminal: Update commitID
> > > Message-ID:
> > > 	<56788cd154d9af0b6c9ea2ef78de23b1909fd7ee.camel@linuxfoundati
> > > on.org>
> > > Content-Type: text/plain; charset=3D"UTF-8"
> > >
> > > On Sat, 2018-06-09 at 04:59 -0700, Devarsh Thakkar wrote:
> > > > Pull in change which adds support for command line options (-e and
> > > > --command) which can be used for launching programs or running
> > > > commands in matchbox-terminal via command line.
> > > >
> > > > Signed-off-by: Devarsh Thakkar <devarsht@xilinx.com>
> > > > ---
> > > >  meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb | 2
> > > > +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-
> > > > terminal_0.1.bb b/meta/recipes-sato/matchbox-terminal/matchbox-
> > > > terminal_0.1.bb
> > > > index 4488191..b7fbee7 100644
> > > > --- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
> > > > +++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
> > > > @@ -10,7 +10,7 @@ DEPENDS =3D "gtk+3 vte"
> > > >  SECTION =3D "x11/utils"
> > > >
> > > >  #SRCREV tagged 0.1
> > >
> > > I'm guessing the above comment is no longer valid, nor is the value
> > > of PV?
> > Yes the comment is no longer valid I will remove that in V2.
> > But the PV is still valid as matchbox-terminal package version is
> > still 0.1 ( as set in AC_INIT at
> > http://git.yoctoproject.org/cgit.cgi/matchbox-
> > terminal/tree/configure.ac) even after this commit.
> >
> > >
> > > > -SRCREV =3D "3ad357db2302760b8a8817b5f4478dd87479442f"
> > > > +SRCREV =3D "ccbc3c70946b04313c6166ab0dfef21e5e83c289"
> > > >  SRC_URI =3D "git://git.yoctoproject.org/${BPN}"
> > > >  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
> > > >
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > Thanks,
> > Devarsh
> >
> >
> > ------------------------------
> >
> > Message: 4
> > Date: Mon, 11 Jun 2018 07:42:31 -0700
> > From: akuster808 <akuster808@gmail.com>
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
> > 	"openembedded-core@lists.openembedded.org"
> > 	<openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [v5][PATCH] busybox: update to 1.28.4
> > Message-ID: <bb38520f-85d7-9e63-83a6-76477073285a@gmail.com>
> > Content-Type: text/plain; charset=3Dutf-8
> >
> >
> >
> > On 06/11/2018 01:45 AM, Peter Kjellerstedt wrote:
> > >> -----Original Message-----
> > >> From: openembedded-core-bounces@lists.openembedded.org
> > >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of
> > >> Armin Kuster
> > >> Sent: den 11 juni 2018 06:18
> > >> To: akuster808@gmail.com; openembedded-
> core@lists.openembedded.org
> > >> Subject: [OE-core] [v5][PATCH] busybox: update to 1.28.4
> > >>
> > >> refactored busybox-udhcpc-no_deconfig.patch for this update updated
> > >> 1.28.3
> > >>
> > >> [v1]
> > >> removed patches included in update:
> > >> busybox/CVE-2011-5325.patch
> > >> busybox/CVE-2017-15873.patch
> > >> busybox/busybox-CVE-2017-16544.patch
> > >>
> > >> [v2]
> > >> Add back busybox-udhcpc-no_deconfig.patch ti SRC_URI, missed
> > >> earlier
> > >>
> > >> [v3]
> > >> Update defconfig based on feedback
> > >>
> > >> [v4]
> > >> Decided to update again.
> > >> 1.28.4
> > >>
> > >> [v5]
> > >> rebased change do to changes in master squashed .cfg into defconfig
> > >> and remove files Delete busybox-fix-lzma-segfaults.patch which is
> > >> included in updated.
> > >>
> > >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > > The commit message should be rewritten to document the final commit,
> > > without any patch series references. They belong after --- below.
> >
> > Done that before and folks complained so I started included with files
> > got removed. May I suggest updating the process so we can be consistent=
.
> >
> > - armin
> > >
> > >> ---
> > >>  .../busybox/busybox/CVE-2011-5325.patch            | 481 ----------=
-----------
> > >>  .../busybox/busybox/CVE-2017-15873.patch           |  95 ----
> > >>  .../busybox/busybox/busybox-CVE-2017-16544.patch   |  43 --
> > >>  .../busybox/busybox-fix-lzma-segfaults.patch       | 106 -----
> > >>  .../busybox/busybox-udhcpc-no_deconfig.patch       |  36 +-
> > >>  meta/recipes-core/busybox/busybox/defconfig        | 278 ++++++----=
--
> > >>  meta/recipes-core/busybox/busybox/getopts.cfg      |   3 -
> > >>  .../busybox/busybox/login-utilities.cfg            |  13 -
> > >>  meta/recipes-core/busybox/busybox/mdev.cfg         |   2 -
> > >>  .../busybox/busybox/mount-via-label.cfg            |   9 -
> > >>  meta/recipes-core/busybox/busybox/resize.cfg       |   2 -
> > >>  meta/recipes-core/busybox/busybox/sha1sum.cfg      |   1 -
> > >>  meta/recipes-core/busybox/busybox/sha256sum.cfg    |   1 -
> > >>  meta/recipes-core/busybox/busybox/syslog.cfg       |  11 -
> > >>  .../{busybox_1.27.2.bb =3D> busybox_1.28.4.bb}       |  15 +-
> > >>  15 files changed, 162 insertions(+), 934 deletions(-)  delete mode
> > >> 100755 meta/recipes-core/busybox/busybox/CVE-2011-
> > 5325.patch
> > >>  delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2017-
> > 15873.patch
> > >>  delete mode 100644 meta/recipes-core/busybox/busybox/busybox-CVE-
> > 2017-16544.patch
> > >>  delete mode 100644 meta/recipes-core/busybox/busybox/busybox-fix-
> > lzma-segfaults.patch
> > >>  delete mode 100644 meta/recipes-core/busybox/busybox/getopts.cfg
> > >>  delete mode 100644
> > >> meta/recipes-core/busybox/busybox/login-utilities.cfg
> > >>  delete mode 100644 meta/recipes-core/busybox/busybox/mount-via-
> > label.cfg
> > >>  delete mode 100644 meta/recipes-core/busybox/busybox/resize.cfg
> > >>  delete mode 100644 meta/recipes-core/busybox/busybox/sha1sum.cfg
> > >>  delete mode 100644 meta/recipes-core/busybox/busybox/sha256sum.cfg
> > >>  delete mode 100644 meta/recipes-core/busybox/busybox/syslog.cfg
> > >>  rename meta/recipes-core/busybox/{busybox_1.27.2.bb =3D>
> > busybox_1.28.4.bb} (72%)
> > > //Peter
> > >
> >
> >
> >
> > ------------------------------
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> > End of Openembedded-core Digest, Vol 89, Issue 107
> > **************************************************

