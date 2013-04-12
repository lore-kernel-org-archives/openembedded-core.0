Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UQcsN-0006s1-AP
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 14:14:43 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Apr 2013 04:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,462,1363158000"; d="scan'208";a="321393292"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga002.fm.intel.com with ESMTP; 12 Apr 2013 04:57:17 -0700
Received: from irsmsx106.ger.corp.intel.com (163.33.3.31) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Fri, 12 Apr 2013 12:57:16 +0100
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.244]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.144]) with mapi id
	14.01.0355.002; Fri, 12 Apr 2013 12:57:16 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] build-appliance-image: update to newer poky
	revision
Thread-Index: AQHONrUoEKFF+mNVNkS8QTMkGI0B6ZjRJt4AgAFVLcA=
Date: Fri, 12 Apr 2013 11:57:16 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1622412C@IRSMSX102.ger.corp.intel.com>
References: <1365685469-19415-1-git-send-email-cristian.iorga@intel.com>
	<5166E63A.7040008@linux.intel.com>
In-Reply-To: <5166E63A.7040008@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] build-appliance-image: update to newer poky revision
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
X-List-Received-Date: Fri, 12 Apr 2013 12:14:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

OK, you are right.

However, this is not the final version, this is needed in order to update t=
he git proxy in Hob.

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Thursday, April 11, 2013 7:35 PM
To: Iorga, Cristian
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] build-appliance-image: update to newer poky =
revision

On 04/11/2013 06:04 AM, Cristian Iorga wrote:
> Src rev for BA is now ae353c229cfe7e82588dc53fbed10c6ba8370d26.
>
Let's wait and update this on Sunday, please work with RP and myself to get=
 the correct SRCREV into the core.

Sau!

> Includes improvements to:
> - Hob;
> - git proxy mechanism;
> - LSB compliance for Yocto Linux;
> - postinstall fixes.
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   meta/recipes-core/images/build-appliance-image.bb |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/images/build-appliance-image.bb=20
> b/meta/recipes-core/images/build-appliance-image.bb
> index 43f0574..ae89684 100644
> --- a/meta/recipes-core/images/build-appliance-image.bb
> +++ b/meta/recipes-core/images/build-appliance-image.bb
> @@ -19,7 +19,7 @@ IMAGE_FSTYPES =3D "vmdk"
>
>   inherit core-image
>
> -SRCREV ?=3D "d823759b4594143d522eae0b2a2498436a6dcb1e"
> +SRCREV ?=3D "ae353c229cfe7e82588dc53fbed10c6ba8370d26"
>   SRC_URI =3D "git://git.yoctoproject.org/poky;protocol=3Dgit \
>              file://Yocto_Build_Appliance.vmx \
>              file://Yocto_Build_Appliance.vmxf \
>


