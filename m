Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2Ts7-0000Qa-Ov
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 23:14:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Aug 2012 14:02:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="182369547"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by azsmga001.ch.intel.com with ESMTP; 17 Aug 2012 14:02:23 -0700
Message-ID: <502EB15F.8020406@linux.intel.com>
Date: Fri, 17 Aug 2012 14:02:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344923816-24673-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1344923816-24673-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] subversion: two small fixes
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
X-List-Received-Date: Fri, 17 Aug 2012 21:14:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2012 10:56 PM, rongqing.li@windriver.com wrote:
> From: Roy.Li <rongqing.li@windriver.com>
>
> Add missing build dependency on sqlite3
>
> Disable Ruby checking. we do not have Ruby, and subversion always
> checks ruby on host which leads to build error when ruby-dev is
> installed on host.
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   .../subversion/subversion_1.6.15.bb                |    7 ++++---
>   .../subversion/subversion_1.7.2.bb                 |    5 +++--
>   2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
> index 29029ce..244d7ea 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
> @@ -1,13 +1,13 @@
>   DESCRIPTION = "The Subversion (svn) client"
>   SECTION = "console/network"
> -DEPENDS = "apr-util neon"
> +DEPENDS = "apr-util neon sqlite3"
>   RDEPENDS_${PN} = "neon"
>   LICENSE = "Apache-2"
>   HOMEPAGE = "http://subversion.tigris.org"
>
>   BBCLASSEXTEND = "native"
>
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI = "http://subversion.tigris.org/downloads/${BPN}-${PV}.tar.bz2 \
>              file://disable-revision-install.patch \
> @@ -23,7 +23,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2a69fef414e2cb907b4544298569300b"
>   EXTRA_OECONF = " \
>                   --without-berkeley-db --without-apxs --without-apache \
>                   --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
> -                --with-apr-util=${STAGING_BINDIR_CROSS}"
> +                --with-apr-util=${STAGING_BINDIR_CROSS} \
> +                ac_cv_path_RUBY=none"
>
>   inherit autotools
>
> diff --git a/meta/recipes-devtools/subversion/subversion_1.7.2.bb b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
> index 4f71de5..1d36b63 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.7.2.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
> @@ -7,7 +7,7 @@ HOMEPAGE = "http://subversion.tigris.org"
>
>   BBCLASSEXTEND = "native"
>
> -PR = "r3"
> +PR = "r4"
>
>   SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>              file://libtool2.patch \
> @@ -21,7 +21,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4a14fd2da3134e40a087eb4326a4ecd4"
>   EXTRA_OECONF = " \
>                   --without-berkeley-db --without-apxs --without-apache \
>                   --without-swig --with-aprsgw@linux.intel.com=${STAGING_BINDIR_CROSS} \
> -                --with-apr-util=${STAGING_BINDIR_CROSS}"
> +                --with-apr-util=${STAGING_BINDIR_CROSS} \
> +                ac_cv_path_RUBY=none"
>
>   inherit autotools
>
>

Merged into OE-Core

Thanks
	Sau!



