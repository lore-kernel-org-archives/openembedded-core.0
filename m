Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7F47D7C2F4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 18:42:43 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id z17so166379uac.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 10:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nP0Pc7acrEPch3+oUNNOCXboPw8Y6fVV+0PZMsXyt6o=;
	b=hnWWYWurBgS4hFqwOfTBTLXi6ete2/zTGJcGRRj4jCYUkbyFhGsFZKIYx+2+mDxMEq
	H2LOp5UbCTO0m+thFbPDws4it+myersnj0YZslg72IMYmDG7jHHgOt+88rqICb5UYN0D
	sgwS/354uaWeXlmhKt2NWy8VZjOtOxN64WOjlRnVRVdCYygLV4FifpPE9YOO5fMPo8SV
	GE/loBBebO15R9qulOq9Ur7E0X3taypkgPaEjUktCRUaFW6o/PFZWblWcrby1bEhpmOf
	L9IGWLFKTtcmim/gZ4EA2Ed+hrNlqyqJJUh9sbJ1ux3/f/Tvp1fDq7JFya3nBglaEakK
	nO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nP0Pc7acrEPch3+oUNNOCXboPw8Y6fVV+0PZMsXyt6o=;
	b=mkXw9KqKwc5px6GiiVl+jq/akzBDZZ32pQj0v2Hy0i86jB92X2GFK7XnUO0P1XY3gi
	l474Tk/uujsx2AgcFcx0cLITNZ6VB0xP3QCD+UqQHT0h9pfkRzvcQ70068oi7oiKn9Bj
	AhlhntOuBQMQ1eR3OWtN41/Gpg+JE0x9ecxQPdpYzvovXN9zOZngsZyRrRBia3NPCbGL
	8T243d0xm4FfgRt/iaw3o9MjrKEHDsXAksc91/tWltFThXwSrXsqupnVsfBvFxpPVBeF
	1sNO+161DMXt8qCTtxmcKRPAsvcf2rMWD48PnUO8ro9d2W9NcrKM5qCnGDIr2uTS4udN
	y+YQ==
X-Gm-Message-State: APjAAAXR1n45nUufvUCQeDe/xMWZc1HrW5ZEf5kN56BdFmLJeQhwCpt8
	Ie3JvXpt7FT1hj6/b90W5iGMGPGGpkrPaG6/1oo=
X-Google-Smtp-Source: APXvYqyrff3a+rX48uTeWM8zwMOUyGM2HNCE3mlIg6lNDDTxcj7z8ZyIXHzShlOwW/tLygVxi8iJRAfdpZnKybihxBI=
X-Received: by 2002:ab0:3381:: with SMTP id y1mr375370uap.93.1575484964364;
	Wed, 04 Dec 2019 10:42:44 -0800 (PST)
MIME-Version: 1.0
References: <20191203220624.26500-1-anibal.limon@linaro.org>
	<CAMKF1spabEvBMwjvefWN7ULZ8ZpGfNDgJ1gf75u1B7h3oD4nJg@mail.gmail.com>
	<CA+_AqisSN24sPo5vOzeGY4Kdb_mmQxGArCu0Kw6yeSBv-a+QHw@mail.gmail.com>
	<CANNYZj90w9QghK8eTdvc-iE7tjONky=bDA=98Mr5ccH0sjgF4g@mail.gmail.com>
	<CA+_AqisJ1+g7Btaq-T-SmSVXLsM0iePfxbq2mgbz+1VSSvDYZw@mail.gmail.com>
In-Reply-To: <CA+_AqisJ1+g7Btaq-T-SmSVXLsM0iePfxbq2mgbz+1VSSvDYZw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Dec 2019 19:42:33 +0100
Message-ID: <CANNYZj_PLwj3LUGUq6BvZycwoZJOnANVk8bbwLPPxptBWE+n8Q@mail.gmail.com>
To: Anibal Limon <anibal.limon@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/classes/meson.bbclass: Add inherit setuptools3
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
X-List-Received-Date: Wed, 04 Dec 2019 18:42:43 -0000
Content-Type: multipart/alternative; boundary="000000000000a666520598e52d78"

--000000000000a666520598e52d78
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Dec 2019 at 19:35, Anibal Limon <anibal.limon@linaro.org> wrote:

>
>
> On Wed, 4 Dec 2019 at 04:20, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> I tend to agree with Khem; this change will pull in target python as
>> build and runtime dependency to all meson-using recipes, even those that
>> have nothing to do with python.
>>
>
> Ok, it depends on python3-setuptools-native I will add this inherit on
> waffle recipe.
>

Do test this change; I believe you actually need a dependency on target
python3.

Alex


