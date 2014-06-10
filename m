Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id DBE3A65FC8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 10:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 886D52E382;
	Tue, 10 Jun 2014 12:05:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id ryvShJi59gwC; Tue, 10 Jun 2014 12:04:56 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id F29E92E2A7;
	Tue, 10 Jun 2014 12:04:55 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id DACBAF73;
	Tue, 10 Jun 2014 12:04:55 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id CF110C96;
	Tue, 10 Jun 2014 12:04:55 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id CB7C33E048;
	Tue, 10 Jun 2014 12:04:55 +0200 (CEST)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail2.se.axis.com
	([10.0.5.74]) with mapi; Tue, 10 Jun 2014 12:04:55 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mark Hatle <mark.hatle@windriver.com>, "OE Core
	(openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jun 2014 12:04:54 +0200
Thread-Topic: [OE-core] Using users/groups from another recipe than the one
	creating them
Thread-Index: Ac+EBMwpDWUpudzCSqSXhXFtZMmdQwAdpzbA
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7A7A2BE83BE@xmail3.se.axis.com>
References: <A612847CFE53224C91B23E3A5B48BAC7A7A21EFE0D@xmail3.se.axis.com>
	<A612847CFE53224C91B23E3A5B48BAC7A7A2BE80C7@xmail3.se.axis.com>
	<5395C8F2.7040600@windriver.com>
	<A612847CFE53224C91B23E3A5B48BAC7A7A2BE817E@xmail3.se.axis.com>
	<5395E8C2.6080808@windriver.com>
In-Reply-To: <5395E8C2.6080808@windriver.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Subject: Re: Using users/groups from another recipe than the one creating them
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
X-List-Received-Date: Tue, 10 Jun 2014 10:05:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Mark Hatle
> Sent: den 9 juni 2014 19:03
> To: Peter Kjellerstedt; OE Core (openembedded-
> core@lists.openembedded.org)
> Subject: Re: [OE-core] Using users/groups from another recipe than the
> one creating them
>=20
> On 6/9/14, 11:47 AM, Peter Kjellerstedt wrote:
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> >> Of Mark Hatle
> >> Sent: den 9 juni 2014 16:47
> >> To: Peter Kjellerstedt; OE Core (openembedded-
> >> core@lists.openembedded.org)
> >> Subject: Re: [OE-core] Using users/groups from another recipe than
> >> the one creating them
> >>
> >> On 6/9/14, 8:39 AM, Peter Kjellerstedt wrote:
> >>>> -----Original Message-----
> >>>> From: openembedded-core-bounces@lists.openembedded.org
> >>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On
> >>>> Behalf Of Peter Kjellerstedt
> >>>> Sent: den 23 maj 2014 12:38
> >>>> To: OE Core (openembedded-core@lists.openembedded.org)
> >>>> Subject: Re: [OE-core] Using users/groups from another recipe than
> >>>> the one creating them
> >>>>
> >>>>> -----Original Message-----
> >>>>> From: openembedded-core-bounces@lists.openembedded.org
> >>>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On
> >>>>> Behalf Of Peter Kjellerstedt
> >>>>> Sent: den 19 maj 2014 10:15
> >>>>> To: OE Core (openembedded-core@lists.openembedded.org)
> >>>>> Subject: [OE-core] Using users/groups from another recipe than
> >>>>> the one creating them
> >>>>>
> >>>>> Which assumption is correct: "a recipe A that depends on another
> >>>>> recipe B can use users/groups that B creates" or "all recipes
> >>>>> must create the users/groups they require themselves"?
> >>>>>
> >>>>> The problem for us is that we have a lot of recipes that create
> >>>>> users and groups, and subsequently a number of other related
> >>>>> recipes that need to use those users and groups.
> >>>>>
> >>>>> If the first assumption is correct then the useradd.bbclass needs
> >>>>> to be corrected so that it adds a dependency from do_install to
> >>>>> base-passwd:do_populate_sysroot and
> >>>>> base-passwd:do_populate_sysroot_setscene, because if either of
> >>>>> those tasks execute they will overwrite /etc/passwd and
> >>>>> /etc/group, effectively removing any users/groups that were=20
> >>>>> created earlier...
> >>>>>
> >>>>> On the other hand, if it is the second assumption that is correct,
> >>>>> then there should be QA tests in place to make sure all recipes
> >>>>> create the users/groups they use.
> >>>>>
> >>>>> //Peter
> >>>>
> >>>> *ping*
> >>>>
> >>>> Doesn't anyone know how users and groups are supposed to work?
> >>>>
> >>>> //Peter
> >>>
> >>> *ping again*
> >>
> >> I never saw the original emails, either of them.
> >>
> >>> Well, this is somewhat discouraging. Three weeks and not a single
> >>> response. Are we really the only ones that care about users and
> >>> groups and how they are created? Doesn't anyone know which of my
> >>> two assumptions above are correct?
> >>>
> >>> Personally I would prefer that all recipes create the users and
> >>> groups they require themselves as this keeps them more self
> >>> contained. I have no idea how to write a QA test to verify this,
> >>> but I assume it should be possible...
> >>
> >> The rule is:
> >>
> >> There is a limited number of base users and groups, if your package
> >> uses a user/group in that base set nothing else is needed.
> >>
> >> If your package needs an additional user/group, then it must either:
> >>
> >> *) Add the user/group itself.  Multiple packages are allowed to add
> >>     the same users/groups, with the understanding that the options
> >>     -must- be identical!
> >
> > I have actually been toying with an extension to the
> > useradd.bbclass that allows one to configure the user and group
> > options in one configuration file, and then just state in the
> > recipes which users are needed. That way there is no risk of using
> > different options for the same user if it is created from different
> > recipes. Haven't finished it though. One thing I have not solved is
> > how to handle requiring the configuration file from all layers as
> > they may all need to add users (or what to do if multiple layers
> > define the same user differently...)
>=20
> If you implement this, you should follow the example of the
> "useradd-staticids.bbclass".  This is something that a user can
> optionally add into their environment to better define how things=20
> are configured.
>=20
> I still contend that these items belong in the recipes and that it's=20
> a recipe bug if they're not done properly.  We can help automate this,=20
> but I don't know if that is yet a reasonable general solution.
>=20
> The staticids class collects together "USERADD_UID_TABLES" values,=20
> and then rewrites the USERADD_PARAMS/GROUPADD_PARAMS to match whatever=20
> the table(s) say.  This is the same mechanism that we use for the=20
> filesystem table to synchronize standard owners/groups/perms in various=20
> recipes.
>=20
> I would still expect the recipe to say I need the following
> users/groups.. and then to pick up the data from the tables if necessary.

