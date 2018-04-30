Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 59B6D6022F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 13:26:30 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id j4so13173488wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 06:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8RMCXysCU3+6rgGYP5B275dLr5E0CB28Fxdxk3rOq5s=;
	b=lbjlrnx05O3n0KVwej06HOVTxSO/nXPg5qC1cTZieSpUW3ebUg/4xGygt5OXxM35H1
	B589REXmoInIP6CjMEufO5pIQZ0Ph5bQ6Au1UoLxElUT6lcuEtyad59moxakhoKbbWkf
	4KcWxUMGo7aBhb6LztBjIvJ73NYw+StaCZpukELF8N9J4aPZKscntKAewR747vq/p908
	oDCGBzBKkYwNxl19QKQ5sTCHKAas5M/PS0oDu/ypLJS0P9mNph5LOw3wiQU/JxhfR0IX
	ic6/EwwDlBejo6cmmqug5tv/rGDFh4CsHKiyn+07tTwJqm83YrnuszuxqFJ+l0mKebXw
	uYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8RMCXysCU3+6rgGYP5B275dLr5E0CB28Fxdxk3rOq5s=;
	b=W0QM5CiApRVjWXIfMt7UP+6d7ZlYXER+kOuBAH1JfyVCVxjtq1U3U3uOyYTv4I7KFu
	sWvhpiKAU+8cuPSJ6CvMD34g+y0IrBBCdxe5YWUJHzzd4bpiMM5EwQMMhUKaHGYbQKt9
	Ky/pCjY8qW1IjafKR+8+gSuLbg4KCAV+JIJcG74OEcswJz5b+Q+fMPWftLeMrMfzZpwt
	JwyKWe3oLYTPZaWxW5rCowGC81I4H8psw8T7CUx4CERunjH3oEMUmU+cgWMuJrbVUHS2
	WB3srZFgkhPoDkiJfLKqhjZrUNj3xK4a/BwwQ8hApO3E60r0G8dWYoygGrjdbfqQWmiv
	A4ew==
X-Gm-Message-State: ALQs6tAwY4kCu6RJddtpymJtw00hfyUR5pq5MPb1i67Zvaak8yZi1VRG
	WwIJS600xSguns7OvP3g2YWpiz0ccxsZEoQlQKU=
X-Google-Smtp-Source: AB8JxZpqH5p5LVy68X6cKwpzEIhKdcirVYUwaY8VIgvWnBfrvvutwDZEt99fJ0AXvkLCA9++GW3pfX+T+XBCxIXG9uw=
X-Received: by 10.28.66.73 with SMTP id p70mr7543920wma.17.1525094790878; Mon,
	30 Apr 2018 06:26:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Mon, 30 Apr 2018 06:26:30 -0700 (PDT)
In-Reply-To: <CA+chaQf_r6ytw5VR3m4RgctcGpwmfxG=Q5NfvSgJCeB3tL4MQw@mail.gmail.com>
References: <20180427145139.30732-1-lukma@denx.de>
	<69bd71c5-a14a-2687-3f5d-52083043a131@prevas.dk>
	<CA+chaQf_r6ytw5VR3m4RgctcGpwmfxG=Q5NfvSgJCeB3tL4MQw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 30 Apr 2018 15:26:30 +0200
Message-ID: <CA+chaQdBDAXRA9i=eH67qTRK-cGZbtrNNEWN9XWkEyEF5b7xow@mail.gmail.com>
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <mnhu@prevas.dk>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	Stefan Agner <stefan.agner@toradex.com>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Add {gen|deploy}_default_envs tasks to generate environment images
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
X-List-Received-Date: Mon, 30 Apr 2018 13:26:30 -0000
Content-Type: multipart/alternative; boundary="94eb2c070a54425ab9056b10cd47"

--94eb2c070a54425ab9056b10cd47
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

And here is example how we're using it:

https://github.com/webosose/meta-webosose/blob/master/meta-webos-raspberryp=
i/recipes-bsp/u-boot/u-boot-env.bb

To make it compatible with raspberrypi3 and raspberrypi3-64, I've updated
it a bit to select correct IMAGETYPE and BOOTCMD based on the environment:

do_compile() {
    sed -e 's/@@KERNEL_IMAGETYPE@@/${KERNEL_IMAGETYPE}/' \
        -e 's/@@KERNEL_BOOTCMD@@/${KERNEL_BOOTCMD}/' \
        "${WORKDIR}/uboot-env.txt.in" > "${WORKDIR}/uboot-env.txt"
    uboot-mkenvimage -s 16384 -o uboot.env ${WORKDIR}/uboot-env.txt
}


On Mon, Apr 30, 2018 at 3:23 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> u-boot-mkimage already builds mkenvimage, you just need to install it in
> do_install:
>
>     install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
>     ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
>
> This is what we have in recipes-bsp/u-boot/u-boot-mkimage_%.bbappend and
> it works fine.
>
> On Mon, Apr 30, 2018 at 8:50 AM, Martin Hundeb=C3=B8ll <mnhu@prevas.dk> w=
rote:
>
>> Hi Lukasz,
>>
>> On 2018-04-27 16:51, Lukasz Majewski wrote:
>>
>>> This commit provides the ability to generate u-boot environment(s) as
>>> images, which afterwards can be used to produce image (with wic) for
>>> flashing (eMMC or SPI-NOR).
>>>
>>> This change removes the need to run "env default" during production
>>> phase,
>>> as proper environment (including redundant one) is already stored on
>>> persistent memory (the CRC is also correct).
>>>
>>
>> I think we should create a separate recipe to install the native
>> mkenvimage binary (e.g. u-boot-mkenvimage_%.bb) or update
>> u-boot-mkimage_%.bb install it.
>>
>> Then a new recipe to create the environment images can depend on
>> u-boot-mkenvimage-native.
>>
>> Also note the recently added upstream support for external environment
>> definitions:
>> http://git.denx.de/?p=3Du-boot.git;a=3Dcommit;h=3Df3d8f7dd73ac5dde
>> 258eb786d4a01869395b56d7
>>
>> For our usecase we need the ability to generate environment images in
>> yocto from such external definitions.
>>
>> // Martin
>>
>>
>>> Signed-off-by: Lukasz Majewski <lukma@denx.de>
>>>
>>> ---
>>> This patch depends on "u-boot: Upgrade to 2018.03 release"
>>> https://patchwork.openembedded.org/patch/149998/
>>> ---
>>>   meta/recipes-bsp/u-boot/u-boot.inc | 35 +++++++++++++++++++++++++++++=
+
>>> +++++
>>>   1 file changed, 35 insertions(+)
>>>
>>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
>>> b/meta/recipes-bsp/u-boot/u-boot.inc
>>> index c2bcf99840..2796e503cf 100644
>>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
>>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>>> @@ -305,3 +305,38 @@ do_deploy () {
>>>   }
>>>     addtask deploy before do_build after do_compile
>>> +
>>> +# Create new rules to extract default envs
>>> +UBOOT_ENVS_DEFAULT ?=3D "uboot-envs-default"
>>> +DEFAULT_ENVS ?=3D "u-boot-env-default.txt"
>>> +DEFAULT_ENVS_SIZE ?=3D "65536"
>>> +
>>> +# Generate default environment
>>> +do_gen_default_envs[doc] =3D "Generate image with default U-Boot
>>> environment(s)"
>>> +do_gen_default_envs () {
>>> +       ${B}/source/scripts/get_default_envs.sh ${B} >
>>> ${B}/${DEFAULT_ENVS}
>>> +
>>> +       # Generate env image
>>> +       ${B}/tools/mkenvimage -s ${DEFAULT_ENVS_SIZE} -o
>>> ${B}/${UBOOT_ENVS_DEFAULT} ${B}/${DEFAULT_ENVS}
>>> +
>>> +       # Generate redundant env image
>>> +       ${B}/tools/mkenvimage -r -s ${DEFAULT_ENVS_SIZE} -o
>>> ${B}/${UBOOT_ENVS_DEFAULT}_r ${B}/${DEFAULT_ENVS}
>>> +
>>> +       rm ${B}/${DEFAULT_ENVS}
>>> +}
>>> +
>>> +addtask gen_default_envs before do_deploy_default_envs after do_compil=
e
>>> +
>>> +# Deploy default environment
>>> +do_deploy_default_envs[doc] =3D "Copy images with default U-Boot
>>> environment to deployment directory"
>>> +do_deploy_default_envs () {
>>> +       install -d ${DEPLOYDIR}
>>> +
>>> +       install ${B}/${UBOOT_ENVS_DEFAULT} ${DEPLOYDIR}/${UBOOT_ENVS_DE=
FA
>>> ULT}
>>> +       install ${B}/${UBOOT_ENVS_DEFAULT}_r
>>> ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}_r
>>> +
>>> +       rm ${B}/${UBOOT_ENVS_DEFAULT}
>>> +       rm ${B}/${UBOOT_ENVS_DEFAULT}_r
>>> +}
>>> +
>>> +addtask deploy_default_envs before do_deploy after do_gen_default_envs
>>>
>>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--94eb2c070a54425ab9056b10cd47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">And here is example how we&#39;re using it:<div><br></div>=
<div><a href=3D"https://github.com/webosose/meta-webosose/blob/master/meta-=
webos-raspberrypi/recipes-bsp/u-boot/u-boot-env.bb">https://github.com/webo=
sose/meta-webosose/blob/master/meta-webos-raspberrypi/recipes-bsp/u-boot/u-=
boot-env.bb</a><br></div><div><br></div><div>To make it compatible with ras=
pberrypi3 and raspberrypi3-64, I&#39;ve updated it a bit to select correct =
IMAGETYPE and BOOTCMD based on the environment:</div><div><br></div><div><d=
iv>do_compile() {</div><div>=C2=A0 =C2=A0 sed -e &#39;s/@@KERNEL_IMAGETYPE@=
@/${KERNEL_IMAGETYPE}/&#39; \</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39=
;s/@@KERNEL_BOOTCMD@@/${KERNEL_BOOTCMD}/&#39; \</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;${WORKDIR}/<a href=3D"http://uboot-env.txt.in">uboot-env.t=
xt.in</a>&quot; &gt; &quot;${WORKDIR}/uboot-env.txt&quot;</div><div>=C2=A0 =
=C2=A0 uboot-mkenvimage -s 16384 -o uboot.env ${WORKDIR}/uboot-env.txt</div=
><div>}</div></div><div><br></div></div><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote">On Mon, Apr 30, 2018 at 3:23 PM, Martin Jansa <span =
dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank"=
>martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div dir=3D"ltr">u-boot-mkimage already builds=C2=A0mkenvimage, you ju=
st need to install it in do_install:<div><br></div><div><div>=C2=A0 =C2=A0 =
install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage</div><div>=
=C2=A0 =C2=A0 ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage</div><div><b=
r></div></div><div>This is what we have in=C2=A0recipes-bsp/u-boot/u-boot-<=
wbr>mkimage_%.bbappend and it works fine.</div></div><div class=3D"HOEnZb">=
<div class=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On Mon, Apr 30, 2018 at 8:50 AM, Martin Hundeb=C3=B8ll <span dir=3D"ltr">&=
lt;<a href=3D"mailto:mnhu@prevas.dk" target=3D"_blank">mnhu@prevas.dk</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Lukasz,<span><br>
<br>
On 2018-04-27 16:51, Lukasz Majewski wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This commit provides the ability to generate u-boot environment(s) as<br>
images, which afterwards can be used to produce image (with wic) for<br>
flashing (eMMC or SPI-NOR).<br>
<br>
This change removes the need to run &quot;env default&quot; during producti=
on phase,<br>
as proper environment (including redundant one) is already stored on<br>
persistent memory (the CRC is also correct).<br>
</blockquote>
<br></span>
I think we should create a separate recipe to install the native mkenvimage=
 binary (e.g. u-boot-mkenvimage_%.bb) or update u-boot-mkimage_%.bb install=
 it.<br>
