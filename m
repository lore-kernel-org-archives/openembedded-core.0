Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id CECDA7C7A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 15:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 61F1B18361;
	Fri, 12 Apr 2019 17:51:08 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id RtZJEH770Gv9; Fri, 12 Apr 2019 17:51:07 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id B21C9186F9;
	Fri, 12 Apr 2019 17:51:06 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BEF61A06D;
	Fri, 12 Apr 2019 17:51:06 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80BF91A065;
	Fri, 12 Apr 2019 17:51:06 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 12 Apr 2019 17:51:06 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 749A72D5B;
	Fri, 12 Apr 2019 17:51:06 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 12 Apr 2019 17:51:06 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Fri, 12 Apr 2019 17:51:06 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] useradd.bbclass: Make sure users/groups exist
	for package_write_* tasks
Thread-Index: AQHU6ht5rKnZdMrgykStWNHqqyp4A6YsCYBwgAyvxzA=
Date: Fri, 12 Apr 2019 15:51:06 +0000
Message-ID: <acc766373fca400587d0d779dd9f2550@XBOX04.axis.com>
References: <20190403122626.18451-1-pkj@axis.com>
	<866ba68abe94b19205b70f59a512c68ef65b79a1.camel@linuxfoundation.org>
	<4788506b5c7f4fb4a369916b5500c373@XBOX04.axis.com>
In-Reply-To: <4788506b5c7f4fb4a369916b5500c373@XBOX04.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] useradd.bbclass: Make sure users/groups exist for package_write_* tasks
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
X-List-Received-Date: Fri, 12 Apr 2019 15:51:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 4 april 2019 16:08
> To: Richard Purdie <richard.purdie@linuxfoundation.org>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] useradd.bbclass: Make sure users/groups
> exist for package_write_* tasks
>=20
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: den 3 april 2019 14:48
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] useradd.bbclass: Make sure users/groups
> > exist for package_write_* tasks
> >
> > On Wed, 2019-04-03 at 14:26 +0200, Peter Kjellerstedt wrote:
> > > If the populate_lic task and any of the package_write_* tasks need to
> > > run, but the package task can be restored from the sstate cache, then
> > > the fetch task, which is a dependency of populate_lic, will wipe out
> > > the RSS including any users/groups that have been created. This
> > > results in that the package_write_* tasks are run without any
> > > user/group information, which causes them to fallback to either use
> > > the root user for any unknown users/groups (rpm) or to use the numeri=
c
> > > UIDs/GIDs (deb/ipk). Neither solution will yield correct packages.
> > >
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > ---
> > >  meta/classes/useradd.bbclass | 18 ++++++++++++------
> > >  1 file changed, 12 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbcl=
ass
> > > index 124becd082..e32315a1af 100644
> > > --- a/meta/classes/useradd.bbclass
> > > +++ b/meta/classes/useradd.bbclass
> > > @@ -4,7 +4,7 @@ inherit useradd_base
> > >  # target sysroot, and shadow -native and -sysroot provide the utilit=
ies
> > >  # and support files needed to add and modify user and group accounts
> > >  DEPENDS_append_class-target =3D " base-files shadow-native shadow-sy=
sroot shadow base-passwd"
> > > -PACKAGE_WRITE_DEPS +=3D "shadow-native"
> > > +PACKAGE_WRITE_DEPS +=3D "shadow-native shadow-sysroot base-passwd"
> > >
> > >  # This preinstall function can be run in four different contexts:
> > >  #
> > > @@ -144,7 +144,10 @@ python useradd_sysroot_sstate () {
> > >      task =3D d.getVar("BB_CURRENTTASK")
> > >      if task =3D=3D "package_setscene":
> > >          bb.build.exec_func("useradd_sysroot", d)
> > > -    elif task =3D=3D "prepare_recipe_sysroot":
> > > +    elif (task =3D=3D "prepare_recipe_sysroot" or
> > > +          task =3D=3D "package_write_deb" or
> > > +          task =3D=3D "package_write_ipk" or
> > > +          task =3D=3D "package_write_rpm"):
> > >          # Used to update this recipe's own sysroot so the user/group=
s are available to do_install
> > >          scriptfile =3D d.expand("${RECIPE_SYSROOT}${bindir}/postinst=
-useradd-${PN}")
> > >          bb.build.exec_func("useradd_sysroot", d)
> > > @@ -161,13 +164,16 @@ python useradd_sysroot_sstate () {
> > >          os.chmod(scriptfile, 0o755)
> > >  }
> > >
> > > -do_prepare_recipe_sysroot[postfuncs] +=3D "${SYSROOTFUNC}"
> > > -SYSROOTFUNC_class-target =3D "useradd_sysroot_sstate"
> > >  SYSROOTFUNC =3D ""
> > > +SYSROOTFUNC_class-target =3D "useradd_sysroot_sstate"
> > >
> > > -SYSROOT_PREPROCESS_FUNCS +=3D "${SYSROOTFUNC}"
> > > +do_prepare_recipe_sysroot[postfuncs] +=3D "${SYSROOTFUNC}"
> > > +do_package_write_deb[prefuncs] +=3D "${SYSROOTFUNC}"
> > > +do_package_write_ipk[prefuncs] +=3D "${SYSROOTFUNC}"
> > > +do_package_write_rpm[prefuncs] +=3D "${SYSROOTFUNC}"
> > >
> > > -SSTATEPREINSTFUNCS_append_class-target =3D " useradd_sysroot_sstate"
> > > +SYSROOT_PREPROCESS_FUNCS +=3D "${SYSROOTFUNC}"
> > > +SSTATEPREINSTFUNCS +=3D "${SYSROOTFUNC}"
> > >
> > >  do_package_setscene[depends] +=3D "${USERADDSETSCENEDEPS}"
> > >  do_populate_sysroot_setscene[depends] +=3D "${USERADDSETSCENEDEPS}"
> >
> > This may be a bigger problem that just package_write_*.
> >
> > This feels like a bad thing to do since there may be other tasks which
> > also rely on the user information being present. This probably only
> > fixes one corner case but there are likey others :(.
> >
> > Possible solutions might be:
> >
> > a) To wipe out all sstate tasks if we're rerunning do_fetch
>=20
> How to do that? With some pointers I hope I can whip up a patch
> to do this instead.

I would very much like to have a solution for this in Warrior. If=20
the solution provided by the patch above is not acceptable, I need=20
some help where to look for how to solve it by wiping out the=20
sstate tasks if do_fetch is being rerun.

> Is this rare or is it likely to cause a performance impact?
> If it only happens in the cases where we are seeing problems due to
> the removed user/group info, then it should be reasonably rare.
>=20
> > b) Preserve the user/group information around the cleaning of the
> > sysroot
>=20
> This sounds error prone at best...
>=20
> > I think we may need to fix this generically...
> >
> > Cheers,
> >
> > Richard
>=20
> //Peter

//Peter



