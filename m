Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SDVxk-0005bI-AL
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 09:09:33 +0200
Received: by wera1 with SMTP id a1so161415wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 00:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=a+Ny7/nur9gsBNciR8e2PwAz3AUbc/LyDgtilhvDv3g=;
	b=Vxyaujtg7zg+uJnXIyr0GbsiXJxEuokR/vEUQaPTBTp5AeuHq1gco+cIA/DDAVGbZe
	5bcs3hyRGXtEZ1xrySjohWvrTfl/i3HMEYmnBPB+bdxBuIBQLsRVh3f/J5jIhpjq8GLI
	o5/MoYrQBkJtnZA+ogD3F3buQkEfiA5FfuRxbLugTw9YOztrflqT0IO4p0RxcOB6ol2F
	Q69ORH7AMUk1HgaCEza2Le+T9R6Cxd9EUKMmt3mXFMeKKz7BzverX5Kfj+S4KLP0m/PM
	QHBw7kTDPiaTTkbu5CooyVpqsaCEWJjpmM5zh+OTYjYih6YEAQVh7sTURzUNyFLFKajJ
	ZeSA==
Received: by 10.180.85.70 with SMTP id f6mr3462144wiz.5.1333090827097;
	Fri, 30 Mar 2012 00:00:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm6465294wiv.11.2012.03.30.00.00.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 00:00:26 -0700 (PDT)
Date: Fri, 30 Mar 2012 09:00:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120330070028.GI25815@jama.jama.net>
References: <20120329225332.0e8cc2f4@eb-e6520> <1333058593.18082.40.camel@ted>
	<CADkTA4MvYRmsLQogaQMHwUeP5y7ws5NvmXiBMgvsreiGNQrsJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4MvYRmsLQogaQMHwUeP5y7ws5NvmXiBMgvsreiGNQrsJw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Fetch time optimization (svn : gcc/eglibc - git : linux-yocto)
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
X-List-Received-Date: Fri, 30 Mar 2012 07:09:33 -0000
X-Groupsio-MsgNum: 20012
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9iyR+p8Z2cn535Lj"
Content-Disposition: inline

--9iyR+p8Z2cn535Lj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 09:03:15PM -0400, Bruce Ashfield wrote:
> On Thu, Mar 29, 2012 at 6:03 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2012-03-29 at 22:53 +0200, Eric B=E9nard wrote:
> >> I noticed in from scratch builds for qemuarm that the longest time is
> >> taken in fetching sources, especially those fetched using git
> >> (linux-yocto for example) & svn (gcc, eglibc & co).
> >
> > Are you timing these as fetches from the source control systems or from
> > the mirror tarballs of the repositories. The tarballs should be
> > faster...
> >
> >> To reduce the fetch time would that make sense to
> >> - fetch gcc/glibc & co from the archive of a stable version and then
> >> =A0 apply patches on top of it (maybe patches stored in an archive
> >> =A0 fetched from oe's website and applied in bulk or patches stored in=
 OE)
> >
> > Unfortunately the patches tend to get unwieldy. The tarballs of the svn
> > repos on the mirror should be about equal in size to the upstream
> > archive in this case.
> >
> >> - do the same thing for the linux-yocto kernel or add a --reference
> >> =A0 option to the git fetcher so that we can provide a local tree as a
> >> =A0 reference ?
> >
> > This is effectively how the repositories in DL_DIR are used. If you
> > place a tree in the right place there, it should reuse references...
>=20
> Agreed .. they definitely do here.

What's right place?

I guess the idea was to use --reference for e.g. some other kernel recipe
sources checkout.

And I guess that building linux-foo won't notice that there is e.g.
/OE/downloads/git2/gitorious.org.shr.linux.git:
=66rom which it can share a lot of objects using --reference

Bob Ham (rah on #oe) said that he is working on some sort of support
for --reference with bitbake after I've refused to add just another
linux-bar recipe to meta-smartphone, but not sure how he plans to
implement it to be usefull and working oob in different env with
different sources available in downloads dir.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9iyR+p8Z2cn535Lj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk91WgwACgkQN1Ujt2V2gBymYQCgrY6YZMOJVfSlJgGPiMNQARBQ
h4gAnikx74aVzEdnM/6G9mvJ6SVicSzt
=Or4I
-----END PGP SIGNATURE-----

--9iyR+p8Z2cn535Lj--
