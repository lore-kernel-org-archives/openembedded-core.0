Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNspc-0000Sn-PS
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 23:36:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Apr 2012 14:26:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="137599541"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by orsmga002.jf.intel.com with ESMTP; 27 Apr 2012 14:26:09 -0700
Message-ID: <4F9B0EF1.5000307@linux.intel.com>
Date: Fri, 27 Apr 2012 14:26:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1334197802-25482-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1334197802-25482-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] python: use PKGSUFFIX for libpython2
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
X-List-Received-Date: Fri, 27 Apr 2012 21:36:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2012 07:30 PM, Andreas Oberritter wrote:
> * python-nativesdk shouldn't provide libpython2, but
>    libpython2-nativesdk.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   meta/recipes-devtools/python/python_2.7.2.bb |    9 ++++++---
>   1 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
> index 8cf45da..ae08748 100644
> --- a/meta/recipes-devtools/python/python_2.7.2.bb
> +++ b/meta/recipes-devtools/python/python_2.7.2.bb
> @@ -1,6 +1,6 @@
>   require python.inc
>   DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
> -PR = "${INC_PR}.9"
> +PR = "${INC_PR}.10"
>
>   DISTRO_SRC_URI ?= "file://sitecustomize.py"
>   DISTRO_SRC_URI_linuxstdbase = ""
> @@ -128,8 +128,8 @@ RRECOMMENDS_${PN}-core = "${PN}-readline"
>   RRECOMMENDS_${PN}-crypt = "openssl"
>
>   # package libpython2
> -PACKAGES =+ "lib${BPN}2"
> -FILES_lib${BPN}2 = "${libdir}/libpython*.so.*"
> +PACKAGES =+ "lib${BPN}2${PKGSUFFIX}"
> +FILES_lib${BPN}2${PKGSUFFIX} = "${libdir}/libpython*.so.*"
>
>   # catch debug extensions (isn't that already in python-core-dbg?)
>   FILES_${PN}-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
> @@ -143,3 +143,6 @@ PACKAGES += "${PN}-man"
>   FILES_${PN}-man = "${datadir}/man"
>
>   BBCLASSEXTEND = "nativesdk"
> +
> +PKGSUFFIX = ""
> +PKGSUFFIX_virtclass-nativesdk = "-nativesdk"


This was merged into OE-Core along with the 2 wpa-supplicant changes

Thanks
	Sau!


