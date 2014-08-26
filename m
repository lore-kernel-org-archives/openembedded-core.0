Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 148026FCE0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 10:59:08 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id c11so1152915lbj.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 03:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7JGvE5hQbxtwVIYB/e6WfZAMS0OxtzZRGHk1/Lr+SGw=;
	b=I3QzBpMCOeDApmYjisQr5opGHM7eXYbdRcea/FSVxrMn/STbDZwcCpy5zJUVjRU7MG
	+L6bbo4n57zEefu8kXAwMcuRaKRPLMYek9xG8OMIcakBGa1Pi6PardhQwJBXzi/V/90Q
	1/eS6GglrMRr1XrUeirg4EnbT+Nwm/WJhVxNpVhYtFJoPpWQJh6c0SjKFHIbMzyieuhx
	StGaUIavUBXXkIen1K9IQYytu9np9v46ZiH102SXV2Z8uBA9VXzcVXCtyzJA5FoV/WNz
	rvH9H0civp+n8p/CwEEgDDE7LEkxFMYmo7Kc5s38fTuQJv6qUUschBLQGdGEmaszWL4t
	SXNA==
X-Received: by 10.112.205.200 with SMTP id li8mr25388918lbc.70.1409050749119; 
	Tue, 26 Aug 2014 03:59:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e9sm1808830laf.36.2014.08.26.03.59.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Aug 2014 03:59:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 26 Aug 2014 12:59:15 +0200
To: Christopher Larson <kergoth@gmail.com>
Message-ID: <20140826105915.GW20524@jama>
References: <cover.1409007366.git.chris_larson@mentor.com>
	<483e2f9eb1085db0958bb1ef9184814766bbd214.1409007366.git.chris_larson@mentor.com>
	<20140826105149.GV20524@jama>
MIME-Version: 1.0
In-Reply-To: <20140826105149.GV20524@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 1/3] sanity: handle both \n and \\n in mirror vars
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
X-List-Received-Date: Tue, 26 Aug 2014 10:59:12 -0000
X-Groupsio-MsgNum: 56963
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VcZjVMblxkg0/8Ur"
Content-Disposition: inline

--VcZjVMblxkg0/8Ur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2014 at 12:51:49PM +0200, Martin Jansa wrote:
> On Mon, Aug 25, 2014 at 03:57:42PM -0700, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >=20
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> >  meta/classes/sanity.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> > index dbcc26b..7cfc4be 100644
> > --- a/meta/classes/sanity.bbclass
> > +++ b/meta/classes/sanity.bbclass
> > @@ -759,7 +759,7 @@ def check_sanity_everybuild(status, d):
> >          'git://', 'gitsm://', 'hg://', 'osc://', 'p4://', 'svk://', 's=
vn://', \
> >          'bzr://', 'cvs://']
> >      for mir_type in mir_types:
> > -        mirros =3D (d.getVar(mir_type, True) or '').split('\\n')
> > +        mirros =3D (d.getVar(mir_type, True) or '').replace('\\n', '\n=
').split('\n')
>=20
> Would you mind fixing the typo in variable name as well?

Nevermind, it's refactored in 3/3, sorry for noise.

> >          for mir in mirros:
> >              mir_list =3D mir.split()
> >              # Should be two members.
> > --=20
> > 1.8.3.4
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VcZjVMblxkg0/8Ur
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP8aIMACgkQN1Ujt2V2gBwv1gCfbg8ZaW5NU2aq29lcy6rVjpUz
sZ0AoI+0/BJWekpHCZZHWhAHwALL9adj
=0BU1
-----END PGP SIGNATURE-----

--VcZjVMblxkg0/8Ur--
