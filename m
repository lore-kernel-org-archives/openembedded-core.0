Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id DF00B74E53
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 15:24:48 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id n5-v6so3042901wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tjM+8DfxoVAutUsS21ZszcP/eamneGyf+Bg8C/fLp0M=;
	b=fj1FbG9952zsIrvU84Sg3OCpJPtmpoBzbkEy6oF8CmjUCnGVkUXllIcSapjk/YOHMa
	P/DTkDyIPgCd4YF9dil7r0AdhpE9CGCATzgbPu1xAOJY4Ql02CBH0p9OGT3U4oPEL/r1
	cwcvIwlWsu9o5Yu7WSWOa95bTgTPeneEWYpMui2riyWsQA0hAw0Iu8fQMuRNh1tDO3ri
	eGzie/VQyr0idL35+wi8UGw0VwIqoshTHrQpadNLWcfJZKhEjTX83r5BIGR66PzJBUfj
	HqF4zpwivmMCoiwanzJS82DqKwMrY7wpyaH+5qTIbbPd0nfP1FMV0RmpGZeun+AysY9m
	IMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tjM+8DfxoVAutUsS21ZszcP/eamneGyf+Bg8C/fLp0M=;
	b=U4PwkIcUVSomImODa+kScsRs+kKLbE6U9pa74e6tObqmInP8Bk3JF6asPShTa4cqCR
	0400OHpCDIcPOoIcbiMTEeMBJ1LfncjA+FAZQyAQZppV2iS8QwFKqYNrfJLT5fh9QK0h
	vZ6RoqV9J0yeYMxIPB68Km88KNqbRWnuAilTv1Ewrx5nN+WGTpXY61UylIQ3C4dX6gFY
	COzNVF/m8hyn70qMMcihmhPpausasVedtee7OomawThJUL7/XlZ7LKUAKzxdbnSHStA4
	CayNt15EvxoatvXmljXTftHYiS4f8Tbc6E6267d+Q5kVyzkrXwdR/3ioR8Kq5dnC2ycB
	idxA==
X-Gm-Message-State: APt69E16d6rdwNuROOWb7sQaAXzRYN8UtcCSvnnJnK3+ebVAOBZr82Lw
	Eq0OsJ83Cr3h8egWsy7bJlDv1qLr9wdPX0cGILEa/A==
X-Google-Smtp-Source: AAOMgpcZ5dLg/8+YtV2hkbLHqtQ3RehJlb8qXp7zPPcf2tn7LS0SAVPaQTQpzCEy6T60mMj5oc7doOxE1m2VrG6GTLg=
X-Received: by 2002:a1c:1c09:: with SMTP id c9-v6mr105850wmc.79.1529681089550; 
	Fri, 22 Jun 2018 08:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20180521215050.30322-1-otavio@ossystems.com.br>
In-Reply-To: <20180521215050.30322-1-otavio@ossystems.com.br>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 22 Jun 2018 17:24:38 +0200
Message-ID: <CA+chaQdrQKjrLbMwwkNx-dEtO+zQzQHB7D=+-w6P=AobKK2iYg@mail.gmail.com>
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
X-List-Received-Date: Fri, 22 Jun 2018 15:24:49 -0000
Content-Type: multipart/alternative; boundary="000000000000f65f04056f3ca140"

--000000000000f65f04056f3ca140
Content-Type: text/plain; charset="UTF-8"

BTW: this breaks raspberrypi builds in interesting way, I've sent PR with
fix here:
https://github.com/agherzan/meta-raspberrypi/pull/272

but maybe we can improve this recipe a bit by including Firmware-cypress
LIC_FILES_CHKSUM here and leaving only more version agnostic changes in
meta-raspberrypi bbappend.

On Mon, May 21, 2018 at 11:51 PM Otavio Salvador <otavio@ossystems.com.br>
wrote:

