Return-Path: <bevenson@melinkcorp.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0114.outbound.protection.outlook.com [207.46.100.114])
	by mail.openembedded.org (Postfix) with ESMTP id 8FDC971EC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 20:50:23 +0000 (UTC)
Received: from DM2PR0501MB1101.namprd05.prod.outlook.com (25.160.245.11) by
	DM2PR0501MB1102.namprd05.prod.outlook.com (25.160.245.12) with
	Microsoft SMTP
	Server (TLS) id 15.1.136.25; Tue, 21 Apr 2015 20:50:23 +0000
Received: from DM2PR0501MB1101.namprd05.prod.outlook.com ([25.160.245.11]) by
	DM2PR0501MB1101.namprd05.prod.outlook.com ([25.160.245.11]) with
	mapi id 15.01.0136.014; Tue, 21 Apr 2015 20:50:23 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: ChenQi <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] populate-volatile.sh: detect the change of
	configuration files
Thread-Index: AQHQe/h+wEvbwmw2r02g2dgw70uvQp1XZk6QgACKP8A=
Date: Tue, 21 Apr 2015 20:50:23 +0000
Message-ID: <DM2PR0501MB11018BA9FD5448E8F8774BB4BBEF0@DM2PR0501MB1101.namprd05.prod.outlook.com>
References: <cover.1426832653.git.Qi.Chen@windriver.com>
	<90fb0fe5d4a4139729dbaf7ba39191bf8c9608a8.1426832653.git.Qi.Chen@windriver.com>
	<5535E767.8040501@windriver.com>
	<DM2PR0501MB11011C5E2D275FE735F070B8BBEF0@DM2PR0501MB1101.namprd05.prod.outlook.com>
In-Reply-To: <DM2PR0501MB11011C5E2D275FE735F070B8BBEF0@DM2PR0501MB1101.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 01F2F012009A8801F2F15F
authentication-results: windriver.com; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR0501MB1102;
x-microsoft-antispam-prvs: <DM2PR0501MB1102F263B345C4704CD40942BBEF0@DM2PR0501MB1102.namprd05.prod.outlook.com>
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(13464003)(51704005)(377454003)(479174004)(24454002)(76176999)(87936001)(2656002)(74316001)(50986999)(122556002)(40100003)(5001770100001)(2501003)(54356999)(102836002)(15975445007)(19580395003)(2950100001)(33656002)(1720100001)(19580405001)(2900100001)(86362001)(66066001)(93886004)(77156002)(76576001)(99286002)(575784001)(92566002)(62966003)(106116001)(107886001)(46102003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0501MB1102;
	H:DM2PR0501MB1101.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(5002010); SRVR:DM2PR0501MB1102; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0501MB1102; 
x-forefront-prvs: 0553CBB77A
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2015 20:50:23.1927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0501MB1102
Subject: Re: [PATCH 1/1] populate-volatile.sh: detect the change of configuration files
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
X-List-Received-Date: Tue, 21 Apr 2015 20:50:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Chen,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Bryan Evenson
> Sent: Tuesday, April 21, 2015 8:35 AM
> To: ChenQi; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/1] populate-volatile.sh: detect the chang=
e
> of configuration files
>=20
> Chen,
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On
> Behalf Of
> > ChenQi
> > Sent: Tuesday, April 21, 2015 2:00 AM
> > To: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 1/1] populate-volatile.sh: detect the
> > change of configuration files
> >
> > ping ...
> >
> > //Chen Qi
> >
> > On 03/20/2015 02:27 PM, Chen Qi wrote:
> > > In case the configuration files are modified by user, the cached
> > > script, /etc/volatile.cache should not be executed. Instead, the
> > > configuration files should be parsed again and generate the new cache=
.
> > > Otherwise, the user modifications take no effect which would
> > > obviously
> > confuse users.
> > >
> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > ---
> > >   .../initscripts/initscripts-1.0/populate-volatile.sh  | 19
> > ++++++++++++++++++-
> > >   1 file changed, 18 insertions(+), 1 deletion(-)
> > >
> > > diff --git
> > > a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> > > b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> > > index 904037e..eaf0f1c 100755
> > > ---
> > > a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> > > +++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile=
.
> > > +++ sh
> > > @@ -204,9 +204,25 @@ do
> > >   done
> > >   exec 9>&-
> > >
> > > -if test -e ${ROOT_DIR}/etc/volatile.cache -a
> "$VOLATILE_ENABLE_CACHE"
> > =3D "yes" -a "x$1" !=3D "xupdate" -a "x$clearcache" =3D "x0"
> > > +# Check whether configuration files have changed, if so, the cache
> > > +needs to be removed # and generated again CACHE_MATCH=3D"no"
> > > +CACHE_DATA=3D"${ROOT_DIR}/etc/.volatile.cache.data"
> > > +CACHE_TMP=3D"${ROOT_DIR}/etc/.volatile.cache.tmp"
> > > +VOLATILE_CONFFILES=3D"${ROOT_DIR}/etc/default/volatiles/*"
> > > +if [ "$VOLATILE_ENABLE_CACHE" =3D "yes" ]; then
> > > +	stat -c '%s %Y %n' $VOLATILE_CONFFILES | awk -F/ '{print $1 " " $NF=
;}'
> > > $CACHE_TMP
> > > +	if [ -e $CACHE_DATA ]; then
> > > +		if cmp $CACHE_DATA $CACHE_TMP > /dev/null; then
> > > +			CACHE_MATCH=3D"yes"
> > > +		fi
> > > +	fi
> > > +fi
> > > +
> > > +if test -e ${ROOT_DIR}/etc/volatile.cache -a
> "$VOLATILE_ENABLE_CACHE"
> > =3D "yes" -a "x$1" !=3D "xupdate" -a "x$clearcache" =3D "x0" -a
> > "$CACHE_MATCH" =3D "yes"
> > >   then
> > >   	sh ${ROOT_DIR}/etc/volatile.cache
> > > +	[ -e $CACHE_TMP ] && rm $CACHE_TMP
> > >   else
> > >   	rm -f ${ROOT_DIR}/etc/volatile.cache
> > ${ROOT_DIR}/etc/volatile.cache.build
> > >   	for file in `ls -1 "${CFGDIR}" | sort`; do @@ -214,6 +230,7 @@ els=
e
> > >   	done
> > >
> > >   	[ -e ${ROOT_DIR}/etc/volatile.cache.build ] && sync && mv
> > > ${ROOT_DIR}/etc/volatile.cache.build ${ROOT_DIR}/etc/volatile.cache
> > > +	[ -e $CACHE_TMP ] && mv $CACHE_TMP $CACHE_DATA
> > >   fi
> > >
> > >   if [ -z "${ROOT_DIR}" ] && [ -f /etc/ld.so.cache ] && [ ! -f
> > > /var/run/ld.so.cache ]
> >
>=20
> I didn't see this patch when I was working through my issues.  I'll test =
this
> patch on my system with my change to pkg_postinst removed and verify I
> get the same end result.

I reverted commit 167025e6d72c44cacfdc5d8b98e942066df09a4f on my system and=
 applied your patch and applied the upgrade as before.  /etc/volatile.cache=
 was updated on my system and I don't see any of the problems I was experie=
ncing previously.  This fix works for me.

Regards,
Bryan

>=20
> Regards,
> Bryan
>=20
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

