Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0FCC165D08
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 01:20:43 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so2307761eek.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 18:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pCuwjsRvfyRzFDoSIvRHwAf5NqO9aI1sDjFnFdoPRIM=;
	b=EGPsRZWOOqyj6d0IohiHJBrt3f9qIJYQFUolkVEk2iZHs8lDLhED4B7u6odk5lRhoN
	VLh0avZHTXmQir64IWCxRHrnEZcbJJa3lbrikLXUgMjYATR6/ErCG+QJtVf27k7fmp+b
	NWID7iadwGQ8WJ+T9sXfe7enKB+Bfdhol3YTApXEwHO1/uwJ3UQpT/MJdC/UOvwJUfcx
	FdYWjY9yL/nuaYHxpy8OD6ppItZ4vFKWeC4E1LVp3dCKhppOyBcpCkIY1rvJc5r+ENn1
	OeP8rhP+oOJevwAiHIVsvTUphswwogRg+e8c5yrH6CNATnNjZgisL/QuvaG/4/QKe5BH
	pRqA==
X-Received: by 10.15.53.69 with SMTP id q45mr6170403eew.22.1398388844487;
	Thu, 24 Apr 2014 18:20:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t50sm20490230eev.28.2014.04.24.18.20.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Apr 2014 18:20:43 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Apr 2014 03:20:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Changhyeok Bae <changhyeok.bae@lge.com>
Message-ID: <20140425012053.GO2486@jama>
References: <1398386806-12058-1-git-send-email-changhyeok.bae@lge.com>
MIME-Version: 1.0
In-Reply-To: <1398386806-12058-1-git-send-email-changhyeok.bae@lge.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mirrors.bbclass: Add mirror site
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
X-List-Received-Date: Fri, 25 Apr 2014 01:20:44 -0000
X-Groupsio-MsgNum: 52590
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QtaS+3lVuRodb1W+"
Content-Disposition: inline

--QtaS+3lVuRodb1W+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2014 at 09:46:46AM +0900, Changhyeok Bae wrote:
> * The SRC_URI is not accessible.
>   So need to add mirror site referred by the original site.
> * The problem is that
>   http://download.savannah.nongnu.org/releases and
>   http://download.savannah.gnu.org/releases redirects to closest mirror
>   and few mirrors (e.g. .jp) weren't working correctly while
>   http://download-mirror.savannah.gnu.org/releases/ seems to be reliable.
>=20
> Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
> ---
>  meta/classes/mirrors.bbclass |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
> index 1fd7cd8..a632032 100644
> --- a/meta/classes/mirrors.bbclass
> +++ b/meta/classes/mirrors.bbclass
> @@ -45,6 +45,8 @@ ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://=
sunsite.ualberta.ca/pub/M
>  ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://the.wiretapped.ne=
t/pub/security/host-security/lsof/ \n \
>  http://www.apache.org/dist  http://archive.apache.org/dist \n \
>  http://downloads.sourceforge.net/watchdog/ http://fossies.org/linux/misc=
/ \n \
> +http://download.savannah.nongnu.org/releases/ http://download-mirror.sav=
annah.gnu.org/releases/ \n \
> +http://download.savannah.gnu.org/releases/ http://download-mirror.savann=
ah.gnu.org/releases/ \n \

It would be better to add variable for this url first and then use the
variable here as well as in recipes.

>  cvs://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
>  svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
>  git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QtaS+3lVuRodb1W+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNZuHUACgkQN1Ujt2V2gBxRvwCcDdOKRGUH+ZiMaQWa29S8A9Fr
5jcAoIo2nMfIAG0Qpg0EkHD2984Ca8bL
=tQEg
-----END PGP SIGNATURE-----

--QtaS+3lVuRodb1W+--
