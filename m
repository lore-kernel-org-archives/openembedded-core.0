Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7AD65DA3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 17:34:32 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id w8so29074443qac.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 09:34:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jSubLElknvQdH1LKSlGhi0S2AUJXAeFVit6zD1hpz5s=;
	b=DjdVdPcbiiCg/U+ypER1rK5PAXE/HXMRCfkVUOB+beVRzHLPerFCYrQPbUVU7MqY6w
	NiS2IoAe7qV0MtH8gm9EyluU4h0ZtZFNHsZL4E6DC/BcEg0g4+HQZHrLaPWphz7yUKhm
	a4h5QOg1D5FFSp+FL0M9xVkH1WFzz9ugZdlo1wsadYcUlRQBRKEYib0nEm7HdA4BiHZW
	rbcdLgSLQrNbiRfw2TRgyv3dlyHpfrC+VmqNyN92pKEPVRLeAevCUOFdU+iz1UNQMIPL
	VNRugNqeICK1g1qF86qteM2ObocqJt9DDoNYBEEE6cUWgXm3soYK3a1/A11qriIAYEt/
	my3w==
X-Gm-Message-State: ALoCoQkGQ2Lke/Yjn6aI+LhRHOjWXT8mZ+9/3a9fI47jJVc8Ey3iqtcaHUHL9lVVQ+EMuLdlPGc3
X-Received: by 10.140.148.20 with SMTP id 20mr59226009qhu.67.1425404073548;
	Tue, 03 Mar 2015 09:34:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 3 Mar 2015 09:34:13 -0800 (PST)
In-Reply-To: <1425403929-984-1-git-send-email-baptiste.durand@gmail.com>
References: <1425403929-984-1-git-send-email-baptiste.durand@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Mar 2015 17:34:13 +0000
Message-ID: <CAJTo0LbLcu+z8Tq7HxbqQBMRG4FW_kGfWeCXX1myKD8e=MRMEQ@mail.gmail.com>
To: Baptiste DURAND <baptiste.durand@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] minidlna: Fix package and bump to version 1.1.4
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
X-List-Received-Date: Tue, 03 Mar 2015 17:34:36 -0000
Content-Type: multipart/alternative; boundary=001a113bb4cc7738b2051065bf49

--001a113bb4cc7738b2051065bf49
Content-Type: text/plain; charset=UTF-8

Wrong list - meta-oe patches go to openembedded-devel@ not -core@.

Ross

On 3 March 2015 at 17:32, Baptiste DURAND <baptiste.durand@gmail.com> wrote:

> Signed-off-by: Baptiste DURAND <baptiste.durand@gmail.com>
> ---
>  meta-oe/recipes-multimedia/minidlna/minidlna.inc   | 39 ++++++++++++++++
>  .../minidlna/minidlna/minidlna-daemon.init.d       | 54
> ++++++++++++++++++++++
>  .../minidlna/minidlna/minidlna-daemon.service      | 11 +++++
>  .../recipes-multimedia/minidlna/minidlna_1.1.4.bb  |  6 +++
>  .../minidlna/minidlna/fix-makefile.patch           | 41 ----------------
>  .../search-for-headers-in-staging-dir.patch        | 48
> -------------------
>  .../nonworking/minidlna/minidlna_1.0.25.bb         | 19 --------
>  7 files changed, 110 insertions(+), 108 deletions(-)
>  create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna.inc
>  create mode 100644
> meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
>  create mode 100644
> meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.service
>  create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
>  delete mode 100644
> meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile.patch
>  delete mode 100644
> meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-headers-in-staging-dir.patch
>  delete mode 100644 meta-oe/recipes-multimedia/nonworking/minidlna/
> minidlna_1.0.25.bb
>
> diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna.inc
> b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
> new file mode 100644
> index 0000000..9d6568d
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
> @@ -0,0 +1,39 @@
> +DESCRIPTION = "MiniDLNA (aka ReadyDLNA) is server software with the aim
> of \
> +being fully compliant with DLNA/UPnP-AV clients."
> +LICENSE = "GPL-2.0|BSD"
> +DEPENDS = "virtual/gettext ffmpeg flac libav jpeg sqlite3 libexif libogg
> libid3tag libvorbis"
> +
> +inherit autotools update-rc.d systemd
> +
> +SRC_URI = "git://git.code.sf.net/p/minidlna/git;branch=master;module=git"
> +SRC_URI =+ "${@base_contains('DISTRO_FEATURES', 'systemd',
> 'file://minidlna-daemon.service', 'file://minidlna-daemon.init.d', d)}"
> +
> +S = "${WORKDIR}/git"
> +B = "${S}"
> +
> +do_configure_prepend() {
> +cd ${S}
> +./autogen.sh
> +}
> +
> +do_install_initd() {
> +       install -d ${D}${sysconfdir}/init.d
> +       install -m 0755 ${WORKDIR}/minidlna-daemon.init.d
> ${D}${sysconfdir}/init.d/minidlna
> +}
> +
> +do_install_systemd() {
> +       install -d ${D}${nonarch_base_libdir}/systemd/system
> +       install -m 0755 ${WORKDIR}/minidlna-daemon.service
> ${D}${nonarch_base_libdir}/systemd/system
> +}
> +
> +do_install_append(){
> +       install -d ${D}${sysconfdir}
> +       install -m 0755 minidlna.conf ${D}${sysconfdir}
> +       ${@base_contains('DISTRO_FEATURES', 'systemd',
> 'do_install_systemd', 'do_install_initd', d)}
> +}
> +
> +SYSTEMD_SERVICE_${PN} = "minidlna-daemon.service"
> +
> +INITSCRIPT_NAME = "minidlna"
> +INITSCRIPT_PARAMS = "defaults 90"
> +
> diff --git
> a/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
> b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
> new file mode 100644
> index 0000000..e5db389
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
> @@ -0,0 +1,54 @@
> +#!/bin/sh
> +
> +NAME="minidlna"
> +DAEMON=$(which $NAME)
> +SCRIPTNAME=/etc/init.d/$NAME
> +PIDFILE=/var/run/$NAME.pid
> +CONF=/etc/$NAME.conf
> +ARGS="-f $CONF"
> +
> +# Exit if the package is not installed
> +[ -x "$DAEMON" ] || exit 0
> +
> +start_function() {
> +
> +    export PATH=$PWD:$PATH
> +
> +    if [ -f ${PIDFILE} ]; then
> +        echo "$SCRIPTNAME already running with PID #`cat $PIDFILE` (
> according to ${PIDFILE} )";
> +        exit 0
> +    fi
> +
> +    $DAEMON $ARGS
> +
> +    pid=$!
> +
> +    if [ "$pid" != "" ]; then
> +        echo -n "$pid" > ${PIDFILE}
> +    fi
> +}
> +
> +stop_function() {
> +
> +    export PATH=$PWD:$PATH
> +
> +    if [ ! -e "${PIDFILE}" ]; then
> +        echo "${SCRIPTNAME} not running ( according to ${PIDFILE} )";
> +        exit 1;
> +    fi
> +    PID=`cat ${PIDFILE}`
> +    kill -INT ${PID}
> +    rm -f ${PIDFILE}
> +}
> +
> +case $1 in
> +    "start")
> +        start_function
> +        ;;
> +    "stop")
> +        stop_function
> +        ;;
> +    *)
> +    echo "Usage: $0 {start | stop}"
> +
> +esac
> diff --git
> a/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.service
> b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.service
> new file mode 100644
> index 0000000..fa9fb36
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=Minidlna Daemon
> +After=network.target
> +
> +[Service]
> +User=transmission
> +Type=notify
> +ExecStart=/usr/bin/minidlna -f /etc/minidlna.conf
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
> b/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
> new file mode 100644
> index 0000000..0531e69
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
> @@ -0,0 +1,6 @@
> +require ${BPN}.inc
> +
> +SRCREV = "v1_1_4"
> +LIC_FILES_CHKSUM =
> "file://LICENCE.miniupnpd;md5=b0dabf9d8e0f871554e309d62ead8d2b"
> +SRC_URI[md5sum] = "d966256baf2f9b068b9de871ab5dade5"
> +SRC_URI[sha256sum] =
> "170560fbe042c2bbcba78c5f15b54f4fac321ff770490b23b55789be463f2851"
> diff --git
> a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile.patch
> b/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile.patch
> deleted file mode 100644
> index 96429fd..0000000
> ---
> a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -Fix Makefile:
> -* don't overwrite CFLAGS but append to it
> -* use gcc as CC only if CC is not already defined
> -* use -I= to include paths
> -* fix compile of minidlna binary by removing ${LIBS} dependency
> -
> -Upstream-status: Pending
> -Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> -
> -Index: minidlna-1.0.25/Makefile
> -===================================================================
> ---- minidlna-1.0.25.orig/Makefile      2012-01-18 00:49:01.000000000 +0200
> -+++ minidlna-1.0.25/Makefile   2013-02-10 17:46:49.000000000 +0200
> -@@ -12,13 +12,13 @@
> - #
> - #CFLAGS = -Wall -O -D_GNU_SOURCE -g -DDEBUG
> - #CFLAGS = -Wall -g -Os -D_GNU_SOURCE
> --CFLAGS = -Wall -g -O3 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 \
> --       -I/usr/include/ffmpeg \
> --       -I/usr/include/libavutil -I/usr/include/libavcodec
> -I/usr/include/libavformat \
> --       -I/usr/include/ffmpeg/libavutil -I/usr/include/ffmpeg/libavcodec
> -I/usr/include/ffmpeg/libavformat
> -+CFLAGS += -Wall -g -O3 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 \
> -+       -I=/usr/include/ffmpeg \
> -+       -I=/usr/include/libavutil -I=/usr/include/libavcodec
> -I=/usr/include/libavformat \
> -+       -I=/usr/include/ffmpeg/libavutil
> -I=/usr/include/ffmpeg/libavcodec -I=/usr/include/ffmpeg/libavformat
> - #STATIC_LINKING: CFLAGS += -DSTATIC
> - #STATIC_LINKING: LDFLAGS = -static
> --CC = gcc
> -+CC ?= gcc
> - RM = rm -f
> - INSTALL = install
> -
> -@@ -64,7 +64,7 @@
> -       $(INSTALL) -d $(ETCINSTALLDIR)
> -       $(INSTALL) --mode=0644 minidlna.conf $(ETCINSTALLDIR)
> -
> --minidlna:     $(BASEOBJS) $(LNXOBJS) $(LIBS)
> -+minidlna:     $(BASEOBJS) $(LNXOBJS)
> -       @echo Linking $@
> -       @$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(BASEOBJS) $(LNXOBJS) $(LIBS)
> -
> diff --git
> a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-headers-in-staging-dir.patch
> b/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-headers-in-staging-dir.patch
> deleted file mode 100644
> index 573d88c..0000000
> ---
> a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-headers-in-staging-dir.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -Search for headers in STAGING_DIR_GOST.
> -
> -Upstream-status: Pending
> -Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> -
> -Index: minidlna-1.0.25/genconfig.sh
> -===================================================================
> ---- minidlna-1.0.25.orig/genconfig.sh  2012-01-21 02:34:13.000000000 +0200
> -+++ minidlna-1.0.25/genconfig.sh       2013-02-10 17:12:06.000000000 +0200
> -@@ -40,22 +40,22 @@
> -
> - # Detect if there are missing headers
> - # NOTE: This check only works with a normal distro
> --[ ! -e "/usr/include/sqlite3.h" ] && MISSING="libsqlite3 $MISSING"
> --[ ! -e "/usr/include/jpeglib.h" ] && MISSING="libjpeg $MISSING"
> --[ ! -e "/usr/include/libexif/exif-loader.h" ] && MISSING="libexif
> $MISSING"
> --[ ! -e "/usr/include/id3tag.h" ] && MISSING="libid3tag $MISSING"
> --[ ! -e "/usr/include/ogg/ogg.h" ] && MISSING="libogg $MISSING"
> --[ ! -e "/usr/include/vorbis/codec.h" ] && MISSING="libvorbis $MISSING"
> --[ ! -e "/usr/include/FLAC/metadata.h" ] && MISSING="libflac $MISSING"
> --[ ! -e "/usr/include/ffmpeg/avutil.h" -a \
> --  ! -e "/usr/include/libavutil/avutil.h" -a \
> --  ! -e "/usr/include/ffmpeg/libavutil/avutil.h" ] && MISSING="libavutil
> $MISSING"
> --[ ! -e "/usr/include/ffmpeg/avformat.h" -a \
> --  ! -e "/usr/include/libavformat/avformat.h" -a \
> --  ! -e "/usr/include/ffmpeg/libavformat/avformat.h" ] &&
> MISSING="libavformat $MISSING"
> --[ ! -e "/usr/include/ffmpeg/avcodec.h" -a \
> --  ! -e "/usr/include/libavcodec/avcodec.h" -a \
> --  ! -e "/usr/include/ffmpeg/libavcodec/avcodec.h" ] &&
> MISSING="libavcodec $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/sqlite3.h" ] &&
> MISSING="libsqlite3 $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/jpeglib.h" ] && MISSING="libjpeg
> $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/libexif/exif-loader.h" ] &&
> MISSING="libexif $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/id3tag.h" ] && MISSING="libid3tag
> $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/ogg/ogg.h" ] && MISSING="libogg
> $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/vorbis/codec.h" ] &&
> MISSING="libvorbis $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/FLAC/metadata.h" ] &&
> MISSING="libflac $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/avutil.h" -a \
> -+  ! -e "$STAGING_DIR_HOST/usr/include/libavutil/avutil.h" -a \
> -+  ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/libavutil/avutil.h" ] &&
> MISSING="libavutil $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/avformat.h" -a \
> -+  ! -e "$STAGING_DIR_HOST/usr/include/libavformat/avformat.h" -a \
> -+  ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/libavformat/avformat.h" ]
> && MISSING="libavformat $MISSING"
> -+[ ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/avcodec.h" -a \
> -+  ! -e "$STAGING_DIR_HOST/usr/include/libavcodec/avcodec.h" -a \
> -+  ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/libavcodec/avcodec.h" ] &&
> MISSING="libavcodec $MISSING"
> - if [ -n "$MISSING" ]; then
> -       echo -e "\nERROR!  Cannot continue."
> -       echo -e "The following required libraries are either missing, or
> are missing development headers:\n"
> diff --git a/meta-oe/recipes-multimedia/nonworking/minidlna/
> minidlna_1.0.25.bb b/meta-oe/recipes-multimedia/nonworking/minidlna/
> minidlna_1.0.25.bb
> deleted file mode 100644
> index 9264bc2..0000000
> --- a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna_1.0.25.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -DESCRIPTION = "MiniDLNA (aka ReadyDLNA) is server software with the aim
> of \
> -being fully compliant with DLNA/UPnP-AV clients."
> -LICENSE = "GPL-2.0"
> -LIC_FILES_CHKSUM = "file://LICENCE;md5=b1a795ac1a06805cf8fd74920bc46b5c"
> -
> -DEPENDS = "flac libav jpeg sqlite3 libexif libogg libid3tag"
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}_${PV}_src.tar.gz \
> -    file://search-for-headers-in-staging-dir.patch \
> -    file://fix-makefile.patch \
> -"
> -
> -SRC_URI[md5sum] = "d966256baf2f9b068b9de871ab5dade5"
> -SRC_URI[sha256sum] =
> "170560fbe042c2bbcba78c5f15b54f4fac321ff770490b23b55789be463f2851"
> -
> -export STAGING_DIR_HOST
> -
> -inherit autotools
> -
> --
> 1.8.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113bb4cc7738b2051065bf49
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wrong list - meta-oe patches go to openembedded-devel@ not=
 -core@.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On 3 March 2015 at 17:32, Baptiste DURAND <span =
