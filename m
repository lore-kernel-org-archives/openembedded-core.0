Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrUt6-0005WM-TV
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 16:06:00 +0200
Received: by bkcik5 with SMTP id ik5so1161960bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 06:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ea/wvF+cmhbDFoN0VqF24WS8NMrnN6Ufp49bjrUCsM4=;
	b=pDFzMFjmryou8n1MqhIdGhXPSNcP6WGGZNeUfk+05SG40KjFr2I01LhbCPN/nvw+Z+
	SSXdW0VB9H5Urcc1xsnJ08++Qo///5W2/N6ioy/FrNEBihXoJQwkivwaa0iqHEFmKqU4
	4HmkHOaE6M3azYHRs20G5yajbbtzYlVgCFX1pjKDVe6DGCSncKlaNHHS2ulxWmY0J15j
	qJO/vdlml8wM7PpiHFsLOSHB/F6IuUUzoRLSb/sBiPlANTJ/LohzzXcvTQXdBEKRJqwO
	4NIL0lP8KFVASM2QSkReyOYxkdmVeogsPNdYYT+Qa9T9qgmEejeGGZuuN/x3W2makmFO
	JiQA==
Received: by 10.204.157.151 with SMTP id b23mr1663962bkx.96.1342619680210;
	Wed, 18 Jul 2012 06:54:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm11945145bks.6.2012.07.18.06.54.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 06:54:39 -0700 (PDT)
Date: Wed, 18 Jul 2012 15:54:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120718135449.GQ22569@jama.jama.net>
References: <cover.1342597081.git.sgw@linux.intel.com>
	<0c170de4b028140df155b3e88230b81ad1a0eb86.1342597081.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <0c170de4b028140df155b3e88230b81ad1a0eb86.1342597081.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [CONSOLIDATED PULL 14/18] webkit-gtk: remove spurious install_prepend hack
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
X-List-Received-Date: Wed, 18 Jul 2012 14:06:01 -0000
X-Groupsio-MsgNum: 25651
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rE45P3aZNSuYx5ND"
Content-Disposition: inline

--rE45P3aZNSuYx5ND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2012 at 12:42:43AM -0700, Saul Wold wrote:
> From: Ross Burton <ross.burton@intel.com>
>=20
> This "fix" causes an (ignored) error now, so at some point it was fixed.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb b/meta/recipes-=
sato/webkit/webkit-gtk_1.8.1.bb
> index 3cef0e4..180861e 100644
> --- a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
> +++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
> @@ -78,10 +78,6 @@ do_configure_append() {
>  	done
>  }
> =20
> -do_install_prepend() {
> -	cp ${S}/Programs/.libs/jsc ${S}/Programs/jsc-1 || true
> -}
> -
>  do_install_append() {
>  	rmdir ${D}${libexecdir}
>  }

Both patches (or at least the 2nd) should have PR bump so that if this
change causes some issues it would be found asap, not with next upgrade
when nobody will remember that this was changed here..

But as webkit-gtk takes quite long to build I'm fine with it this time
(my second builder haven't upgraded webkit-gtk yet anyway..), so I'll
test it there.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rE45P3aZNSuYx5ND
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAGwCkACgkQN1Ujt2V2gBy/iACfQi7NqaPvrn9kPFSbgAl6UHI7
NiEAnA/xZxZAWZ6oOQsrqzTVZuRCxWwo
=k+do
-----END PGP SIGNATURE-----

--rE45P3aZNSuYx5ND--
