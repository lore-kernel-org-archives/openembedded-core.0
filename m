Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RrvQd-0003Ai-Au
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 18:54:07 +0100
Received: by lahc1 with SMTP id c1so2286525lah.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 09:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=SnLGBOGhbiWjN4whGpk0TKzp3+Q83DGEUFlbwl7JZv0=;
	b=qQq6K+zcK0u57NWVeo9ZHhfjfoAMlBF+quSldCqXhtyEK4wKfj32TPGc4gmyKKO8zq
	QXMcySuSCMlgA2NRIGrFG11pAoQ/GsriPmR6eV/lB7SZ5rg2o3sXER7GNa+FQ/HmBarQ
	ZOzwryhjcI0w4TUyrEdPgO68NVG0wIPNbqf1s=
Received: by 10.112.86.67 with SMTP id n3mr4728304lbz.29.1327945574228; Mon,
	30 Jan 2012 09:46:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Mon, 30 Jan 2012 09:45:44 -0800 (PST)
In-Reply-To: <1327936840-13937-3-git-send-email-steve@sakoman.com>
References: <1327936840-13937-1-git-send-email-steve@sakoman.com>
	<1327936840-13937-3-git-send-email-steve@sakoman.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jan 2012 09:45:44 -0800
Message-ID: <CAMKF1spTSFxJzq17PHMwg=ps3G8zvnXpfQjvYeK-krN1NEgYRA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH 2/4] libksba: add recipe for 1.2.0
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
X-List-Received-Date: Mon, 30 Jan 2012 17:54:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Steve

On Mon, Jan 30, 2012 at 7:20 AM, Steve Sakoman <steve@sakoman.com> wrote:
> Libksba provides an easy API to create and parse X.509 and CMS related ob=
jects
> and is required for gnupg
>

Doesn't it need libgpg-error ?
http://www.gnupg.org/related_software/libgpg-error

> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
> =C2=A0meta/recipes-extended/gnupg/libksba_1.2.0.bb | =C2=A0 10 ++++++++++
> =C2=A01 files changed, 10 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta/recipes-extended/gnupg/libksba_1.2.0.bb
>
> diff --git a/meta/recipes-extended/gnupg/libksba_1.2.0.bb b/meta/recipes-=
extended/gnupg/libksba_1.2.0.bb
> new file mode 100644
> index 0000000..876eedc
> --- /dev/null
> +++ b/meta/recipes-extended/gnupg/libksba_1.2.0.bb
> @@ -0,0 +1,10 @@
> +DESCRIPTION =3D " Libksba provides an easy API to create and parse X.509=
 and CMS related objects"
> +LICENSE =3D "GPLv3+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be8967=
949"
> +
> +inherit autotools binconfig
> +
> +SRC_URI =3D "ftp://ftp.gnupg.org/gcrypt/${PN}/${PN}-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] =3D "e797f370b69b4dc776499d6a071ae137"
> +SRC_URI[sha256sum] =3D "09afce65b03d027cbec10d21464f4f651cdfd269e38b404f=
83e48d3e2a3c934b"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


