Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 1C4386110D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 11:53:17 +0000 (UTC)
Received: from e6520eb (unknown [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id CD110A62A1;
	Mon, 23 Sep 2013 13:53:13 +0200 (CEST)
Date: Mon, 23 Sep 2013 13:53:12 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130923135312.3b7f5089@e6520eb>
In-Reply-To: <1379935457.18603.215.camel@ted>
References: <1379923619-27142-1-git-send-email-eric@eukrea.com>
	<1379935457.18603.215.camel@ted>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.19; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH/RFC] autotools: handle dependency on intltool-native
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
X-List-Received-Date: Mon, 23 Sep 2013 11:53:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Mon, 23 Sep 2013 12:24:17 +0100,
Richard Purdie <richard.purdie@linuxfoundation.org> a =E9crit :

> On Mon, 2013-09-23 at 10:06 +0200, Eric B=E9nard wrote:
> > autotools' class can use intltoolize but has no dependency on it
> > which can leads to :
> > /test/setup-scripts/build/tmp-defaultsetup-eglibc-eglibc/work/cortexa9h=
f-vfp-neon-oe-linux-gnueabi/gnokii/0.6.31-r0/temp/run.do_configure.7559: li=
ne 179: intltoolize: command not found
> >=20
> > This patch fix this problem by adding the dependency on
> > intltool-native which can be tricky as it triggers
> > circular dependencies very easily.
> >=20
> > Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> > ---
> >  meta/classes/autotools.bbclass | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bb=
class
> > index 883eb06..eb988cb 100644
> > --- a/meta/classes/autotools.bbclass
> > +++ b/meta/classes/autotools.bbclass
> > @@ -16,6 +16,7 @@ def autotools_dep_prepend(d):
> >                          and not bb.data.inherits_class('cross', d) \
> >                          and not d.getVar('INHIBIT_DEFAULT_DEPS', True):
> >              deps +=3D 'libtool-cross '
> > +            deps +=3D 'intltool-native '
> > =20
> >      return deps + 'gnu-config-native '
>=20
> Its expected that recipes using that add to DEPENDS. Please lets not add
> in the dependency for everyone since it isn't actually used in that many
> places. Its small details like this which end up causing significant
> performance issues :/.
>=20
OK agreed. Would you accept a patch to add this in comment in
autotools.bbclass so that this gets documented somewhere ?

Eric

