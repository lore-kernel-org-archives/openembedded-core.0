Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 10F9F6B276
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 11:14:42 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q56so512511wes.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 04:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jq+dodQZMmrltZJ/KK8BmNF7d/iv5RPotkYmDGUFyGE=;
	b=gpu/e7IzstHiZU29b0kmT8cYz8FSAcJlSLdvI9Pd86TycSkjajdGh7x1mqhfxuT5Mh
	gk3lMWZthlYijvj6O3lK7cvBvrFO+r5qyOyP/b+USIXR5rKUx+VyJsBdYWS1YYAUYsPr
	xepl8bL8v+x6/ehzCpgkpvHqFz7eU881+5pusYuiejEDwvwpZYzFZ8RqHwPGmqzrjdtJ
	L73vro4do4XepnGWPnLS369BVBHbKMyZ1UfUUID3OTWvy7L1WoHxocuuqPV6qiDQdrP3
	lDO4KEtjB2YtHvYymUWY+q8eYWrhPQawa9ZtTMpTdbWB4680o8EveJPoA9KHLES1iBk0
	YlmA==
MIME-Version: 1.0
X-Received: by 10.194.120.7 with SMTP id ky7mr30049306wjb.89.1374750882213;
	Thu, 25 Jul 2013 04:14:42 -0700 (PDT)
Received: by 10.194.16.167 with HTTP; Thu, 25 Jul 2013 04:14:42 -0700 (PDT)
In-Reply-To: <51EFEFBE.1020808@linux.intel.com>
References: <20130718201834.CB5765038D@opal> <20130724113311.GE4136@jama>
	<969F26A8BAB325438E7EB80D3C3134FB16C0DB50@IRSMSX105.ger.corp.intel.com>
	<51EFEFBE.1020808@linux.intel.com>
Date: Thu, 25 Jul 2013 13:14:42 +0200
Message-ID: <CA+chaQdbGW+K-j0BKo0YZkDt5OK019Fz89Nv1HXn74FiqJdGdQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Cristian Iorga : bluez5: new package for v5.7
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
X-List-Received-Date: Thu, 25 Jul 2013 11:14:44 -0000
Content-Type: multipart/alternative; boundary=089e0112c78cfd35f004e254216e

--089e0112c78cfd35f004e254216e
Content-Type: text/plain; charset=UTF-8

There are also unpackaged files when systemd is enabled:

bluez5-5.7: bluez5: Files/directories were installed but not shipped
  /usr/lib/systemd
  /usr/lib/systemd/user
  /usr/lib/systemd/user/obex.service


