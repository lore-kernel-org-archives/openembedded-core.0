Return-Path: <DEVARSHT@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0042.outbound.protection.outlook.com
	[104.47.37.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1921078A54
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 12:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9TZsmJv4A6rQCg8k00OYsbKJU+E5gPN/qknNpNUUMgE=;
	b=T/LswC5f3T5kA3XpD+b+fly3uDTfcS+I9q12voFGUWEPQfjwTIGtjAGbjzioWVaO2aDce+XAbtzi5SvpGbEElCtpCmFl14PFwH8spsAAJvcPLsGJebD3yZgrC+em1weHeflfGLv7bDw0zQ2QYRhkWWlen0s2MF6WiiC45Y1QMuo=
Received: from CO1PR02MB094.namprd02.prod.outlook.com (10.242.163.26) by
	CO1PR02MB077.namprd02.prod.outlook.com (10.242.164.11) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.841.18; Mon, 11 Jun 2018 08:57:03 +0000
Received: from CO1PR02MB094.namprd02.prod.outlook.com
	([fe80::f873:613:595:f43d]) by CO1PR02MB094.namprd02.prod.outlook.com
	([fe80::f873:613:595:f43d%13]) with mapi id 15.20.0841.019;
	Mon, 11 Jun 2018 08:57:03 +0000
From: Devarsh Thakkar <DEVARSHT@xilinx.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Openembedded-core Digest, Vol 89, Issue 101
Thread-Index: AQHUAWABgl7IpEqwyEmFUksQbQmVL6RawYKg
Date: Mon, 11 Jun 2018 08:57:02 +0000
Message-ID: <CO1PR02MB094DAE7271D5ACD1D243A6ABC780@CO1PR02MB094.namprd02.prod.outlook.com>
References: <mailman.3217.1528706473.1670.openembedded-core@lists.openembedded.org>
In-Reply-To: <mailman.3217.1528706473.1670.openembedded-core@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=DEVARSHT@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CO1PR02MB077;
	7:nGNfvIzlPMn6YrGpwd7rRkqLjs+gNUiAV0MwICKlJ6HpPnoJEMhk4YNj9SPAPdcokkcinWWdqZuud5Z6NIEgGWAvCQ98aDXRrv+3JJQ7jjYnoOXaInG55/2I0bd8UhMxoe3St+CalxaAnMEEqNRxuyeR/if5v5PC0wb4HS6bKeO6wly/IjF78gFF5QrwK9aQVvA8ZlAttqjjnu+ew6gbHPLsrRBdxI+TyK/kvwO38glsPK7JYnpKhOWcTCf2kQbP
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CO1PR02MB077; 
x-ms-traffictypediagnostic: CO1PR02MB077:
x-microsoft-antispam-prvs: <CO1PR02MB07724F2BACDBC46782D53A0BC780@CO1PR02MB077.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(85827821059158)(264703809997249)(192813158149592)(228905959029699);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(3231254)(944501410)(52105095)(10201501046)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:CO1PR02MB077; BCL:0; PCL:0; RULEID:; SRVR:CO1PR02MB077; 
x-forefront-prvs: 070092A9D3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39380400002)(366004)(396003)(346002)(376002)(39860400002)(18543002)(10533003)(5403001)(189003)(199004)(13464003)(27574002)(26005)(6436002)(186003)(316002)(105586002)(102836004)(7736002)(305945005)(5890100001)(53936002)(5660300001)(5250100002)(7696005)(106356001)(81166006)(86362001)(575784001)(1720100001)(76176011)(81156014)(478600001)(3660700001)(4326008)(66066001)(97736004)(8936002)(11346002)(3280700002)(229853002)(446003)(53546011)(6506007)(966005)(59450400001)(476003)(486006)(99286004)(8676002)(72206003)(68736007)(2351001)(3846002)(55016002)(2501003)(6916009)(5640700003)(74316002)(14454004)(6116002)(6246003)(6306002)(33656002)(2900100001)(9686003)(2906002)(25786009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO1PR02MB077;
	H:CO1PR02MB094.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: H0FAZAdnGnCw/CYW7YqOoTpzBa6mj4uWi3a8O/A3e4FYkA68PIDX8HXBNM9j91zZOhnivuO7eTDrcD1MGW892d5VPjXR1H2PaLfFaNNZ8Fba+QizKKsLh990nExDaj6PXj1F/aqylaVto8MwSNx/EtfvI/no8TawKnxfnp65boA+hvwo2CdcjsLRG8HP+wIWaG5UHuNr5dthb3Lxl2xFVA==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 2c4004fb-7854-48c8-c266-08d5cf794cd9
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4004fb-7854-48c8-c266-08d5cf794cd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2018 08:57:02.8875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB077
Subject: Re: Openembedded-core Digest, Vol 89, Issue 101
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
X-List-Received-Date: Mon, 11 Jun 2018 12:28:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Please ignore below patch.
I will send a V2 taking care of comments from Richard.

Thanks,
Devarsh

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> openembedded-core-request@lists.openembedded.org
> Sent: Monday, June 11, 2018 2:11 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Openembedded-core Digest, Vol 89, Issue 101
>=20
> Send Openembedded-core mailing list submissions to
> 	openembedded-core@lists.openembedded.org
>=20
> To subscribe or unsubscribe via the World Wide Web, visit
> 	http://lists.openembedded.org/mailman/listinfo/openembedded-core
> or, via email, send a message with subject or body 'help' to
> 	openembedded-core-request@lists.openembedded.org
>=20
> You can reach the person managing the list at
> 	openembedded-core-owner@lists.openembedded.org
>=20
> When replying, please edit your Subject line so it is more specific than =
"Re:
> Contents of Openembedded-core digest..."
>=20
>=20
> Today's Topics:
>=20
>    1. [PATCH] matchbox-terminal: Update commitID (Devarsh Thakkar)
>    2. Re: [PATCH 2/2] bitbake-blayers/create: add
>       LAYERSERIES_COMPAT (Richard Purdie)
>    3. [PATCH] xinetd: Fix systemd service for systemd>237
>       (Ricardo Ribalda Delgado)
>    4. [PATCH v2] bitbake-blayers/create: add LAYERSERIES_COMPAT
>       (Anuj Mittal)
>    5. Re: [PATCH v2] bitbake-blayers/create: add LAYERSERIES_COMPAT
>       (Peter Kjellerstedt)
>=20
>=20
> ----------------------------------------------------------------------
>=20
> Message: 1
> Date: Sun, 10 Jun 2018 23:22:24 -0700
> From: Devarsh Thakkar <devarsh.thakkar@xilinx.com>
> To: <openembedded-core@lists.openembedded.org>, <devarsht@xilinx.com>
> Subject: [OE-core] [PATCH] matchbox-terminal: Update commitID
> Message-ID: <1528698144-25780-1-git-send-email-devarsht@xilinx.com>
> Content-Type: text/plain
>=20
> Pull in change which adds support for command line options (-e and --
> command) which can be used for launching programs or running commands in
> matchbox-terminal via command line.
>=20
> Signed-off-by: Devarsh Thakkar <devarsht@xilinx.com>
> ---
>  meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
> b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
> index 4488191..b7fbee7 100644
> --- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
> +++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
> @@ -10,7 +10,7 @@ DEPENDS =3D "gtk+3 vte"
>  SECTION =3D "x11/utils"
>=20
>  #SRCREV tagged 0.1
> -SRCREV =3D "3ad357db2302760b8a8817b5f4478dd87479442f"
> +SRCREV =3D "ccbc3c70946b04313c6166ab0dfef21e5e83c289"
>  SRC_URI =3D "git://git.yoctoproject.org/${BPN}"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
>=20
> --
> 2.1.1
>=20
> This email and any attachments are intended for the sole use of the named
> recipient(s) and contain(s) confidential information that may be propriet=
ary,
> privileged or copyrighted under applicable law. If you are not the intend=
ed
> recipient, do not read, copy, or forward this email message or any attach=
ments.
> Delete this email message and any attachments immediately.
>=20
>=20
> ------------------------------
>=20
> Message: 2
> Date: Mon, 11 Jun 2018 08:21:25 +0100
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> To: Anuj Mittal <anuj.mittal@intel.com>,
> 	openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 2/2] bitbake-blayers/create: add
> 	LAYERSERIES_COMPAT
> Message-ID:
> 	<4c3a2b83203d7c07affbd12ff5300f11d516e002.camel@linuxfoundati
> on.org>
> Content-Type: text/plain; charset=3D"UTF-8"
>=20
> On Mon, 2018-06-11 at 09:52 +0800, Anuj Mittal wrote:
> > Derive the value for template layer.conf from core layer and add
> > dependendency on it too.
> >
> > Fixes [YOCTO #12767]
> >
> > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > ---
> >  meta/lib/bblayers/create.py            | 2 +-
> >  meta/lib/bblayers/templates/layer.conf | 3 +++
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/lib/bblayers/create.py b/meta/lib/bblayers/create.py
> > index c1923166fd..d9699b21f9 100644
> > --- a/meta/lib/bblayers/create.py
> > +++ b/meta/lib/bblayers/create.py
> > @@ -44,7 +44,7 @@ class CreatePlugin(LayerPlugin):
> >          shutil.copy(license_src, license_dst)
> >
> >          # Create the layer.conf from templates/layer.conf
> > -        layerconf_template =3D read_template('layer.conf') %
> > (args.layerdir, args.layerdir, args.layerdir, args.priority)
> > +        layerconf_template =3D read_template('layer.conf') %
> > (args.layerdir, args.layerdir, args.layerdir, args.priority,
> > args.layerdir, args.layerdir)
> >          layerconf =3D os.path.join(conf, 'layer.conf')
> >          with open(layerconf, 'w') as fd:
> >              fd.write(layerconf_template) diff --git
> > a/meta/lib/bblayers/templates/layer.conf
> > b/meta/lib/bblayers/templates/layer.conf
> > index 3c0300226c..61b3ad8db3 100644
> > --- a/meta/lib/bblayers/templates/layer.conf
> > +++ b/meta/lib/bblayers/templates/layer.conf
> > @@ -8,3 +8,6 @@ BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
> > BBFILE_COLLECTIONS +=3D "%s"
> >  BBFILE_PATTERN_%s =3D "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_%s =3D "%s"
> > +
> > +LAYERDEPENDS_%s =3D "core"
> > +LAYERSERIES_COMPAT_%s =3D "${LAYERSERIES_COMPAT_core}"
>=20
> I feel very strongly that we do not want to just copy and paste this "fol=
low
> core" value around. The template needs to contain an expanded value so th=
at
> when core changes, people need to update their layer to say what they're
> compatible with.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> ------------------------------
>=20
> Message: 3
> Date: Mon, 11 Jun 2018 10:05:04 +0200
> From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> To: openembedded-core@lists.openembedded.org,
> 	Chong.Lu@windriver.com
> Subject: [OE-core] [PATCH] xinetd: Fix systemd service for systemd>237
> Message-ID: <20180611080504.16006-1-ricardo.ribalda@gmail.com>
>=20
> SystemD 237 implements a stricted PIDfile handling that breaks several
> daemons [1].
>=20
> Change the way we start xinetd, mimicing other distros [2].
>=20
> Fixes:
> root@qt5122:~# journalctl -u xinetd
> -- Logs begin at Fri 2018-05-25 14:33:29 UTC, end at Mon 2018-06-11 07:33=
:08
> UTC. -- May 25 14:33:31 qt5122 systemd[1]: Starting Xinetd A Powerful
> Replacement For Inetd...
> May 25 14:33:31 qt5122 systemd[1]: xinetd.service: Permission denied whil=
e
> opening PID file or unsafe symlink chain: /var/run/xinetd.pid Jun 11 07:2=
7:24
> qt5122 systemd[1]: xinetd.service: Start operation timed out. Terminating=
.
> Jun 11 07:27:24 qt5122 systemd[1]: xinetd.service: Failed with result 'ti=
meout'.
> Jun 11 07:27:24 qt5122 systemd[1]: Failed to start Xinetd A Powerful
> Replacement For Inetd.
> Jun 11 07:31:38 qt5122 systemd[1]: Starting Xinetd A Powerful Replacement
> For Inetd...
> Jun 11 07:31:38 qt5122 systemd[1]: xinetd.service: Permission denied whil=
e
> opening PID file or unsafe symlink chain: /var/run/xinetd.pid Jun 11 07:3=
3:08
> qt5122 systemd[1]: xinetd.service: Start operation timed out. Terminating=
.
> Jun 11 07:33:08 qt5122 systemd[1]: xinetd.service: Failed with result 'ti=
meout'.
> Jun 11 07:33:08 qt5122 systemd[1]: Failed to start Xinetd A Powerful
> Replacement For Inetd.
>=20
> [1]: https://github.com/systemd/systemd/issues/8085
> [2]: https://github.com/felixonmars/archlinux-
> community/commit/e49040636737fdb09031e75ec4d73a580f80676b
>=20
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta/recipes-extended/xinetd/xinetd/xinetd.service | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-extended/xinetd/xinetd/xinetd.service
> b/meta/recipes-extended/xinetd/xinetd/xinetd.service
> index d5fdc5bc29..6da92f2bf5 100644
> --- a/meta/recipes-extended/xinetd/xinetd/xinetd.service
> +++ b/meta/recipes-extended/xinetd/xinetd/xinetd.service
> @@ -3,11 +3,8 @@ Description=3DXinetd A Powerful Replacement For Inetd
> After=3Dsyslog.target network.target
>=20
>  [Service]
> -Type=3Dforking
> -PIDFile=3D/var/run/xinetd.pid
>  EnvironmentFile=3D-/etc/sysconfig/xinetd
> -ExecStart=3D@SBINDIR@/xinetd -stayalive -pidfile /var/run/xinetd.pid
> "$EXTRAOPTIONS"
> -ExecReload=3D@BASE_BINDIR@/kill -HUP $MAINPID
> +ExecStart=3D@SBINDIR@/xinetd -dontfork "$EXTRAOPTIONS"
>=20
>  [Install]
>  WantedBy=3Dmulti-user.target
> --
> 2.17.1
>=20
>=20
>=20
> ------------------------------
>=20
> Message: 4
> Date: Mon, 11 Jun 2018 16:29:01 +0800
> From: Anuj Mittal <anuj.mittal@intel.com>
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v2] bitbake-blayers/create: add
> 	LAYERSERIES_COMPAT
> Message-ID: <20180611082901.28043-1-anuj.mittal@intel.com>
>=20
> Derive the value for template layer.conf from core layer and add
> dependendency on it too.
>=20
> Fixes [YOCTO #12767]
>=20
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/lib/bblayers/create.py            | 5 ++++-
>  meta/lib/bblayers/templates/layer.conf | 3 +++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/bblayers/create.py b/meta/lib/bblayers/create.py
> index c1923166fd..e06949c92b 100644
> --- a/meta/lib/bblayers/create.py
> +++ b/meta/lib/bblayers/create.py
> @@ -43,8 +43,11 @@ class CreatePlugin(LayerPlugin):
>          license_dst =3D os.path.join(layerdir, copying)
>          shutil.copy(license_src, license_dst)
>=20
> +        # Get the compat value for core layer.
> +        compat =3D self.tinfoil.config_data.getVar('LAYERSERIES_COMPAT_c=
ore') or
> ""
> +
>          # Create the layer.conf from templates/layer.conf
> -        layerconf_template =3D read_template('layer.conf') % (args.layer=
dir,
> args.layerdir, args.layerdir, args.priority)
> +        layerconf_template =3D read_template('layer.conf') % (args.layer=
dir,
> args.layerdir, args.layerdir, args.priority, args.layerdir, args.layerdir=
, compat)
>          layerconf =3D os.path.join(conf, 'layer.conf')
>          with open(layerconf, 'w') as fd:
>              fd.write(layerconf_template)
> diff --git a/meta/lib/bblayers/templates/layer.conf
> b/meta/lib/bblayers/templates/layer.conf
> index 3c0300226c..49f95cafc8 100644
> --- a/meta/lib/bblayers/templates/layer.conf
> +++ b/meta/lib/bblayers/templates/layer.conf
> @@ -8,3 +8,6 @@ BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
>  BBFILE_COLLECTIONS +=3D "%s"
>  BBFILE_PATTERN_%s =3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_%s =3D "%s"
> +
> +LAYERDEPENDS_%s =3D "core"
> +LAYERSERIES_COMPAT_%s =3D "%s"
> --
> 2.17.1
>=20
>=20
>=20
> ------------------------------
>=20
> Message: 5
> Date: Mon, 11 Jun 2018 08:41:10 +0000
> From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> To: Anuj Mittal <anuj.mittal@intel.com>,
> 	"openembedded-core@lists.openembedded.org"
> 	<openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH v2] bitbake-blayers/create: add
> 	LAYERSERIES_COMPAT
> Message-ID: <1128577de36d44109f83bf326038681e@XBOX02.axis.com>
> Content-Type: text/plain; charset=3D"us-ascii"
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Anuj Mittal
> > Sent: den 11 juni 2018 10:29
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH v2] bitbake-blayers/create: add
> LAYERSERIES_COMPAT
>                                 ^^^^^^^^^^^^^^^
> I assume you mean "bitbake-layers"... This goes for the other
> patch in the series as well.
>=20
> //Peter
>=20
>=20
>=20
> ------------------------------
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20
> End of Openembedded-core Digest, Vol 89, Issue 101
> **************************************************

