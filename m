Return-Path: <mordeng10@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5E85B75F14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 08:06:44 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so196419401wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 01:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=2k5mFQJZnA2193+/e//nhQOir9f7ZQV8aWxyUlj7nAM=;
	b=BYW2tQGMeeKpF7S68KkTWRcJSdmabFIQMyk7cKX0r8RqpMehqp+ZMofBYq/Lb7NEgA
	m1h7AAJud1VrOOCMVe/09wI0TsfBhEc//SnMf30PTHORJEoFPjHtn9UfRIIGVUHe9m03
	4ajTT2mDXKiwXIpWExmBYR0B0Mnj5dPA9FC3CQgX+uU5FvSGdGX/0vCc5rNJFsC4JscZ
	sSYny7ZNaNpLCvAa2y84wCmytQenx62BX1sJIZhN5GaoIB2Y+6qK+oCKZ9rE/k6AcgAH
	Ne1ounx10/Yiue/4XwGcfq91koA/1Q6Ix/5wsntPZdrqSiIoNLdQnO554Rnhn3GJapzx
	xW6w==
MIME-Version: 1.0
X-Received: by 10.180.36.3 with SMTP id m3mr50327623wij.60.1437638804539; Thu,
	23 Jul 2015 01:06:44 -0700 (PDT)
Sender: mordeng10@gmail.com
Received: by 10.27.204.196 with HTTP; Thu, 23 Jul 2015 01:06:44 -0700 (PDT)
Date: Thu, 23 Jul 2015 10:06:44 +0200
X-Google-Sender-Auth: ADRzU633PGFBkY5sgb0MC59sjwE
Message-ID: <CAFZ+r7ENNvqETETaTEUdomiY5V16VQ2usJ6B3m_edvEDT4dxOA@mail.gmail.com>
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
X-List-Received-Date: Thu, 23 Jul 2015 08:06:47 -0000
Content-Type: multipart/alternative; boundary=e89a8f839739428e97051b865e65

--e89a8f839739428e97051b865e65
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

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

--e89a8f839739428e97051b865e65
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>hello,<br><br></div>I&#39;ve got a problem in th=
e do_populate_sdk stage<br><br></div>compiling works fine but then i got an=
 error of missing dependencies(almost everything?)<br><br>NOTE: /home/lukas=
