Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 35F7B781CD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 17:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 4E1992E5C5;
	Wed,  7 Jun 2017 19:04:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id ZekkbAUNMeTW; Wed,  7 Jun 2017 19:04:05 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 228812E54C;
	Wed,  7 Jun 2017 19:04:05 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 029D51E0BC;
	Wed,  7 Jun 2017 19:04:05 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB1291E0BA;
	Wed,  7 Jun 2017 19:04:04 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed,  7 Jun 2017 19:04:04 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id DEB532AEC;
	Wed,  7 Jun 2017 19:04:04 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 7 Jun 2017 19:04:04 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 7 Jun 2017 19:04:04 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Wed, 7 Jun 2017 19:04:04 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Patrick Ohly <patrick.ohly@intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH v2 01/25] bitbake.conf: support for merged usr
	with DISTRO_FEATURE usrmerge
Thread-Index: AQHS34SKlJ8k5i/o/Ue+SOKrAOzwKqIZVQIAgAA+DIA=
Date: Wed, 7 Jun 2017 17:04:04 +0000
Message-ID: <2ccad72ffc0b44ad9cf94c67325a2658@XBOX02.axis.com>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
	<1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
	<1496836331.6630.213.camel@linuxfoundation.org>
	<1496845904.30163.102.camel@intel.com>
In-Reply-To: <1496845904.30163.102.camel@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 01/25] bitbake.conf: support for merged usr with DISTRO_FEATURE usrmerge
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
X-List-Received-Date: Wed, 07 Jun 2017 17:04:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Patrick Ohly
> Sent: den 7 juni 2017 16:32
> To: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Joshua Lock <joshua.g.lock@intel.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH v2 01/25] bitbake.conf: support for
> merged usr with DISTRO_FEATURE usrmerge
>=20
> On Wed, 2017-06-07 at 12:52 +0100, Richard Purdie wrote:
> > On Wed, 2017-02-22 at 10:26 +0200, Amarnath Valluri wrote:
> > > From: Joshua Lock <joshua.g.lock@intel.com>
> > >
> > > Modify bindir, libdir and sbindir to be exec_prefix/$d, rather than
> > > base_prefix/$d, when the usrmerge DISTRO_FEATURE is enabled.
> > >
> > > Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> > > ---
> > >  meta/conf/bitbake.conf | 12 ++++++++----
> > >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > I was asked to clarify the status of this series. We've taken many of
> > the changes but the core changes to bitbake.conf haven't been merged.
> >
> > Ross/I discussed it and we both feel that the bitbake.conf make the
> > file pretty unreadable. We'd therefore like to see this implemented
> > as a .inc file which gets included when the relevant DISTRO_FEATURE=20
> > is set (or could just be included by the appropriate distro configs).=20
> > This .inc file would then simply override the paths. I believe this=20
> > would be a lot more readable than the current approach which is a=20
> > key concern in the core config.

I actually suggested an alternative change to bitbake.conf in the GitHub=20
review that changes bitbake.conf to take usrmerge into account:

https://github.com/avalluri/openembedded-core/commit/1655a93238902a883052a5=
5d88ae14dd02243530

I will include my suggested solution here since I will refer to it=20
below:

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0f27e92e96..305eaff583 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -17,11 +17,13 @@ export base_prefix =3D ""
 export prefix =3D "/usr"
 export exec_prefix =3D "${prefix}"
=20
+root_prefix =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '${ex=
ec_prefix}', '${base_prefix}', d)}"
+
 # Base paths
-export base_bindir =3D "${base_prefix}/bin"
-export base_sbindir =3D "${base_prefix}/sbin"
-export base_libdir =3D "${base_prefix}/${baselib}"
-export nonarch_base_libdir =3D "${base_prefix}/lib"
+export base_bindir =3D "${root_prefix}/bin"
+export base_sbindir =3D "${root_prefix}/sbin"
+export base_libdir =3D "${root_prefix}/${baselib}"
+export nonarch_base_libdir =3D "${root_prefix}/lib"
=20
 # Architecture independent paths
 export sysconfdir =3D "${base_prefix}/etc"

I think that better maintains the readability of the bitbake.conf file,=20
while making the $root_prefix variable available as it can be useful in=20
its own (e.g., in the systemd recipe).

> > The merge of the rest of this feature is therefore pending on the
> > development of such a patch, or a discussion convincing Ross/I why we
> > shouldn't take that approach for some reason.
>=20
> Such a .inc file would have to be included after the "Include the rest
> of the config files." section, because DISTRO_FEATURES only has its
> final value (?) at that point. One also needs the patch that I
> coincidentally just sent today to the bitbake list which allows
> including such a file only when "usrmerge" is in DISTRO_FEATURES.
>=20
> Would that be okay?
>=20
> One downside is that code using the variables earlier will just see the
> non-usrmerge version, with no indication in "bitbake -e" that the value
> might have been different in the middle of parsing. The if check in the
> proposed patch has the same effect on the actual values, but at least
> it shows up in "bitbake -e". This is not a particularly strong argument
> either way, I just wanted to mention it.

Based on your concerns about when the path variables affected by=20
usrmerge would have what values, maybe my suggested change above=20
should be changed to define root_prefix like this instead:

root_prefix ?=3D "${base_prefix}"

and then we create a usrmerge.inc file with the following contents:

DISTRO_FEATURES_append =3D " usrmerge"

root_prefix =3D "${exec_prefix}"

This file should then be required by a layer.conf file so that=20
root_prefix is set before bitbake.conf is read. That should make sure=20
that there never is any risk of the paths being defined differently=20
based on whether usrmerge has been added to DISTRO_FEATURES yet or not.
And it should be clear in bitbake -e how such a variable got its value.

The only minor drawback I see is that the usrmerge.inc file needs to=20
be required from a layer.conf file rather than just adding usrmerge=20
to DISTRO_FEATURES in ${DISTRO}.conf, but at least I could live with=20
that. One could of course add an appropriate comment before the=20
definition of the root_prefix variable, to clarify its use and maybe=20
even point at the usrmerge.inc file.

> --
> Best Regards, Patrick Ohly
>=20
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.

//Peter


