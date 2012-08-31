Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T7TwR-0004iF-5c
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 18:19:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 Aug 2012 09:07:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,347,1344236400"; d="scan'208";a="216362193"
Received: from unknown (HELO [10.255.12.251]) ([10.255.12.251])
	by fmsmga002.fm.intel.com with ESMTP; 31 Aug 2012 09:07:12 -0700
Message-ID: <5040E130.3040102@linux.intel.com>
Date: Fri, 31 Aug 2012 09:07:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1346338319-17685-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1346338319-17685-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glib-2.0: don't disable all debugging functionality
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
X-List-Received-Date: Fri, 31 Aug 2012 16:19:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/30/2012 07:51 AM, Ross Burton wrote:
> GLib will use "minimal" debugging on non-development builds and the extra safety
> net and ability to debug at all is totally worth the small performance cost.
>
> If someone has a need for every ounce of performance, a simple .bbappend can
> restore this option.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb |    2 +-
>   meta/recipes-core/glib-2.0/glib.inc           |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
> index 8f7cd69..7bc97d68 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
> @@ -1,6 +1,6 @@
>   require glib.inc
>
> -PR = "r4"
> +PR = "r5"
>   PE = "1"
>
>   DEPENDS += "libffi python-argparse-native zlib"
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index 3540cd5..9dca440 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -27,7 +27,7 @@ S = "${WORKDIR}/glib-${PV}"
>
>   CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap"
>
> -EXTRA_OECONF = "--disable-debug --enable-included-printf=no ${CORECONF}"
> +EXTRA_OECONF = "--enable-included-printf=no ${CORECONF}"
>   EXTRA_OECONF_virtclass-native = "${CORECONF}"On 08/30/2012 07:51 AM, Ross Burton wrote:> GLib will use "minimal" debugging on non-development builds and the extra safety
> net and ability to debug at all is totally worth the small performance cost.
>
> If someone has a need for every ounce of performance, a simple .bbappend can
> restore this option.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb |    2 +-
>   meta/recipes-core/glib-2.0/glib.inc           |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
> index 8f7cd69..7bc97d68 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
> @@ -1,6 +1,6 @@
>   require glib.inc
>
> -PR = "r4"
> +PR = "r5"
>   PE = "1"
>
>   DEPENDS += "libffi python-argparse-native zlib"
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index 3540cd5..9dca440 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -27,7 +27,7 @@ S = "${WORKDIR}/glib-${PV}"
>
>   CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap"
>
> -EXTRA_OECONF = "--disable-debug --enable-included-printf=no ${CORECONF}"
> +EXTRA_OECONF = "--enable-included-printf=no ${CORECONF}"
>   EXTRA_OECONF_virtclass-native = "${CORECONF}"
>   EXTRA_OECONF_linuxstdbase = "--enable-included-printf=no ${CORECONF}"
>
>
>   EXTRA_OECONF_linuxstdbase = "--enable-included-prinOn 08/30/2012 07:51 AM, Ross Burton wrote:> GLib will use "minimal" debugging on non-development builds and the extra safety
> net and ability to debug at all is totally worth the small performance cost.
>
> If someone has a need for every ounce of performance, a simple .bbappend can
> restore this option.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb |    2 +-
>   meta/recipes-core/glib-2.0/glib.inc           |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
> index 8f7cd69..7bc97d68 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
> @@ -1,6 +1,6 @@
>   require glib.inc
>
> -PR = "r4"
> +PR = "r5"
>   PE = "1"
>
>   DEPENDS += "libffi python-argparse-native zlib"
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index 3540cd5..9dca440 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -27,7 +27,7 @@ S = "${WORKDIR}/glib-${PV}"
>
>   CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap"
>
> -EXTRA_OECONF = "--disable-debug --enable-included-printf=no ${CORECONF}"
> +EXTRA_OECONF = "--enable-included-printf=no ${CORECONF}"
>   EXTRA_OECONF_virtclass-native = "${CORECONF}"
>   EXTRA_OECONF_linuxstdbase = "--enable-included-printf=no ${CORECONF}"
>
> tf=no ${CORECONF}"
>
>

Merged into OE-Core

Thanks
	Sau!



