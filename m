Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8C3FE61425
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 16:11:02 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id t12so8833334vso.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 08:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0TvmlEZKoa4uLQuPSUUaGlg5poygut+rorvu5yXO3K8=;
	b=kAKU51rWzNlE9z8SPfhGpoLC3WdXXNNppvyQMktvZLHq8FRoku6OQlkF3TGTk5ZA3s
	JDlstZJefFjeb7VppIlH+lGqkSjcKnX0R5YIgD6FUEMZkfURJf8V+aejsecCNPf7PocT
	wWSen/BYCo+xLbjAGx/WGeD7RU3P/bSm85y2tyMIvktK+GFgP84o3w7y7aNvhgQuwlAR
	pxky2GOXclYvWIRIWmSbyCovA6YV7atVUaR9U+KZYsN2sFqqrw/U7y8EGPbOSbXSt8ix
	5SrsXXAJ806hxMmtXctqn7oMzoLkYPtkstE+19lKUU7syBb73JB8r7v39Lma4MDtkB4c
	+7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0TvmlEZKoa4uLQuPSUUaGlg5poygut+rorvu5yXO3K8=;
	b=TaSWkXopstBUTLrCgDaGkWNN9As7zyFMPMw88NdebJ6B65G9EMCzUrXqLntwTTA7Nd
	dK70Ae942UO6ffGth1LJ7M1XyysjCGKNPrVv80it8og63N3a6Hz5Cw5VBWB/Q9GUZRbu
	rPdr127wUETGBIR73vvLYOc7iWYGL0h/Ik/ZZ0PH55ksBn36b6/MqeN+oHsQF5JjEw2i
	yRpUy7xsRoEzt/kqlWxnJpvVUFOo7dhhBaSyKkoVgnNIUUuZ2mNmID0QwaSKDEPwMM/k
	T6k6Bw+EeKclK/0OzN4O7nL92o2wTp5riLRo5natCkDWjvWRN4J10wFnAjT9UUudgWZA
	+w3A==
X-Gm-Message-State: APjAAAU/GM4mhbh1l1JKJEtyf1uHY05P4YxwHDQFaelTl5cCXf1+mtQH
	adiCKbqsQj8YqimbxVpWijy3SEv6LSOsuKbbTIk=
X-Google-Smtp-Source: APXvYqwbluMsRsiTXREFDGagCwi5NM+bnjx8gm3GrlH/De14NwPIpJ7KPaeDNHypxBaOsDjl/ct3s4Lt0xD3Bj6qNEo=
X-Received: by 2002:a05:6102:405:: with SMTP id
	d5mr6252358vsq.94.1581869463482; 
	Sun, 16 Feb 2020 08:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-4-alex.kanavin@gmail.com>
	<CA+chaQfbJ=2Jb24Pfqo-o0n_O-CwroO1VdQcJrADC8VNSHp9DA@mail.gmail.com>
In-Reply-To: <CA+chaQfbJ=2Jb24Pfqo-o0n_O-CwroO1VdQcJrADC8VNSHp9DA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 16 Feb 2020 17:10:52 +0100
Message-ID: <CANNYZj9+WRaPK5iuhXA_ZP1PbgQ1ZTonx-v8Z8eSjSt8Xe83uA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/10] qemux86: drop resolution setting via uvesafb
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
X-List-Received-Date: Sun, 16 Feb 2020 16:11:02 -0000
Content-Type: multipart/alternative; boundary="00000000000073b5a6059eb3af92"

--00000000000073b5a6059eb3af92
Content-Type: text/plain; charset="UTF-8"

What about higher than fullHD?

Alex

On Sun, 16 Feb 2020 at 17:01, Martin Jansa <martin.jansa@gmail.com> wrote:

