Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id AF2C177F90
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 15:01:40 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id i124so4224571wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 08:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cHh31vPvUMgkXlM3/47bKJjvxvOqHRlInnE0KYKoGF4=;
	b=iSPaPREm55iTQPYv+cWCnDPAY9d4LJXtdYtZcC+OJXcQWmrZ/ck8i7ydzi2+f33YLj
	NUq6frFwGRgDwLa1BQvpnn5nLPLuTDmacuraG4Y4ZLbTuLAUu2Gd57bux651+P5gwsf1
	+JY5Ix2rw0px4S+7xEb07z6kdPnRr9UP19PdJ4FQrrUWEnh4EyWgHC3ZfVO0wC2JI7qB
	rQl6vYTuhJNOZHyGhCPkAONik8qV1K1MicLRDaXgczndVSzpQwDb39XCDGX9p41P9aDG
	J89LcR7HyaAROukCi3HNXzRb/x+gV/srxb5DUAVl1+Uj709YCkNdJnh74qPy2XUQ3JlB
	gASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cHh31vPvUMgkXlM3/47bKJjvxvOqHRlInnE0KYKoGF4=;
	b=kz10aVY3iyFsTiAvYFjrRiwo/cXcoqtBEJ2RXudGcjHTo/D0vKOr7c86q4nyck2uHd
	f5XhF7jLODIQBF+nniF56w8EMZ7193clnkf6r7BdqjQacyi8LHfP95zNm0R7vUs051Xe
	++uDTyhSX0VN3Z6HXVAT96Ryjde8bW7nOH4GFUyxYxdUeLsRwgwzdfiPfIuFMk7nRElz
	nIH5cf9JGmKxE2WSOC66bqGSop4niROJ8W2ItghgOF6rJOgOH+Mbeu+mJNgRqXNBw5XC
	fVZo0JAsjaST6Z6bNgyEW+O5KwxRa9JPq975PF6LWKE20PlLrx5M2k79s43mNRCwGA7a
	W8xw==
X-Gm-Message-State: AMCzsaU3HsFE9s3YH43zz8Q74ZU/juahEsBg58oDSqDGlwUpRcCk+Qud
	3zg8BG4P4ivB0Kp2Du70pIpGNJqBQSzTrxGxmXsq7g==
X-Google-Smtp-Source: ABhQp+Saf9a0IArnuIaHN08WfKN/aj5DCptzjh/zMpNTHKbWLT0aSmMlZB+cMM14QwsRXdB8xoZRVNz4TaV7lmI8X8g=
X-Received: by 10.28.211.69 with SMTP id k66mr1073016wmg.1.1508166100537; Mon,
	16 Oct 2017 08:01:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Mon, 16 Oct 2017 08:01:39 -0700 (PDT)
In-Reply-To: <20170919151851.25093-1-Martin.Jansa@gmail.com>
References: <20170913204659.1919-1-Martin.Jansa@gmail.com>
	<20170919151851.25093-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 16 Oct 2017 17:01:39 +0200
Message-ID: <CA+chaQeokk6Ao9QcRoC1_jb+HzOAn0hOyAK7NRxo4yT_38f1Sw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCHv2] insane.bbclass: Add do_qa_pseudo function to check for common errors listed in pseudo.log
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
X-List-Received-Date: Mon, 16 Oct 2017 15:01:41 -0000
Content-Type: multipart/alternative; boundary="001a114672fcaf6422055bab481e"

--001a114672fcaf6422055bab481e
Content-Type: text/plain; charset="UTF-8"

The world builds with this check applied show that *a lot* of components
report one of these errors and often many of errors, the most complete logs
from last couple days:

366 in:
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171012_161223.log
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20171010_225937.log/qa.log
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20171011_084917.log/qa.log
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20171010_012728.log/qa.log


376 in:
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171001_085046.log
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170926_004402.log/qa.log
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170926_004401.log/qa.log
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170927_070922.log/qa.log

The number of errors differs in various builds, e.g.:
tcl-8.6.7: This
/work/armv5te-oe-linux-gnueabi/tcl/8.6.7-r0/pseudo/pseudo.log indicates 7
errors [qa_pseudo]
tcl-8.6.7: This
/work/armv5te-oe-linux-gnueabi/tcl/8.6.7-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
tcl-8.6.7: This /work/i586-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
tcl-8.6.7: This /work/i586-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log
indicates 8 errors [qa_pseudo]
tcl-8.6.7: This /work/core2-64-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
tcl-8.6.7: This /work/core2-64-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]

glibc-locale-2.26: This
/work/armv5e-oe-linux-gnueabi/glibc-locale/2.26-r0/pseudo/pseudo.log
indicates 17 errors [qa_pseudo]
glibc-locale-2.26: This
/work/armv5e-oe-linux-gnueabi/glibc-locale/2.26-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
glibc-locale-2.26: This
/work/i586-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
glibc-locale-2.26: This
/work/i586-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
glibc-locale-2.26: This
/work/core2-64-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 11
errors [qa_pseudo]
glibc-locale-2.26: This
/work/core2-64-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 16
errors [qa_pseudo]

If I filter out the architecture specific path to pseudo.log and the number
of errors it still gives 368 different builds with errors:

