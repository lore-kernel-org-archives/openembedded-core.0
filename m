Received: from mail-lb0-f195.google.com ([209.85.217.195])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alex.r.damian@gmail.com>) id 1UO7BC-0004b0-LR
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 16:00:04 +0200
Received: by mail-lb0-f195.google.com with SMTP id r11so950970lbv.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 06:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=nGVaCaZfzxsYFbY1h3myHHanPesaj722fff1IR+qKt4=;
	b=iusOrnxqOeEtE4mwHePirmGvwgwMi2Wgy02qn11Tk9N4tXl+KV3VjyzBVyhj4HQ2oZ
	kA9m4rhWdGBC6d6ydEiRi/cyEK6sNUxBko8QL079Gi2K+tEdTtIwg8/kRFUTIGwPQO5J
	zDEs5SqkwmHyqkgWt9WAcMx0Qgm0Ty2YmMJ+8bDzdky5kAcy5Yw3pOTPE6Mp6Ne0M/6Q
	Z3iYdyrpmzze/VNCvHGuUNA8NpSw+ICGW2Cyt8Td29dzFSQvNIkDP9vv8UY3Dgqqd3h1
	3NHOj9GHzQjmuJfkW8TzE0GfOipJ4wDwPMsUXKjQw6St0s+8+R9DUp4Ywk/KKKivVIv4
	uX0w==
MIME-Version: 1.0
X-Received: by 10.112.47.41 with SMTP id a9mr6030616lbn.134.1365168567402;
	Fri, 05 Apr 2013 06:29:27 -0700 (PDT)
Received: by 10.112.209.9 with HTTP; Fri, 5 Apr 2013 06:29:27 -0700 (PDT)
In-Reply-To: <515EBCA1.6000502@intel.com>
References: <1365006329-20964-1-git-send-email-radu.moisan@intel.com>
	<1365006329-20964-3-git-send-email-radu.moisan@intel.com>
	<825B3AFA-0F5B-45F2-B4DE-D359A1E4414B@dominion.thruhere.net>
	<515D75D5.4020204@intel.com>
	<1B3FBA45-5658-4BF8-A854-84058F80DCBF@dominion.thruhere.net>
	<515EBCA1.6000502@intel.com>
Date: Fri, 5 Apr 2013 16:29:27 +0300
Message-ID: <CAL7ttbc2VXkMz79oyHt69E0wsSvEYqndNHSQMLCDO56TF6v=og@mail.gmail.com>
From: Alex Damian <alex.r.damian@gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] udev: enable multilib support
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
X-List-Received-Date: Fri, 05 Apr 2013 14:00:11 -0000
Content-Type: multipart/alternative; boundary=bcaec554d75484c94604d99d132b

--bcaec554d75484c94604d99d132b
Content-Type: text/plain; charset=ISO-8859-1

On udev-184 they changed the default location from /sbin/ to /lib/udev/ and
I kept same as the upstream is.


On Fri, Apr 5, 2013 at 2:59 PM, Radu Moisan <radu.moisan@intel.com> wrote:

