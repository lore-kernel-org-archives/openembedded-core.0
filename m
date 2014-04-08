Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E355865D68
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 08:54:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 08 Apr 2014 01:47:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,816,1389772800"; d="scan'208";a="509108190"
Received: from paulonei-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.244])
	by fmsmga001.fm.intel.com with ESMTP; 08 Apr 2014 01:51:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>,
	Chen Qi <Qi.Chen@windriver.com>
Date: Tue, 08 Apr 2014 09:51:47 +0100
Message-ID: <2245979.Tj1EYu6Ry0@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.8-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <CALbNGRRm0JJ2Eq43V5kS2uHehoMWTFiSSbeBGxWav1XyLhmj_g@mail.gmail.com>
References: <1396362098-14134-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRRm0JJ2Eq43V5kS2uHehoMWTFiSSbeBGxWav1XyLhmj_g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: make x11-base a valid image feature
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
X-List-Received-Date: Tue, 08 Apr 2014 08:54:08 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tuesday 08 April 2014 09:47:23 Andreas M=FCller wrote:
> On Tue, Apr 1, 2014 at 4:21 PM, Andreas M=FCller
>=20
> <schnitzeltony@googlemail.com> wrote:
> > make
> >=20
> > commit 049f89155b1e80875aad6e53b21808b827c06915
> > Author: Chen Qi <Qi.Chen@windriver.com>
> > Date:   Fri Dec 20 10:45:52 2013 +0800
> >=20
> >     image.bbclass: add ability to set systemd default target
> >    =20
> >     Add ability to set the default target for systemd images.
> >    =20
> >     The default target for system is controlled by SYSTEMD_DEFAULT_=
TARGET.
> >     The default value for this variable is derived from checking wh=
ether
> >     IMAGE_FEATURES contains 'x11-base' or not. Each image could ove=
rride
> >     this value in its own recipe. For now, we don't need to do any =
change,
> >     because all images that support graphical environment has 'x11-=
base'
> >     in its IMAGE_FEATURES.
> >    =20
> >     [YOCTO #3816]
> >    =20
> >     Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >     Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >=20
> > work for users wanting graphical target. Fixes
> >=20
> > ERROR: 'x11-base' in IMAGE_FEATURES is not a valid image feature. V=
alid
> > features: dbg-pkgs debug-tweaks dev-pkgs doc doc-pkgs package-manag=
ement
> > ptest-pkgs qtcreator-debug read-only-rootfs splash staticdev-pkgs
> >=20
> > Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> > ---
> >=20
> >  meta/classes/image.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclas=
s
> > index 29309f5..35e8d3b 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -22,7 +22,7 @@ inherit ${TESTIMAGECLASS}
> >=20
> >  # IMAGE_FEATURES may contain any available package group
> >  IMAGE_FEATURES ?=3D ""
> >  IMAGE_FEATURES[type] =3D "list"
> >=20
> > -IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs"
> > +IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs x11=
-base"
> >=20
> >  # rootfs bootstrap install
> >  ROOTFS_BOOTSTRAP_INSTALL =3D "${@base_contains("IMAGE_FEATURES",
> >  "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}">=20=


This is not the right fix. At this time, "x11-base" is not a valid feat=
ure=20
unless you're inheriting the core-image rather than image class. The or=
iginal=20
change is therefore incorrect, unfortunately.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

