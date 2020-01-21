Return-Path: <anibal.limon@linaro.org>
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
	[209.85.217.50])
	by mail.openembedded.org (Postfix) with ESMTP id E15D27FD88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 00:41:45 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id u14so716345vsu.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 16:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3VatVr+0yVE4smuqsqRm7PxwFOaAgnnnmVHZjeakJPY=;
	b=Q+J6ZYM6bBIfws6J6k03hTXc0XO8Ye7g4bbhXSE/uiggp6mgJsWLxrXo+aIA385aCm
	QJGNeCqNSTpSC5deFDaI8D8yFdnHKGaMeycaoK+PRvz6eVvw/UzhT7O3AjkoDPUnpbJ6
	xepp5VgexOlLQjEB6YVKV4T8NYMrWG0iowgKNzzxIHPFZFu1HCyk8HBlj3J0rm0rYfdS
	L7r1ggtm436AR6W0Ewpb2hDxnYqdpyvx1uyk0SHtU+K25dzhimNRbyR9f4KFRIL/caER
	cKsQwfuYMW3tD/Mn6tFNY3xSBp8k0XeuhgRtlQFtZ3qDTerkDfTCXOI9sUYpd2Diq16M
	SJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3VatVr+0yVE4smuqsqRm7PxwFOaAgnnnmVHZjeakJPY=;
	b=YRgdsi06tYyXVhQT/Ys8JrQh1p7yHsbJYZcBPnwNyAvy3IacuUFxz9W0IMqBQa//+8
	Ja+G1NApH+piTXUWZWW9IMIDtoS+9i7Lm72LHQzfy2fuVq5GxJ16c8MoLiOGWwwsbTho
	9ladLAo1fSHLSEiwinXszoAaFtHrFdLjWOERLNYk3nfY9AlMqLtp5luAZsq6IEoAbuUc
	/cH5WAp61fN/a5xdXcUgNJ5j1daZbcZc+bdeTRpl6iL3N9Lt5FfXOsIZivLbIQ+b7Cg9
	FZZ7QGJ17W87b3P4OcjBxkZ4hLkboXPtDZexq2DtENsoU9rql/cjCLFCCua5/xJNxDe8
	TiOA==
X-Gm-Message-State: APjAAAWU84pOjZpkRxzYtS0mEVQVgM9Hx5NkPjIkd49ATQItTpJyB7xA
	pwmShTrnUPB9nAFfcZ/JlFXM7kKRgkB4nXocWo6B/A==
X-Google-Smtp-Source: APXvYqywvsfcAJ5YownFp5g2R7ZuFlmjlcgDry6FxSyTo8Gkxs09ylUPABmyTXqTm7dUeOyORkXX5KVyvt7wDSmSKd4=
X-Received: by 2002:a67:fc96:: with SMTP id x22mr1169901vsp.33.1579567306626; 
	Mon, 20 Jan 2020 16:41:46 -0800 (PST)
MIME-Version: 1.0
References: <20200114162023.71342-1-anibal.limon@linaro.org>
	<CANNYZj9O4o+mCrAnUVwF2R-8=wtO=CLJ1SzdhhHT5eb3f3sZoQ@mail.gmail.com>
In-Reply-To: <CANNYZj9O4o+mCrAnUVwF2R-8=wtO=CLJ1SzdhhHT5eb3f3sZoQ@mail.gmail.com>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Mon, 20 Jan 2020 18:41:35 -0600
Message-ID: <CA+_AqitZAmSamLitO4giYDg-tipJ8KPo_4za8Vrw7UvGGenzhQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
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
X-List-Received-Date: Tue, 21 Jan 2020 00:41:46 -0000
Content-Type: multipart/alternative; boundary="00000000000035f103059c9bac86"

--00000000000035f103059c9bac86
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I found the answer, poky adds wayland support via DISTRO_FEATURES that ends
on python3 dependency in the waffle recipe-sysroot.

You can test removing wayland from DISTRO_FEATURES to see the failure, we
use OE and has two distro variants X/Wayland so the builds
fails only in X [1][2].

Regards,
Anibal