acl-2.2.52 alsa-oss-1.0.17 alsa-plugins-1.1.4 apache2-2.4.27 apmd-3.2.2-15
aspell-0.60.6.1 attr-2.4.47 aufs-util-4.4+gitAUTOINC+89afb1806c
autofs-5.1.2 avahi-ui-0.6.32 base-passwd-3.5.29 binutils-2.29
blktrace-1.1.0+gitAUTOINC+43fc870ce0 bluez5-5.46 bmap-tools-3.4
bonnie++-1.03e boost-1.64.0 bootchart2-0.14.8 busybox-1.24.1
cantarell-fonts-0.0.24 can-utils-0.0+gitrAUTOINC+4c8fb05cb4 canutils-4.0.6
cdparanoia-10.2 chrony-2.4 ckermit-302 connman-1.34 conntrack-tools-1.4.4
console-tools-0.3.2 coreutils-8.27 corosync-2.4.2 cpufrequtils-008
cryptodev-module-1.9 ctdb-2.5.6 cups-2.2.4 curlpp-0.8.1
cwautomacros-20110201 cxxtest-4.3 daemontools-0.76 dbus-test-1.10.20
ddrescue-1.19 dfu-util-0.9 dhcp-4.3.6 diffutils-3.6 dmidecode-3.1
docbook-xml-dtd4-4.5 dovecot-2.2.29 ebtables-2.0.10-4 efivar-0.31
eglinfo-fb-1.0.0 espeak-1.48.04 evtest-1.33+AUTOINC+ab140a2dab expat-2.2.3
f2fs-tools-1.8.0 firefox-l10n-ff-45.9.0esr firefox-l10n-si-45.9.0esr
flac-1.3.2 flatbuffers-1.7.1 fontforge-20170731 frame-2.5.0
freeradius-3.0.15 fribidi-0.19.7 fuse-2.9.7
gateone-1.2+gitAUTOINC+f7a9be46cb gawk-4.1.4 gd-2.2.4 gdb-8.0 gegl-0.3.18
geoip-1.6.9 gettext-0.19.8.1 giflib-5.1.4 git-2.13.3 glade-3.20.0
glib-2.0-2.52.3 glibc-2.26 glibc-locale-2.26 glib-networking-2.50.0
gnupg-2.2.0 gnuplot-5.0.5 go-1.9 gobject-introspection-1.52.1
gptfdisk-1.0.3 gstreamer-0.10.36 gtkmm-2.24.5 hiredis-0.13.1 hplip-3.12.6
icon-slicer-0.3 icu-59.1 inetutils-1.9.4 init-ifupdown-1.0 iotop-0.6
iperf3-3.2 ipsec-tools-0.8.2 iptables-1.6.1 iputils-s20151218
iscsitarget-1.4.20.3+svn502 jack-1.9.10+gitAUTOINC+2d1d323505 kbd-2.0.4
kconfig-frontends-4.11.0.1 kexec-tools-2.0.14 konkretcmpi-0.9.2 krb5-1.15.1
lcdproc-0.5.8+gitAUTOINC+f5156e2e41 less-487 libatasmart-0.19
libatomic-ops-7.6.0+gitAUTOINC+73c60c5ef1 libbsd-0.8.6 libcanberra-0.30
libconnman-qt5-1.1.10+gitAUTOINC+4d6def3053
libcrypt-openssl-random-perl-0.11 libdrm-2.4.83 libencode-perl-2.83
libevdev-1.5.7 libfastjson-0.99.4 libgnome-2.32.1 libiec61883-1.2.0
libinput-1.8.1 libldb-1.1.29 liblogging-1.0.5 libmms-0.6.4 libotr-4.1.1
libpciaccess-0.13.5 libqofono-0.87+gitrAUTOINC+54435de3be librelp-1.2.14
librsvg-2.40.18 libsombok3-2.4.0 libtext-wrapi18n-perl-0.06
libtool-cross-2.4.6 libusb-compat-0.1.5 libusbg-0.1.0 libuser-0.62
libvncserver-0.9.11 libwmf-0.2.8.4 libwnck3-3.20.1 libxcursor-1.1.14
libxml2-2.9.4 libxml-perl-0.08 libxslt-1.1.29 libxxf86vm-1.1.4
linux-atm-2.5.2 linux-yocto-4.12.12+gitAUTOINC+eda4d18ce4_16de014967
linux-yocto-4.12.12+gitAUTOINC+eda4d18ce4_67b62d8d7b lirc-0.9.4d llvm-5.0
lmbench-3.0-a9 lockfile-progs-0.1.17 log4cpp-1.1.2 logfsprogs-git
logrotate-3.12.3 lowpan-tools-0.3.1+gitAUTOINC+38f42dbfce lprng-3.8.C
lttng-tools-2.9.5 lvm2-2.02.171
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1 mariadb-5.5.57
matchbox-keyboard-0.1.1 mc-4.8.19 mce-inject-git md5deep-4.4
memcached-1.5.0 menulibre-2.1.3 mesa-demos-8.3.0 meson-0.40.1
minicoredumper-2.0.0 mongodb-3.4.6+gitAUTOINC+c55eb86ef4 mosquitto-1.4.14
mozilla-devscripts-0.30 mpich-3.2 multipath-tools-0.7.1 nana-2.5
ndisc6-1.0.4+gitAUTOINC+4c794b5512 netcat-0.7.1 net-snmp-5.7.3 nettle-3.3
nginx-1.12.1 nss-3.31.1 ntp-4.2.8p10 onboard-1.4.1 onig-5.9.6
openconnect-7.08 openhpi-3.6.1 openipmi-2.0.24 open-isns-0.97
openlmi-tools-0.10.5 opensaf-5.17.07 opensc-0.16.0 openssh-7.5p1
openssl-1.0.2l opkg-utils-0.3.5 opus-tools-0.1.8 os-release-1.0
ossp-uuid-1.6.2 packagegroup-core-ssh-openssh-1.0
packagegroup-core-x11-xserver-1.0 pango-1.40.6 pciutils-3.5.5 perf-1.0
perl-5.24.1 php-7.1.9 phpmyadmin-4.7.3 pixz-1.0.6 pkcs11-helper-1.11
pm-qa-0.5.2 pm-utils-1.4.1 poppler-data-0.4.7 portaudio-v19-v190600
postfix-3.2.2 postgresql-9.4.13 powertop-2.8 procps-3.3.12 proftpd-1.3.6
pure-ftpd-1.0.42 puzzles-0.0+gitAUTOINC+8dfe5cec31 pyrtm-0.4.2
python-2.7.13 python3-3.5.3 python3-babel-2.5.1 python3-chardet-3.0.4
python3-coverage-4.4.1 python3-cryptography-2.0.3 python3-cython-0.27.1
python3-django-1.11.5 python3-docutils-0.14 python3-isort-4.2.15
python3-mako-1.0.7 python3-ndg-httpsclient-0.4.3 python3-nose-1.3.7
python3-ntplib-0.3.3 python3-pandas-0.20.3 python3-pip-9.0.1
python3-psutil-5.3.1 python3-pykickstart-2.35 python3-pylint-1.7.2
python3-pylint-1.7.4 python3-pyparted-3.10.7+gitAUTOINC+69c4a478e4
python3-serpent-1.23 python3-simplejson-3.11.1 python3-xlrd-1.1.0
python-asn1crypto-0.23.0 python-cheetah-2.4.4 python-cpuset-1.5.7
python-cson-git python-cython-0.26.1 python-django-1.11.5
python-epydoc-3.0.1 python-gevent-1.2.2 python-imaging-1.1.7
python-jsonpatch-1.16 python-jsonpointer-1.12 python-ndg-httpsclient-0.4.3
python-netaddr-0.7.19 python-nose-1.3.7 python-numeric-24.2
python-numpy-1.13.1 python-pandas-0.20.3 python-pbr-3.1.1
python-pyflakes-1.2.3 python-pylint-1.7.2 python-pylint-1.7.4
python-pyro4-4.62 python-pyserial-3.4 python-pytest-3.2.2
python-scons-2.5.1 python-selectors34-1.2 python-setuptools-36.2.7
python-snakefood-1.4 python-snimpy-0.8.11 python-twisted-17.9.0
python-urllib3-1.22 python-vobject-0.9.5 python-xlrd-1.1.0
python-yappi-0.98 pywbem-0.8.0 qemu-2.10.0 qt3d-5.9.2+gitAUTOINC+9d8c9ada16
qt5-creator-3.5.1 qt5-plugin-generic-vboxtouch-1.1.3+gitrAUTOINC+d613ad1cc6
qtbase-5.9.2+gitAUTOINC+73573fce29 qtcharts-5.9.2+gitAUTOINC+1f47b1a7ae
qtconnectivity-5.9.2+gitAUTOINC+94cc2b914a
qtdatavis3d-5.9.2+gitAUTOINC+3f8ae713df
qtdeclarative-5.9.2+gitAUTOINC+7c45b035b9
qtenginio-5.9.2+gitAUTOINC+0555cf73c8 qtgamepad-5.9.2+gitAUTOINC+1fc40deed6
qtgraphicaleffects-5.9.2+gitAUTOINC+b6ff12df54
qtimageformats-5.9.2+gitAUTOINC+144a3535db
qtlocation-5.9.2+gitAUTOINC+c832af7897_9ecbe3642f
qtmultimedia-5.9.2+gitAUTOINC+343e281f0e
qtnetworkauth-5.9.2+gitAUTOINC+3d93f64365
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd
qtquickcontrols2-5.9.2+gitAUTOINC+63f2f55462
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87
qtscript-5.9.2+gitAUTOINC+86ee61734e qtscxml-5.9.2+gitAUTOINC+a1dff1a11a
qtsensors-5.9.2+gitAUTOINC+1673dbed00
qtserialbus-5.9.2+gitAUTOINC+1d37c357c8
qtserialport-5.9.2+gitAUTOINC+93b539140c qtsmarthome-1.0
qtsvg-5.9.2+gitAUTOINC+0fcd016066 qtsystems-5.9.2+gitAUTOINC+f364358a81
qttools-5.9.2+gitAUTOINC+fdc5749b56 qtwayland-5.9.2+gitAUTOINC+7f70da6a64
qtwebchannel-5.9.2+gitAUTOINC+b5229df6a0
qtwebengine-5.9.2+gitAUTOINC+99f84ffd2c_21508b5b54
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12
qtwebsockets-5.9.2+gitAUTOINC+fb71c823a7
qtwebview-5.9.2+gitAUTOINC+e4016a67bb
qtx11extras-5.9.2+gitAUTOINC+f65d50eb06
qtxmlpatterns-5.9.2+gitAUTOINC+fcfa824402 quagga-1.2.1 rabbitmq-c-0.7.0
radvd-2.17 readline-7.0 ristretto-0.8.2 rsync-3.1.2 rsyslog-8.29.0
ruby-2.4.1 samba-4.6.7 satyr-0.23 sblim-sfcb-1.4.9 sblim-sfcc-2.2.8
scsirastools-1.6.6 sed-4.2.2 sg3-utils-1.42 shadow-4.2.1 slang-2.3.1a
snort-2.9.7.5 speexdsp-1.2rc3 sqlite3-3.20.0 squid-3.5.27 sthttpd-2.27.1
strace-4.18 systemd-234 systemtap-3.1 tcl-8.6.7 telepathy-python-0.15.19
tftp-hpa-5.2 tipcutils-2.2.0+gitAUTOINC+7ab2211b87 tomoyo-tools-2.5.0
tslib-1.1 ttf-gentium-1.02 ubi-utils-klibc-1.5.2 udisks-1.0.5 ufw-0.33
upm-1.3.0-gitAUTOINC+106b6c7062 usbredir-0.7.1+gitAUTOINC+39aa3c69f6
usermode-1.111 vblade-22 vlc-2.2.2 vte-0.48.3 weston-init-1.0
xcb-util-wm-0.4.1 xcursor-transparent-theme-0.1.1+gitAUTOINC+23c8af5ba4
xdebug-2.5.1 xdelta3-3.0.11 xf86-input-evdev-2.10.5 xf86-input-mouse-1.9.2
xfce4-closebutton-plugin-0.1.0+gitrAUTOINC+02b74f13ad
xfce4-hotcorner-plugin-0.0.2 xfce4-mixer-4.11.0 xfce4-power-manager-1.6.0
xfce4-verve-plugin-1.1.0 xfwm4-themes-4.10.0 xserver-xorg-1.19.3
xstdcmap-1.0.3 xwd-1.0.6 xz-5.2.3 ypbind-mt-2.4
zlog-1.2.12+gitAUTOINC+13904dab28

