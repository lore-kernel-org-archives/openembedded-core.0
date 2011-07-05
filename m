Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QeCal-0004ty-0U
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 22:51:35 +0200
Received: by pvf24 with SMTP id 24so5832403pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 13:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=KisW/nH5fNAcWOJeWsI87u9EqFH0k3wjbHy4p0v0uEQ=;
	b=etfdPkWp0nWaVmJUWffNwwFwgGrANSKF30D2WCkJN4Hapo2FmCqqZnWKE9jlTQYjlV
	yV6TOrbFLZZq0ZZfRc4HfGExrT2jjX2Z/NyVudctHnhlMhhAUolhxC6OYYDjvTK9jQ3y
	NlJRtFp3FGSFauy+BKTDwH9i9JydJJLzbjFD0=
Received: by 10.68.15.170 with SMTP id y10mr9180928pbc.364.1309898864065; Tue,
	05 Jul 2011 13:47:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.57.104 with HTTP; Tue, 5 Jul 2011 13:47:14 -0700 (PDT)
In-Reply-To: <1309872782.20015.710.camel@rex>
References: <1309872782.20015.710.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Jul 2011 13:47:14 -0700
Message-ID: <CAMKF1srfJbmG42myirxJr2v2_HMyWNTH+4qWF-Zma0k5p-CHog@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] openssh/dropbear: No need for each to PROVIDE ssh/sshd
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
X-List-Received-Date: Tue, 05 Jul 2011 20:51:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 5, 2011 at 6:33 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Nothing in the system actually uses the PROVIDES field for these
> recipes, its usually the runtime packages that are used. We can
> therefore remove the PROVIDES and hence quieten the associated
> warnings from bitbake.
>
> If these recipes do really need the PROVIDES, they would be better
> as virtuals and adding that to MULTI_PROVIDER_WHITELIST.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb b/meta/re=
cipes-connectivity/openssh/openssh_5.8p2.bb
> index ec33b29..e23069c 100644
> --- a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
> @@ -12,7 +12,6 @@ PR =3D "r0"
> =C2=A0DEPENDS =3D "zlib openssl"
> =C2=A0DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', =
'', d)}"
>
> -PROVIDES =3D "ssh sshd"
> =C2=A0RPROVIDES =3D "ssh sshd"
>
> =C2=A0CONFLICTS_${PN} =3D "dropbear"
> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/=
dropbear/dropbear.inc
> index c9c41d2..1b51e1a 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -8,7 +8,6 @@ LICENSE =3D "MIT"
> =C2=A0LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3a5b0c2f0d0c49dfde9558ae=
2036683c"
>
> =C2=A0DEPENDS =3D "zlib"
> -PROVIDES =3D "ssh sshd"
> =C2=A0RPROVIDES =3D "ssh sshd"
>
> =C2=A0SRC_URI =3D "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV=
}.tar.gz \
>

Infact I have tested same patch last week so

Acked-by: Khem Raj <raj.khem@gmail.com>

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


