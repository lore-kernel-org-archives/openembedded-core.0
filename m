Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Sn1D4-0001xD-Pm
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 07:36:06 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jul 2012 22:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="174015447"
Received: from orsmsx606.amr.corp.intel.com ([10.22.226.128])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jul 2012 22:25:00 -0700
Received: from orsmsx102.amr.corp.intel.com (10.22.225.129) by
	orsmsx606.amr.corp.intel.com (10.22.226.128) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 5 Jul 2012 22:25:00 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.168]) by
	ORSMSX102.amr.corp.intel.com ([169.254.1.101]) with mapi id
	14.01.0355.002; Thu, 5 Jul 2012 22:25:00 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Darren Hart <dvhart@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] bootimg: Use STAGING_KERNEL_DIR
Thread-Index: AQHNWtmAYwzarSVFKE+SsTYYEIsTnZcbuSuQ
Date: Fri, 6 Jul 2012 05:24:59 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C031693CF@ORSMSX106.amr.corp.intel.com>
References: <4f44ff83fd87ca9ee470f3ee789bb5550aa5101a.1341511739.git.dvhart@linux.intel.com>
In-Reply-To: <4f44ff83fd87ca9ee470f3ee789bb5550aa5101a.1341511739.git.dvhart@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "Wold, Saul" <saul.wold@intel.com>
Subject: Re: [PATCH] bootimg: Use STAGING_KERNEL_DIR
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
X-List-Received-Date: Fri, 06 Jul 2012 05:36:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK, This patch fixes the build. Bitbake is able to complete the creation o=
f the bootable images.

Nitin


> -----Original Message-----
> From: Darren Hart [mailto:dvhart@linux.intel.com]
> Sent: Thursday, July 05, 2012 11:39 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Darren Hart; Zanussi, Tom; Wold, Saul; Kamble, Nitin A
> Subject: [PATCH] bootimg: Use STAGING_KERNEL_DIR
>=20
> bootimg.bbclass using STAGING_DIR_HOST/kernel instead of
> STAGING_KERNEL_DIR, resulting in build failure of live images.
>=20
> | install: cannot stat
> | `/usr/local/dev/yocto/fishriver-test/build/tmp/sysroots/fishriver/kern
> | el/bzImage': No such file or directory
>=20
> Replace it with STAGING_KERNEL_DIR.
>=20
> UNTESTED - PLEASE TEST PRIOR TO PULL.
>=20
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: tom.zanussi@intel.com
> CC: saul.wold@intel.com
> CC: nitin.a.kamble@intel.com
> ---
>  meta/classes/bootimg.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
> index 370b378..a4c0e8d 100644
> --- a/meta/classes/bootimg.bbclass
> +++ b/meta/classes/bootimg.bbclass
> @@ -63,7 +63,7 @@ populate() {
>  	install -d ${DEST}
>=20
>  	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to us=
e.
> -	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage
> ${DEST}/vmlinuz
> +	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage ${DEST}/vmlinuz
>=20
>  	if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then
>  		install -m 0644 ${INITRD} ${DEST}/initrd
> --
> 1.7.10.4