Any other insight what might be causing these?

On Tue, Sep 19, 2017 at 5:18 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> * we often see QA warnings like:
>   glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-en-
> gb/usr/lib/locale/en_GB/LC_MEASUREMENT is owned by uid 3004, which is the
> same as the user running bitbake. This may be due to host contamination
> [host-user-contaminated]
>   glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-nn-
> no.iso-8859-1/usr/lib/locale/nn_NO.ISO-8859-1/LC_MEASUREMENT is owned by
> uid 3004, which is the same as the user running bitbake. This may be due to
> host contamination [host-user-contaminated]
>   but we don't know the root cause of it.
> * don't trigger error from '^inode mismatch'
> * show parts of pseudo.log in console
>   many builds are executed in tmpfs, so I cannot check the pseudo.log later
> * lower from error to warn as I hate all my builds reporting failure
>   just because of this pseudo debug
> * the only theory we currently have is that it's a bug in pseudo when
>   inode is being reused for different files, which is supported by
>   pseudo.log entries:
>
>   Good build:
>   pseudo$ grep -v "^path mismatch" pseudo.log
>   debug_logfile: fd 2
>   pid 7975 [parent 7974], doing new pid setup and server start
>   Setup complete, sending SIGUSR1 to pid 7974.
>   db cleanup for server shutdown, 17:33:58.787
>   memory-to-file backup complete, 17:33:58.787.
>   db cleanup finished, 17:33:58.787
>
>   Build with QA host-user-contaminated issue:
>   ERROR: foo-1.0.0-r0 do_package_qa: QA Issue: foo: file-with-wrong-UID is
> owned
>   by uid 2001, which is the same as the user running bitbake. This may be
> due to
>   host contamination [host-user-contaminated]
>
>   pseudo$ grep "file-with-wrong-UID" pseudo.log
>   inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in
> request.
>   creat ignored for existing file 'file-with-wrong-UID'.
>   inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in
> request.
>   inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in
> request.
>   inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in
> request.
>   inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in
> request.
>   inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in
> request.
>   inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in
> request.
>   path mismatch [1 link]: ino 13242270 db 'file-with-wrong-UID' req
> 'some-other-unrelated-file'.
>   creat for 'some-other-unrelated-file' replaces existing 13242270
> ['file-with-wrong-UID'].
>   db cleanup for server shutdown, 02:16:23.685
>   memory-to-file backup complete, 02:16:23.685.
>   db cleanup finished, 02:16:23.685
>
>   And some-other-unrelated-file is really some different file, not just
> hardlink
>   to the same file from some different directory (like between WORKDIR and
> sysroot
>   other "path mismatch" entries show).
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/insane.bbclass | 43 ++++++++++++++++++++++++++++++
> +++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 0a3b528ddb..76cd92709b 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -1238,6 +1238,44 @@ python do_qa_unpack() {
>          bb.warn('%s: the directory %s (%s) pointed to by the S variable
> doesn\'t exist - please set S within the recipe to point to where the
> source has been unpacked to' % (d.getVar('PN'), d.getVar('S', False),
> s_dir))
>  }
>
> +python do_qa_pseudo() {
> +    ############################################################
> ###############
> +    # Check pseudo.log for unexpected errors
> +    #
> +    # Typical pseudo.log contains many "^path mismatch" lines for all the
> hardlinked files
> +    # e.g. in some smaller component I see 231/237 lines to be "^path
> mismatch" other 6
> +    # lines are setup and cleanup lines like this:
> +    # debug_logfile: fd 2
> +    # pid 7975 [parent 7974], doing new pid setup and server start
> +    # Setup complete, sending SIGUSR1 to pid 7974.
> +    # db cleanup for server shutdown, 17:33:58.787
> +    # memory-to-file backup complete, 17:33:58.787.
> +    # db cleanup finished, 17:33:58.787
> +    #
> +    # but if there is one of:
> +    # "^inode mismatch"
> +    # "^creat ignored for existing file"
> +    # "^creat for.*replaces existing"
> +    # then there might be some bigger issue which sometimes results in
> host-user-contaminated QA warnings
> +    ############################################################
> ###############
> +
> +    import subprocess
> +
> +    pseudodir = d.getVar('PSEUDO_LOCALSTATEDIR')
> +    bb.note("Checking pseudo.log for common errors")
> +    pseudolog = os.path.join(pseudodir, "pseudo.log")
> +    statement = "grep" \
> +        " -e '^creat ignored for existing file'" \
> +        " -e '^creat for.*replaces existing'" \
> +        " %s" % pseudolog
> +    if subprocess.call("%s -q" % statement, shell=True) == 0:
> +        statement2 = "grep -v '^path mismatch' %s" % pseudolog
> +        statement2_count = "grep -v '^path mismatch' -c %s" % pseudolog
> +        output = subprocess.check_output(statement2,
> shell=True).decode("utf-8")
> +        output_count = subprocess.check_output(statement2_count,
> shell=True).decode("utf-8").replace('\n', '')
> +        bb.warn("This %s indicates %s errors, see %s or %s [qa_pseudo]:
> %s" % (pseudolog, output_count, statement, statement2, output))
> +}
> +
>  # The Staging Func, to check all staging
>  #addtask qa_staging after do_populate_sysroot before do_build
>  do_populate_sysroot[postfuncs] += "do_qa_staging "
> @@ -1250,6 +1288,11 @@ do_configure[postfuncs] += "do_qa_configure "
>  # Check does S exist.
>  do_unpack[postfuncs] += "do_qa_unpack"
>
> +# Check pseudo.log for unexpected errors
> +# For some reason do_build postfunction isn't executed
> +# do_build[postfuncs] += "do_qa_pseudo"
> +addtask do_qa_pseudo after do_populate_sysroot do_packagedata do_package
> before do_build
> +
>  python () {
>      import re
>
> --
> 2.14.1
>
>

--001a114672fcaf6422055bab481e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The world builds with this check applied show that *a lot*=
 of components report one of these errors and often many of errors, the mos=
t complete logs from last couple days:<div><br></div><div>366 in:</div><div=
><a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report=
.20171012_161223.log">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/=
log.report.20171012_161223.log</a><br></div><div><a href=3D"http://logs.nsl=
u2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20171010_225937.log=
/qa.log">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qem=
uarm.20171010_225937.log/qa.log</a><br></div><div><a href=3D"http://logs.ns=
lu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20171011_084917.lo=
g/qa.log">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qe=
mux86.20171011_084917.log/qa.log</a><br></div><div><a href=3D"http://logs.n=
slu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20171010_01272=
8.log/qa.log">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.worl=
d.qemux86-64.20171010_012728.log/qa.log</a><br></div><div><br></div><div><b=
r></div><div>376 in:</div><div><a href=3D"http://logs.nslu2-linux.org/build=
logs/oe/world/rocko/log.report.20171001_085046.log">http://logs.nslu2-linux=
.org/buildlogs/oe/world/rocko/log.report.20171001_085046.log</a><br></div><=
div><a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.wor=
ld.qemuarm.20170926_004402.log/qa.log">http://logs.nslu2-linux.org/buildlog=
s/oe/world/rocko/log.world.qemuarm.20170926_004402.log/qa.log</a><br></div>=
<div><a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.wo=
rld.qemux86.20170926_004401.log/qa.log">http://logs.nslu2-linux.org/buildlo=
gs/oe/world/rocko/log.world.qemux86.20170926_004401.log/qa.log</a><br></div=
><div><a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.w=
orld.qemux86-64.20170927_070922.log/qa.log">http://logs.nslu2-linux.org/bui=
ldlogs/oe/world/rocko/log.world.qemux86-64.20170927_070922.log/qa.log</a><b=
r></div><div><br></div><div>The number of errors differs in various builds,=
 e.g.:</div><div><div>tcl-8.6.7: This /work/armv5te-oe-linux-gnueabi/tcl/8.=
6.7-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>tcl-8.6.7=
: This /work/armv5te-oe-linux-gnueabi/tcl/8.6.7-r0/pseudo/pseudo.log indica=
tes 5 errors [qa_pseudo]</div><div>tcl-8.6.7: This /work/i586-oe-linux/tcl/=
8.6.7-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>tcl-8.6=
.7: This /work/i586-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log indicates 8 err=
ors [qa_pseudo]</div><div>tcl-8.6.7: This /work/core2-64-oe-linux/tcl/8.6.7=
-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>tcl-8.6.7: T=
his /work/core2-64-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log indicates 6 erro=
rs [qa_pseudo]</div></div><div><br></div><div><div>glibc-locale-2.26: This =
/work/armv5e-oe-linux-gnueabi/glibc-locale/2.26-r0/pseudo/pseudo.log indica=
tes 17 errors [qa_pseudo]</div><div>glibc-locale-2.26: This /work/armv5e-oe=
-linux-gnueabi/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 5 errors [q=
a_pseudo]</div><div>glibc-locale-2.26: This /work/i586-oe-linux/glibc-local=
e/2.26-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]</div><div>glibc=
-locale-2.26: This /work/i586-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.l=
og indicates 10 errors [qa_pseudo]</div><div>glibc-locale-2.26: This /work/=
core2-64-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 11 error=
s [qa_pseudo]</div><div>glibc-locale-2.26: This /work/core2-64-oe-linux/gli=
bc-locale/2.26-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]</div></=
div><div><br></div><div>If I filter out the architecture specific path to p=
seudo.log and the number of errors it still gives 368 different builds with=
 errors:</div><div><br></div><div><div>acl-2.2.52 alsa-oss-1.0.17 alsa-plug=
