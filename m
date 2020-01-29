Return-Path: <alex.kanavin@gmail.com>
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
	[209.85.219.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8461D60706
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 14:19:52 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id k15so1399848ybd.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 06:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TiDcqVHE6aDqqlNa7zjWRI/Qm94l3HdO4BUjduIEKv4=;
	b=eC+WVPUfuD6/eF/hK6LIi30l5xo0lwzmPudSoSkYYGtRlJy2V7Vg/XhVf1roPEWkHQ
	H5WAvAqQPqbAY89+udhEgh4Yj5uQ22BIUh6sY8ziTMTqdPT0SMmk0eS/DkOjnCrO2rsE
	NJttNeJIg/7XNJB3ggiOiZTvKnlL/iDhlu3KxgVSHt4+dpt7Wji07telZTzxnMMW5/EQ
	YUP+lE1gtXKNPxcwf8+hcDN1Vv8Wmb6BClImyjZAb+IgKh3XatavuZBiECKOk8vjMAmg
	zdSd5cwsCqtU10E4OSudosJjpOVQ5x2YvMPST1+DWtIcpoZae6z2tY01OqhuOzMEnraH
	vGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TiDcqVHE6aDqqlNa7zjWRI/Qm94l3HdO4BUjduIEKv4=;
	b=iN1qh3RKURPdkI2d+xNerpzZuxFbtGcNqyY+NkdkAxLUCD63e94+5+abgA4SIB9uV8
	X54H9daE4mzHLlAThcZ8NWWEpOEnNOSXSd6B7j5c8nY99Xo0Pb6hAS5/IvcptN9wIW4Q
	QLTQX504P5A3h1I8oOLTE1HHTJJX9sqI7aXYtrkT5FIWGmrmIMRuzIPDBHLrn+dupdbG
	iYXM+dQixD32sR6O3AQoODsQlqQQtHgQKIYp+dR52ekNxDOLdn+cMPdpUKOyJH8EHRl6
	k76ROlsxlZWLuYqVUhJH3SFttrzcjVwaztIIW2+bk6n+fGW6ok0+Prtdb14G5y9R3GuR
	1jHQ==
X-Gm-Message-State: APjAAAUxjpD8gAZPYNcR6xsgzpLcwhXk3DmQ5U180ETX1hZctd+K7r28
	sflZlLfeKIOrXZyPQORSAjPtm1Dd9T+Kqkkl5OYg21m9
X-Google-Smtp-Source: APXvYqxhaJ/UQCKPAvWKwdazXta5klQVxUn7Bx8ce5W+Yv9l5GOwl5etLCxZzTlZGeWERIPrRqD8WJp4AiXPu3yXEoc=
X-Received: by 2002:ab0:4aca:: with SMTP id t10mr17781260uae.89.1580317069753; 
	Wed, 29 Jan 2020 08:57:49 -0800 (PST)
MIME-Version: 1.0
References: <20200114162023.71342-1-anibal.limon@linaro.org>
	<CANNYZj9O4o+mCrAnUVwF2R-8=wtO=CLJ1SzdhhHT5eb3f3sZoQ@mail.gmail.com>
	<CA+_AqitZAmSamLitO4giYDg-tipJ8KPo_4za8Vrw7UvGGenzhQ@mail.gmail.com>
	<CA+_Aqiv6d0SJjo8XVbyi8oBJTFdfSBSRkX6rsg6BjV4tqC-_HQ@mail.gmail.com>
In-Reply-To: <CA+_Aqiv6d0SJjo8XVbyi8oBJTFdfSBSRkX6rsg6BjV4tqC-_HQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Jan 2020 17:57:38 +0100
Message-ID: <CANNYZj9KF9+_emrTCFLU1GK_DiaQKPbzBU4Vvkm8N4nUmN6dsQ@mail.gmail.com>
To: Anibal Limon <anibal.limon@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] meta/recipes-graphics/waffle: Add python3 dependency
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:10 -0000
Content-Type: multipart/alternative; boundary="0000000000009352c4059d4a3dfe"