>
> On 04/04/2013 04:03 PM, Koen Kooi wrote:
>
>> Op 4 apr. 2013, om 14:45 heeft Radu Moisan <radu.moisan@intel.com> het
>> volgende geschreven:
>>
>>  On 04/03/2013 08:58 PM, Koen Kooi wrote:
>>>
>>>> Op 3 apr. 2013, om 18:25 heeft Radu Moisan <radu.moisan@intel.com> het
>>>> volgende geschreven:
>>>>
>>>>  Use base_libdir in place of hardcoded /lib
>>>>> Fixes [YOCTO #4096]
>>>>>
>>>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>>>> ---
>>>>> meta/recipes-core/udev/udev.**inc |    1 +
>>>>> 1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/meta/recipes-core/udev/udev.**inc
>>>>> b/meta/recipes-core/udev/udev.**inc
>>>>> index e358d2d..6fd0240 100644
>>>>> --- a/meta/recipes-core/udev/udev.**inc
>>>>> +++ b/meta/recipes-core/udev/udev.**inc
>>>>> @@ -76,6 +76,7 @@ FILES_udev-utils = "${bindir}/udevadm"
>>>>>
>>>>> do_install_append () {
>>>>>         install -d ${D}${sysconfdir}/init.d
>>>>> +       sed -i 's@/lib/udev@${base_libdir}/**udev@g' ${WORKDIR}/init
>>>>>         install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
>>>>>         install -m 0755 ${WORKDIR}/udev-cache
>>>>> ${D}${sysconfdir}/init.d/udev-**cache
>>>>>
>>>> NACK! The udev maintainers have been clear that it is always /lib/udev,
>>>> even on 64 bit systems, so you're not fixing a problem, you're creating an
>>>> extra one.
>>>>
>>> Koen, do you agree with this one?
>>> http://patches.openembedded.**org/patch/41167/<http://patches.openembedded.org/patch/41167/>
>>>
>> That patch seems to match what Fedora does:
>>
>> koen@rrMBP setup-scripts]$ file /lib/udev/*
>> /lib/udev/accelerometer:             ELF 64-bit LSB executable, x86-64,
>> version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
>> 2.6.32, BuildID[sha1]=**0x600a72599b0896506d2cff430b71**26d912370056,
>> not stripped
>> /lib/udev/ata_id:                    ELF 64-bit LSB executable, x86-64,
>> version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
>> 2.6.32, BuildID[sha1]=**0x84bbaed9b1588de0a405bde9c7f7**350f4be6839e,
>> not stripped
>> /lib/udev/bluetooth_serial:          POSIX shell script, ASCII text
>> executable
>> /lib/udev/cdrom_id:                  ELF 64-bit LSB executable, x86-64,
>> version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
>> 2.6.32, BuildID[sha1]=**0x8bdb6f801be7f68939ece42f4661**685654699a01,
>> not stripped
>> /lib/udev/check-ptp-camera:          Bourne-Again shell script, ASCII
>> text executable
>> /lib/udev/collect:                   ELF 64-bit LSB executable, x86-64,
>> version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
>> 2.6.32, BuildID[sha1]=**0xab7db8974d08b609e4750750043d**8093d4aa3b80,
>> not stripped
>> /lib/udev/findkeyboards:             POSIX shell script, ASCII text
>> executable
>> /lib/udev/hwdb.d:                    directory
>> /lib/udev/ift-load:                  ELF 64-bit LSB executable, x86-64,
>> version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
>> 2.6.32, BuildID[sha1]=**0x49f9ba51194518eb078834e8ff56**30253e84bfa0,
>> stripped
>> /lib/udev/iphone-set-info:           ELF 64-bit LSB executable, x86-64,
>> version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
>> 2.6.32, BuildID[sha1]=**0x70bd3a730278aace048187c123d5**00b63d2e3adb,
>> stripped
>> /lib/udev/ipod-set-info:             ELF 64-bit LSB executable, x86-64,
>> version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
>> 2.6.32, BuildID[sha1]=**0x52ed540687d1e2806c5c2a836b60**141e2f3d8c36,
>> stripped
>> /lib/udev/keyboard-force-**release.sh: POSIX shell script, ASCII text
>> executable
>> /lib/udev/keymap:                    ELF 64-bit LSB executable, x86-64,
>> version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
>> 2.6.32, BuildID[sha1]=**0x8b2541255989492410485c979eee**55d8237fa85f,
>> not stripped
>> /lib/udev/keymaps:                   directory
>> /lib/udev/mtd_probe:                 ELF 64-bit LSB executable, x86-64,
>> version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
>> 2.6.32, BuildID[sha1]=**0x4bb384bb9a2c32cd7a8c8cd3db15**f0a44572d5a1,
>> not stripped
>> /lib/udev/mtp-probe:                 ELF 64-bit LSB executable, x86-64,
>> version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
>> 2.6.32, BuildID[sha1]=**0x5f6e4b4944c003b08788f0bfe978**40da3cfcd29b,
>> stripped
>> /lib/udev/pcmcia-check-broken-**cis:   ELF 64-bit LSB executable,
>> x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for
>> GNU/Linux 2.6.32, BuildID[sha1]=**0x1632f66c648501cf19bb478f50ee**689e5caa1590,
>> stripped
>> /lib/udev/pcmcia-socket-**startup:     ELF 64-bit LSB executable,
>> x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for
>> GNU/Linux 2.6.32, BuildID[sha1]=**0x48bf0e8e9461ed430c7173974795**f3bd1b0d42a6,
>> stripped
>> /lib/udev/rename_device:             ELF 64-bit LSB executable, x86-64,
>> version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
>> 2.6.32, BuildID[sha1]=**0x9740fdf52fb7304ddb56ecef2d3b**4e157fd208dc,
>> stripped
>> /lib/udev/rules.d:                   directory
>> /lib/udev/scsi_id:                   ELF 64-bit LSB executable, x86-64,
>> version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
>> 2.6.32, BuildID[sha1]=**0x9ca187eac5c28bdcf96b56002329**317099870c3b,
>> not stripped
>> /lib/udev/tascam_fpga:               POSIX shell script, ASCII text
>> executable
>> /lib/udev/tascam_fw:                 POSIX shell script, ASCII text
>> executable
>> /lib/udev/udev-add-printer:          Python script, ASCII text executable
>> /lib/udev/udev-configure-**printer:    ELF 64-bit LSB executable,
>> x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for
>> GNU/Linux 2.6.32, BuildID[sha1]=**0xb0ddd749dbefd5abced9b5b64fc5**f1280199f2aa,
>> stripped
>> /lib/udev/usb_modeswitch:            POSIX shell script, ASCII text
>> executable
>> /lib/udev/v4l_id:                    ELF 64-bit LSB executable, x86-64,
>> version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
>> 2.6.32, BuildID[sha1]=**0xa8f5533157c207a48ba3876ae61b**1c73cb9733fc,
>> not stripped
>>
>>  Same thing on my ubuntu.
> What I understand from this is that Koen is referring to 64bit binary
> files located in noarch_base_libdir, that is /lib. Please correct me if I'm
> wrong.
> Another thing I bumped into... is there any reason why udevd ends up in
> /lib (/lib64) and not in /sbin? On my machine is located in /sbin and I'm
> assuming it is the same for most distributions.
>
> Radu
>
>
> ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>

--bcaec554d75484c94604d99d132b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On udev-184 they changed the default location from /sbin/ =
to /lib/udev/ and I kept same as the upstream is.</div><div class=3D"gmail_=
extra"><br><br><div class=3D"gmail_quote">On Fri, Apr 5, 2013 at 2:59 PM, R=
adu Moisan <span dir=3D"ltr">&lt;<a href=3D"mailto:radu.moisan@intel.com" t=
arget=3D"_blank">radu.moisan@intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5"><br>
On 04/04/2013 04:03 PM, Koen Kooi wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Op 4 apr. 2013, om 14:45 heeft Radu Moisan &lt;<a href=3D"mailto:radu.moisa=
n@intel.com" target=3D"_blank">radu.moisan@intel.com</a>&gt; het volgende g=
eschreven:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 04/03/2013 08:58 PM, Koen Kooi wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Op 3 apr. 2013, om 18:25 heeft Radu Moisan &lt;<a href=3D"mailto:radu.moisa=
n@intel.com" target=3D"_blank">radu.moisan@intel.com</a>&gt; het volgende g=
eschreven:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Use base_libdir in place of hardcoded /lib<br>
Fixes [YOCTO #4096]<br>
<br>
Signed-off-by: Radu Moisan &lt;<a href=3D"mailto:radu.moisan@intel.com" tar=
get=3D"_blank">radu.moisan@intel.com</a>&gt;<br>
---<br>
meta/recipes-core/udev/udev.<u></u>inc | =A0 =A01 +<br>
1 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-core/udev/udev.<u></u>inc b/meta/recipes-core/ude=
v/udev.<u></u>inc<br>
index e358d2d..6fd0240 100644<br>
--- a/meta/recipes-core/udev/udev.<u></u>inc<br>
+++ b/meta/recipes-core/udev/udev.<u></u>inc<br>
@@ -76,6 +76,7 @@ FILES_udev-utils =3D &quot;${bindir}/udevadm&quot;<br>
<br>
do_install_append () {<br>
=A0 =A0 =A0 =A0 install -d ${D}${sysconfdir}/init.d<br>
+ =A0 =A0 =A0 sed -i &#39;s@/lib/udev@${base_libdir}/<u></u>udev@g&#39; ${W=
ORKDIR}/init<br>
=A0 =A0 =A0 =A0 install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/ud=
ev<br>
=A0 =A0 =A0 =A0 install -m 0755 ${WORKDIR}/udev-cache ${D}${sysconfdir}/ini=
t.d/udev-<u></u>cache<br>
</blockquote>
NACK! The udev maintainers have been clear that it is always /lib/udev, eve=
n on 64 bit systems, so you&#39;re not fixing a problem, you&#39;re creatin=
g an extra one.<br>
</blockquote>
Koen, do you agree with this one?<br>
<a href=3D"http://patches.openembedded.org/patch/41167/" target=3D"_blank">=
http://patches.openembedded.<u></u>org/patch/41167/</a><br>
</blockquote>
That patch seems to match what Fedora does:<br>
<br>
koen@rrMBP setup-scripts]$ file /lib/udev/*<br>
/lib/udev/accelerometer: =A0 =A0 =A0 =A0 =A0 =A0 ELF 64-bit LSB executable,=
 x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/L=
inux 2.6.32, BuildID[sha1]=3D<u></u>0x600a72599b0896506d2cff430b71<u></u>26=
d912370056, not stripped<br>

/lib/udev/ata_id: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ELF 64-bit LSB exe=
cutable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), f=
or GNU/Linux 2.6.32, BuildID[sha1]=3D<u></u>0x84bbaed9b1588de0a405bde9c7f7<=
u></u>350f4be6839e, not stripped<br>

/lib/udev/bluetooth_serial: =A0 =A0 =A0 =A0 =A0POSIX shell script, ASCII te=
xt executable<br>
/lib/udev/cdrom_id: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ELF 64-bit LSB execu=
table, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for=
 GNU/Linux 2.6.32, BuildID[sha1]=3D<u></u>0x8bdb6f801be7f68939ece42f4661<u>=
</u>685654699a01, not stripped<br>

/lib/udev/check-ptp-camera: =A0 =A0 =A0 =A0 =A0Bourne-Again shell script, A=
SCII text executable<br>
/lib/udev/collect: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ELF 64-bit LSB execu=
table, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for=
 GNU/Linux 2.6.32, BuildID[sha1]=3D<u></u>0xab7db8974d08b609e4750750043d<u>=
</u>8093d4aa3b80, not stripped<br>

/lib/udev/findkeyboards: =A0 =A0 =A0 =A0 =A0 =A0 POSIX shell script, ASCII =
text executable<br>
/lib/udev/hwdb.d: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0directory<br>
/lib/udev/ift-load: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ELF 64-bit LSB execu=
table, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for=
 GNU/Linux 2.6.32, BuildID[sha1]=3D<u></u>0x49f9ba51194518eb078834e8ff56<u>=
</u>30253e84bfa0, stripped<br>

/lib/udev/iphone-set-info: =A0 =A0 =A0 =A0 =A0 ELF 64-bit LSB executable, x=
86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Lin=
ux 2.6.32, BuildID[sha1]=3D<u></u>0x70bd3a730278aace048187c123d5<u></u>00b6=
3d2e3adb, stripped<br>

/lib/udev/ipod-set-info: =A0 =A0 =A0 =A0 =A0 =A0 ELF 64-bit LSB executable,=
 x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/L=
inux 2.6.32, BuildID[sha1]=3D<u></u>0x52ed540687d1e2806c5c2a836b60<u></u>14=
1e2f3d8c36, stripped<br>

/lib/udev/keyboard-force-<u></u>release.sh: POSIX shell script, ASCII text =
executable<br>
/lib/udev/keymap: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ELF 64-bit LSB exe=
cutable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), f=
or GNU/Linux 2.6.32, BuildID[sha1]=3D<u></u>0x8b2541255989492410485c979eee<=
u></u>55d8237fa85f, not stripped<br>

/lib/udev/keymaps: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 directory<br>
/lib/udev/mtd_probe: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ELF 64-bit LSB executa=
ble, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for G=
NU/Linux 2.6.32, BuildID[sha1]=3D<u></u>0x4bb384bb9a2c32cd7a8c8cd3db15<u></=
u>f0a44572d5a1, not stripped<br>

/lib/udev/mtp-probe: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ELF 64-bit LSB executa=
ble, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for G=
NU/Linux 2.6.32, BuildID[sha1]=3D<u></u>0x5f6e4b4944c003b08788f0bfe978<u></=
u>40da3cfcd29b, stripped<br>

/lib/udev/pcmcia-check-broken-<u></u>cis: =A0 ELF 64-bit LSB executable, x8=
6-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linu=
x 2.6.32, BuildID[sha1]=3D<u></u>0x1632f66c648501cf19bb478f50ee<u></u>689e5=
caa1590, stripped<br>

/lib/udev/pcmcia-socket-<u></u>startup: =A0 =A0 ELF 64-bit LSB executable, =
x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Li=
nux 2.6.32, BuildID[sha1]=3D<u></u>0x48bf0e8e9461ed430c7173974795<u></u>f3b=
d1b0d42a6, stripped<br>

/lib/udev/rename_device: =A0 =A0 =A0 =A0 =A0 =A0 ELF 64-bit LSB executable,=
 x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/L=
inux 2.6.32, BuildID[sha1]=3D<u></u>0x9740fdf52fb7304ddb56ecef2d3b<u></u>4e=
157fd208dc, stripped<br>

/lib/udev/rules.d: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 directory<br>
/lib/udev/scsi_id: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ELF 64-bit LSB execu=
table, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for=
 GNU/Linux 2.6.32, BuildID[sha1]=3D<u></u>0x9ca187eac5c28bdcf96b56002329<u>=
</u>317099870c3b, not stripped<br>

/lib/udev/tascam_fpga: =A0 =A0 =A0 =A0 =A0 =A0 =A0 POSIX shell script, ASCI=
I text executable<br>
/lib/udev/tascam_fw: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 POSIX shell script, AS=
CII text executable<br>
/lib/udev/udev-add-printer: =A0 =A0 =A0 =A0 =A0Python script, ASCII text ex=
ecutable<br>
/lib/udev/udev-configure-<u></u>printer: =A0 =A0ELF 64-bit LSB executable, =
x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Li=
nux 2.6.32, BuildID[sha1]=3D<u></u>0xb0ddd749dbefd5abced9b5b64fc5<u></u>f12=
80199f2aa, stripped<br>

/lib/udev/usb_modeswitch: =A0 =A0 =A0 =A0 =A0 =A0POSIX shell script, ASCII =
text executable<br>
/lib/udev/v4l_id: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ELF 64-bit LSB exe=
cutable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), f=
or GNU/Linux 2.6.32, BuildID[sha1]=3D<u></u>0xa8f5533157c207a48ba3876ae61b<=
u></u>1c73cb9733fc, not stripped<br>

<br>
</blockquote></div></div>
Same thing on my ubuntu.<br>
What I understand from this is that Koen is referring to 64bit binary files=
 located in noarch_base_libdir, that is /lib. Please correct me if I&#39;m =
wrong.<br>
Another thing I bumped into... is there any reason why udevd ends up in /li=
b (/lib64) and not in /sbin? On my machine is located in /sbin and I&#39;m =
assuming it is the same for most distributions.<span class=3D"HOEnZb"><font=
 color=3D"#888888"><br>

<br>
Radu</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
</div></div></blockquote></div><br></div>

--bcaec554d75484c94604d99d132b--
