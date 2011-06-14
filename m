Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWWCH-0005lf-8R
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 18:10:33 +0200
Received: by wwi18 with SMTP id 18so3585509wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 09:07:08 -0700 (PDT)
Received: by 10.216.221.215 with SMTP id r65mr941326wep.73.1308067627984;
	Tue, 14 Jun 2011 09:07:07 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m8sm5143936wbh.11.2011.06.14.09.07.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 09:07:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <c4a7531b0361a57f7f4b2e4d92ae52b563ce0872.1307945310.git.raj.khem@gmail.com>
Date: Tue, 14 Jun 2011 18:07:04 +0200
Message-Id: <0B94ABA3-4644-41E5-8F1C-C168BF1A1C5B@dominion.thruhere.net>
References: <cover.1307945310.git.raj.khem@gmail.com>
	<c4a7531b0361a57f7f4b2e4d92ae52b563ce0872.1307945310.git.raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] eglibc 2.12/2.13: Upgrade SRCREV
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
X-List-Received-Date: Tue, 14 Jun 2011 16:10:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

It seems that this broke do_patch, could you have a look at it please?

Op 13 jun 2011, om 08:10 heeft Khem Raj het volgende geschreven:

> We need http://www.eglibc.org/archives/patches/msg00923.html
> to get through the problem we see when OPTION_EGLIBC_RTLD_DEBUG
> is disabled. This patch has been backported to both 2.12 and 2.13
> branches. We bump SRCREVs to have that change.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-core/eglibc/eglibc_2.12.bb |    2 +-
> meta/recipes-core/eglibc/eglibc_2.13.bb |    2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb =
b/meta/recipes-core/eglibc/eglibc_2.12.bb
> index e69cd0f..d851b5d 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.12.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
> @@ -4,7 +4,7 @@ DEPENDS +=3D "gperf-native"
> FILESPATHPKG =3D. "eglibc-svn:"
> PR =3D "r14"
>=20
> -SRCREV =3D "11982"
> +SRCREV =3D "14158"
>=20
> EGLIBC_BRANCH=3D"eglibc-2_12"
> SRC_URI =3D =
"svn://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRANCH};proto=3Dhttp=
 \
> diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb =
b/meta/recipes-core/eglibc/eglibc_2.13.bb
> index c77bf3c..9a9773c 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.13.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
> @@ -1,6 +1,6 @@
> require eglibc.inc
>=20
> -SRCREV =3D "13356"
> +SRCREV =3D "14157"
>=20
> DEPENDS +=3D "gperf-native"
> FILESPATHPKG =3D. "eglibc-svn:"
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



