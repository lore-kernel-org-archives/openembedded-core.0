Received: from giant.haxx.se ([80.67.6.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bjst@giant.haxx.se>) id 1SK3gt-00050d-Qz
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 10:23:11 +0200
Received: from giant.haxx.se (localhost.localdomain [127.0.0.1])
	by giant.haxx.se (8.14.4/8.14.4/Debian-2) with ESMTP id q3H8Dkn0027902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 10:13:46 +0200
Received: (from bjst@localhost)
	by giant.haxx.se (8.14.4/8.14.4/Submit) id q3H8Dkrd027899
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 10:13:46 +0200
Date: Tue, 17 Apr 2012 10:13:46 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120417081345.GB7246@giant>
References: <1334578750.16992.83.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1334578750.16992.83.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIME-Autoconverted: from 8bit to quoted-printable by giant.haxx.se id
	q3H8Dkn0027902
Subject: Re: [PATCH] bitbake.conf: Add PARALLEL_MAKE to BB_HASHBASE_WHITELIST
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
X-List-Received-Date: Tue, 17 Apr 2012 08:23:12 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> The value of PARALLEL_MAKE shouldn't affect sstate checksums. In genera=
l it
> doesn't as the value is injected as a task override and the sstate chec=
ksum
> doesn't track these. That isn't the case for linux-yocto in particular =
so
> adding it the list of variables to ignore is useful.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 501863b..911854b 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -737,7 +737,7 @@ BB_CONSOLELOG ?=3D "${TMPDIR}/cooker.log.${DATETIME=
}"
> =20
>  # Setup our default hash policy
>  BB_SIGNATURE_HANDLER ?=3D "OEBasic"
> -BB_HASHBASE_WHITELIST ?=3D "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL=
_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL T=
ERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HO=
ST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN"
> +BB_HASHBASE_WHITELIST ?=3D "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL=
_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL T=
ERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HO=
ST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MA=
KE"
>  BB_HASHCONFIG_WHITELIST ?=3D "${BB_HASHBASE_WHITELIST} DATE TIME SESSI=
ON_MANAGER DBUS_SESSION_BUS_ADDRESS SSH_AGENT_PID XDG_SESSION_COOKIE SSH_=
AUTH_SOCK XAUTHORITY"
> =20
>  MLPREFIX ??=3D ""
>=20

Tested-by: Bj=F6rn Stenberg <bjst@enea.com>

--=20
Bj=F6rn


