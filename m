Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgImt-0003VG-1e
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 17:52:47 +0200
Received: by wyg30 with SMTP id 30so3068168wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 08:48:51 -0700 (PDT)
Received: by 10.227.158.21 with SMTP id d21mr4358677wbx.26.1310399330574;
	Mon, 11 Jul 2011 08:48:50 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id e11sm7922846wbh.2.2011.07.11.08.48.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jul 2011 08:48:49 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1310399223.20015.967.camel@rex>
Date: Mon, 11 Jul 2011 17:48:43 +0200
Message-Id: <47D9CE90-7C60-4233-9370-5734E841D8A0@dominion.thruhere.net>
References: <1310399223.20015.967.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] sysklogd: Drop ONLINE_PACKAGE_MANAGEMENT as per mailing list discussion
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
X-List-Received-Date: Mon, 11 Jul 2011 15:52:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 jul 2011, om 17:47 heeft Richard Purdie het volgende geschreven:

> Online package management decisions like this are now handled by =
image.bbclass
> itself so this code is superfluous to requirements.

That's missing a PR bump :)

>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> meta/recipes-extended/sysklogd/sysklogd.inc |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc =
b/meta/recipes-extended/sysklogd/sysklogd.inc
> index f2b1c15..891dd3b 100644
> --- a/meta/recipes-extended/sysklogd/sysklogd.inc
> +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c28b \
> # syslog initscript is handled explicitly because order of
> # update-rc.d and update-alternatives is important (see below)
> DEPENDS_append =3D " update-rc.d update-rc.d-native"
> -RDEPENDS_${PN}_append =3D " =
${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", =
"update-rc.d", d)}"
> +RDEPENDS_${PN}_append =3D " update-rc.d"
>=20
> SRC_URI =3D =
"http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar.gz =
\
>            file://no-strip-install.patch \
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



