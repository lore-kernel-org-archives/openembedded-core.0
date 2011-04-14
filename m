Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QATPz-0000FE-IR
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Apr 2011 22:45:36 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Apr 2011 13:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,213,1301900400"; d="scan'208";a="679180228"
Received: from unknown (HELO [10.255.12.232]) ([10.255.12.232])
	by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2011 13:43:02 -0700
Message-ID: <4DA75C55.5070509@linux.intel.com>
Date: Thu, 14 Apr 2011 13:43:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1302785059-27608-1-git-send-email-michael.lippautz@gmail.com>
In-Reply-To: <1302785059-27608-1-git-send-email-michael.lippautz@gmail.com>
Subject: Re: [PATCH] util-macros/preferred-xorg-versions: Update to	1.13.0
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
X-List-Received-Date: Thu, 14 Apr 2011 20:45:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/14/2011 05:44 AM, Michael Lippautz wrote:
> * Deps are taken from org.openembedded.dev
Which Deps changed?

> * Required by libx11 1.4.3+
>
> Signed-off-by: Michael Lippautz<michael.lippautz@gmail.com>
> ---
>   .../distro/include/preferred-xorg-versions.inc     |    4 +-
>   meta/recipes-graphics/xorg-util/util-macros.inc    |   18 +++++++++++++++
>   .../xorg-util/util-macros_1.11.0.bb                |   24 --------------------
>   .../xorg-util/util-macros_1.13.0.bb                |    7 +++++
>   4 files changed, 27 insertions(+), 26 deletions(-)
>   create mode 100644 meta/recipes-graphics/xorg-util/util-macros.inc
>   delete mode 100644 meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
>   create mode 100644 meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
>
Why did you split this into an include file based recipe?


> diff --git a/meta/conf/distro/include/preferred-xorg-versions.inc b/meta/conf/distro/include/preferred-xorg-versions.inc
> index b164b77..dd67d95 100644
> --- a/meta/conf/distro/include/preferred-xorg-versions.inc
> +++ b/meta/conf/distro/include/preferred-xorg-versions.inc
> @@ -92,8 +92,8 @@ PREFERRED_VERSION_renderproto-nativesdk ?= "0.11.1"
>   PREFERRED_VERSION_resourceproto ?= "1.1.1"
>   PREFERRED_VERSION_scrnsaverproto ?= "1.2.1"
>   PREFERRED_VERSION_trapproto ?= "3.4.3"
> -PREFERRED_VERSION_util-macros ?= "1.11.0"
> -PREFERRED_VERSION_util-macros-native ?= "1.11.0"
> +PREFERRED_VERSION_util-macros ?= "1.13.0"
> +PREFERRED_VERSION_util-macros-native ?= "1.13.0"
>   PREFERRED_VERSION_videoproto ?= "2.3.1"
>   PREFERRED_VERSION_windowswmproto ?= "1.0.4"
>   PREFERRED_VERSION_x11perf ?= "1.5.2"
> diff --git a/meta/recipes-graphics/xorg-util/util-macros.inc b/meta/recipes-graphics/xorg-util/util-macros.inc
> new file mode 100644
> index 0000000..06e3b0f
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-util/util-macros.inc
> @@ -0,0 +1,18 @@
> +require xorg-util-common.inc
> +
> +SUMMARY = "X autotools macros"
> +DESCRIPTION = "M4 autotools macros used by various X.org programs."
> +LICENSE = "MIT&  MIT-style"
Minor nits:

This should have a space between the "MIT &"
> +
> +INC_PR = "r2"
Since this is a new .inc, we start from r0

> +PE = "1"
> +
> +ALLOW_EMPTY = "1"
> +BBCLASSEXTEND = "native nativesdk"
> +
> +DEPENDS = "libgpg-error"
> +DEPENDS_virtclass-native = "gettext"
> +DEPENDS_virtclass-nativesdk = "gettext"
> +
> +RDEPENDS_${PN}-dev = ""
> +RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPV})"
> diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
> deleted file mode 100644
> index 765a577..0000000
> --- a/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -SUMMARY = "X autotools macros"
> -
> -DESCRIPTION = "M4 autotools macros used by various X.org programs."
> -
> -require xorg-util-common.inc
> -
> -LICENSE = "MIT&  MIT-style"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1970511fddd439b07a6ba789d28ff662"
> -
> -PE = "1"
> -PR = "r0"
> -
> -# ${PN} is empty so we need to tweak -dev and -dbg package dependencies
> -DEPENDS = "libgpg-error"
> -DEPENDS_virtclass-native = "gettext"
> -DEPENDS_virtclass-nativesdk = "gettext"
> -
> -RDEPENDS_${PN}-dev = ""
> -RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPV})"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -SRC_URI[md5sum] = "8580021f3a9e242ab09d23d62e475d53"
> -SRC_URI[sha256sum] = "212c3d14474d7cffdbc22437d4896211a5dce6b99b02b96229c9be7d963c90cf"
> diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
> new file mode 100644
> index 0000000..0eff870
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
> @@ -0,0 +1,7 @@
> +require util-macros.inc
> +
> +PR = "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] = "31e9ddcbc1d8bc8c09ab180443974dd1"
> +SRC_URI[archive.sha256sum] = "7bff944fb120192e7fe1706e9c0b7e41666e7983ce3e2bdef0b7734392d9e695"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1970511fddd439b07a6ba789d28ff662"


