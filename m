Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E0D3260603
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 06:54:14 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id v25-v6so8424228wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 23:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iSl8i/hHi9LQ7egEiX5BvU1v+hTAmn2FmCCY2jTED24=;
	b=qGQjoT6Pqm27sOqTqcU094TE5PVm8oWgMwx67BVjet6Iyw72g5yImD6qI85t6CTE8a
	P5yZu1UFWqSsjto0A2SM27jlAd/+Sgsq/+zqHpBiqeK1co++xGEE1/gJ5yycPN7QV10k
	TIVY9C+4SSsJHi+Xg9Q05DgBZQT6EIDtAnl52vC/tg8NUchcI6FmWsaFJN2u5vW1LqCP
	B9GZXxzC6xvc4l0uzE+kEfR8genXew3QaSh0EuH+UKTsW/EkX9lAXMdwXQcju02roi2h
	nlAX7/9yRHqSvKtfWkaS53nZ86qB3iGmYZ7NLpZ63CQ3NgD+j5hQ7CvSjYZnGEjglnZc
	4+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iSl8i/hHi9LQ7egEiX5BvU1v+hTAmn2FmCCY2jTED24=;
	b=gIRva1XYz9a60UqYMOWKnqrY4x1oPt/5FMhmGU4X+5aPxojvT4R2eq6poy2l+H5IcC
	2B7gza05r8pMqNYPsH6h2WSPDH2XkNTURuHCbvOufy6A7kp1NhZvgABetse/9qmvjhNo
	O/IUer6NGfXUYAjmrC5UPosj2Dbp5R479dQJvlBJcQcIRcbU9ySay+kGujTy2W+F3sPU
	k+/6tWE20Pm9a4IJJK0fDxVadB6+SQnCI3bNCkFKSdVN53T4GGPdGuPhtC7/vyxT2+ph
	kuN3SceuLz7xGiY1igCCxZKrvE8DcZnIOUJ5t4bJ3WCtoDyrA7rUfpMNPNBUlJljcwR0
	L46g==
X-Gm-Message-State: AOUpUlEcIskfZtXvmI4DNCh6vkEpAqcKHuXgbo4QnoUYx2cKtF4D3u95
	yieRjXVbtCR12HXyGljejWPAlvNdHPP0pXF2NikYbwmm
X-Google-Smtp-Source: AAOMgpdYZsrIgirACadZ0wZn8IYCrixj3SO+cK1DTsLJOFwExoNHaXxRClsM9+boV7j2paID1zHyfZMYlS0joO3INl0=
X-Received: by 2002:a1c:9807:: with SMTP id a7-v6mr665929wme.32.1532069655603; 
	Thu, 19 Jul 2018 23:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20180521215050.30322-1-otavio@ossystems.com.br>
	<CA+chaQdrQKjrLbMwwkNx-dEtO+zQzQHB7D=+-w6P=AobKK2iYg@mail.gmail.com>
In-Reply-To: <CA+chaQdrQKjrLbMwwkNx-dEtO+zQzQHB7D=+-w6P=AobKK2iYg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 20 Jul 2018 08:54:06 +0200
Message-ID: <CA+chaQf6dci=B5GZ=u9ij0hPF6p4QtBuJm2U=ByT-X_29hiqQA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] linux-firmware: upgrade to 8fc2d4e5 revision
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
X-List-Received-Date: Fri, 20 Jul 2018 06:54:15 -0000
Content-Type: multipart/alternative; boundary="00000000000097edcb057168c345"

--00000000000097edcb057168c345
Content-Type: text/plain; charset="UTF-8"

This happened again when this commit was backported to sumo yesterday, so
now newer revision of oe-core sumo needs additional fix for
meta-raspberrypi:
https://github.com/agherzan/meta-raspberrypi/pull/291
this is quite unfortunate, so I'm going to send LIC_FILES_CHKSUM addition
to oe-core recipe before this spreads even more.