ins-1.1.4 apache2-2.4.27 apmd-3.2.2-15 aspell-0.60.6.1 attr-2.4.47 aufs-uti=
l-4.4+gitAUTOINC+89afb1806c autofs-5.1.2 avahi-ui-0.6.32 base-passwd-3.5.29=
 binutils-2.29 blktrace-1.1.0+gitAUTOINC+43fc870ce0 bluez5-5.46 bmap-tools-=
3.4 bonnie++-1.03e boost-1.64.0 bootchart2-0.14.8 busybox-1.24.1 cantarell-=
fonts-0.0.24 can-utils-0.0+gitrAUTOINC+4c8fb05cb4 canutils-4.0.6 cdparanoia=
-10.2 chrony-2.4 ckermit-302 connman-1.34 conntrack-tools-1.4.4 console-too=
ls-0.3.2 coreutils-8.27 corosync-2.4.2 cpufrequtils-008 cryptodev-module-1.=
9 ctdb-2.5.6 cups-2.2.4 curlpp-0.8.1 cwautomacros-20110201 cxxtest-4.3 daem=
ontools-0.76 dbus-test-1.10.20 ddrescue-1.19 dfu-util-0.9 dhcp-4.3.6 diffut=
ils-3.6 dmidecode-3.1 docbook-xml-dtd4-4.5 dovecot-2.2.29 ebtables-2.0.10-4=
 efivar-0.31 eglinfo-fb-1.0.0 espeak-1.48.04 evtest-1.33+AUTOINC+ab140a2dab=
 expat-2.2.3 f2fs-tools-1.8.0 firefox-l10n-ff-45.9.0esr firefox-l10n-si-45.=