Thanks for the tips. I will definitely look at what=20
useradd-staticids.bbclass does if I decide to continue to work=20
on this.

> >> *) Must -require- (not recommend) a package that adds the group that
> >>     they require.  It's a good idea in the recipe to comment that
> >>     the 'require' adds the user/group as well.
> >>
> >> This is pretty common where a single recipe provides multiple
> >> packages.  If a common package creates the user/group, then all=20
> >> of the other packages [that need that user/group] should then=20
> >> require the common package.
> >
> > Ok, then my first assumption was the correct one. In that case I
> > will look into fixing the useradd.bbclass so that the missing
> > dependency is added.
>=20
> useradd isn't the right place for the dependency, it really is a=20
> recipe level dependency.

useradd.bbclass adds a dependency on base-passwd for each recipe=20
that inherits it. In addition it does this:

USERADDSETSCENEDEPS =3D "${MLPREFIX}base-passwd:do_populate_sysroot_setscen=
e shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_p=
opulate_sysroot_setscene"
USERADDSETSCENEDEPS_class-cross =3D ""
USERADDSETSCENEDEPS_class-native =3D ""
USERADDSETSCENEDEPS_class-nativesdk =3D ""
do_package_setscene[depends] +=3D "${USERADDSETSCENEDEPS}"
do_populate_sysroot_setscene[depends] +=3D "${USERADDSETSCENEDEPS}"

However, this does not seem to trigger anything. If I first do=20
"bitbake base-passwd -c clean && bitbake base-passwd" (which=20
will wipe /etc/passwd and /etc/groups in the sysroot) and then=20
try to rebuild a recipe that creates a user, e.g. "bitbake dbus",=20
then noting happens and the messagebus user is not added to=20
/etc/passwd. Consequently, any other recipes that rely on dbus=20
to create the messagebus user will then fail if one tries to=20
rebuild them.

I tried to add the following to see if any of it did any=20
difference, but it didn't:

USERADDDEPS =3D "${MLPREFIX}base-passwd:do_populate_sysroot ${MLPREFIX}base=
-passwd:do_populate_sysroot_setscene"
USERADDDEPS_class-cross =3D ""
USERADDDEPS_class-native =3D ""
USERADDDEPS_class-nativesdk =3D ""
do_install[depends] +=3D "${USERADDDEPS}"
do_package[depends] +=3D "${USERADDDEPS}"
do_populate_sysroot[depends] +=3D "${USERADDDEPS}"

My guess is that since the signature of the
base-passwd:do_populate_sysroot_setscene task has not changed it=20
will not trigger the dependent tasks to run even if it has changed=20
the sysroot...

Since it does not seem possible to trigger the recipes that=20
install users to redo it after base-passwd has trashed /etc/passwd,=20
maybe the solution is to use the "database" you describe below.=20
That way, when base-passwd does its job, it would only affect the=20
users it has installed itself and leave the others alone.

> >> As far as the QA resources go.  There are actually two sides to
> >> the QA. The first is in the do_install step, if the users/groups
> >> are being used there -- and don't exist -- a failure should be
> >> generated.  That exists just by the nature of the system build
> >> processes.
> >>
> >> The second is that once a package has been generated (the package
> >> directory that is), it should be verified that all files are owned
> >> by in the base set of users/groups, the user/group has been added,
> >> or a dependency on the package that added them exist.  This is
> >> difficult to do though.  There is currently no tracking mechanism
> >> in the system to say which recipes added which users/groups to the
> >> system.  A mechanism similar to the sysroot file population would
> >> be required to capture the user and group changes and by which
> >> package(s). This of course would also have to work with the
> >> sstate-cache mechanism.
> >>
> >> The first step in implementing this would be to capture the
> >> user/group changes and record them in a database.  (again, I think
> >> similar to the populate sysroot file).  Then during the QA process,
> >> you can iterate over the files and find out where each user/group
> >> in use comes from.  If the provider is not in the 'required' set of
> >> packages generate a QA -warning- (since this is new and unproven
> >> code).. We can upgrade it to an error once it's stable.
> >
> > Hmm, ok. This all sound like something we want. However, my Python
> > skills are probably not up to the task, unfortunately.
>=20
> You should look into how the populate_sysroot function writes out=20
> the list of files installed into the sysroot.. and see if you can=20
> do something similar for the packages.  It's python, but I don't=20
> think it's that heavy of a python code.
>=20
> --Mark

I will have to save the database idea to after I am back from my=20
summer vacation in August. I will not have time to do any work=20
on it before then anyway.

//Peter