<br>
Then a new recipe to create the environment images can depend on u-boot-mke=
nvimage-native.<br>
<br>
Also note the recently added upstream support for external environment defi=
nitions:<br>
<a href=3D"http://git.denx.de/?p=3Du-boot.git;a=3Dcommit;h=3Df3d8f7dd73ac5d=
de258eb786d4a01869395b56d7" rel=3D"noreferrer" target=3D"_blank">http://git=
.denx.de/?p=3Du-boot.g<wbr>it;a=3Dcommit;h=3Df3d8f7dd73ac5dde<wbr>258eb786d=
4a01869395b56d7</a><br>
<br>
For our usecase we need the ability to generate environment images in yocto=
 from such external definitions.<br>
<br>
// Martin<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Lukasz Majewski &lt;<a href=3D"mailto:lukma@denx.de" target=
=3D"_blank">lukma@denx.de</a>&gt;<span><br>
<br>
---<br>
This patch depends on &quot;u-boot: Upgrade to 2018.03 release&quot;<br>
<a href=3D"https://patchwork.openembedded.org/patch/149998/" rel=3D"norefer=
rer" target=3D"_blank">https://patchwork.openembedded<wbr>.org/patch/149998=
/</a><br>
---<br>
=C2=A0 meta/recipes-bsp/u-boot/u-boot<wbr>.inc | 35 +++++++++++++++++++++++=
+++++++<wbr>+++++<br>
=C2=A0 1 file changed, 35 insertions(+)<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/u-bo<wbr>ot.inc b/meta/recipes-bsp/u-b=
oot/u-bo<wbr>ot.inc<br></span>
index c2bcf99840..2796e503cf 100644<span><br>
--- a/meta/recipes-bsp/u-boot/u-bo<wbr>ot.inc<br>
+++ b/meta/recipes-bsp/u-boot/u-bo<wbr>ot.inc<br>
@@ -305,3 +305,38 @@ do_deploy () {<br>
=C2=A0 }<br>
=C2=A0 =C2=A0 addtask deploy before do_build after do_compile<br>
+<br>
+# Create new rules to extract default envs<br>
+UBOOT_ENVS_DEFAULT ?=3D &quot;uboot-envs-default&quot;<br>
+DEFAULT_ENVS ?=3D &quot;u-boot-env-default.txt&quot;<br>
+DEFAULT_ENVS_SIZE ?=3D &quot;65536&quot;<br>
+<br></span><span>
+# Generate default environment<br>
+do_gen_default_envs[doc] =3D &quot;Generate image with default U-Boot envi=
ronment(s)&quot;<br>
+do_gen_default_envs () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${B}/source/scripts/get_defau<wbr>lt_envs.sh ${=
B} &gt; ${B}/${DEFAULT_ENVS}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Generate env image<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${B}/tools/mkenvimage -s ${DEFAULT_ENVS_SIZE} -=
o ${B}/${UBOOT_ENVS_DEFAULT} ${B}/${DEFAULT_ENVS}<br></span>
+<span><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Generate redundant env image<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${B}/tools/mkenvimage -r -s ${DEFAULT_ENVS_SIZE=
} -o ${B}/${UBOOT_ENVS_DEFAULT}_r ${B}/${DEFAULT_ENVS}<br></span>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${B}/${DEFAULT_ENVS}<br>
+}<br>
+<span><br>
+addtask gen_default_envs before do_deploy_default_envs after do_compile<br=
>
+<br>
+# Deploy default environment<br>
+do_deploy_default_envs[doc] =3D &quot;Copy images with default U-Boot envi=
ronment to deployment directory&quot;<br>
+do_deploy_default_envs () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${DEPLOYDIR}<br>
+<br></span>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/${UBOOT_ENVS_DEFAULT} ${DEPLOYDIR}=
/${UBOOT_ENVS_DEFA<wbr>ULT}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/${UBOOT_ENVS_DEFAULT}_r ${DEPLOYDI=
R}/${UBOOT_ENVS_DEFA<wbr>ULT}_r<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${B}/${UBOOT_ENVS_DEFAULT}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${B}/${UBOOT_ENVS_DEFAULT}_r<br>
+}<br>
+<br>
+addtask deploy_default_envs before do_deploy after do_gen_default_envs<br>
<br>
</blockquote><div class=3D"m_-1309334053389698730HOEnZb"><div class=3D"m_-1=
309334053389698730h5">
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--94eb2c070a54425ab9056b10cd47--
