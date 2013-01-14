Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1Tuh7A-000252-N5
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 11:18:21 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Jan 2013 02:02:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,466,1355126400"; d="scan'208";a="273444299"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jan 2013 02:02:40 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.95]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.151]) with mapi id
	14.01.0355.002; Mon, 14 Jan 2013 10:02:39 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>, Mark Hatle
	<mark.hatle@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] db: upgrade to 5.3.21
Thread-Index: AQHN8Bc8FtCfKwt08UCKtG0+S6Tu35hEU1+AgAAB0sCABEbfcA==
Date: Mon, 14 Jan 2013 10:02:38 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161DD52A@IRSMSX102.ger.corp.intel.com>
References: <1357921082-17180-1-git-send-email-cristian.iorga@intel.com>
	<50F03F81.9070103@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB161DCF9B@IRSMSX102.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB161DCF9B@IRSMSX102.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [PATCH] db: upgrade to 5.3.21
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
X-List-Received-Date: Mon, 14 Jan 2013 10:19:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Checked RPM and SMART functionality. Works OK after db upgrade.
It is ok to be merged.

Regards,
Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Iorga, Cristian
Sent: Friday, January 11, 2013 6:43 PM
To: Mark Hatle; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] db: upgrade to 5.3.21

Noted. Thanks, I will do that on Monday.

Regards,
Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Mark Hatle
Sent: Friday, January 11, 2013 6:36 PM
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] db: upgrade to 5.3.21

On 1/11/13 10:18 AM, Cristian Iorga wrote:
> License file changed the year,
> triggering a change in checksum

Any change is BerkleyDB versions requires us to verify RPM and Smart functi=
onality.  I don't have any objections to the change -- just pointing that o=
ut.

--Mark

> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   meta/recipes-support/db/{db_5.3.15.bb =3D> db_5.3.21.bb} |    8 ++++---=
-
>   1 file changed, 4 insertions(+), 4 deletions(-)
>   rename meta/recipes-support/db/{db_5.3.15.bb =3D> db_5.3.21.bb} (93%)
>
> diff --git a/meta/recipes-support/db/db_5.3.15.bb=20
> b/meta/recipes-support/db/db_5.3.21.bb
> similarity index 93%
> rename from meta/recipes-support/db/db_5.3.15.bb
> rename to meta/recipes-support/db/db_5.3.21.bb
> index 509c567..23d6c4e 100644
> --- a/meta/recipes-support/db/db_5.3.15.bb
> +++ b/meta/recipes-support/db/db_5.3.21.bb
> @@ -14,15 +14,15 @@ HOMEPAGE =3D "http://www.oracle.com/technology/produc=
ts/berkeley-db/db/index.html"
>   LICENSE =3D "Sleepycat"
>   VIRTUAL_NAME ?=3D "virtual/db"
>   RCONFLICTS_${PN} =3D "db3"
> -PR =3D "r9"
> +PR =3D "r0"
>
>   SRC_URI =3D "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
>   SRC_URI +=3D "file://arm-thumb-mutex_db5.patch;patchdir=3D.."
>
> -SRC_URI[md5sum] =3D "5493fb5f7cc3915887c836b096f18773"
> -SRC_URI[sha256sum] =3D "4f4f7d548984dde3584fcda0e4f96901cb8bafb08033a778=
1aec64ef2ea1f579"
> +SRC_URI[md5sum] =3D "3fda0b004acdaa6fa350bfc41a3b95ca"
> +SRC_URI[sha256sum] =3D "ddd92a930317df92021054c03992392db9ea5cddba43bef8=
920d392a82114fb8"
>
> -LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D12cc3ff983ed4ecc6cc091370e=
e4dbc3"
> +LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D32aefa5a8e7318be1f657432cb=
e2e768"
>
>   inherit autotools
>
>


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