On Fri, Jun 22, 2018 at 5:24 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> BTW: this breaks raspberrypi builds in interesting way, I've sent PR with
> fix here:
> https://github.com/agherzan/meta-raspberrypi/pull/272
>
> but maybe we can improve this recipe a bit by including Firmware-cypress
> LIC_FILES_CHKSUM here and leaving only more version agnostic changes in
> meta-raspberrypi bbappend.
>
> On Mon, May 21, 2018 at 11:51 PM Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>
>> 8fc2d4e Merge git://git.marvell.com/mwifiex-firmware
>> e1abab6 linux-firmware: update Marvell USB8997 firmware image to add WPA2
>> vulnerability fix
>> c38c231 linux-firmware: update Marvell SD8897-B0 firmware image to add
>> WPA2 vulnerability fix
>> 0686ec7 Merge branch 'firmware-update' of
>> https://github.com/intel/opa-firmware
>> bb7f773 <https://github.com/intel/opa-firmwarebb7f773> Update Intel OPA
>> hfi1 firmware
>> 397a604 qed: Add firmware 8.33.12.0
>> 40d4117 linux-firmware: Add firmware file for Intel Bluetooth,9560
>> bf3934f linux-firmware: Add firmware file for Intel Bluetooth,9260
>> f865934 linux-firmware: Update firmware file for Intel Bluetooth,8265
>> 7dab503 Merge branch 'for-upstream' of git://
>> git.chelsio.net/pub/git/linux-firmware
>> 0caed67 <http://git.chelsio.net/pub/git/linux-firmware0caed67> cxgb4:
>> update firmware to revision 1.19.1.0
>> 0783fb9 nfp: add symlink for mixed mode Agilio CX 2x25GbE cards
>> 380957e nfp: update Agilio SmartNIC flower firmware to rev 5701
>> b562d2f linux-firmware: update wil6210 firmware to 5.2.0.18
>> c1aa76a linux-firmware: rsi: update firmware images for Redpine 9113
>> chipset
>> 1621614 Merge tag 'iwlwifi-fw-2018-04-06' of git://
>> git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware
>> 50c1323
>> <http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware50c1323>
>> iwlwifi: update firmwares for 3160, 3168 and 7265
>> c711ea5 iwlwifi: add some new FW versions and update older ones
>> 8c1e439 amdgpu: update vce firmware for Polaris
>> 31accdf linux-firmware: Add firmware file for Intel Bluetooth,9560
>> 89139e8 linux-firmware: Add firmware file for Intel Bluetooth,9260
>> 58cdb52 linux-firmware: Update firmware file for Intel Bluetooth,8265
>> 9cb49be linux-firmware: Update firmware patch for Intel Bluetooth 8260
>> a3be6d4 Merge https://github.com/Netronome/linux-firmware into netro
>>
>> License-Update: new files and version update. Same terms.
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>
>>  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> index c96588473b..8d6f2f2dbd 100644
>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> @@ -118,7 +118,7 @@ LIC_FILES_CHKSUM = "\
>>      file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
>>      file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
>>      file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
>> -    file://WHENCE;md5=ec6f70c8a1104ff87f6aa144d926f0dd \
>> +    file://WHENCE;md5=6f46986f4e913ef16b765c2319cc5141 \
>>  "
>>
>>  # These are not common licenses, set NO_GENERIC_LICENSE for them
>> @@ -181,7 +181,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
>>  NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
>>  NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
>>
>> -SRCREV = "4c0bf113a55975d702673e57c5542f150807ad66"
>> +SRCREV = "8fc2d4e55685bf73b6f7752383da9067404a74bb"
>>  PE = "1"
>>  PV = "0.0+git${SRCPV}"
>>
>> --
>> 2.17.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--00000000000097edcb057168c345
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This happened again when this commit was backported to sum=
o yesterday, so now newer revision of oe-core sumo needs additional fix for=
 meta-raspberrypi:<div><a href=3D"https://github.com/agherzan/meta-raspberr=
ypi/pull/291">https://github.com/agherzan/meta-raspberrypi/pull/291</a><br>=
</div><div>this is quite unfortunate, so I&#39;m going to send=C2=A0<span s=
tyle=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">LIC_F=
ILES_CHKSUM addition to oe-core recipe before this spreads even more.</span=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Jun 22=
, 2018 at 5:24 PM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com=
">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div dir=3D"ltr">BTW: this breaks raspberrypi builds in interesting wa=
y, I&#39;ve sent PR with fix here:<div><a href=3D"https://github.com/agherz=
an/meta-raspberrypi/pull/272" target=3D"_blank">https://github.com/agherzan=
/meta-raspberrypi/pull/272</a></div><div><br></div><div>but maybe we can im=
prove this recipe a bit by including Firmware-cypress LIC_FILES_CHKSUM here=
 and leaving only more version agnostic changes in meta-raspberrypi bbappen=
d.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, May 2=
1, 2018 at 11:51 PM Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.=
com.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">8fc2d4e Merge git://<a href=3D"http://git.mar=
vell.com/mwifiex-firmware" rel=3D"noreferrer" target=3D"_blank">git.marvell=
.com/mwifiex-firmware</a><br>
e1abab6 linux-firmware: update Marvell USB8997 firmware image to add WPA2 v=
ulnerability fix<br>
c38c231 linux-firmware: update Marvell SD8897-B0 firmware image to add WPA2=
 vulnerability fix<br>
