Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rpkbl-0000cH-9a for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 18:56:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0OHmqBC031333
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 17:48:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30631-10 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 17:48:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0OHmh98031327
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 17:48:44 GMT
Message-ID: <1327427324.19643.119.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jan 2012 17:48:44 +0000
In-Reply-To: <CALbNGRRf7qoHY58maY=UxN4+ezuvuAKfv0jgjohC7nCvNyowSQ@mail.gmail.com>
References: <20120124122907.DB5D710332@opal>
	<CALbNGRSdeB2GR0m=Jc_5qOpJBsU5Dbw_JwVb52gHr_wz9r74ug@mail.gmail.com>
	<CALbNGRQuiOEWTZ5P5K-fHUYWBB61MVwkDnivCjZ9YzVaybnp8w@mail.gmail.com>
	<CALbNGRRf7qoHY58maY=UxN4+ezuvuAKfv0jgjohC7nCvNyowSQ@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q0OHmqBC031333
Subject: Re: [oe-commits] Richard Purdie : gcc-common.inc: Ensure WORKDIR doesn' t adversly affect sstate checksums
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
X-List-Received-Date: Tue, 24 Jan 2012 17:56:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-01-24 at 15:10 +0100, Andreas M=C3=BCller wrote:
> On Tue, Jan 24, 2012 at 1:29 PM, <git@git.openembedded.org> wrote:
> >
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 0de85d2ca3bc9674323302a35995dfddb6044a71
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dco=
mmit;h=3D0de85d2ca3bc9674323302a35995dfddb6044a71
> >
> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Date:   Tue Jan 24 12:14:19 2012 +0000
> >
> > gcc-common.inc: Ensure WORKDIR doesn't adversly affect sstate checksu=
ms
> >
> > Changes in WORKDIR were changing the do_patch stamps between gcc-cros=
ssdk
> > and gcc-cross. This excludes the variable since in this case, we don'=
t
> > need want those changes to affect the signatures.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > ---
> >
> >  meta/recipes-devtools/gcc/gcc-common.inc |    4 ++++
> >  1 files changed, 4 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-=
devtools/gcc/gcc-common.inc
> > index ed41b0f..5ba68a0 100644
> > --- a/meta/recipes-devtools/gcc/gcc-common.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> > @@ -105,3 +105,7 @@ do_headerfix () {
> >  addtask headerfix after do_unpack before do_patch
> >
> >  do_headerfix[vardepvalue] =3D "PATH"
> > +
> > +# We need to ensure that for the shared work directory, the do_patch=
 singatures match
> > +The real WORKDIR location isn't a dependency for the shared workdir.
> Oops^^
> > +src_patches[vardepsexclude] =3D "WORKDIR"

Sorry about this, I pushed a fix earlier on.

Cheers,

Richard