/yocto/openembedded-core/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/opkg=
-cl -f /home/lukas/yocto/openembedded-core/build/tmp-glibc/work/cortexa9-vf=
p-neon-oe-linux-gnueabi/meta-toolchain-qt/1.0-r7/opkg.conf -o /home/lukas/y=
octo/openembedded-core/build/tmp-glibc/work/cortexa9-vfp-neon-oe-linux-gnue=
abi/meta-toolchain-qt/1.0-r7/sdk/image/usr/local/oecore-x86_64/sysroots/cor=
texa9-vfp-neon-oe-linux-gnueabi --force_postinstall --prefer-arch-to-versio=
n=C2=A0=C2=A0 install packagegroup-qt-toolchain-target<br>ERROR: Unable to =
install packages. Command &#39;/home/lukas/yocto/openembedded-core/build/tm=
p-glibc/sysroots/x86_64-linux/usr/bin/opkg-cl -f /home/lukas/yocto/openembe=
dded-core/build/tmp-glibc/work/cortexa9-vfp-neon-oe-linux-gnueabi/meta-tool=
chain-qt/1.0-r7/opkg.conf -o /home/lukas/yocto/openembedded-core/build/tmp-=
glibc/work/cortexa9-vfp-neon-oe-linux-gnueabi/meta-toolchain-qt/1.0-r7/sdk/=
image/usr/local/oecore-x86_64/sysroots/cortexa9-vfp-neon-oe-linux-gnueabi -=
-force_postinstall --prefer-arch-to-version=C2=A0=C2=A0 install packagegrou=
p-qt-toolchain-target&#39; returned 255:<br>Installing packagegroup-qt-tool=
chain-target (1.0-r0) on root.<br>Downloading file:/home/lukas/yocto/openem=
bedded-core/build/tmp-glibc/deploy/ipk/all/packagegroup-qt-toolchain-target=
_1.0-r0_all.ipk.<br>libc6-dev: unsatisfied recommendation for glibc-extra-n=
ss-dev<br>libc6-dev: unsatisfied recommendation for glibc-thread-db-dev<br>=
libc6-dev: unsatisfied recommendation for libsegfault-dev<br>libc6-dev: uns=
atisfied recommendation for libgcc-initial-dev<br>libc6-dev: unsatisfied re=
commendation for libcidn-dev<br>icu-dev: unsatisfied recommendation for lib=
icuuc-dev<br>icu-dev: unsatisfied recommendation for libicudata-dev<br>icu-=
dev: unsatisfied recommendation for libicuio-dev<br>icu-dev: unsatisfied re=
commendation for libiculx-dev<br>icu-dev: unsatisfied recommendation for li=
bicule-dev<br>icu-dev: unsatisfied recommendation for libicui18n-dev<br>icu=
-dev: unsatisfied recommendation for libicutu-dev<br>openssl-dev: unsatisfi=
ed recommendation for libcrypto-dev<br>openssl-dev: unsatisfied recommendat=
ion for libssl-dev<br>libtiff-dev: unsatisfied recommendation for liblzma-d=
ev<br>libtiff-dev: unsatisfied recommendation for tiffxx-dev<br>xz-dev: uns=
atisfied recommendation for liblzma-dev<br>libqtdbus-dev: unsatisfied recom=
mendation for sqlite3-dev<br>shadow-dev: unsatisfied recommendation for uti=
l-linux-sulogin-dev<br>shadow-dev: unsatisfied recommendation for update-al=
ternatives-opkg-dev<br>shadow-dev: unsatisfied recommendation for shadow-ba=
se-dev<br>dbus-dev: unsatisfied recommendation for shadow-sysroot-dev<br>db=
us-dev: unsatisfied recommendation for dbus-lib-dev<br>dbus-dev: unsatisfie=
d recommendation for initscripts-functions-dev<br>libx11-dev: unsatisfied r=
ecommendation for libx11-xcb-dev<br>libxcb-dev: unsatisfied recommendation =
for libxcb-shape-dev<br>libxcb-dev: unsatisfied recommendation for libxcb-d=
pms-dev<br>libxcb-dev: unsatisfied recommendation for libxcb-render-dev<br>=
libxcb-dev: unsatisfied recommendation for libxcb-shm-dev<br>libxcb-dev: un=
satisfied recommendation for libxcb-dri3-dev<br>libxcb-dev: unsatisfied rec=
ommendation for libxcb-damage-dev<br>libxcb-dev: unsatisfied recommendation=
 for libxcb-glx-dev<br>libxcb-dev: unsatisfied recommendation for libxcb-co=
mposite-dev<br>libxcb-dev: unsatisfied recommendation for libxcb-res-dev<br=
>libxcb-dev: unsatisfied recommendation for libxcb-xvmc-dev<br>libxcb-dev: =
unsatisfied recommendation for libxcb-xkb-dev<br>libxcb-dev: unsatisfied re=
commendation for libxcb-sync-dev<br>libxcb-dev: unsatisfied recommendation =
for libxcb-xevie-dev<br>libxcb-dev: unsatisfied recommendation for libxcb-d=
ri2-dev<br>libxcb-dev: unsatisfied recommendation for libxcb-randr-dev<br>l=
ibxcb-dev: unsatisfied recommendation for libxcb-record-dev<br>libxcb-dev: =
unsatisfied recommendation for libxcb-xprint-dev<br>libxcb-dev: unsatisfied=
 recommendation for libxcb-xv-dev<br>libxcb-dev: unsatisfied recommendation=
 for libxcb-xtest-dev<br>libxcb-dev: unsatisfied recommendation for libxcb-=
screensaver-dev<br>libxcb-dev: unsatisfied recommendation for libxcb-presen=
t-dev<br>libxcb-dev: unsatisfied recommendation for libxcb-xf86dri-dev<br>l=
ibxcb-dev: unsatisfied recommendation for libxcb-xinerama-dev<br>libxcb-dev=
: unsatisfied recommendation for libxcb-xfixes-dev<br>initscripts-dev: unsa=
tisfied recommendation for update-alternatives-opkg-dev<br>initscripts-dev:=
 unsatisfied recommendation for initscripts-functions-dev<br>libxrender-dev=
