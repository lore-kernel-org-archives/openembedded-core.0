Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 98CE160DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 06:57:48 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Jul 2014 23:57:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,747,1400050800"; d="scan'208";a="462158285"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2014 23:57:48 -0700
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.54]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.104]) with mapi id
	14.03.0123.003; Mon, 28 Jul 2014 07:56:44 +0100
From: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2] oeqa/runtime: Added skipModule import
	for	test modules that use it.
Thread-Index: AQHPpz0kL3BOwfbICki+BUc9ler5A5uw6FMAgAQrIRA=
Date: Mon, 28 Jul 2014 06:56:43 +0000
Message-ID: <33115ABC4887814E8A92A08FBC93416B23C0EDDA@IRSMSX103.ger.corp.intel.com>
References: <1406205685-7685-1-git-send-email-georgex.l.musat@intel.com>
	<1406205685-7685-2-git-send-email-georgex.l.musat@intel.com>
	<1962350.z6r6hkHnKy@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1962350.z6r6hkHnKy@peggleto-mobl5.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] oeqa/runtime: Added skipModule import for	test modules that use it.
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
X-List-Received-Date: Mon, 28 Jul 2014 06:58:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, thank you! This slipped through our fingers.

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Paul Eggleton
> Sent: Friday, July 25, 2014 7:16 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 2/2] oeqa/runtime: Added skipModule import
> for test modules that use it.
>=20
> On Thursday 24 July 2014 15:41:25 Lucian Musat wrote:
> > The modules that use skipModule should import it themselves and not
> > rely on somebody else to import it.
> >
> > Signed-off-by: Lucian Musat <georgex.l.musat@intel.com>
> > ---
> >  meta/lib/oeqa/runtime/buildcvs.py      | 2 +-
> >  meta/lib/oeqa/runtime/buildiptables.py | 2 +-
> >  meta/lib/oeqa/runtime/buildsudoku.py   | 2 +-
> >  meta/lib/oeqa/runtime/ldd.py           | 2 +-
> >  meta/lib/oeqa/runtime/pam.py           | 8 ++++----
> >  meta/lib/oeqa/runtime/skeletoninit.py  | 2 +-
> >  meta/lib/oeqa/runtime/smart.py         | 2 +-
> >  meta/lib/oeqa/runtime/vnc.py           | 2 +-
> >  8 files changed, 11 insertions(+), 11 deletions(-)
> >
> > diff --git a/meta/lib/oeqa/runtime/buildcvs.py
> > b/meta/lib/oeqa/runtime/buildcvs.py index f1fbf19..6201ed1 100644
> > --- a/meta/lib/oeqa/runtime/buildcvs.py
> > +++ b/meta/lib/oeqa/runtime/buildcvs.py
> > @@ -1,4 +1,4 @@
> > -from oeqa.oetest import oeRuntimeTest
> > +from oeqa.oetest import oeRuntimeTest, skipModule
> >  from oeqa.utils.decorators import *
> >  from oeqa.utils.targetbuild import TargetBuildProject
> >
> > diff --git a/meta/lib/oeqa/runtime/buildiptables.py
> > b/meta/lib/oeqa/runtime/buildiptables.py index f6061a7..c77b114 100644
> > --- a/meta/lib/oeqa/runtime/buildiptables.py
> > +++ b/meta/lib/oeqa/runtime/buildiptables.py
> > @@ -1,4 +1,4 @@
> > -from oeqa.oetest import oeRuntimeTest
> > +from oeqa.oetest import oeRuntimeTest, skipModule
> >  from oeqa.utils.decorators import *
> >  from oeqa.utils.targetbuild import TargetBuildProject
> >
> > diff --git a/meta/lib/oeqa/runtime/buildsudoku.py
> > b/meta/lib/oeqa/runtime/buildsudoku.py index a754f1d..f51af92 100644
> > --- a/meta/lib/oeqa/runtime/buildsudoku.py
> > +++ b/meta/lib/oeqa/runtime/buildsudoku.py
> > @@ -1,4 +1,4 @@
> > -from oeqa.oetest import oeRuntimeTest
> > +from oeqa.oetest import oeRuntimeTest, skipModule
> >  from oeqa.utils.decorators import *
> >  from oeqa.utils.targetbuild import TargetBuildProject
> >
> > diff --git a/meta/lib/oeqa/runtime/ldd.py
> > b/meta/lib/oeqa/runtime/ldd.py index 4374530..079130f 100644
> > --- a/meta/lib/oeqa/runtime/ldd.py
> > +++ b/meta/lib/oeqa/runtime/ldd.py
> > @@ -1,5 +1,5 @@
> >  import unittest
> > -from oeqa.oetest import oeRuntimeTest
> > +from oeqa.oetest import oeRuntimeTest, skipModule
> >  from oeqa.utils.decorators import *
> >
> >  def setUpModule():
> > diff --git a/meta/lib/oeqa/runtime/pam.py
> > b/meta/lib/oeqa/runtime/pam.py index cc5c1bd..c26e6ea 100644
> > --- a/meta/lib/oeqa/runtime/pam.py
> > +++ b/meta/lib/oeqa/runtime/pam.py
> > @@ -2,7 +2,7 @@
> >  # Note that the image under test must have "pam" in DISTRO_FEATURES
> >
> >  import unittest
> > -from oeqa.oetest import oeRuntimeTest
> > +from oeqa.oetest import oeRuntimeTest, skipModule
> >  from oeqa.utils.decorators import *
> >
> >  def setUpModule():
> > @@ -17,8 +17,8 @@ class PamBasicTest(oeRuntimeTest):
> >          (status, output) =3D self.target.run('login --help')
> >          self.assertEqual(status, 1, msg =3D "login command does not
> > work as expected. Status and output:%s and %s" %(status, output))
> > (status, output) =3D self.target.run('passwd --help')
> > -        self.assertEqual(status, 0, msg =3D "passwd command does not w=
ork as
> > expected. Status and output:%s and %s" %(status, output)) +
> > self.assertEqual(status, 6, msg =3D "passwd command does not work as
> > expected. Status and output:%s and %s" %(status, output)) (status,
> > output) =3D self.target.run('su --help')
> > -        self.assertEqual(status, 0, msg =3D "su command does not work =
as
> > expected. Status and output:%s and %s" %(status, output)) +
> > self.assertEqual(status, 2, msg =3D "su command does not work as expect=
ed.
> > Status and output:%s and %s" %(status, output)) (status, output) =3D
> > self.target.run('useradd --help')
> > -        self.assertEqual(status, 0, msg =3D "useradd command does not =
work as
> > expected. Status and output:%s and %s" %(status, output)) +
> > self.assertEqual(status, 2, msg =3D "useradd command does not work as
> > expected. Status and output:%s and %s" %(status, output))
>=20
> Stefan pointed out to me that this contains a seemingly unintentional rev=
ert
> of the following earlier change:
>=20
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/lib/oeqa/runti
> me/pam.py?id=3D14735be703de1b1e173d444b51df7aad902428d5
>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

