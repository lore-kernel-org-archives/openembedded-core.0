Return-Path: <ryan.harkin@linaro.org>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id E07287951D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:15:03 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id f8-v6so3490981ljk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 01:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZWYPDl3l63SwA7EUwaWGxU49iJuBFDxBBiMgF7HyXdA=;
	b=RfL1CFMkH1D2tPZ3caG9d1KLce7sDrfjwLz+bs1lGtD5DR00nN4JthRcuflmlcjfJ0
	1pipRh3rShAe3H4DyF+L4IXBBzYxYoyKLkK1Je/NSPajTGJryYisW3NkeXUlKpKCFh4l
	jEP7/fzWaizkQLCt3dQ/WdXQ4hVET75dI6r7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZWYPDl3l63SwA7EUwaWGxU49iJuBFDxBBiMgF7HyXdA=;
	b=ukqhM7KWJWr1WmvEK2TTr/EuZ6Tm4DJihGZZ7mQbgr4mJyC2HGjJL/eT04Kx7y8RwW
	LQQL5jmcxnv2iPVW7tsRMrpoOplG0H9j14IKAIY8vt23pIdaAvPURF4ZPbppBrjrfEc1
	NY134wIaH2TXWVJj3gN6v7q2lP2cMQoh6gttRwm37t7iQVwIKHhVQeGVBbwS3obKkrSp
	/HTZ9Vl6qQzHIkT43RHcKewplvwWBu76V3un4gRVRGPvIlqEglt62It+9+nMnwPyRRd5
	fjm8dHWjqNwyeGl67nqm86KfHwQ/aEi/3Vf4dUJWi4IQuhmHdYNEhqDOdD9sA68HN6Sr
	RfWg==
X-Gm-Message-State: APzg51BV1cyD3uxDS6ssjiY8etL08c1OhmAZwYoPP/AwsR7G+Go3J2O6
	bc9S2Aomlgj2sWpqcAMrEOedbYdxGuoW/UuPGOTOMw==
X-Google-Smtp-Source: ANB0VdZsuD9/DCBu9EGQpYPbulED9QNW+kJ0nMLdnoR/M105ZqEi46s1IVjJmsbiJrcZl+fW6i/WAXxUKAbeSEjG+2I=
X-Received: by 2002:a2e:9791:: with SMTP id
	y17-v6mr1576245lji.41.1535012104432; 
	Thu, 23 Aug 2018 01:15:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:1bc7:0:0:0:0:0 with HTTP; Thu, 23 Aug 2018 01:15:03
	-0700 (PDT)
In-Reply-To: <CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Thu, 23 Aug 2018 09:15:03 +0100
Message-ID: <CAD0U-h+BwzZg=gZtvVTneykKZb9k+UwgkR9Lt8jjo7Kvbj60Hw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: daiane.angolini@nxp.com, Patch Tracking <patches@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 3/3] linux-firmware: MACHINEOVERRIDES for BCM43430 NVRAM
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
X-List-Received-Date: Thu, 23 Aug 2018 08:15:04 -0000
Content-Type: multipart/alternative; boundary="000000000000360319057415dbfd"

--000000000000360319057415dbfd
Content-Type: text/plain; charset="UTF-8"

On 22 August 2018 at 17:41, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> The "cd ${D}${nonarch_base_libdir}/firmware/brcm/" doesn't seem to be
needed, just include the path in 2nd ln parameter.