: unsatisfied recommendation for xdmcp-dev<br>libqtcore-dev: unsatisfied re=
commendation for sqlite3-dev<br>pulseaudio-dev: unsatisfied recommendation =
for pulseaudio-module-position-event-sounds-dev<br>pulseaudio-dev: unsatisf=
ied recommendation for pulseaudio-module-card-restore-dev<br>pulseaudio-dev=
: unsatisfied recommendation for libltdl-dev<br>libgdbm-dev: unsatisfied re=
commendation for gdbm-compat-dev<br>package libtinfo5 suggests installing n=
curses-terminfo<br>python-pygobject-dev: unsatisfied recommendation for pyt=
hon-textutils-dev<br>python-pygobject-dev: unsatisfied recommendation for p=
ython-pygobject-lib-dev<br>python-dev: unsatisfied recommendation for pytho=
n-audio-dev<br>python-dev: unsatisfied recommendation for python-mime-dev<b=
r>python-dev: unsatisfied recommendation for python-io-dev<br>python-dev: u=
nsatisfied recommendation for ncurses-libtinfo-dev<br>python-dev: unsatisfi=
ed recommendation for python-resource-dev<br>python-dev: unsatisfied recomm=
endation for python-zlib-dev<br>python-dev: unsatisfied recommendation for =
python-lang-dev<br>python-dev: unsatisfied recommendation for python-multip=
rocessing-dev<br>python-dev: unsatisfied recommendation for python-mmap-dev=
<br>python-dev: unsatisfied recommendation for python-pkgutil-dev<br>python=
-dev: unsatisfied recommendation for python-subprocess-dev<br>python-dev: u=
nsatisfied recommendation for python-json-dev<br>python-dev: unsatisfied re=
commendation for python-gdbm-dev<br>bzip2-dev: unsatisfied recommendation f=
or update-alternatives-opkg-dev<br>bzip2-dev: unsatisfied recommendation fo=
r libbz2-dev<br>python-dev: unsatisfied recommendation for python-sqlite3-d=
ev<br>python-dev: unsatisfied recommendation for libpython2-dev<br>python-d=
ev: unsatisfied recommendation for python-math-dev<br>python-dev: unsatisfi=
ed recommendation for python-logging-dev<br>python-dev: unsatisfied recomme=
ndation for python-threading-dev<br>python-dev: unsatisfied recommendation =
for python-codecs-dev<br>python-dev: unsatisfied recommendation for python-=
contextlib-dev<br>python-dev: unsatisfied recommendation for python-pydoc-d=
ev<br>python-dev: unsatisfied recommendation for python-pprint-dev<br>pytho=
n-dev: unsatisfied recommendation for python-curses-dev<br>libreadline-dev:=
 unsatisfied recommendation for ncurses-libtinfo-dev<br>ncurses-dev: unsati=
sfied recommendation for ncurses-libmenu-dev<br>ncurses-dev: unsatisfied re=
commendation for ncurses-libpanel-dev<br>ncurses-dev: unsatisfied recommend=
ation for ncurses-libtinfo-dev<br>ncurses-dev: unsatisfied recommendation f=
or ncurses-libform-dev<br>ncurses-dev: unsatisfied recommendation for ncurs=
es-libncursesw-dev<br>ncurses-dev: unsatisfied recommendation for ncurses-l=
ibtic-dev<br>ncurses-dev: unsatisfied recommendation for ncurses-libncurses=
-dev<br>ncurses-dev: unsatisfied recommendation for ncurses-libmenuw-dev<br=
>ncurses-dev: unsatisfied recommendation for ncurses-terminfo-base-dev<br>n=
curses-dev: unsatisfied recommendation for update-alternatives-opkg-dev<br>=
ncurses-dev: unsatisfied recommendation for ncurses-libpanelw-dev<br>ncurse=
s-dev: unsatisfied recommendation for ncurses-libformw-dev<br>ncurses-dev: =
unsatisfied recommendation for ncurses-libticw-dev<br>python-dev: unsatisfi=
ed recommendation for python-fcntl-dev<br>python-dev: unsatisfied recommend=
ation for python-compile-dev<br>python-dev: unsatisfied recommendation for =
python-debugger-dev<br>python-dev: unsatisfied recommendation for python-xm=
lrpc-dev<br>python-dev: unsatisfied recommendation for libbz2-dev<br>python=
-dev: unsatisfied recommendation for sqlite3-dev<br>python-dev: unsatisfied=
 recommendation for python-argparse-dev<br>python-dev: unsatisfied recommen=
