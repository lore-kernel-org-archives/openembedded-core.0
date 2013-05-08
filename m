Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ua5ei-0000ar-EP
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 16:47:44 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 May 2013 07:27:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,635,1363158000"; d="scan'208";a="310172320"
Received: from unknown (HELO [10.255.13.9]) ([10.255.13.9])
	by orsmga001.jf.intel.com with ESMTP; 08 May 2013 07:29:40 -0700
Message-ID: <518A6154.6090007@linux.intel.com>
Date: Wed, 08 May 2013 07:29:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
References: <1368014380-23653-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1368014380-23653-1-git-send-email-bogdan.a.marinescu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gdb: upgraded to 7.6
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
X-List-Received-Date: Wed, 08 May 2013 14:47:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2013 04:59 AM, Bogdan Marinescu wrote:
> 'gdbserver-cflags-last.diff' was integrated into upstream.
>
Was it really?  I note that the patch from Marcin still incorporates a 
similar patch, please verify this should not be a rebase.


Sau!

> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>   meta/recipes-devtools/gdb/gdb-common.inc            |    6 ++----
>   ...-canadian_7.5.1.bb => gdb-cross-canadian_7.6.bb} |    2 --
>   .../gdb/{gdb-cross_7.5.1.bb => gdb-cross_7.6.bb}    |    2 --
>   meta/recipes-devtools/gdb/gdb.inc                   |    1 -
>   .../gdb/gdb/gdbserver-cflags-last.diff              |   19 -------------------
>   .../gdb/{gdb_7.5.1.bb => gdb_7.6.bb}                |    1 -
>   6 files changed, 2 insertions(+), 29 deletions(-)
>   rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.5.1.bb => gdb-cross-canadian_7.6.bb} (87%)
>   rename meta/recipes-devtools/gdb/{gdb-cross_7.5.1.bb => gdb-cross_7.6.bb} (82%)
>   delete mode 100644 meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff
>   rename meta/recipes-devtools/gdb/{gdb_7.5.1.bb => gdb_7.6.bb} (94%)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> index f574d5c..eca66b4 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -12,8 +12,6 @@ LTTNGUST_mips64 = ""
>   LTTNGUST_mips64el = ""
>   LTTNGUST_sh4 = ""
>
> -INC_PR = "r0"
> -
>   LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>   		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
>   		file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
> @@ -22,8 +20,8 @@ inherit autotools
>
>   SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
>             "
> -SRC_URI[md5sum] = "b1519bf899890d21d4774845a6e602fe"
> -SRC_URI[sha256sum] = "f99f26e2c1127f12ba14ece0947a9a9948be45e96b69ef363131e469a698636e"
> +SRC_URI[md5sum] = "a9836707337e5f7bf76a009a8904f470"
> +SRC_URI[sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
>
>   export CC_FOR_BUILD = "${BUILD_CC}"
>   export CXX_FOR_BUILD = "${BUILD_CXX}"
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.5.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb
> similarity index 87%
> rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.5.1.bb
> rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb
> index c15aa7a..cbb7402 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.5.1.bb
> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb
> @@ -1,8 +1,6 @@
>   require gdb-common.inc
>   require gdb-cross-canadian.inc
>
> -PR = "${INC_PR}.0"
> -
>   GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
>
>   S = "${WORKDIR}/${BPN}-${PV}"
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.5.1.bb b/meta/recipes-devtools/gdb/gdb-cross_7.6.bb
> similarity index 82%
> rename from meta/recipes-devtools/gdb/gdb-cross_7.5.1.bb
> rename to meta/recipes-devtools/gdb/gdb-cross_7.6.bb
> index a14d0ba..8836119 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross_7.5.1.bb
> +++ b/meta/recipes-devtools/gdb/gdb-cross_7.6.bb
> @@ -2,6 +2,4 @@ require gdb-cross.inc
>
>   SRC_URI += "file://sim-install-6.6.patch"
>
> -PR = "${INC_PR}.0"
> -
>   S = "${WORKDIR}/${BPN}-${PV}"
> diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
> index a620eca..eb65939 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -3,7 +3,6 @@ require gdb-common.inc
>   inherit gettext
>
>   SRC_URI += "file://kill_arm_map_symbols.patch \
> -            file://gdbserver-cflags-last.diff;striplevel=0 \
>   	    file://renesas-sh-native-support.patch \
>              "
>   #LDFLAGS_append = " -s"
> diff --git a/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff b/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff
> deleted file mode 100644
> index 8256f17..0000000
> --- a/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: gdb/gdbserver/Makefile.in
> -===================================================================
> ---- gdb/gdbserver/Makefile.in.orig	2011-03-09 23:32:02.000000000 -0800
> -+++ gdb/gdbserver/Makefile.in	2011-08-05 21:16:43.592202579 -0700
> -@@ -94,10 +94,10 @@
> - CFLAGS = @CFLAGS@
> -
> - # INTERNAL_CFLAGS is the aggregate of all other *CFLAGS macros.
> --INTERNAL_CFLAGS_BASE =  ${CFLAGS} ${GLOBAL_CFLAGS} \
> -+INTERNAL_CFLAGS_BASE =  ${GLOBAL_CFLAGS} \
> - 	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS}
> - INTERNAL_WARN_CFLAGS =  ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
> --INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS)
> -+INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) ${CFLAGS}
> -
> - # LDFLAGS is specifically reserved for setting from the command line
> - # when running make.
> diff --git a/meta/recipes-devtools/gdb/gdb_7.5.1.bb b/meta/recipes-devtools/gdb/gdb_7.6.bb
> similarity index 94%
> rename from meta/recipes-devtools/gdb/gdb_7.5.1.bb
> rename to meta/recipes-devtools/gdb/gdb_7.6.bb
> index 0645b56..cd323f5 100644
> --- a/meta/recipes-devtools/gdb/gdb_7.5.1.bb
> +++ b/meta/recipes-devtools/gdb/gdb_7.6.bb
> @@ -4,6 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>   		    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
>   		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
>   		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
> -PR = "${INC_PR}.0"
>
>   S = "${WORKDIR}/${BPN}-${PV}"
>


