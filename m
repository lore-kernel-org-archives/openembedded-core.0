Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id C225C79404
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 16:56:12 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id v90-v6so2204462wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 09:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zWBsbqNfrdfkbqcTFHRd21gzOZ41czQFs0bf1Yt2UFg=;
	b=NczTLmPb5sKZ/6r6YBhfC1bPU8rp8VOe5wcl3ocgWpKu16ADjzHm4X4ozdRHx3mCaF
	Nh50ixhigOs9LG52NN1EVeDQzimmuROxyy1WBxhzLzQdrTM6WDi0XkTHKff/ttil3+aZ
	CKqCU/DAMZHZNwGzurVlMHgG9HX1vzQLsLQtngpQ173Pz1Ha7fekevwv8/bK6w4rxNFb
	yOHYbrPIPsZpzQZ/7ZUJZPod6Ab0fXv8eTwWi/ejz1BlFQJTS1Xxkzs7ZDYympqvkFt9
	ld+0/uZW1S60t0/a2TFJ8+DG/UxW+K4dN20mbwmE5K68rGpvwgb750Q3I9EshzXMQXlH
	WTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zWBsbqNfrdfkbqcTFHRd21gzOZ41czQFs0bf1Yt2UFg=;
	b=Tj/5yuRdNwOm5ldISQ88KqM3p3zGY/1gGzvenHObYAObpXvs8lMs1WGjawWb/1bC0v
	QtNStRHJPpgudgiqHMmM56PhhGBXw1D8fuzCLydX3sCYoxBpaVmrn4YHyhXOpAHZEjqi
	H5zIjQbowSbsF5Q1TSgQXlfuDunJqBzdLXgnI9J+5FYBqvF4xuL3n4EmvorfLm+4Ke3P
	6tCd83Xmdwvb3VxxML2a3ZnEbv6+whZ581qQ4hIXysVsBZzRCpu7AsIsrKS3JIq6936T
	Q5jiVM9KpNEqSNK3l7KABVdAfjrXvx+fbVLlRAGiIr6f1Rd7eyiLrY1opyFnmEXqbUqG
	Glpg==
X-Gm-Message-State: AOUpUlFYv2Ek17/KFA55/sV45lf10pbrisWscWPBVbNVMLWDciyOSWi4
	EIPX86kbRum+AcKwBZDVVFHSdSAmSNe+rFeZIig=
X-Google-Smtp-Source: ANB0Vda6MuMS21SOQ3nf0MANFbOQRoYytb8iGicI60c8G9rpKo7YI4bhenLF2G3gF5uujlU894rPOBvFBPTs0ZH8lP0=
X-Received: by 2002:adf:8567:: with SMTP id
	94-v6mr15149718wrh.223.1534956973490; 
	Wed, 22 Aug 2018 09:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
	<CAD0U-hLEPce-+gJcBcqQHFPkiHr1CPBEvaM6s1f1VTkEzpNnfQ@mail.gmail.com>
In-Reply-To: <CAD0U-hLEPce-+gJcBcqQHFPkiHr1CPBEvaM6s1f1VTkEzpNnfQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 22 Aug 2018 18:56:06 +0200
Message-ID: <CA+chaQezPDFAP1L0NYCaoFDjPfriUt3_wh9QKTaa0ZwWBHtKYQ@mail.gmail.com>
To: ryan.harkin@linaro.org
Cc: daiane.angolini@nxp.com, patches@linaro.org,
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
X-List-Received-Date: Wed, 22 Aug 2018 16:56:13 -0000
Content-Type: multipart/alternative; boundary="0000000000002685ba0574090580"

--0000000000002685ba0574090580
Content-Type: text/plain; charset="UTF-8"

cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt

is the same as

ln -sf brcmfmac43430-sdio.AP6212.txt ${D}${nonarch_base_libdir}/fir
mware/brcm/brcmfmac43430-sdio.txt

On Wed, Aug 22, 2018 at 6:47 PM Ryan Harkin <ryan.harkin@linaro.org> wrote:

>
>
> On 22 August 2018 at 17:41, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> The "cd ${D}${nonarch_base_libdir}/firmware/brcm/" doesn't seem to be
>> needed, just include the path in 2nd ln parameter.
>>
>
> I don't think that works, or at least, it doesn't work for me, so I may be
> doing something wrong. I'm also copying the example used in the
> do_install() a few lines up as I figured that would be the preferred style
> for this recipe.
>
>
>> On Wed, Aug 22, 2018 at 6:30 PM Ryan Harkin <ryan.harkin@linaro.org>
>> wrote:
>>
>>> The Linux kernel currently expects a single NVRAM file for BCM43430
>>> named brcmfmac43430-sdio.txt.
>>>
>>> Allow the machine to specify an override to link its module specific
>>> NVRAM to the filename expected by the kernel.
>>>
>>> Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
>>> ---
>>>  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 12
>>> ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>> b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>> index 8c54f28..b647abc 100644
>>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>> @@ -226,6 +226,18 @@ do_install() {
>>>         ( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf
>>> ti-connectivity/* . )
>>>  }
>>>
>>> +# Adding bcm43430-nvram-{module type} to MACHINEOVERRIDES will create a
>>> +# softlink for the module specific NVRAM file to the filename expected
>>> +# by the Linux kernel
>>> +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-mur1dx = "
>>> ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
>>> +do_install_append_bcm43430-nvram-mur1dx() {
>>> +       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
>>> brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)
>>> +}
>>> +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-ap6212 =
>>> "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
>>> +do_install_append_bcm43430-nvram-ap6212() {
>>> +       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
>>> brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt)
>>> +}
>>> +
>>>
>>>  PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
>>>               ${PN}-mt7601u-license ${PN}-mt7601u \
>>> --
>>> 2.7.4
>>>
>>>
>

--0000000000002685ba0574090580
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(80,0,80)">cd ${D}${nonarch_base_l=
ibdir}/fir</span><span style=3D"color:rgb(80,0,80)">mware/brcm/ ; ln -sf br=
cmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt</span><br><div><span sty=
le=3D"color:rgb(80,0,80)"><br></span></div><div><span style=3D"color:rgb(80=
,0,80)">is the same as</span></div><div><span style=3D"color:rgb(80,0,80)">=
<br></span></div><div><span style=3D"color:rgb(80,0,80)">ln -sf=C2=A0</span=
><span style=3D"color:rgb(80,0,80)">brcmfmac43430-sdio.AP6212.txt=C2=A0</sp=
an><span style=3D"color:rgb(80,0,80)">${D}${nonarch_base_libdir}/fir</span>=
<span style=3D"color:rgb(80,0,80)">mware/brcm/</span><span style=3D"color:r=
gb(80,0,80)">brcmfmac43430-sdio.txt</span></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr">On Wed, Aug 22, 2018 at 6:47 PM Ryan Harkin &lt;=
<a href=3D"mailto:ryan.harkin@linaro.org">ryan.harkin@linaro.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote">On 22 August 2018 at 17:41=
, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.c=
om" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div dir=3D"ltr">The &quot;cd ${D}${nonarch_base_=
libdir}/firmware/brcm/&quot; doesn&#39;t seem to be needed, just include th=
e path in 2nd ln parameter.</div></blockquote><div><br></div><div>I don&#39=
;t think that works, or at least, it doesn&#39;t work for me, so I may be d=
oing something wrong. I&#39;m also copying the example used in the do_insta=
ll() a few lines up as I figured that would be the preferred style for this=
 recipe.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"m=
_-6311599830852990523HOEnZb"><div class=3D"m_-6311599830852990523h5"><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Aug 22, 2018 at 6:30 PM R=
yan Harkin &lt;<a href=3D"mailto:ryan.harkin@linaro.org" target=3D"_blank">=
ryan.harkin@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">The Linux kernel currently expects a single NVRAM file for BCM43430<br>
named brcmfmac43430-sdio.txt.<br>
<br>
Allow the machine to specify an override to link its module specific<br>
NVRAM to the filename expected by the kernel.<br>
<br>
Signed-off-by: Ryan Harkin &lt;<a href=3D"mailto:ryan.harkin@linaro.org" ta=
rget=3D"_blank">ryan.harkin@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a> | 12 =
++++++++++++<br>
=C2=A01 file changed, 12 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-fir=
mware_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a=
> b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_git=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><br>
index 8c54f28..b647abc 100644<br>
--- a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><br>
+++ b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><br>
@@ -226,6 +226,18 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ( cd ${D}${nonarch_base_libdir}/firmware ; ln -=
sf ti-connectivity/* . )<br>
=C2=A0}<br>
<br>
+# Adding bcm43430-nvram-{module type} to MACHINEOVERRIDES will create a<br=
>
+# softlink for the module specific NVRAM file to the filename expected<br>
+# by the Linux kernel<br>
+FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-mur1dx =3D &quot; ${nonar=
ch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt&quot;<br>
+do_install_append_bcm43430-nvram-mur1dx() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0( cd ${D}${nonarch_base_libdir}/firmware/brcm/ =
; ln -sf brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)<br>
+}<br>
+FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-ap6212 =3D &quot;${nonarc=
h_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt&quot;<br>
+do_install_append_bcm43430-nvram-ap6212() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0( cd ${D}${nonarch_base_libdir}/firmware/brcm/ =
; ln -sf brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt)<br>
+}<br>
+<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-ralink-license ${PN}-ralink \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-mt7601u-license ${PN=
}-mt7601u \<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div>
</div></div></blockquote></div><br></div></div>
</blockquote></div>

--0000000000002685ba0574090580--