dation for python-distutils-dev<br>python-dev: unsatisfied recommendation f=
or python-unittest-dev<br>python-dev: unsatisfied recommendation for ncurse=
s-libncursesw-dev<br>python-dev: unsatisfied recommendation for python-diff=
lib-dev<br>python-dev: unsatisfied recommendation for python-crypt-dev<br>p=
ython-dev: unsatisfied recommendation for python-numbers-dev<br>python-dev:=
 unsatisfied recommendation for python-idle-dev<br>python-dev: unsatisfied =
recommendation for python-db-dev<br>python-dev: unsatisfied recommendation =
for python-compiler-dev<br>python-dev: unsatisfied recommendation for pytho=
n-unixadmin-dev<br>python-dev: unsatisfied recommendation for libssl-dev<br=
>python-dev: unsatisfied recommendation for ncurses-libpanelw-dev<br>python=
-dev: unsatisfied recommendation for python-tests-dev<br>python-dev: unsati=
sfied recommendation for python-pickle-dev<br>python-dev: unsatisfied recom=
mendation for libcrypto-dev<br>python-dev: unsatisfied recommendation for p=
ython-datetime-dev<br>python-dev: unsatisfied recommendation for python-pro=
file-dev<br>python-dev: unsatisfied recommendation for python-netclient-dev=
<br>python-dev: unsatisfied recommendation for python-xml-dev<br>python-dev=
: unsatisfied recommendation for python-textutils-dev<br>python-dev: unsati=
sfied recommendation for python-image-dev<br>python-dev: unsatisfied recomm=
endation for python-smtpd-dev<br>python-dev: unsatisfied recommendation for=
 python-hotshot-dev<br>python-dev: unsatisfied recommendation for python-ht=
ml-dev<br>python-dev: unsatisfied recommendation for python-tkinter-dev<br>=
python-dev: unsatisfied recommendation for python-importlib-dev<br>python-d=
ev: unsatisfied recommendation for python-bsddb-dev<br>python-dev: unsatisf=
ied recommendation for python-compression-dev<br>python-dev: unsatisfied re=
commendation for python-readline-dev<br>python-dev: unsatisfied recommendat=
ion for python-elementtree-dev<br>python-dev: unsatisfied recommendation fo=
r python-email-dev<br>python-dev: unsatisfied recommendation for python-she=
ll-dev<br>python-dev: unsatisfied recommendation for python-terminal-dev<br=
>python-dev: unsatisfied recommendation for python-doctest-dev<br>python-de=
v: unsatisfied recommendation for python-sqlite3-tests-dev<br>python-dev: u=
nsatisfied recommendation for python-mailbox-dev<br>python-dev: unsatisfied=
 recommendation for python-2to3-dev<br>python-dev: unsatisfied recommendati=
on for gdbm-compat-dev<br>python-dev: unsatisfied recommendation for python=
-robotparser-dev<br>python-dev: unsatisfied recommendation for python-syslo=
g-dev<br>python-dev: unsatisfied recommendation for python-stringold-dev<br=
>python-dev: unsatisfied recommendation for python-re-dev<br>python-dev: un=
satisfied recommendation for python-netserver-dev<br>python-dev: unsatisfie=
d recommendation for python-ctypes-dev<br>python-dev: unsatisfied recommend=
ation for python-core-dev<br>python-pygobject-dev: unsatisfied recommendati=
on for python-core-dev<br>udev-dev: unsatisfied recommendation for libusb-d=
ev<br>udev-dev: unsatisfied recommendation for module-init-tools-dev<br>pci=
utils-dev: unsatisfied recommendation for pciutils-ids-dev<br>kmod-dev: uns=
atisfied recommendation for libkmod-dev<br>kmod-dev: unsatisfied recommenda=
tion for update-alternatives-opkg-dev<br>pciutils-dev: unsatisfied recommen=
dation for libkmod-dev<br>pciutils-dev: unsatisfied recommendation for libp=
ci-dev<br>usbutils-dev: unsatisfied recommendation for usbutils-ids-dev<br>=
usbutils-dev: unsatisfied recommendation for libusb-dev<br>udev-dev: unsati=
sfied recommendation for libgudev-dev<br>util-linux-dev: unsatisfied recomm=
endation for util-linux-libsmartcols-dev<br>util-linux-dev: unsatisfied rec=
ommendation for util-linux-sulogin-dev<br>util-linux-dev: unsatisfied recom=
mendation for ncurses-libncursesw-dev<br>util-linux-dev: unsatisfied recomm=
endation for util-linux-libfdisk-dev<br>util-linux-dev: unsatisfied recomme=
ndation for update-alternatives-opkg-dev<br>util-linux-dev: unsatisfied rec=
ommendation for util-linux-umount-dev<br>util-linux-dev: unsatisfied recomm=
endation for ncurses-libtinfo-dev<br>util-linux-dev: unsatisfied recommenda=
tion for util-linux-losetup-dev<br>util-linux-dev: unsatisfied recommendati=
on for util-linux-swaponoff-dev<br>udev-dev: unsatisfied recommendation for=
 libkmod-dev<br>udev-dev: unsatisfied recommendation for libudev-dev<br>ofo=
