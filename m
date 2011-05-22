Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QOG7i-0006nj-92
	for openembedded-core@lists.openembedded.org;
	Sun, 22 May 2011 23:23:42 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 May 2011 14:20:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,253,1304319600"; d="scan'208";a="440978326"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2011 14:20:41 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 May 2011 14:20:36 -0700
In-Reply-To: <f69c937a66b3dc7055eb3454b0fbec60fd894bab.1306089781.git.sgw@linux.intel.com>
References: <cover.1306089781.git.sgw@linux.intel.com>
	<f69c937a66b3dc7055eb3454b0fbec60fd894bab.1306089781.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.1 (3.0.1-1.fc15) 
Message-ID: <1306099241.1995.1.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 2/9] update-alternatives-dpkg: Update to dpkg base 1.15.8.7
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
X-List-Received-Date: Sun, 22 May 2011 21:23:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-05-22 at 11:48 -0700, Saul Wold wrote:
> [YOCTO #1062]

Can we include more of a description than just the bug ID here? It's a
pain to have to switch to the browser when your navigating git logs to
try and understand changes. Further it makes patches more difficult to
review.

I thought we'd encoded this in our patch policy?

Cheers,
Joshua

> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../update-alternatives-dpkg.inc                   |    6 ++++--
>  .../update-alternatives-dpkg_1.13.22.bb            |    7 -------
>  .../update-alternatives-dpkg_1.15.8.7.bb           |   13 +++++++++++++
>  3 files changed, 17 insertions(+), 9 deletions(-)
>  delete mode 100644 meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.13.22.bb
>  create mode 100644 meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.15.8.7.bb
> 
> diff --git a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
> index 9b53df8..63bfe95 100644
> --- a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
> +++ b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
> @@ -5,10 +5,12 @@ programs fulfilling the same or similar functions and how they can be installed
>  time."
>  LICENSE = "GPL"
>  SECTION = "base"
> -SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.gz"
> +SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2"
>  S = "${WORKDIR}/dpkg-${PV}"
>  PACKAGE_ARCH = "all"
> -PR = "r2"
> +PR = "r0"
> +
> +inherit gettext
>  
>  do_patch () {
>      cat ${S}/scripts/update-alternatives.pl | \
> diff --git a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.13.22.bb b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.13.22.bb
> deleted file mode 100644
> index 5d38d5d..0000000
> --- a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.13.22.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require update-alternatives-dpkg.inc
> -
> -PROVIDES += "virtual/update-alternatives"
> -RPROVIDES_${PN} += "update-alternatives"
> -EXTRA_RDEPENDS = "perl dpkg"
> -EXTRA_RDEPENDS_virtclass-native = ""
> -RDEPENDS_${PN} += "${EXTRA_RDEPENDS}"
> diff --git a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.15.8.7.bb b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.15.8.7.bb
> new file mode 100644
> index 0000000..15f3ced
> --- /dev/null
> +++ b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.15.8.7.bb
> @@ -0,0 +1,13 @@
> +require update-alternatives-dpkg.inc
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +
> +SRC_URI[md5sum] = "d1731d4147c1ea3b537a4d094519a6dc"
> +SRC_URI[sha256sum] = "1ec1376471b04717a4497e5d7a27cd545248c92116898ce0c53ced8ea94267b5"
> +
> +
> +PROVIDES += "virtual/update-alternatives"
> +RPROVIDES_${PN} += "update-alternatives"
> +EXTRA_RDEPENDS = "perl dpkg"
> +EXTRA_RDEPENDS_virtclass-native = ""
> +RDEPENDS_${PN} += "${EXTRA_RDEPENDS}"

-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