> 8fc2d4e Merge git://git.marvell.com/mwifiex-firmware
> e1abab6 linux-firmware: update Marvell USB8997 firmware image to add WPA2
> vulnerability fix
> c38c231 linux-firmware: update Marvell SD8897-B0 firmware image to add
> WPA2 vulnerability fix
> 0686ec7 Merge branch 'firmware-update' of
> https://github.com/intel/opa-firmware
> bb7f773 <https://github.com/intel/opa-firmwarebb7f773> Update Intel OPA
> hfi1 firmware
> 397a604 qed: Add firmware 8.33.12.0
> 40d4117 linux-firmware: Add firmware file for Intel Bluetooth,9560
> bf3934f linux-firmware: Add firmware file for Intel Bluetooth,9260
> f865934 linux-firmware: Update firmware file for Intel Bluetooth,8265
> 7dab503 Merge branch 'for-upstream' of git://
> git.chelsio.net/pub/git/linux-firmware
> 0caed67 <http://git.chelsio.net/pub/git/linux-firmware0caed67> cxgb4:
> update firmware to revision 1.19.1.0
> 0783fb9 nfp: add symlink for mixed mode Agilio CX 2x25GbE cards
> 380957e nfp: update Agilio SmartNIC flower firmware to rev 5701
> b562d2f linux-firmware: update wil6210 firmware to 5.2.0.18
> c1aa76a linux-firmware: rsi: update firmware images for Redpine 9113
> chipset
> 1621614 Merge tag 'iwlwifi-fw-2018-04-06' of git://
> git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware
> 50c1323
> <http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware50c1323>
> iwlwifi: update firmwares for 3160, 3168 and 7265
> c711ea5 iwlwifi: add some new FW versions and update older ones
> 8c1e439 amdgpu: update vce firmware for Polaris
> 31accdf linux-firmware: Add firmware file for Intel Bluetooth,9560
> 89139e8 linux-firmware: Add firmware file for Intel Bluetooth,9260
> 58cdb52 linux-firmware: Update firmware file for Intel Bluetooth,8265
> 9cb49be linux-firmware: Update firmware patch for Intel Bluetooth 8260
> a3be6d4 Merge https://github.com/Netronome/linux-firmware into netro
>
> License-Update: new files and version update. Same terms.
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index c96588473b..8d6f2f2dbd 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -118,7 +118,7 @@ LIC_FILES_CHKSUM = "\
>      file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
>      file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
>      file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
> -    file://WHENCE;md5=ec6f70c8a1104ff87f6aa144d926f0dd \
> +    file://WHENCE;md5=6f46986f4e913ef16b765c2319cc5141 \
>  "
>
>  # These are not common licenses, set NO_GENERIC_LICENSE for them
> @@ -181,7 +181,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
>  NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
>  NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
>
> -SRCREV = "4c0bf113a55975d702673e57c5542f150807ad66"
> +SRCREV = "8fc2d4e55685bf73b6f7752383da9067404a74bb"
>  PE = "1"
>  PV = "0.0+git${SRCPV}"
>
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000f65f04056f3ca140
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">BTW: this breaks raspberrypi builds in interesting way, I&=
#39;ve sent PR with fix here:<div><a href=3D"https://github.com/agherzan/me=
ta-raspberrypi/pull/272">https://github.com/agherzan/meta-raspberrypi/pull/=
272</a></div><div><br></div><div>but maybe we can improve this recipe a bit=
 by including Firmware-cypress LIC_FILES_CHKSUM here and leaving only more =
version agnostic changes in meta-raspberrypi bbappend.</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr">On Mon, May 21, 2018 at 11:51 PM Ota=
vio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossystem=
s.com.br</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">8fc2d4e Mer=
ge git://<a href=3D"http://git.marvell.com/mwifiex-firmware" rel=3D"norefer=
rer" target=3D"_blank">git.marvell.com/mwifiex-firmware</a><br>
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

--000000000000f65f04056f3ca140--