9.0esr flac-1.3.2 flatbuffers-1.7.1 fontforge-20170731 frame-2.5.0 freeradi=
us-3.0.15 fribidi-0.19.7 fuse-2.9.7 gateone-1.2+gitAUTOINC+f7a9be46cb gawk-=
4.1.4 gd-2.2.4 gdb-8.0 gegl-0.3.18 geoip-1.6.9 gettext-0.19.8.1 giflib-5.1.=
4 git-2.13.3 glade-3.20.0 glib-2.0-2.52.3 glibc-2.26 glibc-locale-2.26 glib=
-networking-2.50.0 gnupg-2.2.0 gnuplot-5.0.5 go-1.9 gobject-introspection-1=
.52.1 gptfdisk-1.0.3 gstreamer-0.10.36 gtkmm-2.24.5 hiredis-0.13.1 hplip-3.=
12.6 icon-slicer-0.3 icu-59.1 inetutils-1.9.4 init-ifupdown-1.0 iotop-0.6 i=
perf3-3.2 ipsec-tools-0.8.2 iptables-1.6.1 iputils-s20151218 iscsitarget-1.=
4.20.3+svn502 jack-1.9.10+gitAUTOINC+2d1d323505 kbd-2.0.4 kconfig-frontends=
-4.11.0.1 kexec-tools-2.0.14 konkretcmpi-0.9.2 krb5-1.15.1 lcdproc-0.5.8+gi=
tAUTOINC+f5156e2e41 less-487 libatasmart-0.19 libatomic-ops-7.6.0+gitAUTOIN=
C+73c60c5ef1 libbsd-0.8.6 libcanberra-0.30 libconnman-qt5-1.1.10+gitAUTOINC=
+4d6def3053 libcrypt-openssl-random-perl-0.11 libdrm-2.4.83 libencode-perl-=
2.83 libevdev-1.5.7 libfastjson-0.99.4 libgnome-2.32.1 libiec61883-1.2.0 li=
binput-1.8.1 libldb-1.1.29 liblogging-1.0.5 libmms-0.6.4 libotr-4.1.1 libpc=
iaccess-0.13.5 libqofono-0.87+gitrAUTOINC+54435de3be librelp-1.2.14 librsvg=
-2.40.18 libsombok3-2.4.0 libtext-wrapi18n-perl-0.06 libtool-cross-2.4.6 li=
busb-compat-0.1.5 libusbg-0.1.0 libuser-0.62 libvncserver-0.9.11 libwmf-0.2=
.8.4 libwnck3-3.20.1 libxcursor-1.1.14 libxml2-2.9.4 libxml-perl-0.08 libxs=
lt-1.1.29 libxxf86vm-1.1.4 linux-atm-2.5.2 linux-yocto-4.12.12+gitAUTOINC+e=
da4d18ce4_16de014967 linux-yocto-4.12.12+gitAUTOINC+eda4d18ce4_67b62d8d7b l=
irc-0.9.4d llvm-5.0 lmbench-3.0-a9 lockfile-progs-0.1.17 log4cpp-1.1.2 logf=
sprogs-git logrotate-3.12.3 lowpan-tools-0.3.1+gitAUTOINC+38f42dbfce lprng-=
3.8.C lttng-tools-2.9.5 lvm2-2.02.171 maliit-framework-qt5-0.99.0+gitAUTOIN=
C+60b1b10de1 mariadb-5.5.57 matchbox-keyboard-0.1.1 mc-4.8.19 mce-inject-gi=
t md5deep-4.4 memcached-1.5.0 menulibre-2.1.3 mesa-demos-8.3.0 meson-0.40.1=
 minicoredumper-2.0.0 mongodb-3.4.6+gitAUTOINC+c55eb86ef4 mosquitto-1.4.14 =