--0000000000009352c4059d4a3dfe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Right, I am fine with the patch.

Alex

On Wed, 29 Jan 2020 at 17:54, Anibal Limon <anibal.limon@linaro.org> wrote:

> Hi,
>
> Any update on this?,
>
> Regards,
> Anibal
>
> On Mon, 20 Jan 2020 at 18:41, Anibal Limon <anibal.limon@linaro.org>
> wrote:
>
>> I found the answer, poky adds wayland support via DISTRO_FEATURES that
>> ends on python3 dependency in the waffle recipe-sysroot.
>>
>> You can test removing wayland from DISTRO_FEATURES to see the failure, w=
e
>> use OE and has two distro variants X/Wayland so the builds
>> fails only in X [1][2].
>>
>> Regards,
>> Anibal
>>
>> [1]
>> https://ci.linaro.org/job/lt-qcom-openembedded-rpb-zeus/61/DISTRO=3Drpb,=
MACHINE=3Ddragonboard-410c,label=3Ddocker-stretch-amd64/console
>> [2]
>> https://ci.linaro.org/job/lt-qcom-openembedded-rpb-zeus/61/DISTRO=3Drpb-=
wayland,MACHINE=3Ddragonboard-410c,label=3Ddocker-stretch-amd64/console
>>
>>
>> On Tue, 14 Jan 2020 at 10:24, Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>>
>>> This failure is not seen on the autobuilder. Is it something that
>>> happens only under specific condition, and so should the dependency be
>>> conditional to that?
>>>
>>> Alex
>>>
>>> On Tue, 14 Jan 2020 at 17:20, An=C3=ADbal Lim=C3=B3n <anibal.limon@lina=
ro.org>
>>> wrote:
>>>
>>>> The python3native.bbclass set PYTHON_{LIBRARY, INCLUDE_DIR} pointing t=
o
>>>> python target build, a patch was add to use target _sysconfigdata too
>>>> [1]
>>>> but is not available without python3 dependency.
>>>>
>>>> Fixes waffle build when trying to find _sysconfigdata module,
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
>>>> [1]
>>>> http://git.openembedded.org/openembedded-core/commit/?id=3D02714c10542=
6b0d687620913c1a7401b386428b6
>>>>
>>>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>>>> ---
>>>>  meta/recipes-graphics/waffle/waffle_1.6.0.bb | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/meta/recipes-graphics/waffle/waffle_1.6.0.bb
>>>> b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
>>>> index 52cb1df899..a620295978 100644
>>>> --- a/meta/recipes-graphics/waffle/waffle_1.6.0.bb
>>>> +++ b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
>>>> @@ -11,6 +11,8 @@ UPSTREAM_CHECK_URI =3D "
>>>> http://www.waffle-gl.org/releases.html"
>>>>
>>>>  inherit meson features_check lib_package bash-completion
>>>>
>>>> +DEPENDS_append =3D " python3"
>>>> +
>>>>  # This should be overridden per-machine to reflect the capabilities o=
f
>>>> the GL
>>>>  # stack.
>>>>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '=
glx
>>>> x11-egl', '', d)} \
>>>> --
>>>> 2.24.1
>>>>
>>>>

