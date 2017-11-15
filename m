Return-Path: <prvs=4852871d9=mnhu@prevas.dk>
X-Greylist: delayed 948 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Nov 2017 12:00:41 UTC
Received: from mail02.prevas.se (mail02.prevas.se [62.95.78.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3A42378478
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 12:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=5195; q=dns/txt;
	s=ironport2; t=1510747244; x=1542283244;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=5uhDWFay+ic/5TM1b8Z9KmGkxoMxVIyfHpC9q5KvBVs=;
	b=w7F7gIwafz03P07WqwyEPJQS9ZGCghdLMYn+xPoxBSgHX2+tJnbv5jyf
	SRHajR40ZeRjDboeMwKU5u7kJ4rczPD7k0kOR/OUZfNLZ6KEbeU7yzNNr
	YiCvB04zKN2uSw2beIufQyxhx6iEwUE5FiTSKf/V2L9dqYb8w73nSSpAY s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GpAABRKAxa/+iTuFUNUBoBAQEBAQIBA?=
	=?us-ascii?q?QEBCAEBAQGEGoEVg3+bOohbkBAKG4EThA0ChU0UAQEBAQEBAQEBA4UYWzwBAQE?=
	=?us-ascii?q?DIxUTAT0LDQsCAiYCAiE2BgEMBgIBAYoIAwinJ2uCJyGDbgGDMQ2DSQEBAQEBA?=
	=?us-ascii?q?QQBAQEBAQEBAQEfgQ+CJYVugkw1gmuFQoJjBYotiTWOGD2HbYgfAYR5gnaJIIc?=
	=?us-ascii?q?ujSiFFAGDcIE5NmSBMjQpMoMtCYRXdgGIYAEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2GpAABRKAxa/+iTuFUNUBoBAQEBAQIBAQEBCAEBAQGEGoE?=
	=?us-ascii?q?Vg3+bOohbkBAKG4EThA0ChU0UAQEBAQEBAQEBA4UYWzwBAQEDIxUTAT0LDQsCA?=
	=?us-ascii?q?iYCAiE2BgEMBgIBAYoIAwinJ2uCJyGDbgGDMQ2DSQEBAQEBAQQBAQEBAQEBAQE?=
	=?us-ascii?q?fgQ+CJYVugkw1gmuFQoJjBYotiTWOGD2HbYgfAYR5gnaJIIcujSiFFAGDcIE5N?=
	=?us-ascii?q?mSBMjQpMoMtCYRXdgGIYAEBAQ?=
X-IronPort-AV: E=Sophos;i="5.44,399,1505772000"; 
   d="scan'208";a="2685630"
Received: from unknown (HELO [10.0.0.232]) ([85.184.147.232])
	by mail02.prevas.se with ESMTP/TLS/DHE-RSA-AES128-SHA;
	15 Nov 2017 12:42:58 +0100
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1510744037.git.alexander.kanavin@linux.intel.com>
	<e92a4137ae84734d1e3b5805964054305ce2388d.1510744037.git.alexander.kanavin@linux.intel.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <7fed5f8c-c678-40b5-e788-f4fa13b94676@prevas.dk>
Date: Wed, 15 Nov 2017 12:42:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <e92a4137ae84734d1e3b5805964054305ce2388d.1510744037.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 1/7] meson: add a recipe and class from meta-oe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Nov 2017 12:00:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-IE
Content-Transfer-Encoding: 7bit

Hi,

On 2017-11-15 12:08, Alexander Kanavin wrote:
> The original recipe has been provided and improved by:
> 
> Ross Burton <ross.burton@intel.com>
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> Adam C. Foltzer <acfoltzer@galois.com>
> Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Linus Svensson <linussn@axis.com>
> 
> I have added a couple patches to fix up gtk-doc and
> gobject-introspection in cross-compilation environments.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>   meta/classes/meson.bbclass                         | 103 +++++++++++++++++++
>   ...ix-issues-that-arise-when-cross-compiling.patch | 113 +++++++++++++++++++++
>   ...rospection-determine-g-ir-scanner-and-g-i.patch |  41 ++++++++
>   meta/recipes-devtools/meson/meson_0.43.0.bb        |  19 ++++
>   4 files changed, 276 insertions(+)
>   create mode 100644 meta/classes/meson.bbclass
>   create mode 100644 meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
>   create mode 100644 meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
>   create mode 100644 meta/recipes-devtools/meson/meson_0.43.0.bb
> 
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> new file mode 100644
> index 00000000000..f6cf24c33a7
> --- /dev/null
> +++ b/meta/classes/meson.bbclass
> @@ -0,0 +1,103 @@
> +inherit python3native
> +
> +DEPENDS_append = " meson-native ninja-native"
> +
> +# As Meson enforces out-of-tree builds we can just use cleandirs
> +B = "${WORKDIR}/build"
> +do_configure[cleandirs] = "${B}"
> +
> +# Where the meson.build build configuration is
> +MESON_SOURCEPATH = "${S}"
> +
> +# These variables in the environment override meson's *native* tools settings.
> +# We have to unset them, so that meson doesn't pick up the cross tools and
> +# use them for native builds.
> +unset CC
> +unset CXX
> +unset AR
> +
> +def noprefix(var, d):
> +    return d.getVar(var, True).replace(d.getVar('prefix', True) + '/', '', 1)
> +
> +MESONOPTS = " --prefix ${prefix} \
> +              --bindir ${@noprefix('bindir', d)} \
> +              --sbindir ${@noprefix('sbindir', d)} \
> +              --datadir ${@noprefix('datadir', d)} \
> +              --libdir ${@noprefix('libdir', d)} \
> +              --libexecdir ${@noprefix('libexecdir', d)} \
> +              --includedir ${@noprefix('includedir', d)} \
> +              --mandir ${@noprefix('mandir', d)} \
> +              --infodir ${@noprefix('infodir', d)} \
> +              --sysconfdir ${sysconfdir} \
> +              --localstatedir ${localstatedir} \
> +              --sharedstatedir ${sharedstatedir}"
> +
> +MESON_C_ARGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> +MESON_LINK_ARGS = "${MESON_C_ARGS} ${LDFLAGS}"
> +
> +MESON_HOST_ENDIAN = "${@bb.utils.contains('SITEINFO_ENDIANNESS', 'be', 'big', 'little', d)}"
> +MESON_TARGET_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'big', 'little', d)}"
> +
> +EXTRA_OEMESON += "${PACKAGECONFIG_CONFARGS}"
> +
> +MESON_CROSS_FILE = ""
> +MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"