mozilla-devscripts-0.30 mpich-3.2 multipath-tools-0.7.1 nana-2.5 ndisc6-1.0=
.4+gitAUTOINC+4c794b5512 netcat-0.7.1 net-snmp-5.7.3 nettle-3.3 nginx-1.12.=
1 nss-3.31.1 ntp-4.2.8p10 onboard-1.4.1 onig-5.9.6 openconnect-7.08 openhpi=
-3.6.1 openipmi-2.0.24 open-isns-0.97 openlmi-tools-0.10.5 opensaf-5.17.07 =
opensc-0.16.0 openssh-7.5p1 openssl-1.0.2l opkg-utils-0.3.5 opus-tools-0.1.=
8 os-release-1.0 ossp-uuid-1.6.2 packagegroup-core-ssh-openssh-1.0 packageg=
roup-core-x11-xserver-1.0 pango-1.40.6 pciutils-3.5.5 perf-1.0 perl-5.24.1 =
php-7.1.9 phpmyadmin-4.7.3 pixz-1.0.6 pkcs11-helper-1.11 pm-qa-0.5.2 pm-uti=
ls-1.4.1 poppler-data-0.4.7 portaudio-v19-v190600 postfix-3.2.2 postgresql-=
9.4.13 powertop-2.8 procps-3.3.12 proftpd-1.3.6 pure-ftpd-1.0.42 puzzles-0.=
0+gitAUTOINC+8dfe5cec31 pyrtm-0.4.2 python-2.7.13 python3-3.5.3 python3-bab=
el-2.5.1 python3-chardet-3.0.4 python3-coverage-4.4.1 python3-cryptography-=
2.0.3 python3-cython-0.27.1 python3-django-1.11.5 python3-docutils-0.14 pyt=
hon3-isort-4.2.15 python3-mako-1.0.7 python3-ndg-httpsclient-0.4.3 python3-=
nose-1.3.7 python3-ntplib-0.3.3 python3-pandas-0.20.3 python3-pip-9.0.1 pyt=
hon3-psutil-5.3.1 python3-pykickstart-2.35 python3-pylint-1.7.2 python3-pyl=
int-1.7.4 python3-pyparted-3.10.7+gitAUTOINC+69c4a478e4 python3-serpent-1.2=
3 python3-simplejson-3.11.1 python3-xlrd-1.1.0 python-asn1crypto-0.23.0 pyt=
hon-cheetah-2.4.4 python-cpuset-1.5.7 python-cson-git python-cython-0.26.1 =
python-django-1.11.5 python-epydoc-3.0.1 python-gevent-1.2.2 python-imaging=
-1.1.7 python-jsonpatch-1.16 python-jsonpointer-1.12 python-ndg-httpsclient=
-0.4.3 python-netaddr-0.7.19 python-nose-1.3.7 python-numeric-24.2 python-n=
umpy-1.13.1 python-pandas-0.20.3 python-pbr-3.1.1 python-pyflakes-1.2.3 pyt=
hon-pylint-1.7.2 python-pylint-1.7.4 python-pyro4-4.62 python-pyserial-3.4 =
python-pytest-3.2.2 python-scons-2.5.1 python-selectors34-1.2 python-setupt=
ools-36.2.7 python-snakefood-1.4 python-snimpy-0.8.11 python-twisted-17.9.0=
 python-urllib3-1.22 python-vobject-0.9.5 python-xlrd-1.1.0 python-yappi-0.=