--0000000000009352c4059d4a3dfe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, I am fine with the patch.</div><div><br></div>=
<div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Wed, 29 Jan 2020 at 17:54, Anibal Limon &lt;<a href=
=3D"mailto:anibal.limon@linaro.org">anibal.limon@linaro.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div>Hi,</div><div><br></div><div>Any update on this?,</div><div><br></div=
><div>Regards,</div><div>Anibal</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, 20 Jan 2020 at 18:41, Anibal L=
imon &lt;<a href=3D"mailto:anibal.limon@linaro.org" target=3D"_blank">aniba=
l.limon@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr">I found the answer, poky adds wayland su=
pport via=C2=A0DISTRO_FEATURES that ends on python3 dependency in the waffl=
e recipe-sysroot.<div><br></div><div>You can test removing wayland from=C2=
=A0DISTRO_FEATURES to see the failure, we use OE and has two distro variant=
s X/Wayland so the builds</div><div>fails only in X [1][2].</div><div><br><=
/div><div>Regards,</div><div>Anibal</div><div><br></div><div>[1]=C2=A0<a hr=
ef=3D"https://ci.linaro.org/job/lt-qcom-openembedded-rpb-zeus/61/DISTRO=3Dr=
pb,MACHINE=3Ddragonboard-410c,label=3Ddocker-stretch-amd64/console" target=
=3D"_blank">https://ci.linaro.org/job/lt-qcom-openembedded-rpb-zeus/61/DIST=
RO=3Drpb,MACHINE=3Ddragonboard-410c,label=3Ddocker-stretch-amd64/console</a=
></div><div>[2]=C2=A0<a href=3D"https://ci.linaro.org/job/lt-qcom-openembed=
ded-rpb-zeus/61/DISTRO=3Drpb-wayland,MACHINE=3Ddragonboard-410c,label=3Ddoc=
ker-stretch-amd64/console" target=3D"_blank">https://ci.linaro.org/job/lt-q=
com-openembedded-rpb-zeus/61/DISTRO=3Drpb-wayland,MACHINE=3Ddragonboard-410=
c,label=3Ddocker-stretch-amd64/console</a></div><div><br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 14 J=
an 2020 at 10:24, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmai=
l.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>This f=
ailure is not seen on the autobuilder. Is it something that happens only un=
der specific condition, and so should the dependency be conditional to that=
?</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 14 Jan 2020 at 17:20, An=
=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.org" target=
=3D"_blank">anibal.limon@linaro.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">The python3native.bbclass set PYTHON_{LI=
BRARY, INCLUDE_DIR} pointing to<br>
python target build, a patch was add to use target _sysconfigdata too [1]<b=
r>
but is not available without python3 dependency.<br>
<br>
Fixes waffle build when trying to find _sysconfigdata module,<br>
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
<br>
[1] <a href=3D"http://git.openembedded.org/openembedded-core/commit/?id=3D0=
2714c105426b0d687620913c1a7401b386428b6" rel=3D"noreferrer" target=3D"_blan=
k">http://git.openembedded.org/openembedded-core/commit/?id=3D02714c105426b=
0d687620913c1a7401b386428b6</a><br>
<br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
naro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/waffle/<a href=3D"http://waffle_1.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">waffle_1.6.0.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-graphics/waffle/<a href=3D"http://waffle_1.6.0.bb=
" rel=3D"noreferrer" target=3D"_blank">waffle_1.6.0.bb</a> b/meta/recipes-g=
raphics/waffle/<a href=3D"http://waffle_1.6.0.bb" rel=3D"noreferrer" target=
=3D"_blank">waffle_1.6.0.bb</a><br>
index 52cb1df899..a620295978 100644<br>
--- a/meta/recipes-graphics/waffle/<a href=3D"http://waffle_1.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">waffle_1.6.0.bb</a><br>
+++ b/meta/recipes-graphics/waffle/<a href=3D"http://waffle_1.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">waffle_1.6.0.bb</a><br>
@@ -11,6 +11,8 @@ UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://www.waffle=
-gl.org/releases.html" rel=3D"noreferrer" target=3D"_blank">http://www.waff=
le-gl.org/releases.html</a>&quot;<br>
<br>
=C2=A0inherit meson features_check lib_package bash-completion<br>
<br>
+DEPENDS_append =3D &quot; python3&quot;<br>
+<br>
=C2=A0# This should be overridden per-machine to reflect the capabilities o=
f the GL<br>
=C2=A0# stack.<br>
=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#=
39;, &#39;x11&#39;, &#39;glx x11-egl&#39;, &#39;&#39;, d)} \<br>
-- <br>
2.24.1<br>
<br>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--0000000000009352c4059d4a3dfe--
