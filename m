Return-Path: <anibal.limon@linaro.org>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 04B637F7B9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 18:35:48 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id w20so171812uap.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 10:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MU9xisZbI/hKgDuXLDmj+xBvYjFa9MwtEAQeOKnSA0g=;
	b=ismnt3eRwDXk4kSa7z1XlE7808BDfuM7O1pO9UWUltVxFw+dnJ6BTO0KbnrQnCn9L3
	MNOe7ZtznYRGTFoBYN/mAEIeLRsjpXnRaDEFBYaW2fOLxatIhJJ1zflt0ra3pfUNLhjj
	kJkzOXu7NvpF7KDOgP/BEvqHGRTUWczeKPp3LSlj7lmJ3IyhB7ElYKLYnWQ49miMvD4q
	FyqvyQOqACIuFUkydjVO3vY13mhetidtnlJHzTgi9psv1TB6w9kai4k0WieMyHmkZf4D
	oKvEOP2jBw7r8wz4yu4IFLQzMvyByJRmV13wxr7WwdAbGkEMbYFnZAFvv5icQOmzgv/L
	pcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MU9xisZbI/hKgDuXLDmj+xBvYjFa9MwtEAQeOKnSA0g=;
	b=ITqCuD9Y3gHsmDaquTV1PnB+xu7Z4/QY2u2c32ja/BG14NkVTw70wF8IiE2lgZZEDe
	IxyvHYb3MJwePHz1WQE6qykRghvN4rFXicqmEONPA5lfEzD8m+/jieKrc6NYBeEX0WGs
	4Z+6Iy7/7OpG+aFhZLLO71ssQGUnFLAq71KzJuc7hVukFdlmk2MPQDTDMhVDArYwrCb/
	PDZCTFR9RM5GIw6unGNYfd5uSpKlUk0gz2lZvornb9NvZJCfNDz9iXjk03faWoUDiIx6
	6g74wkvKNIlZI6NU8mMbVzhDuoo588xzpkxo5VQydV9xtSSNhj+ZicS7H5pAlKOHw7ZL
	Ri4g==
X-Gm-Message-State: APjAAAUx1NIOXiEoSngoldqq0XYifc7o6KgnGBddXltIV9jwSw7zF/IV
	0C7htxDTiZP4GeMLDTztDoN0ZAubl9gOUPi5bsi9nQ==
X-Google-Smtp-Source: APXvYqwX/cCYTbtUo5/R0e6NzWwqBUa7ZyHeQY/tS4oRjAGrIdT7n8/wnDQWFgMqduX1ASUL8FfhOK8B9r5lV2zM1iU=
X-Received: by 2002:ab0:3381:: with SMTP id y1mr353166uap.93.1575484549705;
	Wed, 04 Dec 2019 10:35:49 -0800 (PST)
MIME-Version: 1.0
References: <20191203220624.26500-1-anibal.limon@linaro.org>
	<CAMKF1spabEvBMwjvefWN7ULZ8ZpGfNDgJ1gf75u1B7h3oD4nJg@mail.gmail.com>
	<CA+_AqisSN24sPo5vOzeGY4Kdb_mmQxGArCu0Kw6yeSBv-a+QHw@mail.gmail.com>
	<CANNYZj90w9QghK8eTdvc-iE7tjONky=bDA=98Mr5ccH0sjgF4g@mail.gmail.com>
In-Reply-To: <CANNYZj90w9QghK8eTdvc-iE7tjONky=bDA=98Mr5ccH0sjgF4g@mail.gmail.com>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Wed, 4 Dec 2019 12:35:38 -0600
Message-ID: <CA+_AqisJ1+g7Btaq-T-SmSVXLsM0iePfxbq2mgbz+1VSSvDYZw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
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
X-List-Received-Date: Wed, 04 Dec 2019 18:35:49 -0000
Content-Type: multipart/alternative; boundary="000000000000ef44c80598e514b8"

