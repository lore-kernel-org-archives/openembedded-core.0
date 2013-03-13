Received: from mail-da0-f44.google.com ([209.85.210.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UFc0g-0003yg-3I
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 04:05:49 +0100
Received: by mail-da0-f44.google.com with SMTP id z20so202631dae.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 19:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=LvNUBfJ5I1PLi2fLD6r0mYWgYV/AR3SZwVa+0BnQ+A4=;
	b=qQQKqDSNnUNQ3K+fLMl5mlYTf+VyPt9Xveke/pTekJ72hbCenohyT6vDh9/XzOFcEd
	D77yj7/yb2IAvrA+0CVyYhumoWLhpy0uwJYssQnLYh8rGJYQYfBzc2DjsfkK1yfvm4mh
	77jKgc//YEbio2sXjDD9Fnq5KsWK4fP7GjdwpRfiCVh4DIl4xgDrM1p8KCvYfKMae1kr
	t8bGEeJko8EmCpRQTiNpKfTBu6BtH6R+YgDRKhHla4Q5srh/xLeKZGlQbZh/jT3wYNLN
	bZv8fQI7DCSJfH2KZU32EQJjouomZQpfTFLIMnUo4WwF2ytpQzWtKDJ4h2eGc8RLes8A
	zF8A==
X-Received: by 10.68.213.193 with SMTP id nu1mr28205002pbc.178.1363142944950; 
	Tue, 12 Mar 2013 19:49:04 -0700 (PDT)
Received: from [172.23.7.5] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id d7sm26638968pbh.45.2013.03.12.19.49.03
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Mar 2013 19:49:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1363141570-24309-1-git-send-email-jslater@windriver.com>
Date: Tue, 12 Mar 2013 19:49:02 -0700
Message-Id: <2AF4D7CB-3366-4CE9-8865-89611E1BBCDB@gmail.com>
References: <1363141570-24309-1-git-send-email-jslater@windriver.com>
To: Joe Slater <jslater@windriver.com>
X-Mailer: Apple Mail (2.1499)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH [v2]] tzcode & tzdata: update to 2013a versions
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
X-List-Received-Date: Wed, 13 Mar 2013 03:05:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 12, 2013, at 7:26 PM, Joe Slater <jslater@windriver.com> wrote:

> Update tzcode and tzdata recipes for 2013a timezone
> data.
>=20
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
> .../recipes-extended/tzcode/tzcode-native_2012j.bb |   24 --
> .../recipes-extended/tzcode/tzcode-native_2013a.bb |   26 +++
> meta/recipes-extended/tzdata/tzdata_2012j.bb       |  207 =
------------------
> meta/recipes-extended/tzdata/tzdata_2013a.bb       |  227 =
++++++++++++++++++++

2013b is out so while you are at it lets update to 2013b

> 4 files changed, 253 insertions(+), 231 deletions(-)
> delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2012j.bb
> create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2013a.bb
> delete mode 100644 meta/recipes-extended/tzdata/tzdata_2012j.bb
> create mode 100644 meta/recipes-extended/tzdata/tzdata_2013a.bb
>=20
> diff --git a/meta/recipes-extended/tzcode/tzcode-native_2012j.bb =
b/meta/recipes-extended/tzcode/tzcode-native_2012j.bb
> deleted file mode 100644
> index 938f072..0000000
> --- a/meta/recipes-extended/tzcode/tzcode-native_2012j.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -DESCRIPTION =3D "tzcode, timezone zoneinfo utils -- zic, zdump, =
tzselect"
> -LICENSE =3D "PD"
> -PR =3D "r1"
> -
> -LIC_FILES_CHKSUM =3D =
"file://${WORKDIR}/README;md5=3Dd7a19b8c6d8a28785c4cd04ff2e46d27"
> -
> -SRC_URI =3D" =
ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=3Dtzcode \
> -           =
ftp://ftp.iana.org/tz/releases/tzdata2012j.tar.gz;name=3Dtzdata"
> -
> -SRC_URI[tzcode.md5sum] =3D "868b5d0dbf0e115ae4eb39a932ad0c4c"
> -SRC_URI[tzcode.sha256sum] =3D =
"ee4361b3b4ae201a270857c84d0f063c2a2191b3e4cd7414ea4622bb8bae9a82"
> -SRC_URI[tzdata.md5sum] =3D "ba2f92ae7ad099090e8f86cff2f2d799"
> -SRC_URI[tzdata.sha256sum] =3D =
"4b6a3c2831bdbb68ab1a1bf906bcf11d18ab78009713a0339da6fe96b6afceaa"
> -
> -S =3D "${WORKDIR}"
> -
> -inherit native
> -
> -do_install () {
> -        install -d ${D}${bindir}/
> -        install -m 755 zic ${D}${bindir}/
> -        install -m 755 zdump ${D}${bindir}/
> -        install -m 755 tzselect ${D}${bindir}/
> -}
> diff --git a/meta/recipes-extended/tzcode/tzcode-native_2013a.bb =
b/meta/recipes-extended/tzcode/tzcode-native_2013a.bb
> new file mode 100644
> index 0000000..3047fef
> --- /dev/null
> +++ b/meta/recipes-extended/tzcode/tzcode-native_2013a.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION =3D "tzcode, timezone zoneinfo utils -- zic, zdump, =
tzselect"
> +LICENSE =3D "PD"
> +PR =3D "r1"
> +
> +LIC_FILES_CHKSUM =3D =
"file://${WORKDIR}/README;md5=3Dd7a19b8c6d8a28785c4cd04ff2e46d27"
> +
> +# note that we allow for us to use data later than our code version
> +#
> +SRC_URI =3D" =
ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=3Dtzcode \
> +           =
ftp://ftp.iana.org/tz/releases/tzdata2013a.tar.gz;name=3Dtzdata"
> +
> +SRC_URI[tzcode.md5sum] =3D "5c5a640666fb3896af9eb4a52a01e264"
> +SRC_URI[tzcode.sha256sum] =3D =
"c2be9f6c0449df21308df1ab17bfd88e7d0652961b0dcbc768c2829cab6331bc"
> +SRC_URI[tzdata.md5sum] =3D "2a9b3208ed91652dd554e4d104662e67"
> +SRC_URI[tzdata.sha256sum] =3D =
"ed9f273f52d5df9ec09fdcf6684176bbdc86d0fbafcbc27b97e5a9c103024afc"
> +
> +S =3D "${WORKDIR}"
> +
> +inherit native
> +
> +do_install () {
> +        install -d ${D}${bindir}/
> +        install -m 755 zic ${D}${bindir}/
> +        install -m 755 zdump ${D}${bindir}/
> +        install -m 755 tzselect ${D}${bindir}/
> +}
> diff --git a/meta/recipes-extended/tzdata/tzdata_2012j.bb =
b/meta/recipes-extended/tzdata/tzdata_2012j.bb
> deleted file mode 100644
> index 25220cc..0000000
> --- a/meta/recipes-extended/tzdata/tzdata_2012j.bb
> +++ /dev/null
> @@ -1,207 +0,0 @@
> -DESCRIPTION =3D "Timezone data"
> -HOMEPAGE =3D "ftp://elsie.nci.nih.gov/pub/"
> -SECTION =3D "base"
> -LICENSE =3D "PD"
> -LIC_FILES_CHKSUM =3D =
"file://asia;beginline=3D2;endline=3D3;md5=3D06468c0e84ef4d4c97045a4a29b08=
234"
> -DEPENDS =3D "tzcode-native"
> -
> -PR =3D "r3"
> -
> -inherit allarch
> -
> -RCONFLICTS_${PN} =3D "timezones timezone-africa timezone-america =
timezone-antarctica \
> -             timezone-arctic timezone-asia timezone-atlantic \
> -             timezone-australia timezone-europe timezone-indian \
> -             timezone-iso3166.tab timezone-pacific timezone-zone.tab"
> -
> -SRC_URI =3D =
"ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=3Dtzdata"
> -
> -SRC_URI[tzdata.md5sum] =3D "ba2f92ae7ad099090e8f86cff2f2d799"
> -SRC_URI[tzdata.sha256sum] =3D =
"4b6a3c2831bdbb68ab1a1bf906bcf11d18ab78009713a0339da6fe96b6afceaa"
> -
> -S =3D "${WORKDIR}"
> -
> -DEFAULT_TIMEZONE ?=3D "Universal"
> -
> -TZONES=3D "africa antarctica asia australasia europe northamerica =
southamerica  \
> -         factory solar87 solar88 solar89 etcetera backward systemv \
> -        "
> -# pacificnew=20
> -
> -do_compile () {
> -        for zone in ${TZONES}; do \
> -            ${STAGING_BINDIR_NATIVE}/zic -d =
${WORKDIR}${datadir}/zoneinfo -L /dev/null \
> -                -y ${S}/yearistype.sh ${S}/${zone} ; \
> -            ${STAGING_BINDIR_NATIVE}/zic -d =
${WORKDIR}${datadir}/zoneinfo/posix -L /dev/null \
> -                -y ${S}/yearistype.sh ${S}/${zone} ; \
> -            ${STAGING_BINDIR_NATIVE}/zic -d =
${WORKDIR}${datadir}/zoneinfo/right -L ${S}/leapseconds \
> -                -y ${S}/yearistype.sh ${S}/${zone} ; \
> -        done
> -}
> -
> -do_install () {
> -        install -d ${D}/$exec_prefix ${D}${datadir}/zoneinfo
> -        cp -pPR ${S}/$exec_prefix ${D}/
> -        # libc is removing zoneinfo files from package
> -        cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
> -        cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
> -
> -        # Install default timezone
> -        if [ -e ${D}${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ]; then
> -            install -d ${D}${sysconfdir}
> -            echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
> -            ln -s ${datadir}/zoneinfo/${DEFAULT_TIMEZONE} =
${D}${sysconfdir}/localtime
> -        else
> -            bberror "DEFAULT_TIMEZONE is set to an invalid value."
> -            exit 1
> -        fi
> -
> -        chown -R root:root ${D}
> -}
> -
> -pkg_postinst_${PN} () {
> -	etc_lt=3D"$D${sysconfdir}/localtime"
> -	src=3D"$D${sysconfdir}/timezone"
> -
> -	if [ -e ${src} ] ; then
> -		tz=3D$(sed -e 's:#.*::' -e 's:[[:space:]]*::g' -e =
'/^$/d' "${src}")
> -	fi
> -=09
> -	if [ -z ${tz} ] ; then
> -		return 0
> -	fi
> -=09
> -	if [ ! -e "$D${datadir}/zoneinfo/${tz}" ] ; then
> -		echo "You have an invalid TIMEZONE setting in ${src}"
> -		echo "Your ${etc_lt} has been reset to Universal; =
enjoy!"
> -		tz=3D"Universal"
> -		echo "Updating ${etc_lt} with =
$D${datadir}/zoneinfo/${tz}"
> -		if [ -L ${etc_lt} ] ; then
> -			rm -f "${etc_lt}"
> -		fi
> -		ln -s "${datadir}/zoneinfo/${tz}" "${etc_lt}"
> -	fi
> -}
> -
> -# Packages primarily organized by directory with a major city
> -# in most time zones in the base package
> -
> -PACKAGES =3D "tzdata tzdata-misc tzdata-posix tzdata-right =
tzdata-africa \
> -    tzdata-americas tzdata-antarctica tzdata-arctic tzdata-asia \
> -    tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific"
> -
> -FILES_tzdata-africa +=3D "${datadir}/zoneinfo/Africa/*"
> -RPROVIDES_tzdata-africa =3D "tzdata-africa"
> -
> -FILES_tzdata-americas +=3D "${datadir}/zoneinfo/America/*  \
> -                ${datadir}/zoneinfo/US/*                \
> -                ${datadir}/zoneinfo/Brazil/*            \
> -                ${datadir}/zoneinfo/Canada/*            \
> -                ${datadir}/zoneinfo/Mexico/*            \
> -                ${datadir}/zoneinfo/Chile/*"
> -RPROVIDES_tzdata-americas =3D "tzdata-americas"
> -
> -FILES_tzdata-antarctica +=3D "${datadir}/zoneinfo/Antarctica/*"
> -RPROVIDES_tzdata-antarctica =3D "tzdata-antarctica"
> -
> -FILES_tzdata-arctic +=3D "${datadir}/zoneinfo/Arctic/*"
> -RPROVIDES_tzdata-arctic =3D "tzdata-arctic"
> -
> -FILES_tzdata-asia +=3D "${datadir}/zoneinfo/Asia/*        \
> -                ${datadir}/zoneinfo/Indian/*            \
> -                ${datadir}/zoneinfo/Mideast/*"
> -RPROVIDES_tzdata-asia =3D "tzdata-asia"
> -
> -FILES_tzdata-atlantic +=3D "${datadir}/zoneinfo/Atlantic/*"
> -RPROVIDES_tzdata-atlantic =3D "tzdata-atlantic"
> -
> -FILES_tzdata-australia +=3D "${datadir}/zoneinfo/Australia/*"
> -RPROVIDES_tzdata-australia =3D "tzdata-australia"
> -
> -FILES_tzdata-europe +=3D "${datadir}/zoneinfo/Europe/*"
> -RPROVIDES_tzdata-europe =3D "tzdata-europe"
> -
> -FILES_tzdata-pacific +=3D "${datadir}/zoneinfo/Pacific/*"
> -RPROVIDES_tzdata-pacific =3D "tzdata-pacific"
> -
> -FILES_tzdata-posix +=3D "${datadir}/zoneinfo/posix/*"
> -RPROVIDES_tzdata-posix =3D "tzdata-posix"
> -
> -FILES_tzdata-right +=3D "${datadir}/zoneinfo/right/*"
> -RPROVIDES_tzdata-right =3D "tzdata-right"
> -
> -
> -FILES_tzdata-misc +=3D "${datadir}/zoneinfo/Cuba           \
> -                ${datadir}/zoneinfo/Egypt                \
> -                ${datadir}/zoneinfo/Eire                 \
> -                ${datadir}/zoneinfo/Factory              \
> -                ${datadir}/zoneinfo/GB-Eire              \
> -                ${datadir}/zoneinfo/Hongkong             \
> -                ${datadir}/zoneinfo/Iceland              \
> -                ${datadir}/zoneinfo/Iran                 \
> -                ${datadir}/zoneinfo/Israel               \
> -                ${datadir}/zoneinfo/Jamaica              \
> -                ${datadir}/zoneinfo/Japan                \
> -                ${datadir}/zoneinfo/Kwajalein            \
> -                ${datadir}/zoneinfo/Libya                \
> -                ${datadir}/zoneinfo/Navajo               \
> -                ${datadir}/zoneinfo/Poland               \
> -                ${datadir}/zoneinfo/Portugal             \
> -                ${datadir}/zoneinfo/Singapore            \
> -                ${datadir}/zoneinfo/Turkey"
> -RPROVIDES_tzdata-misc =3D "tzdata-misc"
> -
> -
> -FILES_${PN} +=3D "${datadir}/zoneinfo/Pacific/Honolulu     \
> -                ${datadir}/zoneinfo/America/Anchorage    \
> -                ${datadir}/zoneinfo/America/Los_Angeles  \
> -                ${datadir}/zoneinfo/America/Denver       \
> -                ${datadir}/zoneinfo/America/Chicago      \
> -                ${datadir}/zoneinfo/America/New_York     \
> -                ${datadir}/zoneinfo/America/Caracas      \
> -                ${datadir}/zoneinfo/America/Sao_Paulo    \
> -                ${datadir}/zoneinfo/Europe/London        \
> -                ${datadir}/zoneinfo/Europe/Paris         \
> -                ${datadir}/zoneinfo/Africa/Cairo         \
> -                ${datadir}/zoneinfo/Europe/Moscow        \
> -                ${datadir}/zoneinfo/Asia/Dubai           \
> -                ${datadir}/zoneinfo/Asia/Karachi         \
> -                ${datadir}/zoneinfo/Asia/Dhaka           \
> -                ${datadir}/zoneinfo/Asia/Bankok          \
> -                ${datadir}/zoneinfo/Asia/Hong_Kong       \
> -                ${datadir}/zoneinfo/Asia/Tokyo           \
> -                ${datadir}/zoneinfo/Australia/Darwin     \
> -                ${datadir}/zoneinfo/Australia/Adelaide   \
> -                ${datadir}/zoneinfo/Australia/Brisbane   \
> -                ${datadir}/zoneinfo/Australia/Sydney     \
> -                ${datadir}/zoneinfo/Pacific/Noumea       \
> -                ${datadir}/zoneinfo/CET                  \
> -                ${datadir}/zoneinfo/CST6CDT              \
> -                ${datadir}/zoneinfo/EET                  \
> -                ${datadir}/zoneinfo/EST                  \
> -                ${datadir}/zoneinfo/EST5EDT              \
> -                ${datadir}/zoneinfo/GB                   \
> -                ${datadir}/zoneinfo/GMT                  \
> -                ${datadir}/zoneinfo/GMT+0                \
> -                ${datadir}/zoneinfo/GMT-0                \
> -                ${datadir}/zoneinfo/GMT0                 \
> -                ${datadir}/zoneinfo/Greenwich            \
> -                ${datadir}/zoneinfo/HST                  \
> -                ${datadir}/zoneinfo/MET                  \
> -                ${datadir}/zoneinfo/MST                  \
> -                ${datadir}/zoneinfo/MST7MDT              \
> -                ${datadir}/zoneinfo/NZ                   \
> -                ${datadir}/zoneinfo/NZ-CHAT              \
> -                ${datadir}/zoneinfo/PRC                  \
> -                ${datadir}/zoneinfo/PST8PDT              \
> -                ${datadir}/zoneinfo/ROC                  \
> -                ${datadir}/zoneinfo/ROK                  \
> -                ${datadir}/zoneinfo/UCT                  \
> -                ${datadir}/zoneinfo/UTC                  \
> -                ${datadir}/zoneinfo/Universal            \
> -                ${datadir}/zoneinfo/W-SU                 \
> -                ${datadir}/zoneinfo/WET                  \
> -                ${datadir}/zoneinfo/Zulu                 \
> -                ${datadir}/zoneinfo/zone.tab             \
> -                ${datadir}/zoneinfo/iso3166.tab          \
> -                ${datadir}/zoneinfo/Etc/*"
> diff --git a/meta/recipes-extended/tzdata/tzdata_2013a.bb =
b/meta/recipes-extended/tzdata/tzdata_2013a.bb
> new file mode 100644
> index 0000000..ee10a36
> --- /dev/null
> +++ b/meta/recipes-extended/tzdata/tzdata_2013a.bb
> @@ -0,0 +1,227 @@
> +#
> +# Copyright (C) 2013 Wind River Systems, Inc.
> +#
> +DESCRIPTION =3D "Timezone data"
> +HOMEPAGE =3D "ftp://elsie.nci.nih.gov/pub/"
> +SECTION =3D "base"
> +LICENSE =3D "PD"
> +LIC_FILES_CHKSUM =3D =
"file://asia;beginline=3D2;endline=3D3;md5=3D06468c0e84ef4d4c97045a4a29b08=
234"
> +DEPENDS =3D "tzcode-native"
> +
> +PR =3D "r1"
> +
> +RCONFLICTS_${PN} =3D "timezones timezone-africa timezone-america =
timezone-antarctica \
> +             timezone-arctic timezone-asia timezone-atlantic \
> +             timezone-australia timezone-europe timezone-indian \
> +             timezone-iso3166.tab timezone-pacific timezone-zone.tab"
> +
> +SRC_URI =3D =
"ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=3Dtzdata"
> +
> +#SRC_URI[tzdata.md5sum] =3D "944ad681a8623336230dcdb306d5c9f6"
> +#SRC_URI[tzdata.sha256sum] =3D =
"afe95a49a445ee55391d2d4beccd4be6d61a090d5d8069c407390ff1502c26cc"
> +SRC_URI[tzdata.md5sum] =3D "2a9b3208ed91652dd554e4d104662e67"
> +SRC_URI[tzdata.sha256sum] =3D =
"ed9f273f52d5df9ec09fdcf6684176bbdc86d0fbafcbc27b97e5a9c103024afc"
> +
> +S =3D "${WORKDIR}"
> +
> +DEFAULT_TIMEZONE ?=3D "Universal"
> +
> +TZONES=3D "africa antarctica asia australasia europe northamerica =
southamerica  \
> +         factory solar87 solar88 solar89 etcetera backward systemv \
> +        "
> +# pacificnew=20
> +
> +do_compile () {
> +        for zone in ${TZONES}; do \
> +            ${STAGING_BINDIR_NATIVE}/zic -d =
${WORKDIR}${datadir}/zoneinfo -L /dev/null \
> +                -y ${S}/yearistype.sh ${S}/${zone} ; \
> +            ${STAGING_BINDIR_NATIVE}/zic -d =
${WORKDIR}${datadir}/zoneinfo/posix -L /dev/null \
> +                -y ${S}/yearistype.sh ${S}/${zone} ; \
> +            ${STAGING_BINDIR_NATIVE}/zic -d =
${WORKDIR}${datadir}/zoneinfo/right -L ${S}/leapseconds \
> +                -y ${S}/yearistype.sh ${S}/${zone} ; \
> +        done
> +}
> +
> +do_install () {
> +        install -d ${D}/$exec_prefix ${D}${datadir}/zoneinfo
> +        cp -pPR ${S}/$exec_prefix ${D}/
> +        # libc is removing zoneinfo files from package
> +        cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
> +        cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
> +
> +        # Install default timezone
> +        install -d ${D}${sysconfdir}
> +        echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
> +
> +        chown -R root:root ${D}
> +}
> +
> +pkg_postinst_${PN} () {
> +
> +# code taken from Gentoo's tzdata ebuild
> +
> +	etc_lt=3D"$D${sysconfdir}/localtime"
> +	src=3D"$D${sysconfdir}/timezone"
> +
> +	if [ -e ${src} ] ; then
> +		tz=3D$(sed -e 's:#.*::' -e 's:[[:space:]]*::g' -e =
'/^$/d' "${src}")
> +	else
> +		tz=3D"FUBAR"
> +	fi
> +=09
> +	if [ -z ${tz} ] ; then
> +		return 0
> +	fi
> +=09
> +	if [ ${tz} =3D "FUBAR" ] ; then
> +		echo "You do not have TIMEZONE set in ${src}."
> +
> +		if [ ! -e ${etc_lt} ] ; then
> +			# if /etc/localtime is a symlink somewhere, =
assume they
> +			# know what they're doing and they're managing =
it themselves
> +			if [ ! -L ${etc_lt} ] ; then
> +				cp -f "$D${datadir}/zoneinfo/Universal" =
"${etc_lt}"
> +				echo "Setting ${etc_lt} to Universal."
> +			else
> +				echo "Assuming your ${etc_lt} symlink is =
what you want; skipping update."
> +			fi
> +		else
> +			echo "Skipping auto-update of ${etc_lt}."
> +		fi
> +		return 0
> +	fi
> +
> +	if [ ! -e "$D${datadir}/zoneinfo/${tz}" ] ; then
> +		echo "You have an invalid TIMEZONE setting in ${src}"
> +		echo "Your ${etc_lt} has been reset to Universal; =
enjoy!"
> +		tz=3D"Universal"
> +	fi
> +	echo "Updating ${etc_lt} with $D${datadir}/zoneinfo/${tz}"
> +	if [ -L ${etc_lt} ] ; then
> +		rm -f "${etc_lt}"
> +	fi
> +	cp -f "$D${datadir}/zoneinfo/${tz}" "${etc_lt}"
> +}
> +
> +# Packages primarily organized by directory with a major city
> +# in most time zones in the base package
> +
> +PACKAGES =3D "tzdata tzdata-misc tzdata-posix tzdata-right =
tzdata-africa \
> +    tzdata-americas tzdata-antarctica tzdata-arctic tzdata-asia \
> +    tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific"
> +
> +FILES_tzdata-africa +=3D "${datadir}/zoneinfo/Africa/*"
> +RPROVIDES_tzdata-africa =3D "tzdata-africa"
> +
> +FILES_tzdata-americas +=3D "${datadir}/zoneinfo/America/*  \
> +                ${datadir}/zoneinfo/US/*                \
> +                ${datadir}/zoneinfo/Brazil/*            \
> +                ${datadir}/zoneinfo/Canada/*            \
> +                ${datadir}/zoneinfo/Mexico/*            \
> +                ${datadir}/zoneinfo/Chile/*"
> +RPROVIDES_tzdata-americas =3D "tzdata-americas"
> +
> +FILES_tzdata-antarctica +=3D "${datadir}/zoneinfo/Antarctica/*"
> +RPROVIDES_tzdata-antarctica =3D "tzdata-antarctica"
> +
> +FILES_tzdata-arctic +=3D "${datadir}/zoneinfo/Arctic/*"
> +RPROVIDES_tzdata-arctic =3D "tzdata-arctic"
> +
> +FILES_tzdata-asia +=3D "${datadir}/zoneinfo/Asia/*        \
> +                ${datadir}/zoneinfo/Indian/*            \
> +                ${datadir}/zoneinfo/Mideast/*"
> +RPROVIDES_tzdata-asia =3D "tzdata-asia"
> +
> +FILES_tzdata-atlantic +=3D "${datadir}/zoneinfo/Atlantic/*"
> +RPROVIDES_tzdata-atlantic =3D "tzdata-atlantic"
> +
> +FILES_tzdata-australia +=3D "${datadir}/zoneinfo/Australia/*"
> +RPROVIDES_tzdata-australia =3D "tzdata-australia"
> +
> +FILES_tzdata-europe +=3D "${datadir}/zoneinfo/Europe/*"
> +RPROVIDES_tzdata-europe =3D "tzdata-europe"
> +
> +FILES_tzdata-pacific +=3D "${datadir}/zoneinfo/Pacific/*"
> +RPROVIDES_tzdata-pacific =3D "tzdata-pacific"
> +
> +FILES_tzdata-posix +=3D "${datadir}/zoneinfo/posix/*"
> +RPROVIDES_tzdata-posix =3D "tzdata-posix"
> +
> +FILES_tzdata-right +=3D "${datadir}/zoneinfo/right/*"
> +RPROVIDES_tzdata-right =3D "tzdata-right"
> +
> +
> +FILES_tzdata-misc +=3D "${datadir}/zoneinfo/Cuba           \
> +                ${datadir}/zoneinfo/Egypt                \
> +                ${datadir}/zoneinfo/Eire                 \
> +                ${datadir}/zoneinfo/Factory              \
> +                ${datadir}/zoneinfo/GB-Eire              \
> +                ${datadir}/zoneinfo/Hongkong             \
> +                ${datadir}/zoneinfo/Iceland              \
> +                ${datadir}/zoneinfo/Iran                 \
> +                ${datadir}/zoneinfo/Israel               \
> +                ${datadir}/zoneinfo/Jamaica              \
> +                ${datadir}/zoneinfo/Japan                \
> +                ${datadir}/zoneinfo/Kwajalein            \
> +                ${datadir}/zoneinfo/Libya                \
> +                ${datadir}/zoneinfo/Navajo               \
> +                ${datadir}/zoneinfo/Poland               \
> +                ${datadir}/zoneinfo/Portugal             \
> +                ${datadir}/zoneinfo/Singapore            \
> +                ${datadir}/zoneinfo/Turkey"
> +RPROVIDES_tzdata-misc =3D "tzdata-misc"
> +
> +
> +FILES_${PN} +=3D "${datadir}/zoneinfo/Pacific/Honolulu     \
> +                ${datadir}/zoneinfo/America/Anchorage    \
> +                ${datadir}/zoneinfo/America/Los_Angeles  \
> +                ${datadir}/zoneinfo/America/Denver       \
> +                ${datadir}/zoneinfo/America/Chicago      \
> +                ${datadir}/zoneinfo/America/New_York     \
> +                ${datadir}/zoneinfo/America/Caracas      \
> +                ${datadir}/zoneinfo/America/Sao_Paulo    \
> +                ${datadir}/zoneinfo/Europe/London        \
> +                ${datadir}/zoneinfo/Europe/Paris         \
> +                ${datadir}/zoneinfo/Africa/Cairo         \
> +                ${datadir}/zoneinfo/Europe/Moscow        \
> +                ${datadir}/zoneinfo/Asia/Dubai           \
> +                ${datadir}/zoneinfo/Asia/Karachi         \
> +                ${datadir}/zoneinfo/Asia/Dhaka           \
> +                ${datadir}/zoneinfo/Asia/Bankok          \
> +                ${datadir}/zoneinfo/Asia/Hong_Kong       \
> +                ${datadir}/zoneinfo/Asia/Tokyo           \
> +                ${datadir}/zoneinfo/Australia/Darwin     \
> +                ${datadir}/zoneinfo/Australia/Adelaide   \
> +                ${datadir}/zoneinfo/Australia/Brisbane   \
> +                ${datadir}/zoneinfo/Australia/Sydney     \
> +                ${datadir}/zoneinfo/Pacific/Noumea       \
> +                ${datadir}/zoneinfo/CET                  \
> +                ${datadir}/zoneinfo/CST6CDT              \
> +                ${datadir}/zoneinfo/EET                  \
> +                ${datadir}/zoneinfo/EST                  \
> +                ${datadir}/zoneinfo/EST5EDT              \
> +                ${datadir}/zoneinfo/GB                   \
> +                ${datadir}/zoneinfo/GMT                  \
> +                ${datadir}/zoneinfo/GMT+0                \
> +                ${datadir}/zoneinfo/GMT-0                \
> +                ${datadir}/zoneinfo/GMT0                 \
> +                ${datadir}/zoneinfo/Greenwich            \
> +                ${datadir}/zoneinfo/HST                  \
> +                ${datadir}/zoneinfo/MET                  \
> +                ${datadir}/zoneinfo/MST                  \
> +                ${datadir}/zoneinfo/MST7MDT              \
> +                ${datadir}/zoneinfo/NZ                   \
> +                ${datadir}/zoneinfo/NZ-CHAT              \
> +                ${datadir}/zoneinfo/PRC                  \
> +                ${datadir}/zoneinfo/PST8PDT              \
> +                ${datadir}/zoneinfo/ROC                  \
> +                ${datadir}/zoneinfo/ROK                  \
> +                ${datadir}/zoneinfo/UCT                  \
> +                ${datadir}/zoneinfo/UTC                  \
> +                ${datadir}/zoneinfo/Universal            \
> +                ${datadir}/zoneinfo/W-SU                 \
> +                ${datadir}/zoneinfo/WET                  \
> +                ${datadir}/zoneinfo/Zulu                 \
> +                ${datadir}/zoneinfo/zone.tab             \
> +                ${datadir}/zoneinfo/iso3166.tab          \
> +                ${datadir}/zoneinfo/Etc/*"
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



