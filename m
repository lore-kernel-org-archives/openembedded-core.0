Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBMSM-0000hP-OP
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 10:40:49 +0100
Received: by mail-pb0-f41.google.com with SMTP id um15so1649251pbc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 01:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=2PpR2lUjLeJZks9cB1z1qqfATZPjBRUsDWK27aREl2w=;
	b=gfW3YKKewhrz+Z3cYBLYmLXNzLZFW82qBuLV/HinP77bZHoNhxS13lHO/mnXjeDaWV
	QPyMIZnCdbixa3UhO+iSXI4TG/ELLlRppl8u05fWQY5vrkO2bOVfC3/L3w/8vumYfeWf
	L7PLDkGihWnYcxHh1nN2ne+Qbtm8xtxwQOHO9IPF4rYrYoLrVY2JQDnxNm1cK+NopN8+
	BZkcEHK1qCgGdxvUItlSbOaJrpYjteoQJVlEn/efib+/sJ91A60gfAIUi8ZWd8hAgJEc
	D74/afTuRXOfsu2k72eBrZPBGafue2wYlNPW50rrkHpNMEFMlp1Wanr7vtwUSe83NUZ7
	zb6A==
X-Received: by 10.68.196.193 with SMTP id io1mr13474148pbc.196.1362129862924; 
	Fri, 01 Mar 2013 01:24:22 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ax3sm11448331pbd.42.2013.03.01.01.24.18
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Mar 2013 01:24:21 -0800 (PST)
Date: Fri, 1 Mar 2013 10:24:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130301092414.GH3279@jama>
References: <1361987211-19783-1-git-send-email-Martin.Jansa@gmail.com>
	<CAMKF1so35E3SmehBRmPQkJqBfhZuFg7z7XLBD4Sb6w2L1LHW=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so35E3SmehBRmPQkJqBfhZuFg7z7XLBD4Sb6w2L1LHW=w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd.bbclass: fix bb.error
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
X-List-Received-Date: Fri, 01 Mar 2013 09:40:50 -0000
X-List-Received-Date: Fri, 01 Mar 2013 09:40:50 -0000
X-Groupsio-MsgNum: 36068
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VkVuOCYP9O7H3CXI"
Content-Disposition: inline

--VkVuOCYP9O7H3CXI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 27, 2013 at 01:47:00PM -0800, Khem Raj wrote:
> On Wed, Feb 27, 2013 at 9:46 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > NOTE: recipe avahi-ui-0.6.31-r7.0: task do_package: Started
> > ERROR: %s does not appear in package list, please add it avahi-ui-daemon
> > ERROR: %s does not appear in package list, please add it avahi-ui-dnsco=
nfd
> >
>=20
> IIRC there already is a patch floating around on ml which fixes it.

I was thinking the same, but then I wasn't able to find it in my ML
archive, so I created this one (expecting that what I've seen on ML
before was something else).

FWIW: neither fix was included in "[CONSOLIDATED PULL 00/40] Post-ELC
Patches and Updates" so Saul probably haven't seen it too.

> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/systemd.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> > index 00865ed..564cd72 100644
> > --- a/meta/classes/systemd.bbclass
> > +++ b/meta/classes/systemd.bbclass
> > @@ -53,7 +53,7 @@ python systemd_populate_packages() {
> >      def systemd_check_package(pkg_systemd):
> >          packages =3D d.getVar('PACKAGES', True)
> >          if not pkg_systemd in packages.split():
> > -            bb.error('%s does not appear in package list, please add i=
t', " " + pkg_systemd)
> > +            bb.error('%s does not appear in package list, please add i=
t' % pkg_systemd)
> >
> >
> >      # Add a runtime dependency on systemd to pkg
> > --
> > 1.8.1.4
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VkVuOCYP9O7H3CXI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEwc74ACgkQN1Ujt2V2gByvTgCgpqAOxcuD0UDRvxmSYC9I7c0z
QpUAnA1+TbU9mH2W/cPJNR3cIfjw6nQH
=vYQl
-----END PGP SIGNATURE-----

--VkVuOCYP9O7H3CXI--