[1]
https://ci.linaro.org/job/lt-qcom-openembedded-rpb-zeus/61/DISTRO=3Drpb,MAC=
HINE=3Ddragonboard-410c,label=3Ddocker-stretch-amd64/console
[2]
https://ci.linaro.org/job/lt-qcom-openembedded-rpb-zeus/61/DISTRO=3Drpb-way=
land,MACHINE=3Ddragonboard-410c,label=3Ddocker-stretch-amd64/console


On Tue, 14 Jan 2020 at 10:24, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> This failure is not seen on the autobuilder. Is it something that happens
> only under specific condition, and so should the dependency be conditiona=
l
> to that?
>
> Alex
>
> On Tue, 14 Jan 2020 at 17:20, An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro=
.org>
> wrote:
>
>> The python3native.bbclass set PYTHON_{LIBRARY, INCLUDE_DIR} pointing to
>> python target build, a patch was add to use target _sysconfigdata too [1=
]
>> but is not available without python3 dependency.
>>
>> Fixes waffle build when trying to find _sysconfigdata module,
>>
>> ...
>> | Program python3 found: YES
>> (/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/a=
arch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-n=
ative/python3)
>> |
>> | meson.build:36:0: ERROR: <ExternalProgram 'python3' ->
>> ['/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/=
aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-=
native/python3']>
>> is not a valid python or it is missing setuptools
>> |
>> | A full log can be found at
>> /home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aa=
rch64-linaro-linux/waffle/1.6.0-r0/build/meson-logs/meson-log.txt
>> | WARNING: exit code 1 from a shell command.
>> ...
>>
>> [1]
>> http://git.openembedded.org/openembedded-core/commit/?id=3D02714c105426b=
0d687620913c1a7401b386428b6
>>
>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>> ---
>>  meta/recipes-graphics/waffle/waffle_1.6.0.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-graphics/waffle/waffle_1.6.0.bb
>> b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
>> index 52cb1df899..a620295978 100644
>> --- a/meta/recipes-graphics/waffle/waffle_1.6.0.bb
>> +++ b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
>> @@ -11,6 +11,8 @@ UPSTREAM_CHECK_URI =3D "
>> http://www.waffle-gl.org/releases.html"
>>
>>  inherit meson features_check lib_package bash-completion
>>
>> +DEPENDS_append =3D " python3"
>> +
>>  # This should be overridden per-machine to reflect the capabilities of
>> the GL
>>  # stack.
>>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gl=
x
>> x11-egl', '', d)} \
>> --
>> 2.24.1
>>
>>

--00000000000035f103059c9bac86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I found the answer, poky adds wayland support via=C2=A0DIS=
TRO_FEATURES that ends on python3 dependency in the waffle recipe-sysroot.<=
div><br></div><div>You can test removing wayland from=C2=A0DISTRO_FEATURES =
to see the failure, we use OE and has two distro variants X/Wayland so the =
builds</div><div>fails only in X [1][2].</div><div><br></div><div>Regards,<=
/div><div>Anibal</div><div><br></div><div>[1]=C2=A0<a href=3D"https://ci.li=
naro.org/job/lt-qcom-openembedded-rpb-zeus/61/DISTRO=3Drpb,MACHINE=3Ddragon=
board-410c,label=3Ddocker-stretch-amd64/console">https://ci.linaro.org/job/=
lt-qcom-openembedded-rpb-zeus/61/DISTRO=3Drpb,MACHINE=3Ddragonboard-410c,la=
bel=3Ddocker-stretch-amd64/console</a></div><div>[2]=C2=A0<a href=3D"https:=
//ci.linaro.org/job/lt-qcom-openembedded-rpb-zeus/61/DISTRO=3Drpb-wayland,M=
ACHINE=3Ddragonboard-410c,label=3Ddocker-stretch-amd64/console">https://ci.=
linaro.org/job/lt-qcom-openembedded-rpb-zeus/61/DISTRO=3Drpb-wayland,MACHIN=
E=3Ddragonboard-410c,label=3Ddocker-stretch-amd64/console</a></div><div><br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 14 Jan 2020 at 10:24, Alexander Kanavin &lt;<a href=3D"mailt=
o:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>This =
failure is not seen on the autobuilder. Is it something that happens only u=
nder specific condition, and so should the dependency be conditional to tha=
t?</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 14 Jan 2020 at 17:20, An=
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

--00000000000035f103059c9bac86--
