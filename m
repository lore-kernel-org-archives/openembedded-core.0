Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SD9L6-00011R-UL
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 09:00:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2T6p4bq015762
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Mar 2012 23:51:04 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 28 Mar 2012 23:51:04 -0700
Message-ID: <4F740656.4010903@windriver.com>
Date: Thu, 29 Mar 2012 14:51:02 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1332964015-1069-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1332964015-1069-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] qt4: move from 4.8.0 to 4.8.1
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
X-List-Received-Date: Thu, 29 Mar 2012 07:00:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Andreas,

I have one question about the qt-x11-free, is it possible to enable
the "-sm -accessibility" in oe-core, please? There is a meta-kde
layer which requires the "-sm -accessibility", but they are disabled
in oe-core currently:

QT_DISTRO_FLAGS ?= "-no-accessibility -no-sm"

So there is a "qt4-x11-free_4.8.0.bbappend" in meta-kde, once the
the oe-core upgrade to 4.8.1, then the meta-kde has to uprade again.

I checked the log of the qt4, can't find the relative log for
"-no-accessibility -no-sm".

If it is possible to enable them in oe-core, I'd like to send a patch for
them.

// Robert

On 03/29/2012 03:46 AM, Andreas Oberritter wrote:
> * No changes other than source checksums and PR at recipe level.
> * DEFAULT_PREFERENCE still set to -1
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
> * Considering that OE-core is in a stabilization phase, updating
>    Qt may be a bad idea. However, version 4.8.0 has D_P=-1, so
>    4.7.4 still gets built by default.
>
> * Even if this won't get applied now, other people might be
>    interested in testing this version and giving feedback.
>
> * This recipe has been compile-tested on x86 and x86_64
>    for mips32el (qt4-native and qt4-embedded).
>
>   meta/recipes-qt/qt4/{qt-4.8.0.inc =>  qt-4.8.1.inc} |    4 ++--
>   .../0001-Added-Openembedded-crossarch-option.patch |    0
>   .../{qt-4.8.0 =>  qt-4.8.1}/configure-lflags.patch  |    0
>   .../configure_oe_compiler.patch                    |    0
>   .../{qt-4.8.0 =>  qt-4.8.1}/fix-translations.patch  |    0
>   .../recipes-qt/qt4/{qt-4.8.0 =>  qt-4.8.1}/g++.conf |    0
>   .../hack-out-pg2-4.7.0.patch                       |    0
>   .../qt4/{qt-4.8.0 =>  qt-4.8.1}/linux.conf          |    0
>   .../{qt-4.8.0 =>  qt-4.8.1}/pulseaudio-config.patch |    0
>   .../{qt-4.8.0 =>  qt-4.8.1}/qmake_cxx_eval.patch    |    0
>   .../{qt-4.8.0 =>  qt-4.8.1}/qmake_pri_fixes.patch   |    0
>   ...qt4-embedded_4.8.0.bb =>  qt4-embedded_4.8.1.bb} |    2 +-
>   .../{qt4-native_4.8.0.bb =>  qt4-native_4.8.1.bb}   |    4 ++--
>   meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb   |   10 ----------
>   meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb   |   10 ++++++++++
>   ...qt4-x11-free_4.8.0.bb =>  qt4-x11-free_4.8.1.bb} |    2 +-
>   16 files changed, 16 insertions(+), 16 deletions(-)
>   rename meta/recipes-qt/qt4/{qt-4.8.0.inc =>  qt-4.8.1.inc} (93%)
>   rename meta/recipes-qt/qt4/{qt-4.8.0 =>  qt-4.8.1}/0001-Added-Openembedded-crossarch-option.patch (100%)
>   rename meta/recipes-qt/qt4/{qt-4.8.0 =>  qt-4.8.1}/configure-lflags.patch (100%)
>   rename meta/recipes-qt/qt4/{qt-4.8.0 =>  qt-4.8.1}/configure_oe_compiler.patch (100%)
>   rename meta/recipes-qt/qt4/{qt-4.8.0 =>  qt-4.8.1}/fix-translations.patch (100%)
>   rename meta/recipes-qt/qt4/{qt-4.8.0 =>  qt-4.8.1}/g++.conf (100%)
>   rename meta/recipes-qt/qt4/{qt-4.8.0 =>  qt-4.8.1}/hack-out-pg2-4.7.0.patch (100%)
>   rename meta/recipes-qt/qt4/{qt-4.8.0 =>  qt-4.8.1}/linux.conf (100%)
>   rename meta/recipes-qt/qt4/{qt-4.8.0 =>  qt-4.8.1}/pulseaudio-config.patch (100%)
>   rename meta/recipes-qt/qt4/{qt-4.8.0 =>  qt-4.8.1}/qmake_cxx_eval.patch (100%)
>   rename meta/recipes-qt/qt4/{qt-4.8.0 =>  qt-4.8.1}/qmake_pri_fixes.patch (100%)
>   rename meta/recipes-qt/qt4/{qt4-embedded_4.8.0.bb =>  qt4-embedded_4.8.1.bb} (89%)
>   rename meta/recipes-qt/qt4/{qt4-native_4.8.0.bb =>  qt4-native_4.8.1.bb} (60%)
>   delete mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb
>   create mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb
>   rename meta/recipes-qt/qt4/{qt4-x11-free_4.8.0.bb =>  qt4-x11-free_4.8.1.bb} (90%)
>
> diff --git a/meta/recipes-qt/qt4/qt-4.8.0.inc b/meta/recipes-qt/qt4/qt-4.8.1.inc
> similarity index 93%
> rename from meta/recipes-qt/qt4/qt-4.8.0.inc
> rename to meta/recipes-qt/qt4/qt-4.8.1.inc
> index c0d90cd..cd78401 100644
> --- a/meta/recipes-qt/qt4/qt-4.8.0.inc
> +++ b/meta/recipes-qt/qt4/qt-4.8.1.inc
> @@ -22,8 +22,8 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
>              file://linux.conf \
>              "
>
> -SRC_URI[md5sum] = "e8a5fdbeba2927c948d9f477a6abe904"
> -SRC_URI[sha256sum] = "9392b74e485e15f75a3e07a527547d4f6747eaf55ebce71ba0e863a9fd320b6e"
> +SRC_URI[md5sum] = "7960ba8e18ca31f0c6e4895a312f92ff"
> +SRC_URI[sha256sum] = "ef851a36aa41b4ad7a3e4c96ca27eaed2a629a6d2fa06c20f072118caed87ae8"
>
>   S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
>
> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/0001-Added-Openembedded-crossarch-option.patch b/meta/recipes-qt/qt4/qt-4.8.1/0001-Added-Openembedded-crossarch-option.patch
> similarity index 100%
> rename from meta/recipes-qt/qt4/qt-4.8.0/0001-Added-Openembedded-crossarch-option.patch
> rename to meta/recipes-qt/qt4/qt-4.8.1/0001-Added-Openembedded-crossarch-option.patch
> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/configure-lflags.patch b/meta/recipes-qt/qt4/qt-4.8.1/configure-lflags.patch
> similarity index 100%
> rename from meta/recipes-qt/qt4/qt-4.8.0/configure-lflags.patch
> rename to meta/recipes-qt/qt4/qt-4.8.1/configure-lflags.patch
> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/configure_oe_compiler.patch b/meta/recipes-qt/qt4/qt-4.8.1/configure_oe_compiler.patch
> similarity index 100%
> rename from meta/recipes-qt/qt4/qt-4.8.0/configure_oe_compiler.patch
> rename to meta/recipes-qt/qt4/qt-4.8.1/configure_oe_compiler.patch
> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/fix-translations.patch b/meta/recipes-qt/qt4/qt-4.8.1/fix-translations.patch
> similarity index 100%
> rename from meta/recipes-qt/qt4/qt-4.8.0/fix-translations.patch
> rename to meta/recipes-qt/qt4/qt-4.8.1/fix-translations.patch
> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/g++.conf b/meta/recipes-qt/qt4/qt-4.8.1/g++.conf
> similarity index 100%
> rename from meta/recipes-qt/qt4/qt-4.8.0/g++.conf
> rename to meta/recipes-qt/qt4/qt-4.8.1/g++.conf
> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/hack-out-pg2-4.7.0.patch b/meta/recipes-qt/qt4/qt-4.8.1/hack-out-pg2-4.7.0.patch
> similarity index 100%
> rename from meta/recipes-qt/qt4/qt-4.8.0/hack-out-pg2-4.7.0.patch
> rename to meta/recipes-qt/qt4/qt-4.8.1/hack-out-pg2-4.7.0.patch
> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/linux.conf b/meta/recipes-qt/qt4/qt-4.8.1/linux.conf
> similarity index 100%
> rename from meta/recipes-qt/qt4/qt-4.8.0/linux.conf
> rename to meta/recipes-qt/qt4/qt-4.8.1/linux.conf
> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/pulseaudio-config.patch b/meta/recipes-qt/qt4/qt-4.8.1/pulseaudio-config.patch
> similarity index 100%
> rename from meta/recipes-qt/qt4/qt-4.8.0/pulseaudio-config.patch
> rename to meta/recipes-qt/qt4/qt-4.8.1/pulseaudio-config.patch
> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/qmake_cxx_eval.patch b/meta/recipes-qt/qt4/qt-4.8.1/qmake_cxx_eval.patch
> similarity index 100%
> rename from meta/recipes-qt/qt4/qt-4.8.0/qmake_cxx_eval.patch
> rename to meta/recipes-qt/qt4/qt-4.8.1/qmake_cxx_eval.patch
> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/qmake_pri_fixes.patch b/meta/recipes-qt/qt4/qt-4.8.1/qmake_pri_fixes.patch
> similarity index 100%
> rename from meta/recipes-qt/qt4/qt-4.8.0/qmake_pri_fixes.patch
> rename to meta/recipes-qt/qt4/qt-4.8.1/qmake_pri_fixes.patch
> diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb b/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
> similarity index 89%
> rename from meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb
> rename to meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
> index efbc02a..5c1c97e 100644
> --- a/meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb
> +++ b/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
> @@ -1,7 +1,7 @@
>   require qt-${PV}.inc
>   require qt4-embedded.inc
>
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.0"
>
>   DEFAULT_PREFERENCE = "-1"
>
> diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.0.bb b/meta/recipes-qt/qt4/qt4-native_4.8.1.bb
> similarity index 60%
> rename from meta/recipes-qt/qt4/qt4-native_4.8.0.bb
> rename to meta/recipes-qt/qt4/qt4-native_4.8.1.bb
> index 86c0500..d991c03 100644
> --- a/meta/recipes-qt/qt4/qt4-native_4.8.0.bb
> +++ b/meta/recipes-qt/qt4/qt4-native_4.8.1.bb
> @@ -9,6 +9,6 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
>
>   TOBUILD := "src/tools/bootstrap ${TOBUILD}"
>
> -SRC_URI[md5sum] = "e8a5fdbeba2927c948d9f477a6abe904"
> -SRC_URI[sha256sum] = "9392b74e485e15f75a3e07a527547d4f6747eaf55ebce71ba0e863a9fd320b6e"
> +SRC_URI[md5sum] = "7960ba8e18ca31f0c6e4895a312f92ff"
> +SRC_URI[sha256sum] = "ef851a36aa41b4ad7a3e4c96ca27eaed2a629a6d2fa06c20f072118caed87ae8"
>
> diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb
> deleted file mode 100644
> index 02917fe..0000000
> --- a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require qt4-tools-nativesdk.inc
> -
> -PR = "${INC_PR}.0"
> -
> -SRC_URI += "file://qmake_pri_fixes.patch"
> -
> -DEFAULT_PREFERENCE = "-1"
> -
> -SRC_URI[md5sum] = "e8a5fdbeba2927c948d9f477a6abe904"
> -SRC_URI[sha256sum] = "9392b74e485e15f75a3e07a527547d4f6747eaf55ebce71ba0e863a9fd320b6e"
> diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb
> new file mode 100644
> index 0000000..e6162fc
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb
> @@ -0,0 +1,10 @@
> +require qt4-tools-nativesdk.inc
> +
> +PR = "${INC_PR}.0"
> +
> +SRC_URI += "file://qmake_pri_fixes.patch"
> +
> +DEFAULT_PREFERENCE = "-1"
> +
> +SRC_URI[md5sum] = "7960ba8e18ca31f0c6e4895a312f92ff"
> +SRC_URI[sha256sum] = "ef851a36aa41b4ad7a3e4c96ca27eaed2a629a6d2fa06c20f072118caed87ae8"
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
> similarity index 90%
> rename from meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
> rename to meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
> index 6a0b0b8..edd3e0e 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
> +++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
> @@ -1,7 +1,7 @@
>   require qt4-x11-free.inc
>   require qt-${PV}.inc
>
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.0"
>
>   DEFAULT_PREFERENCE = "-1"
>


