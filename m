Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
	[209.85.217.53])
	by mail.openembedded.org (Postfix) with ESMTP id BEEA27FC1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 16:24:24 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id x123so8605655vsc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 08:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+0OxDEF7fEx0KWqj5BA09AWYMgQXjVRX6oNdSKRQ2Pk=;
	b=oWFdv6OOY1vnDAbKglpIAtANGB7BA/cL6kIgg4tCrJfsBKNAEB0Zg1QBY07JyFnjZK
	R+A+L3NmCwnZ7pKkjUUiV8IJrt5jiQ45RPcTwQAFnkUoPtlAsUoBjyEY2C4jCD4dhH8f
	n/YLUuXlGugQlVGh7HulAQf2FDVre/ydhRyye5imgp4+W7ejRMH6UpUIQa4E0oOE/Z1c
	9+OVdvboexTwJZ0nS3dYHX3aAVUq4k991s0aTwCxpthBzOQrxULPIBXLzVG+i/8FdxHK
	jd5iCIfpORUbNRnMmZRpMaW3fEf8vN7I4mWUL8yIsVyI0QeaYwRzBg8xQb3HKqSRt5zF
	aChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+0OxDEF7fEx0KWqj5BA09AWYMgQXjVRX6oNdSKRQ2Pk=;
	b=JRDvH+JqS1TEdwyz83iKPw7xM5yykrTAz5yHSiff4eiP98C+tn2PVmHx+nkQMHHjAl
	QroKl9I9OCj6leLkXVxBIoxJ0aABPfwZLUkTw1wT7aA2TzdhG3pfpwFSl06o558xq737
	TLs55LtB8rP9wO0Hvol8yVwDfon5+Nc6+ibF83uurv2DHHgEVG9/IRhMuf/xd1I90sQG
	lGu6bmHyBbyqrFaHZPkIlfPcAEplE9T/LKAoTxh1vQKOkqBYnrU6JIavKadc56TYKy9Y
	j+oNYFkGBevWUJk/PZTY0Zt6Rr+imHcWAFpPaGulqbx70Mtg7rD4apA+H92FNb989aqm
	Yfjw==
X-Gm-Message-State: APjAAAXhbeHlXP/l07jqj0DU+6QA9rna2U85Xbup/Uo4nBj0/rvNLhbX
	yCbAkSCvT+FnbRrfKtkhakjYo0Pi4MJOFm68I/E=
X-Google-Smtp-Source: APXvYqwl/RfN+HYMnIc6edRcv8+ObuSjWS8BaAUaGdh1jdCbL9x9JTT/qqPTkJ5zWYptEvmyvXX+RUipEVFD0GRQoog=
X-Received: by 2002:a67:3187:: with SMTP id x129mr1853331vsx.23.1579019065389; 
	Tue, 14 Jan 2020 08:24:25 -0800 (PST)
MIME-Version: 1.0
References: <20200114162023.71342-1-anibal.limon@linaro.org>
In-Reply-To: <20200114162023.71342-1-anibal.limon@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Jan 2020 17:24:12 +0100
Message-ID: <CANNYZj9O4o+mCrAnUVwF2R-8=wtO=CLJ1SzdhhHT5eb3f3sZoQ@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>
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
X-List-Received-Date: Tue, 14 Jan 2020 16:24:24 -0000
Content-Type: multipart/alternative; boundary="0000000000007c73f8059c1c063e"

--0000000000007c73f8059c1c063e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This failure is not seen on the autobuilder. Is it something that happens
only under specific condition, and so should the dependency be conditional
to that?

Alex

On Tue, 14 Jan 2020 at 17:20, An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.o=
rg> wrote:

> The python3native.bbclass set PYTHON_{LIBRARY, INCLUDE_DIR} pointing to
> python target build, a patch was add to use target _sysconfigdata too [1]
> but is not available without python3 dependency.
>
> Fixes waffle build when trying to find _sysconfigdata module,
>
> ...
> | Program python3 found: YES
> (/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aa=
rch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-na=
tive/python3)
> |
> | meson.build:36:0: ERROR: <ExternalProgram 'python3' ->
> ['/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/a=
arch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-n=
ative/python3']>
> is not a valid python or it is missing setuptools
> |
> | A full log can be found at
> /home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aar=
ch64-linaro-linux/waffle/1.6.0-r0/build/meson-logs/meson-log.txt
> | WARNING: exit code 1 from a shell command.
> ...
>
> [1]
> http://git.openembedded.org/openembedded-core/commit/?id=3D02714c105426b0=
d687620913c1a7401b386428b6
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  meta/recipes-graphics/waffle/waffle_1.6.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/waffle/waffle_1.6.0.bb
> b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
> index 52cb1df899..a620295978 100644
> --- a/meta/recipes-graphics/waffle/waffle_1.6.0.bb
> +++ b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
> @@ -11,6 +11,8 @@ UPSTREAM_CHECK_URI =3D "
> http://www.waffle-gl.org/releases.html"
>
>  inherit meson features_check lib_package bash-completion
>
> +DEPENDS_append =3D " python3"
> +
>  # This should be overridden per-machine to reflect the capabilities of
> the GL
>  # stack.
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx
> x11-egl', '', d)} \
> --
> 2.24.1
>
>

--0000000000007c73f8059c1c063e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This failure is not seen on the autobuilder. Is it so=
mething that happens only under specific condition, and so should the depen=
dency be conditional to that?</div><div><br></div><div>Alex<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, 14 Jan 2020 at 17:20, An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal=
.limon@linaro.org">anibal.limon@linaro.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">The python3native.bbclass set PYT=
HON_{LIBRARY, INCLUDE_DIR} pointing to<br>
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

--0000000000007c73f8059c1c063e--
