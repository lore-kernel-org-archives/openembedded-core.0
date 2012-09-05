Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T9MIL-0005mk-2C for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 22:33:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q85KLRc0030286;
	Wed, 5 Sep 2012 21:21:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28994-01; Wed,  5 Sep 2012 21:21:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q85KLIwk030279
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 5 Sep 2012 21:21:20 +0100
Message-ID: <1346876478.21985.67.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Wed, 05 Sep 2012 21:21:18 +0100
In-Reply-To: <CAPhnLPC6xOrTSk_uo2unRO7JM4G7_oV1N+p1Lv84j5YKge1bpw@mail.gmail.com>
References: <CAPhnLPC6xOrTSk_uo2unRO7JM4G7_oV1N+p1Lv84j5YKge1bpw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Wed, 05 Sep 2012 20:33:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-05 at 10:27 -0700, Flanagan, Elizabeth wrote:
> This adds an adt-installer-dev for QA and autobuilder use.
> It repoints the ADTREPO url to adtrepo-dev.yp.org.
> 
> Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
> ---
>  .../installer/adt-installer-dev_1.0.bb             |   26 ++++++++++++++++++++
>  .../installer/adt-installer/adt_installer.conf     |    2 +-
>  .../installer/adt-installer_1.0.bb                 |    1 +
>  3 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/installer/adt-installer-dev_1.0.bb
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
> +# Permission is hereby granted, free of charge, to any person obtaining a copy
> +# of this software and associated documentation files (the
> "Software"), to deal
> +# in the Software without restriction, including without limitation the rights
> +# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> +# copies of the Software, and to permit persons to whom the Software is
> +# furnished to do so, subject to the following conditions:
> +
> +# The above copyright notice and this permission notice shall be included in
> +# all copies or substantial portions of the Software.
> +
> +# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> +# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> +# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> +# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> +# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> +# THE SOFTWARE.
> +
> +require recipes-devtools/installer/adt-installer_${PV}.bb
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/adt-installer:"
> +ADTREPO = "http://adtrepo-dev.yoctoproject.org/${SDK_VERSION}"
> diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
> b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
> index afc69a4..171d2ac 100644
> --- a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
> +++ b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
> @@ -23,7 +23,7 @@
> 
>  # Your yocto distro repository, this should include IPKG based
> packages and root filesystem files where the installation is based on
> 
> -YOCTOADT_REPO="http://adtrepo.yoctoproject.org/YOCTOADT_VERSION"
> +YOCTOADT_REPO="ADTREPO"
> 
>  # The following are for system wide setup
>  # Target architectures that you want to setup host cross dev environment for
> diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb
> b/meta/recipes-devtools/installer/adt-installer_1.0.bb
> index becdef6..4ee276f 100644
> --- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
> +++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
> @@ -68,6 +68,7 @@ fakeroot do_populate_adt () {
>  	cp -r scripts ${ADT_DIR}/
>  	cp adt_installer ${ADT_DIR}
>  	cp adt_installer.conf ${ADT_DIR}
> +	sed -i -e 's#ADTREPO#${ADTREPO}#' ${ADT_DIR}/adt_installer.conf
>  	sed -i -e 's#YOCTOADT_VERSION#${SDK_VERSION}#' ${ADT_DIR}/adt_installer.conf
>  	echo 'SDK_VENDOR=${SDK_VENDOR}' >> ${ADT_DIR}/scripts/data_define
>  	echo 'DEFAULT_INSTALL_FOLDER=${SDKPATH}' >> ${ADT_DIR}/scripts/data_define

Firstly, this breaks the adt-installer recipe since nothing sets
YOCTOADT_REPO to a value.

Secondly, having two recipe just for this is wrong, lets just set the
variable as needed. Either:

a) Setting to the release location should happen at release time,
otherwise it can default to the dev repo

b) It can default to the last release and the autobuilder overrides the
variable to the dev location.

I suspect a) is less work and makes most sense.

Cheers,

Richard




