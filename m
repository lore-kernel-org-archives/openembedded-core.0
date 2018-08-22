Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id D18CB79446
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 19:02:56 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id f21-v6so2921671wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 12:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GYdzTalHw/KTi8owdMzU+7JePDBZuoq2hnrhOQhv9DU=;
	b=eQcQ/n8tAgkBCWEHSrs1tYgvsyDNDEB3gkh+SzI4BMfNnUZhIhtrybQhCFViB7NTtB
	OKPvk8OSiL2P0VzOnmK/8t1RmOyCGp/z2bUyI1I3TyS+1oOWM81vhP8PlYMrYaV4GzQn
	2K+ZmSdKZGtPsGepGslZ37YwagQvppTYIu1KxHfQ0DvYqMl1H5O46f7dIyFSCQHlQmrT
	uGRGxgEY+0KhZmdGzTVR+ef3mA/MPgSUWtf1gvMzD34gQv+Mik1kMeD84i/tUioYe3pJ
	6gGz7QicfJiqGWVFdoumd8OCztopjGvuPgjJCW9hWWifp6Yv1DZeK9xhbzlpfrV7om4k
	Pusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GYdzTalHw/KTi8owdMzU+7JePDBZuoq2hnrhOQhv9DU=;
	b=RxaAUWSe4Dywo+ESrRLkIS9Uw2ikfjbhxx4sNOO3ue+LrQfMo8iGw/tqVabcFRZRuX
	2X23jROw217RE2m3mqly3ftMtZ/50CqctVBC0qsyT9MR0CncpC7HWktYRHNM+Cnr9o66
	aeycuHWsOLGq5EXHIZcOmDQBWXVjZOR6aG/nSNC7alkA9UZmvcotz2qBcMGZV47TY4If
	Fv5prlEyP1bxdAUZ1OQ2h6+2+l5PTmyd9AZvUGUBJ/EsHeMxLKZax2PnN+SN+LYa8ogA
	C6XvRMxXhlrbOPeyWXmkJcCujvOtEMNNfZJ10u4JATb13nqq+cJ+/qWxtiS+Q10rcCLX
	gn1w==
X-Gm-Message-State: APzg51DjYWPsPAy2lgRDPTJT7+Lfa4c6GsDNtgTKE0Wys6v2cnxFkYvK
	VNVLxlvY3p93YqszPTm7wfT+Bm86H7zpf+FaMxk=
X-Google-Smtp-Source: ANB0VdZvnR/4wvTWutpmllwzZRJNl3FZ0HM2X1ElZP9ylMP0SuEBSbzb8DSHHhRmpWHOTsChH/I4X8sWZNe/uB8+2ws=
X-Received: by 2002:a1c:8c08:: with SMTP id o8-v6mr2984899wmd.60.1534964577479;
	Wed, 22 Aug 2018 12:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
	<CAD0U-hLEPce-+gJcBcqQHFPkiHr1CPBEvaM6s1f1VTkEzpNnfQ@mail.gmail.com>
	<CA+chaQezPDFAP1L0NYCaoFDjPfriUt3_wh9QKTaa0ZwWBHtKYQ@mail.gmail.com>
	<CAD0U-hJHddn43O0WVxDqUft74RoHxfCQBb9XV-pG+GYqNU0iVQ@mail.gmail.com>
In-Reply-To: <CAD0U-hJHddn43O0WVxDqUft74RoHxfCQBb9XV-pG+GYqNU0iVQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 22 Aug 2018 21:02:45 +0200
Message-ID: <CA+chaQc2EUcz+PHi=BT5RrMQsCqegytxgLd6gzpH-PUYvt59Mw@mail.gmail.com>
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
X-List-Received-Date: Wed, 22 Aug 2018 19:02:57 -0000
Content-Type: multipart/alternative; boundary="00000000000062317705740acab5"

--00000000000062317705740acab5
Content-Type: text/plain; charset="UTF-8"

Your 1st parameter is wrong, compare again with the example I gave you
(don't include "brcm/" path in 1st param, because you want the symlink to
point to just brcmfmac43430-sdio.AP6212.txt like you did in the version
after cd).

On Wed, Aug 22, 2018 at 7:11 PM Ryan Harkin <ryan.harkin@linaro.org> wrote:

> This is curious!
>
> On 22 August 2018 at 17:56, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
>> brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt
>>
>> is the same as
>>
>> ln -sf brcmfmac43430-sdio.AP6212.txt ${D}${nonarch_base_libdir}/fir
>> mware/brcm/brcmfmac43430-sdio.txt
>>
>
> On my system, this is what happens when I'm in the root of the
> linux-firmware repo:
>
> $ ls -al brcm/*.txt
> -rw-rw-r-- 1 ryan ryan 875 Aug 22 18:08 brcm/brcmfmac43430-sdio.AP6212.txt
> -rw-rw-r-- 1 ryan ryan 831 Aug 21 14:48 brcm/brcmfmac43430-sdio.MUR1DX.txt
>
> $ ln -sf brcm/brcmfmac43430-sdio.AP6212.txt brcm/brcmfmac43430-sdio.txt
>
> $ ls -al brcm/*.txt
> -rw-rw-r-- 1 ryan ryan 875 Aug 22 18:08 brcm/brcmfmac43430-sdio.AP6212.txt
> -rw-rw-r-- 1 ryan ryan 831 Aug 21 14:48 brcm/brcmfmac43430-sdio.MUR1DX.txt
> lrwxrwxrwx 1 ryan ryan  34 Aug 22 18:08 brcm/brcmfmac43430-sdio.txt ->
> brcm/brcmfmac43430-sdio.AP6212.txt
>
> And the file is not valid.
>
> $ cat brcm/brcmfmac43430-sdio.txt
> cat: brcm/brcmfmac43430-sdio.txt: No such file or directory
>
> So perhaps I'm doing something wrong. I tried your suggestion originally
> and it didn't work for me. Maybe I made a typo or something?
>
>
>
>> On Wed, Aug 22, 2018 at 6:47 PM Ryan Harkin <ryan.harkin@linaro.org>
>> wrote:
>>
>>>
>>>
>>> On 22 August 2018 at 17:41, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>
>>>> The "cd ${D}${nonarch_base_libdir}/firmware/brcm/" doesn't seem to be
>>>> needed, just include the path in 2nd ln parameter.
>>>>
>>>
>>> I don't think that works, or at least, it doesn't work for me, so I may
>>> be doing something wrong. I'm also copying the example used in the
>>> do_install() a few lines up as I figured that would be the preferred style
>>> for this recipe.
>>>
>>>
>>>> On Wed, Aug 22, 2018 at 6:30 PM Ryan Harkin <ryan.harkin@linaro.org>
>>>> wrote:
>>>>
>>>>> The Linux kernel currently expects a single NVRAM file for BCM43430
>>>>> named brcmfmac43430-sdio.txt.
>>>>>
>>>>> Allow the machine to specify an override to link its module specific
>>>>> NVRAM to the filename expected by the kernel.
>>>>>
>>>>> Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
>>>>> ---
>>>>>  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 12
>>>>> ++++++++++++
>>>>>  1 file changed, 12 insertions(+)
>>>>>
>>>>> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>>>> b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>>>> index 8c54f28..b647abc 100644
>>>>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>>>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>>>> @@ -226,6 +226,18 @@ do_install() {
>>>>>         ( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf
>>>>> ti-connectivity/* . )
>>>>>  }
>>>>>
>>>>> +# Adding bcm43430-nvram-{module type} to MACHINEOVERRIDES will create
>>>>> a
>>>>> +# softlink for the module specific NVRAM file to the filename expected
>>>>> +# by the Linux kernel
>>>>> +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-mur1dx = "
>>>>> ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
>>>>> +do_install_append_bcm43430-nvram-mur1dx() {
>>>>> +       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
>>>>> brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)
>>>>> +}
>>>>> +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-ap6212 =
>>>>> "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
>>>>> +do_install_append_bcm43430-nvram-ap6212() {
>>>>> +       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
>>>>> brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt)
>>>>> +}
>>>>> +
>>>>>
>>>>>  PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
>>>>>               ${PN}-mt7601u-license ${PN}-mt7601u \
>>>>> --
>>>>> 2.7.4
>>>>>
>>>>>
>>>
>

--00000000000062317705740acab5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Your 1st parameter is wrong, compare again with the exampl=
e I gave you (don&#39;t include &quot;brcm/&quot; path in 1st param, becaus=
e you want the symlink to point to just brcmfmac43430-sdio.AP6212.txt like =
you did in the version after cd).</div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr">On Wed, Aug 22, 2018 at 7:11 PM Ryan Harkin &lt;<a href=3D"mail=
to:ryan.harkin@linaro.org">ryan.harkin@linaro.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"ltr">This is curious!<br><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote">On 22 August 2018 at 17:5=
6, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.=
com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><span class=
=3D"m_8590662322490689065gmail-"><span style=3D"color:rgb(80,0,80)">cd ${D}=
${nonarch_base_libdir}/fir</span><span style=3D"color:rgb(80,0,80)">mware/b=
rcm/ ; ln -sf brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt</span><b=
r><div><span style=3D"color:rgb(80,0,80)"><br></span></div></span><div><spa=
n style=3D"color:rgb(80,0,80)">is the same as</span></div><div><span style=
=3D"color:rgb(80,0,80)"><br></span></div><div><span style=3D"color:rgb(80,0=
,80)">ln -sf=C2=A0</span><span style=3D"color:rgb(80,0,80)">brcmfmac43430-s=
dio.AP6212.txt=C2=A0</span><span style=3D"color:rgb(80,0,80)">${D}${nonarch=
_base_libdir}/fir</span><span style=3D"color:rgb(80,0,80)">mware/brcm/</spa=
n><span style=3D"color:rgb(80,0,80)">brcmfmac43430-sdio.txt</span></div></d=
iv></blockquote><div><br></div><div>On my system, this is what happens when=
 I&#39;m in the root of the linux-firmware repo:<br></div><div><br></div><d=
iv style=3D"font-size:small;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial">$ ls -al brcm/*.txt<br></di=
v><div style=3D"font-size:small;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial">-rw-rw-r-- 1 ryan ryan =
875 Aug 22 18:08 brcm/brcmfmac43430-sdio.AP6212.txt</div><div style=3D"font=
-size:small;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial">-rw-rw-r-- 1 ryan ryan 831 Aug 21 14:48 brc=
m/brcmfmac43430-sdio.MUR1DX.txt</div><br class=3D"m_8590662322490689065gmai=
l-Apple-interchange-newline"><div>$ ln -sf brcm/brcmfmac43430-sdio.AP6212.t=
xt brcm/brcmfmac43430-sdio.txt<br></div><div><br></div><div>$ ls -al brcm/*=
.txt<br></div><div>-rw-rw-r-- 1 ryan ryan 875 Aug 22 18:08 brcm/brcmfmac434=
30-sdio.AP6212.txt</div><div>-rw-rw-r-- 1 ryan ryan 831 Aug 21 14:48 brcm/b=
rcmfmac43430-sdio.MUR1DX.txt</div><div>lrwxrwxrwx 1 ryan ryan=C2=A0 34 Aug =
22 18:08 brcm/brcmfmac43430-sdio.txt -&gt; brcm/brcmfmac43430-sdio.AP6212.t=
xt</div><div><br></div><div>And the file is not valid.</div><div><br></div>=
<div>$ cat brcm/brcmfmac43430-sdio.txt</div><div>cat: brcm/brcmfmac43430-sd=
io.txt: No such file or directory</div><div><br></div><div>So perhaps I&#39=
;m doing something wrong. I tried your suggestion originally and it didn&#3=
9;t work for me. Maybe I made a typo or something?</div><div><br></div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"=
m_8590662322490689065gmail-HOEnZb"><div class=3D"m_8590662322490689065gmail=
-h5"><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Aug 22, 2018 a=
t 6:47 PM Ryan Harkin &lt;<a href=3D"mailto:ryan.harkin@linaro.org" target=
=3D"_blank">ryan.harkin@linaro.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On 22 August 2018 at 17:41, Martin Ja=
nsa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=
=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">The &quot;cd ${D}${nona=
rch_base_libdir}/firmware/brcm/&quot; doesn&#39;t seem to be needed, just i=
nclude the path in 2nd ln parameter.</div></blockquote><div><br></div><div>=
I don&#39;t think that works, or at least, it doesn&#39;t work for me, so I=
 may be doing something wrong. I&#39;m also copying the example used in the=
 do_install() a few lines up as I figured that would be the preferred style=
 for this recipe.</div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div class=3D"m_8590662322490689065gmail-m_5502182029538994976=
m_-6311599830852990523HOEnZb"><div class=3D"m_8590662322490689065gmail-m_55=
02182029538994976m_-6311599830852990523h5"><br><div class=3D"gmail_quote"><=
div dir=3D"ltr">On Wed, Aug 22, 2018 at 6:30 PM Ryan Harkin &lt;<a href=3D"=
mailto:ryan.harkin@linaro.org" target=3D"_blank">ryan.harkin@linaro.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The =
Linux kernel currently expects a single NVRAM file for BCM43430<br>
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
</div></div></blockquote></div><br></div></div>
</blockquote></div>

--00000000000062317705740acab5--