no-dev: unsatisfied recommendation for dbus-lib-dev<br>bluez5-dev: unsatisf=
ied recommendation for libusb-dev<br>bluez5-dev: unsatisfied recommendation=
 for dbus-lib-dev<br>libdbus-glib-1-dev: unsatisfied recommendation for dbu=
s-lib-dev<br>libdbus-glib-1-dev: unsatisfied recommendation for dbus-x11-de=
v<br>python-dbus-dev: unsatisfied recommendation for python-io-dev<br>pytho=
n-dbus-dev: unsatisfied recommendation for dbus-lib-dev<br>python-dbus-dev:=
 unsatisfied recommendation for python-logging-dev<br>python-dbus-dev: unsa=
tisfied recommendation for python-xml-dev<br>python-dbus-dev: unsatisfied r=
ecommendation for python-stringold-dev<br>python-dbus-dev: unsatisfied reco=
mmendation for python-threading-dev<br>gawk-dev: unsatisfied recommendation=
 for update-alternatives-opkg-dev<br>bluez5-dev: unsatisfied recommendation=
 for libudev-dev<br>ofono-dev: unsatisfied recommendation for libudev-dev<b=
r>pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-intended=
-roles-dev<br>pulseaudio-dev: unsatisfied recommendation for libpulsecore-d=
ev<br>pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-alsa-ut=
il-dev<br>pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-=
native-protocol-unix-dev<br>pulseaudio-dev: unsatisfied recommendation for =
pulseaudio-module-cli-protocol-unix-dev<br>pulseaudio-dev: unsatisfied reco=
mmendation for libavahi-client-dev<br>alsa-lib-dev: unsatisfied recommendat=
ion for alsa-conf-base-dev<br>alsa-lib-dev: unsatisfied recommendation for =
libasound-dev<br>alsa-lib-dev: unsatisfied recommendation for alsa-conf-dev=
<br>pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-rtp-dev<b=
r>pulseaudio-dev: unsatisfied recommendation for libudev-dev<br>pulseaudio-=
dev: unsatisfied recommendation for pulseaudio-module-alsa-sink-dev<br>puls=
eaudio-dev: unsatisfied recommendation for libpulse-dev<br>pulseaudio-dev: =
unsatisfied recommendation for pulseaudio-lib-cli-dev<br>pulseaudio-dev: un=
satisfied recommendation for pulseaudio-module-suspend-on-idle-dev<br>pulse=
audio-dev: unsatisfied recommendation for pulseaudio-module-stream-restore-=
dev<br>pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-nul=
l-sink-dev<br>pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib=
-protocol-cli-dev<br>pulseaudio-dev: unsatisfied recommendation for pulseau=
dio-module-detect-dev<br>attr-dev: unsatisfied recommendation for libattr-d=
ev<br>gettext-dev: unsatisfied recommendation for libgettextlib-dev<br>gett=
ext-dev: unsatisfied recommendation for libgettextsrc-dev<br>pulseaudio-dev=
: unsatisfied recommendation for pulseaudio-lib-protocol-native-dev<br>libs=
ndfile-dev: unsatisfied recommendation for libasound-dev<br>libsndfile-dev:=
 unsatisfied recommendation for sqlite3-dev<br>pulseaudio-dev: unsatisfied =
