Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 01C5E60123
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 23:50:24 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id iv1so77507371pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 16:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=RkUZ/UY82oqu/uPLQst0kEkg/gH5vKgUQL2OuKBC4MU=;
	b=qHOrh/q9Hxatj3/zBqKIDPalAwDnmf7jfML2Cm6JBWFcmy5o39f9RIAz6a9mSnDkvC
	0V2CYRh7rFLmvxZZ5W5OMcHYwsNnicJ/saB51GvI7fGJn7/Rep7l4A6TGjpiqdAe4r/l
	qn8NM0aF2QcBREULz9gF0K5AQXWevN1cVG3gnM9S6dKhubAMHjpM44gpB5gYKQHlB+TZ
	c/vD8ASGZJ/UbK00b931rQkcJNe3dqN6tsdRgn1fXMeHA+nDwOsbiyD20e868CtJc6v6
	e2kEEis3ZnBXI12Vg6Xgh+6YdPCUvjPuzFIuBkHiUP1b7dHCvdnKCf6Nn9gIFrswuZfh
	zxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=RkUZ/UY82oqu/uPLQst0kEkg/gH5vKgUQL2OuKBC4MU=;
	b=AFHjKt8QJ+YdpKN/mSxMlQaB34yPgFT4ZQ/y7ZuW0oKm8TFVKd7kuw1v+GQSdjo7aC
	wPfWXSUgM2AJ59MDdQ667RQOC0daNmxbTNG7SYSC36KDZgK7KQtLcaXtZUTkzKM7PNO4
	dtbYBOXsC0ckSQ0GGyiPOWczbvLvYgoQJ0DrLZgVjBeFrJH8JqVl2zRwvwePXkQ1A/w2
	v+jrFiFeNBq0KN52DVDfhDYsGloEgrQdtRe/d3Ny8G+P2UP8ibk8OFTECUpImgfeptL0
	ziFRe3NUY3ic3adS4uzysiwShQFMFDcrWXyFe7E1Jd+R4Dg46fVh32lmo/A6SNU20epf
	TvMw==
X-Gm-Message-State: AOPr4FUoYlgiDlY9fmk7fGxS2EvP9Eg2VBb6Il1Nje6KuJMyRcvAsyxHo2NQC7J7fwZyJw==
X-Received: by 10.66.250.132 with SMTP id zc4mr54993302pac.130.1462837825104; 
	Mon, 09 May 2016 16:50:25 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:1462:b3e2:90da:dbff?
	([2601:646:8800:5a9a:1462:b3e2:90da:dbff])
	by smtp.gmail.com with ESMTPSA id
	dr4sm43182707pac.11.2016.05.09.16.50.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2016 16:50:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1462837346-27095-2-git-send-email-stephano.cetola@linux.intel.com>
Date: Mon, 9 May 2016 16:50:37 -0700
Message-Id: <92C96566-57F7-4787-9158-9137CA80C077@gmail.com>
References: <1462837346-27095-1-git-send-email-stephano.cetola@linux.intel.com>
	<1462837346-27095-2-git-send-email-stephano.cetola@linux.intel.com>
To: Stephano Cetola <stephano.cetola@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] systemd: add sysusers config option to defaults
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
X-List-Received-Date: Mon, 09 May 2016 23:50:26 -0000
X-Groupsio-MsgNum: 81775
Content-Type: multipart/signed;
	boundary="Apple-Mail=_29FBFC31-629D-47D6-B1AF-BCD5D46B6A95";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_29FBFC31-629D-47D6-B1AF-BCD5D46B6A95
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 9, 2016, at 4:42 PM, Stephano Cetola =
<stephano.cetola@linux.intel.com> wrote:
>=20
> Without the sysusers config option, the build will not know which =
users
> need to be added for systemd. This is especially necessary if the
> filesystem is readonly, as these users cannot be added at runtime.
>=20
> Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> ---
> meta/recipes-core/systemd/systemd_229.bb | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_229.bb =
b/meta/recipes-core/systemd/systemd_229.bb
> index c23c749..aba73df 100644
> --- a/meta/recipes-core/systemd/systemd_229.bb
> +++ b/meta/recipes-core/systemd/systemd_229.bb
> @@ -23,6 +23,7 @@ DEPENDS =3D "kmod docbook-sgml-dtd-4.1-native =
intltool-native gperf-native acl rea
> SECTION =3D "base/shell"
>=20
> inherit useradd pkgconfig autotools perlnative update-rc.d =
update-alternatives qemu systemd ptest gettext bash-completion
> +USERADDEXTENSION +=3D " useradd-staticids"
>=20
> SRCREV =3D "714c62b46379abb7558c544665522aca91691e10"
>=20
> @@ -80,7 +81,8 @@ PACKAGECONFIG ??=3D "xz \
>                    quotacheck \
>                    bootchart \
>                    hostnamed \
> -                   ${@bb.utils.contains('TCLIBC', 'glibc', =
'myhostname sysusers', '', d)} \
> +                   sysusers \
> +                   ${@bb.utils.contains('TCLIBC', 'glibc', =
'myhostname', '', d)} \

sysusers did not compile with uclibc, did you test this patch with =
uclibc?

>                    hibernate \
>                    timedated \
>                    timesyncd \
> --
> 2.8.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_29FBFC31-629D-47D6-B1AF-BCD5D46B6A95
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcxIk4ACgkQuwUzVZGdMxQ0YACdEnM8rALZL6UFkAmsB8QsSI4X
XagAnjmLpIcjp1mgqiLYk87nB+bz7Tui
=V8S9
-----END PGP SIGNATURE-----

--Apple-Mail=_29FBFC31-629D-47D6-B1AF-BCD5D46B6A95--
