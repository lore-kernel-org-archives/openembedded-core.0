Return-Path: <mordeng10@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0A2761B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 09:42:04 +0000 (UTC)
Received: by wicgb10 with SMTP id gb10so134647351wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 02:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=zS8yQIZ3LjIRJVFSVABTdmEhmDJfs+mm0pqcSyooLrc=;
	b=XbDEBzY4pl++9Ze2BGJO67faMNP+o5IeBnya2WBuLsaE6bIxDQfpNa/lKltU7+vbKZ
	SFHNhHDAp7b5nfoXKdY83QbdwhlyHIOjhZUwHt8Xau9yiodjqI174yvj0rrz3W2kCMqb
	nslHJV1GzPubhWylE/fEqTIvzlC9G5hG9HfeMyZdOL4nRvS+JVnjFIkJNCakkFFYbSz6
	3VzlYNBOXuFxjfSPlItd4j1RdUpOgqek8ePCweksZi0yznxJtYqVEle8LyhPGfIBgNg1
	+ne/wAZsv3slDn5/NFrrWFqs9IkYi0PC8hSVJ5AFc9zwAUlnYRNSVRNcQGLGPwxstUkU
	Fu1w==
MIME-Version: 1.0
X-Received: by 10.180.218.227 with SMTP id pj3mr14543494wic.59.1437644523939; 
	Thu, 23 Jul 2015 02:42:03 -0700 (PDT)
Sender: mordeng10@gmail.com
Received: by 10.27.204.196 with HTTP; Thu, 23 Jul 2015 02:42:03 -0700 (PDT)
In-Reply-To: <CAFZ+r7ENNvqETETaTEUdomiY5V16VQ2usJ6B3m_edvEDT4dxOA@mail.gmail.com>
References: <CAFZ+r7ENNvqETETaTEUdomiY5V16VQ2usJ6B3m_edvEDT4dxOA@mail.gmail.com>
Date: Thu, 23 Jul 2015 11:42:03 +0200
X-Google-Sender-Auth: -ZSumCLjLCTikqxxKYcEusNVb4w
Message-ID: <CAFZ+r7EGq4iemLUL2BuCqYpUbkO57qvBHNp_2CwMRrRVjQ6_Zw@mail.gmail.com>
From: Lukas Plazovnik <lukas.plazovnik@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: meta-toolchain-qt
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
X-List-Received-Date: Thu, 23 Jul 2015 09:42:10 -0000
Content-Type: multipart/alternative; boundary=001a1134cd3829b05d051b87b394

--001a1134cd3829b05d051b87b394
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

additionally: If i run a qt program at the operatin system i get:

Unable to load library icui18n "Cannot load library icui18n: (icui18n:
cannot open shared object file: No such file or directory)"

any idea?

---------- Forwarded message ----------
From: Lukas Plazovnik <lukas.plazovnik@gmail.com>
Date: 2015-07-23 10:06 GMT+02:00
Subject: meta-toolchain-qt
To: openembedded-core@lists.openembedded.org


hello,

I've got a problem in the do_populate_sdk stage

compiling works fine but then i got an error of missing dependencies(almost
everything?)