recommendation for pulseaudio-module-default-device-restore-dev<br>pulseaud=
io-dev: unsatisfied recommendation for alsa-plugins-pulseaudio-conf-dev<br>=
pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-always-sin=
k-dev<br>pulseaudio-dev: unsatisfied recommendation for libavahi-common-dev=
<br>pulseaudio-dev: unsatisfied recommendation for libpulsecommon-dev<br>gc=
onf-dev: unsatisfied recommendation for dbus-lib-dev<br>gconf-dev: unsatisf=
ied recommendation for gobject-introspection-stub-dev<br>gconf-dev: unsatis=
fied recommendation for dbus-x11-dev<br>libxml2-dev: unsatisfied recommenda=
tion for libpython2-dev<br>libxml2-dev: unsatisfied recommendation for pyth=
on-core-dev<br>pulseaudio-dev: unsatisfied recommendation for pulseaudio-mo=
dule-filter-apply-dev<br>pulseaudio-dev: unsatisfied recommendation for lib=
x11-xcb-dev<br>pulseaudio-dev: unsatisfied recommendation for libasound-dev=
<br>pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-device=
-restore-dev<br>pulseaudio-dev: unsatisfied recommendation for libpulse-sim=
ple-dev<br>pulseaudio-dev: unsatisfied recommendation for pulseaudio-module=
-alsa-card-dev<br>pulseaudio-dev: unsatisfied recommendation for pulseaudio=
-lib-bluez5-util-dev<br>pulseaudio-dev: unsatisfied recommendation for puls=
eaudio-module-alsa-source-dev<br>pulseaudio-dev: unsatisfied recommendation=
 for pulseaudio-lib-protocol-esound-dev<br>pulseaudio-dev: unsatisfied reco=
mmendation for pulseaudio-module-augment-properties-dev<br>pulseaudio-dev: =
unsatisfied recommendation for shadow-sysroot-dev<br>pulseaudio-dev: unsati=
sfied recommendation for pulseaudio-lib-protocol-http-dev<br>pulseaudio-dev=
: unsatisfied recommendation for dbus-lib-dev<br>consolekit-dev: unsatisfie=
d recommendation for dbus-lib-dev<br>pulseaudio-dev: unsatisfied recommenda=
tion for pulseaudio-module-udev-detect-dev<br>pulseaudio-dev: unsatisfied r=
ecommendation for pulseaudio-lib-avahi-wrap-dev<br>pulseaudio-dev: unsatisf=
ied recommendation for libpulse-mainloop-glib-dev<br>pulseaudio-dev: unsati=
sfied recommendation for pulseaudio-module-switch-on-port-available-dev<br>=
pulseaudio-dev: unsatisfied recommendation for pulseaudio-lib-protocol-simp=
le-dev<br>pulseaudio-dev: unsatisfied recommendation for pulseaudio-module-=
role-cork-dev<br>pulseaudio-dev: unsatisfied recommendation for pulseaudio-=
lib-oss-util-dev<br>pulseaudio-dev: unsatisfied recommendation for pulseaud=
io-module-rescue-streams-dev<br>pulseaudio-dev: unsatisfied recommendation =
for pulseaudio-module-console-kit-dev<br>bash-dev: unsatisfied recommendati=
on for update-alternatives-opkg-dev<br>bash-dev: unsatisfied recommendation=
 for ncurses-libtinfo-dev<br>libtool-dev: unsatisfied recommendation for li=
bltdl-dev<br>pulseaudio-dev: unsatisfied recommendation for pulseaudio-modu=
le-filter-heuristics-dev<br>libqtxml-dev: unsatisfied recommendation for sq=
lite3-dev<br>libqtsvg-dev: unsatisfied recommendation for sqlite3-dev<br>li=
bqtgui-dev: unsatisfied recommendation for sqlite3-dev<br>libqtuitools4-dev=
: unsatisfied recommendation for sqlite3-dev<br>libqttest-dev: unsatisfied =
recommendation for sqlite3-dev<br>libqtscript-dev: unsatisfied recommendati=
on for sqlite3-dev<br>libqtscripttools-dev: unsatisfied recommendation for =
sqlite3-dev<br>libqtmultimedia-dev: unsatisfied recommendation for sqlite3-=
dev<br>libqtmultimedia-dev: unsatisfied recommendation for libasound-dev<br=
>libqtxmlpatterns-dev: unsatisfied recommendation for sqlite3-dev<br>libqtn=
etwork-dev: unsatisfied recommendation for sqlite3-dev<br>libqtclucene-dev:=
 unsatisfied recommendation for sqlite3-dev<br>libqthelp-dev: unsatisfied r=
