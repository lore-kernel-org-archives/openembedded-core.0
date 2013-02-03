Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yanglei.fage@gmail.com>) id 1U1pMh-0007kp-EV
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Feb 2013 03:31:32 +0100
Received: by mail-pb0-f43.google.com with SMTP id jt11so2683658pbb.30
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Feb 2013 18:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:x-mailer:from:subject:date
	:to; bh=bsJKNysDfZY7OdouJLZ0c/mDKXGIahQbfaeTuC0Y5NA=;
	b=vyLdolyu5YR6OZuGf59T9JpMLjCohtCFVzIOef5HR3CFqq8huMUZnbEXbGYpAdLf+Q
	qiIj4a3+PXpFDKPvliv/zcVFMeypYRYqtIHsrwbnNFCSoczFaf5ZsrY7kTL2Y/gVcckt
	IY0RrvRYY5oILrsoWrQ7THoTIS1HyHFNhO7HClwbVvRGTdN0XDZaOK/kfLX3h1qKfg2/
	rxClS6bCZ9tiGvQOh0nphJxL9jnNayQ17OtxDzx5O3Pro/qXhXR151wVexq4w4UOywsn
	1Vyv+OABEw6GmBMOfYwesfa2BdKyqR3WwNG6PsGarNQsptDpaRhyECW7QMAE2RuWV9Aw
	mqIQ==
X-Received: by 10.66.82.198 with SMTP id k6mr41257319pay.53.1359857744572;
	Sat, 02 Feb 2013 18:15:44 -0800 (PST)
Received: from [10.6.7.71] ([61.148.243.74])
	by mx.google.com with ESMTPS id m3sm14179704pav.4.2013.02.02.18.15.16
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 02 Feb 2013 18:15:43 -0800 (PST)
References: <1359731346-16190-1-git-send-email-cristian.iorga@intel.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <1359731346-16190-1-git-send-email-cristian.iorga@intel.com>
Message-Id: <258C02DC-9331-432A-93B2-4173DA69968D@gmail.com>
X-Mailer: iPhone Mail (10B144)
From: Lei Yang <yanglei.fage@gmail.com>
Date: Sun, 3 Feb 2013 10:14:58 +0800
To: Cristian Iorga <cristian.iorga@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] net-tools: upgrade to v1.60-24.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Feb 2013 02:31:35 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On 2013-2-1, at 23:09, Cristian Iorga <cristian.iorga@intel.com> wrote:

> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
> .../net-tools-config.h                                           |    0
> .../net-tools-config.make                                        |    0
> .../net-tools/{net-tools_1.60-23.bb =3D> net-tools_1.60-24.2.bb}   |    =
6 +++---
> 3 files changed, 3 insertions(+), 3 deletions(-)
> rename meta/recipes-extended/net-tools/{net-tools-1.60-23 =3D> net-tools=
-1.60-24.2}/net-tools-config.h (100%)
> rename meta/recipes-extended/net-tools/{net-tools-1.60-23 =3D> net-tools=
-1.60-24.2}/net-tools-config.make (100%)
> rename meta/recipes-extended/net-tools/{net-tools_1.60-23.bb =3D> net-to=
ols_1.60-24.2.bb} (94%)
>=20
> diff --git a/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools=
-config.h b/meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-c=
onfig.h
> similarity index 100%
> rename from meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-=
config.h
> rename to meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-=
config.h
> diff --git a/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools=
-config.make b/meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tool=
s-config.make
> similarity index 100%
> rename from meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-=
config.make
> rename to meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-=
config.make
> diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb b/meta=
/recipes-extended/net-tools/net-tools_1.60-24.2.bb
> similarity index 94%
> rename from meta/recipes-extended/net-tools/net-tools_1.60-23.bb
> rename to meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb
> index bc61d21..4040e1a 100644
> --- a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
> +++ b/meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb
> @@ -5,7 +5,7 @@ BUGTRACKER =3D "http://bugs.debian.org/net-tools"
> LICENSE =3D "GPLv2+"
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c=
28b \
>                     file://ifconfig.c;beginline=3D11;endline=3D15;md5=3D=
d1ca372080ad5401e23ca0afc35cf9ba"
> -PR =3D "r3"
> +PR =3D "r0"
>=20

Is there a reason to change it back to r0


Lei

> SRC_URI =3D "${DEBIAN_MIRROR}/main/n/net-tools/net-tools_1.60.orig.tar.g=
z;name=3Dtarball \
>            ${DEBIAN_MIRROR}/main/n/net-tools/${BPN}_${PV}.diff.gz;apply=
=3Dno;name=3Dpatch \

Not sure why it not apply but not remove it.

Lei

> @@ -17,8 +17,8 @@ S =3D "${WORKDIR}/net-tools-1.60"
> SRC_URI[tarball.md5sum] =3D "ecaf37acb5b5daff4bdda77785fd916d"
> SRC_URI[tarball.sha256sum] =3D "ec67967cf7b1a3a3828a84762fbc013ac50ee5dc=
9aa3095d5c591f302c2de0f5"
>=20
> -SRC_URI[patch.md5sum] =3D "2412e55c20308d5fbd28bfadd18c075f"
> -SRC_URI[patch.sha256sum] =3D "d678b3ea97d6c7ca548918994642bfc6b5511ab02=
f3a5881dfcca00c88bfd73b"
> +SRC_URI[patch.md5sum] =3D "524658bb8df5ff92c4a991f5edcaf240"
> +SRC_URI[patch.sha256sum] =3D "170cc024fcb34329f4c25fd88b5f160a06be5d6d3=
eaf0bc976650fd1b1a6235d"
>=20
> inherit gettext
>=20
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