On Wed, Jul 24, 2013 at 5:16 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 07/24/2013 05:47 AM, Iorga, Cristian wrote:
>
>> I will, this week I guess.
>>
>>  I mentioned this issue last week and I have a fix for it in my MUT
> branch already, just not published yet.  I will likely have it later today,
> juggling too many things.
>
>
> Sau!
>
>
>  -----Original Message-----
>> From: Martin Jansa [mailto:martin.jansa@gmail.com**]
>> Sent: Wednesday, July 24, 2013 2:33 PM
>> To: Iorga, Cristian; openembedded-core@lists.**openembedded.org<openembedded-core@lists.openembedded.org>
>> Cc: openembedded-commits@lists.**openembedded.org<openembedded-commits@lists.openembedded.org>
>> Subject: Re: [oe-commits] Cristian Iorga : bluez5: new package for v5.7
>>
>> On Thu, Jul 18, 2013 at 08:18:34PM +0000, git@git.openembedded.org wrote:
>>
>>> Module: openembedded-core.git
>>> Branch: master
>>> Commit: 5d55498be84a6a8725794f75f4d123**36048cdc34
>>> URL:    http://git.openembedded.org/?**p=openembedded-core.git&a=**
>>> commit;h=**5d55498be84a6a8725794f75f4d123**36048cdc34<http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=5d55498be84a6a8725794f75f4d12336048cdc34>
>>>
>>> Author: Cristian Iorga <cristian.iorga@intel.com>
>>> Date:   Tue Jul 16 18:26:01 2013 +0300
>>>
>>> bluez5: new package for v5.7
>>>
>>> - bluez5 does not replace bluez4
>>> - bluez5 is integrated with systemd
>>> - RCONFLICTS bluez4
>>> - add readline dependency
>>>
>>
>> They are providing the same package for runtime:
>> NOTE: multiple providers are available for runtime libasound-module-bluez
>> (bluez4, bluez5)
>> NOTE: consider defining a PREFERRED_PROVIDER entry to match
>> libasound-module-bluez
>>
>> Please fix that.
>>
>>
>>> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>>
>>> ---
>>>
>>>   .../bluez5/bluez5-5.7/**bluetooth.conf               |   16 +++++
>>>   meta/recipes-connectivity/**bluez5/bluez5.inc        |   68
>>> ++++++++++++++++++++
>>>   meta/recipes-connectivity/**bluez5/bluez5_5.7.bb     |    5 ++
>>>   3 files changed, 89 insertions(+), 0 deletions(-)
>>>
>>> diff --git
>>> a/meta/recipes-connectivity/**bluez5/bluez5-5.7/bluetooth.**conf
>>> b/meta/recipes-connectivity/**bluez5/bluez5-5.7/bluetooth.**conf
>>> new file mode 100644
>>> index 0000000..ca5e9e4
>>> --- /dev/null
>>> +++ b/meta/recipes-connectivity/**bluez5/bluez5-5.7/bluetooth.**conf
>>> @@ -0,0 +1,16 @@
>>> +<!-- This configuration file specifies the required security policies
>>> +     for Bluetooth core daemon to work. -->
>>> +
>>> +<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration
>>> 1.0//EN"
>>> + "http://www.freedesktop.org/**standards/dbus/1.0/busconfig.**dtd<http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd>
>>> ">
>>> +<busconfig>
>>> +
>>> +  <!-- ../system.conf have denied everything, so we just punch some
>>> + holes -->
>>> +
>>> +  <policy context="default">
>>> +    <allow own="org.bluez"/>
>>> +    <allow send_destination="org.bluez"/>
>>> +    <allow send_interface="org.bluez.**Agent"/>
>>> +  </policy>
>>> +
>>> +</busconfig>
>>> diff --git a/meta/recipes-connectivity/**bluez5/bluez5.inc
>>> b/meta/recipes-connectivity/**bluez5/bluez5.inc
>>> new file mode 100644
>>> index 0000000..fc78900
>>> --- /dev/null
>>> +++ b/meta/recipes-connectivity/**bluez5/bluez5.inc
>>> @@ -0,0 +1,68 @@
>>> +SUMMARY = "Linux Bluetooth Stack Userland V5"
>>> +DESCRIPTION = "Linux Bluetooth stack V5 userland components.  These
>>> include a system configurations, daemons, tools and system libraries."
>>> +HOMEPAGE = "http://www.bluez.org"
>>> +SECTION = "libs"
>>> +LICENSE = "GPLv2+ & LGPLv2.1+"
>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=**12f884d2ae1ff87c09e5b7ccc2c4ca
>>> **7e \
>>> +                    file://COPYING.LIB;md5=**
>>> fb504b67c50331fc78734fed90fb0e**09 \
>>> +                    file://src/main.c;beginline=1;**endline=24;md5=**
>>> 9bc54b93cd7e17bf03f52513f39f92**6e"
>>> +DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck libical readline"
>>> +
>>> +RCONFLICTS_${PN} = "bluez4"
>>> +
>>> +PACKAGECONFIG ??= "${@base_contains('DISTRO_**FEATURES', 'alsa',
>>> 'alsa', '', d)}"
>>> +PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,**alsa-lib"
>>> +
>>> +SRC_URI = "\
>>> +    ${KERNELORG_MIRROR}/linux/**bluetooth/bluez-${PV}.tar.gz \
>>> +    file://bluetooth.conf \
>>> +"
>>> +S = "${WORKDIR}/bluez-${PV}"
>>> +
>>> +inherit autotools pkgconfig systemd
>>> +
>>> +EXTRA_OECONF = "\
>>> +  --disable-gstreamer \
>>> +  --enable-usb \
>>> +  --enable-tools \
>>> +  --enable-bccmd \
>>> +  --enable-hid2hci \
>>> +  --enable-dfutool \
>>> +  --disable-hidd \
>>> +  --disable-pand \
>>> +  --disable-dund \
>>> +  --disable-cups \
>>> +  --enable-test \
>>> +  --enable-datafiles \
>>> +  ${@base_contains('DISTRO_**FEATURES', 'systemd',
>>> +'--with-systemdunitdir=${**systemd_unitdir}/system/',
>>> '--disable-systemd', d)} \ "
>>> +
>>> +do_install_append() {
>>> +       install -d ${D}${sysconfdir}/bluetooth/
>>> +       install -m 0644 ${S}/profiles/audio/audio.conf
>>> ${D}/${sysconfdir}/bluetooth/
>>> +       install -m 0644 ${S}/profiles/network/network.**conf
>>> ${D}/${sysconfdir}/bluetooth/
>>> +       install -m 0644 ${S}/profiles/input/input.conf
>>> ${D}/${sysconfdir}/bluetooth/
>>> +       # at_console doesn't really work with the current state of OE,
>>> so punch some more holes so people can actually use BT
>>> +       install -m 0644 ${WORKDIR}/bluetooth.conf
>>> +${D}/${sysconfdir}/dbus-1/**system.d/
>>> +}
>>> +
>>> +ALLOW_EMPTY_libasound-module-**bluez = "1"
>>> +PACKAGES =+ "libasound-module-bluez ${PN}-test"
>>> +
>>> +FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so
>>> ${datadir}/alsa"
>>> +FILES_${PN} += "${libdir}/bluetooth/plugins
>>> ${libdir}/bluetooth/plugins/*.**so ${base_libdir}/udev/
>>> ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
>>> +FILES_${PN}-dev += "\
>>> +  ${libdir}/bluetooth/plugins/*.**la \
>>> +  ${libdir}/alsa-lib/*.la \
>>> +"
>>> +
>>> +FILES_${PN}-test = "${libdir}/bluez/test/*"
>>> +
>>> +FILES_${PN}-dbg += "\
>>> +  ${libdir}/${BPN}/bluetooth/.**debug \
>>> +  ${libdir}/bluetooth/plugins/.**debug \
>>> +  ${libdir}/*/.debug \
>>> +  */udev/.debug \
>>> +  "
>>> +
>>> +SYSTEMD_SERVICE_${PN} = "bluetooth.service"
>>> diff --git a/meta/recipes-connectivity/**bluez5/bluez5_5.7.bb
>>> b/meta/recipes-connectivity/**bluez5/bluez5_5.7.bb
>>> new file mode 100644
>>> index 0000000..6e2850d
>>> --- /dev/null
>>> +++ b/meta/recipes-connectivity/**bluez5/bluez5_5.7.bb
>>> @@ -0,0 +1,5 @@
>>> +require bluez5.inc
>>> +
>>> +SRC_URI[md5sum] = "**ce0ef43938e8bfc230f3f06d6ad02d**7e"
>>> +SRC_URI[sha256sum] = "**902299204b7139c913765603c7054a**
>>> 604570aea9e9fddb30454bd1b5e599**7860"
>>> +
>>>
>>> ______________________________**_________________
>>> Openembedded-commits mailing list
>>> Openembedded-commits@lists.**openembedded.org<Openembedded-commits@lists.openembedded.org>
>>> http://lists.openembedded.org/**mailman/listinfo/openembedded-**commits<http://lists.openembedded.org/mailman/listinfo/openembedded-commits>
>>>
>>
>>

--089e0112c78cfd35f004e254216e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>There are also unpackaged files when systemd is enabl=
ed:</div><div><br></div><div>bluez5-5.7: bluez5: Files/directories were ins=
talled but not shipped</div><div>=C2=A0 /usr/lib/systemd</div><div>=C2=A0 /=
usr/lib/systemd/user</div>
<div>=C2=A0 /usr/lib/systemd/user/obex.service</div></div><div class=3D"gma=
il_extra"><br><br><div class=3D"gmail_quote">On Wed, Jul 24, 2013 at 5:16 P=
M, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" t=
arget=3D"_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 07/24/2013 05:47 AM, Io=
rga, Cristian wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I will, this week I guess.<br>
<br>
</blockquote></div>
I mentioned this issue last week and I have a fix for it in my MUT branch a=
lready, just not published yet. =C2=A0I will likely have it later today, ju=
ggling too many things.<br>
<br>
<br>
Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
-----Original Message-----<br>
From: Martin Jansa [mailto:<a href=3D"mailto:martin.jansa@gmail.com" target=
=3D"_blank">martin.jansa@gmail.com</a><u></u>]<br>
Sent: Wednesday, July 24, 2013 2:33 PM<br>
To: Iorga, Cristian; <a href=3D"mailto:openembedded-core@lists.openembedded=
.org" target=3D"_blank">openembedded-core@lists.<u></u>openembedded.org</a>=
<br>
Cc: <a href=3D"mailto:openembedded-commits@lists.openembedded.org" target=
=3D"_blank">openembedded-commits@lists.<u></u>openembedded.org</a><br>
Subject: Re: [oe-commits] Cristian Iorga : bluez5: new package for v5.7<br>
<br>
On Thu, Jul 18, 2013 at 08:18:34PM +0000, <a href=3D"mailto:git@git.openemb=
edded.org" target=3D"_blank">git@git.openembedded.org</a> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Module: openembedded-core.git<br>
Branch: master<br>
Commit: 5d55498be84a6a8725794f75f4d123<u></u>36048cdc34<br>
URL: =C2=A0 =C2=A0<a href=3D"http://git.openembedded.org/?p=3Dopenembedded-=
core.git&amp;a=3Dcommit;h=3D5d55498be84a6a8725794f75f4d12336048cdc34" targe=
t=3D"_blank">http://git.openembedded.org/?<u></u>p=3Dopenembedded-core.git&=
amp;a=3D<u></u>commit;h=3D<u></u>5d55498be84a6a8725794f75f4d123<u></u>36048=
cdc34</a><br>

<br>
Author: Cristian Iorga &lt;<a href=3D"mailto:cristian.iorga@intel.com" targ=
et=3D"_blank">cristian.iorga@intel.com</a>&gt;<br>
Date: =C2=A0 Tue Jul 16 18:26:01 2013 +0300<br>
<br>
bluez5: new package for v5.7<br>
<br>
- bluez5 does not replace bluez4<br>
- bluez5 is integrated with systemd<br>
- RCONFLICTS bluez4<br>
- add readline dependency<br>
</blockquote>
<br>
They are providing the same package for runtime:<br>
NOTE: multiple providers are available for runtime libasound-module-bluez (=
bluez4, bluez5)<br>
NOTE: consider defining a PREFERRED_PROVIDER entry to match libasound-modul=
e-bluez<br>
<br>
Please fix that.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Cristian Iorga &lt;<a href=3D"mailto:cristian.iorga@intel.co=
m" target=3D"_blank">cristian.iorga@intel.com</a>&gt;<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com" target=
=3D"_blank">sgw@linux.intel.com</a>&gt;<br>
<br>
---<br>
<br>
=C2=A0 .../bluez5/bluez5-5.7/<u></u>bluetooth.conf =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 16 +++++<br>
=C2=A0 meta/recipes-connectivity/<u></u>bluez5/bluez5.inc =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 68 ++++++++++++++++++++<br>
=C2=A0 meta/recipes-connectivity/<u></u>bluez5/<a href=3D"http://bluez5_5.7=
.bb" target=3D"_blank">bluez5_5.7.bb</a> =C2=A0 =C2=A0 | =C2=A0 =C2=A05 ++<=
br>
=C2=A0 3 files changed, 89 insertions(+), 0 deletions(-)<br>
<br>
diff --git<br>
a/meta/recipes-connectivity/<u></u>bluez5/bluez5-5.7/bluetooth.<u></u>conf<=
br>
b/meta/recipes-connectivity/<u></u>bluez5/bluez5-5.7/bluetooth.<u></u>conf<=
br>
new file mode 100644<br>
index 0000000..ca5e9e4<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/<u></u>bluez5/bluez5-5.7/bluetooth.<u></u>c=
onf<br>
@@ -0,0 +1,16 @@<br>
+&lt;!-- This configuration file specifies the required security policies<b=
r>
+ =C2=A0 =C2=A0 for Bluetooth core daemon to work. --&gt;<br>
+<br>
+&lt;!DOCTYPE busconfig PUBLIC &quot;-//freedesktop//DTD D-BUS Bus Configur=
ation 1.0//EN&quot;<br>
+ &quot;<a href=3D"http://www.freedesktop.org/standards/dbus/1.0/busconfig.=
dtd" target=3D"_blank">http://www.freedesktop.org/<u></u>standards/dbus/1.0=
/busconfig.<u></u>dtd</a>&quot;&gt;<br>
+&lt;busconfig&gt;<br>
+<br>
+ =C2=A0&lt;!-- ../system.conf have denied everything, so we just punch som=
e<br>
+ holes --&gt;<br>
+<br>
+ =C2=A0&lt;policy context=3D&quot;default&quot;&gt;<br>
+ =C2=A0 =C2=A0&lt;allow own=3D&quot;org.bluez&quot;/&gt;<br>
+ =C2=A0 =C2=A0&lt;allow send_destination=3D&quot;org.bluez&quot;/&gt;<br>
+ =C2=A0 =C2=A0&lt;allow send_interface=3D&quot;org.bluez.<u></u>Agent&quot=
;/&gt;<br>
+ =C2=A0&lt;/policy&gt;<br>
+<br>
+&lt;/busconfig&gt;<br>
diff --git a/meta/recipes-connectivity/<u></u>bluez5/bluez5.inc<br>
b/meta/recipes-connectivity/<u></u>bluez5/bluez5.inc<br>
new file mode 100644<br>
index 0000000..fc78900<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/<u></u>bluez5/bluez5.inc<br>
@@ -0,0 +1,68 @@<br>
+SUMMARY =3D &quot;Linux Bluetooth Stack Userland V5&quot;<br>
+DESCRIPTION =3D &quot;Linux Bluetooth stack V5 userland components. =C2=A0=
These include a system configurations, daemons, tools and system libraries.=
&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://www.bluez.org" target=3D"_blank">http=
://www.bluez.org</a>&quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+LICENSE =3D &quot;GPLv2+ &amp; LGPLv2.1+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<u></u>12f884d2ae1ff87c09e=
5b7ccc2c4ca<u></u>7e \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://COPYING.LIB;md5=3D<u></u>fb504b67c50331fc78734fed90fb0e<u></u>09 \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://src/main.c;beginline=3D1;<u></u>endline=3D24;md5=3D<u></u>9bc54b93cd7e17=
bf03f52513f39f92<u></u>6e&quot;<br>
+DEPENDS =3D &quot;udev libusb dbus-glib glib-2.0 libcheck libical readline=
&quot;<br>
+<br>
+RCONFLICTS_${PN} =3D &quot;bluez4&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot;${@base_contains(&#39;DISTRO_<u></u>FEATURES&#39=
;, &#39;alsa&#39;, &#39;alsa&#39;, &#39;&#39;, d)}&quot;<br>
+PACKAGECONFIG[alsa] =3D &quot;--enable-alsa,--disable-alsa,<u></u>alsa-lib=
&quot;<br>
+<br>
+SRC_URI =3D &quot;\<br>
+ =C2=A0 =C2=A0${KERNELORG_MIRROR}/linux/<u></u>bluetooth/bluez-${PV}.tar.g=
z \<br>
+ =C2=A0 =C2=A0file://bluetooth.conf \<br>
+&quot;<br>
+S =3D &quot;${WORKDIR}/bluez-${PV}&quot;<br>
+<br>
+inherit autotools pkgconfig systemd<br>
+<br>
+EXTRA_OECONF =3D &quot;\<br>
+ =C2=A0--disable-gstreamer \<br>
+ =C2=A0--enable-usb \<br>
+ =C2=A0--enable-tools \<br>
+ =C2=A0--enable-bccmd \<br>
+ =C2=A0--enable-hid2hci \<br>
+ =C2=A0--enable-dfutool \<br>
+ =C2=A0--disable-hidd \<br>
+ =C2=A0--disable-pand \<br>
+ =C2=A0--disable-dund \<br>
+ =C2=A0--disable-cups \<br>
+ =C2=A0--enable-test \<br>
+ =C2=A0--enable-datafiles \<br>
+ =C2=A0${@base_contains(&#39;DISTRO_<u></u>FEATURES&#39;, &#39;systemd&#39=
;,<br>
+&#39;--with-systemdunitdir=3D${<u></u>systemd_unitdir}/system/&#39;, &#39;=
--disable-systemd&#39;, d)} \ &quot;<br>
+<br>
+do_install_append() {<br>
+ =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/bluetooth/<br>
+ =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/profiles/audio/audio.conf ${D}/=
${sysconfdir}/bluetooth/<br>
+ =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/profiles/network/network.<u></u=
>conf ${D}/${sysconfdir}/bluetooth/<br>
+ =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/profiles/input/input.conf ${D}/=
${sysconfdir}/bluetooth/<br>
+ =C2=A0 =C2=A0 =C2=A0 # at_console doesn&#39;t really work with the curren=
t state of OE, so punch some more holes so people can actually use BT<br>
+ =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/bluetooth.conf<br>
+${D}/${sysconfdir}/dbus-1/<u></u>system.d/<br>
+}<br>
+<br>
+ALLOW_EMPTY_libasound-module-<u></u>bluez =3D &quot;1&quot;<br>
+PACKAGES =3D+ &quot;libasound-module-bluez ${PN}-test&quot;<br>
+<br>
+FILES_libasound-module-bluez =3D &quot;${libdir}/alsa-lib/lib*.so ${datadi=
r}/alsa&quot;<br>
+FILES_${PN} +=3D &quot;${libdir}/bluetooth/plugins ${libdir}/bluetooth/plu=
gins/*.<u></u>so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${system=
d_unitdir}/ ${datadir}/dbus-1&quot;<br>
+FILES_${PN}-dev +=3D &quot;\<br>
+ =C2=A0${libdir}/bluetooth/plugins/*.<u></u>la \<br>
+ =C2=A0${libdir}/alsa-lib/*.la \<br>
+&quot;<br>
+<br>
+FILES_${PN}-test =3D &quot;${libdir}/bluez/test/*&quot;<br>
+<br>
+FILES_${PN}-dbg +=3D &quot;\<br>
+ =C2=A0${libdir}/${BPN}/bluetooth/.<u></u>debug \<br>
+ =C2=A0${libdir}/bluetooth/plugins/.<u></u>debug \<br>
+ =C2=A0${libdir}/*/.debug \<br>
+ =C2=A0*/udev/.debug \<br>
+ =C2=A0&quot;<br>
+<br>
+SYSTEMD_SERVICE_${PN} =3D &quot;bluetooth.service&quot;<br>
diff --git a/meta/recipes-connectivity/<u></u>bluez5/<a href=3D"http://blue=
z5_5.7.bb" target=3D"_blank">bluez5_5.7.bb</a><br>
b/meta/recipes-connectivity/<u></u>bluez5/<a href=3D"http://bluez5_5.7.bb" =
target=3D"_blank">bluez5_5.7.bb</a><br>
new file mode 100644<br>
index 0000000..6e2850d<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/<u></u>bluez5/<a href=3D"http://bluez5_5.7.=
bb" target=3D"_blank">bluez5_5.7.bb</a><br>
@@ -0,0 +1,5 @@<br>
+require bluez5.inc<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<u></u>ce0ef43938e8bfc230f3f06d6ad02d<u></u>7e&q=
uot;<br>
+SRC_URI[sha256sum] =3D &quot;<u></u>902299204b7139c913765603c7054a<u></u>6=
04570aea9e9fddb30454bd1b5e599<u></u>7860&quot;<br>
+<br>
<br>
______________________________<u></u>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org" target=3D"_b=
lank">Openembedded-commits@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" target=3D"_blank">http://lists.openembedded.org/<u></u>mailman/listinf=
o/openembedded-<u></u>commits</a><br>
</blockquote>
<br>
</blockquote>
</div></div></blockquote></div><br></div>

--089e0112c78cfd35f004e254216e--