NOTE:
/home/lukas/yocto/openembedded-core/build/tmp-glibc/sysroots/x86_64-linux/u=
sr/bin/opkg-cl
-f
/home/lukas/yocto/openembedded-core/build/tmp-glibc/work/cortexa9-vfp-neon-=
oe-linux-gnueabi/meta-toolchain-qt/1.0-r7/opkg.conf
-o
/home/lukas/yocto/openembedded-core/build/tmp-glibc/work/cortexa9-vfp-neon-=
oe-linux-gnueabi/meta-toolchain-qt/1.0-r7/sdk/image/usr/local/oecore-x86_64=
/sysroots/cortexa9-vfp-neon-oe-linux-gnueabi
--force_postinstall --prefer-arch-to-version   install
packagegroup-qt-toolchain-target
ERROR: Unable to install packages. Command
'/home/lukas/yocto/openembedded-core/build/tmp-glibc/sysroots/x86_64-linux/=
usr/bin/opkg-cl
-f
/home/lukas/yocto/openembedded-core/build/tmp-glibc/work/cortexa9-vfp-neon-=
oe-linux-gnueabi/meta-toolchain-qt/1.0-r7/opkg.conf
-o
/home/lukas/yocto/openembedded-core/build/tmp-glibc/work/cortexa9-vfp-neon-=
oe-linux-gnueabi/meta-toolchain-qt/1.0-r7/sdk/image/usr/local/oecore-x86_64=
/sysroots/cortexa9-vfp-neon-oe-linux-gnueabi
--force_postinstall --prefer-arch-to-version   install
packagegroup-qt-toolchain-target' returned 255:
Installing packagegroup-qt-toolchain-target (1.0-r0) on root.
Downloading
file:/home/lukas/yocto/openembedded-core/build/tmp-glibc/deploy/ipk/all/pac=
kagegroup-qt-toolchain-target_1.0-r0_all.ipk.
libc6-dev: unsatisfied recommendation for glibc-extra-nss-dev
libc6-dev: unsatisfied recommendation for glibc-thread-db-dev
libc6-dev: unsatisfied recommendation for libsegfault-dev
libc6-dev: unsatisfied recommendation for libgcc-initial-dev
libc6-dev: unsatisfied recommendation for libcidn-dev
icu-dev: unsatisfied recommendation for libicuuc-dev
icu-dev: unsatisfied recommendation for libicudata-dev
icu-dev: unsatisfied recommendation for libicuio-dev
icu-dev: unsatisfied recommendation for libiculx-dev
icu-dev: unsatisfied recommendation for libicule-dev
icu-dev: unsatisfied recommendation for libicui18n-dev
icu-dev: unsatisfied recommendation for libicutu-dev
openssl-dev: unsatisfied recommendation for libcrypto-dev
openssl-dev: unsatisfied recommendation for libssl-dev
libtiff-dev: unsatisfied recommendation for liblzma-dev
libtiff-dev: unsatisfied recommendation for tiffxx-dev
xz-dev: unsatisfied recommendation for liblzma-dev
libqtdbus-dev: unsatisfied recommendation for sqlite3-dev
shadow-dev: unsatisfied recommendation for util-linux-sulogin-dev
shadow-dev: unsatisfied recommendation for update-alternatives-opkg-dev
shadow-dev: unsatisfied recommendation for shadow-base-dev
dbus-dev: unsatisfied recommendation for shadow-sysroot-dev
dbus-dev: unsatisfied recommendation for dbus-lib-dev
dbus-dev: unsatisfied recommendation for initscripts-functions-dev
libx11-dev: unsatisfied recommendation for libx11-xcb-dev
libxcb-dev: unsatisfied recommendation for libxcb-shape-dev
libxcb-dev: unsatisfied recommendation for libxcb-dpms-dev
libxcb-dev: unsatisfied recommendation for libxcb-render-dev
libxcb-dev: unsatisfied recommendation for libxcb-shm-dev
libxcb-dev: unsatisfied recommendation for libxcb-dri3-dev
libxcb-dev: unsatisfied recommendation for libxcb-damage-dev
libxcb-dev: unsatisfied recommendation for libxcb-glx-dev
libxcb-dev: unsatisfied recommendation for libxcb-composite-dev
libxcb-dev: unsatisfied recommendation for libxcb-res-dev
libxcb-dev: unsatisfied recommendation for libxcb-xvmc-dev
libxcb-dev: unsatisfied recommendation for libxcb-xkb-dev
libxcb-dev: unsatisfied recommendation for libxcb-sync-dev
libxcb-dev: unsatisfied recommendation for libxcb-xevie-dev
libxcb-dev: unsatisfied recommendation for libxcb-dri2-dev
libxcb-dev: unsatisfied recommendation for libxcb-randr-dev
libxcb-dev: unsatisfied recommendation for libxcb-record-dev
libxcb-dev: unsatisfied recommendation for libxcb-xprint-dev
libxcb-dev: unsatisfied recommendation for libxcb-xv-dev
libxcb-dev: unsatisfied recommendation for libxcb-xtest-dev
libxcb-dev: unsatisfied recommendation for libxcb-screensaver-dev
libxcb-dev: unsatisfied recommendation for libxcb-present-dev
libxcb-dev: unsatisfied recommendation for libxcb-xf86dri-dev
libxcb-dev: unsatisfied recommendation for libxcb-xinerama-dev
libxcb-dev: unsatisfied recommendation for libxcb-xfixes-dev
initscripts-dev: unsatisfied recommendation for update-alternatives-opkg-de=
v
initscripts-dev: unsatisfied recommendation for initscripts-functions-dev
libxrender-dev: unsatisfied recommendation for xdmcp-dev
libqtcore-dev: unsatisfied recommendation for sqlite3-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-position-event-sounds-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-card-restore-dev
pulseaudio-dev: unsatisfied recommendation for libltdl-dev
libgdbm-dev: unsatisfied recommendation for gdbm-compat-dev
package libtinfo5 suggests installing ncurses-terminfo
python-pygobject-dev: unsatisfied recommendation for python-textutils-dev
python-pygobject-dev: unsatisfied recommendation for
python-pygobject-lib-dev
python-dev: unsatisfied recommendation for python-audio-dev
python-dev: unsatisfied recommendation for python-mime-dev
python-dev: unsatisfied recommendation for python-io-dev
python-dev: unsatisfied recommendation for ncurses-libtinfo-dev
python-dev: unsatisfied recommendation for python-resource-dev
python-dev: unsatisfied recommendation for python-zlib-dev
python-dev: unsatisfied recommendation for python-lang-dev
python-dev: unsatisfied recommendation for python-multiprocessing-dev
python-dev: unsatisfied recommendation for python-mmap-dev
python-dev: unsatisfied recommendation for python-pkgutil-dev
python-dev: unsatisfied recommendation for python-subprocess-dev
python-dev: unsatisfied recommendation for python-json-dev
python-dev: unsatisfied recommendation for python-gdbm-dev
bzip2-dev: unsatisfied recommendation for update-alternatives-opkg-dev
bzip2-dev: unsatisfied recommendation for libbz2-dev
python-dev: unsatisfied recommendation for python-sqlite3-dev
python-dev: unsatisfied recommendation for libpython2-dev
python-dev: unsatisfied recommendation for python-math-dev
python-dev: unsatisfied recommendation for python-logging-dev
python-dev: unsatisfied recommendation for python-threading-dev
python-dev: unsatisfied recommendation for python-codecs-dev
python-dev: unsatisfied recommendation for python-contextlib-dev
python-dev: unsatisfied recommendation for python-pydoc-dev
python-dev: unsatisfied recommendation for python-pprint-dev
python-dev: unsatisfied recommendation for python-curses-dev
libreadline-dev: unsatisfied recommendation for ncurses-libtinfo-dev
ncurses-dev: unsatisfied recommendation for ncurses-libmenu-dev
ncurses-dev: unsatisfied recommendation for ncurses-libpanel-dev
ncurses-dev: unsatisfied recommendation for ncurses-libtinfo-dev
ncurses-dev: unsatisfied recommendation for ncurses-libform-dev
ncurses-dev: unsatisfied recommendation for ncurses-libncursesw-dev
ncurses-dev: unsatisfied recommendation for ncurses-libtic-dev
ncurses-dev: unsatisfied recommendation for ncurses-libncurses-dev
ncurses-dev: unsatisfied recommendation for ncurses-libmenuw-dev
ncurses-dev: unsatisfied recommendation for ncurses-terminfo-base-dev
ncurses-dev: unsatisfied recommendation for update-alternatives-opkg-dev
ncurses-dev: unsatisfied recommendation for ncurses-libpanelw-dev
ncurses-dev: unsatisfied recommendation for ncurses-libformw-dev
ncurses-dev: unsatisfied recommendation for ncurses-libticw-dev
python-dev: unsatisfied recommendation for python-fcntl-dev
python-dev: unsatisfied recommendation for python-compile-dev
python-dev: unsatisfied recommendation for python-debugger-dev
python-dev: unsatisfied recommendation for python-xmlrpc-dev
python-dev: unsatisfied recommendation for libbz2-dev
python-dev: unsatisfied recommendation for sqlite3-dev
python-dev: unsatisfied recommendation for python-argparse-dev
python-dev: unsatisfied recommendation for python-distutils-dev
python-dev: unsatisfied recommendation for python-unittest-dev
python-dev: unsatisfied recommendation for ncurses-libncursesw-dev
python-dev: unsatisfied recommendation for python-difflib-dev
python-dev: unsatisfied recommendation for python-crypt-dev
python-dev: unsatisfied recommendation for python-numbers-dev
python-dev: unsatisfied recommendation for python-idle-dev
python-dev: unsatisfied recommendation for python-db-dev
python-dev: unsatisfied recommendation for python-compiler-dev
python-dev: unsatisfied recommendation for python-unixadmin-dev
python-dev: unsatisfied recommendation for libssl-dev
python-dev: unsatisfied recommendation for ncurses-libpanelw-dev
python-dev: unsatisfied recommendation for python-tests-dev
python-dev: unsatisfied recommendation for python-pickle-dev
python-dev: unsatisfied recommendation for libcrypto-dev
python-dev: unsatisfied recommendation for python-datetime-dev
python-dev: unsatisfied recommendation for python-profile-dev
python-dev: unsatisfied recommendation for python-netclient-dev
python-dev: unsatisfied recommendation for python-xml-dev
python-dev: unsatisfied recommendation for python-textutils-dev
python-dev: unsatisfied recommendation for python-image-dev
python-dev: unsatisfied recommendation for python-smtpd-dev
python-dev: unsatisfied recommendation for python-hotshot-dev
python-dev: unsatisfied recommendation for python-html-dev
python-dev: unsatisfied recommendation for python-tkinter-dev
python-dev: unsatisfied recommendation for python-importlib-dev
python-dev: unsatisfied recommendation for python-bsddb-dev
python-dev: unsatisfied recommendation for python-compression-dev
python-dev: unsatisfied recommendation for python-readline-dev
python-dev: unsatisfied recommendation for python-elementtree-dev
python-dev: unsatisfied recommendation for python-email-dev
python-dev: unsatisfied recommendation for python-shell-dev
python-dev: unsatisfied recommendation for python-terminal-dev
python-dev: unsatisfied recommendation for python-doctest-dev
python-dev: unsatisfied recommendation for python-sqlite3-tests-dev
python-dev: unsatisfied recommendation for python-mailbox-dev
python-dev: unsatisfied recommendation for python-2to3-dev
python-dev: unsatisfied recommendation for gdbm-compat-dev
python-dev: unsatisfied recommendation for python-robotparser-dev
python-dev: unsatisfied recommendation for python-syslog-dev
python-dev: unsatisfied recommendation for python-stringold-dev
python-dev: unsatisfied recommendation for python-re-dev
python-dev: unsatisfied recommendation for python-netserver-dev
python-dev: unsatisfied recommendation for python-ctypes-dev
python-dev: unsatisfied recommendation for python-core-dev
python-pygobject-dev: unsatisfied recommendation for python-core-dev
udev-dev: unsatisfied recommendation for libusb-dev
udev-dev: unsatisfied recommendation for module-init-tools-dev
pciutils-dev: unsatisfied recommendation for pciutils-ids-dev
kmod-dev: unsatisfied recommendation for libkmod-dev
kmod-dev: unsatisfied recommendation for update-alternatives-opkg-dev
pciutils-dev: unsatisfied recommendation for libkmod-dev
pciutils-dev: unsatisfied recommendation for libpci-dev
usbutils-dev: unsatisfied recommendation for usbutils-ids-dev
usbutils-dev: unsatisfied recommendation for libusb-dev
udev-dev: unsatisfied recommendation for libgudev-dev
util-linux-dev: unsatisfied recommendation for util-linux-libsmartcols-dev
util-linux-dev: unsatisfied recommendation for util-linux-sulogin-dev
util-linux-dev: unsatisfied recommendation for ncurses-libncursesw-dev
util-linux-dev: unsatisfied recommendation for util-linux-libfdisk-dev
util-linux-dev: unsatisfied recommendation for update-alternatives-opkg-dev
util-linux-dev: unsatisfied recommendation for util-linux-umount-dev
util-linux-dev: unsatisfied recommendation for ncurses-libtinfo-dev
util-linux-dev: unsatisfied recommendation for util-linux-losetup-dev
util-linux-dev: unsatisfied recommendation for util-linux-swaponoff-dev
udev-dev: unsatisfied recommendation for libkmod-dev
udev-dev: unsatisfied recommendation for libudev-dev
ofono-dev: unsatisfied recommendation for dbus-lib-dev
bluez5-dev: unsatisfied recommendation for libusb-dev
bluez5-dev: unsatisfied recommendation for dbus-lib-dev
libdbus-glib-1-dev: unsatisfied recommendation for dbus-lib-dev
libdbus-glib-1-dev: unsatisfied recommendation for dbus-x11-dev
python-dbus-dev: unsatisfied recommendation for python-io-dev
python-dbus-dev: unsatisfied recommendation for dbus-lib-dev
python-dbus-dev: unsatisfied recommendation for python-logging-dev
python-dbus-dev: unsatisfied recommendation for python-xml-dev
python-dbus-dev: unsatisfied recommendation for python-stringold-dev
python-dbus-dev: unsatisfied recommendation for python-threading-dev
gawk-dev: unsatisfied recommendation for update-alternatives-opkg-dev
bluez5-dev: unsatisfied recommendation for libudev-dev
ofono-dev: unsatisfied recommendation for libudev-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-intended-roles-dev
pulseaudio-dev: unsatisfied recommendation for libpulsecore-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-alsa-util-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-native-protocol-unix-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-cli-protocol-unix-dev
pulseaudio-dev: unsatisfied recommendation for libavahi-client-dev
alsa-lib-dev: unsatisfied recommendation for alsa-conf-base-dev
alsa-lib-dev: unsatisfied recommendation for libasound-dev
alsa-lib-dev: unsatisfied recommendation for alsa-conf-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-rtp-dev
pulseaudio-dev: unsatisfied recommendation for libudev-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-alsa-sink-dev
pulseaudio-dev: unsatisfied recommendation for libpulse-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-cli-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-suspend-on-idle-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-stream-restore-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-null-sink-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-lib-protocol-cli-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-detect-dev
attr-dev: unsatisfied recommendation for libattr-dev
gettext-dev: unsatisfied recommendation for libgettextlib-dev
gettext-dev: unsatisfied recommendation for libgettextsrc-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-lib-protocol-native-dev
libsndfile-dev: unsatisfied recommendation for libasound-dev
libsndfile-dev: unsatisfied recommendation for sqlite3-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-default-device-restore-dev
pulseaudio-dev: unsatisfied recommendation for
alsa-plugins-pulseaudio-conf-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-always-sink-dev
pulseaudio-dev: unsatisfied recommendation for libavahi-common-dev
pulseaudio-dev: unsatisfied recommendation for libpulsecommon-dev
gconf-dev: unsatisfied recommendation for dbus-lib-dev
gconf-dev: unsatisfied recommendation for gobject-introspection-stub-dev
gconf-dev: unsatisfied recommendation for dbus-x11-dev
libxml2-dev: unsatisfied recommendation for libpython2-dev
libxml2-dev: unsatisfied recommendation for python-core-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-filter-apply-dev
pulseaudio-dev: unsatisfied recommendation for libx11-xcb-dev
pulseaudio-dev: unsatisfied recommendation for libasound-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-device-restore-dev
pulseaudio-dev: unsatisfied recommendation for libpulse-simple-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-alsa-card-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-lib-bluez5-util-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-alsa-source-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-lib-protocol-esound-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-augment-properties-dev
pulseaudio-dev: unsatisfied recommendation for shadow-sysroot-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-lib-protocol-http-dev
pulseaudio-dev: unsatisfied recommendation for dbus-lib-dev
consolekit-dev: unsatisfied recommendation for dbus-lib-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-udev-detect-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-avahi-wrap-de=
v
pulseaudio-dev: unsatisfied recommendation for libpulse-mainloop-glib-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-switch-on-port-available-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-lib-protocol-simple-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-role-cork-dev
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-oss-util-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-rescue-streams-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-console-kit-dev
bash-dev: unsatisfied recommendation for update-alternatives-opkg-dev
bash-dev: unsatisfied recommendation for ncurses-libtinfo-dev
libtool-dev: unsatisfied recommendation for libltdl-dev
pulseaudio-dev: unsatisfied recommendation for
pulseaudio-module-filter-heuristics-dev
libqtxml-dev: unsatisfied recommendation for sqlite3-dev
libqtsvg-dev: unsatisfied recommendation for sqlite3-dev
libqtgui-dev: unsatisfied recommendation for sqlite3-dev
libqtuitools4-dev: unsatisfied recommendation for sqlite3-dev
libqttest-dev: unsatisfied recommendation for sqlite3-dev
libqtscript-dev: unsatisfied recommendation for sqlite3-dev
libqtscripttools-dev: unsatisfied recommendation for sqlite3-dev
libqtmultimedia-dev: unsatisfied recommendation for sqlite3-dev
libqtmultimedia-dev: unsatisfied recommendation for libasound-dev
libqtxmlpatterns-dev: unsatisfied recommendation for sqlite3-dev
libqtnetwork-dev: unsatisfied recommendation for sqlite3-dev
libqtclucene-dev: unsatisfied recommendation for sqlite3-dev
libqthelp-dev: unsatisfied recommendation for sqlite3-dev
libqtsql-dev: unsatisfied recommendation for sqlite3-dev
libqtdeclarative-dev: unsatisfied recommendation for sqlite3-dev
libqt3support-dev: unsatisfied recommendation for sqlite3-dev
libqtwebkit-dev: unsatisfied recommendation for sqlite3-dev
qt4-x11-free: unsatisfied recommendation for libqtassistantclient4
qt4-x11-free: unsatisfied recommendation for libqtuitools4
qt4-x11-free: unsatisfied recommendation for qt4-makeqpf
qt4-x11-free: unsatisfied recommendation for libqtmediaservices4
qt4-x11-free: unsatisfied recommendation for libqtopenvg4
qt4-x11-free: unsatisfied recommendation for libqtopengl4
qt4-x11-free: unsatisfied recommendation for libqtpvrqwswsegl4
qt4-x11-free: unsatisfied recommendation for libqtphonon4
libqtdesigner-dev: unsatisfied recommendation for sqlite3-dev
qt4-x11-free-dev: unsatisfied recommendation for libqtopenvg4-dev
qt4-x11-free-dev: unsatisfied recommendation for libqtopengl4-dev
libqtdesignercomponents-dev: unsatisfied recommendation for sqlite3-dev
qt4-x11-free-dev: unsatisfied recommendation for libqtmediaservices4-dev
qt4-x11-free-dev: unsatisfied recommendation for sqlite3-dev
qt4-x11-free-dev: unsatisfied recommendation for libqtassistantclient4-dev
qt4-x11-free-dev: unsatisfied recommendation for libqtphonon4-dev
qt4-x11-free-dev: unsatisfied recommendation for libqtpvrqwswsegl4-dev
Collected errors:
 * satisfy_dependencies_for: Cannot satisfy the following dependencies for
