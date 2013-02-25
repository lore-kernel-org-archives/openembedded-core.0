Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UA3hF-00050i-6s
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 20:26:45 +0100
Received: by mail-da0-f41.google.com with SMTP id j17so193077dan.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2013 11:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=0GSiW1uZxZuKveD2DCnq9grep+WcOKiYInOwjCQhoYY=;
	b=BvUnWkBZ0QxmbDpqkJl0DnXwE1Udc0ok5v88VMMzMfrOp+AuVro1cQCh9PeX5TVAOL
	vEy5s/euHnx5MzczcWDmFOFaF2VVwLtdmktT1YH7T2iDrKSnaxCIn1rpFxx4TKkIOd2N
	nnw3tN9JGjg6U37/3AXTuigc4F5w6ZnJPBc+yn2s1O2oSIqH0DsQ7RMudl0lL8rsV3Bd
	0wd7PMfm0sOzKVa1NA8nsNnCFwJkqguNSTU+ABpWmJDp0ro8WMKZelPc5LeGZSbCeiax
	7XfqjQ2fM2P4/D1BjRvvZ84LCKp2A44O8vZdN1ucxNYJSix/5H+8CXVkkX9oBWzA086+
	ZLow==
X-Received: by 10.66.248.226 with SMTP id yp2mr20621972pac.86.1361819425792;
	Mon, 25 Feb 2013 11:10:25 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hu2sm13576612pbc.38.2013.02.25.11.10.23
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 25 Feb 2013 11:10:24 -0800 (PST)
Date: Mon, 25 Feb 2013 20:10:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130225191033.GA3239@jama>
References: <1358782794-16860-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1358782794-16860-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] site: add x86-32/64 alignment values for at-spi2-core
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
X-List-Received-Date: Mon, 25 Feb 2013 19:26:46 -0000
X-Groupsio-MsgNum: 35793
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline

--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 21, 2013 at 03:39:54PM +0000, Ross Burton wrote:
> This package isn't yet in oe-core, but GTK+ 3.6 depends on it so will be =
here at
> some point.

Anyone working on updating at least arm site? This still blocks
at-spi2-core merge to meta-oe.

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/site/ix86-common  |   10 ++++++++++
>  meta/site/x86_64-linux |    9 +++++++++
>  2 files changed, 19 insertions(+)
>=20
> diff --git a/meta/site/ix86-common b/meta/site/ix86-common
> index 20cac75..5c90865 100644
> --- a/meta/site/ix86-common
> +++ b/meta/site/ix86-common
> @@ -220,3 +220,13 @@ ac_cv_lib_c_signalfd=3D${ac_cv_lib_c_signalfd=3Dyes}
>  nfsd_cv_broken_setfsuid=3D${nfsd_cv_broken_setfsuid=3D0}
>  nfsd_cv_func_statfs=3D${nfsd_cv_func_statfs=3Dstatfs2_bsize}
>  nfsd_cv_bsd_signals=3D${nfsd_cv_bsd_signals=3Dyes}
> +
> +# dbind, in at-spi2-core
> +ac_cv_alignof_char=3D1
> +ac_cv_alignof_dbind_pointer=3D4
> +ac_cv_alignof_dbind_struct=3D1
> +ac_cv_alignof_dbus_bool_t=3D4
> +ac_cv_alignof_dbus_int16_t=3D2
> +ac_cv_alignof_dbus_int32_t=3D4
> +ac_cv_alignof_dbus_int64_t=3D4
> +ac_cv_alignof_double=3D4
> diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
> index 3acc294..78a3b85 100644
> --- a/meta/site/x86_64-linux
> +++ b/meta/site/x86_64-linux
> @@ -124,3 +124,12 @@ ac_cv_func__restgpr_14_x=3Dno
> =20
>  # cvs
>  cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=3Dyes}
> +
> +# dbind
> +ac_cv_alignof_dbind_pointer=3D8
> +ac_cv_alignof_dbind_struct=3D1
> +ac_cv_alignof_dbus_bool_t=3D4
> +ac_cv_alignof_dbus_int16_t=3D2
> +ac_cv_alignof_dbus_int32_t=3D4
> +ac_cv_alignof_dbus_int64_t=3D8
> +ac_cv_alignof_double=3D8
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlErtykACgkQN1Ujt2V2gBwHsQCfTNoI6pXW30aXkKEADgnA26Iw
hagAnAuZ8qSCtl6Afui6n1kpNyKfPdPr
=WMzg
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
