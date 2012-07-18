Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1SrTG8-0002eh-4a
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 14:21:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Jul 2012 05:10:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="179569821"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2012 05:10:00 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Wed, 18 Jul 2012 13:09:58 +0100
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.176]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.134]) with mapi id
	14.01.0355.002; Wed, 18 Jul 2012 13:09:58 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/3] wpa-supplicant: upgrade to 1.0
Thread-Index: AQHNZE6PQgLQUxDj80edjDIC2BXcc5cu87Zg
Date: Wed, 18 Jul 2012 12:09:57 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16172813@IRSMSX102.ger.corp.intel.com>
References: <1342513736-468-1-git-send-email-cristian.iorga@intel.com>
	<1342513736-468-3-git-send-email-cristian.iorga@intel.com>
	<5005B67B.6040206@linux.intel.com>
In-Reply-To: <5005B67B.6040206@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] wpa-supplicant: upgrade to 1.0
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
X-List-Received-Date: Wed, 18 Jul 2012 12:21:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Working on fixing the commit with proper comments.

Thanks for the review.

/Cristian

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Tuesday, July 17, 2012 10:01 PM
To: Patches and discussions about the oe-core layer
Cc: Iorga, Cristian
Subject: Re: [OE-core] [PATCH 3/3] wpa-supplicant: upgrade to 1.0

On 07/17/2012 01:28 AM, Cristian Iorga wrote:
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   ...a-supplicant-0.7.inc =3D> wpa-supplicant-1.0.inc} |    4 ++--
>   .../99_wpa_supplicant                              |    0
>   .../defconfig-gnutls                               |    0
>   .../wpa-supplicant.sh                              |    0
>   .../wpa_supplicant.conf                            |    0
>   .../wpa_supplicant.conf-sane                       |    0
>   .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    6 ------
>   .../wpa-supplicant/wpa-supplicant_1.0.bb           |    6 ++++++
>   8 files changed, 8 insertions(+), 8 deletions(-)
>   rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-0.7.inc=
 =3D> wpa-supplicant-1.0.inc} (95%)
>   rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-0.7.3 =
=3D> wpa-supplicant-1.0}/99_wpa_supplicant (100%)
>   rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-0.7.3 =
=3D> wpa-supplicant-1.0}/defconfig-gnutls (100%)
>   rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-0.7.3 =
=3D> wpa-supplicant-1.0}/wpa-supplicant.sh (100%)
>   rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-0.7.3 =
=3D> wpa-supplicant-1.0}/wpa_supplicant.conf (100%)
>   rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-0.7.3 =
=3D> wpa-supplicant-1.0}/wpa_supplicant.conf-sane (100%)
>   delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplic=
ant_0.7.3.bb
>   create mode 100644=20
> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
>
> diff --git=20
> a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc=20
> b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
> similarity index 95%
> rename from=20
> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
> rename to=20
> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
> index 6c84202..0c18b30 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
> @@ -4,8 +4,8 @@ BUGTRACKER =3D "http://hostap.epitest.fi/bugz/"
>   SECTION =3D "network"
>   LICENSE =3D "GPLv2 | BSD"
>   LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3Dc54ce9345727175ff66d17b67=
ff51f58 \
> -                    file://../README;md5=3D54cfc88015d3ce83f7156e63c6bb1=
738 \
> -                    file://wpa_supplicant.c;beginline=3D1;endline=3D17;m=
d5=3Dacdc5a4b0d6345f21f136eace747260e"
> +                    file://../README;md5=3D9bee93996fecdb70f807baceb29d8=
4b9 \
> +                    file://wpa_supplicant.c;beginline=3D1;endline=3D17;m=
d5=3D372fb65dc23b228aec4e40e64de3e467"

As mentioned before, what changed and why?  This should be in the commit me=
ssage.

Sau!

>   DEPENDS =3D "gnutls dbus libnl"
>   RRECOMMENDS_${PN} =3D "wpa-supplicant-passphrase wpa-supplicant-cli"
>
> diff --git=20
> a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/99_wpa
> _supplicant=20
> b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/99_wpa_s
> upplicant
> similarity index 100%
> rename from=20
> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/99_wpa_s
> upplicant rename to=20
> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/99_wpa_sup
> plicant diff --git=20
> a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defcon
> fig-gnutls=20
> b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/defconfi
> g-gnutls
> similarity index 100%
> rename from=20
> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfi
> g-gnutls rename to=20
> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/defconfig-
> gnutls diff --git=20
> a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa-su
> pplicant.sh=20
> b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa-supp
> licant.sh
> similarity index 100%
> rename from=20
> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa-supp
> licant.sh rename to=20
> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa-suppli
> cant.sh diff --git=20
> a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_su
> pplicant.conf=20
> b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa_supp
> licant.conf
> similarity index 100%
> rename from=20
> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supp
> licant.conf rename to=20
> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa_suppli
> cant.conf diff --git=20
> a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_su
> pplicant.conf-sane=20
> b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa_supp
> licant.conf-sane
> similarity index 100%
> rename from=20
> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supp
> licant.conf-sane rename to=20
> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa_suppli
> cant.conf-sane diff --git=20
> a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb=20
> b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
> deleted file mode 100644
> index 6f6378b..0000000
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require wpa-supplicant-0.7.inc
> -
> -PR =3D "r12"
> -
> -SRC_URI[md5sum] =3D "f516f191384a9a546e3f5145c08addda"
> -SRC_URI[sha256sum] =3D "d0cd50caa85346ccc376dcda5ed3c258eef19a93b3cade39=
d25760118ad59443"
> diff --git=20
> a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb=20
> b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
> new file mode 100644
> index 0000000..8ede3e5
> --- /dev/null
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
> @@ -0,0 +1,6 @@
> +require wpa-supplicant-1.0.inc
> +
> +PR =3D "r0"
> +
> +SRC_URI[md5sum] =3D "8650f6aa23646ef634402552d0669640"
> +SRC_URI[sha256sum] =3D "91d41d473a5aafa2e25dd6577ebda975c4d4a3188850a53e=
31feaf7c04482b9c"
>