98 pywbem-0.8.0 qemu-2.10.0 qt3d-5.9.2+gitAUTOINC+9d8c9ada16 qt5-creator-3.=
5.1 qt5-plugin-generic-vboxtouch-1.1.3+gitrAUTOINC+d613ad1cc6 qtbase-5.9.2+=
gitAUTOINC+73573fce29 qtcharts-5.9.2+gitAUTOINC+1f47b1a7ae qtconnectivity-5=
.9.2+gitAUTOINC+94cc2b914a qtdatavis3d-5.9.2+gitAUTOINC+3f8ae713df qtdeclar=
ative-5.9.2+gitAUTOINC+7c45b035b9 qtenginio-5.9.2+gitAUTOINC+0555cf73c8 qtg=
amepad-5.9.2+gitAUTOINC+1fc40deed6 qtgraphicaleffects-5.9.2+gitAUTOINC+b6ff=
12df54 qtimageformats-5.9.2+gitAUTOINC+144a3535db qtlocation-5.9.2+gitAUTOI=
NC+c832af7897_9ecbe3642f qtmultimedia-5.9.2+gitAUTOINC+343e281f0e qtnetwork=
auth-5.9.2+gitAUTOINC+3d93f64365 qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd qtqui=
ckcontrols2-5.9.2+gitAUTOINC+63f2f55462 qtremoteobjects-5.9.2+gitAUTOINC+6e=
0341bc87 qtscript-5.9.2+gitAUTOINC+86ee61734e qtscxml-5.9.2+gitAUTOINC+a1df=
f1a11a qtsensors-5.9.2+gitAUTOINC+1673dbed00 qtserialbus-5.9.2+gitAUTOINC+1=
d37c357c8 qtserialport-5.9.2+gitAUTOINC+93b539140c qtsmarthome-1.0 qtsvg-5.=
9.2+gitAUTOINC+0fcd016066 qtsystems-5.9.2+gitAUTOINC+f364358a81 qttools-5.9=
.2+gitAUTOINC+fdc5749b56 qtwayland-5.9.2+gitAUTOINC+7f70da6a64 qtwebchannel=
-5.9.2+gitAUTOINC+b5229df6a0 qtwebengine-5.9.2+gitAUTOINC+99f84ffd2c_21508b=
5b54 qtwebkit-5.9.2+gitAUTOINC+97c4a80a12 qtwebsockets-5.9.2+gitAUTOINC+fb7=
1c823a7 qtwebview-5.9.2+gitAUTOINC+e4016a67bb qtx11extras-5.9.2+gitAUTOINC+=
f65d50eb06 qtxmlpatterns-5.9.2+gitAUTOINC+fcfa824402 quagga-1.2.1 rabbitmq-=
c-0.7.0 radvd-2.17 readline-7.0 ristretto-0.8.2 rsync-3.1.2 rsyslog-8.29.0 =
ruby-2.4.1 samba-4.6.7 satyr-0.23 sblim-sfcb-1.4.9 sblim-sfcc-2.2.8 scsiras=
tools-1.6.6 sed-4.2.2 sg3-utils-1.42 shadow-4.2.1 slang-2.3.1a snort-2.9.7.=
5 speexdsp-1.2rc3 sqlite3-3.20.0 squid-3.5.27 sthttpd-2.27.1 strace-4.18 sy=
stemd-234 systemtap-3.1 tcl-8.6.7 telepathy-python-0.15.19 tftp-hpa-5.2 tip=
cutils-2.2.0+gitAUTOINC+7ab2211b87 tomoyo-tools-2.5.0 tslib-1.1 ttf-gentium=
-1.02 ubi-utils-klibc-1.5.2 udisks-1.0.5 ufw-0.33 upm-1.3.0-gitAUTOINC+106b=
6c7062 usbredir-0.7.1+gitAUTOINC+39aa3c69f6 usermode-1.111 vblade-22 vlc-2.=
2.2 vte-0.48.3 weston-init-1.0 xcb-util-wm-0.4.1 xcursor-transparent-theme-=
0.1.1+gitAUTOINC+23c8af5ba4 xdebug-2.5.1 xdelta3-3.0.11 xf86-input-evdev-2.=
10.5 xf86-input-mouse-1.9.2 xfce4-closebutton-plugin-0.1.0+gitrAUTOINC+02b7=
4f13ad xfce4-hotcorner-plugin-0.0.2 xfce4-mixer-4.11.0 xfce4-power-manager-=
1.6.0 xfce4-verve-plugin-1.1.0 xfwm4-themes-4.10.0 xserver-xorg-1.19.3 xstd=
cmap-1.0.3 xwd-1.0.6 xz-5.2.3 ypbind-mt-2.4 zlog-1.2.12+gitAUTOINC+13904dab=
28</div></div><div><br></div><div>Any other insight what might be causing t=
hese?</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Sep 19, 2017 at 5:18 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">*=
 we often see QA warnings like:<br>
=C2=A0 glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-en-<wbr>gb=
/usr/lib/locale/en_GB/LC_<wbr>MEASUREMENT is owned by uid 3004, which is th=
e same as the user running bitbake. This may be due to host contamination [=
host-user-contaminated]<br>
=C2=A0 glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-nn-<wbr>no=
.iso-8859-1/usr/lib/locale/<wbr>nn_NO.ISO-8859-1/LC_<wbr>MEASUREMENT is own=
ed by uid 3004, which is the same as the user running bitbake. This may be =
due to host contamination [host-user-contaminated]<br>
=C2=A0 but we don&#39;t know the root cause of it.<br>
</span>* don&#39;t trigger error from &#39;^inode mismatch&#39;<br>
* show parts of pseudo.log in console<br>
=C2=A0 many builds are executed in tmpfs, so I cannot check the pseudo.log =
later<br>
* lower from error to warn as I hate all my builds reporting failure<br>
=C2=A0 just because of this pseudo debug<br>
<div><div class=3D"h5">* the only theory we currently have is that it&#39;s=
 a bug in pseudo when<br>
=C2=A0 inode is being reused for different files, which is supported by<br>
=C2=A0 pseudo.log entries:<br>
<br>
=C2=A0 Good build:<br>
=C2=A0 pseudo$ grep -v &quot;^path mismatch&quot; pseudo.log<br>
=C2=A0 debug_logfile: fd 2<br>
=C2=A0 pid 7975 [parent 7974], doing new pid setup and server start<br>
=C2=A0 Setup complete, sending SIGUSR1 to pid 7974.<br>
=C2=A0 db cleanup for server shutdown, 17:33:58.787<br>
=C2=A0 memory-to-file backup complete, 17:33:58.787.<br>
=C2=A0 db cleanup finished, 17:33:58.787<br>
<br>
=C2=A0 Build with QA host-user-contaminated issue:<br>
=C2=A0 ERROR: foo-1.0.0-r0 do_package_qa: QA Issue: foo: file-with-wrong-UI=
D is owned<br>
=C2=A0 by uid 2001, which is the same as the user running bitbake. This may=
 be due to<br>