> Regards,
> Anibal
>
>
>>
>> I'd suggest you fix the broken recipes individually by adding python3 to
>> DEPENDS. Yes, the "not a valid python" message is not helpful; suggestio=
ns
>> how to improve this are welcome.
>>
>> Alex
>>
>> On Wed, 4 Dec 2019 at 03:35, Anibal Limon <anibal.limon@linaro.org>
>> wrote:
>>
>>>
>>>
>>> On Tue, 3 Dec 2019 at 17:37, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>>
>>>>
>>>> On Tue, Dec 3, 2019 at 2:06 PM An=C3=ADbal Lim=C3=B3n <anibal.limon@li=
naro.org>
>>>> wrote:
>>>>
>>>>> Fixes,
>>>>>
>>>>> ...
>>>>> | Program python3 found: YES
>>>>> (/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/wor=
k/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python=
3-native/python3)
>>>>> |
>>>>> | meson.build:36:0: ERROR: <ExternalProgram 'python3' ->
>>>>> ['/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/wo=
rk/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/pytho=
n3-native/python3']>
>>>>> is not a valid python or it is missing setuptools
>>>>> |
>>>>> | A full log can be found at
>>>>> /home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work=
/aarch64-linaro-linux/waffle/1.6.0-r0/build/meson-logs/meson-log.txt
>>>>> | WARNING: exit code 1 from a shell command.
>>>>> ...
>>>>>
>>>>
>>>> I wonder if it=E2=80=99s better to add this inherit to waffle recipe a=
lone I
>>>> doubt that all meson using recipes are building python modules
>>>>
>>>
>>> This issue is triggered from waffle [1] but the actual meson code looks
>>> for setuptools [2].
>>>
>>> Anibal
>>>
>>> [1]
>>> https://gitlab.freedesktop.org/mesa/waffle/blob/master/meson.build#L36
>>> [2]
>>> https://github.com/mesonbuild/meson/blob/master/mesonbuild/modules/pyth=
on.py#L578
>>>
>>>
>>>>
>>>>
>>>>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>>>>> ---
>>>>>  meta/classes/meson.bbclass | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
>>>>> index efa6234078..90868963b7 100644
>>>>> --- a/meta/classes/meson.bbclass
>>>>> +++ b/meta/classes/meson.bbclass
>>>>> @@ -1,4 +1,4 @@
>>>>> -inherit siteinfo python3native
>>>>> +inherit siteinfo python3native setuptools3
>>>>>
>>>>>  DEPENDS_append =3D " meson-native ninja-native"
>>>>>
>>>>> --
>>>>> 2.24.0
>>>>>
>>>>>

--000000000000a666520598e52d78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 4 Dec 2019 at 19:35, Anibal Limon=
 &lt;<a href=3D"mailto:anibal.limon@linaro.org">anibal.limon@linaro.org</a>=
&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 4 Dec =
2019 at 04:20, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.c=
om" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>I tend to=
 agree with Khem; this change will pull in target python as build and runti=
me dependency to all meson-using recipes, even those that have nothing to d=
o with python.</div></div></blockquote><div><br></div><div>Ok, it depends o=
n python3-setuptools-native I will add this inherit on waffle recipe.</div>=
</div></div></blockquote><div><br></div><div>Do test this change; I believe=
 you actually need a dependency on target python3.</div><div><br></div><div=
>Alex<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>Regards,</div><div>=
Anibal</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div><br></div><div>I&#39;d suggest you fix the broken=
 recipes individually by adding python3 to DEPENDS. Yes, the &quot;not a va=
lid python&quot; message is not helpful; suggestions how to improve this ar=
e welcome.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 4 Dec 2019 at 03:=
35, Anibal Limon &lt;<a href=3D"mailto:anibal.limon@linaro.org" target=3D"_=
blank">anibal.limon@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue,=
 3 Dec 2019 at 17:37, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div><br></div><div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 3, 2019 at 2:06=
 PM An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.org" t=
arget=3D"_blank">anibal.limon@linaro.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Fixes,<br>
<br>
...<br>
| Program python3 found: YES (/home/anibal.limon/linaro/oe-rpb-master/build=
-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroo=
t-native/usr/bin/python3-native/python3)<br>
|<br>
| meson.build:36:0: ERROR: &lt;ExternalProgram &#39;python3&#39; -&gt; [&#3=
9;/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aar=
ch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-nat=
ive/python3&#39;]&gt; is not a valid python or it is missing setuptools<br>
|<br>
| A full log can be found at /home/anibal.limon/linaro/oe-rpb-master/build-=
410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/build/meson-lo=
gs/meson-log.txt<br>
| WARNING: exit code 1 from a shell command.<br>
...<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I wonder if it=
=E2=80=99s better to add this inherit to waffle recipe alone I doubt that a=
ll meson using recipes are building python modules=C2=A0</div></div></div><=
/blockquote><div><br></div><div>This issue is triggered from waffle [1] but=
 the actual meson code looks for setuptools [2].</div><div><br></div><div>A=
nibal</div><div><br></div><div>[1]=C2=A0<a href=3D"https://gitlab.freedeskt=
op.org/mesa/waffle/blob/master/meson.build#L36" target=3D"_blank">https://g=
itlab.freedesktop.org/mesa/waffle/blob/master/meson.build#L36</a></div><div=
>[2]=C2=A0<a href=3D"https://github.com/mesonbuild/meson/blob/master/mesonb=
uild/modules/python.py#L578" target=3D"_blank">https://github.com/mesonbuil=
d/meson/blob/master/mesonbuild/modules/python.py#L578</a></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div class=3D"g=
mail_quote"><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
naro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/classes/meson.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass<br>
index efa6234078..90868963b7 100644<br>
--- a/meta/classes/meson.bbclass<br>
+++ b/meta/classes/meson.bbclass<br>
@@ -1,4 +1,4 @@<br>
-inherit siteinfo python3native<br>
+inherit siteinfo python3native setuptools3<br>
<br>
=C2=A0DEPENDS_append =3D &quot; meson-native ninja-native&quot;<br>
<br>
-- <br>
2.24.0<br>
<br>
</blockquote></div></div>
</blockquote></div></div>
</blockquote></div>
</blockquote></div></div>
</blockquote></div></div>

--000000000000a666520598e52d78--
