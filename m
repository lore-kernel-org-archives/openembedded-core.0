Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id DE0206D470
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 10:20:13 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id i31so2543427uae.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 02:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OL73YgHdYneqiABnp8TlXk9FQFBQWKq6x1d6Bw2rT6E=;
	b=tXWwG30D9pWHH6T9A0XfQ9zh1tjMbyxLPQdpYLNXgj0H+XxeUx6siTTTFR3+CyGB+p
	VdTDS5uEgorYH7AXFX/QkHpd/oadsEMrj8CfqvyKlmySPW0yqiUhMzzITAoaW00q9vLW
	rgmKkMrj6f5wfDvgd6dksSZTW3oCj2pVuklSwxf0NKTX7d/tNkfU4hti13Vhv1uAWrk2
	3gN5InNyAEb7aUo3GTMLV4SDMijTwUEhOxg4HuI/MFJUXk8AT7OjMUbn7EGnFnYhL18S
	jn/yjLX/rEy8dDSHNh4SzxR9LUG6HwQeoD1IVpXi87Wz10oT0x6g6Oryw7AQmcNJevFt
	sXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OL73YgHdYneqiABnp8TlXk9FQFBQWKq6x1d6Bw2rT6E=;
	b=O0MY9+hVQAdkR0qCuUhXzl6mVewz9WabaqRXvqbZj6JyXtUhhy/Vfo1kCMYtH/cyuZ
	JnYTSW4SVD5fVK/O8CrFDQSFnct9WuxB19kLcC6ktYb29bKSf4V6wucyAK8SANyJjg0h
	He8A1ULRtBVw+kq6i+9Q4pP1bTJ+tCmFAFsDJtb1HEdx8FR4HvQHsRoL8RMYc0YRv2+M
	Pej1xsT3X29gQndZC8JNTLzwm88aKK0LqSZdO6um11whAskZAQNb55ymmWD3qehQ/Mhe
	C6eWuItEuI6A+UsSUYKTFWExxNBv1y9IPZknstHW4P4OVvD12SaRCkHl28dBugfxourO
	aWfw==
X-Gm-Message-State: APjAAAW74ZmQ72b/f2lwFpE0WETbo1ZHIEh9e4giFMNjSYD++/qd7WW5
	+06lXo+N6S3R4mgve6InnvdGuUlcXB3CgnIhsn8=
X-Google-Smtp-Source: APXvYqzkyntoNEfVnG6/SoNGxhNlSEkij32R9tkSJDG6Vk7lvarKH6GP5UPKvd/bTHseZ33in2ORHxEXnqnFTVk3oEA=
X-Received: by 2002:ab0:681:: with SMTP id g1mr1812441uag.93.1575454814735;
	Wed, 04 Dec 2019 02:20:14 -0800 (PST)
MIME-Version: 1.0
References: <20191203220624.26500-1-anibal.limon@linaro.org>
	<CAMKF1spabEvBMwjvefWN7ULZ8ZpGfNDgJ1gf75u1B7h3oD4nJg@mail.gmail.com>
	<CA+_AqisSN24sPo5vOzeGY4Kdb_mmQxGArCu0Kw6yeSBv-a+QHw@mail.gmail.com>
In-Reply-To: <CA+_AqisSN24sPo5vOzeGY4Kdb_mmQxGArCu0Kw6yeSBv-a+QHw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Dec 2019 11:20:03 +0100
Message-ID: <CANNYZj90w9QghK8eTdvc-iE7tjONky=bDA=98Mr5ccH0sjgF4g@mail.gmail.com>
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
X-List-Received-Date: Wed, 04 Dec 2019 10:20:14 -0000
Content-Type: multipart/alternative; boundary="0000000000009793290598de28a0"

--0000000000009793290598de28a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I tend to agree with Khem; this change will pull in target python as build
and runtime dependency to all meson-using recipes, even those that have
nothing to do with python.

I'd suggest you fix the broken recipes individually by adding python3 to
DEPENDS. Yes, the "not a valid python" message is not helpful; suggestions
how to improve this are welcome.

Alex

On Wed, 4 Dec 2019 at 03:35, Anibal Limon <anibal.limon@linaro.org> wrote:

>
>
> On Tue, 3 Dec 2019 at 17:37, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>>
>> On Tue, Dec 3, 2019 at 2:06 PM An=C3=ADbal Lim=C3=B3n <anibal.limon@lina=
ro.org>
>> wrote:
>>
>>> Fixes,
>>>
>>> ...
>>> | Program python3 found: YES
>>> (/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/=
aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-=
native/python3)
>>> |
>>> | meson.build:36:0: ERROR: <ExternalProgram 'python3' ->
>>> ['/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work=
/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3=
-native/python3']>
>>> is not a valid python or it is missing setuptools
>>> |
>>> | A full log can be found at
>>> /home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/a=
arch64-linaro-linux/waffle/1.6.0-r0/build/meson-logs/meson-log.txt
>>> | WARNING: exit code 1 from a shell command.
>>> ...
>>>
>>
>> I wonder if it=E2=80=99s better to add this inherit to waffle recipe alo=
ne I
>> doubt that all meson using recipes are building python modules
>>
>
> This issue is triggered from waffle [1] but the actual meson code looks
> for setuptools [2].
>
> Anibal
>
> [1] https://gitlab.freedesktop.org/mesa/waffle/blob/master/meson.build#L3=
6
> [2]
> https://github.com/mesonbuild/meson/blob/master/mesonbuild/modules/python=
.py#L578
>
>
>>
>>
>>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>>> ---
>>>  meta/classes/meson.bbclass | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
>>> index efa6234078..90868963b7 100644
>>> --- a/meta/classes/meson.bbclass
>>> +++ b/meta/classes/meson.bbclass
>>> @@ -1,4 +1,4 @@
>>> -inherit siteinfo python3native
>>> +inherit siteinfo python3native setuptools3
>>>
>>>  DEPENDS_append =3D " meson-native ninja-native"
>>>
>>> --
>>> 2.24.0
>>>
>>>

--0000000000009793290598de28a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I tend to agree with Khem; this change will pull in t=
arget python as build and runtime dependency to all meson-using recipes, ev=
en those that have nothing to do with python.</div><div><br></div><div>I&#3=
9;d suggest you fix the broken recipes individually by adding python3 to DE=
PENDS. Yes, the &quot;not a valid python&quot; message is not helpful; sugg=
estions how to improve this are welcome.</div><div><br></div><div>Alex<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, 4 Dec 2019 at 03:35, Anibal Limon &lt;<a href=3D"mailto:anibal=
.limon@linaro.org">anibal.limon@linaro.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"=
><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, 3 Dec 2019 at 17:37, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div><br></div><div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 3, =
2019 at 2:06 PM An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@l=
inaro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Fixes,<br>
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

--0000000000009793290598de28a0--
