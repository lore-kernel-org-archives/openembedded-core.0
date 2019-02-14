Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4C56B600E3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 03:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id DEC4D1853A;
	Thu, 14 Feb 2019 04:43:05 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id OB-2uwAS9nxd; Thu, 14 Feb 2019 04:43:04 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 89DF5184EF;
	Thu, 14 Feb 2019 04:43:04 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4AC781E07C;
	Thu, 14 Feb 2019 04:43:04 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DF141E07B;
	Thu, 14 Feb 2019 04:43:04 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 14 Feb 2019 04:43:04 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 315622E81;
	Thu, 14 Feb 2019 04:43:04 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 14 Feb 2019 04:43:03 +0100
Received: from XBOX04.axis.com (10.0.5.18) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 14 Feb 2019 04:43:03 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Thu, 14 Feb 2019 04:43:03 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] base.bbclass: Check BuildStarted for
	HOSTTOOLS
Thread-Index: AQHUxA6sahyIlajtWE6QG2C6G5HCT6Xel2eA///4pgCAABKQIA==
Date: Thu, 14 Feb 2019 03:43:03 +0000
Message-ID: <6144b418cab34c7189db037e0aa97a8c@XBOX04.axis.com>
References: <cover.1550113052.git.liezhi.yang@windriver.com>
	<b897d0a2643af36791269bf303b0d0dd74a47411.1550113052.git.liezhi.yang@windriver.com>
	<02b5abb67627419e92bce1ce29d22510@XBOX04.axis.com>
	<5323c75d-5a4a-42e0-af0d-f309d23ef15e@windriver.com>
In-Reply-To: <5323c75d-5a4a-42e0-af0d-f309d23ef15e@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/1] base.bbclass: Check BuildStarted for HOSTTOOLS
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
X-List-Received-Date: Thu, 14 Feb 2019 03:43:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Robert Yang
> Sent: den 14 februari 2019 04:22
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/1] base.bbclass: Check BuildStarted for
> HOSTTOOLS
>=20
> On 2/14/19 11:05 AM, Peter Kjellerstedt wrote:
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> <openembedded-
> >> core-bounces@lists.openembedded.org> On Behalf Of Robert Yang
> >> Sent: den 14 februari 2019 03:59
> >> To: openembedded-core@lists.openembedded.org
> >> Subject: [OE-core] [PATCH 1/1] base.bbclass: Check BuildStarted for
> >> HOSTTOOLS
> >>
> >> There might be no bb.event.ConfigParsed event bitbake server is
> >> running,
> >> so check bb.event.BuildStarted to make sure HOSTTOOLS_DIR existed
> when
> >> BuildStarted.
> >>
> >> Fixed:
> >> $ export BB_SERVER_TIMEOUT=3D-1
> >> $ bitbake quilt-native
> >> $ rm -fr tmp
> >> $ bitbake quilt-native
> >> ERROR: Error running gcc  --version: /bin/sh: gcc: command not found
> >>
> >> This error is caused by enable_uninative(), it runs twice
> (ConfigParsed
> >> and
> >> BuildStarted), the error would happen when there is no ConfigParsed
> >> event
> >> (no hosttools is created), but BuildStarted. This patch can fix the
> >> problem.
> >>
> >> [YOCTO #13022]
> >>
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> ---
> >>   meta/classes/base.bbclass | 6 +++++-
> >>   1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> >> index f1a3c0e..283cb0f 100644
> >> --- a/meta/classes/base.bbclass
> >> +++ b/meta/classes/base.bbclass
> >> @@ -224,7 +224,11 @@ base_eventhandler[eventmask] =3D
> >> "bb.event.ConfigParsed bb.event.MultiConfigParsed
> >>   python base_eventhandler() {
> >>       import bb.runqueue
> >>
> >> -    if isinstance(e, bb.event.ConfigParsed):
> >> +    # There might be no bb.event.ConfigParsed event bitbake server
> is running,
> >> +    # so check bb.event.BuildStarted to make sure HOSTTOOLS_DIR
> existed when
> >> +    # BuildStarted.
> >> +    if isinstance(e, bb.event.ConfigParsed) or \
> >> +            (isinstance(e, bb.event.BuildStarted) and not
> os.path.exists(d.getVar('HOSTTOOLS_DIR'))):
> >
> > I don't think you want to do this here since not all of this if
> statement
>=20
> That can make the code simple and avoid duplicated, the only code which
> may run twice is "d.setVar('BB_VERSION', bb.__version__)", I don't
> think it's a problem since it is very light.

Well, true, but I still don't think you should mix them. Have one case=20
for what only needs to be done for bb.event.ConfigParsed, one for only=20
bb.event.BuildStarted and one for either.

> > should be done for the BuildStarted event. I think it is better to
> add a
> > separate if statement just for the HOSTTOOLS part (see below). Also,
> I don't
> > think you should be checking if the HOSTTOOLS_DIR exists, because the
> > contents of ${HOSTTOOLS} and ${HOSTTOOLS_NONFATAL} may have changed,
> in
> > which case any new tools need to be added to the directory.
>=20
> You don't have to worry about this since bitbake server can handle it
> when HOSTTOOLS are changed in conf files, you can try this:
>=20
> $ export BB_SERVER_TIMEOUT=3D-1
> $ bitbake quilt-native
>=20
> Add HOSTTOOLS +=3D "passwd" to conf/local.conf, and:
>=20
> $ bitbake quilt-native
> $ ls tmp/hosttools/ | grep passwd
> passwd
>=20
> The passwd will be created.
>=20
> >
> >>           if not d.getVar("NATIVELSBSTRING", False):
> >>               d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
> >>           d.setVar('BB_VERSION', bb.__version__)
> >> --
> >> 2.7.4
> >
> > This is my suggestion for how to split the current handling of
> > bb.event.ConfigParsed (also note that I corrected the comment before
> > the new if statement):
> >
> >      if isinstance(e, bb.event.ConfigParsed):
> >          if not d.getVar("NATIVELSBSTRING", False):
> >              d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
> >          d.setVar('BB_VERSION', bb.__version__)
> >
> >      # There might be no bb.event.ConfigParsed event if the bitbake ser=
ver is
>=20
> Thanks for the correction.
>=20
> >      # running, so check bb.event.BuildStarted too to make sure ${HOSTT=
OOLS_DIR}
> >      # exists.
> >      if isinstance(e, bb.event.ConfigParsed) or isinstance(e, bb.event.=
BuildStarted):
>=20
> I'm afraid that it doesn't work since it would make hosttools generate
> twice when bitbake sever is not running, which seems not a good idea.

I don't think that's a problem in practice since the generation of=20
${HOSTTOLS_DIR} should be pretty fast if it is already populated, but I=20
guess you could use your original if statement to avoid that:

    if isinstance(e, bb.event.ConfigParsed) or \
            (isinstance(e, bb.event.BuildStarted) and not os.path.exists(d.=
getVar('HOSTTOOLS_DIR'))):

> // Robert
>=20
> >          # Works with the line in layer.conf which changes PATH to poin=
t here
> >          setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS', d)
> >          setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS_NONF=
ATAL', d, fatal=3DFalse)
> >
> > //Peter
> >
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

