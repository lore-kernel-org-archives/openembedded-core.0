Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1T9MSV-0003Zb-98
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 22:44:23 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Sep 2012 13:31:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,375,1344236400"; d="scan'208";a="218546588"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2012 13:31:57 -0700
Received: from orsmsx106.amr.corp.intel.com (10.22.225.133) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 5 Sep 2012 13:31:57 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.152]) by
	ORSMSX106.amr.corp.intel.com ([169.254.5.217]) with mapi id
	14.01.0355.002; Wed, 5 Sep 2012 13:31:56 -0700
From: "Zhang, Jessica" <jessica.zhang@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Flanagan, Elizabeth"
	<elizabeth.flanagan@intel.com>
Thread-Topic: [OE-core] [PATCH 1/1] Revised: adt-installer: Add
	adt-installer-dev.bb
Thread-Index: AQHNi6QUgJ9dyqMB1Ee0s/2Tc3yoCpd8M20g
Date: Wed, 5 Sep 2012 20:31:55 +0000
Message-ID: <C6510F6D410BB64A8C15398EDC6B847C46AEAFF1@ORSMSX101.amr.corp.intel.com>
References: <CAPhnLPC6xOrTSk_uo2unRO7JM4G7_oV1N+p1Lv84j5YKge1bpw@mail.gmail.com>
	<1346876478.21985.67.camel@ted>
In-Reply-To: <1346876478.21985.67.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revised: adt-installer: Add adt-installer-dev.bb
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
X-List-Received-Date: Wed, 05 Sep 2012 20:44:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

+1 for option a.

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Richard Purdie
Sent: Wednesday, September 05, 2012 1:21 PM
To: Flanagan, Elizabeth
Cc: Patches and discussions about the oe-core layer
Subject: Re: [OE-core] [PATCH 1/1] Revised: adt-installer: Add adt-installe=
r-dev.bb

On Wed, 2012-09-05 at 10:27 -0700, Flanagan, Elizabeth wrote:
> This adds an adt-installer-dev for QA and autobuilder use.
> It repoints the ADTREPO url to adtrepo-dev.yp.org.
>
> Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
> ---
>  .../installer/adt-installer-dev_1.0.bb             |   26 ++++++++++++++=
++++++
>  .../installer/adt-installer/adt_installer.conf     |    2 +-
>  .../installer/adt-installer_1.0.bb                 |    1 +
>  3 files changed, 28 insertions(+), 1 deletion(-)  create mode 100644
> meta/recipes-devtools/installer/adt-installer-dev_1.0.bb
>
> diff --git a/meta/recipes-devtools/installer/adt-installer-dev_1.0.bb
> b/meta/recipes-devtools/installer/adt-installer-dev_1.0.bb
> new file mode 100644
> index 0000000..7679038
> --- /dev/null
> +++ b/meta/recipes-devtools/installer/adt-installer-dev_1.0.bb
> @@ -0,0 +1,26 @@
> +# Yocto ADT Installer bb file
> +#
> +# Copyright 2010-2011 by Intel Corp.
> +#
> +# Permission is hereby granted, free of charge, to any person
> +obtaining a copy # of this software and associated documentation
> +files (the
> "Software"), to deal
> +# in the Software without restriction, including without limitation
> +the rights # to use, copy, modify, merge, publish, distribute,
> +sublicense, and/or sell # copies of the Software, and to permit
> +persons to whom the Software is # furnished to do so, subject to the fol=
lowing conditions:
> +
> +# The above copyright notice and this permission notice shall be
> +included in # all copies or substantial portions of the Software.
> +
> +# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> +EXPRESS OR # IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> +MERCHANTABILITY, # FITNESS FOR A PARTICULAR PURPOSE AND
> +NONINFRINGEMENT. IN NO EVENT SHALL THE # AUTHORS OR COPYRIGHT HOLDERS
> +BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER # LIABILITY, WHETHER IN AN
> +ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> +# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> +DEALINGS IN # THE SOFTWARE.
> +
> +require recipes-devtools/installer/adt-installer_${PV}.bb
> +
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/adt-installer:"
> +ADTREPO =3D "http://adtrepo-dev.yoctoproject.org/${SDK_VERSION}"
> diff --git
> a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
> b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
> index afc69a4..171d2ac 100644
> --- a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
> +++ b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
> @@ -23,7 +23,7 @@
>
>  # Your yocto distro repository, this should include IPKG based
> packages and root filesystem files where the installation is based on
>
> -YOCTOADT_REPO=3D"http://adtrepo.yoctoproject.org/YOCTOADT_VERSION"
> +YOCTOADT_REPO=3D"ADTREPO"
>
>  # The following are for system wide setup  # Target architectures
> that you want to setup host cross dev environment for diff --git
> a/meta/recipes-devtools/installer/adt-installer_1.0.bb
> b/meta/recipes-devtools/installer/adt-installer_1.0.bb
> index becdef6..4ee276f 100644
> --- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
> +++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
> @@ -68,6 +68,7 @@ fakeroot do_populate_adt () {
>       cp -r scripts ${ADT_DIR}/
>       cp adt_installer ${ADT_DIR}
>       cp adt_installer.conf ${ADT_DIR}
> +     sed -i -e 's#ADTREPO#${ADTREPO}#' ${ADT_DIR}/adt_installer.conf
>       sed -i -e 's#YOCTOADT_VERSION#${SDK_VERSION}#' ${ADT_DIR}/adt_insta=
ller.conf
>       echo 'SDK_VENDOR=3D${SDK_VENDOR}' >> ${ADT_DIR}/scripts/data_define
>       echo 'DEFAULT_INSTALL_FOLDER=3D${SDKPATH}' >>
> ${ADT_DIR}/scripts/data_define

Firstly, this breaks the adt-installer recipe since nothing sets YOCTOADT_R=
EPO to a value.

Secondly, having two recipe just for this is wrong, lets just set the varia=
ble as needed. Either:

a) Setting to the release location should happen at release time, otherwise=
 it can default to the dev repo

b) It can default to the last release and the autobuilder overrides the var=
iable to the dev location.

I suspect a) is less work and makes most sense.

Cheers,

Richard



_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


