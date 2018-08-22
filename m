Return-Path: <ryan.harkin@linaro.org>
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2AF79405
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 20:10:32 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id u7-v6so2401935lji.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ivcCyFd2LOJCWUGjXP/SvhIR1n8chQ1+BXNOwFlTeUU=;
	b=bSv8taOyPuUS8Um7NReklCju4I6H5ATbPOjb947v9scWZ/dWvOaZbPxkW+NmfkdZ6K
	fnIxkjOYIq1XV4nn9FIRvtmypO5P69qGyrX444LAWX6VWZ3RGzXbtR01RbuuNaMlYDD7
	5ob2/2hCHJUF4s1ot9SrrEYqyULEU/hXIzIr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ivcCyFd2LOJCWUGjXP/SvhIR1n8chQ1+BXNOwFlTeUU=;
	b=ZivSWIACu5RSyTb6kBl2JFgWXXqXIloIaAi44WR5SjhUXYX0i1DD4UgcOlmLLYw7Xp
	LB1kS6LpYyVlsn8tI08qJgF6EQ+/WVkUnNJEyYxjBN17gIQuRGETcN8+xU9Zp/7zoT93
	+/5pHilE1dW5Gukecjy0ETePYhK24NklhXKMhrPXe2Ek1pL7/XFrB6r6LO8arjaORq+5
	zpiY90hmfChe2smf6z9f0ioSCQfRH+suAD6RVzzGzjhjwByLBRS2VGRgQfY8VA66o5YB
	oCIv+yQW7UkdS2KsqN1DYebQXzostV3uNOyES3aQ4wo+6OQ80a8WTXUniYAD6iensJtR
	Y0KQ==
X-Gm-Message-State: AOUpUlEgGx1WtsMbE+x252XI54ZJ/10L3B2Jv95ALXWz1rWaT/5QmHcg
	0MP0JzKeI5auPJfMuv5CQgt6qIrhTjY3CInvOGgvBA==
X-Google-Smtp-Source: AA+uWPwtmAE5l410ZQMfF0LzB0idaFX23HB3xpPPYd3GFrcgKU4fV2z2RAd/MGBthsJmJqs+SXiuryCBOeG/wrm4IYI=
X-Received: by 2002:a2e:9c82:: with SMTP id
	x2-v6mr15340615lji.131.1534968632948; 
	Wed, 22 Aug 2018 13:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
	<CAD0U-hLEPce-+gJcBcqQHFPkiHr1CPBEvaM6s1f1VTkEzpNnfQ@mail.gmail.com>
	<CA+chaQezPDFAP1L0NYCaoFDjPfriUt3_wh9QKTaa0ZwWBHtKYQ@mail.gmail.com>
	<CAD0U-hJHddn43O0WVxDqUft74RoHxfCQBb9XV-pG+GYqNU0iVQ@mail.gmail.com>
	<CA+chaQc2EUcz+PHi=BT5RrMQsCqegytxgLd6gzpH-PUYvt59Mw@mail.gmail.com>
In-Reply-To: <CA+chaQc2EUcz+PHi=BT5RrMQsCqegytxgLd6gzpH-PUYvt59Mw@mail.gmail.com>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Wed, 22 Aug 2018 21:10:21 +0100
Message-ID: <CAD0U-hL6Mvxf+NYVJS64ygh+bMR2RMxwa=okW6g+yOGb-Xb7mA@mail.gmail.com>
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
X-List-Received-Date: Wed, 22 Aug 2018 20:10:33 -0000
Content-Type: multipart/alternative; boundary="0000000000001bd01f05740bbcb7"

--0000000000001bd01f05740bbcb7
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Aug 2018, 20:02 Martin Jansa, <martin.jansa@gmail.com> wrote:

> Your 1st parameter is wrong, compare again with the example I gave you
> (don't include "brcm/" path in 1st param, because you want the symlink to
> point to just brcmfmac43430-sdio.AP6212.txt like you did in the version
> after cd).
>

