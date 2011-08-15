Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qt168-00084w-Ht
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 19:37:12 +0200
Received: by wwe32 with SMTP id 32so4189039wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 10:32:35 -0700 (PDT)
Received: by 10.216.190.40 with SMTP id d40mr3664860wen.25.1313429554598;
	Mon, 15 Aug 2011 10:32:34 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id l7sm3784461wed.41.2011.08.15.10.32.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 15 Aug 2011 10:32:33 -0700 (PDT)
References: <1313136251-32214-1-git-send-email-noor_ahsan@mentor.com>
	<4E49511C.6050606@linux.intel.com>
In-Reply-To: <4E49511C.6050606@linux.intel.com>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <0DB1E806-F096-4FEF-AA91-D48550DE8C01@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 15 Aug 2011 19:32:28 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] bluez4: Added new recipe 4.96 and removed 4.82 version
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
X-List-Received-Date: Mon, 15 Aug 2011 17:37:12 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 15 aug. 2011 om 19:02 heeft Saul Wold <sgw@linux.intel.com> het volgende g=
eschreven:

> On 08/12/2011 01:04 AM, Noor, Ahsan wrote:
>> From: Noor Ahsan<noor_ahsan@mentor.com>
>>=20
>> * Added new recipe 4.96 and removed 4.82 version and its files.
>>=20
>>=20
>> Signed-off-by: Noor Ahsan<noor_ahsan@mentor.com>
>> ---
>>  .../bluez/bluez4-4.82/bluetooth.conf               |   16 ----
>>  .../fix-dfutool-usb-declaration-mismatch.patch     |   20 -----
>>  .../bluez/bluez4-4.82/hid2hci_usb_init.patch       |   35 ---------
>>  .../bluez/bluez4-4.82/sbc-thumb.patch              |   14 ----
>>  .../bluez/bluez4-4.96/bluetooth.conf               |   16 ++++
>>  meta/recipes-connectivity/bluez/bluez4_4.82.bb     |   75 --------------=
------
>>  meta/recipes-connectivity/bluez/bluez4_4.96.bb     |   73 ++++++++++++++=
+++++
>>  7 files changed, 89 insertions(+), 160 deletions(-)
>>=20
>> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.82/bluetooth.conf b=
/meta/recipes-connectivity/bluez/bluez4-4.82/bluetooth.conf
>> deleted file mode 100644
>> index ca5e9e4..0000000
>> --- a/meta/recipes-connectivity/bluez/bluez4-4.82/bluetooth.conf
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> -<!-- This configuration file specifies the required security policies
>> -     for Bluetooth core daemon to work. -->
>> -
>> -<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1=
.0//EN"
>> - "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
>> -<busconfig>
>> -
>> -<!-- ../system.conf have denied everything, so we just punch some holes -=
->
>> -
>> -<policy context=3D"default">
>> -<allow own=3D"org.bluez"/>
>> -<allow send_destination=3D"org.bluez"/>
>> -<allow send_interface=3D"org.bluez.Agent"/>
>> -</policy>
>> -
>> -</busconfig>
>> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.82/fix-dfutool-usb-=
declaration-mismatch.patch b/meta/recipes-connectivity/bluez/bluez4-4.82/fix=
-dfutool-usb-declaration-mismatch.patch
>> deleted file mode 100644
>> index 27dead0..0000000
>> --- a/meta/recipes-connectivity/bluez/bluez4-4.82/fix-dfutool-usb-declara=
tion-mismatch.patch
>> +++ /dev/null
>> @@ -1,20 +0,0 @@
>> -# bluez4: add compile patch fixing some usb declaration mismatch
>> -# Author: Michael 'Mickey' Lauer<mickey@vanille-media.de>
>> -# Date:   Thu Jan 29 16:52:21 2009 +0000
>> -#
>> -# Acquired from OpenEmbedded
>> -Upstream-Status: Pending
>> -
>> -Index: bluez-4.27/tools/dfutool.c
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- bluez-4.27.orig/tools/dfutool.c
>> -+++ bluez-4.27/tools/dfutool.c
>> -@@ -59,7 +59,7 @@
>> - #endif
>> -
>> - #ifdef NEED_USB_GET_BUSSES
>> --static inline struct usb_bus *usb_get_busses(void)
>> -+inline struct usb_bus *usb_get_busses(void)
>> - {
>> -    return usb_busses;
>> - }
>> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.82/hid2hci_usb_init=
.patch b/meta/recipes-connectivity/bluez/bluez4-4.82/hid2hci_usb_init.patch
>> deleted file mode 100644
>> index e8a58e5..0000000
>> --- a/meta/recipes-connectivity/bluez/bluez4-4.82/hid2hci_usb_init.patch
>> +++ /dev/null
>> @@ -1,35 +0,0 @@
>> -# Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> -#
>> -# Use the new usb1 API for usb_init() and check for fails from
>> -# usb_init (). Currently we see a crash on a system which does
>> -# not have USB because usb_init() fails and it cleans up all initialized=

