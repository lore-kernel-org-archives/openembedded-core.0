Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id BEE5B65DB4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 16:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C0B75180B1;
	Mon,  9 Jun 2014 18:48:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Xc7ICHfg4PZL; Mon,  9 Jun 2014 18:47:59 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 802971809A;
	Mon,  9 Jun 2014 18:47:59 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 6105AED8;
	Mon,  9 Jun 2014 18:47:59 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 54C557E9;
	Mon,  9 Jun 2014 18:47:59 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id 52AE034005;
	Mon,  9 Jun 2014 18:47:59 +0200 (CEST)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail2.se.axis.com
	([10.0.5.74]) with mapi; Mon, 9 Jun 2014 18:47:59 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mark Hatle <mark.hatle@windriver.com>, "OE Core
	(openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 9 Jun 2014 18:47:58 +0200
Thread-Topic: [OE-core] Using users/groups from another recipe than the one
	creating them
Thread-Index: Ac+D8dXS51YQf092SI+hT7aoVp05vQAB2Qkw
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7A7A2BE817E@xmail3.se.axis.com>
References: <A612847CFE53224C91B23E3A5B48BAC7A7A21EFE0D@xmail3.se.axis.com>
	<A612847CFE53224C91B23E3A5B48BAC7A7A2BE80C7@xmail3.se.axis.com>
	<5395C8F2.7040600@windriver.com>
In-Reply-To: <5395C8F2.7040600@windriver.com>
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
X-List-Received-Date: Mon, 09 Jun 2014 16:48:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Mark Hatle
> Sent: den 9 juni 2014 16:47
> To: Peter Kjellerstedt; OE Core (openembedded-
> core@lists.openembedded.org)
> Subject: Re: [OE-core] Using users/groups from another recipe than the
> one creating them
>=20
> On 6/9/14, 8:39 AM, Peter Kjellerstedt wrote:
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> >> Of Peter Kjellerstedt
> >> Sent: den 23 maj 2014 12:38
> >> To: OE Core (openembedded-core@lists.openembedded.org)
> >> Subject: Re: [OE-core] Using users/groups from another recipe than
> >> the one creating them
> >>
> >>> -----Original Message-----
> >>> From: openembedded-core-bounces@lists.openembedded.org
> >>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> >>> Of Peter Kjellerstedt
> >>> Sent: den 19 maj 2014 10:15
> >>> To: OE Core (openembedded-core@lists.openembedded.org)
> >>> Subject: [OE-core] Using users/groups from another recipe than the
> >>> one creating them
> >>>
> >>> Which assumption is correct: "a recipe A that depends on another
> >>> recipe B can use users/groups that B creates" or "all recipes must
> >>> create the users/groups they require themselves"?
> >>>
> >>> The problem for us is that we have a lot of recipes that create
> >>> users and groups, and subsequently a number of other related
> >>> recipes that need to use those users and groups.
> >>>
> >>> If the first assumption is correct then the useradd.bbclass needs
> >>> to be corrected so that it adds a dependency from do_install to
> >>> base-passwd:do_populate_sysroot and
> >>> base-passwd:do_populate_sysroot_setscene, because if either of
> >>> those tasks execute they will overwrite /etc/passwd and /etc/group,
> >>> effectively removing any users/groups that were created earlier...
> >>>
> >>> On the other hand, if it is the second assumption that is correct,
> >>> then there should be QA tests in place to make sure all recipes
> >>> create the users/groups they use.
> >>>
> >>> //Peter
> >>
> >> *ping*
> >>
> >> Doesn't anyone know how users and groups are supposed to work?
> >>
> >> //Peter
> >
> > *ping again*
>=20
> I never saw the original emails, either of them.
>=20
> > Well, this is somewhat discouraging. Three weeks and not a single
> > response. Are we really the only ones that care about users and
> > groups and how they are created? Doesn't anyone know which of my
> > two assumptions above are correct?
> >
> > Personally I would prefer that all recipes create the users and
> > groups they require themselves as this keeps them more self
> > contained. I have no idea how to write a QA test to verify this,
> > but I assume it should be possible...
>=20
> The rule is:
>=20
> There is a limited number of base users and groups, if your package
> uses a user/group in that base set nothing else is needed.
>=20
> If your package needs an additional user/group, then it must either:
>=20
> *) Add the user/group itself.  Multiple packages are allowed to add=20
>    the same users/groups, with the understanding that the options=20
>    -must- be identical!

I have actually been toying with an extension to the=20
useradd.bbclass that allows one to configure the user and group=20
options in one configuration file, and then just state in the=20
recipes which users are needed. That way there is no risk of using=20
different options for the same user if it is created from different=20
recipes. Haven't finished it though. One thing I have not solved is=20
how to handle requiring the configuration file from all layers as=20
they may all need to add users (or what to do if multiple layers=20
define the same user differently...)

> *) Must -require- (not recommend) a package that adds the group that
>    they require.  It's a good idea in the recipe to comment that the=20
>    'require' adds the user/group as well.
>=20
> This is pretty common where a single recipe provides multiple packages.
> If a common package creates the user/group, then all of the other=20
> packages [that need that user/group] should then require the common=20
> package.

Ok, then my first assumption was the correct one. In that case I=20
will look into fixing the useradd.bbclass so that the missing=20
dependency is added.

> As far as the QA resources go.  There are actually two sides to=20
> the QA. The first is in the do_install step, if the users/groups=20
> are being used there -- and don't exist -- a failure should be=20
> generated.  That exists just by the nature of the system build=20
> processes.
>=20
> The second is that once a package has been generated (the package
> directory that is), it should be verified that all files are owned=20
> by in the base set of users/groups, the user/group has been added,=20
> or a dependency on the package that added them exist.  This is=20
> difficult to do though.  There is currently no tracking mechanism=20
> in the system to say which recipes added which users/groups to the=20
> system.  A mechanism similar to the sysroot file population would=20
> be required to capture the user and group changes and by which=20
> package(s). This of course would also have to work with the=20
> sstate-cache mechanism.
>=20
> The first step in implementing this would be to capture the=20
> user/group changes and record them in a database.  (again, I think=20
> similar to the populate sysroot file).  Then during the QA process,=20
> you can iterate over the files and find out where each user/group=20
> in use comes from.  If the provider is not in the 'required' set of=20
> packages generate a QA -warning- (since this is new and unproven=20
> code).. We can upgrade it to an error once it's stable.

Hmm, ok. This all sound like something we want. However, my Python=20
skills are probably not up to the task, unfortunately.

> --Mark
>=20
> > //Peter

//Peter


