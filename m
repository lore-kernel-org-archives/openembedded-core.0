Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SDVKo-0004fw-SL
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 08:29:19 +0200
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id CA050A6227
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 08:20:12 +0200 (CEST)
Date: Fri, 30 Mar 2012 08:20:11 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120330082011.1c196c65@eb-e6520>
In-Reply-To: <CABcZANkEiOkTzf4qvKkp_WOe-zE1oxwVoX46c0JJyLoH1kiO=A@mail.gmail.com>
References: <1333023749-31830-1-git-send-email-eric@eukrea.com>
	<CABcZANkEiOkTzf4qvKkp_WOe-zE1oxwVoX46c0JJyLoH1kiO=A@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [PATCH] license.bbclass: remove existing license.manifest before appending new data
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
X-List-Received-Date: Fri, 30 Mar 2012 06:29:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Thu, 29 Mar 2012 16:22:06 -0700,
Chris Larson <clarson@kergoth.com> a =E9crit :

> On Thu, Mar 29, 2012 at 5:22 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> > without this fix, we append license each time we build again the same i=
mage,
> > ending with a large not up to date file.
> >
> > Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> > ---
> > =A0meta/classes/license.bbclass | =A0 =A04 ++++
> > =A01 files changed, 4 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> > index 394a6d4..c85233c 100644
> > --- a/meta/classes/license.bbclass
> > +++ b/meta/classes/license.bbclass
> > @@ -79,6 +79,10 @@ license_create_manifest() {
> > =A0 =A0 =A0 =A0# Get list of installed packages
> > =A0 =A0 =A0 =A0list_installed_packages | grep -v "locale" |sort > ${LIC=
ENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest
> > =A0 =A0 =A0 =A0INSTALLED_PKGS=3D`cat ${LICENSE_DIRECTORY}/${IMAGE_NAME}=
/package.manifest`
> > + =A0 =A0 =A0 # remove existing license.manifest file
> > + =A0 =A0 =A0 if [ -f ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manife=
st ]; then
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rm ${LICENSE_DIRECTORY}/${IMAGE_NAME}/lic=
ense.manifest
> > + =A0 =A0 =A0 fi
> > =A0 =A0 =A0 =A0# list of installed packages is broken for deb
>=20
> Probably not a concern in this particular case, but in general you
> should avoid this sort of construct, as it's racy.

ok, what would be the right way to do that to avoid the race problem ?

Eric


--=20
http://eukrea.com/en/news/104-2012


