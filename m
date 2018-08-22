Return-Path: <ryan.harkin@linaro.org>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id 02D1A78F98
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 16:47:20 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id p6-v6so1951566ljc.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 09:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+K5DgmwZ5XkgWBbXaPxzOsWYMs9jYd46XPqdsblf7/o=;
	b=B5gEATVuAgPL0WCO5/OhI+NkajS2doYCqMaVC5gyQ83VvFlwRWeAJ2B3BUZcBW0aau
	8NzWus5kITsAP2QELl7uhdsuEB1/x9c+NfU0cTV5+YkMyYBUI4GmQDHnY9sXBr/SveDz
	qgbILvZjJPhLqCMlEgNQUdskVkWa0Nk9vB9vQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+K5DgmwZ5XkgWBbXaPxzOsWYMs9jYd46XPqdsblf7/o=;
	b=jJqtathQ2l4HMt9SqblY+J0YUb/fTkC5g08UWbx9PUtypynfCmWrglVDkqpZkrlFlo
	UJf0TttYhjb22KHYSJbo2yqwbLpCSiUV3+9loxx+GlSJQY0m/MAhNhTfey9Z9g1O7oxJ
	1RX57S/VLH9pS59Un6YQ5v+ZJ+OI1FPQ5y+CzuQrEMZkkrq3dK2MdR00BlKljxAkcGXE
	iMykDmv+rVA3feMkhNU8DevkT0I2jUGEuwPX+i1pZlIilewSQy9jvgJ3EcMWB/zl0L6X
	FFCE9NnNEkdKrA/ptr/ORFoOMSR4XYqDhSYE/zVRrElYuVlh5NQbWwZXPk9aVxqzr1Fv
	E8Fg==
X-Gm-Message-State: APzg51AfrkHFIBsLe+amaY4DXQCoaqUm9SkMDDt6ALU6TVyzoDMs8Tb6
	b2t+g8ffrd7mR+TqtAti9xvisUrwRdAaa/BaIusTsQ==
X-Google-Smtp-Source: ANB0VdZwheHc/zqk6ZXLVt2aKCGdnBHzKoUucmwgjVJ4ga8LcMJtMvKGCs8MQdN/S8R9VPil6FgQecpaBefTqw3QYYw=
X-Received: by 2002:a2e:1d46:: with SMTP id
	d67-v6mr6247781ljd.41.1534956441650; 
	Wed, 22 Aug 2018 09:47:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:1bc7:0:0:0:0:0 with HTTP; Wed, 22 Aug 2018 09:47:21
	-0700 (PDT)
In-Reply-To: <CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Wed, 22 Aug 2018 17:47:21 +0100
Message-ID: <CAD0U-hLEPce-+gJcBcqQHFPkiHr1CPBEvaM6s1f1VTkEzpNnfQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 22 Aug 2018 16:47:21 -0000
Content-Type: multipart/alternative; boundary="000000000000735954057408e532"

--000000000000735954057408e532
Content-Type: text/plain; charset="UTF-8"

On 22 August 2018 at 17:41, Martin Jansa <martin.jansa@gmail.com> wrote:

> The "cd ${D}${nonarch_base_libdir}/firmware/brcm/" doesn't seem to be
> needed, just include the path in 2nd ln parameter.
>

I don't think that works, or at least, it doesn't work for me, so I may be
doing something wrong. I'm also copying the example used in the
do_install() a few lines up as I figured that would be the preferred style
for this recipe.


