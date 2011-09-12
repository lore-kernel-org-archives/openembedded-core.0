Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R33vd-0003kL-0Z
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Sep 2011 12:39:53 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Sep 2011 03:34:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,367,1312182000"; d="scan'208";a="50306469"
Received: from unknown (HELO helios.localnet) ([10.252.120.92])
	by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2011 03:34:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2011 11:34:42 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <20110911172241.GA3674@chargestorm.se>
	<1315762415-18070-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1315762415-18070-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Message-Id: <201109121134.42474.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
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
X-List-Received-Date: Mon, 12 Sep 2011 10:39:53 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 11 September 2011 18:33:35 Eric B=C3=A9nard wrote:
> - 4.7.4 was release on the 1st of september, the changelog is available
> here :
> http://qt.gitorious.org/+qt-developers/qt/releases/blobs/v4.7.4/dist/chang
> es-4.7.4 and mostly contains bug fix.
>=20
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> ---
>  .../conf/distro/include/distro_tracking_fields.inc |   32
> ++++++++++---------- meta/recipes-qt/qt4/{qt-4.7.3.inc =3D> qt-4.7.4.inc}=
 |=20
>   4 +-
>  .../0001-Added-Openembedded-crossarch-option.patch |    0
>  .../recipes-qt/qt4/{qt-4.7.3 =3D> qt-4.7.4}/g++.conf |    0
>  .../hack-out-pg2-4.7.0.patch                       |    0
>  .../qt4/{qt-4.7.3 =3D> qt-4.7.4}/linux.conf          |    0
>  ...qt4-embedded_4.7.3.bb =3D> qt4-embedded_4.7.4.bb} |    0
>  .../{qt4-native_4.7.3.bb =3D> qt4-native_4.7.4.bb}   |    4 +-
>  meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb   |    8 -----
>  meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb   |    8 +++++
>  ...qt4-x11-free_4.7.3.bb =3D> qt4-x11-free_4.7.4.bb} |    0
>  11 files changed, 28 insertions(+), 28 deletions(-)
>  rename meta/recipes-qt/qt4/{qt-4.7.3.inc =3D> qt-4.7.4.inc} (93%)
>  rename meta/recipes-qt/qt4/{qt-4.7.3 =3D>
> qt-4.7.4}/0001-Added-Openembedded-crossarch-option.patch (100%) rename
> meta/recipes-qt/qt4/{qt-4.7.3 =3D> qt-4.7.4}/g++.conf (100%) rename
> meta/recipes-qt/qt4/{qt-4.7.3 =3D> qt-4.7.4}/hack-out-pg2-4.7.0.patch (10=
0%)
> rename meta/recipes-qt/qt4/{qt-4.7.3 =3D> qt-4.7.4}/linux.conf (100%) ren=
ame
> meta/recipes-qt/qt4/{qt4-embedded_4.7.3.bb =3D> qt4-embedded_4.7.4.bb}
> (100%) rename meta/recipes-qt/qt4/{qt4-native_4.7.3.bb =3D>
> qt4-native_4.7.4.bb} (67%) delete mode 100644
> meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb create mode 100644
> meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb rename
> meta/recipes-qt/qt4/{qt4-x11-free_4.7.3.bb =3D> qt4-x11-free_4.7.4.bb}
> (100%)
>=20
> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc
> b/meta/conf/distro/include/distro_tracking_fields.inc index
> 6f1a462..599406b 100644
> --- a/meta/conf/distro/include/distro_tracking_fields.inc
> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> @@ -3406,32 +3406,32 @@ RECIPE_LAST_UPDATE_pn-imake =3D "Nov 21, 2010"
>  RECIPE_MAINTAINER_pn-imake =3D "Yu Ke <ke.yu@intel.com>"
>=20
>  RECIPE_STATUS_pn-qt4-tools-native =3D "green" # no update needed
> -RECIPE_LATEST_VERSION_pn-qt4-tools-native =3D "4.7.3"
> -RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-native =3D "2 months"
> -RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-native =3D "2011/05/04"
> -RECIPE_LAST_UPDATE_pn-qt4-tools-native =3D "May 12, 2011"
> +RECIPE_LATEST_VERSION_pn-qt4-tools-native =3D "4.7.4"
> +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-native =3D "4 months"
> +RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-native =3D "2011/09/01"
> +RECIPE_LAST_UPDATE_pn-qt4-tools-native =3D "September 10, 2011"
>  RECIPE_MAINTAINER_pn-qt4-tools-native =3D "Paul Eggleton
> <paul.eggleton@linux.intel.com>" DISTRO_PN_ALIAS_pn-qt4-tools-native =3D
> "Mandriva=3Dlibqt4-devel Ubuntu=3Dlibqt4-dev"
>=20
>  RECIPE_STATUS_pn-qt4-tools-nativesdk =3D "green"
> -RECIPE_LATEST_VERSION_pn-qt4-tools-nativesdk =3D "4.7.3"
> -RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-nativesdk =3D "2 mont=
hs"
> -RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-nativesdk =3D "2011/05/04"
> -RECIPE_LAST_UPDATE_pn-qt4-tools-nativesdk =3D "May 12, 2011"
> +RECIPE_LATEST_VERSION_pn-qt4-tools-nativesdk =3D "4.7.4"
> +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-nativesdk =3D "4 mont=
hs"
> +RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-nativesdk =3D "2011/09/01"
> +RECIPE_LAST_UPDATE_pn-qt4-tools-nativesdk =3D "September 10, 2011"
>  RECIPE_MAINTAINER_pn-qt4-tools-nativesdk =3D "Paul Eggleton
> <paul.eggleton@linux.intel.com>"
>=20
>  RECIPE_STATUS_pn-qt4-embedded =3D "green"
> -RECIPE_LATEST_VERSION_pn-qt4-embedded =3D "4.7.3"
> -RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-embedded =3D "2 months"
> -RECIPE_LATEST_RELEASE_DATE_pn-qt4-embedded =3D "2011/05/04"
> -RECIPE_LAST_UPDATE_pn-qt4-embedded =3D "May 12, 2011"
> +RECIPE_LATEST_VERSION_pn-qt4-embedded =3D "4.7.4"
> +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-embedded =3D "4 months"
> +RECIPE_LATEST_RELEASE_DATE_pn-qt4-embedded =3D "2011/09/01"
> +RECIPE_LAST_UPDATE_pn-qt4-embedded =3D "September 10, 2011"
>  RECIPE_MAINTAINER_pn-qt4-embedded =3D "Paul Eggleton
> <paul.eggleton@linux.intel.com>"
>=20
>  RECIPE_STATUS_pn-qt4-x11-free =3D "green"
> -RECIPE_LATEST_VERSION_pn-qt4-x11-free =3D "4.7.3"
> -RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-x11-free =3D "2 months"
> -RECIPE_LATEST_RELEASE_DATE_pn-qt4-x11-free =3D "2011/05/04"
> -RECIPE_LAST_UPDATE_pn-qt4-x11-free =3D "May 12, 2011"
> +RECIPE_LATEST_VERSION_pn-qt4-x11-free =3D "4.7.4"
> +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-x11-free =3D "4 months"
> +RECIPE_LATEST_RELEASE_DATE_pn-qt4-x11-free =3D "2011/09/01"
> +RECIPE_LAST_UPDATE_pn-qt4-x11-free =3D "September 10, 2011"
>  RECIPE_MAINTAINER_pn-qt4-x11-free =3D "Paul Eggleton
> <paul.eggleton@linux.intel.com" DISTRO_PN_ALIAS_pn-qt4-x11-free =3D
> "Ubuntu=3Dqt-x11-free Debian=3Dqt-x11-free"
>=20
> diff --git a/meta/recipes-qt/qt4/qt-4.7.3.inc
> b/meta/recipes-qt/qt4/qt-4.7.4.inc similarity index 93%
> rename from meta/recipes-qt/qt4/qt-4.7.3.inc
> rename to meta/recipes-qt/qt4/qt-4.7.4.inc
> index a5b8b05..ac5da9f 100644
> --- a/meta/recipes-qt/qt4/qt-4.7.3.inc
> +++ b/meta/recipes-qt/qt4/qt-4.7.4.inc
> @@ -17,8 +17,8 @@ SRC_URI =3D
> "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
> file://linux.conf \
>             "
>=20
> -SRC_URI[md5sum] =3D "49b96eefb1224cc529af6fe5608654fe"
> -SRC_URI[sha256sum] =3D
> "d02b6fd69d089c01f4a787aa18175d074ccaecf8980a5956e328c2991905937e"
> +SRC_URI[md5sum] =3D "ddf7d83f912cf1283aa066368464fa22"
> +SRC_URI[sha256sum] =3D
> "321247297648eebd4f1d0195addf51eeb9f1dcf538a78bf3c67d11dadbc40faf"
>=20
>  S =3D "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
>=20
> diff --git
> a/meta/recipes-qt/qt4/qt-4.7.3/0001-Added-Openembedded-crossarch-option.pa
> tch
> b/meta/recipes-qt/qt4/qt-4.7.4/0001-Added-Openembedded-crossarch-option.pa
> tch similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt-4.7.3/0001-Added-Openembedded-crossarch-option.patc
> h rename to
> meta/recipes-qt/qt4/qt-4.7.4/0001-Added-Openembedded-crossarch-option.patc
> h diff --git a/meta/recipes-qt/qt4/qt-4.7.3/g++.conf
> b/meta/recipes-qt/qt4/qt-4.7.4/g++.conf similarity index 100%
> rename from meta/recipes-qt/qt4/qt-4.7.3/g++.conf
> rename to meta/recipes-qt/qt4/qt-4.7.4/g++.conf
> diff --git a/meta/recipes-qt/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch
> b/meta/recipes-qt/qt4/qt-4.7.4/hack-out-pg2-4.7.0.patch similarity index
> 100%
> rename from meta/recipes-qt/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch
> rename to meta/recipes-qt/qt4/qt-4.7.4/hack-out-pg2-4.7.0.patch
> diff --git a/meta/recipes-qt/qt4/qt-4.7.3/linux.conf
> b/meta/recipes-qt/qt4/qt-4.7.4/linux.conf similarity index 100%
> rename from meta/recipes-qt/qt4/qt-4.7.3/linux.conf
> rename to meta/recipes-qt/qt4/qt-4.7.4/linux.conf
> diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb
> b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb similarity index 100%
> rename from meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb
> rename to meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
> diff --git a/meta/recipes-qt/qt4/qt4-native_4.7.3.bb
> b/meta/recipes-qt/qt4/qt4-native_4.7.4.bb similarity index 67%
> rename from meta/recipes-qt/qt4/qt4-native_4.7.3.bb
> rename to meta/recipes-qt/qt4/qt4-native_4.7.4.bb
> index e90a7ba..ffa5f2a 100644
> --- a/meta/recipes-qt/qt4/qt4-native_4.7.3.bb
> +++ b/meta/recipes-qt/qt4/qt4-native_4.7.4.bb
> @@ -11,5 +11,5 @@ EXTRA_OECONF +=3D " -no-fast -silent -no-rpath"
>=20
>  TOBUILD :=3D "src/tools/bootstrap ${TOBUILD}"
>=20
> -SRC_URI[md5sum] =3D "49b96eefb1224cc529af6fe5608654fe"
> -SRC_URI[sha256sum] =3D
> "d02b6fd69d089c01f4a787aa18175d074ccaecf8980a5956e328c2991905937e"
> +SRC_URI[md5sum] =3D "ddf7d83f912cf1283aa066368464fa22"
> +SRC_URI[sha256sum] =3D
> "321247297648eebd4f1d0195addf51eeb9f1dcf538a78bf3c67d11dadbc40faf" diff
> --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb
> b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb deleted file mode
> 100644
> index e2a4539..0000000
> --- a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require qt4-tools-nativesdk.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI +=3D "file://blacklist-diginotar-certs.diff"
> -
> -SRC_URI[md5sum] =3D "49b96eefb1224cc529af6fe5608654fe"
> -SRC_URI[sha256sum] =3D
> "d02b6fd69d089c01f4a787aa18175d074ccaecf8980a5956e328c2991905937e" diff
> --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
> b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb new file mode 100644
> index 0000000..9d95eeb
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
> @@ -0,0 +1,8 @@
> +require qt4-tools-nativesdk.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI +=3D "file://blacklist-diginotar-certs.diff"
> +
> +SRC_URI[md5sum] =3D "ddf7d83f912cf1283aa066368464fa22"
> +SRC_URI[sha256sum] =3D
> "321247297648eebd4f1d0195addf51eeb9f1dcf538a78bf3c67d11dadbc40faf" diff
> --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb
> b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb similarity index 100%
> rename from meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb
> rename to meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb

Thanks Eric, tested OK.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

=2D-=20

Paul Eggleton
Intel Open Source Technology Centre


