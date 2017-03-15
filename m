Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7598460268
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 22:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489618637; x=1521154637;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=XHlUED/XkewFBhC6KUNFuElTU+XigLB9FYc7aZ0jsBM=;
	b=cVyAhdOFIGWapWg70pSzsn9KRvN2TeLSD2M17XAN9jJ7TrV5xZGIh551
	JgG8Xstx7w1tnFB4FX/m/WBi/v6LJQ==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2017 15:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="60910315"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2017 15:57:15 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.204]) by
	ORSMSX109.amr.corp.intel.com ([169.254.11.220]) with mapi id
	14.03.0248.002; Wed, 15 Mar 2017 15:57:15 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/3] build-appliance-image: use pip3-native
Thread-Index: AQHSndlt213QW6MI3EmdJmSmhI1B7KGW7VuA//+V2ys=
Date: Wed, 15 Mar 2017 22:57:14 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B611910D14@ORSMSX112.amr.corp.intel.com>
References: <1489616018-8969-1-git-send-email-juro.bystricky@intel.com>
	<1489616018-8969-2-git-send-email-juro.bystricky@intel.com>,
	<1489616215.13980.82.camel@linuxfoundation.org>
In-Reply-To: <1489616215.13980.82.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.135]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>
Subject: Re: [PATCH 1/3] build-appliance-image: use pip3-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Mar 2017 22:57:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

sure, no problem=0A=
=0A=
________________________________________=0A=
From: Richard Purdie [richard.purdie@linuxfoundation.org]=0A=
Sent: Wednesday, March 15, 2017 3:16 PM=0A=
To: Bystricky, Juro; openembedded-core@lists.openembedded.org=0A=
Cc: jurobystricky@hotmail.com=0A=
Subject: Re: [PATCH 1/3] build-appliance-image: use pip3-native=0A=
=0A=
On Wed, 2017-03-15 at 15:13 -0700, Juro Bystricky wrote:=0A=
> Do not rely on pip3 being installed on the host.=0A=
> Use pip3-native instead.=0A=
>=0A=
> [YOCTO#10909]=0A=
> [YOCTO#11022]=0A=
>=0A=
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>=0A=
> ---=0A=
>  meta/recipes-core/images/build-appliance-image_15.0.0.bb | 6 ++++--=0A=
>  1 file changed, 4 insertions(+), 2 deletions(-)=0A=
>=0A=
> diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb=0A=
> b/meta/recipes-core/images/build-appliance-image_15.0.0.bb=0A=
> index 0db1fb0..730989e 100644=0A=
> --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb=0A=
> +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb=0A=
> @@ -18,10 +18,10 @@ IMAGE_ROOTFS_EXTRA_SPACE =3D "41943040"=0A=
>  # Do a quiet boot with limited console messages=0A=
>  APPEND +=3D "rootfstype=3Dext4 quiet"=0A=
>=0A=
> -DEPENDS =3D "zip-native"=0A=
> +DEPENDS =3D "zip-native python3-pip-native"=0A=
>  IMAGE_FSTYPES =3D "vmdk"=0A=
>=0A=
> -inherit core-image module-base=0A=
> +inherit core-image module-base setuptools3=0A=
>=0A=
>  SRCREV ?=3D "8343ed93c4278715aa1582d3cadedf8f197b4089"=0A=
>  SRC_URI =3D "git://git.yoctoproject.org/poky;branch=3Dmaster \=0A=
> @@ -95,6 +95,8 @@ fakeroot do_populate_poky_src () {=0A=
>       echo 'gtk-theme-name =3D "Clearlooks"' >=0A=
> ${IMAGE_ROOTFS}/etc/gtk-2.0/gtkrc=0A=
>=0A=
>       # Install modules needed for toaster=0A=
> +     export STAGING_LIBDIR=3D${STAGING_LIBDIR_NATIVE}=0A=
> +     export STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE}=0A=
>       export HOME=3D${IMAGE_ROOTFS}/home/builder=0A=
>       mkdir -p ${IMAGE_ROOTFS}/home/builder/.cache/pip=0A=
>       pip3 install --user -I -U -v -r=0A=
> ${IMAGE_ROOTFS}/home/builder/poky/bitbake/toaster-requirements.txt=0A=
=0A=
=0A=
Looks good, thanks. Can you also drop "pip" from bitbake.conf's=0A=
HOSTTOOLS_NONFATAL please?=0A=
=0A=
Cheers,=0A=
=0A=
Richard=0A=

