Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9F15D75A38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 03:23:49 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so6593625pab.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 20:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=sD1J4AXug905Pyamc/vQaHcXspOknXKqRONYyaQfXxY=;
	b=IyPYHQJeJeeCt/zrmnWbW6AL2azxCBWZOhIufJnZqgdM+YLkAPRv5e+h9bkyQKV4XZ
	NuOXyKf6xfVK63uSeBhs/f8+TYTcI1RzAFViUza/LIgxLvxeNZxg7SDzXJtTpyAW4B7P
	Ra5RnOiYve+78k0uMhFAHSCPefn7z5/m/hIDGCmpE7OMfXE5iwJdY71zFlBgcpEpc0+Q
	0knmCHgEBE5ELU5+EmNeysIa1T5RwAO2yZggGCRkiIp+nkq+GsBpoj3gjoJFJLIVK6yp
	H9NV6lwwnH64VahPRcM88zkJ+/lQO+b3Cg+QKosppkRKMjsAlkt2kkYlhNJwQjqx8zFM
	TLVg==
X-Received: by 10.66.221.104 with SMTP id qd8mr1094492pac.155.1445311429605;
	Mon, 19 Oct 2015 20:23:49 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:c43a:7500:299d:6c4e?
	([2601:646:8601:4580:c43a:7500:299d:6c4e])
	by smtp.gmail.com with ESMTPSA id rz7sm699967pbc.7.2015.10.19.20.23.48
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 19 Oct 2015 20:23:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.4\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <013344f3d3f8c35ecb40bb8282b05d6262927b73.1445010543.git.joshua.lock@collabora.co.uk>
Date: Mon, 19 Oct 2015 20:23:48 -0700
Message-Id: <F5A83BC1-2C25-4C65-9298-066627AFF5E8@gmail.com>
References: <cover.1445010332.git.joshua.lock@collabora.co.uk>
	<cover.1445010543.git.joshua.lock@collabora.co.uk>
	<013344f3d3f8c35ecb40bb8282b05d6262927b73.1445010543.git.joshua.lock@collabora.co.uk>
To: Joshua Lock <joshua.lock@collabora.co.uk>
X-Mailer: Apple Mail (2.3096.4)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] systemd: build with compatibility libraries
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
X-List-Received-Date: Tue, 20 Oct 2015 03:23:51 -0000
X-Groupsio-MsgNum: 72385
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5DC73692-D3A7-4982-A249-741F0E26E886";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5DC73692-D3A7-4982-A249-741F0E26E886
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 16, 2015, at 8:51 AM, Joshua Lock <joshua.lock@collabora.co.uk> =
wrote:
>=20
> There are recipes in the Core metadata that have optional systemd
> support but expect the old, separate, libsystemd-foo pkg-config files
> (not the newer unified libsystemd).
>=20
> Add a PACKAGECONFIG option to build systemd with the compatibility
> pc files and default to enabling this option so that we can make use =
of
> them in the weston recipe.
>=20
> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> ---
> meta/recipes-core/systemd/systemd_225.bb | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_225.bb =
b/meta/recipes-core/systemd/systemd_225.bb
> index c2dad58..594c5aa 100644
> --- a/meta/recipes-core/systemd/systemd_225.bb
> +++ b/meta/recipes-core/systemd/systemd_225.bb
> @@ -58,7 +58,7 @@ LDFLAGS_append_libc-uclibc =3D " -lrt"
>=20
> GTKDOC_DOCDIR =3D "${S}/docs/"
>=20
> -PACKAGECONFIG ??=3D "xz ldconfig \
> +PACKAGECONFIG ??=3D "xz ldconfig compat \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', =
'pam', '', d)} \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', =
'xkbcommon', '', d)} \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', =
'selinux', '', d)} \
> @@ -89,6 +89,7 @@ PACKAGECONFIG[ldconfig] =3D =
"--enable-ldconfig,--disable-ldconfig,,"
> PACKAGECONFIG[selinux] =3D =
"--enable-selinux,--disable-selinux,libselinux"
> PACKAGECONFIG[valgrind] =3D "ac_cv_header_valgrind_memcheck_h=3Dyes =
ac_cv_header_valgrind_valgrind_h=3Dyes =
,ac_cv_header_valgrind_memcheck_h=3Dno =
ac_cv_header_valgrind_valgrind_h=3Dno ,valgrind"
> PACKAGECONFIG[qrencode] =3D =
"--enable-qrencode,--disable-qrencode,qrencode"
> +PACKAGECONFIG[compat] =3D =
"--enable-compat-libs,--disable-compat-libs=E2=80=9D

I would rather expect this to not be there in first place, if its needed =
for some, then lets not enable it by default
what would it take to fix weston ?

>=20
> CACHED_CONFIGUREVARS +=3D "ac_cv_path_KILL=3D${base_bindir}/kill"
> CACHED_CONFIGUREVARS +=3D "ac_cv_path_KMOD=3D${base_bindir}/kmod"
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_5DC73692-D3A7-4982-A249-741F0E26E886
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYls8QACgkQuwUzVZGdMxSggACdG1HDVLHyjl82QiJ4dAYf9/re
NI0An0Fkb97YM8Z62GzkJR4YfZqsqGSf
=Uxai
-----END PGP SIGNATURE-----

--Apple-Mail=_5DC73692-D3A7-4982-A249-741F0E26E886--