=C2=A0 host contamination [host-user-contaminated]<br>
<br>
=C2=A0 pseudo$ grep &quot;file-with-wrong-UID&quot; pseudo.log<br>
=C2=A0 inode mismatch: &#39;file-with-wrong-UID&#39; ino 13242270 in db, 13=
242271 in request.<br>
=C2=A0 creat ignored for existing file &#39;file-with-wrong-UID&#39;.<br>
=C2=A0 inode mismatch: &#39;file-with-wrong-UID&#39; ino 13242270 in db, 13=
242271 in request.<br>
=C2=A0 inode mismatch: &#39;file-with-wrong-UID&#39; ino 13242270 in db, 13=
242271 in request.<br>
=C2=A0 inode mismatch: &#39;file-with-wrong-UID&#39; ino 13242270 in db, 13=
242271 in request.<br>
=C2=A0 inode mismatch: &#39;file-with-wrong-UID&#39; ino 13242270 in db, 13=
242271 in request.<br>
=C2=A0 inode mismatch: &#39;file-with-wrong-UID&#39; ino 13242270 in db, 13=
242271 in request.<br>
=C2=A0 inode mismatch: &#39;file-with-wrong-UID&#39; ino 13242270 in db, 13=
242271 in request.<br>
=C2=A0 path mismatch [1 link]: ino 13242270 db &#39;file-with-wrong-UID&#39=
; req &#39;some-other-unrelated-file&#39;.<br>
=C2=A0 creat for &#39;some-other-unrelated-file&#39; replaces existing 1324=
2270 [&#39;file-with-wrong-UID&#39;].<br>
=C2=A0 db cleanup for server shutdown, 02:16:23.685<br>
=C2=A0 memory-to-file backup complete, 02:16:23.685.<br>
=C2=A0 db cleanup finished, 02:16:23.685<br>
<br>
=C2=A0 And some-other-unrelated-file is really some different file, not jus=
t hardlink<br>
=C2=A0 to the same file from some different directory (like between WORKDIR=
 and sysroot<br>
=C2=A0 other &quot;path mismatch&quot; entries show).<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;<br>
---<br>
</div></div>=C2=A0meta/classes/insane.bbclass | 43 ++++++++++++++++++++++++=
++++++<wbr>+++++++++++++<br>
=C2=A01 file changed, 43 insertions(+)<br>
<br>
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass<br>
index 0a3b528ddb..76cd92709b 100644<br>
--- a/meta/classes/insane.bbclass<br>
+++ b/meta/classes/insane.bbclass<br>
@@ -1238,6 +1238,44 @@ python do_qa_unpack() {<br>
<div><div class=3D"h5">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&#39;%s: t=
he directory %s (%s) pointed to by the S variable doesn\&#39;t exist - plea=
se set S within the recipe to point to where the source has been unpacked t=
o&#39; % (d.getVar(&#39;PN&#39;), d.getVar(&#39;S&#39;, False), s_dir))<br>
=C2=A0}<br>
<br>
+python do_qa_pseudo() {<br>
+=C2=A0 =C2=A0 ##############################<wbr>#########################=
#####<wbr>###############<br>
+=C2=A0 =C2=A0 # Check pseudo.log for unexpected errors<br>
+=C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 # Typical pseudo.log contains many &quot;^path mismatch&quot=
; lines for all the hardlinked files<br>
+=C2=A0 =C2=A0 # e.g. in some smaller component I see 231/237 lines to be &=
quot;^path mismatch&quot; other 6<br>
+=C2=A0 =C2=A0 # lines are setup and cleanup lines like this:<br>
+=C2=A0 =C2=A0 # debug_logfile: fd 2<br>
+=C2=A0 =C2=A0 # pid 7975 [parent 7974], doing new pid setup and server sta=
rt<br>
+=C2=A0 =C2=A0 # Setup complete, sending SIGUSR1 to pid 7974.<br>
+=C2=A0 =C2=A0 # db cleanup for server shutdown, 17:33:58.787<br>
+=C2=A0 =C2=A0 # memory-to-file backup complete, 17:33:58.787.<br>
+=C2=A0 =C2=A0 # db cleanup finished, 17:33:58.787<br>
+=C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 # but if there is one of:<br>
+=C2=A0 =C2=A0 # &quot;^inode mismatch&quot;<br>
+=C2=A0 =C2=A0 # &quot;^creat ignored for existing file&quot;<br>
+=C2=A0 =C2=A0 # &quot;^creat for.*replaces existing&quot;<br>
+=C2=A0 =C2=A0 # then there might be some bigger issue which sometimes resu=
lts in host-user-contaminated QA warnings<br>
+=C2=A0 =C2=A0 ##############################<wbr>#########################=
#####<wbr>###############<br>
+<br>
+=C2=A0 =C2=A0 import subprocess<br>
+<br>
+=C2=A0 =C2=A0 pseudodir =3D d.getVar(&#39;PSEUDO_<wbr>LOCALSTATEDIR&#39;)<=
br>
+=C2=A0 =C2=A0 bb.note(&quot;Checking pseudo.log for common errors&quot;)<b=
r>
+=C2=A0 =C2=A0 pseudolog =3D os.path.join(pseudodir, &quot;pseudo.log&quot;=
)<br>
+=C2=A0 =C2=A0 statement =3D &quot;grep&quot; \<br>
</div></div><span class=3D"">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; -e &#39;^c=
reat ignored for existing file&#39;&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; -e &#39;^creat for.*replaces existing&#=
39;&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; %s&quot; % pseudolog<br>
+=C2=A0 =C2=A0 if subprocess.call(&quot;%s -q&quot; % statement, shell=3DTr=
ue) =3D=3D 0:<br>
</span>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 statement2 =3D &quot;grep -v &#39;^path=
 mismatch&#39; %s&quot; % pseudolog<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 statement2_count =3D &quot;grep -v &#39;^path =
mismatch&#39; -c %s&quot; % pseudolog<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D subprocess.check_output(<wbr>statem=
ent2, shell=3DTrue).decode(&quot;utf-8&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 output_count =3D subprocess.check_output(<wbr>=
statement2_count, shell=3DTrue).decode(&quot;utf-8&quot;).<wbr>replace(&#39=
;\n&#39;, &#39;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;This %s indicates %s errors, see=
 %s or %s [qa_pseudo]: %s&quot; % (pseudolog, output_count, statement, stat=
ement2, output))<br>
<span class=3D"">+}<br>
+<br>
=C2=A0# The Staging Func, to check all staging<br>
=C2=A0#addtask qa_staging after do_populate_sysroot before do_build<br>
=C2=A0do_populate_sysroot[postfuncs] +=3D &quot;do_qa_staging &quot;<br>
</span>@@ -1250,6 +1288,11 @@ do_configure[postfuncs] +=3D &quot;do_qa_conf=
igure &quot;<br>
<div class=3D"HOEnZb"><div class=3D"h5">=C2=A0# Check does S exist.<br>
=C2=A0do_unpack[postfuncs] +=3D &quot;do_qa_unpack&quot;<br>
<br>
+# Check pseudo.log for unexpected errors<br>
+# For some reason do_build postfunction isn&#39;t executed<br>
+# do_build[postfuncs] +=3D &quot;do_qa_pseudo&quot;<br>
+addtask do_qa_pseudo after do_populate_sysroot do_packagedata do_package b=
efore do_build<br>
+<br>
=C2=A0python () {<br>
=C2=A0 =C2=A0 =C2=A0import re<br>
<br>
--<br>
2.14.1<br>
<br>
</div></div></blockquote></div><br></div>

--001a114672fcaf6422055bab481e--
