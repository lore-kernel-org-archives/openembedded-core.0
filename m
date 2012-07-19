Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrlNX-0006CC-Nc
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 09:42:31 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jul 2012 00:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="180293475"
Received: from unknown (HELO [10.255.12.217]) ([10.255.12.217])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2012 00:30:50 -0700
Message-ID: <5007B7AA.5060102@linux.intel.com>
Date: Thu, 19 Jul 2012 00:30:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1342680286-12886-1-git-send-email-koen@dominion.thruhere.net>
	<1342680286-12886-2-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1342680286-12886-2-git-send-email-koen@dominion.thruhere.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [for-denzil][PATCH 2/5] xz: update to 5.1.2alpha
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
X-List-Received-Date: Thu, 19 Jul 2012 07:42:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/2012 11:44 PM, Koen Kooi wrote:
> This contains bugfixes from the 5.0.3 and 5.0.4 releases
>
Koen,

Normally package updates are not part of minor releases, can you provide 
additional justification why this update should be included in a minor 
release?  You mention bugfixes, is there a specific bug that affects the 
compression operation in 1.1?

Sau!

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/recipes-extended/xz/xz_5.1.1alpha.bb |   28 ----------------------------
>   meta/recipes-extended/xz/xz_5.1.2alpha.bb |   25 +++++++++++++++++++++++++
>   2 files changed, 25 insertions(+), 28 deletions(-)
>   delete mode 100644 meta/recipes-extended/xz/xz_5.1.1alpha.bb
>   create mode 100644 meta/recipes-extended/xz/xz_5.1.2alpha.bb
>
> diff --git a/meta/recipes-extended/xz/xz_5.1.1alpha.bb b/meta/recipes-extended/xz/xz_5.1.1alpha.bb
> deleted file mode 100644
> index 7fa7177..0000000
> --- a/meta/recipes-extended/xz/xz_5.1.1alpha.bb
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -DESCRIPTION = "utils for managing LZMA compressed files"
> -HOMEPAGE = "http://tukaani.org/xz/"
> -SECTION = "base"
> -
> -LICENSE = "GPLv2+ & GPLv3+ & LGPLv2.1+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
> -                    file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
> -                    file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
> -                    file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 "
> -
> -SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "bb24436fa12780808e1c142980484104"
> -SRC_URI[sha256sum] = "54e59a83690a4a0ec88a7d7c3bdef90c6b196c892a93463863c71c24fe87951a"
> -
> -PR = "r0"
> -
> -inherit autotools gettext
> -
> -PACKAGES =+ "liblzma liblzma-dev liblzma-staticdev liblzma-dbg"
> -
> -FILES_liblzma = "${libdir}/liblzma*${SOLIBS}"
> -FILES_liblzma-dev = "${includedir}/lzma* ${libdir}/liblzma*${SOLIBSDEV} ${libdir}/liblzma.la ${libdir}/pkgconfig/liblzma.pc"
> -FILES_liblzma-staticdev = "${libdir}/liblzma.a"
> -FILES_liblzma-dbg = "${libdir}/.debug/liblzma*"
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-extended/xz/xz_5.1.2alpha.bb b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
> new file mode 100644
> index 0000000..9d68720
> --- /dev/null
> +++ b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION = "utils for managing LZMA compressed files"
> +HOMEPAGE = "http://tukaani.org/xz/"
> +SECTION = "base"
> +
> +LICENSE = "GPLv2+ & GPLv3+ & LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
> +                    file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
> +                    file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
> +                    file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 "
> +
> +SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
> +SRC_URI[md5sum] = "9bad1e249537ce69b206815cf28ca87b"
> +SRC_URI[sha256sum] = "70e792d2a67cfbb8f2dffd0feab6ca6e5a4a618d65070fb44a367629d1ba94e5"
> +
> +inherit autotools gettext
> +
> +PACKAGES =+ "liblzma liblzma-dev liblzma-staticdev liblzma-dbg"
> +
> +FILES_liblzma = "${libdir}/liblzma*${SOLIBS}"
> +FILES_liblzma-dev = "${includedir}/lzma* ${libdir}/liblzma*${SOLIBSDEV} ${libdir}/liblzma.la ${libdir}/pkgconfig/liblzma.pc"
> +FILES_liblzma-staticdev = "${libdir}/liblzma.a"
> +FILES_liblzma-dbg = "${libdir}/.debug/liblzma*"
> +
> +BBCLASSEXTEND = "native"
>