Shouldn't nativesdk builds use a meson.cross file too?

> +
> +def meson_array(var, d):
> +    return "', '".join(d.getVar(var, True).split()).join(("'", "'"))
> +
> +addtask write_config before do_configure
> +do_write_config[vardeps] += "MESON_C_ARGS TOOLCHAIN_OPTIONS"
> +do_write_config() {
> +    # This needs to be Py to split the args into single-element lists
> +    cat >${WORKDIR}/meson.cross <<EOF
> +[binaries]
> +c = '${HOST_PREFIX}gcc'
> +cpp = '${HOST_PREFIX}g++'
> +ar = '${HOST_PREFIX}ar'
> +ld = '${HOST_PREFIX}ld'
> +strip = '${HOST_PREFIX}strip'
> +readelf = '${HOST_PREFIX}readelf'
> +pkgconfig = 'pkg-config'
> +
> +[properties]
> +needs_exe_wrapper = true
> +c_args = [${@meson_array('MESON_C_ARGS', d)}]
> +c_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
> +cpp_args = [${@meson_array('MESON_C_ARGS', d)}]
> +cpp_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
> +gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
> +
> +[host_machine]
> +system = '${HOST_OS}'
> +cpu_family = '${HOST_ARCH}'
> +cpu = '${HOST_ARCH}'
> +endian = '${MESON_HOST_ENDIAN}'
> +
> +[target_machine]
> +system = '${TARGET_OS}'
> +cpu_family = '${TARGET_ARCH}'
> +cpu = '${TARGET_ARCH}'
> +endian = '${MESON_TARGET_ENDIAN}'
> +EOF
> +}

Is meson.cross also written for native builds? If so, isn't there a way 
to avoid that?

> +
> +CONFIGURE_FILES = "meson.build"
> +
> +meson_do_configure() {
> +    if ! meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" ${MESON_CROSS_FILE} ${EXTRA_OEMESON}; then
> +        cat ${B}/meson-logs/meson-log.txt
> +        bbfatal_log meson failed
> +    fi
> +}
> +
> +do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
> +meson_do_compile() {
> +    ninja ${PARALLEL_MAKE}
> +}
> +
> +meson_do_install() {
> +    DESTDIR='${D}' ninja ${PARALLEL_MAKEINST} install
> +}
> +
> +EXPORT_FUNCTIONS do_configure do_compile do_install

// Martin

