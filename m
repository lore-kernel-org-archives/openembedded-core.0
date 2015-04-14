Return-Path: <bevenson@melinkcorp.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0148.outbound.protection.outlook.com [207.46.100.148])
	by mail.openembedded.org (Postfix) with ESMTP id 68B5173912
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 20:41:56 +0000 (UTC)
Received: from BN3PR0501MB1089.namprd05.prod.outlook.com (25.160.113.11) by
	BN3PR0501MB1316.namprd05.prod.outlook.com (25.160.183.17) with
	Microsoft SMTP
	Server (TLS) id 15.1.136.25; Tue, 14 Apr 2015 20:41:56 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com (25.160.113.12) by
	BN3PR0501MB1089.namprd05.prod.outlook.com (25.160.113.11) with
	Microsoft SMTP
	Server (TLS) id 15.1.136.25; Tue, 14 Apr 2015 20:41:55 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) by
	BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) with
	mapi id 15.01.0136.014; Tue, 14 Apr 2015 20:41:55 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core][dizzy][PATCH] base-files: Check for /run and /var/lock
	softlinks on upgrade
Thread-Index: AQHQc62wvLM5wei+eUuM1Pr7RRODYZ1Mp2aggABVe0A=
Date: Tue, 14 Apr 2015 20:41:54 +0000
Message-ID: <BN3PR0501MB109071C50855A918E8395B83BBE60@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <1428684268-55681-1-git-send-email-bevenson@melinkcorp.com>
	<BN3PR0501MB1090C5485C34B9B9C6BB1253BBE60@BN3PR0501MB1090.namprd05.prod.outlook.com>
