Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Swa8x-0003bj-P3
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 16:43:24 +0200
Received: by bkcik5 with SMTP id ik5so3028233bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 07:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NBmULP5BJUd42N/E3+AL4emOiK8H0b0xkMJ8Tl9gScI=;
	b=CekEiCbhdoOHRBeuWCd7Uzj3bT3s4LfLBFQtGE39l4hgiVR07TLVV4HRpnSNjrIAEL
	2x2GKyEtrwDG8jywZikvyzIA7/5+uo7I5w6uNYXUBX5+Bpn7ZwK90M08n8a8HkRf8rlv
	7WjT5c8+4dOIn7bBUp/25C8eEHMjtYIpNEs0vvzJSNMGEUxqfAM8YeZ9Nj3YFcE0Uhcr
	kJ386z8QMyBN4lbN7mcR0dlZhL7VrdNYdfK92Ko1Ftoo4E/XQXZixmw1n/tXjlEfTUvq
	MMNcmYAeTkYsjsfAsGwaJPIHXdV/SE2lgVBwwt6tQx/qdZxLY5QVQSpyZeGj3EQUYjIZ
	98Sw==
Received: by 10.204.155.146 with SMTP id s18mr6961040bkw.23.1343831505216;
	Wed, 01 Aug 2012 07:31:45 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g6sm1882107bkg.2.2012.08.01.07.31.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 07:31:44 -0700 (PDT)
Date: Wed, 1 Aug 2012 16:31:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120801143141.GJ16306@jama.jama.net>
References: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: This is a series of patches to update recipes that display warnings about the
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
X-List-Received-Date: Wed, 01 Aug 2012 14:43:24 -0000
X-Groupsio-MsgNum: 26666
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fjX3cMESU3XgGmZ"
Content-Disposition: inline

--2fjX3cMESU3XgGmZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2012 at 10:12:01AM -0400, Morgan Little wrote:
> I compared the environment variables to make sure that they expanded out =
to
> the same variables so nothing should be changed during runtime.=20
>=20
> The following changes since commit 4029ce1a15e1dbd374444ee77ccf2a915e463b=
7b:
>   Khem Raj (1):
>         package_rpm.bbclass: Accomodate dash when using arrays

Is this complimentary to Saul's?
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dsgw/update-a=
lternatives

Looks like there is some overlap..

Cheers?
>=20

> are available in the git repository at:
>=20
>   git@github.com:morganlittle/oe-core.git updatealternativesfixes
>=20
> Morgan Little (19):
>       tinylogin: use new update-alternatives
>       patch: use new update-alternatives
>       ubootchart_svn: use new update-alternatives
>       gawk: use new update-alternatives
>       less: use new update-alternatives
>       mingetty: use new update-alternatives
>       mktemp: use new update-alternatives
>       msmtp: use new update-alternatives
>       sed: use new update-alternatives
>       time: use new update-alternatives
>       wget: use new update-alternatives
>       which: use new update-alternatives
>       metacity: use new update-alternatives
>       matchbox-session: use new update-alternatives
>       matchbox-wm-2: use new update-alternatives
>       mini-x-session: use new update-alternatives
>       mutter: use new update-alternatives
>       powertop: use new update-alternatives
>       rxvt-unicode: use new update-alternatives
>=20
>  meta/recipes-core/tinylogin/tinylogin_1.4.bb       |    8 ++++----
>  meta/recipes-devtools/patch/patch.inc              |    4 ++--
>  meta/recipes-devtools/ubootchart/ubootchart_svn.bb |    8 ++++----
>  meta/recipes-extended/gawk/gawk_3.1.5.bb           |    8 ++++----
>  meta/recipes-extended/gawk/gawk_4.0.1.bb           |    8 ++++----
>  meta/recipes-extended/less/less_444.bb             |    6 +++---
>  meta/recipes-extended/mingetty/mingetty_1.08.bb    |    8 ++++----
>  meta/recipes-extended/mktemp/mktemp_1.7.bb         |    8 ++++----
>  meta/recipes-extended/msmtp/msmtp_1.4.24.bb        |    8 ++++----
>  meta/recipes-extended/sed/sed_4.1.2.bb             |    8 ++++----
>  meta/recipes-extended/sed/sed_4.2.1.bb             |    8 ++++----
>  meta/recipes-extended/time/time.inc                |    6 +++---
>  meta/recipes-extended/wget/wget.inc                |    8 ++++----
>  meta/recipes-extended/which/which_2.18.bb          |    6 +++---
>  meta/recipes-extended/which/which_2.20.bb          |    6 +++---
>  meta/recipes-gnome/gnome/metacity_2.30.3.bb        |    8 ++++----
>  .../matchbox-session/matchbox-session_0.1.bb       |    8 ++++----
>  .../matchbox-wm-2/matchbox-wm-2_git.bb             |    8 ++++----
>  .../mini-x-session/mini-x-session_0.1.bb           |    8 ++++----
>  meta/recipes-graphics/mutter/mutter.inc            |    6 +++---
>  meta/recipes-kernel/powertop/powertop_1.13.bb      |    8 ++++----
>  .../recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb |    7 ++++---
>  22 files changed, 81 insertions(+), 80 deletions(-)
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2fjX3cMESU3XgGmZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAZPc0ACgkQN1Ujt2V2gBzThgCfTk+9tKRJ5xmH6dJbzExeAaA6
oNgAnAyh7542Ofy+xigVE6rdYOyd+XJP
=urwa
-----END PGP SIGNATURE-----

--2fjX3cMESU3XgGmZ--
