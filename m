Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9766BD11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 05:35:09 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so3403372eek.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 22:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BStFwc1pcgyl33KXWMzRHMuAB4mCGxZ4evMVMGr456s=;
	b=sDjGrKkNrMwjMnbiHEYhWUwaYHr3tHSbQesogaKNUSsmISMwI/p6vjS1DBmhnmhvz2
	FrRrREr/4xuqhT56x5acdzFWv1XOKL2ILiUwWPRB0qOtVTNkPt5OE54ZBpAGWAd+69Jf
	npE7rQXLxcngXQ4oLJTRYJmr+Z0sMdhtbDiEjwabk+ol8/6y119YHvMXWVPwPKale181
	5+e1ehoFJOJwZ+AAKgcrMjA76kheq6WrKmGzsxzbSem88Iul1vyib594y9QnuTMIb+Ow
	1QSLhawM5gJ8j56qr0wCgQeQjOY9PcQYqhjM7ChX2pDz4CtxEyfo/ARd4/G+VSto0uoy
	oDgg==
X-Received: by 10.15.63.142 with SMTP id m14mr163537eex.106.1377754509303;
	Wed, 28 Aug 2013 22:35:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm42947871eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 28 Aug 2013 22:35:08 -0700 (PDT)
Date: Thu, 29 Aug 2013 07:36:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Chris Larson <kergoth@gmail.com>
Message-ID: <20130829053621.GK3544@jama>
References: <1377706342-15547-1-git-send-email-kergoth@gmail.com>
	<521E8414.8060309@linux.intel.com>
	<CABcZANn4xsTBz-K+cq3ALD076t3cuYw_Q_qRo_Hb_Yip+VUdGw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANn4xsTBz-K+cq3ALD076t3cuYw_Q_qRo_Hb_Yip+VUdGw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+3: don't split immodules if we have none
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
X-List-Received-Date: Thu, 29 Aug 2013 05:35:10 -0000
X-Groupsio-MsgNum: 44223
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vc1jxzmE/S8ahy1D"
Content-Disposition: inline

--vc1jxzmE/S8ahy1D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2013 at 05:05:38PM -0700, Chris Larson wrote:
> On Wed, Aug 28, 2013 at 4:13 PM, Saul Wold <sgw@linux.intel.com> wrote:
>=20
> > On 08/28/2013 09:12 AM, Christopher Larson wrote:
> >
> >> From: Christopher Larson <chris_larson@mentor.com>
> >>
> >> Currently we don't enable any immodules for gtk+3, yet we unconditiona=
lly
> >> call
> >> do_split_packages on a nonexistent path. This results in a return valu=
e of
> >> None, which it then tries to join, resulting in a TypeError. Only split
> >> the
> >> modules if we have any modules to split.
> >>
> >> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> >> ---
> >>   meta/recipes-gnome/gtk+/gtk+3.**inc | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-gnome/gtk+/gtk+**3.inc
> >> b/meta/recipes-gnome/gtk+/gtk+**3.inc
> >> index f4d5254..204a425 100644
> >> --- a/meta/recipes-gnome/gtk+/gtk+**3.inc
> >> +++ b/meta/recipes-gnome/gtk+/gtk+**3.inc
> >> @@ -94,7 +94,8 @@ python populate_packages_prepend () {
> >>       immodules_root =3D os.path.join(gtk_libdir, 'immodules')
> >>       printmodules_root =3D os.path.join(gtk_libdir, 'printbackends');
> >>
> >> -    d.setVar('GTKIMMODULES_**PACKAGES', ' '.join(do_split_packages(d,
> >> immodules_root, '^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input module=
 for
> >> %s')))
> >> +    if os.path.exists(os.path.join(d.**getVar('D', True),
> >> immodules_root)):
> >> +        d.setVar('GTKIMMODULES_**PACKAGES', '
> >> '.join(do_split_packages(d, immodules_root, '^im-(.*)\.so$',
> >> 'gtk3-immodule-%s', 'GTK input module for %s')))
> >>       do_split_packages(d, printmodules_root,
> >> '^libprintbackend-(.*)\.so$', 'gtk3-printbackend-%s', 'GTK printbackend
> >> module for %s')
> >>
> >>       if (d.getVar('DEBIAN_NAMES', 1)):
> >>
> >>
> > This seems to give me the following QA error:
> >
> >  ERROR: QA Issue: gtk+3: Files/directories were installed but not shipp=
ed
> >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-viqr.so
> >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-am-et.so
> >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-xim.so
> >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-multipress.so
> >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-cedilla.so
> >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-ti-et.so
> >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-ipa.so
> >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-inuktitut.so
> >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-ti-er.so
> >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-thai.so
> >>   /usr/lib/gtk-3.0/3.0.0/**immodules/im-cyrillic-**translit.so
> >> ERROR: QA run found fatal errors. Please consider fixing them.
> >> ERROR: Function failed: do_package_qa
> >> ERROR: Logfile of failure stored in: /srv/hdd/builds/world/tmp/**
> >> work/x86_64-poky-linux/gtk+3/**3.8.2-r0/temp/log.do_package.**17386
> >> ERROR: Task 6017 (/srv/hdd/poky/meta/recipes-**gnome/gtk+/gtk+3_3.8.2.=
bb,
> >> do_package) failed with exit code '1'
> >> NOTE: Tasks Summary: Attempted 6199 tasks of which 6190 didn't need to=
 be
> >> rerun and 1 failed.
> >
> >
> Huh, interesting, on this box it doesn't build any modules at all, hence
> the need for this.. oh, I see what I did wrong, I used os.path.join(), so
> gtk_libdir squished ${D} down to nothing. I'll send a v2 using the
> oe.path.join, and also try to determine why it builds modules for you but
> not me :) I expect we should be passing an explicit autoconf argument to
> enable all modules, or not.

Why not use return value from do_split_packages to decide whether to set
GTKIMMODULES_**PACKAGES or not? At least that's what's already used in
some places.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vc1jxzmE/S8ahy1D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIe3dUACgkQN1Ujt2V2gBzB4QCgo0bkGhBfGWK9zGlNMdj4PXux
2a4AninCb+GYFW3SyHvrwwnpTaZ1+hUL
=qk62
-----END PGP SIGNATURE-----

--vc1jxzmE/S8ahy1D--