In-Reply-To: <BN3PR0501MB1090C5485C34B9B9C6BB1253BBE60@BN3PR0501MB1090.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 01E4FED10099B201E5001E
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0501MB1089;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0501MB1316; 
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(164054003)(51704005)(377454003)(13464003)(62966003)(107886001)(86362001)(2656002)(46102003)(2900100001)(2950100001)(66066001)(76576001)(450100001)(102836002)(2501003)(5890100001)(77156002)(19580405001)(19580395003)(54356999)(76176999)(33656002)(50986999)(106116001)(2351001)(122556002)(110136001)(99286002)(74316001)(87936001)(92566002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0501MB1089;
	H:BN3PR0501MB1090.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-microsoft-antispam-prvs: <BN3PR0501MB1089A0AC4ADE498E3C47BFA6BBE60@BN3PR0501MB1089.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BN3PR0501MB1089; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0501MB1089; 
x-forefront-prvs: 054642504A
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2015 20:41:54.3824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0501MB1089
X-OriginatorOrg: melinkcorp.com
Subject: Re: [dizzy][PATCH] base-files: Check for /run and /var/lock softlinks on upgrade
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
X-List-Received-Date: Tue, 14 Apr 2015 20:41:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All,

> -----Original Message-----
> From: Bryan Evenson
> Sent: Tuesday, April 14, 2015 11:47 AM
> To: Bryan Evenson; openembedded-core@lists.openembedded.org
> Subject: RE: [oe-core][dizzy][PATCH] base-files: Check for /run and /var/=
lock
> softlinks on upgrade
>=20
> All,
>=20
> > -----Original Message-----
> > From: Bryan Evenson [mailto:bevenson@melinkcorp.com]
> > Sent: Friday, April 10, 2015 12:44 PM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Bryan Evenson
> > Subject: [oe-core][dizzy][PATCH] base-files: Check for /run and
> > /var/lock softlinks on upgrade
> >
> > Commit ea647cd9eebdc3e3121b84074519c4bb305adac9 moved the
> locations of
> > /run and /var/lock to match the FHS 3 draft specifications.
> > However, the install doesn't remove the existing directories.
> > As a result, upgrading a system may result in /run as a softlink to
> > /var/run and /var/run as a softlink to /run, creating a circular link.
> >
> > During pre and post-install, check for the existence of the old
> > softlinks, move the old file contents to a temporary location, remove
> > the softlinks, and restore the directory contents after installation.
> >
>=20
> I went about this wrong, as I forgot that items may be mounted under /run=
.
> I'm working on a different solution in which the preinst step removes the
> /run and /var/lock softlinks if they exist.  However, I still have odd is=
sues.
> The first reboot works fine, but then on the next reboot there is a link =
inside
> /run for "run -> /var/run" and inside /var there is a link for "run ->
> /var/volatile/run".  This doesn't match up with the files listed in the b=
ase-files
> recipe.  I can't figure out where these links are coming from.  Has anyon=
e else
> had issues upgrading base-files?

The root cause seems to be the initscripts package.  The script /etc/volati=
le.cache is generated by /etc/init.d/populate-volatile.sh.  On upgrade, thi=
s file is not removed and may not necessarily be regenerated.  As a result,=
 on the next boot the script /etc/volatile.cache repopulates directories as=
 it remembers them which may not be accurate.  In my case, after the reboot=
, the /etc/volatile.cache script deleted everything from a USB flash drive =
attached to my system when it attempted to remove /run.

So to get this portion of the upgrade to work, I had to:
1. Remove the softlinks for /run and /var/lock through a preinst script in =
the base-files recipe
2. Remove /etc/volatile.cache as a postint script in the initscripts recipe

Would someone like for me to submit a patch?

Thanks,
Bryan

>=20
> Thanks,
> Bryan
>=20
> > Signed-off-by: Bryan Evenson <bevenson@melinkcorp.com>
> > ---
> >  meta/recipes-core/base-files/base-files_3.0.14.bb | 55
> > +++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >
> > diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb
> > b/meta/recipes-core/base-files/base-files_3.0.14.bb
> > index 07f5c54..71cea08 100644
> > --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> > +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> > @@ -66,6 +66,41 @@ hostname =3D "openembedded"
> >
> >  BASEFILESISSUEINSTALL ?=3D "do_install_basefilesissue"
> >
> > +# In previous versions of base-files, /run was a softlink to /var/run
> > +and the # directory was located in /var/volatlie/run.  Also,
> > +/var/lock was a softlink # to /var/volatile/lock which is where the
> > +real directory was located.  Now, # /run and /run/lock are the real
> > +directories.  If we are upgrading, we may # need to remove the symboli=
c
> links first before we create the directories.
> > +# Otherwise the directory creation will fail and we will have
> > +circular symbolic # links.
> > +#
> > +# If we do need to remove the symbolic links first, we also need to
> > +preserve # all the contents of the directory so running programs can
> > +find the files that # are in use in these directories.  Move the
> > +contents to a temporary
> > directory
> > +# during pre-install to protect the contents pkg_preinst_${PN} () {
> > +    #!/bin/sh -e
> > +    if [ x"$D" =3D "x" ]; then
> > +        if [ -e "/var/volatile/lock" ]; then
> > +            # Move the contents of /var/volatile/lock to a temporary d=
irectory
> > +            mkdir -p /run_lock_tmp
> > +            mv /var/volatile/lock/* /run_lock_tmp/
> > +
> > +            # Remove the current directory
> > +            rm -rf /var/volatile/lock
> > +        fi
> > +
> > +        if [ -h "/run" ]; then
> > +            # Move the contents of /run to a temporary directory
> > +            mkdir -p /run_tmp
> > +            mv /run/* /run_tmp/
> > +
> > +            # Remove the current directory
> > +            rm -rf /run
> > +        fi
> > +    fi
> > +}
> > +
> >  do_install () {
> >  	for d in ${dirs755}; do
> >  		install -m 0755 -d ${D}$d
> > @@ -79,6 +114,7 @@ do_install () {
> >  	for d in ${volatiles}; do
> >  		ln -sf volatile/$d ${D}${localstatedir}/$d
> >  	done
> > +
> >  	ln -snf ../run ${D}${localstatedir}/run
> >  	ln -snf ../run/lock ${D}${localstatedir}/lock
> >
> > @@ -144,6 +180,25 @@ do_install_append_linuxstdbase() {
> >          done
> >  }
> >
> > +# If we are on the actual hardware, check if we had to move /run and
> > /run/lock.
> > +# If so, copy the temporary directory contents to their new locations.
> > +pkg_postinst_${PN} () {
> > +    #!/bin/sh -e
> > +    if [ x"$D" =3D "x" ]; then
> > +        if [ -e "/run_tmp" ]; then
> > +            mv /run_tmp/* /run/
> > +            rmdir /run_tmp
> > +        fi
> > +
> > +        if [ -e "/run_lock_tmp/" ]; then
> > +            mv /run_lock_tmp/* /run/lock
> > +            rmdir /run_lock_tmp
> > +        fi
> > +    else
> > +        exit 1
> > +    fi
> > +}
> > +
> >  PACKAGES =3D "${PN}-doc ${PN} ${PN}-dev ${PN}-dbg"
> >  FILES_${PN} =3D "/"
> >  FILES_${PN}-doc =3D "${docdir} ${datadir}/common-licenses"
> > --
> > 2.1.0


