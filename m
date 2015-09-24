Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id CE3DA77003
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 06:18:28 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so237038023wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 23:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=resent-from:resent-date:resent-message-id:resent-to:from:date:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=DX4SfVqiu3MMuAH8XuuZ1QoJI/xxqzt8RoqQlk20LK4=;
	b=f9xf6tzKqvCd55QmsiFL/XejSx9xrysvaLN58QuOQjGy6dSJC4uaZNjG3aXZ7OYj2z
	Ko/RxDAp3OeqvD6nNGOUopdoeqCpZJOyUd9KyQjWBfxm8jsK/RrrOpRHi1ysojMWFG3f
	H41yzmGIY98ag7kZu6/FDD7I+4df9Znm1rWSEv9StW9YhzVF5iz4Xb2oPn3sfjrVNU9K
	KOftdwJd8Gq7p0jI1VVodbcTxBCy9VFjTYUaaw4LgmnnjLdc14abzBFVauh9QJduf4xn
	0+UWsASvgGgTVNWJpU2qVEzWkhfGKboQNQSvhGsu68VrEjLnZf+27CBipa69RpDU9HX4
	hNoA==
X-Received: by 10.181.29.101 with SMTP id jv5mr518522wid.1.1443075508099;
	Wed, 23 Sep 2015 23:18:28 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id fu5sm1584642wic.0.2015.09.23.23.18.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Sep 2015 23:18:27 -0700 (PDT)
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Thu, 24 Sep 2015 08:18:43 +0200
Resent-Message-ID: <20150924061843.GB30780@jama>
Resent-To: openembedded-core@lists.openembedded.org
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id fu5sm1500859wic.0.2015.09.23.22.54.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Sep 2015 22:54:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 Sep 2015 07:54:44 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150924055444.GA2404@jama>
References: <20150923211259.12BA050583@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150923211259.12BA050583@opal.openembedded.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: smrLQx1E2to4
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : insane.bbclass: make package_qa_clean_path return a relative path
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
X-List-Received-Date: Thu, 24 Sep 2015 06:18:29 -0000
X-Groupsio-MsgNum: 71526
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2015 at 09:12:59PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master-next
> Commit: 67a1e4b087a39db04370685616d5b439b0f2b505
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D67a1e4b087a39db04370685616d5b439b0f2b505
>=20
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Tue Sep 15 19:28:48 2015 -0700
>=20
> insane.bbclass: make package_qa_clean_path return a relative path
>=20
> Make package_qa_clean_path() return something like "work/path/to/file"
> rather than "/work/path/to/file", the relative path is a little clear.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/classes/insane.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 72120f5..05e31a7 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -167,7 +167,7 @@ def package_qa_get_machine_dict():
> =20
>  def package_qa_clean_path(path,d):
>      """ Remove the common prefix from the path. In this case it is the T=
MPDIR"""
> -    return path.replace(d.getVar('TMPDIR',True),"")
> +    return path.replace(d.getVar("TMPDIR", True) + "/", "")

Isn't path[len(d.getVar("TMPDIR", True))+1:] a bit faster and safer in
cases where the TMPDIR path is included multiple times?

Or is this function meant to be used also for path which doesn't start
with TMPDIR? Then I agree it should stay replace, but maybe with
maxreplace parameter set to 1.

Same problem with "absolute" path is other QA check I was recently
changing (and I've kept leading / after seeing it somewhere else :)).

Regards,

> =20
>  def package_qa_write_error(type, error, d):
>      logfile =3D d.getVar('QA_LOGFILE', True)
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYDkCQACgkQN1Ujt2V2gBzjrACgj1CjmITEWs26JTY4B5XQF4kj
+M8AoKMhjBZHzD8Bhe0n35d96XSxGni9
=P3o+
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