packagegroup-qt-toolchain-target:
 *     libqtphonon4-dev *
 * opkg_install_cmd: Cannot install package
packagegroup-qt-toolchain-target.

ERROR: Function failed: do_populate_sdk
ERROR: Logfile of failure stored in:
/home/lukas/yocto/openembedded-core/build/tmp-glibc/work/cortexa9-vfp-neon-=
oe-linux-gnueabi/meta-toolchain-qt/1.0-r7/temp/log.do_populate_sdk.2747
ERROR: Task 7 (/home/lukas/yocto/openembedded-core/meta/recipes-qt/meta/
meta-toolchain-qt.bb, do_populate_sdk) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3201 tasks of which 3200 didn't need to be
rerun and 1 failed.


--=20

Mit freundlichen Gr=C3=BC=C3=9Fen

Lukas Plazovnik


*---------------------------------*
*Tel.:0664/**1505609*
*lukas.plazovnik@gmail.com <lukas.plazovnik@gmail.com>*
www.avalanche.co.at



--=20

Mit freundlichen Gr=C3=BC=C3=9Fen

Lukas Plazovnik


*---------------------------------*
*Tel.:0664/**1505609*
*lukas.plazovnik@gmail.com <lukas.plazovnik@gmail.com>*
www.avalanche.co.at

--001a1134cd3829b05d051b87b394
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><br><br></div>additionally: If i run a qt progra=
m at the operatin system i get:<br><br>Unable to load library icui18n &quot=
;Cannot load library icui18n: (icui18n: cannot open shared object file: No =
such file or directory)&quot;<br><br></div>any idea?<br><div><div><br><div =
class=3D"gmail_quote">---------- Forwarded message ----------<br>From: <b c=
lass=3D"gmail_sendername">Lukas Plazovnik</b> <span dir=3D"ltr">&lt;<a href=
=3D"mailto:lukas.plazovnik@gmail.com">lukas.plazovnik@gmail.com</a>&gt;</sp=
an><br>Date: 2015-07-23 10:06 GMT+02:00<br>Subject: meta-toolchain-qt<br>To=
: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openembedded-=
core@lists.openembedded.org</a><br><br><br><div dir=3D"ltr"><div><div>hello=
,<br><br></div>I&#39;ve got a problem in the do_populate_sdk stage<br><br><=
/div>compiling works fine but then i got an error of missing dependencies(a=
lmost everything?)<br><br>NOTE: /home/lukas/yocto/openembedded-core/build/t=
mp-glibc/sysroots/x86_64-linux/usr/bin/opkg-cl -f /home/lukas/yocto/openemb=
edded-core/build/tmp-glibc/work/cortexa9-vfp-neon-oe-linux-gnueabi/meta-too=
lchain-qt/1.0-r7/opkg.conf -o /home/lukas/yocto/openembedded-core/build/tmp=
-glibc/work/cortexa9-vfp-neon-oe-linux-gnueabi/meta-toolchain-qt/1.0-r7/sdk=
/image/usr/local/oecore-x86_64/sysroots/cortexa9-vfp-neon-oe-linux-gnueabi =
--force_postinstall --prefer-arch-to-version=C2=A0=C2=A0 install packagegro=
up-qt-toolchain-target<br>ERROR: Unable to install packages. Command &#39;/=
home/lukas/yocto/openembedded-core/build/tmp-glibc/sysroots/x86_64-linux/us=
r/bin/opkg-cl -f /home/lukas/yocto/openembedded-core/build/tmp-glibc/work/c=
ortexa9-vfp-neon-oe-linux-gnueabi/meta-toolchain-qt/1.0-r7/opkg.conf -o /ho=
me/lukas/yocto/openembedded-core/build/tmp-glibc/work/cortexa9-vfp-neon-oe-=
linux-gnueabi/meta-toolchain-qt/1.0-r7/sdk/image/usr/local/oecore-x86_64/sy=
sroots/cortexa9-vfp-neon-oe-linux-gnueabi --force_postinstall --prefer-arch=
-to-version=C2=A0=C2=A0 install packagegroup-qt-toolchain-target&#39; retur=
ned 255:<br>Installing packagegroup-qt-toolchain-target (1.0-r0) on root.<b=
r>Downloading file:/home/lukas/yocto/openembedded-core/build/tmp-glibc/depl=
oy/ipk/all/packagegroup-qt-toolchain-target_1.0-r0_all.ipk.<br>libc6-dev: u=
nsatisfied recommendation for glibc-extra-nss-dev<br>libc6-dev: unsatisfied=
 recommendation for glibc-thread-db-dev<br>libc6-dev: unsatisfied recommend=
ation for libsegfault-dev<br>libc6-dev: unsatisfied recommendation for libg=
cc-initial-dev<br>libc6-dev: unsatisfied recommendation for libcidn-dev<br>=
icu-dev: unsatisfied recommendation for libicuuc-dev<br>icu-dev: unsatisfie=
d recommendation for libicudata-dev<br>icu-dev: unsatisfied recommendation =
for libicuio-dev<br>icu-dev: unsatisfied recommendation for libiculx-dev<br=
>icu-dev: unsatisfied recommendation for libicule-dev<br>icu-dev: unsatisfi=
ed recommendation for libicui18n-dev<br>icu-dev: unsatisfied recommendation=
 for libicutu-dev<br>openssl-dev: unsatisfied recommendation for libcrypto-=
dev<br>openssl-dev: unsatisfied recommendation for libssl-dev<br>libtiff-de=
v: unsatisfied recommendation for liblzma-dev<br>libtiff-dev: unsatisfied r=
ecommendation for tiffxx-dev<br>xz-dev: unsatisfied recommendation for libl=
zma-dev<br>libqtdbus-dev: unsatisfied recommendation for sqlite3-dev<br>sha=
dow-dev: unsatisfied recommendation for util-linux-sulogin-dev<br>shadow-de=
v: unsatisfied recommendation for update-alternatives-opkg-dev<br>shadow-de=
v: unsatisfied recommendation for shadow-base-dev<br>dbus-dev: unsatisfied =
recommendation for shadow-sysroot-dev<br>dbus-dev: unsatisfied recommendati=
on for dbus-lib-dev<br>dbus-dev: unsatisfied recommendation for initscripts=
-functions-dev<br>libx11-dev: unsatisfied recommendation for libx11-xcb-dev=
<br>libxcb-dev: unsatisfied recommendation for libxcb-shape-dev<br>libxcb-d=
ev: unsatisfied recommendation for libxcb-dpms-dev<br>libxcb-dev: unsatisfi=
ed recommendation for libxcb-render-dev<br>libxcb-dev: unsatisfied recommen=
dation for libxcb-shm-dev<br>libxcb-dev: unsatisfied recommendation for lib=
xcb-dri3-dev<br>libxcb-dev: unsatisfied recommendation for libxcb-damage-de=
v<br>libxcb-dev: unsatisfied recommendation for libxcb-glx-dev<br>libxcb-de=
v: unsatisfied recommendation for libxcb-composite-dev<br>libxcb-dev: unsat=
isfied recommendation for libxcb-res-dev<br>libxcb-dev: unsatisfied recomme=
ndation for libxcb-xvmc-dev<br>libxcb-dev: unsatisfied recommendation for l=
ibxcb-xkb-dev<br>libxcb-dev: unsatisfied recommendation for libxcb-sync-dev=
<br>libxcb-dev: unsatisfied recommendation for libxcb-xevie-dev<br>libxcb-d=
ev: unsatisfied recommendation for libxcb-dri2-dev<br>libxcb-dev: unsatisfi=
ed recommendation for libxcb-randr-dev<br>libxcb-dev: unsatisfied recommend=
ation for libxcb-record-dev<br>libxcb-dev: unsatisfied recommendation for l=
ibxcb-xprint-dev<br>libxcb-dev: unsatisfied recommendation for libxcb-xv-de=
v<br>libxcb-dev: unsatisfied recommendation for libxcb-xtest-dev<br>libxcb-=
dev: unsatisfied recommendation for libxcb-screensaver-dev<br>libxcb-dev: u=
nsatisfied recommendation for libxcb-present-dev<br>libxcb-dev: unsatisfied=
 recommendation for libxcb-xf86dri-dev<br>libxcb-dev: unsatisfied recommend=
ation for libxcb-xinerama-dev<br>libxcb-dev: unsatisfied recommendation for=
 libxcb-xfixes-dev<br>initscripts-dev: unsatisfied recommendation for updat=
e-alternatives-opkg-dev<br>initscripts-dev: unsatisfied recommendation for =
initscripts-functions-dev<br>libxrender-dev: unsatisfied recommendation for=
 xdmcp-dev<br>libqtcore-dev: unsatisfied recommendation for sqlite3-dev<br>=
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-position-e=
vent-sounds-dev<br>pulseaudio-dev: unsatisfied recommendation for pulseaudi=
o-module-card-restore-dev<br>pulseaudio-dev: unsatisfied recommendation for=
 libltdl-dev<br>libgdbm-dev: unsatisfied recommendation for gdbm-compat-dev=
<br>package libtinfo5 suggests installing ncurses-terminfo<br>python-pygobj=
ect-dev: unsatisfied recommendation for python-textutils-dev<br>python-pygo=
bject-dev: unsatisfied recommendation for python-pygobject-lib-dev<br>pytho=
n-dev: unsatisfied recommendation for python-audio-dev<br>python-dev: unsat=
isfied recommendation for python-mime-dev<br>python-dev: unsatisfied recomm=
endation for python-io-dev<br>python-dev: unsatisfied recommendation for nc=
urses-libtinfo-dev<br>python-dev: unsatisfied recommendation for python-res=
ource-dev<br>python-dev: unsatisfied recommendation for python-zlib-dev<br>=
python-dev: unsatisfied recommendation for python-lang-dev<br>python-dev: u=
nsatisfied recommendation for python-multiprocessing-dev<br>python-dev: uns=
atisfied recommendation for python-mmap-dev<br>python-dev: unsatisfied reco=
mmendation for python-pkgutil-dev<br>python-dev: unsatisfied recommendation=
 for python-subprocess-dev<br>python-dev: unsatisfied recommendation for py=
thon-json-dev<br>python-dev: unsatisfied recommendation for python-gdbm-dev=
<br>bzip2-dev: unsatisfied recommendation for update-alternatives-opkg-dev<=
br>bzip2-dev: unsatisfied recommendation for libbz2-dev<br>python-dev: unsa=
tisfied recommendation for python-sqlite3-dev<br>python-dev: unsatisfied re=
commendation for libpython2-dev<br>python-dev: unsatisfied recommendation f=
or python-math-dev<br>python-dev: unsatisfied recommendation for python-log=
ging-dev<br>python-dev: unsatisfied recommendation for python-threading-dev=
<br>python-dev: unsatisfied recommendation for python-codecs-dev<br>python-=
dev: unsatisfied recommendation for python-contextlib-dev<br>python-dev: un=
satisfied recommendation for python-pydoc-dev<br>python-dev: unsatisfied re=
commendation for python-pprint-dev<br>python-dev: unsatisfied recommendatio=
n for python-curses-dev<br>libreadline-dev: unsatisfied recommendation for =
ncurses-libtinfo-dev<br>ncurses-dev: unsatisfied recommendation for ncurses=
-libmenu-dev<br>ncurses-dev: unsatisfied recommendation for ncurses-libpane=
l-dev<br>ncurses-dev: unsatisfied recommendation for ncurses-libtinfo-dev<b=
r>ncurses-dev: unsatisfied recommendation for ncurses-libform-dev<br>ncurse=
s-dev: unsatisfied recommendation for ncurses-libncursesw-dev<br>ncurses-de=
v: unsatisfied recommendation for ncurses-libtic-dev<br>ncurses-dev: unsati=
sfied recommendation for ncurses-libncurses-dev<br>ncurses-dev: unsatisfied=
 recommendation for ncurses-libmenuw-dev<br>ncurses-dev: unsatisfied recomm=
endation for ncurses-terminfo-base-dev<br>ncurses-dev: unsatisfied recommen=
dation for update-alternatives-opkg-dev<br>ncurses-dev: unsatisfied recomme=
ndation for ncurses-libpanelw-dev<br>ncurses-dev: unsatisfied recommendatio=
n for ncurses-libformw-dev<br>ncurses-dev: unsatisfied recommendation for n=
curses-libticw-dev<br>python-dev: unsatisfied recommendation for python-fcn=
tl-dev<br>python-dev: unsatisfied recommendation for python-compile-dev<br>=
python-dev: unsatisfied recommendation for python-debugger-dev<br>python-de=
v: unsatisfied recommendation for python-xmlrpc-dev<br>python-dev: unsatisf=
ied recommendation for libbz2-dev<br>python-dev: unsatisfied recommendation=
 for sqlite3-dev<br>python-dev: unsatisfied recommendation for python-argpa=
rse-dev<br>python-dev: unsatisfied recommendation for python-distutils-dev<=
br>python-dev: unsatisfied recommendation for python-unittest-dev<br>python=
-dev: unsatisfied recommendation for ncurses-libncursesw-dev<br>python-dev:=
 unsatisfied recommendation for python-difflib-dev<br>python-dev: unsatisfi=
ed recommendation for python-crypt-dev<br>python-dev: unsatisfied recommend=
ation for python-numbers-dev<br>python-dev: unsatisfied recommendation for =
python-idle-dev<br>python-dev: unsatisfied recommendation for python-db-dev=
<br>python-dev: unsatisfied recommendation for python-compiler-dev<br>pytho=
n-dev: unsatisfied recommendation for python-unixadmin-dev<br>python-dev: u=
nsatisfied recommendation for libssl-dev<br>python-dev: unsatisfied recomme=
ndation for ncurses-libpanelw-dev<br>python-dev: unsatisfied recommendation=
 for python-tests-dev<br>python-dev: unsatisfied recommendation for python-=
pickle-dev<br>python-dev: unsatisfied recommendation for libcrypto-dev<br>p=
ython-dev: unsatisfied recommendation for python-datetime-dev<br>python-dev=
: unsatisfied recommendation for python-profile-dev<br>python-dev: unsatisf=
ied recommendation for python-netclient-dev<br>python-dev: unsatisfied reco=
mmendation for python-xml-dev<br>python-dev: unsatisfied recommendation for=
 python-textutils-dev<br>python-dev: unsatisfied recommendation for python-=
image-dev<br>python-dev: unsatisfied recommendation for python-smtpd-dev<br=
>python-dev: unsatisfied recommendation for python-hotshot-dev<br>python-de=
v: unsatisfied recommendation for python-html-dev<br>python-dev: unsatisfie=
d recommendation for python-tkinter-dev<br>python-dev: unsatisfied recommen=
dation for python-importlib-dev<br>python-dev: unsatisfied recommendation f=
or python-bsddb-dev<br>python-dev: unsatisfied recommendation for python-co=
mpression-dev<br>python-dev: unsatisfied recommendation for python-readline=
-dev<br>python-dev: unsatisfied recommendation for python-elementtree-dev<b=
r>python-dev: unsatisfied recommendation for python-email-dev<br>python-dev=
: unsatisfied recommendation for python-shell-dev<br>python-dev: unsatisfie=
d recommendation for python-terminal-dev<br>python-dev: unsatisfied recomme=
ndation for python-doctest-dev<br>python-dev: unsatisfied recommendation fo=
r python-sqlite3-tests-dev<br>python-dev: unsatisfied recommendation for py=
thon-mailbox-dev<br>python-dev: unsatisfied recommendation for python-2to3-=
dev<br>python-dev: unsatisfied recommendation for gdbm-compat-dev<br>python=
-dev: unsatisfied recommendation for python-robotparser-dev<br>python-dev: =
unsatisfied recommendation for python-syslog-dev<br>python-dev: unsatisfied=
 recommendation for python-stringold-dev<br>python-dev: unsatisfied recomme=
ndation for python-re-dev<br>python-dev: unsatisfied recommendation for pyt=
hon-netserver-dev<br>python-dev: unsatisfied recommendation for python-ctyp=
es-dev<br>python-dev: unsatisfied recommendation for python-core-dev<br>pyt=
hon-pygobject-dev: unsatisfied recommendation for python-core-dev<br>udev-d=
ev: unsatisfied recommendation for libusb-dev<br>udev-dev: unsatisfied reco=
mmendation for module-init-tools-dev<br>pciutils-dev: unsatisfied recommend=
ation for pciutils-ids-dev<br>kmod-dev: unsatisfied recommendation for libk=
mod-dev<br>kmod-dev: unsatisfied recommendation for update-alternatives-opk=
g-dev<br>pciutils-dev: unsatisfied recommendation for libkmod-dev<br>pciuti=
ls-dev: unsatisfied recommendation for libpci-dev<br>usbutils-dev: unsatisf=
ied recommendation for usbutils-ids-dev<br>usbutils-dev: unsatisfied recomm=
endation for libusb-dev<br>udev-dev: unsatisfied recommendation for libgude=
v-dev<br>util-linux-dev: unsatisfied recommendation for util-linux-libsmart=
cols-dev<br>util-linux-dev: unsatisfied recommendation for util-linux-sulog=
in-dev<br>util-linux-dev: unsatisfied recommendation for ncurses-libncurses=
w-dev<br>util-linux-dev: unsatisfied recommendation for util-linux-libfdisk=
-dev<br>util-linux-dev: unsatisfied recommendation for update-alternatives-=
opkg-dev<br>util-linux-dev: unsatisfied recommendation for util-linux-umoun=
t-dev<br>util-linux-dev: unsatisfied recommendation for ncurses-libtinfo-de=
v<br>util-linux-dev: unsatisfied recommendation for util-linux-losetup-dev<=
br>util-linux-dev: unsatisfied recommendation for util-linux-swaponoff-dev<=
br>udev-dev: unsatisfied recommendation for libkmod-dev<br>udev-dev: unsati=
sfied recommendation for libudev-dev<br>ofono-dev: unsatisfied recommendati=
on for dbus-lib-dev<br>bluez5-dev: unsatisfied recommendation for libusb-de=
v<br>bluez5-dev: unsatisfied recommendation for dbus-lib-dev<br>libdbus-gli=
b-1-dev: unsatisfied recommendation for dbus-lib-dev<br>libdbus-glib-1-dev:=
 unsatisfied recommendation for dbus-x11-dev<br>python-dbus-dev: unsatisfie=
d recommendation for python-io-dev<br>python-dbus-dev: unsatisfied recommen=
dation for dbus-lib-dev<br>python-dbus-dev: unsatisfied recommendation for =
python-logging-dev<br>python-dbus-dev: unsatisfied recommendation for pytho=
n-xml-dev<br>python-dbus-dev: unsatisfied recommendation for python-stringo=
ld-dev<br>python-dbus-dev: unsatisfied recommendation for python-threading-=
dev<br>gawk-dev: unsatisfied recommendation for update-alternatives-opkg-de=
v<br>bluez5-dev: unsatisfied recommendation for libudev-dev<br>ofono-dev: u=
nsatisfied recommendation for libudev-dev<br>pulseaudio-dev: unsatisfied re=
commendation for pulseaudio-module-intended-roles-dev<br>pulseaudio-dev: un=
satisfied recommendation for libpulsecore-dev<br>pulseaudio-dev: unsatisfie=
d recommendation for pulseaudio-lib-alsa-util-dev<br>pulseaudio-dev: unsati=
sfied recommendation for pulseaudio-module-native-protocol-unix-dev<br>puls=
eaudio-dev: unsatisfied recommendation for pulseaudio-module-cli-protocol-u=
nix-dev<br>pulseaudio-dev: unsatisfied recommendation for libavahi-client-d=
ev<br>alsa-lib-dev: unsatisfied recommendation for alsa-conf-base-dev<br>al=
sa-lib-dev: unsatisfied recommendation for libasound-dev<br>alsa-lib-dev: u=
nsatisfied recommendation for alsa-conf-dev<br>pulseaudio-dev: unsatisfied =
recommendation for pulseaudio-lib-rtp-dev<br>pulseaudio-dev: unsatisfied re=
commendation for libudev-dev<br>pulseaudio-dev: unsatisfied recommendation =
for pulseaudio-module-alsa-sink-dev<br>pulseaudio-dev: unsatisfied recommen=
dation for libpulse-dev<br>pulseaudio-dev: unsatisfied recommendation for p=
ulseaudio-lib-cli-dev<br>pulseaudio-dev: unsatisfied recommendation for pul=
seaudio-module-suspend-on-idle-dev<br>pulseaudio-dev: unsatisfied recommend=
ation for pulseaudio-module-stream-restore-dev<br>pulseaudio-dev: unsatisfi=
ed recommendation for pulseaudio-module-null-sink-dev<br>pulseaudio-dev: un=
satisfied recommendation for pulseaudio-lib-protocol-cli-dev<br>pulseaudio-=
dev: unsatisfied recommendation for pulseaudio-module-detect-dev<br>attr-de=
v: unsatisfied recommendation for libattr-dev<br>gettext-dev: unsatisfied r=
ecommendation for libgettextlib-dev<br>gettext-dev: unsatisfied recommendat=
ion for libgettextsrc-dev<br>pulseaudio-dev: unsatisfied recommendation for=
 pulseaudio-lib-protocol-native-dev<br>libsndfile-dev: unsatisfied recommen=
dation for libasound-dev<br>libsndfile-dev: unsatisfied recommendation for =
sqlite3-dev<br>pulseaudio-dev: unsatisfied recommendation for pulseaudio-mo=
dule-default-device-restore-dev<br>pulseaudio-dev: unsatisfied recommendati=
on for alsa-plugins-pulseaudio-conf-dev<br>pulseaudio-dev: unsatisfied reco=
mmendation for pulseaudio-module-always-sink-dev<br>pulseaudio-dev: unsatis=
fied recommendation for libavahi-common-dev<br>pulseaudio-dev: unsatisfied =
recommendation for libpulsecommon-dev<br>gconf-dev: unsatisfied recommendat=
ion for dbus-lib-dev<br>gconf-dev: unsatisfied recommendation for gobject-i=
ntrospection-stub-dev<br>gconf-dev: unsatisfied recommendation for dbus-x11=
-dev<br>libxml2-dev: unsatisfied recommendation for libpython2-dev<br>libxm=
l2-dev: unsatisfied recommendation for python-core-dev<br>pulseaudio-dev: u=
nsatisfied recommendation for pulseaudio-module-filter-apply-dev<br>pulseau=
dio-dev: unsatisfied recommendation for libx11-xcb-dev<br>pulseaudio-dev: u=
nsatisfied recommendation for libasound-dev<br>pulseaudio-dev: unsatisfied =
recommendation for pulseaudio-module-device-restore-dev<br>pulseaudio-dev: =
unsatisfied recommendation for libpulse-simple-dev<br>pulseaudio-dev: unsat=
isfied recommendation for pulseaudio-module-alsa-card-dev<br>pulseaudio-dev=
: unsatisfied recommendation for pulseaudio-lib-bluez5-util-dev<br>pulseaud=
io-dev: unsatisfied recommendation for pulseaudio-module-alsa-source-dev<br=
>pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-protocol-eso=
und-dev<br>pulseaudio-dev: unsatisfied recommendation for pulseaudio-module=
-augment-properties-dev<br>pulseaudio-dev: unsatisfied recommendation for s=
hadow-sysroot-dev<br>pulseaudio-dev: unsatisfied recommendation for pulseau=
dio-lib-protocol-http-dev<br>pulseaudio-dev: unsatisfied recommendation for=
 dbus-lib-dev<br>consolekit-dev: unsatisfied recommendation for dbus-lib-de=
v<br>pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-udev-=
detect-dev<br>pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib=
-avahi-wrap-dev<br>pulseaudio-dev: unsatisfied recommendation for libpulse-=
mainloop-glib-dev<br>pulseaudio-dev: unsatisfied recommendation for pulseau=
dio-module-switch-on-port-available-dev<br>pulseaudio-dev: unsatisfied reco=
mmendation for pulseaudio-lib-protocol-simple-dev<br>pulseaudio-dev: unsati=
sfied recommendation for pulseaudio-module-role-cork-dev<br>pulseaudio-dev:=
 unsatisfied recommendation for pulseaudio-lib-oss-util-dev<br>pulseaudio-d=
ev: unsatisfied recommendation for pulseaudio-module-rescue-streams-dev<br>=
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-console-ki=
t-dev<br>bash-dev: unsatisfied recommendation for update-alternatives-opkg-=
dev<br>bash-dev: unsatisfied recommendation for ncurses-libtinfo-dev<br>lib=
tool-dev: unsatisfied recommendation for libltdl-dev<br>pulseaudio-dev: uns=
atisfied recommendation for pulseaudio-module-filter-heuristics-dev<br>libq=
txml-dev: unsatisfied recommendation for sqlite3-dev<br>libqtsvg-dev: unsat=
isfied recommendation for sqlite3-dev<br>libqtgui-dev: unsatisfied recommen=
dation for sqlite3-dev<br>libqtuitools4-dev: unsatisfied recommendation for=
 sqlite3-dev<br>libqttest-dev: unsatisfied recommendation for sqlite3-dev<b=
r>libqtscript-dev: unsatisfied recommendation for sqlite3-dev<br>libqtscrip=
ttools-dev: unsatisfied recommendation for sqlite3-dev<br>libqtmultimedia-d=
ev: unsatisfied recommendation for sqlite3-dev<br>libqtmultimedia-dev: unsa=
tisfied recommendation for libasound-dev<br>libqtxmlpatterns-dev: unsatisfi=
ed recommendation for sqlite3-dev<br>libqtnetwork-dev: unsatisfied recommen=
dation for sqlite3-dev<br>libqtclucene-dev: unsatisfied recommendation for =
sqlite3-dev<br>libqthelp-dev: unsatisfied recommendation for sqlite3-dev<br=
>libqtsql-dev: unsatisfied recommendation for sqlite3-dev<br>libqtdeclarati=
ve-dev: unsatisfied recommendation for sqlite3-dev<br>libqt3support-dev: un=
satisfied recommendation for sqlite3-dev<br>libqtwebkit-dev: unsatisfied re=
commendation for sqlite3-dev<br>qt4-x11-free: unsatisfied recommendation fo=
r libqtassistantclient4<br>qt4-x11-free: unsatisfied recommendation for lib=
qtuitools4<br>qt4-x11-free: unsatisfied recommendation for qt4-makeqpf<br>q=
t4-x11-free: unsatisfied recommendation for libqtmediaservices4<br>qt4-x11-=
free: unsatisfied recommendation for libqtopenvg4<br>qt4-x11-free: unsatisf=
ied recommendation for libqtopengl4<br>qt4-x11-free: unsatisfied recommenda=
tion for libqtpvrqwswsegl4<br>qt4-x11-free: unsatisfied recommendation for =
libqtphonon4<br>libqtdesigner-dev: unsatisfied recommendation for sqlite3-d=
ev<br>qt4-x11-free-dev: unsatisfied recommendation for libqtopenvg4-dev<br>=
qt4-x11-free-dev: unsatisfied recommendation for libqtopengl4-dev<br>libqtd=
esignercomponents-dev: unsatisfied recommendation for sqlite3-dev<br>qt4-x1=
1-free-dev: unsatisfied recommendation for libqtmediaservices4-dev<br>qt4-x=
11-free-dev: unsatisfied recommendation for sqlite3-dev<br>qt4-x11-free-dev=
: unsatisfied recommendation for libqtassistantclient4-dev<br>qt4-x11-free-=
dev: unsatisfied recommendation for libqtphonon4-dev<br>qt4-x11-free-dev: u=
nsatisfied recommendation for libqtpvrqwswsegl4-dev<br>Collected errors:<br=
>=C2=A0* satisfy_dependencies_for: Cannot satisfy the following dependencie=
s for packagegroup-qt-toolchain-target:<br>=C2=A0* =C2=A0=C2=A0=C2=A0 libqt=
phonon4-dev * <br>=C2=A0* opkg_install_cmd: Cannot install package packageg=
roup-qt-toolchain-target.<br><br>ERROR: Function failed: do_populate_sdk<br=
>ERROR: Logfile of failure stored in: /home/lukas/yocto/openembedded-core/b=
uild/tmp-glibc/work/cortexa9-vfp-neon-oe-linux-gnueabi/meta-toolchain-qt/1.=
0-r7/temp/log.do_populate_sdk.2747<br>ERROR: Task 7 (/home/lukas/yocto/open=
embedded-core/meta/recipes-qt/meta/<a href=3D"http://meta-toolchain-qt.bb" =
target=3D"_blank">meta-toolchain-qt.bb</a>, do_populate_sdk) failed with ex=
it code &#39;1&#39;<br>NOTE: Tasks Summary: Attempted 3201 tasks of which 3=
200 didn&#39;t need to be rerun and 1 failed.<span class=3D"HOEnZb"><font c=
olor=3D"#888888"><br><br clear=3D"all"><div><div><div><br>-- <br><div><div =
dir=3D"ltr"><span style=3D"border-collapse:separate;color:rgb(0,0,0);font-f=
amily:Helvetica;font-size:12px;font-style:normal;font-variant:normal;font-w=
eight:normal;letter-spacing:normal;line-height:normal;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px"><span style=3D"border-c=
ollapse:separate;color:rgb(0,0,0);font-family:Helvetica;font-size:12px;font=
-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;=
line-height:normal;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px"><br>Mit freundlichen Gr=C3=BC=C3=9Fen</span></span><br><br=
>Lukas Plazovnik<br><br><div style=3D"margin-left:40px;background-color:rgb=
(255,255,255);color:rgb(153,0,0)"><b>---------------------------------<br><=
/b></div><div style=3D"margin-left:40px"><b><span style=3D"background-color=
:rgb(255,255,255);color:rgb(153,0,0)">Tel.:0664/</span></b><font color=3D"#=
990000"><b>1505609</b></font><br><b style=3D"color:rgb(153,0,0)"><a href=3D=
"mailto:lukas.plazovnik@gmail.com" target=3D"_blank">lukas.plazovnik@gmail.=
com</a></b><br><a href=3D"http://www.avalanche.co.at" target=3D"_blank">www=
.avalanche.co.at</a><br></div></div></div>
</div></div></div></font></span></div>
</div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_signature"><div =
dir=3D"ltr"><span style=3D"border-collapse:separate;color:rgb(0,0,0);font-f=
amily:Helvetica;font-size:12px;font-style:normal;font-variant:normal;font-w=
eight:normal;letter-spacing:normal;line-height:normal;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px"><span style=3D"border-c=
ollapse:separate;color:rgb(0,0,0);font-family:Helvetica;font-size:12px;font=
-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;=
line-height:normal;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px"><br>Mit freundlichen Gr=C3=BC=C3=9Fen</span></span><br><br=
>Lukas Plazovnik<br><br><div style=3D"margin-left:40px;background-color:rgb=
(255,255,255);color:rgb(153,0,0)"><b>---------------------------------<br><=
/b></div><div style=3D"margin-left:40px"><b><span style=3D"background-color=
:rgb(255,255,255);color:rgb(153,0,0)">Tel.:0664/</span></b><font color=3D"#=
990000"><b>1505609</b></font><br><b style=3D"color:rgb(153,0,0)"><a href=3D=
"mailto:lukas.plazovnik@gmail.com" target=3D"_blank">lukas.plazovnik@gmail.=
com</a></b><br><a href=3D"http://www.avalanche.co.at" target=3D"_blank">www=
.avalanche.co.at</a><br></div></div></div>
</div></div></div>

--001a1134cd3829b05d051b87b394--
