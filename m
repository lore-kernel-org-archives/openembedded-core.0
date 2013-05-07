Received: from mail-pa0-f49.google.com ([209.85.220.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UZkIF-0001Zk-Q5
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 17:59:13 +0200
Received: by mail-pa0-f49.google.com with SMTP id bi5so580198pad.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=XThI/NWxbdPS1TRh8toOiAGNZGcSwWj9NkcGjovhlJo=;
	b=gAjCJpUehQn6EeWPRG61FQ+c8BcoaiNgIlbJdAqKLMjaVGF7uF6GxLiO6gtIHDHXc2
	Pq797gm61LQseX0i6oUahd5+c0WwTOs+HEAKq+05Lc8b5bB+DVKId87Uqen8cDeY4TvC
	D8kbxjjx18i/5DtyjP5qCmFWYNXOBsXRe7nOCqlaJVc4PuUDDiF5cWLYFWq0eWNccBpW
	yOUXmrqK7ffBoWvZZAlGKe+sfeBLyxibRCeTwo9nr35ETO4GfFHFDm5pwByDmXLDp5/j
	VnEAcFSsIAwM4INH9eJB2jw4vS7++FhX0qxPSw4mE/Q7RSTbRQ4KNNBPi1adbGDEz3yX
	cEvw==
X-Received: by 10.68.137.74 with SMTP id qg10mr2913665pbb.172.1367941266191;
	Tue, 07 May 2013 08:41:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x2sm28669692pba.32.2013.05.07.08.41.03 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 08:41:04 -0700 (PDT)
Date: Tue, 7 May 2013 17:40:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130507154057.GG3187@jama>
References: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1367931368-21504-5-git-send-email-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1367931368-21504-5-git-send-email-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/15] classes/lib: Update to use print as a function call
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
X-List-Received-Date: Tue, 07 May 2013 15:59:16 -0000
X-Groupsio-MsgNum: 38805
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6BvahUXLYAruDZOj"
Content-Disposition: inline

--6BvahUXLYAruDZOj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2013 at 01:55:57PM +0100, Richard Purdie wrote:
> In python 3 print is a function call. In some cases bb.note is a more
> appropriate call to make.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/sanity.bbclass |    7 ++++---
>  meta/classes/sstate.bbclass |    6 +++---
>  meta/lib/oe/path.py         |    2 +-
>  3 files changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 766e97e..d4a8f5e 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -367,15 +367,16 @@ def check_sanity(sanity_data):
>      try:
>          from distutils.version import LooseVersion
>      except ImportError:
> -        def LooseVersion(v): print "WARNING: sanity.bbclass can't compar=
e versions without python-distutils"; return 1
> -    import commands

^ was removing "import commands" intentional? maybe it just belongs to
different patch in this series

> +        def LooseVersion(v):
> +            print("WARNING: sanity.bbclass can't compare versions withou=
t python-distutils")
> +            return 1
> =20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6BvahUXLYAruDZOj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGJIIkACgkQN1Ujt2V2gBxWdgCfXgMWj6kFBk7f7bPtXkaFNjOH
I7IAn2v/+/tMr+/RPywy16v0alwXbP3B
=+Bfa
-----END PGP SIGNATURE-----

--6BvahUXLYAruDZOj--
