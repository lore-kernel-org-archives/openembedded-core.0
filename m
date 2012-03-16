Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S8T37-0006KN-KA
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 10:02:13 +0100
Received: by wibhj13 with SMTP id hj13so389506wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 01:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ovmEHBUgYxwawPH/xtzgxjD5hTSWAMVVTxsgDvWuJJk=;
	b=dYvM+4q+NTdFdqHiLd+FCAAPj4nd17eoHVl6UHPeOmUKoRYo14VTAvn2fXKL91TTD+
	RK5KAwSBQPmooUGi0NiOxZtysWq+iHZG8NI6vY2qmR20SCVNX/f81Qqh+ho7oCNRIsSZ
	/34MtBQk183TiTf+7SWZZdOiUl0WvcdXg92UhbnqENksdPm2GV1CFIvXJtGXmZ0T/CkD
	mbPFkkppy+yUJjjonPlsZYq5tEncT301Cjt72nxEzbT6iyDJ2TRmz9fZd11CN8/vVe0U
	/Z04w1tdhvR2SvaPsTjOHsuhKRuf68/wrWo9L1j8HBfTyV6QhZxXHNNINiFtavHxohyj
	ccfg==
Received: by 10.180.83.97 with SMTP id p1mr4444084wiy.19.1331888006291;
	Fri, 16 Mar 2012 01:53:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 9sm19753021wid.2.2012.03.16.01.53.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Mar 2012 01:53:25 -0700 (PDT)
Date: Fri, 16 Mar 2012 09:53:23 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120316085323.GB3855@jama.jama.net>
References: <cover.1331887433.git.dongxiao.xu@intel.com>
	<3d86bbc3fc0de1c9d0fe4903edf9f643446fde9c.1331887433.git.dongxiao.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <3d86bbc3fc0de1c9d0fe4903edf9f643446fde9c.1331887433.git.dongxiao.xu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/1] bitbake.conf: Exclude some variables when calculating cache hash
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
X-List-Received-Date: Fri, 16 Mar 2012 09:02:13 -0000
X-Groupsio-MsgNum: 19017
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline

--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 16, 2012 at 04:48:34PM +0800, Dongxiao Xu wrote:
> Some variables are not needed when calculating cache's hash, this
> commit removes them.
>=20
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
>  meta/conf/bitbake.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 216da75..908adcd 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -738,7 +738,7 @@ BB_CONSOLELOG ?=3D "${TMPDIR}/cooker.log.${DATETIME}"
>  # Setup our default hash policy
>  BB_SIGNATURE_HANDLER ?=3D "OEBasic"
>  BB_HASHBASE_WHITELIST ?=3D "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_D=
IR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM =
USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRS=
ERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN"
> -BB_HASHCONFIG_WHITELIST ?=3D "${BB_HASHBASE_WHITELIST} DATE TIME"
> +BB_HASHCONFIG_WHITELIST ?=3D "${BB_HASHBASE_WHITELIST} DATE TIME SESSION=
_MANAGER DBUS_SESSION_BUS_ADDRESS SSH_AGENT_PID XDG_SESSION_COOKIE SSH_AUTH=
_SOCK"

what about that XAUTHORITY I had?

> =20
>  MLPREFIX ??=3D ""
>  MULTILIB_VARIANTS ??=3D ""
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9i/4MACgkQN1Ujt2V2gBz8ZQCff4u7PCLXBoYD/NDB+A6KC4rF
1aEAn2V9c+WMuj3Ain6k371mSmsZ3BV8
=W2Mu
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