> Why you think it doesn't support higher resolution? We were using it with
> fullHD in VirtualBox until recently.
>
> On Sun, Feb 16, 2020 at 4:52 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> I am not sure if this has ever worked, but uvesafb is a really
>> outdated (VBE from the 1990s), awkward (needs v86d) and limited
>> (no support for high resolutions) way to do it.
>>
>> The specific reason 640x480-32 was introduced (ages ago) was
>> to force 32 bit mode with vmware driver, as 16bit had rendering issues.
>>
>> The modern, supported option is video=... kernel parameter documented
>> here:
>>
>> https://wiki.archlinux.org/index.php/kernel_mode_setting#Forcing_modes_and_EDID
>> https://github.com/torvalds/linux/blob/master/Documentation/fb/modedb.rst
>> which can be passed directly to runqemu and doesn't require special
>> kernel modules.
>>
>> Sato under X will continue to use 640x480 as that is hardcoded into
>> xorg.conf under qemu.
>>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ---
>>  meta/conf/machine/include/qemuboot-x86.inc | 3 +--
>>  meta/conf/machine/qemux86-64.conf          | 4 ----
>>  meta/conf/machine/qemux86.conf             | 4 ----
>>  meta/lib/oeqa/runtime/cases/parselogs.py   | 4 ----
>>  4 files changed, 1 insertion(+), 14 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/qemuboot-x86.inc
>> b/meta/conf/machine/include/qemuboot-x86.inc
>> index 049681b27d..5dcc8b6f6b 100644
>> --- a/meta/conf/machine/include/qemuboot-x86.inc
>> +++ b/meta/conf/machine/include/qemuboot-x86.inc
>> @@ -8,9 +8,8 @@ QB_CPU_KVM_x86-64 = "-cpu core2duo"
>>
>>  QB_AUDIO_DRV = "alsa"
>>  QB_AUDIO_OPT = "-soundhw ac97,es1370"
>> -QB_KERNEL_CMDLINE_APPEND = "uvesafb.mode_option=${UVESA_MODE}
>> oprofile.timer=1 uvesafb.task_timeout=-1"
>> +QB_KERNEL_CMDLINE_APPEND = "oprofile.timer=1"
>>  QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
>>  # Add the 'virtio-rng-pci' device otherwise the guest may run out of
>> entropy
>>  QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0
>> -device virtio-rng-pci,rng=rng0"
>>
>> -UVESA_MODE ?= "640x480-32"
>> diff --git a/meta/conf/machine/qemux86-64.conf
>> b/meta/conf/machine/qemux86-64.conf
>> index 648cf2fe8f..db9004ee32 100644
>> --- a/meta/conf/machine/qemux86-64.conf
>> +++ b/meta/conf/machine/qemux86-64.conf
>> @@ -37,10 +37,6 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
>>
>>  MACHINE_EXTRA_RRECOMMENDS = "kernel-module-snd-ens1370
>> kernel-module-snd-rawmidi"
>>
>> -KERNEL_MODULE_AUTOLOAD += "uvesafb"
>> -KERNEL_MODULE_PROBECONF += "uvesafb"
>> -module_conf_uvesafb = "options uvesafb mode_option=${UVESA_MODE}"
>> -
>>  WKS_FILE ?= "qemux86-directdisk.wks"
>>  do_image_wic[depends] += "syslinux:do_populate_sysroot
>> syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot
>> dosfstools-native:do_populate_sysroot"
>>
>> diff --git a/meta/conf/machine/qemux86.conf
>> b/meta/conf/machine/qemux86.conf
>> index 8e0da82076..7e6723b880 100644
>> --- a/meta/conf/machine/qemux86.conf
>> +++ b/meta/conf/machine/qemux86.conf
>> @@ -34,10 +34,6 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
>>
>>  MACHINE_EXTRA_RRECOMMENDS = "kernel-module-snd-ens1370
>> kernel-module-snd-rawmidi"
>>
>> -KERNEL_MODULE_AUTOLOAD += "uvesafb"
>> -KERNEL_MODULE_PROBECONF += "uvesafb"
>> -module_conf_uvesafb = "options uvesafb mode_option=${UVESA_MODE}"
>> -
>>  WKS_FILE ?= "qemux86-directdisk.wks"
>>  do_image_wic[depends] += "syslinux:do_populate_sysroot
>> syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot
>> dosfstools-native:do_populate_sysroot"
>>
>> diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py
>> b/meta/lib/oeqa/runtime/cases/parselogs.py
>> index 9dafb89b03..3cad0709a1 100644
>> --- a/meta/lib/oeqa/runtime/cases/parselogs.py
>> +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
>> @@ -60,7 +60,6 @@ common_errors = [
>>      ]
>>
>>  video_related = [
>> -    "uvesafb",
>>  ]
>>
>>  x86_common = [
>> @@ -82,11 +81,8 @@ qemux86_common = [
>>      "fail to add MMCONFIG information, can't access extended PCI
>> configuration space under this bridge.",
>>      "can't claim BAR ",
>>      'amd_nb: Cannot enumerate AMD northbridges',
>> -    'uvesafb: 5000 ms task timeout, infinitely waiting',
>>      'tsc: HPET/PMTIMER calibration failed',
>>      "modeset(0): Failed to initialize the DRI2 extension",
>> -    "uvesafb: cannot reserve video memory at",
>> -    "uvesafb: probe of uvesafb.0 failed with error",
>>      "glamor initialization failed",
>>  ] + common_errors
>>
>> --
>> 2.25.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--00000000000073b5a6059eb3af92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>What about higher than fullHD?</div><div><br></div><d=
iv>Alex<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Sun, 16 Feb 2020 at 17:01, Martin Jansa &lt;<a href=3D"mailto=
:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Why you thi=
nk it doesn&#39;t support higher resolution? We were using it with fullHD i=
n VirtualBox until recently.</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, Feb 16, 2020 at 4:52 PM Alexander Kan=
avin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">I am not sure if this has ever worked, but uvesafb is a rea=
lly<br>
outdated (VBE from the 1990s), awkward (needs v86d) and limited<br>
(no support for high resolutions) way to do it.<br>
<br>
The specific reason 640x480-32 was introduced (ages ago) was<br>
to force 32 bit mode with vmware driver, as 16bit had rendering issues.<br>
<br>
The modern, supported option is video=3D... kernel parameter documented her=
e:<br>
<a href=3D"https://wiki.archlinux.org/index.php/kernel_mode_setting#Forcing=
_modes_and_EDID" rel=3D"noreferrer" target=3D"_blank">https://wiki.archlinu=
x.org/index.php/kernel_mode_setting#Forcing_modes_and_EDID</a><br>
<a href=3D"https://github.com/torvalds/linux/blob/master/Documentation/fb/m=
odedb.rst" rel=3D"noreferrer" target=3D"_blank">https://github.com/torvalds=
/linux/blob/master/Documentation/fb/modedb.rst</a><br>
which can be passed directly to runqemu and doesn&#39;t require special<br>
kernel modules.<br>
<br>
Sato under X will continue to use 640x480 as that is hardcoded into<br>
xorg.conf under qemu.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.c=
om" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/qemuboot-x86.inc | 3 +--<br>
=C2=A0meta/conf/machine/qemux86-64.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 4 ----<br>
=C2=A0meta/conf/machine/qemux86.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 4 ----<br>
=C2=A0meta/lib/oeqa/runtime/cases/parselogs.py=C2=A0 =C2=A0| 4 ----<br>
=C2=A04 files changed, 1 insertion(+), 14 deletions(-)<br>
<br>
diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine=
/include/qemuboot-x86.inc<br>
index 049681b27d..5dcc8b6f6b 100644<br>
--- a/meta/conf/machine/include/qemuboot-x86.inc<br>
+++ b/meta/conf/machine/include/qemuboot-x86.inc<br>
@@ -8,9 +8,8 @@ QB_CPU_KVM_x86-64 =3D &quot;-cpu core2duo&quot;<br>
<br>
=C2=A0QB_AUDIO_DRV =3D &quot;alsa&quot;<br>
=C2=A0QB_AUDIO_OPT =3D &quot;-soundhw ac97,es1370&quot;<br>
-QB_KERNEL_CMDLINE_APPEND =3D &quot;uvesafb.mode_option=3D${UVESA_MODE} opr=
ofile.timer=3D1 uvesafb.task_timeout=3D-1&quot;<br>
+QB_KERNEL_CMDLINE_APPEND =3D &quot;oprofile.timer=3D1&quot;<br>
=C2=A0QB_OPT_APPEND =3D &quot;-show-cursor -usb -device usb-tablet&quot;<br=
>
=C2=A0# Add the &#39;virtio-rng-pci&#39; device otherwise the guest may run=
 out of entropy<br>
=C2=A0QB_OPT_APPEND +=3D &quot;-object rng-random,filename=3D/dev/urandom,i=
d=3Drng0 -device virtio-rng-pci,rng=3Drng0&quot;<br>
<br>
-UVESA_MODE ?=3D &quot;640x480-32&quot;<br>
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-=
64.conf<br>
index 648cf2fe8f..db9004ee32 100644<br>
--- a/meta/conf/machine/qemux86-64.conf<br>
+++ b/meta/conf/machine/qemux86-64.conf<br>
@@ -37,10 +37,6 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D &quot;v86d&quot;<b=
r>
<br>
=C2=A0MACHINE_EXTRA_RRECOMMENDS =3D &quot;kernel-module-snd-ens1370 kernel-=
module-snd-rawmidi&quot;<br>
<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;uvesafb&quot;<br>
-KERNEL_MODULE_PROBECONF +=3D &quot;uvesafb&quot;<br>
-module_conf_uvesafb =3D &quot;options uvesafb mode_option=3D${UVESA_MODE}&=
quot;<br>
-<br>
=C2=A0WKS_FILE ?=3D &quot;qemux86-directdisk.wks&quot;<br>
=C2=A0do_image_wic[depends] +=3D &quot;syslinux:do_populate_sysroot syslinu=
x-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-n=
ative:do_populate_sysroot&quot;<br>
<br>
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.con=
f<br>
index 8e0da82076..7e6723b880 100644<br>
--- a/meta/conf/machine/qemux86.conf<br>
+++ b/meta/conf/machine/qemux86.conf<br>
@@ -34,10 +34,6 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D &quot;v86d&quot;<b=
r>
<br>
=C2=A0MACHINE_EXTRA_RRECOMMENDS =3D &quot;kernel-module-snd-ens1370 kernel-=
module-snd-rawmidi&quot;<br>
<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;uvesafb&quot;<br>
-KERNEL_MODULE_PROBECONF +=3D &quot;uvesafb&quot;<br>
-module_conf_uvesafb =3D &quot;options uvesafb mode_option=3D${UVESA_MODE}&=
quot;<br>
-<br>
=C2=A0WKS_FILE ?=3D &quot;qemux86-directdisk.wks&quot;<br>
=C2=A0do_image_wic[depends] +=3D &quot;syslinux:do_populate_sysroot syslinu=
x-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-n=
ative:do_populate_sysroot&quot;<br>
<br>
diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runti=
me/cases/parselogs.py<br>
index 9dafb89b03..3cad0709a1 100644<br>
--- a/meta/lib/oeqa/runtime/cases/parselogs.py<br>
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py<br>
@@ -60,7 +60,6 @@ common_errors =3D [<br>
=C2=A0 =C2=A0 =C2=A0]<br>
<br>
=C2=A0video_related =3D [<br>
-=C2=A0 =C2=A0 &quot;uvesafb&quot;,<br>
=C2=A0]<br>
<br>
=C2=A0x86_common =3D [<br>
@@ -82,11 +81,8 @@ qemux86_common =3D [<br>
=C2=A0 =C2=A0 =C2=A0&quot;fail to add MMCONFIG information, can&#39;t acces=
s extended PCI configuration space under this bridge.&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;can&#39;t claim BAR &quot;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;amd_nb: Cannot enumerate AMD northbridges&#39;,<br=
>
-=C2=A0 =C2=A0 &#39;uvesafb: 5000 ms task timeout, infinitely waiting&#39;,=
<br>
=C2=A0 =C2=A0 =C2=A0&#39;tsc: HPET/PMTIMER calibration failed&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;modeset(0): Failed to initialize the DRI2 extensi=
on&quot;,<br>
-=C2=A0 =C2=A0 &quot;uvesafb: cannot reserve video memory at&quot;,<br>
-=C2=A0 =C2=A0 &quot;uvesafb: probe of uvesafb.0 failed with error&quot;,<b=
r>
=C2=A0 =C2=A0 =C2=A0&quot;glamor initialization failed&quot;,<br>
=C2=A0] + common_errors<br>
<br>
-- <br>
2.25.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>
</blockquote></div></div>

--00000000000073b5a6059eb3af92--