>> -# data (e.g. ctx) which is used in subsequent calls to libusb
>> -# We return immediately if usb_init() fails for some reason.
>> -
>> -Upstream-Status: Inappropriate [not used]
>> -
>> -Index: bluez-4.24/tools/hid2hci.c
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- bluez-4.24.orig/tools/hid2hci.c    2008-10-25 23:40:34.000000000 -07=
00
>> -+++ bluez-4.24/tools/hid2hci.c    2008-12-29 22:06:04.000000000 -0800
>> -@@ -337,7 +337,7 @@
>> - int main(int argc, char *argv[])
>> - {
>> -    struct device_info dev[16];
>> --    int i, opt, num, quiet =3D 0, mode =3D HCI;
>> -+    int i, ret, opt, num, quiet =3D 0, mode =3D HCI;
>> -
>> -    while ((opt =3D getopt_long(argc, argv, "+01qh", main_options, NULL)=
) !=3D -1) {
>> -        switch (opt) {
>> -@@ -361,8 +361,9 @@
>> -    argc -=3D optind;
>> -    argv +=3D optind;
>> -    optind =3D 0;
>> --
>> --    usb_init();
>> -+    ret =3D libusb_init();
>> -+    if (ret<  0)
>> -+        return ret;
>> -
>> -    num =3D find_devices(mode, dev, sizeof(dev) / sizeof(dev[0]));
>> -    if (num<=3D 0) {
>> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.82/sbc-thumb.patch b=
/meta/recipes-connectivity/bluez/bluez4-4.82/sbc-thumb.patch
>> deleted file mode 100644
>> index 881cb9c..0000000
>> --- a/meta/recipes-connectivity/bluez/bluez4-4.82/sbc-thumb.patch
>> +++ /dev/null
>> @@ -1,14 +0,0 @@
>> -# Acquired from OpenEmbedded
>> -Upstream-Status: Inappropriate [embedded specific]
>> -
>> ---- bluez/sbc/sbc_math.h~    2008-03-05 20:18:03.000000000 +0000
>> -+++ bluez/sbc/sbc_math.h    2008-10-27 13:39:27.000000000 +0000
>> -@@ -59,7 +59,7 @@
>> -
>> - #define SBC_FIXED_0(val) { val =3D 0; }
>> - #define MUL(a, b)        ((a) * (b))
>> --#ifdef __arm__
>> -+#if defined(__arm__)&&  !defined(__thumb__)
>> - #define MULA(a, b, res) ({                \
>> -        int tmp =3D res;            \
>> -        __asm__(                \
>> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.96/bluetooth.conf b=
/meta/recipes-connectivity/bluez/bluez4-4.96/bluetooth.conf
>> new file mode 100644
>> index 0000000..ca5e9e4
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bluez/bluez4-4.96/bluetooth.conf
>> @@ -0,0 +1,16 @@
>> +<!-- This configuration file specifies the required security policies
>> +     for Bluetooth core daemon to work. -->
>> +
>> +<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1=
.0//EN"
>> + "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
>> +<busconfig>
>> +
>> +<!-- ../system.conf have denied everything, so we just punch some holes -=
->
>> +
>> +<policy context=3D"default">
>> +<allow own=3D"org.bluez"/>
>> +<allow send_destination=3D"org.bluez"/>
>> +<allow send_interface=3D"org.bluez.Agent"/>
>> +</policy>
>> +
>> +</busconfig>
>> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.82.bb b/meta/recipe=
s-connectivity/bluez/bluez4_4.82.bb
>> deleted file mode 100644
>> index 9895006..0000000
>> --- a/meta/recipes-connectivity/bluez/bluez4_4.82.bb
>> +++ /dev/null
>> @@ -1,75 +0,0 @@
>> -SUMMARY =3D "Linux Bluetooth Stack Userland V4"
>> -DESCRIPTION =3D "Linux Bluetooth stack V4 userland components.  These in=
clude a system configurations, daemons, tools and system libraries."
>> -HOMEPAGE =3D "http://www.bluez.org"
>> -SECTION =3D "libs"
>> -LICENSE =3D "GPLv2+&  LGPLv2.1+"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4c=
a7e \
>> -                    file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed90f=
b0e09 \
>> -                    file://src/main.c;beginline=3D1;endline=3D24;md5=3D9=
bc54b93cd7e17bf03f52513f39f926e \
>> -                    file://sbc/sbc.c;beginline=3D1;endline=3D25;md5=3D1a=
40781ed30d50d8639323a184aeb191"
>> -DEPENDS =3D "gst-plugins-base alsa-lib libusb dbus-glib libnl"
>> -RDEPENDS_${PN}-dev =3D "bluez-hcidump"
>> -
>> -# For angstrom we want this to replace at least bluez-libs
>> -PROVIDES_append_angstrom =3D " bluez-utils bluez-libs"
>> -
>> -ASNEEDED =3D ""
>> -
>> -PR =3D "r0"
>> -
>> -SRC_URI =3D "\
>> -  ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
>> -  file://fix-dfutool-usb-declaration-mismatch.patch;patch=3D1 \
>> -  file://sbc-thumb.patch;patch=3D1 \
>> -  file://bluetooth.conf \
>> -"
>> -
>> -SRC_URI[md5sum] =3D "b9e5de607e5e43c868c35c68fe6f189f"
>> -SRC_URI[sha256sum] =3D "75dc506f5346e1eb803f44294ae02406e806e309d9c9bda1=
de7ed235ff794b6d"
>> -S =3D "${WORKDIR}/bluez-${PV}"
>> -
>> -inherit autotools
>> -
>> -EXTRA_OECONF =3D "\
>> -  --enable-gstreamer \
>> -  --enable-alsa \
>> -  --enable-usb \
>> -  --enable-netlink \
>> -  --enable-tools \
>> -  --enable-bccmd \
>> -  --enable-hid2hci \
>> -  --enable-dfutool \
>> -  --enable-hidd \
>> -  --enable-pandd \
>> -  --enable-dund \
>> -  --disable-cups \
>> -  --enable-test \
>> -  --enable-manpages \
>> -  --enable-configfiles \
>> -  --enable-initscripts \
>> -  --disable-pcmciarules \
>> -"
>> -
>> -do_install_append() {
>> -    install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
>> -    install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetoo=
th/
>> -    install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
>> -    # at_console doesn't really work with the current state of OE, so pu=
nch some more holes so people can actually use BT
>> -    install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/=
system.d/
>> -}
>> -
>> -PACKAGES =3D+ "gst-plugin-bluez libasound-module-bluez"
>> -
>> -FILES_gst-plugin-bluez =3D "${libdir}/gstreamer-0.10/lib*.so"
>> -FILES_libasound-module-bluez =3D "${libdir}/alsa-lib/lib*.so"
>> -FILES_${PN} +=3D "${libdir}/bluetooth/plugins/*.so"
>> -FILES_${PN}-dev +=3D "\
>> -  ${libdir}/bluetooth/plugins/*.la \
>> -  ${libdir}/alsa-lib/*.la \
>> -  ${libdir}/gstreamer-0.10/*.la \
>> -"
>> -
>> -FILES_${PN}-dbg +=3D "\
>> -  ${libdir}/bluetooth/plugins/.debug \
>> -  ${libdir}/*/.debug \
>> -"
>> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.96.bb b/meta/recipe=
s-connectivity/bluez/bluez4_4.96.bb
>> new file mode 100644
>> index 0000000..ebd2849
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
>> @@ -0,0 +1,73 @@
>> +SUMMARY =3D "Linux Bluetooth Stack Userland V4"
>> +DESCRIPTION =3D "Linux Bluetooth stack V4 userland components.  These in=
clude a system configurations, daemons, tools and system libraries."
>> +HOMEPAGE =3D "http://www.bluez.org"
>> +SECTION =3D "libs"
>> +LICENSE =3D "GPLv2+&  LGPLv2.1+"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4c=
a7e \
>> +                    file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed90f=
b0e09 \
>> +                    file://src/main.c;beginline=3D1;endline=3D24;md5=3D9=
bc54b93cd7e17bf03f52513f39f926e \
>> +                    file://sbc/sbc.c;beginline=3D1;endline=3D25;md5=3D1a=
40781ed30d50d8639323a184aeb191"
>> +DEPENDS =3D "gst-plugins-base alsa-lib libusb dbus-glib libnl"
>> +RDEPENDS_${PN}-dev =3D "bluez-hcidump"
>> +
>> +# For angstrom we want this to replace at least bluez-libs
>> +PROVIDES_append_angstrom =3D " bluez-utils bluez-libs"
>> +
>> +ASNEEDED =3D ""
>> +
>> +PR =3D "r0"
>> +
>> +SRC_URI =3D "\
>> +  ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
>> +  file://bluetooth.conf \
>> +"
>> +
>> +SRC_URI[md5sum] =3D "296111afac49e3f9035085ac14daf518"
>> +SRC_URI[sha256sum] =3D "c06fd50fd77909cad55e3181a42c6bce7cfcf7abb8cd8787=
1c13d0d70f87fa99"
>> +S =3D "${WORKDIR}/bluez-${PV}"
>> +
>> +inherit autotools
>> +
>> +EXTRA_OECONF =3D "\
>> +  --enable-gstreamer \
>> +  --enable-alsa \
>> +  --enable-usb \
>> +  --enable-netlink \
>> +  --enable-tools \
>> +  --enable-bccmd \
>> +  --enable-hid2hci \
>> +  --enable-dfutool \
>> +  --enable-hidd \
>> +  --enable-pandd \
>> +  --enable-dund \
>> +  --disable-cups \
>> +  --enable-test \
>> +  --enable-manpages \
>> +  --enable-configfiles \
>> +  --enable-initscripts \
>> +  --disable-pcmciarules \
>> +"
>> +
>> +do_install_append() {
>> +    install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
>> +    install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetoo=
th/
>> +    install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
>> +    # at_console doesn't really work with the current state of OE, so pu=
nch some more holes so people can actually use BT
>> +    install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/=
system.d/
>> +}
>> +
>> +PACKAGES =3D+ "gst-plugin-bluez libasound-module-bluez"
>> +
>> +FILES_gst-plugin-bluez =3D "${libdir}/gstreamer-0.10/lib*.so"
>> +FILES_libasound-module-bluez =3D "${libdir}/alsa-lib/lib*.so"
>> +FILES_${PN} +=3D "${libdir}/bluetooth/plugins/*.so"
>> +FILES_${PN}-dev +=3D "\
>> +  ${libdir}/bluetooth/plugins/*.la \
>> +  ${libdir}/alsa-lib/*.la \
>> +  ${libdir}/gstreamer-0.10/*.la \
>> +"
>> +
>> +FILES_${PN}-dbg +=3D "\
>> +  ${libdir}/bluetooth/plugins/.debug \
>> +  ${libdir}/*/.debug \
>> +"
>=20
> Merged into OE-Core

why was this known broken patch merged?!?!?


>=20
> Thanks
>    Sau!
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