> On Wed, Aug 22, 2018 at 6:30 PM Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
>
>> The Linux kernel currently expects a single NVRAM file for BCM43430
>> named brcmfmac43430-sdio.txt.
>>
>> Allow the machine to specify an override to link its module specific
>> NVRAM to the filename expected by the kernel.
>>
>> Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
>> ---
>>  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 12
>> ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> index 8c54f28..b647abc 100644
>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> @@ -226,6 +226,18 @@ do_install() {
>>         ( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf
>> ti-connectivity/* . )
>>  }
>>
>> +# Adding bcm43430-nvram-{module type} to MACHINEOVERRIDES will create a
>> +# softlink for the module specific NVRAM file to the filename expected
>> +# by the Linux kernel
>> +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-mur1dx = "
>> ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
>> +do_install_append_bcm43430-nvram-mur1dx() {
>> +       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
>> brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)
>> +}
>> +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-ap6212 =
>> "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
>> +do_install_append_bcm43430-nvram-ap6212() {
>> +       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
>> brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt)
>> +}
>> +
>>
>>  PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
>>               ${PN}-mt7601u-license ${PN}-mt7601u \
>> --
>> 2.7.4
>>
>>

--000000000000735954057408e532
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 22 August 2018 at 17:41, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">T=
he &quot;cd ${D}${nonarch_base_libdir}/<wbr>firmware/brcm/&quot; doesn&#39;=
t seem to be needed, just include the path in 2nd ln parameter.</div></bloc=
kquote><div><br></div><div>I don&#39;t think that works, or at least, it do=
esn&#39;t work for me, so I may be doing something wrong. I&#39;m also copy=
ing the example used in the do_install() a few lines up as I figured that w=
ould be the preferred style for this recipe.</div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5"><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Wed, Aug 22, 2018 at 6:30 PM Ryan Hark=
in &lt;<a href=3D"mailto:ryan.harkin@linaro.org" target=3D"_blank">ryan.har=
kin@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The L=
inux kernel currently expects a single NVRAM file for BCM43430<br>
named brcmfmac43430-sdio.txt.<br>
<br>
Allow the machine to specify an override to link its module specific<br>
NVRAM to the filename expected by the kernel.<br>
<br>
Signed-off-by: Ryan Harkin &lt;<a href=3D"mailto:ryan.harkin@linaro.org" ta=
rget=3D"_blank">ryan.harkin@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux-<wbr>firmware/<a href=3D"http://linux-firmw=
are_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a> =
| 12 ++++++++++++<br>
=C2=A01 file changed, 12 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux-<wbr>firmware/<a href=3D"http://linu=
x-firmware_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.=
bb</a> b/meta/recipes-kernel/linux-<wbr>firmware/<a href=3D"http://linux-fi=
rmware_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</=
a><br>
index 8c54f28..b647abc 100644<br>
--- a/meta/recipes-kernel/linux-<wbr>firmware/<a href=3D"http://linux-firmw=
are_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><=
br>
+++ b/meta/recipes-kernel/linux-<wbr>firmware/<a href=3D"http://linux-firmw=
are_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><=
br>
@@ -226,6 +226,18 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ( cd ${D}${nonarch_base_libdir}/<wbr>firmware ;=
 ln -sf ti-connectivity/* . )<br>
=C2=A0}<br>
<br>
+# Adding bcm43430-nvram-{module type} to MACHINEOVERRIDES will create a<br=
>
+# softlink for the module specific NVRAM file to the filename expected<br>
+# by the Linux kernel<br>
+FILES_${PN}-bcm43430-nvram_<wbr>append_bcm43430-nvram-mur1dx =3D &quot; ${=
nonarch_base_libdir}/<wbr>firmware/brcm/brcmfmac43430-<wbr>sdio.txt&quot;<b=
r>
+do_install_append_bcm43430-<wbr>nvram-mur1dx() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0( cd ${D}${nonarch_base_libdir}/<wbr>firmware/b=
rcm/ ; ln -sf brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)<br>
+}<br>
+FILES_${PN}-bcm43430-nvram_<wbr>append_bcm43430-nvram-ap6212 =3D &quot;${n=
onarch_base_libdir}/<wbr>firmware/brcm/brcmfmac43430-<wbr>sdio.txt&quot;<br=
>
+do_install_append_bcm43430-<wbr>nvram-ap6212() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0( cd ${D}${nonarch_base_libdir}/<wbr>firmware/b=
rcm/ ; ln -sf brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt)<br>
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

--000000000000735954057408e532--
