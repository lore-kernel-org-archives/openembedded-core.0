Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Si53p-0004iy-TH
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 16:42:10 +0200
Received: by wgbdr1 with SMTP id dr1so1674919wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 07:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=o7RAL9a77NcuXuYTkHoRfn95MHYFEiWIQFiOCzVNPVA=;
	b=NQV1WlY9Su1eSNqplRKc13GUBBVx6a+E9WyPcDp8S6v3zhU6tZt9ajUKok8cGoWWkP
	bcbPZnqfPL8TAV46ZwMYWIKijLSJRMrA5EZjQNUHiqoTMxIGE6vnnlNkf9iLlNyQAMMh
	Oonzi2GKyPhc0LgbRGPG8msWy8xrfUGO8WKL+5RVbSkDl9sI/fRzrrQAhvbMPmQgtV2f
	17TcgG1owEiQBXLCz9llsy/n3V9zA0XkK5eYP/rA6oL2a2MU0AM9rJ4P4q62NZU3ZY5F
	utVPZwWMeBfpBaq5vekGZNq5vj5ROMUBCA/2PHTUyWQ4x9OWvPiiUuHNAS9uDH9AiDjC
	20tw==
Received: by 10.180.80.74 with SMTP id p10mr5233514wix.10.1340375482778;
	Fri, 22 Jun 2012 07:31:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k8sm100884202wia.6.2012.06.22.07.31.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jun 2012 07:31:21 -0700 (PDT)
Date: Fri, 22 Jun 2012 16:31:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120622143121.GN9352@jama.jama.net>
References: <1340373998.394.36.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1340373998.394.36.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] bitbake.conf/abi_version.conf: Update to use BasicHash signature generator
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
X-List-Received-Date: Fri, 22 Jun 2012 14:42:10 -0000
X-Groupsio-MsgNum: 23991
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JLiXfqD9/Kt1b+Pq"
Content-Disposition: inline

--JLiXfqD9/Kt1b+Pq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2012 at 03:06:38PM +0100, Richard Purdie wrote:
> This switches to use the hash based signature generatior and update
> layout_abi to match stamp file layout changes.
>=20
> Angstrom, SHR and Poky did this a while ago. This brings the OE-Core defa=
ults

SHR didn't (except my testing), but I'm fine with this change.. I'll overri=
de it=20
in back to OEBasic in meta-shr layer (at least until we get faster
official feed builder..).

Cheers,

> into line with what is the best common practise at this point. Its been
> discussed on the mailing lists and by the TSC at length, this just comple=
tes
> the transition.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/abi_version.conf |    2 +-
>  meta/conf/bitbake.conf     |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
> index f2919e5..83b668a 100644
> --- a/meta/conf/abi_version.conf
> +++ b/meta/conf/abi_version.conf
> @@ -4,4 +4,4 @@
>  # that breaks the format and have been previously discussed on the maili=
ng list=20
>  # with general agreement from the core team.
>  #
> -OELAYOUT_ABI =3D "7"
> +OELAYOUT_ABI =3D "8"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b6fbc7a..fbc0ca2 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -748,7 +748,7 @@ TRANSLATED_TARGET_ARCH ??=3D "${@d.getVar('TARGET_ARC=
H', True).replace("_", "-")}"
>  BB_CONSOLELOG ?=3D "${TMPDIR}/cooker.log.${DATETIME}"
> =20
>  # Setup our default hash policy
> -BB_SIGNATURE_HANDLER ?=3D "OEBasic"
> +BB_SIGNATURE_HANDLER ?=3D "OEBasicHash"
>  BB_HASHBASE_WHITELIST ?=3D "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_D=
IR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM =
USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRS=
ERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE CCACH=
E_DIR EXTERNAL_TOOLCHAIN CCACHE"
>  BB_HASHCONFIG_WHITELIST ?=3D "${BB_HASHBASE_WHITELIST} DATE TIME SESSION=
_MANAGER DBUS_SESSION_BUS_ADDRESS SSH_AGENT_PID XDG_SESSION_COOKIE SSH_AUTH=
_SOCK XAUTHORITY PSEUDO_BUILD"
>  BB_SIGNATURE_EXCLUDE_FLAGS ?=3D "doc defaultval _append _prepend deps de=
pends lockfiles type vardepsexclude \
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JLiXfqD9/Kt1b+Pq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/kgbkACgkQN1Ujt2V2gBy37QCdGR7MMs5q9oEHaYC/f59Pfi6z
b0AAnjco//k5zLjuevaX9GCudgZAke4A
=Iqye
-----END PGP SIGNATURE-----

--JLiXfqD9/Kt1b+Pq--
