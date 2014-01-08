Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 55B126D02F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 19:39:06 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id a15so1030477eae.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 11:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3LkpU+Gbl1o+0K5nY1tiksfR27P7gNv4IYSNBstz7Us=;
	b=Q6kKoPwSIGl4eMJLEZnCDc+SFvw6XOBs76p5OLh9N2XSVwxrgkg3daoa+kAlGyvkMP
	GkxQFZYRw/8SA73GYjWmwHrqTusJwiLVAUWaRptTF85zLzXX9yydkrdX8Kx50NPOZFT4
	MVXPaJ4jC8hrdqrng23fqsSqDCqAtNI0EQdNHY6nCsrdjn4s6HfSHgLzuVYNbsC53imI
	liNInPokr7eqty9y4AO0fQgecdTtStgLXFZEKyYmXvARfpZ/57QcByPt0bB2BwT5bAVe
	JT8cZ0APxkyZ+hE+msaoeUSmdQUrhdTARKrWSo3kohXITg6v6wFhw/FO50jlHGl4JAAu
	7J8A==
X-Received: by 10.14.172.69 with SMTP id s45mr6383534eel.9.1389209946945;
	Wed, 08 Jan 2014 11:39:06 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	h3sm192334667eem.15.2014.01.08.11.39.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jan 2014 11:39:05 -0800 (PST)
Date: Wed, 8 Jan 2014 20:39:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Message-ID: <20140108193916.GC3709@jama>
References: <52CC470A.9030302@linaro.org> <1759035.6JVm74GdRW@helios>
	<52CD9CAB.5020501@linaro.org>
MIME-Version: 1.0
In-Reply-To: <52CD9CAB.5020501@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Qt in OE-core
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
X-List-Received-Date: Wed, 08 Jan 2014 19:39:08 -0000
X-Groupsio-MsgNum: 48733
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+wcwqhATTmTB6/2m"
Content-Disposition: inline

--+wcwqhATTmTB6/2m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2014 at 01:44:59PM -0500, Trevor Woerner wrote:
> On 01/08/14 10:56, Paul Eggleton wrote:
> > However, one concern I have always had with Qt being moved out of
> > OE-Core though is that I very much doubt the same will happen with
> > GTK+ and GNOME UI components that we carry, which I think will lead to
> > the (perhaps erroneous, but logical) assumption in new users' minds
> > that we support or recommend these more than we do Qt. Given Qt's
> > popularity in the embedded space I don't think this would be the right
> > message to be sending out. Any concrete ideas on how we would address
> > this perception issue?=20
>=20
> Would it be worthwhile to ask that the OE TSC take on the task of
> defining what is "core" and what is not? Does this definition already exi=
st?
>=20
> From the moment OE chose to adopt a layered strategy, people started
> questioning how to define a layer and what recipes should be part of one
> layer versus another. But it doesn't seem as though there's been much
> interest in setting any definite rules or definitions in this regard.
> Maybe it would be worth the effort to at least try?
>=20
> In my opinion...
>=20
> Personally I would be in favour of removing GTK+ and the GNOME UI from
> the core and putting them in their own layer for all the same reasons I
> think Qt should be in its own layer:

The same for meta-x11 or meta-xorg, even when a lot of projects (maybe
the most) will just include meta-x* by default.

> - a "basic" image doesn't need them
> - we can have different layers to track separate major releases (as with
> qt3, qt4, and qt5)
>=20
> There are so many ways to do GUI "things" on top of a Linux system.
> Frankly I'm not even in a position where I could enumerate all of them,
> or even sort them out:
> - x11, wayland, mir, (directfb)
> (http://en.wikipedia.org/wiki/Display_server)
> - qt, gtk+, wxwidgets, tcl/tk, fltk
> (http://en.wikipedia.org/wiki/List_of_widget_toolkits)
> - xlib, xcb (client libraries implementing x11 protocol)
> - weston, mutter, kwin, clayland (display servers implementing the
> wayland display server protocol)
> - opengl, opengles, egl, ...
>=20
> (I can't even begin to figure out how to draw a diagram that shows how
> all these projects fit together!)
>=20
> Maybe if there are significant competing projects which do the same
> thing, then they should be implemented in their own layer:
> - meta-python
> - meta-perl
>=20
> And if there are completing projects which do the same thing but which
> aren't significantly large projects on their own (e.g.
> http://en.wikipedia.org/wiki/Comparison_of_lightweight_web_servers) then
> they should form a layer together of their own:
> - meta-apache-httpd
> - meta-http-servers
>   - boa
>   - cherokee
>   - lighttpd
>   - nginx
>=20
> Or maybe all projects which do the same thing different ways should be
> in their own layer? That way we don't have to distinguish between
> "significant" and "lightweight" projects"
> - meta-scripting-languages
>   - python
>   - perl
>   - ruby
> - meta-http-servers
>   - apache
>   - boa
>   - cherokee
>   - lighttpd
>   - nginx
>=20
> And maybe "core" should be just enough to get a console-based image worki=
ng?

+1 for whole e-mail.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+wcwqhATTmTB6/2m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLNqWQACgkQN1Ujt2V2gByFEQCffsP5ngIG/8k2ST2lGQ9VpfDS
PzwAoKMjjDnkZ7HyhbAa4RcZhlmdC86H
=ozDP
-----END PGP SIGNATURE-----

--+wcwqhATTmTB6/2m--