0686ec7 Merge branch &#39;firmware-update&#39; of <a href=3D"https://github=
.com/intel/opa-firmwarebb7f773" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/intel/opa-firmware<br>
bb7f773</a> Update Intel OPA hfi1 firmware<br>
397a604 qed: Add firmware 8.33.12.0<br>
40d4117 linux-firmware: Add firmware file for Intel Bluetooth,9560<br>
bf3934f linux-firmware: Add firmware file for Intel Bluetooth,9260<br>
f865934 linux-firmware: Update firmware file for Intel Bluetooth,8265<br>
7dab503 Merge branch &#39;for-upstream&#39; of git://<a href=3D"http://git.=
chelsio.net/pub/git/linux-firmware0caed67" rel=3D"noreferrer" target=3D"_bl=
ank">git.chelsio.net/pub/git/linux-firmware<br>
0caed67</a> cxgb4: update firmware to revision 1.19.1.0<br>
0783fb9 nfp: add symlink for mixed mode Agilio CX 2x25GbE cards<br>
380957e nfp: update Agilio SmartNIC flower firmware to rev 5701<br>
b562d2f linux-firmware: update wil6210 firmware to 5.2.0.18<br>
c1aa76a linux-firmware: rsi: update firmware images for Redpine 9113 chipse=
t<br>
1621614 Merge tag &#39;iwlwifi-fw-2018-04-06&#39; of git://<a href=3D"http:=
//git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware50c1323" re=
l=3D"noreferrer" target=3D"_blank">git.kernel.org/pub/scm/linux/kernel/git/=
iwlwifi/linux-firmware<br>
50c1323</a> iwlwifi: update firmwares for 3160, 3168 and 7265<br>
c711ea5 iwlwifi: add some new FW versions and update older ones<br>
8c1e439 amdgpu: update vce firmware for Polaris<br>
31accdf linux-firmware: Add firmware file for Intel Bluetooth,9560<br>
89139e8 linux-firmware: Add firmware file for Intel Bluetooth,9260<br>
58cdb52 linux-firmware: Update firmware file for Intel Bluetooth,8265<br>
9cb49be linux-firmware: Update firmware patch for Intel Bluetooth 8260<br>
a3be6d4 Merge <a href=3D"https://github.com/Netronome/linux-firmware" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/Netronome/linux-firmwa=
re</a> into netro<br>
<br>
License-Update: new files and version update. Same terms.<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
---<br>
<br>
=C2=A0meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a> | 4 +=
+--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-fir=
mware_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a=
> b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_git=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><br>
index c96588473b..8d6f2f2dbd 100644<br>
--- a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><br>
+++ b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><br>
@@ -118,7 +118,7 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://LICENCE.xc4000;md5=3D0ff51d2dc49fce04814c9155081=
092f0 \<br>
=C2=A0 =C2=A0 =C2=A0file://LICENCE.xc5000;md5=3D1e170c13175323c32c7f4d0998d=
53f66 \<br>
=C2=A0 =C2=A0 =C2=A0file://LICENCE.xc5000c;md5=3D12b02efa3049db65d524aeb418=
dd87ca \<br>
-=C2=A0 =C2=A0 file://WHENCE;md5=3Dec6f70c8a1104ff87f6aa144d926f0dd \<br>
+=C2=A0 =C2=A0 file://WHENCE;md5=3D6f46986f4e913ef16b765c2319cc5141 \<br>
=C2=A0&quot;<br>
<br>
=C2=A0# These are not common licenses, set NO_GENERIC_LICENSE for them<br>
@@ -181,7 +181,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] =3D &quot;LICENCE.x=
c5000&quot;<br>
=C2=A0NO_GENERIC_LICENSE[Firmware-xc5000c] =3D &quot;LICENCE.xc5000c&quot;<=
br>
=C2=A0NO_GENERIC_LICENSE[WHENCE] =3D &quot;WHENCE&quot;<br>
<br>
-SRCREV =3D &quot;4c0bf113a55975d702673e57c5542f150807ad66&quot;<br>
+SRCREV =3D &quot;8fc2d4e55685bf73b6f7752383da9067404a74bb&quot;<br>
=C2=A0PE =3D &quot;1&quot;<br>
=C2=A0PV =3D &quot;0.0+git${SRCPV}&quot;<br>
<br>
-- <br>
2.17.0<br>
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
</blockquote></div>

--00000000000097edcb057168c345--
