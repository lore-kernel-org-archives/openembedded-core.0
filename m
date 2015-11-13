Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6B3772AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 12:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6DB2C18185;
	Fri, 13 Nov 2015 13:51:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id EfdOOLbSmM6j; Fri, 13 Nov 2015 13:51:34 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id BB7641808E;
	Fri, 13 Nov 2015 13:51:33 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id A3AC4951;
	Fri, 13 Nov 2015 13:51:33 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 98347FF;
	Fri, 13 Nov 2015 13:51:33 +0100 (CET)
Received: from xmail4.se.axis.com (xmail4.se.axis.com [10.0.5.46])
	by seth.se.axis.com (Postfix) with ESMTP id 93EE03E467;
	Fri, 13 Nov 2015 13:51:33 +0100 (CET)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail4.se.axis.com
	([fe80::2dfa:6a3a:302a:d4e8%14]) with mapi;
	Fri, 13 Nov 2015 13:51:33 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 13 Nov 2015 13:51:31 +0100
Thread-Topic: [OE-core] [PATCH 5/5] useradd-staticids.bbclass: Read
	passwd/group files before parsing
Thread-Index: AdEb0ecuiHW0ftUnQraAq9/w8bcHZAAj8jfw
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7C6F04E6985@xmail3.se.axis.com>
References: <cover.1446595453.git.pkj@axis.com>
	<d2e824d17dae9f9583a11ee2165096e7cff533b0.1446595453.git.pkj@axis.com>
	<5639522B.5050604@windriver.com>
	<A612847CFE53224C91B23E3A5B48BAC7C6F013F187@xmail3.se.axis.com>
	<563D0A1E.9060601@windriver.com>
	<A612847CFE53224C91B23E3A5B48BAC7C6F0358BFF@xmail3.se.axis.com>
	<56421624.60201@windriver.com>
In-Reply-To: <56421624.60201@windriver.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] useradd-staticids.bbclass: Read passwd/group files before parsing
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
X-List-Received-Date: Fri, 13 Nov 2015 12:51:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Mark Hatle
> Sent: den 10 november 2015 17:07
> To: Peter Kjellerstedt
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 5/5] useradd-staticids.bbclass: Read
> passwd/group files before parsing
>=20
> On 11/10/15 9:54 AM, Peter Kjellerstedt wrote:
> >> -----Original Message-----
> >> From: Mark Hatle [mailto:mark.hatle@windriver.com]
> >> Sent: den 6 november 2015 21:14
> >> To: Peter Kjellerstedt
> >> Cc: openembedded-core@lists.openembedded.org
> >> Subject: Re: [PATCH 5/5] useradd-staticids.bbclass: Read
> >> passwd/group files before parsing
> >>
> >> On 11/6/15 2:09 PM, Peter Kjellerstedt wrote:
> >>>> -----Original Message-----
> >>>> From: Mark Hatle [mailto:mark.hatle@windriver.com]
> >>>> Sent: den 4 november 2015 01:33
> >>>> To: Peter Kjellerstedt; openembedded-core@lists.openembedded.org
> >>>> Subject: Re: [PATCH 5/5] useradd-staticids.bbclass: Read
> >>>> passwd/group files before parsing
> >>>>
> >>>> On 11/3/15 6:06 PM, Peter Kjellerstedt wrote:
> >>>>> Read and merge the passwd/group files before parsing the user and
> >>>>> group definitions. This means they will only be read once per
> >>>>> recipe. This solves a problem where if a user was definied in
> >>>>> multiple files, it could generate group definitions for groups
> >>>>> that should not be created. E.g., if the first passwd file read
> >>>>> defines a user as:
> >>>>>
> >>>>> foobar::1234::::
> >>>>>
> >>>>> and the second passwd file defines it as:
> >>>>>
> >>>>> foobar:::nogroup:The foobar user:/:/bin/sh
> >>>>>
> >>>>> then a foobar group would be created even if the user will use
> >>>>> the nogroup as its primary group.
> >>>>
> >>>> One minor thing
> >>>>
> >>>>> @@ -251,7 +269,7 @@ def update_useradd_static_config(d):
> >>>>>
> >>>>>              newparams.append(newparam)
> >>>>>
> >>>>> -        return " ;".join(newparams).strip()
> >>>>> +        return ";".join(newparams).strip()
> >>>>>
> >>>>>      # Load and process the users and groups, rewriting the adduser=
/addgroup params
> >>>>>      useradd_packages =3D d.getVar('USERADD_PACKAGES', True)
> >>>>>
> >>>>
> >>>> The space was required because you could generate a user/group=20
> >>>> add line that ended with a string.  Without the space, you could=20
> >>>> end up merging two sets of arguments causing a failure condition.
> >>>>
> >>>> So I think that it should be retained unless there is a specific
> >>>> reason you believe it should be removed.
> >>>
> >>> I cannot see how that space can make any difference. Each set of
> >>> useradd/grouppadd options added to newparams has the user/group
> >>> name at the end of the string. And if that somehow interferes with
> >>> the semicolon, then the code in useradd.bbclass which simply does
> >>> "cut -d ';'" to split the useradd/groupadd line would break
> >>> already.
> >>
> >> The contents when originally parsed my be run as arguments to a
> >> shell script or as parameters to these functions.
> >>
> >> In the shell script world not have a space can confuse the argument
> >> parsing into thinking the ; is part of the argument.
> >
> > No shell I have heard of (bash, zsh and dash comes to mind) would be
> > affected by the lack of a space before the semicolon. Moreover, this
> > is never actually parsed by a shell (except as part of a variable
> > value). The semicolon is used by useradd.bbclass to split the=20
> > variables, after which it lets the shell evaluate the part before=20
> > the semicolon (which will ignore any trailing whitespace).
>=20
> I've seen broken shells in the past where you would do something like:
>=20
> /bin/echo foo;/bin/echo bar
>=20
> and get:  "/bin echo foo;/bin/echo bar" since it treated the middle
> item as a single command.  I'm not saying it wasn't a bug in the shell=20
> or system -- just that I've been burned by it in the past and because=20
> of this, I try not to rely on it.. (when adding a space solves the issue.=
)