ecommendation for sqlite3-dev<br>libqtsql-dev: unsatisfied recommendation f=
or sqlite3-dev<br>libqtdeclarative-dev: unsatisfied recommendation for sqli=
te3-dev<br>libqt3support-dev: unsatisfied recommendation for sqlite3-dev<br=
>libqtwebkit-dev: unsatisfied recommendation for sqlite3-dev<br>qt4-x11-fre=
e: unsatisfied recommendation for libqtassistantclient4<br>qt4-x11-free: un=
satisfied recommendation for libqtuitools4<br>qt4-x11-free: unsatisfied rec=
ommendation for qt4-makeqpf<br>qt4-x11-free: unsatisfied recommendation for=
 libqtmediaservices4<br>qt4-x11-free: unsatisfied recommendation for libqto=
penvg4<br>qt4-x11-free: unsatisfied recommendation for libqtopengl4<br>qt4-=
x11-free: unsatisfied recommendation for libqtpvrqwswsegl4<br>qt4-x11-free:=
 unsatisfied recommendation for libqtphonon4<br>libqtdesigner-dev: unsatisf=
ied recommendation for sqlite3-dev<br>qt4-x11-free-dev: unsatisfied recomme=
ndation for libqtopenvg4-dev<br>qt4-x11-free-dev: unsatisfied recommendatio=
n for libqtopengl4-dev<br>libqtdesignercomponents-dev: unsatisfied recommen=
dation for sqlite3-dev<br>qt4-x11-free-dev: unsatisfied recommendation for =
libqtmediaservices4-dev<br>qt4-x11-free-dev: unsatisfied recommendation for=
 sqlite3-dev<br>qt4-x11-free-dev: unsatisfied recommendation for libqtassis=
tantclient4-dev<br>qt4-x11-free-dev: unsatisfied recommendation for libqtph=
onon4-dev<br>qt4-x11-free-dev: unsatisfied recommendation for libqtpvrqwsws=
egl4-dev<br>Collected errors:<br>=C2=A0* satisfy_dependencies_for: Cannot s=
atisfy the following dependencies for packagegroup-qt-toolchain-target:<br>=
=C2=A0* =C2=A0=C2=A0=C2=A0 libqtphonon4-dev * <br>=C2=A0* opkg_install_cmd:=
 Cannot install package packagegroup-qt-toolchain-target.<br><br>ERROR: Fun=
ction failed: do_populate_sdk<br>ERROR: Logfile of failure stored in: /home=
/lukas/yocto/openembedded-core/build/tmp-glibc/work/cortexa9-vfp-neon-oe-li=
nux-gnueabi/meta-toolchain-qt/1.0-r7/temp/log.do_populate_sdk.2747<br>ERROR=
: Task 7 (/home/lukas/yocto/openembedded-core/meta/recipes-qt/meta/<a href=
=3D"http://meta-toolchain-qt.bb">meta-toolchain-qt.bb</a>, do_populate_sdk)=
 failed with exit code &#39;1&#39;<br>NOTE: Tasks Summary: Attempted 3201 t=
asks of which 3200 didn&#39;t need to be rerun and 1 failed.<br><br clear=
=3D"all"><div><div><div><br>-- <br><div class=3D"gmail_signature"><div dir=
=3D"ltr"><span style=3D"border-collapse:separate;color:rgb(0,0,0);font-fami=
ly:Helvetica;font-size:12px;font-style:normal;font-variant:normal;font-weig=
ht:normal;letter-spacing:normal;line-height:normal;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px"><span style=3D"border-coll=
apse:separate;color:rgb(0,0,0);font-family:Helvetica;font-size:12px;font-st=
yle:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;lin=
e-height:normal;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px"><br>Mit freundlichen Gr=C3=BC=C3=9Fen</span></span><br><br>Lu=
kas Plazovnik<br><br><div style=3D"margin-left:40px;background-color:rgb(25=
5,255,255);color:rgb(153,0,0)"><b>---------------------------------<br></b>=
</div><div style=3D"margin-left:40px"><b><span style=3D"background-color:rg=
b(255,255,255);color:rgb(153,0,0)">Tel.:0664/</span></b><font color=3D"#990=
000"><b>1505609</b></font><br><b style=3D"color:rgb(153,0,0)"><a href=3D"ma=
ilto:lukas.plazovnik@gmail.com" target=3D"_blank">lukas.plazovnik@gmail.com=
</a></b><br><a href=3D"http://www.avalanche.co.at" target=3D"_blank">www.av=
alanche.co.at</a><br></div></div></div>
</div></div></div></div>

--e89a8f839739428e97051b865e65--
