Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD86731CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 17:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A2675180F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 18:36:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 81vJvHbpGfHl
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 18:36:44 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id DC353180E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 18:36:44 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id C285E1567
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 18:36:44 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id B615E771
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 18:36:44 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id B397034273
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 18:36:44 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Wed, 13 Jan 2016 18:36:44 +0100
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Wed, 13 Jan 2016 18:36:44 +0100
Received: from XBOX02.axis.com ([fe80::bcea:88d5:e1ff:8e04]) by
	XBOX02.axis.com ([fe80::bcea:88d5:e1ff:8e04%12]) with mapi id
	15.00.1104.000; Wed, 13 Jan 2016 18:36:44 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Peter Kjellerstedt <pkj@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCHv2 0/6] Improvements for
	useradd-staticids.bbclass
Thread-Index: AQHROe97ZippQcQWx0eM3AMH6ubXCJ753faA
Date: Wed, 13 Jan 2016 17:36:44 +0000
Message-ID: <c48e4f2e40bc41899eb2ef2d8388cd17@XBOX02.axis.com>
References: <cover.1450482563.git.pkj@axis.com>
In-Reply-To: <cover.1450482563.git.pkj@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.55]
MIME-Version: 1.0
Subject: Re: [PATCHv2 0/6] Improvements for useradd-staticids.bbclass
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
X-List-Received-Date: Wed, 13 Jan 2016 17:36:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

*ping*

//Peter

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Peter Kjellerstedt
> Sent: den 19 december 2015 00:54
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCHv2 0/6] Improvements for useradd-
> staticids.bbclass
>=20
> It is now 1.5 months since I originally supplied these patches. The
> only comment I received was about a couple of unnecessary spaces that
> I had removed. After explaining why removing them should not make any
> change to the implementation (more than a month ago), I have not
> received any response at all even after pushing for it on the list (a
> month ago) and in private (two weeks ago).
>=20
> Since I am now fed up with waithing for any response, I have taken the
> time to split out the removal of those three spaces into a separate
> patch in the vain hope that this will make the patches suitable to be
> applied...
>=20
> Now I will go on vacation till the beginning of the next year, hoping
> that the patches have been applied when I get back. So until then,
> Merry Christmas and a Happy New Year!
>=20
> Original patch set description below.
>=20
> This series of patches aims to improve useradd-staticids.bbclass.
>=20
> We are currently using useradd-staticids.bbclass to make sure all
> users and groups have well defined IDs. So far we have had the
> definitions of the users both in the recipes and in the passwd file
> used by useradd-staticids.bbclass. Since we have a huge number of
> recipes that create users, having to duplicate the definitions all
> over the place has turned out to be a burden we should be able to
> avoid.
>=20
> So the current plan for us is to have one passwd file per layer with
> the definitions of all users that layer needs. These definitions do
> not include the static IDs for the users. Instead the static IDs for
> the users are specified in a distro specific passwd-static file. There
> is also a distro specific group-static file for the group IDs. With
> that in place it should be enough to define a user as:
>=20
> USERADD_PARAM_${PN} =3D "--system foobar"
>=20
> in a recipe and let useradd-staticids.bbclass handle the specifics for
> how that user should be defined.
>=20
> The above worked fine for all users that had a primary group with the
> same name as the user. However, it turned out that for users that
> wanted some other primary group, specifying it in the passwd file was
> not enough. We still had to add --gid <some group> in the recipe where
> <some group> had to match what was specified in the passwd file. This
> was less than optimal, and somewhat defeated the setup.
>=20
> It also turned out that for users with a primary group that does not
> match the user name, useradd-staticids.bbclass would still add the
> creation of a group with the same name as the user (when it parsed the
> passwd-static file) and the add another creation of the correct group
> (when it parsed the passwd file).
>=20
> So after spending quite a lot of time on trying to decode how
> rewrite_useradd() calculated the --gid option, I came up with this
> series of changes that should correct the problems described above and
> make the code easier to understand while (hopefully) maintaining
> compatibility with the old code.
>=20
> //Peter
>=20
> The following changes since commit
> 5f406915b5e26761faa4ea5e0edd887ac5ae6e2f:
>=20
>   bitbake: toaster: remove 2 confusing parameters (2015-12-18 13:51:54
> +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib pkj/useradd_improvements
>   http://git.yoctoproject.org/cgit.cgi/poky-
> contrib/log/?h=3Dpkj/useradd_improvements
>=20
> Peter Kjellerstedt (6):
>   useradd-staticids.bbclass: Treat mutually exclusive options as such
>   useradd-staticids.bbclass: Make --no-user-group have effect
>   useradd-staticids.bbclass: Simplify some logic
>   useradd-staticids.bbclass: Simplify the logic for when to add groups
>   useradd-staticids.bbclass: Read passwd/group files before parsing
>   useradd-staticids.bbclass: Remove unnecessary spaces
>=20
>  meta/classes/useradd-staticids.bbclass | 192 ++++++++++++++++++-------
> --------
>  1 file changed, 103 insertions(+), 89 deletions(-)
>=20
> --
> 2.1.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

