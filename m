Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SpKia-0007uP-1E
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 16:50:12 +0200
Received: by weyr6 with SMTP id r6so1501926wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 07:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=L7FKFpSp9whCqMkdWIjFydK9iYj+3o0odXgnF8oEdgg=;
	b=mohZ4CTP4zxUdyreFMeQLrNdOXyur8F2xJOVs6dgO8UKQoOfbj5NPfAkAqEmx0hlVh
	jyPrJebw2U1r3+vG4sENuy6jGAofcI077EqwEndTXDZv9X8tOihqUMo13mitnlQ6ZH82
	iQG3W67e//43p17U8zds19ePTRkPoone48hx9JKdeEfRIqJmZsoUEhYqLKFIsPGNqucy
	zpYu1Z4Q92eA7ADUVC8EgVy8d5Ltl1qILp/PxRbjpAu3M9JPA++3Lci19r1dwy382ZGZ
	aUcf/iZTgMrnZdf/pjstfVrnn+/qsDZrBAUph8uDvcoHLqOMwGBqJDPeB4VlCozUCtbT
	8VlQ==
Received: by 10.217.7.6 with SMTP id z6mr3099118wes.5.1342103938964;
	Thu, 12 Jul 2012 07:38:58 -0700 (PDT)
Received: from [10.47.217.41] ([188.207.89.201])
	by mx.google.com with ESMTPS id b7sm13791139wiz.9.2012.07.12.07.38.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jul 2012 07:38:58 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAK18fxEZ3x8i=42riFOVBqvG+i2Fv4VuRcB35KCcuGP1SKXj0A@mail.gmail.com>
Date: Thu, 12 Jul 2012 16:38:56 +0200
Message-Id: <00AD21D6-CC79-41B2-8B06-D8C743F4380A@dominion.thruhere.net>
References: <1342015854-30040-1-git-send-email-koen@dominion.thruhere.net>
	<4FFDE7B3.8050804@linux.intel.com>
	<CAK18fxGaTeNPMeVq_JUSTmJggPHjmDLta6hun4p3kqoZbF167A@mail.gmail.com>
	<927F0993-6573-459B-820D-0ECFA37787C8@dominion.thruhere.net>
	<CAK18fxEZ3x8i=42riFOVBqvG+i2Fv4VuRcB35KCcuGP1SKXj0A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQnonNuL+u0q7uh0J2I0i85kI/Uw4zH1s0pdkdEC2QZAUJaSy5nfAZn5SwaT3axooY++0L2L
Subject: Re: [PATCH] xz: update to 5.1.2alpha
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2012 14:50:12 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 12 jul. 2012, om 15:42 heeft Andrei Gherzan het volgende geschreven:

> On Thu, Jul 12, 2012 at 3:56 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>=20
> Op 12 jul. 2012, om 14:26 heeft Andrei Gherzan het volgende =
geschreven:
>=20
> > On Wed, Jul 11, 2012 at 11:53 PM, Saul Wold <sgw@linux.intel.com> =
wrote:
> > On 07/11/2012 07:10 AM, Koen Kooi wrote:
> > This contains bugfixes from the 5.0.3 and 5.0.4 releases
> >
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> >   meta/recipes-extended/xz/{xz_5.1.1alpha.bb =3D> xz_5.1.2alpha.bb} =
|    7 ++-----
> >   1 file changed, 2 insertions(+), 5 deletions(-)
> >   rename meta/recipes-extended/xz/{xz_5.1.1alpha.bb =3D> =
xz_5.1.2alpha.bb} (86%)
> >
> > diff --git a/meta/recipes-extended/xz/xz_5.1.1alpha.bb =
b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
> > similarity index 86%
> > rename from meta/recipes-extended/xz/xz_5.1.1alpha.bb
> > rename to meta/recipes-extended/xz/xz_5.1.2alpha.bb
> > index 7fa7177..9d68720 100644
> > --- a/meta/recipes-extended/xz/xz_5.1.1alpha.bb
> > +++ b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
> > @@ -10,11 +10,8 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dc475b6c7dca236740ace4bba553e8e1c \
> >                       =
file://lib/getopt.c;endline=3D23;md5=3D2069b0ee710572c03bb3114e4532cd84 =
"
> >
> >   SRC_URI =3D "http://tukaani.org/xz/xz-${PV}.tar.gz"
> > -
> > -SRC_URI[md5sum] =3D "bb24436fa12780808e1c142980484104"
> > -SRC_URI[sha256sum] =3D =
"54e59a83690a4a0ec88a7d7c3bdef90c6b196c892a93463863c71c24fe87951a"
> > -
> > -PR =3D "r0"
> > +SRC_URI[md5sum] =3D "9bad1e249537ce69b206815cf28ca87b"
> > +SRC_URI[sha256sum] =3D =
"70e792d2a67cfbb8f2dffd0feab6ca6e5a4a618d65070fb44a367629d1ba94e5"
> >
> >   inherit autotools gettext
> >
> >
> >
> > How stable is this alpha release?  We don't generally take up =
re-releases, correct?
> >
> >
> > We already have an alpha release... so another alpha shouldn't be a =
problem, right? .1a it's a good deal as it implements multithreaded =
compression and decompression.
>=20
> After Andrei's patch for image_types.bbclass goes in I have a follow =
up patch to enable xz threads (and disable the -e -9) to give a nice =
speedup for xz images. On my aging core2quad compressing a 4gb image =
goes from ~22 minutes to ~6.5 minutes with -T4. On my 4c/8t i7 I can get =
up to a 6x speedup with -T6 or -T8, hyperthreading does a better job =
than I expected.
>=20
> =20
> I can confirm this. But still, we can hold -e -9 and just add -T4. I =
think people have 700mb ram to spare while compressing.=20

It's 6.5GB of ram when I compress a 4GB image with -e -9 -T6, the -e is =
really, really bad=