Ok, sounds weird, but I will take your word for it.

> >> You don't have that in the python world with the split behavior.
> >>
> >>> Actually, now that I think about it, I do wonder why
> >>> useradd-staticids.bbclass use this advanced variant to split the
> >>> useradd/groupadd lines:
> >>>
> >>>         for param in re.split('''[ \t]*;[ \t]*(?=3D(?:[^'"]|'[^']*'|"=
[^"]*")*$)''', params):
> >>
> >> It is perfectly legal to allow a ';' in the middle of a parameter
> >> (that allows it), a parameter that is quoted.
> >
> > Sure, and the code above handles some cases, but definitely not all.
> > E.g., this would not be parsed as intended by useradd-
> > staticids.bbclass:
> >
> > USERADD_PARAMS_${PN} +=3D "-c Comment\ with\ an\ \'\ in\ it oddcomment;=
 \
> >                          -c Other\ odd \'\ comment otheruser"
> >
> > but it would be handled correctly by useradd.bbclass...
>=20
> In this case, we need to emulate a reasonable set of argument
> processing.  If there is something built into bitbake/oe then we can=20
> use it.  The re.split though was a good approximation of the common=20
> configurations I was seeing at the time.  (Specifically quotes=20
> parameters for spaces and ;)

Normally I would suggest shlex.split(). It is already used by both=20
BitBake and OE-Core. Unfortunately, it cannot be used in this case=20
as it cannot distinguish between an escaped/quoted semicolon and=20
one that is not escaped/quoted. This is because it is designed to=20
split one command line, not multiple lines.

So the split of multiple commands would probably still have to be=20
done using a regular expression, extended to support escaping.

shlex.split() can be used for the second split though (where the=20
command is fed to the parser).

We would also need the opposite to construct a command line with=20
all options properly quoted. Unfortunately, shlex.quote() was not=20
added until Python 3.3. However, there is an unofficial pipes.quote()=20
that is already used by OE-Core, so I assume it is ok to use.

> >> Something like:
> >>
> >> adduser -c "This user;that user;all users" -d /home/allusers alluser
> >>
> >> it's odd, but I've certainly seen people put ';' in the comment
> >> before.. and it is legal in other palces, like the home dir and
> >> such -- just not advised.
> >
> > It may be legal, but it has never been supported by the
> > adduser.bbclass. And thus it has never worked in practice to take an=20
> > existing passwd file that contains a semicolon in the comment field=20
> > and expect it to work as input to adduser-staticids.bbclass.
>=20
> Then that is a bug we should fix.  At one time this was working
> (perhaps not in OE, but locally?)   Since I did have a customer who=20
> had both spaces and ';' in their comment field.  (This is how I=20
> originally found the problem and needed to figure out a regex that=20
> worked in more cases.)
>=20
> > Moreover, neither adduser.bbclass nor adduser-staticids.bbclass will
> > handle a semicolon correctly in any other field. And let's not get
> > started on other special characters like ", \, $ and > which could
> > wreak havoc on both classes in a correctly crafted passwd file.
>=20
> I realize there are may corner cases here.  We need to try to support
> the reasonable ones and prevent the others.  If that list should be=20
> avoided in certain cases -- then we should enhance the system catch=20
> things "not to do". But using ';' in the comment is fairly common in=20
> some environments.
>=20
> >>> when this would do the job just as well:
> >>>
> >>>         for param in params.split(';'):
> >>>
> >>> given that that is what useradd.bbclass does. It looks as if tries
> >>> to support something like --comment "something with a ; in it", but
> >>> using that would break in useradd.bbclass anyway...
> >>
> >> Then the useradd class is broken in this case.  The --comment
> >> processing needs to work, it's just rarely used in the normal
> >> case, but very much used in the "lets take a previously generated
> >> passwd file and reuse it" case of the adduser-static.
> >>
> >>> //Peter
> >
> > So, from reading the code in both adduser.bbclass and
> > adduser-staticids.bbclass, having spaces or no spaces before the
> > semicolon in the USERADD_PARAM_${PN} variable cannot make any
> > difference to how the users are created in the end. Thus it should
> > be safe to remove them.
>=20
> The (initial) generated adduser/addgroup/etc command is dumped into the
> pre/post install script section of the packages.  So when the package=20
> manager runs it needs to execute the shell script.  This is where I've=20
> seen the problem of the ';' in the past...
>=20
> Adduser and adduser-static should be synced to use the same delimitation=
=20
> mechanism.  And for things like a ; in the comment, both should equally
> support it.  We've got a mismatch and that is definitely a bug.

I agree that the correct thing to do is to make them support the same=20
mechanism. However, this would require quite some more work, especially=20
with the useradd.bbclass, and as it does not affect the changes in my=20
patches, do you think the patches can be accepted as they are, and we=20
can work on improving the parsing afterwards?

> --Mark
>=20
> > //Peter

//Peter