dir=3D"ltr">&lt;<a href=3D"mailto:baptiste.durand@gmail.com" target=3D"_bla=
nk">baptiste.durand@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">Signed-off-by: Baptiste DURAND &lt;<a href=3D"mailto:baptiste.du=
rand@gmail.com">baptiste.durand@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-multimedia/minidlna/minidlna.inc=C2=A0 =C2=A0| 39 +++=
+++++++++++++<br>
=C2=A0.../minidlna/minidlna/minidlna-daemon.init.d=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 54 ++++++++++++++++++++++<br>
=C2=A0.../minidlna/minidlna/minidlna-daemon.service=C2=A0 =C2=A0 =C2=A0 | 1=
1 +++++<br>
=C2=A0.../recipes-multimedia/minidlna/<a href=3D"http://minidlna_1.1.4.bb" =
target=3D"_blank">minidlna_1.1.4.bb</a>=C2=A0 |=C2=A0 6 +++<br>
=C2=A0.../minidlna/minidlna/fix-makefile.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 41 ----------------<br>
=C2=A0.../search-for-headers-in-staging-dir.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 48 -------------------<br>
=C2=A0.../nonworking/minidlna/<a href=3D"http://minidlna_1.0.25.bb" target=
=3D"_blank">minidlna_1.0.25.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 --=
------<br>
=C2=A07 files changed, 110 insertions(+), 108 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna.inc<b=
r>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna/minid=
lna-daemon.init.d<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna/minid=
lna-daemon.service<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/minidlna/<a href=3D"htt=
p://minidlna_1.1.4.bb" target=3D"_blank">minidlna_1.1.4.bb</a><br>
=C2=A0delete mode 100644 meta-oe/recipes-multimedia/nonworking/minidlna/min=
idlna/fix-makefile.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-multimedia/nonworking/minidlna/min=
idlna/search-for-headers-in-staging-dir.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-multimedia/nonworking/minidlna/<a =
href=3D"http://minidlna_1.0.25.bb" target=3D"_blank">minidlna_1.0.25.bb</a>=
<br>
<br>
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna.inc b/meta-oe/rec=
ipes-multimedia/minidlna/minidlna.inc<br>
new file mode 100644<br>
index 0000000..9d6568d<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna.inc<br>
@@ -0,0 +1,39 @@<br>
+DESCRIPTION =3D &quot;MiniDLNA (aka ReadyDLNA) is server software with the=
 aim of \<br>