That doesn't work either. I tried it with the same result, but didn't send
a log of it. That works for you?


On Wed, Aug 22, 2018 at 7:11 PM Ryan Harkin <ryan.harkin@linaro.org> wrote:
>
>> This is curious!
>>
>> On 22 August 2018 at 17:56, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>>> cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
>>> brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt
>>>
>>> is the same as
>>>
>>> ln -sf brcmfmac43430-sdio.AP6212.txt ${D}${nonarch_base_libdir}/fir
>>> mware/brcm/brcmfmac43430-sdio.txt
>>>
>>
>> On my system, this is what happens when I'm in the root of the
>> linux-firmware repo:
>>
>> $ ls -al brcm/*.txt
>> -rw-rw-r-- 1 ryan ryan 875 Aug 22 18:08 brcm/brcmfmac43430-sdio.AP6212.txt
>> -rw-rw-r-- 1 ryan ryan 831 Aug 21 14:48 brcm/brcmfmac43430-sdio.MUR1DX.txt
>>
>> $ ln -sf brcm/brcmfmac43430-sdio.AP6212.txt brcm/brcmfmac43430-sdio.txt
>>
>> $ ls -al brcm/*.txt
>> -rw-rw-r-- 1 ryan ryan 875 Aug 22 18:08 brcm/brcmfmac43430-sdio.AP6212.txt
>> -rw-rw-r-- 1 ryan ryan 831 Aug 21 14:48 brcm/brcmfmac43430-sdio.MUR1DX.txt
>> lrwxrwxrwx 1 ryan ryan  34 Aug 22 18:08 brcm/brcmfmac43430-sdio.txt ->
>> brcm/brcmfmac43430-sdio.AP6212.txt
>>
>> And the file is not valid.
>>
>> $ cat brcm/brcmfmac43430-sdio.txt
>> cat: brcm/brcmfmac43430-sdio.txt: No such file or directory
>>
>> So perhaps I'm doing something wrong. I tried your suggestion originally
>> and it didn't work for me. Maybe I made a typo or something?
>>
>>
>>
>>> On Wed, Aug 22, 2018 at 6:47 PM Ryan Harkin <ryan.harkin@linaro.org>
>>> wrote:
>>>
>>>>
>>>>
>>>> On 22 August 2018 at 17:41, Martin Jansa <martin.jansa@gmail.com>
>>>> wrote:
>>>>
>>>>> The "cd ${D}${nonarch_base_libdir}/firmware/brcm/" doesn't seem to be
>>>>> needed, just include the path in 2nd ln parameter.
>>>>>
>>>>
>>>> I don't think that works, or at least, it doesn't work for me, so I may
>>>> be doing something wrong. I'm also copying the example used in the
>>>> do_install() a few lines up as I figured that would be the preferred style
>>>> for this recipe.
>>>>
>>>>
>>>>> On Wed, Aug 22, 2018 at 6:30 PM Ryan Harkin <ryan.harkin@linaro.org>
>>>>> wrote:
>>>>>
>>>>>> The Linux kernel currently expects a single NVRAM file for BCM43430
>>>>>> named brcmfmac43430-sdio.txt.
>>>>>>
>>>>>> Allow the machine to specify an override to link its module specific
>>>>>> NVRAM to the filename expected by the kernel.
>>>>>>
>>>>>> Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
>>>>>> ---
>>>>>>  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 12
>>>>>> ++++++++++++
>>>>>>  1 file changed, 12 insertions(+)
>>>>>>
>>>>>> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>>>>> b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>>>>> index 8c54f28..b647abc 100644
>>>>>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>>>>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>>>>> @@ -226,6 +226,18 @@ do_install() {
>>>>>>         ( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf
>>>>>> ti-connectivity/* . )
>>>>>>  }
>>>>>>
>>>>>> +# Adding bcm43430-nvram-{module type} to MACHINEOVERRIDES will
>>>>>> create a
>>>>>> +# softlink for the module specific NVRAM file to the filename
>>>>>> expected
>>>>>> +# by the Linux kernel
>>>>>> +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-mur1dx = "
>>>>>> ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
>>>>>> +do_install_append_bcm43430-nvram-mur1dx() {
>>>>>> +       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
>>>>>> brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)
>>>>>> +}
>>>>>> +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-ap6212 =
>>>>>> "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
>>>>>> +do_install_append_bcm43430-nvram-ap6212() {
>>>>>> +       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
>>>>>> brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt)
>>>>>> +}
>>>>>> +
>>>>>>
>>>>>>  PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
>>>>>>               ${PN}-mt7601u-license ${PN}-mt7601u \
>>>>>> --
>>>>>> 2.7.4
>>>>>>
>>>>>>
>>>>
>>

--0000000000001bd01f05740bbcb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Wed, 22 Aug 2018, 20:02 Martin Jansa, &lt;<a href=3D"mailto:martin.jansa=
@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"ltr">Your 1st parameter is wrong, compare again =
with the example I gave you (don&#39;t include &quot;brcm/&quot; path in 1s=
t param, because you want the symlink to point to just brcmfmac43430-sdio.A=
P6212.txt like you did in the version after cd).</div></blockquote></div></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">That doesn&#39;t work eit=
her. I tried it with the same result, but didn&#39;t send a log of it. That=
 works for you?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Aug 22, 2018 at 7:11=
 PM Ryan Harkin &lt;<a href=3D"mailto:ryan.harkin@linaro.org" target=3D"_bl=
ank" rel=3D"noreferrer">ryan.harkin@linaro.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div dir=3D"ltr">This is curious!<br><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 22 August 2018 at 17:56,=
 Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.co=
m" target=3D"_blank" rel=3D"noreferrer">martin.jansa@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><span class=3D"m_5050295636052634530m_8590662322490689065gmail-"><span=
 style=3D"color:rgb(80,0,80)">cd ${D}${nonarch_base_libdir}/fir</span><span=
 style=3D"color:rgb(80,0,80)">mware/brcm/ ; ln -sf brcmfmac43430-sdio.AP621=
2.txt brcmfmac43430-sdio.txt</span><br><div><span style=3D"color:rgb(80,0,8=
0)"><br></span></div></span><div><span style=3D"color:rgb(80,0,80)">is the =
same as</span></div><div><span style=3D"color:rgb(80,0,80)"><br></span></di=
v><div><span style=3D"color:rgb(80,0,80)">ln -sf=C2=A0</span><span style=3D=
"color:rgb(80,0,80)">brcmfmac43430-sdio.AP6212.txt=C2=A0</span><span style=
=3D"color:rgb(80,0,80)">${D}${nonarch_base_libdir}/fir</span><span style=3D=
"color:rgb(80,0,80)">mware/brcm/</span><span style=3D"color:rgb(80,0,80)">b=
rcmfmac43430-sdio.txt</span></div></div></blockquote><div><br></div><div>On=
 my system, this is what happens when I&#39;m in the root of the linux-firm=
ware repo:<br></div><div><br></div><div style=3D"font-size:small;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial">$ ls -al brcm/*.txt<br></div><div style=3D"font-size:small;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial">-rw-rw-r-- 1 ryan ryan 875 Aug 22 18:08 brcm/brcmfmac43430-sd=
io.AP6212.txt</div><div style=3D"font-size:small;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial">-rw-rw=
-r-- 1 ryan ryan 831 Aug 21 14:48 brcm/brcmfmac43430-sdio.MUR1DX.txt</div><=
br class=3D"m_5050295636052634530m_8590662322490689065gmail-Apple-interchan=
ge-newline"><div>$ ln -sf brcm/brcmfmac43430-sdio.AP6212.txt brcm/brcmfmac4=
3430-sdio.txt<br></div><div><br></div><div>$ ls -al brcm/*.txt<br></div><di=
v>-rw-rw-r-- 1 ryan ryan 875 Aug 22 18:08 brcm/brcmfmac43430-sdio.AP6212.tx=
t</div><div>-rw-rw-r-- 1 ryan ryan 831 Aug 21 14:48 brcm/brcmfmac43430-sdio=
.MUR1DX.txt</div><div>lrwxrwxrwx 1 ryan ryan=C2=A0 34 Aug 22 18:08 brcm/brc=
mfmac43430-sdio.txt -&gt; brcm/brcmfmac43430-sdio.AP6212.txt</div><div><br>=
</div><div>And the file is not valid.</div><div><br></div><div>$ cat brcm/b=
rcmfmac43430-sdio.txt</div><div>cat: brcm/brcmfmac43430-sdio.txt: No such f=
ile or directory</div><div><br></div><div>So perhaps I&#39;m doing somethin=
g wrong. I tried your suggestion originally and it didn&#39;t work for me. =
Maybe I made a typo or something?</div><div><br></div><div><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div class=3D"m_505029563605263=
4530m_8590662322490689065gmail-HOEnZb"><div class=3D"m_5050295636052634530m=
_8590662322490689065gmail-h5"><br><div class=3D"gmail_quote"><div dir=3D"lt=
r">On Wed, Aug 22, 2018 at 6:47 PM Ryan Harkin &lt;<a href=3D"mailto:ryan.h=
arkin@linaro.org" target=3D"_blank" rel=3D"noreferrer">ryan.harkin@linaro.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">On 22 August 2018 at 17:41, Martin Jansa <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:martin.jansa@gmail.com" target=3D"_blank" rel=3D"noreferrer">ma=
rtin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr">The &quot;cd ${D}${nonarch_base_libdi=
r}/firmware/brcm/&quot; doesn&#39;t seem to be needed, just include the pat=
h in 2nd ln parameter.</div></blockquote><div><br></div><div>I don&#39;t th=
ink that works, or at least, it doesn&#39;t work for me, so I may be doing =
something wrong. I&#39;m also copying the example used in the do_install() =
a few lines up as I figured that would be the preferred style for this reci=
pe.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div class=3D"m_5050295636052634530m_8590662322490689065gmail-m_550218202953=
8994976m_-6311599830852990523HOEnZb"><div class=3D"m_5050295636052634530m_8=
590662322490689065gmail-m_5502182029538994976m_-6311599830852990523h5"><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Aug 22, 2018 at 6:30 PM=
 Ryan Harkin &lt;<a href=3D"mailto:ryan.harkin@linaro.org" target=3D"_blank=
" rel=3D"noreferrer">ryan.harkin@linaro.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">The Linux kernel currently expec=
ts a single NVRAM file for BCM43430<br>
named brcmfmac43430-sdio.txt.<br>
<br>
Allow the machine to specify an override to link its module specific<br>
NVRAM to the filename expected by the kernel.<br>
<br>
Signed-off-by: Ryan Harkin &lt;<a href=3D"mailto:ryan.harkin@linaro.org" ta=
rget=3D"_blank" rel=3D"noreferrer">ryan.harkin@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_g=
it.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-firmware_git.b=
b</a> | 12 ++++++++++++<br>
=C2=A01 file changed, 12 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-fir=
mware_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-firmwar=
e_git.bb</a> b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-f=
irmware_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-firmw=
are_git.bb</a><br>
index 8c54f28..b647abc 100644<br>
--- a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_g=
it.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-firmware_git.b=
b</a><br>
+++ b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmware_g=
it.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-firmware_git.b=
b</a><br>
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
</div></div></blockquote></div><br></div></div>
</blockquote></div>
</blockquote></div></div></div>

--0000000000001bd01f05740bbcb7--
