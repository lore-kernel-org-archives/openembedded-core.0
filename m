Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QK3BP-00089q-C8
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 08:46:08 +0200
Received: by eye27 with SMTP id 27so56753eye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 23:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=XT/5VUsIf66BYeUmDpEPeR63LmdfmruGniAd7hYrWVE=;
	b=vYgo+eH1GydNG8V5VnNQT0VHs0cMSHUCRRPpYozn+UUSo8PfKPD8XHrDBiFAZu2NWy
	9z8mFpcgby+QM0Uo5UYLWSlhJEjbXrhk3aYv7Pe+j+HXQb0O5lb7hGRqsnD7ui95KsYx
	2J+XV4KkM02yPBd6YieQzQDvLsE/G7F6VS838=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=CMiteFl4uadz3p5D1GZfZE1+JdhTB9j4mA56AxideLXEfvqnIfn+2sJ3nFVD/MXwzf
	CpWP5peD4M4iE4lqu1l98Czh7DM8j4OTZ28v9axHewNj0U4I99W+dZuPsAILyL2n0QGL
	7XjODOSBHODm2Wd1h+uKXyrjZq6yleLy7/5Mg=
Received: by 10.14.0.133 with SMTP id 5mr4136177eeb.144.1305096201153; Tue, 10
	May 2011 23:43:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Tue, 10 May 2011 23:42:51 -0700 (PDT)
In-Reply-To: <237ad27052ac01cead340513a7057d81e0c2fcfe.1305095232.git.raj.khem@gmail.com>
References: <cover.1305095232.git.raj.khem@gmail.com>
	<237ad27052ac01cead340513a7057d81e0c2fcfe.1305095232.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 May 2011 23:42:51 -0700
Message-ID: <BANLkTimugrZqDFBU9M8kGO30MseyJZrPRg@mail.gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] conf/bitbake.conf: use --no-check-certificate to avoid errors when wgetting from https
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
X-List-Received-Date: Wed, 11 May 2011 06:46:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 11:30 PM, Khem Raj <raj.khem@gmail.com> wrote:
> From: Otavio Salvador <otavio@ossystems.com.br>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

well this patch is wrong since it adds --no-check-certificate between
-P and its argument but I have fixed it and pushed the new patch
to the pull tree.

> ---
> =C2=A0meta/conf/bitbake.conf | =C2=A0 =C2=A08 ++++----
> =C2=A01 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index fb488ae..030a78b 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -507,17 +507,17 @@ XORG_MIRROR =3D "http://xorg.freedesktop.org/releas=
es"
>
> =C2=A0FETCHCMD_svn =3D "/usr/bin/env svn"
> =C2=A0FETCHCMD_cvs =3D "/usr/bin/env cvs"
> -FETCHCMD_wget =3D "/usr/bin/env wget -t 5 -q"
> +FETCHCMD_wget =3D "/usr/bin/env wget -t 5 -q --no-check-certificate"
> =C2=A0FETCHCMD_bzr =3D "/usr/bin/env bzr"
> =C2=A0FETCHCMD_hg =3D "/usr/bin/env hg"
>
> =C2=A0FETCHCOMMAND =3D "ERROR, this must be a BitBake bug"
> -FETCHCOMMAND_wget =3D "/usr/bin/env wget -t 5 -q --passive-ftp -P ${DL_D=
IR} '${URI}'"
> +FETCHCOMMAND_wget =3D "/usr/bin/env wget -t 5 -q --passive-ftp -P --no-c=
heck-certificate ${DL_DIR} '${URI}'"
> =C2=A0FETCHCOMMAND_cvs =3D "/usr/bin/env cvs '-d${CVSROOT}' co ${CVSCOOPT=
S} ${CVSMODULE}"
> =C2=A0FETCHCOMMAND_svn =3D "/usr/bin/env svn co ${SVNCOOPTS} ${SVNROOT} $=
{SVNMODULE}"
> -CHECKCOMMAND_wget =3D "/usr/bin/env wget --spider -t 5 --passive-ftp -P =
${DL_DIR} '${URI}'"
> +CHECKCOMMAND_wget =3D "/usr/bin/env wget --spider -t 5 --passive-ftp -P =
--no-check-certificate ${DL_DIR} '${URI}'"
> =C2=A0RESUMECOMMAND =3D "ERROR, this must be a BitBake bug"
> -RESUMECOMMAND_wget =3D "/usr/bin/env wget -c -t 5 -q --passive-ftp -P ${=
DL_DIR} '${URI}'"
> +RESUMECOMMAND_wget =3D "/usr/bin/env wget -c -t 5 -q --passive-ftp -P --=
no-check-certificate ${DL_DIR} '${URI}'"
> =C2=A0UPDATECOMMAND =3D "ERROR, this must be a BitBake bug"
> =C2=A0UPDATECOMMAND_cvs =3D "/usr/bin/env cvs -d${CVSROOT} update -d -P $=
{CVSCOOPTS}"
> =C2=A0UPDATECOMMAND_svn =3D "/usr/bin/env svn update ${SVNCOOPTS}"
> --
> 1.7.4.1
>
>


