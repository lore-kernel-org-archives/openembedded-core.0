Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1SXs2p-0002qC-A9
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 12:46:55 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q4PAaf7a024678; Fri, 25 May 2012 11:36:41 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uWpcrNNzSVvY; Fri, 25 May 2012 11:36:41 +0100 (BST)
Received: from ted (ted.config [192.168.1.66]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.2/Debian-2build1) with ESMTP id
	q4PAacXY024674
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT);
	Fri, 25 May 2012 11:36:39 +0100
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <rpurdie@rpsys.net>)
	id 1SXrrX-0007Va-Mj; Fri, 25 May 2012 11:35:15 +0100
Message-ID: <1337942114.20169.26.camel@ted>
From: Richard Purdie <rpurdie@rpsys.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 25 May 2012 11:35:14 +0100
In-Reply-To: <20120517073833.GB3164@jama.jama.net>
References: <1337238883-7920-1-git-send-email-radu.moisan@intel.com>
	<20120517073833.GB3164@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] man-pages: Update to 3.41
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
X-List-Received-Date: Fri, 25 May 2012 10:46:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-17 at 09:38 +0200, Martin Jansa wrote:
> On Thu, May 17, 2012 at 10:14:43AM +0300, Radu Moisan wrote:
> > ---
> >  .../{man-pages_3.36.bb =3D> man-pages_3.41.bb}       |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-extended/man-pages/{man-pages_3.36.bb =3D> man-pag=
es_3.41.bb} (80%)
> >=20
> > diff --git a/meta/recipes-extended/man-pages/man-pages_3.36.bb b/meta/r=
ecipes-extended/man-pages/man-pages_3.41.bb
> > similarity index 80%
> > rename from meta/recipes-extended/man-pages/man-pages_3.36.bb
> > rename to meta/recipes-extended/man-pages/man-pages_3.41.bb
> > index 6025a87..cc1c224 100644
> > --- a/meta/recipes-extended/man-pages/man-pages_3.36.bb
> > +++ b/meta/recipes-extended/man-pages/man-pages_3.41.bb
> > @@ -8,8 +8,8 @@ PR =3D "r1"
> >  LIC_FILES_CHKSUM =3D "file://README;md5=3D0422377a748010b2b738342e24f1=
41c1"
> >  SRC_URI =3D "${KERNELORG_MIRROR}/linux/docs/man-pages/Archive/${BPN}-$=
{PV}.tar.gz"
>=20
> ^ this could be simplified to
> "${KERNELORG_MIRROR}/linux/docs/${PN}/Archive/${BP}.tar.gz"

This needs to be:

"${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"

Cheers,

Richard


