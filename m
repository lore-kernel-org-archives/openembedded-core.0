Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UZd7p-0008VN-JL
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 10:20:18 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 May 2013 01:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,627,1363158000"; d="scan'208";a="330101401"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga001.fm.intel.com with ESMTP; 07 May 2013 01:01:50 -0700
Received: from irsmsx106.ger.corp.intel.com (163.33.3.31) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Tue, 7 May 2013 09:01:40 +0100
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.244]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.205]) with mapi id
	14.01.0355.002; Tue, 7 May 2013 09:01:40 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] iptables: upgrade to 1.4.18
Thread-Index: AQHORY3ACnZI0nbHVEejhrRNQV3gbJjwlUuAgAjRoSA=
Date: Tue, 7 May 2013 08:01:39 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1622BBEA@IRSMSX102.ger.corp.intel.com>
References: <1367317863-10350-1-git-send-email-cristian.iorga@intel.com>
	<51815CF7.4080605@linux.intel.com>
In-Reply-To: <51815CF7.4080605@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] iptables: upgrade to 1.4.18
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
X-List-Received-Date: Tue, 07 May 2013 08:20:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Saul,

You are right. I will fix it.
Regards,
Cistian

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Wednesday, May 01, 2013 9:21 PM
To: Iorga, Cristian
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] iptables: upgrade to 1.4.18

On 04/30/2013 03:31 AM, Cristian Iorga wrote:
> fix-link-failure-ip6t-NETMAP.patch removed; already included in=20
> upstream.
>
You do not seem to have removed the patch file itself.

Sau!

> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   .../iptables/{iptables_1.4.17.bb =3D> iptables_1.4.18.bb}        |    8=
 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
>   rename meta/recipes-extended/iptables/{iptables_1.4.17.bb =3D>=20
> iptables_1.4.18.bb} (90%)
>
> diff --git a/meta/recipes-extended/iptables/iptables_1.4.17.bb=20
> b/meta/recipes-extended/iptables/iptables_1.4.18.bb
> similarity index 90%
> rename from meta/recipes-extended/iptables/iptables_1.4.17.bb
> rename to meta/recipes-extended/iptables/iptables_1.4.18.bb
> index aa932ce..bb8718f 100644
> --- a/meta/recipes-extended/iptables/iptables_1.4.17.bb
> +++ b/meta/recipes-extended/iptables/iptables_1.4.18.bb
> @@ -7,8 +7,6 @@ LICENSE =3D "GPLv2+"
>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a=
4263\
>                       file://iptables/iptables.c;beginline=3D13;endline=
=3D25;md5=3Dc5cffd09974558cf27d0f763df2a12dc"
>
> -PR =3D "r1"
> -
>   RRECOMMENDS_${PN} =3D "kernel-module-x-tables \
>                        kernel-module-ip-tables \
>                        kernel-module-iptable-filter \ @@ -23,12 +21,12=20
> @@ FILES_${PN}-dbg =3D+ "${libdir}/xtables/.debug"
>
>   SRC_URI =3D "http://netfilter.org/projects/iptables/files/iptables-${PV=
}.tar.bz2 \
>              file://types.h-add-defines-that-are-required-for-if_packet.p=
atch \
> -           file://fix-link-failure-ip6t-NETMAP.patch \
>              file://fix-iptables-extensions-build-error.patch \
>              file://0001-configure-Add-option-to-enable-disable-libnfnetl=
ink.patch \
>             "
> -SRC_URI[md5sum] =3D "c3fb2ffd5b39d0d54b06ccc4c8660116"
> -SRC_URI[sha256sum] =3D "51e7a769469383b6ad308a6a19cdd2bd813cf4593e21a156=
a543a1cd70554925"
> +
> +SRC_URI[md5sum] =3D "a819199d5ec013b82da13a8ffbba857e"
> +SRC_URI[sha256sum] =3D "14a99fb8b0ca22027a9ac6eb72fa32c834ceb3073820e0ba=
79bf251c6a7bcf3c"
>
>   inherit autotools
>
>


