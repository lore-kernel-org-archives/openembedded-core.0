Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UXx1p-0000p7-JR for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 19:10:49 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r42Gr05x024714; Thu, 2 May 2013 17:54:29 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LGUhqAUOMvMx; Thu,  2 May 2013 17:54:29 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r42GsPqo024752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 2 May 2013 17:54:27 +0100
Message-ID: <1367513549.5379.133.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Thu, 02 May 2013 17:52:29 +0100
In-Reply-To: <51816D8B.2020102@linux.intel.com>
References: <1367325004-7740-1-git-send-email-schnitzeltony@googlemail.com>
	<1367325004-7740-3-git-send-email-schnitzeltony@googlemail.com>
	<51816D8B.2020102@linux.intel.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r42Gr05x024714
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH/v2 3/3] core-image-sato: add udev-extraconf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2013 17:10:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2013-05-01 at 12:31 -0700, Saul Wold wrote:
> On 04/30/2013 05:30 AM, Andreas M=C3=BCller wrote:
> > as discussed in [1-2]
> >
> > [1] http://lists.linuxtogo.org/pipermail/openembedded-core/2013-April=
/039025.html
> > [2] http://lists.linuxtogo.org/pipermail/openembedded-core/2013-April=
/039027.html
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> > ---
> >   meta/recipes-sato/images/core-image-sato.bb |    2 +-
> >   1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recip=
es-sato/images/core-image-sato.bb
> > index e3246d2..76abb17 100644
> > --- a/meta/recipes-sato/images/core-image-sato.bb
> > +++ b/meta/recipes-sato/images/core-image-sato.bb
> > @@ -8,4 +8,4 @@ LICENSE =3D "MIT"
> >
> >   inherit core-image
> >
> > -IMAGE_INSTALL +=3D "packagegroup-core-x11-sato-games"
> > +IMAGE_INSTALL +=3D "packagegroup-core-x11-sato-games udev-extraconf"
> >
>=20
> I believe that we should also have the udev-extraconf added to the=20
> core-image-lsb, I will add a follow-on patch for that.

I'll take changes removing the core dependency however I think one of
the packagegroups ideally needs this addition, not such which one
though.

Cheers,

Richard



