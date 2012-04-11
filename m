Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHz9d-0005ec-2k
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 17:08:17 +0200
Received: by wibhm17 with SMTP id hm17so3814514wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 07:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=TJWOD5CtxK3EJp3ZNg62TKIat+JgcHaQsrI3mgTo5z0=;
	b=jvMuC91DiSJ/ri7I1y12iPRrNz19bmDSUA8hrjOS7HYkacwWJF/LehJ+9zLoPMOZMJ
	3wGYSOixJOvraKOvWAWfmIoLUpNTbZFuCZvPGWlAXhf8aQRSP9f+Id/dTYaGPhkYUor5
	U4PZBHZ7ewS0b1Mh8c92TZVZ5XMQO4RQcnNQsa1BympW5BWQMhGYKC4dSRtB5Md1Bf1O
	e8XzOjaaIHTM0T9t0UTv7Q21rmi43oAS7JkbTTCeq0xDYvYmt6ESpUin9bHuYss5J6k8
	s5epgV4EsMYWnP7sJAIWg0Jy9rVQRWfQW1KSOTYxlwKGGMmYnVIBzpGFgaBMvqycKMVc
	ML9w==
Received: by 10.180.89.9 with SMTP id bk9mr16917539wib.11.1334156338057;
	Wed, 11 Apr 2012 07:58:58 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id w10sm10445562wiy.3.2012.04.11.07.58.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 07:58:57 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1334156222-6701-1-git-send-email-andrei@gherzan.ro>
Date: Wed, 11 Apr 2012 16:58:53 +0200
Message-Id: <8E889F6C-9523-43CC-992A-AB6A73C2D937@dominion.thruhere.net>
References: <1334156222-6701-1-git-send-email-andrei@gherzan.ro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlc1TauDDjYEqXcBy9SXhOqIbEXIYe3eB6klFMMRlBDg1oSIPOgfK8sGIvvPfe25CjJDKD6
Subject: Re: [V3 1/1] gdbm: Package compat libs in gdbm-compat
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
X-List-Received-Date: Wed, 11 Apr 2012 15:08:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 apr. 2012, om 16:57 heeft Andrei Gherzan het volgende geschreven:

> In order to avoid breaking packages which depend on old package name =
libgdbm4 (>=3D 1.10),
> compat libs are packaged into a separate package named gdbm-compat.

You need to send a patch to bump PR on everything with gdbm in DEPENDS =
as well.

>=20
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
> meta/recipes-support/gdbm/gdbm_1.10.bb |    7 ++++++-
> 1 files changed, 6 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-support/gdbm/gdbm_1.10.bb =
b/meta/recipes-support/gdbm/gdbm_1.10.bb
> index 26b8009..6b68d27 100644
> --- a/meta/recipes-support/gdbm/gdbm_1.10.bb
> +++ b/meta/recipes-support/gdbm/gdbm_1.10.bb
> @@ -4,7 +4,7 @@ SECTION =3D "libs"
> LICENSE =3D "GPLv3"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D241da1b9fe42e642cbb2c24d5e0c4d24"
>=20
> -PR =3D "r2"
> +PR =3D "r3"
>=20
> SRC_URI =3D "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz"
>=20
> @@ -25,3 +25,8 @@ do_install_append () {
>     ln -sf ../ndbm.h ${D}/${includedir}/gdbm/ndbm.h
>     ln -sf ../gdbm.h ${D}/${includedir}/gdbm/gdbm.h
> }
> +
> +PACKAGES =3D+ "${PN}-compat \
> +            "
> +FILES_${PN}-compat =3D "${libdir}/libgdbm_compat${SOLIBS} \
> +                     "
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