--000000000000ef44c80598e514b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Dec 2019 at 04:20, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> I tend to agree with Khem; this change will pull in target python as buil=
d
> and runtime dependency to all meson-using recipes, even those that have
> nothing to do with python.
>

Ok, it depends on python3-setuptools-native I will add this inherit on
waffle recipe.

Regards,
Anibal


>
> I'd suggest you fix the broken recipes individually by adding python3 to
> DEPENDS. Yes, the "not a valid python" message is not helpful; suggestion=
s
> how to improve this are welcome.
>
> Alex
>
> On Wed, 4 Dec 2019 at 03:35, Anibal Limon <anibal.limon@linaro.org> wrote=
:
>
>>
>>
>> On Tue, 3 Dec 2019 at 17:37, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>>
>>>
>>> On Tue, Dec 3, 2019 at 2:06 PM An=C3=ADbal Lim=C3=B3n <anibal.limon@lin=
aro.org>
>>> wrote:
>>>
>>>> Fixes,
>>>>
>>>> ...
>>>> | Program python3 found: YES
>>>> (/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work=
/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3=
-native/python3)
>>>> |
>>>> | meson.build:36:0: ERROR: <ExternalProgram 'python3' ->
>>>> ['/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/wor=
k/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python=
3-native/python3']>
>>>> is not a valid python or it is missing setuptools
>>>> |
>>>> | A full log can be found at
>>>> /home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/=
aarch64-linaro-linux/waffle/1.6.0-r0/build/meson-logs/meson-log.txt
>>>> | WARNING: exit code 1 from a shell command.
>>>> ...
>>>>
>>>
>>> I wonder if it=E2=80=99s better to add this inherit to waffle recipe al=
one I
>>> doubt that all meson using recipes are building python modules
>>>
>>
>> This issue is triggered from waffle [1] but the actual meson code looks
>> for setuptools [2].
>>
>> Anibal
>>
>> [1]
>> https://gitlab.freedesktop.org/mesa/waffle/blob/master/meson.build#L36
>> [2]
>> https://github.com/mesonbuild/meson/blob/master/mesonbuild/modules/pytho=
n.py#L578
>>
>>
>>>
>>>
>>>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>>>> ---
>>>>  meta/classes/meson.bbclass | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
>>>> index efa6234078..90868963b7 100644
>>>> --- a/meta/classes/meson.bbclass
>>>> +++ b/meta/classes/meson.bbclass
>>>> @@ -1,4 +1,4 @@
>>>> -inherit siteinfo python3native
>>>> +inherit siteinfo python3native setuptools3
>>>>
>>>>  DEPENDS_append =3D " meson-native ninja-native"
>>>>
>>>> --
>>>> 2.24.0
>>>>
>>>>

--000000000000ef44c80598e514b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 4 Dec 2019 at 04:20, Alexande=
r Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div>I tend to agree with Khem; this change will pull i=
n target python as build and runtime dependency to all meson-using recipes,=
 even those that have nothing to do with python.</div></div></blockquote><d=
iv><br></div><div>Ok, it depends on python3-setuptools-native I will add th=
is inherit on waffle recipe.</div><div><br></div><div>Regards,</div><div>An=
ibal</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div><br></div><div>I&#39;d suggest you fix the broken r=
ecipes individually by adding python3 to DEPENDS. Yes, the &quot;not a vali=
d python&quot; message is not helpful; suggestions how to improve this are =
welcome.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 4 Dec 2019 at 03:35=
, Anibal Limon &lt;<a href=3D"mailto:anibal.limon@linaro.org" target=3D"_bl=
ank">anibal.limon@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 3=
 Dec 2019 at 17:37, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div><br></div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 3, 2019 at 2:06 =
PM An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.org" ta=
rget=3D"_blank">anibal.limon@linaro.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Fixes,<br>
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

--000000000000ef44c80598e514b8--