Thanks Martin, and sorry for being so dumb. I'll send another series at
some point, but for now, the patch looks like this:

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 8c54f28..70d4f6a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -226,6 +226,18 @@ do_install() {
        ( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf ti-connectivity/*
. )
 }

+# Adding bcm43430-nvram-{module type} to MACHINEOVERRIDES will create a
+# softlink for the module specific NVRAM file to the filename expected
+# by the Linux kernel
+FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-mur1dx = "
${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
+do_install_append_bcm43430-nvram-mur1dx() {
+       ln -sf brcmfmac43430-sdio.MUR1DX.txt
${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt
+}
+FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-ap6212 =
"${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
+do_install_append_bcm43430-nvram-ap6212() {
+       ln -sf brcmfmac43430-sdio.AP6212.txt
${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt
+}
+

So now the ln issue is resolved, I'm not convinced my MACHINEOVERRIDES is
the correct approach. Does anyone have any feedback on how I can improve
that?

As per my cover letter, I originally wanted to be able to provide a
MACHINE_EXTRA_RRECOMMENDS, or similar, but I'm not familiar with how to get
an _append to apply based on that variable, unless I tested it incorrectly
(again).

If I add, say, "linux-firmware-bcm43430-nvram-mur1dx" to
MACHINE_EXTRA_RRECOMMENDS,
should this work:

+FILES_${PN}-bcm43430-nvram_append_${PN}-bcm43430-nvram-mur1dx = "
${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
+do_install_append_${PN}-bcm43430-nvram-mur1dx() {
+       ln -sf brcmfmac43430-sdio.MUR1DX.txt
${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt
+}

Or is there a better way of achieving this?


>
>
> On Wed, Aug 22, 2018 at 6:30 PM Ryan Harkin <ryan.harkin@linaro.org>
wrote:
>>
>> The Linux kernel currently expects a single NVRAM file for BCM43430
>> named brcmfmac43430-sdio.txt.
>>
>> Allow the machine to specify an override to link its module specific
>> NVRAM to the filename expected by the kernel.
>>
>> Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
>> ---
>>  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 12
++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> index 8c54f28..b647abc 100644
>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> @@ -226,6 +226,18 @@ do_install() {
>>         ( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf
ti-connectivity/* . )
>>  }
>>
>> +# Adding bcm43430-nvram-{module type} to MACHINEOVERRIDES will create a
>> +# softlink for the module specific NVRAM file to the filename expected
>> +# by the Linux kernel
>> +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-mur1dx = "
${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
>> +do_install_append_bcm43430-nvram-mur1dx() {
>> +       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)
>> +}
>> +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-ap6212 =
"${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
>> +do_install_append_bcm43430-nvram-ap6212() {
>> +       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt)
>> +}
>> +
>>
>>  PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
>>               ${PN}-mt7601u-license ${PN}-mt7601u \
>> --
>> 2.7.4
>>

--000000000000360319057415dbfd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On 22 August 2018 at 17:41, Martin Jansa &lt;<a hr=
ef=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<=
br>&gt;<br>&gt; The &quot;cd ${D}${nonarch_base_libdir}/firmware/brcm/&quot=
; doesn&#39;t seem to be needed, just include the path in 2nd ln parameter.=
<br><br>Thanks Martin, and sorry for being so dumb. I&#39;ll send another s=
eries at some point, but for now, the patch looks like this:<br><br>diff --=
git a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_g=
it.bb">linux-firmware_git.bb</a> b/meta/recipes-kernel/linux-firmware/<a hr=
ef=3D"http://linux-firmware_git.bb">linux-firmware_git.bb</a><br>index 8c54=
f28..70d4f6a 100644<br>--- a/meta/recipes-kernel/linux-firmware/<a href=3D"=
http://linux-firmware_git.bb">linux-firmware_git.bb</a><br>+++ b/meta/recip=
es-kernel/linux-firmware/<a href=3D"http://linux-firmware_git.bb">linux-fir=
mware_git.bb</a><br>@@ -226,6 +226,18 @@ do_install() {<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf ti-connecti=
vity/* . )<br>=C2=A0}<br>=C2=A0<br>+# Adding bcm43430-nvram-{module type} t=
o MACHINEOVERRIDES will create a<br>+# softlink for the module specific NVR=
AM file to the filename expected<br>+# by the Linux kernel<br>+FILES_${PN}-=
bcm43430-nvram_append_bcm43430-nvram-mur1dx =3D &quot; ${nonarch_base_libdi=
r}/firmware/brcm/brcmfmac43430-sdio.txt&quot;<br>+do_install_append_bcm4343=
0-nvram-mur1dx() {<br>+ =C2=A0 =C2=A0 =C2=A0 ln -sf brcmfmac43430-sdio.MUR1=
DX.txt ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt<br>+=
}<br>+FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-ap6212 =3D &quot;${n=
onarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt&quot;<br>+do_insta=
ll_append_bcm43430-nvram-ap6212() {<br>+ =C2=A0 =C2=A0 =C2=A0 ln -sf brcmfm=
ac43430-sdio.AP6212.txt ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43=
430-sdio.txt<br>+}<br>+<br><br>So now the ln issue is resolved, I&#39;m not=
 convinced my MACHINEOVERRIDES is the correct approach. Does anyone have an=
y feedback on how I can improve that?<br><br>As per my cover letter, I orig=
inally wanted to be able to provide a MACHINE_EXTRA_RRECOMMENDS, or similar=
, but I&#39;m not familiar with how to get an _append to apply based on tha=
t variable, unless I tested it incorrectly (again).<div><br></div><div>If I=
 add, say, &quot;linux-firmware-bcm43430-nvram-mur1dx&quot; to=C2=A0<span s=
tyle=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">MACHI=
NE_EXTRA_RRECOMMENDS, should this work:</span></div><div><br></div><div><sp=
an style=3D"font-size:small;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline">+=
FILES_${PN}-bcm43430-nvram_append_${PN}-bcm43430-nvram-mur1dx =3D &quot; ${=
nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt&quot;</span><br s=
tyle=3D"font-size:small;text-decoration-style:initial;text-decoration-color=
:initial"><span style=3D"font-size:small;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">+do_install_append_${PN}-bcm43430-nvram-mur1dx() {</span><br st=
yle=3D"font-size:small;text-decoration-style:initial;text-decoration-color:=
initial"><span style=3D"font-size:small;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">+ =C2=A0 =C2=A0 =C2=A0 ln -sf brcmfmac43430-sdio.MUR1DX.txt ${D}=
${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt</span><br style=
=3D"font-size:small;text-decoration-style:initial;text-decoration-color:ini=
tial"><span style=3D"font-size:small;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline">+}</span><br>=C2=A0</div><div>Or is there a better way of achieving=
 this?</div><div><br></div><div><br>&gt;<br>&gt;<br>&gt; On Wed, Aug 22, 20=
18 at 6:30 PM Ryan Harkin &lt;<a href=3D"mailto:ryan.harkin@linaro.org">rya=
n.harkin@linaro.org</a>&gt; wrote:<br>&gt;&gt;<br>&gt;&gt; The Linux kernel=
 currently expects a single NVRAM file for BCM43430<br>&gt;&gt; named brcmf=
mac43430-sdio.txt.<br>&gt;&gt;<br>&gt;&gt; Allow the machine to specify an =
override to link its module specific<br>&gt;&gt; NVRAM to the filename expe=
cted by the kernel.<br>&gt;&gt;<br>&gt;&gt; Signed-off-by: Ryan Harkin &lt;=
<a href=3D"mailto:ryan.harkin@linaro.org">ryan.harkin@linaro.org</a>&gt;<br=
>&gt;&gt; ---<br>&gt;&gt; =C2=A0meta/recipes-kernel/linux-firmware/<a href=
=3D"http://linux-firmware_git.bb">linux-firmware_git.bb</a> | 12 ++++++++++=
++<br>&gt;&gt; =C2=A01 file changed, 12 insertions(+)<br>&gt;&gt;<br>&gt;&g=
t; diff --git a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-=
firmware_git.bb">linux-firmware_git.bb</a> b/meta/recipes-kernel/linux-firm=
ware/<a href=3D"http://linux-firmware_git.bb">linux-firmware_git.bb</a><br>=
&gt;&gt; index 8c54f28..b647abc 100644<br>&gt;&gt; --- a/meta/recipes-kerne=
l/linux-firmware/<a href=3D"http://linux-firmware_git.bb">linux-firmware_gi=
t.bb</a><br>&gt;&gt; +++ b/meta/recipes-kernel/linux-firmware/<a href=3D"ht=
tp://linux-firmware_git.bb">linux-firmware_git.bb</a><br>&gt;&gt; @@ -226,6=
 +226,18 @@ do_install() {<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 ( cd ${D=
}${nonarch_base_libdir}/firmware ; ln -sf ti-connectivity/* . )<br>&gt;&gt;=
 =C2=A0}<br>&gt;&gt;<br>&gt;&gt; +# Adding bcm43430-nvram-{module type} to =
MACHINEOVERRIDES will create a<br>&gt;&gt; +# softlink for the module speci=
fic NVRAM file to the filename expected<br>&gt;&gt; +# by the Linux kernel<=
br>&gt;&gt; +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-mur1dx =3D &q=
uot; ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt&quot;<br>&=
gt;&gt; +do_install_append_bcm43430-nvram-mur1dx() {<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf brcmf=
mac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)<br>&gt;&gt; +}<br>&gt;&gt;=
 +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-ap6212 =3D &quot;${nonar=
ch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt&quot;<br>&gt;&gt; +do_=
install_append_bcm43430-nvram-ap6212() {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0=
 ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf brcmfmac43430-sdio=
.AP6212.txt brcmfmac43430-sdio.txt)<br>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt=
;<br>&gt;&gt; =C2=A0PACKAGES =3D+ &quot;${PN}-ralink-license ${PN}-ralink \=
<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-mt7601u=
-license ${PN}-mt7601u \<br>&gt;&gt; --<br>&gt;&gt; 2.7.4<br>&gt;&gt;<br></=
div></div>

--000000000000360319057415dbfd--
