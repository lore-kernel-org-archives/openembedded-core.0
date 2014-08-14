Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id A52FA60144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 08:53:55 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id hz20so750826lab.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 01:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dqdlEuJzDTxAisybyX/sQ7iUlbDATkEn6JLNhqCcdHc=;
	b=c7/5Or/cGgmAn8jIBUch28jv+ADPOMqnzvpiDfSR10VEG9awls5QxXie1CN0qKRzTl
	Ry/I4M2rBKnxnvUECHh1KzcBywS2yxWPBq/ersr6/afdEDfuyhiPk8Lwdi0RKvvEndS9
	52A41YkdZqjhXmVvn1Gj4o1QoivpJsJcc0rXK8C1rSWeeCOvqPYEOWP3HmnpH8CWsyVk
	ZXyDSOH1a8kPsfRF0j/Cxg2sTFXOoN3MKFlUwnbFp02u9fD7kNb2l9KtSCCV+42YpKi4
	XjH5dRedAQDI9TeTJCuRKaHV5m55ccA6vPeLox6Yk8iO/WvzZu2+wfIbPv+sr9TUPrEY
	/SFQ==
X-Received: by 10.112.73.164 with SMTP id m4mr3264599lbv.3.1408006436649;
	Thu, 14 Aug 2014 01:53:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x10sm2741253lal.13.2014.08.14.01.53.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 01:53:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 14 Aug 2014 10:54:32 +0200
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20140814085432.GG14848@jama>
References: <cover.1408005909.git.Qi.Chen@windriver.com>
	<d77cfaf8b63e3dd1d7b05ff4b547b6a4a4fc6b47.1408005909.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <d77cfaf8b63e3dd1d7b05ff4b547b6a4a4fc6b47.1408005909.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/10] systemd: add libdw to RDEPENDS
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
X-List-Received-Date: Thu, 14 Aug 2014 08:53:58 -0000
X-Groupsio-MsgNum: 56474
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Xv6Km4yt4judTFSp"
Content-Disposition: inline

--Xv6Km4yt4judTFSp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2014 at 04:46:01PM +0800, Chen Qi wrote:
> Add libdw to RDEPENDS of systemd to avoid build-deps QA warning.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_215.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_215.bb b/meta/recipes-core=
/systemd/systemd_215.bb
> index 770787b..a52a042 100644
> --- a/meta/recipes-core/systemd/systemd_215.bb
> +++ b/meta/recipes-core/systemd/systemd_215.bb
> @@ -244,7 +244,7 @@ FILES_${PN} =3D " ${base_bindir}/* \
>  FILES_${PN}-dbg +=3D "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${s=
ystemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
>  FILES_${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/int=
erfaces/ ${sysconfdir}/rpm/macros.systemd"
> =20
> -RDEPENDS_${PN} +=3D "kmod dbus util-linux-mount udev (=3D ${EXTENDPKGV})"
> +RDEPENDS_${PN} +=3D "libdw kmod dbus util-linux-mount udev (=3D ${EXTEND=
PKGV})"

Shouldn't it be build-time dependency?

If it's detected from sysroot in do_configure then it has to be in
DEPENDS to get deterministic results.

>  RDEPENDS_${PN} +=3D "volatile-binds"
> =20
>  RRECOMMENDS_${PN} +=3D "systemd-serialgetty systemd-compat-units udev-hw=
db\
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

--Xv6Km4yt4judTFSp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPseUgACgkQN1Ujt2V2gBxC7QCgsOLe8wfeg3UECaqEo4pJX2HD
hNAAn34ONbJIO8L6xSZKOI9T7fKpcNzD
=CXwT
-----END PGP SIGNATURE-----

--Xv6Km4yt4judTFSp--
