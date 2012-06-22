Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Si4sD-0004Kg-CD
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 16:30:09 +0200
Received: by eaal1 with SMTP id l1so608110eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 07:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=IzLrKplMuf/R896txzfzWKdX9J6mMkBa6GsGN9gqjvE=;
	b=NMkfw7E3JGnte/LJxuMGTKP2Ht0pdwZelDOA/zBEb/rVU5nRoVLgjfPtrl+ervJDpL
	oGrD+SnWO2y7xYTaVyr06L7Sq2Vtv38A9Sm8cW6PyC9RaW72ytOv0sav8/PuZ+alDJeu
	FoZk4NWrOg22XjLJsuEzDPoJZU70xbEspUpAKvWlfz619Hiw+nYvP0j6ce3u/0IWXfBn
	8wEKrBUb7cWA+Bgahs8HDarvcR7Dc+tW42ZdakOYwx3uk3e3zch4AOD8sYMFufPLrC/I
	s0jspdpWLWwsB8QQdc4Rvjt1Q+fnSDEUW1qr4K+X96NbqgkQ+d3zhDzTKngJ/OUlPS/e
	L5Vg==
Received: by 10.14.95.138 with SMTP id p10mr496143eef.110.1340374762293; Fri,
	22 Jun 2012 07:19:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Fri, 22 Jun 2012 07:18:52 -0700 (PDT)
In-Reply-To: <1340373998.394.36.camel@ted>
References: <1340373998.394.36.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jun 2012 07:18:52 -0700
Message-ID: <CAMKF1sq1bDOmmxAjQGev6BhsSTcO7kuazocbUc1U_gU452shDg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 22 Jun 2012 14:30:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2012 at 7:06 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This switches to use the hash based signature generatior and update
> layout_abi to match stamp file layout changes.
>
> Angstrom, SHR and Poky did this a while ago. This brings the OE-Core defa=
ults
> into line with what is the best common practise at this point. Its been
> discussed on the mailing lists and by the TSC at length, this just comple=
tes
> the transition.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

thanks looks good


> ---
> =C2=A0meta/conf/abi_version.conf | =C2=A0 =C2=A02 +-
> =C2=A0meta/conf/bitbake.conf =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
> index f2919e5..83b668a 100644
> --- a/meta/conf/abi_version.conf
> +++ b/meta/conf/abi_version.conf
> @@ -4,4 +4,4 @@
> =C2=A0# that breaks the format and have been previously discussed on the =
mailing list
> =C2=A0# with general agreement from the core team.
> =C2=A0#
> -OELAYOUT_ABI =3D "7"
> +OELAYOUT_ABI =3D "8"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b6fbc7a..fbc0ca2 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -748,7 +748,7 @@ TRANSLATED_TARGET_ARCH ??=3D "${@d.getVar('TARGET_ARC=
H', True).replace("_", "-")}"
> =C2=A0BB_CONSOLELOG ?=3D "${TMPDIR}/cooker.log.${DATETIME}"
>
> =C2=A0# Setup our default hash policy
> -BB_SIGNATURE_HANDLER ?=3D "OEBasic"
> +BB_SIGNATURE_HANDLER ?=3D "OEBasicHash"
> =C2=A0BB_HASHBASE_WHITELIST ?=3D "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH=
 DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL =
TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOS=
T PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE =
CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE"
> =C2=A0BB_HASHCONFIG_WHITELIST ?=3D "${BB_HASHBASE_WHITELIST} DATE TIME SE=
SSION_MANAGER DBUS_SESSION_BUS_ADDRESS SSH_AGENT_PID XDG_SESSION_COOKIE SSH=
_AUTH_SOCK XAUTHORITY PSEUDO_BUILD"
> =C2=A0BB_SIGNATURE_EXCLUDE_FLAGS ?=3D "doc defaultval _append _prepend de=
ps depends lockfiles type vardepsexclude \
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