+being fully compliant with DLNA/UPnP-AV clients.&quot;<br>
+LICENSE =3D &quot;GPL-2.0|BSD&quot;<br>
+DEPENDS =3D &quot;virtual/gettext ffmpeg flac libav jpeg sqlite3 libexif l=
ibogg libid3tag libvorbis&quot;<br>
+<br>
+inherit autotools update-rc.d systemd<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.code.sf.net/p/minidlna/git;b=
ranch=3Dmaster;module=3Dgit" target=3D"_blank">git.code.sf.net/p/minidlna/g=
it;branch=3Dmaster;module=3Dgit</a>&quot;<br>
+SRC_URI =3D+ &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;system=
d&#39;, &#39;file://minidlna-daemon.service&#39;, &#39;file://minidlna-daem=
on.init.d&#39;, d)}&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+B =3D &quot;${S}&quot;<br>
+<br>
+do_configure_prepend() {<br>
+cd ${S}<br>
+./autogen.sh<br>
+}<br>
+<br>
+do_install_initd() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/init.d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${WORKDIR}/minidlna-daemon.init=
.d ${D}${sysconfdir}/init.d/minidlna<br>
+}<br>
+<br>
+do_install_systemd() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${nonarch_base_libdir}/systemd/s=
ystem<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${WORKDIR}/minidlna-daemon.serv=
ice ${D}${nonarch_base_libdir}/systemd/system<br>
+}<br>
+<br>
+do_install_append(){<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 minidlna.conf ${D}${sysconfdir}=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${@base_contains(&#39;DISTRO_FEATURES&#39;, &#3=
9;systemd&#39;, &#39;do_install_systemd&#39;, &#39;do_install_initd&#39;, d=
)}<br>
+}<br>
+<br>
+SYSTEMD_SERVICE_${PN} =3D &quot;minidlna-daemon.service&quot;<br>
+<br>
+INITSCRIPT_NAME =3D &quot;minidlna&quot;<br>
+INITSCRIPT_PARAMS =3D &quot;defaults 90&quot;<br>
+<br>
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.i=
nit.d b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d=
<br>
new file mode 100644<br>
index 0000000..e5db389<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d<b=
r>
@@ -0,0 +1,54 @@<br>
+#!/bin/sh<br>
+<br>
+NAME=3D&quot;minidlna&quot;<br>
+DAEMON=3D$(which $NAME)<br>
+SCRIPTNAME=3D/etc/init.d/$NAME<br>
+PIDFILE=3D/var/run/$NAME.pid<br>
+CONF=3D/etc/$NAME.conf<br>
+ARGS=3D&quot;-f $CONF&quot;<br>
+<br>
+# Exit if the package is not installed<br>
+[ -x &quot;$DAEMON&quot; ] || exit 0<br>
+<br>
+start_function() {<br>
+<br>
+=C2=A0 =C2=A0 export PATH=3D$PWD:$PATH<br>
+<br>
+=C2=A0 =C2=A0 if [ -f ${PIDFILE} ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$SCRIPTNAME already running with PI=
D #`cat $PIDFILE` ( according to ${PIDFILE} )&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 0<br>
+=C2=A0 =C2=A0 fi<br>
+<br>
+=C2=A0 =C2=A0 $DAEMON $ARGS<br>
+<br>
+=C2=A0 =C2=A0 pid=3D$!<br>
+<br>
+=C2=A0 =C2=A0 if [ &quot;$pid&quot; !=3D &quot;&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo -n &quot;$pid&quot; &gt; ${PIDFILE}<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
+<br>
+stop_function() {<br>
+<br>
+=C2=A0 =C2=A0 export PATH=3D$PWD:$PATH<br>
+<br>
+=C2=A0 =C2=A0 if [ ! -e &quot;${PIDFILE}&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;${SCRIPTNAME} not running ( accordi=
ng to ${PIDFILE} )&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1;<br>
+=C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 PID=3D`cat ${PIDFILE}`<br>
+=C2=A0 =C2=A0 kill -INT ${PID}<br>
+=C2=A0 =C2=A0 rm -f ${PIDFILE}<br>
+}<br>
+<br>
+case $1 in<br>
+=C2=A0 =C2=A0 &quot;start&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 start_function<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0 &quot;stop&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 stop_function<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0 *)<br>
+=C2=A0 =C2=A0 echo &quot;Usage: $0 {start | stop}&quot;<br>
+<br>
+esac<br>
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.s=
ervice b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.servi=
ce<br>
new file mode 100644<br>
index 0000000..fa9fb36<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.service<=
br>
@@ -0,0 +1,11 @@<br>
+[Unit]<br>
+Description=3DMinidlna Daemon<br>
+After=3Dnetwork.target<br>
+<br>
+[Service]<br>
+User=3Dtransmission<br>
+Type=3Dnotify<br>
+ExecStart=3D/usr/bin/minidlna -f /etc/minidlna.conf<br>
+<br>
+[Install]<br>
+WantedBy=3Dmulti-user.target<br>
diff --git a/meta-oe/recipes-multimedia/minidlna/<a href=3D"http://minidlna=
_1.1.4.bb" target=3D"_blank">minidlna_1.1.4.bb</a> b/meta-oe/recipes-multim=
edia/minidlna/<a href=3D"http://minidlna_1.1.4.bb" target=3D"_blank">minidl=
na_1.1.4.bb</a><br>
new file mode 100644<br>
index 0000000..0531e69<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-multimedia/minidlna/<a href=3D"http://minidlna_1.1.4.=
bb" target=3D"_blank">minidlna_1.1.4.bb</a><br>
@@ -0,0 +1,6 @@<br>
+require ${BPN}.inc<br>
+<br>
+SRCREV =3D &quot;v1_1_4&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENCE.miniupnpd;md5=3Db0dabf9d8e0f8715=
54e309d62ead8d2b&quot;<br>
+SRC_URI[md5sum] =3D &quot;d966256baf2f9b068b9de871ab5dade5&quot;<br>
+SRC_URI[sha256sum] =3D &quot;170560fbe042c2bbcba78c5f15b54f4fac321ff770490=
b23b55789be463f2851&quot;<br>
diff --git a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-ma=
kefile.patch b/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-=
makefile.patch<br>
deleted file mode 100644<br>
index 96429fd..0000000<br>
--- a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile.=
patch<br>
+++ /dev/null<br>
@@ -1,41 +0,0 @@<br>
-Fix Makefile:<br>
-* don&#39;t overwrite CFLAGS but append to it<br>
-* use gcc as CC only if CC is not already defined<br>
-* use -I=3D to include paths<br>
-* fix compile of minidlna binary by removing ${LIBS} dependency<br>
-<br>
-Upstream-status: Pending<br>
-Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro">and=
rei@gherzan.ro</a>&gt;<br>
-<br>
-Index: minidlna-1.0.25/Makefile<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- minidlna-1.0.25.orig/Makefile=C2=A0 =C2=A0 =C2=A0 2012-01-18 00:49:01.=
000000000 +0200<br>
-+++ minidlna-1.0.25/Makefile=C2=A0 =C2=A02013-02-10 17:46:49.000000000 +02=
00<br>
-@@ -12,13 +12,13 @@<br>
- #<br>
- #CFLAGS =3D -Wall -O -D_GNU_SOURCE -g -DDEBUG<br>
- #CFLAGS =3D -Wall -g -Os -D_GNU_SOURCE<br>
--CFLAGS =3D -Wall -g -O3 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0-I/usr/include/ffmpeg \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0-I/usr/include/libavutil -I/usr/include/libavc=
odec -I/usr/include/libavformat \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0-I/usr/include/ffmpeg/libavutil -I/usr/include=
/ffmpeg/libavcodec -I/usr/include/ffmpeg/libavformat<br>
-+CFLAGS +=3D -Wall -g -O3 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0-I=3D/usr/include/ffmpeg \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0-I=3D/usr/include/libavutil -I=3D/usr/include/=
libavcodec -I=3D/usr/include/libavformat \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0-I=3D/usr/include/ffmpeg/libavutil -I=3D/usr/i=
nclude/ffmpeg/libavcodec -I=3D/usr/include/ffmpeg/libavformat<br>
- #STATIC_LINKING: CFLAGS +=3D -DSTATIC<br>
- #STATIC_LINKING: LDFLAGS =3D -static<br>
--CC =3D gcc<br>
-+CC ?=3D gcc<br>
- RM =3D rm -f<br>
- INSTALL =3D install<br>
-<br>
-@@ -64,7 +64,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -d $(ETCINSTALLDIR)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) --mode=3D0644 minidlna.conf $(ETCINS=
TALLDIR)<br>
-<br>
--minidlna:=C2=A0 =C2=A0 =C2=A0$(BASEOBJS) $(LNXOBJS) $(LIBS)<br>
-+minidlna:=C2=A0 =C2=A0 =C2=A0$(BASEOBJS) $(LNXOBJS)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo Linking $@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(BASEOBJS) $=
(LNXOBJS) $(LIBS)<br>
-<br>
diff --git a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search=
-for-headers-in-staging-dir.patch b/meta-oe/recipes-multimedia/nonworking/m=
inidlna/minidlna/search-for-headers-in-staging-dir.patch<br>
deleted file mode 100644<br>
index 573d88c..0000000<br>
--- a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-he=
aders-in-staging-dir.patch<br>
+++ /dev/null<br>
@@ -1,48 +0,0 @@<br>
-Search for headers in STAGING_DIR_GOST.<br>
-<br>
-Upstream-status: Pending<br>
-Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro">and=
rei@gherzan.ro</a>&gt;<br>
-<br>
-Index: minidlna-1.0.25/genconfig.sh<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- minidlna-1.0.25.orig/genconfig.sh=C2=A0 2012-01-21 02:34:13.000000000 =
+0200<br>
-+++ minidlna-1.0.25/genconfig.sh=C2=A0 =C2=A0 =C2=A0 =C2=A02013-02-10 17:1=
2:06.000000000 +0200<br>
-@@ -40,22 +40,22 @@<br>
-<br>
- # Detect if there are missing headers<br>
- # NOTE: This check only works with a normal distro<br>
--[ ! -e &quot;/usr/include/sqlite3.h&quot; ] &amp;&amp; MISSING=3D&quot;li=
bsqlite3 $MISSING&quot;<br>
--[ ! -e &quot;/usr/include/jpeglib.h&quot; ] &amp;&amp; MISSING=3D&quot;li=
bjpeg $MISSING&quot;<br>
--[ ! -e &quot;/usr/include/libexif/exif-loader.h&quot; ] &amp;&amp; MISSIN=
G=3D&quot;libexif $MISSING&quot;<br>
--[ ! -e &quot;/usr/include/id3tag.h&quot; ] &amp;&amp; MISSING=3D&quot;lib=
id3tag $MISSING&quot;<br>
--[ ! -e &quot;/usr/include/ogg/ogg.h&quot; ] &amp;&amp; MISSING=3D&quot;li=
bogg $MISSING&quot;<br>
--[ ! -e &quot;/usr/include/vorbis/codec.h&quot; ] &amp;&amp; MISSING=3D&qu=
ot;libvorbis $MISSING&quot;<br>
--[ ! -e &quot;/usr/include/FLAC/metadata.h&quot; ] &amp;&amp; MISSING=3D&q=
uot;libflac $MISSING&quot;<br>
--[ ! -e &quot;/usr/include/ffmpeg/avutil.h&quot; -a \<br>
--=C2=A0 ! -e &quot;/usr/include/libavutil/avutil.h&quot; -a \<br>
--=C2=A0 ! -e &quot;/usr/include/ffmpeg/libavutil/avutil.h&quot; ] &amp;&am=
p; MISSING=3D&quot;libavutil $MISSING&quot;<br>
--[ ! -e &quot;/usr/include/ffmpeg/avformat.h&quot; -a \<br>
--=C2=A0 ! -e &quot;/usr/include/libavformat/avformat.h&quot; -a \<br>
--=C2=A0 ! -e &quot;/usr/include/ffmpeg/libavformat/avformat.h&quot; ] &amp=
;&amp; MISSING=3D&quot;libavformat $MISSING&quot;<br>
--[ ! -e &quot;/usr/include/ffmpeg/avcodec.h&quot; -a \<br>
--=C2=A0 ! -e &quot;/usr/include/libavcodec/avcodec.h&quot; -a \<br>
--=C2=A0 ! -e &quot;/usr/include/ffmpeg/libavcodec/avcodec.h&quot; ] &amp;&=
amp; MISSING=3D&quot;libavcodec $MISSING&quot;<br>
-+[ ! -e &quot;$STAGING_DIR_HOST/usr/include/sqlite3.h&quot; ] &amp;&amp; M=
ISSING=3D&quot;libsqlite3 $MISSING&quot;<br>
-+[ ! -e &quot;$STAGING_DIR_HOST/usr/include/jpeglib.h&quot; ] &amp;&amp; M=
ISSING=3D&quot;libjpeg $MISSING&quot;<br>
-+[ ! -e &quot;$STAGING_DIR_HOST/usr/include/libexif/exif-loader.h&quot; ] =
&amp;&amp; MISSING=3D&quot;libexif $MISSING&quot;<br>
-+[ ! -e &quot;$STAGING_DIR_HOST/usr/include/id3tag.h&quot; ] &amp;&amp; MI=
SSING=3D&quot;libid3tag $MISSING&quot;<br>
-+[ ! -e &quot;$STAGING_DIR_HOST/usr/include/ogg/ogg.h&quot; ] &amp;&amp; M=
ISSING=3D&quot;libogg $MISSING&quot;<br>
-+[ ! -e &quot;$STAGING_DIR_HOST/usr/include/vorbis/codec.h&quot; ] &amp;&a=
mp; MISSING=3D&quot;libvorbis $MISSING&quot;<br>
-+[ ! -e &quot;$STAGING_DIR_HOST/usr/include/FLAC/metadata.h&quot; ] &amp;&=
amp; MISSING=3D&quot;libflac $MISSING&quot;<br>
-+[ ! -e &quot;$STAGING_DIR_HOST/usr/include/ffmpeg/avutil.h&quot; -a \<br>
-+=C2=A0 ! -e &quot;$STAGING_DIR_HOST/usr/include/libavutil/avutil.h&quot; =
-a \<br>
-+=C2=A0 ! -e &quot;$STAGING_DIR_HOST/usr/include/ffmpeg/libavutil/avutil.h=
&quot; ] &amp;&amp; MISSING=3D&quot;libavutil $MISSING&quot;<br>
-+[ ! -e &quot;$STAGING_DIR_HOST/usr/include/ffmpeg/avformat.h&quot; -a \<b=
r>
-+=C2=A0 ! -e &quot;$STAGING_DIR_HOST/usr/include/libavformat/avformat.h&qu=
ot; -a \<br>
-+=C2=A0 ! -e &quot;$STAGING_DIR_HOST/usr/include/ffmpeg/libavformat/avform=
at.h&quot; ] &amp;&amp; MISSING=3D&quot;libavformat $MISSING&quot;<br>
-+[ ! -e &quot;$STAGING_DIR_HOST/usr/include/ffmpeg/avcodec.h&quot; -a \<br=
>
-+=C2=A0 ! -e &quot;$STAGING_DIR_HOST/usr/include/libavcodec/avcodec.h&quot=
; -a \<br>
-+=C2=A0 ! -e &quot;$STAGING_DIR_HOST/usr/include/ffmpeg/libavcodec/avcodec=
.h&quot; ] &amp;&amp; MISSING=3D&quot;libavcodec $MISSING&quot;<br>
- if [ -n &quot;$MISSING&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo -e &quot;\nERROR!=C2=A0 Cannot continue.&q=
uot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo -e &quot;The following required libraries =
are either missing, or are missing development headers:\n&quot;<br>
diff --git a/meta-oe/recipes-multimedia/nonworking/minidlna/<a href=3D"http=
://minidlna_1.0.25.bb" target=3D"_blank">minidlna_1.0.25.bb</a> b/meta-oe/r=
ecipes-multimedia/nonworking/minidlna/<a href=3D"http://minidlna_1.0.25.bb"=
 target=3D"_blank">minidlna_1.0.25.bb</a><br>
deleted file mode 100644<br>
index 9264bc2..0000000<br>
--- a/meta-oe/recipes-multimedia/nonworking/minidlna/<a href=3D"http://mini=
dlna_1.0.25.bb" target=3D"_blank">minidlna_1.0.25.bb</a><br>
+++ /dev/null<br>
@@ -1,19 +0,0 @@<br>
-DESCRIPTION =3D &quot;MiniDLNA (aka ReadyDLNA) is server software with the=
 aim of \<br>
-being fully compliant with DLNA/UPnP-AV clients.&quot;<br>
-LICENSE =3D &quot;GPL-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENCE;md5=3Db1a795ac1a06805cf8fd74920b=
c46b5c&quot;<br>
-<br>
-DEPENDS =3D &quot;flac libav jpeg sqlite3 libexif libogg libid3tag&quot;<b=
r>
-<br>
-SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/${BPN}/${BPN}_${PV}_src.tar.gz \<b=
r>
-=C2=A0 =C2=A0 file://search-for-headers-in-staging-dir.patch \<br>
-=C2=A0 =C2=A0 file://fix-makefile.patch \<br>
-&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;d966256baf2f9b068b9de871ab5dade5&quot;<br>
-SRC_URI[sha256sum] =3D &quot;170560fbe042c2bbcba78c5f15b54f4fac321ff770490=
b23b55789be463f2851&quot;<br>
-<br>
-export STAGING_DIR_HOST<br>
-<br>
-inherit autotools<br>
-<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.1.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--001a113bb4cc7738b2051065bf49--
