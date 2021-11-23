Return-Path: <anibal.limon@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E5CBC433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 18:01:04 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.15017.1637690462764306166
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 10:01:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uR5uGNFB;
 spf=pass (domain: linaro.org, ip: 209.85.221.41,
 mailfrom: anibal.limon@linaro.org)
Received: by mail-wr1-f41.google.com with SMTP id i5so40468128wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 10:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kbcVYHDYAh/p8W6KFyuNxp7oz94SbTp7/5uxF8Zq7cg=;
        b=uR5uGNFBDX/87AASoWoAo4+ZeXXtHQhPi8ylYKQ1504P10/Rtz0p5087nHQLBbYya3
         1GJbvWZVSHUuJ4uCuIUGRt5An35DeZnYGC0tZLiFh/rcmD1FADh9qp0Q+nSgvDD437gH
         HP9OfWxhWAG4jAE384am+hkdKCi1BbD3mwgBnltIgrGVdGmWEpBuCeziNIHBcq2vPch/
         a0nT+gIpGhEfCNviZGO0kCJZcjcKLJTLYUA2j2Eq3c1EcQ418c9/UEbT2g7EAXJmbjkz
         JH89am1Kr0pRcKQvKEuILlsABrzceO2nGTfYunQj3DBum0CwbgcsLnmcGLb1eepfI6P8
         evqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kbcVYHDYAh/p8W6KFyuNxp7oz94SbTp7/5uxF8Zq7cg=;
        b=CRRrV+FfTHOElsINSO885ho7cmN/hi3i6Ier0tEyjQLflIlgiqhdYEbEXKNP47jJQN
         hBDrM8GGvFDLO4/V1zoxKrGhljJpG1dgL2LHGF5YlZI92o3lkzKcdwpbhKkBLa1svsoT
         BISLXchOunoC9Rd2Z6b1INi0CY3CrDtjHkeYm5IzFztHVnJ1LkKXnYn8ZHZg7T5R7Faz
         l9U9bpEQdn+MDqGxglBJqf7spak9LyRxEvokAaIVjqs8GJnriXap7ox9IFSIX4BeZpOr
         CzFgdbZgro43pgxkgFOW0nIBbV7//MQ6VK37v67rHPjmra/8bvJqhbE3oM1TJ9Gq0f/H
         rdNQ==
X-Gm-Message-State: AOAM5321VlA6rH03E79ULcO3R4hnS174KKTWkqtZifv88d5+ANAnQgvN
	NPHHgQhVfqTXcFAktMQ1yoUiKi9c6KjQA1YDZZxF8Q==
X-Google-Smtp-Source: 
 ABdhPJy8hK9pSSxk539S83libD66Z+6WvNDne+RFAczE+qW6gUofJPkI4pliHQiZ7HbxmQw/LUDtfagXL5Xv0g1WCCg=
X-Received: by 2002:adf:f551:: with SMTP id j17mr9556984wrp.392.1637690460701;
 Tue, 23 Nov 2021 10:01:00 -0800 (PST)
MIME-Version: 1.0
References: <16B7C59052251915.18463@lists.openembedded.org>
In-Reply-To: <16B7C59052251915.18463@lists.openembedded.org>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Tue, 23 Nov 2021 12:00:50 -0600
Message-ID: 
 <CA+_AqiuXK9Sd0EpcdWX32dj3G4ZmxJxO+PmiR3W8erPkKXTChw@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv3] waffle: add explicit dependency to
 cmake-native
To: anibal.limon@linaro.org
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, ross@burtonini.com
Content-Type: multipart/alternative; boundary="00000000000029a00505d1788603"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 18:01:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158615

--00000000000029a00505d1788603
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Is this patch good enough? or need another change.

Regards!,
Anibal

On Mon, 15 Nov 2021 at 10:36, Anibal Limon via lists.openembedded.org
<anibal.limon=3Dlinaro.org@lists.openembedded.org> wrote:

> cmake-native can get pulled into the sysroot via dependencies, but it
> is always needed:
>
> | Program cmake found: NO
> | ERROR: meson failed
>
> Fixes,
>
>   ...
>     File
> "/home/builds/oe-rpb-master/build-410c/tmp-rpb-glibc/work/cortexa53-linar=
o-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packa=
ges/mesonbuild/modules/cmake.py",
> line 241, in detect_cmake
>       p, stdout, stderr =3D mesonlib.Popen_safe(cmakebin.get_command() +
> ['--system-information', '-G', 'Ninja'])[0:3]
>     File
> "/home/builds/oe-rpb-master/build-410c/tmp-rpb-glibc/work/cortexa53-linar=
o-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packa=
ges/mesonbuild/mesonlib/universal.py",
> line 1397, in Popen_safe
>       p =3D subprocess.Popen(args, universal_newlines=3DTrue, close_fds=
=3DFalse,
>     File
> "/home/builds/oe-rpb-master/build-410c/tmp-rpb-glibc/work/cortexa53-linar=
o-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib/python3.10/subprocess=
.py",
> line 966, in __init__
>       self._execute_child(args, executable, preexec_fn, close_fds,
>     File
> "/home/builds/oe-rpb-master/build-410c/tmp-rpb-glibc/work/cortexa53-linar=
o-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib/python3.10/subprocess=
.py",
> line 1717, in _execute_child
>       and os.path.dirname(executable)
>     File
> "/home/builds/oe-rpb-master/build-410c/tmp-rpb-glibc/work/cortexa53-linar=
o-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib/python3.10/posixpath.=
py",
> line 152, in dirname
>       p =3D os.fspath(p)
>   ...
>
> Not inherit cmake class because expects meson-log.txt,
>
>   ...
>
>   File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>        0001:
>    *** 0002:meson_do_qa_configure(d)
>        0003:
>   File:
> '/home/builds/oe-rpb-master/build-410c/conf/../../layers/openembedded-cor=
e/meta/classes/meson.bbclass',
> lineno: 130, function: meson_do_qa_configure
>        0126:
>        0127:python meson_do_qa_configure() {
>        0128:    import re
>        0129:    warn_re =3D re.compile(r"^WARNING: Cross property (.+) is
> using default value (.+)$", re.MULTILINE)
>    *** 0130:    with open(d.expand("${B}/meson-logs/meson-log.txt")) as
> logfile:
>        0131:        log =3D logfile.read()
>        0132:    for (prop, value) in warn_re.findall(log):
>        0133:        bb.warn("Meson cross property %s used without explici=
t
> assignment, defaulting to %s" % (prop, value))
>        0134:}
>   Exception: FileNotFoundError: [Errno 2] No such file or directory:
> '/home/builds/oe-rpb-master/build-410c/tmp-rpb-glibc/work/cortexa53-linar=
o-linux/waffle/1.7.0-r0/build/meson-logs/meson-log.txt'
>   ...
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  meta/recipes-graphics/waffle/waffle_1.7.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/waffle/waffle_1.7.0.bb
> b/meta/recipes-graphics/waffle/waffle_1.7.0.bb
> index 6284af3076..ea11309940 100644
> --- a/meta/recipes-graphics/waffle/waffle_1.7.0.bb
> +++ b/meta/recipes-graphics/waffle/waffle_1.7.0.bb
> @@ -17,7 +17,7 @@ S =3D "${WORKDIR}/git"
>
>  inherit meson features_check lib_package bash-completion pkgconfig
>
> -DEPENDS:append =3D " python3"
> +DEPENDS:append =3D " python3 cmake-native"
>
>  # This should be overridden per-machine to reflect the capabilities of
> the GL
>  # stack.
> --
> 2.33.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158305):
> https://lists.openembedded.org/g/openembedded-core/message/158305
> Mute This Topic: https://lists.openembedded.org/mt/87073490/1276296
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> anibal.limon@linaro.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000029a00505d1788603
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Is this patch good enough? or need =
another change.</div><div><br></div><div>Regards!,</div><div>Anibal</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, 15 Nov 2021 at 10:36, Anibal Limon via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;anibal.limon=3D<a href=3D"mailto=
:linaro.org@lists.openembedded.org">linaro.org@lists.openembedded.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">cmake-=
native can get pulled into the sysroot via dependencies, but it<br>
is always needed:<br>
<br>
| Program cmake found: NO<br>
| ERROR: meson failed<br>
<br>
Fixes,<br>
<br>
=C2=A0 ...<br>
=C2=A0 =C2=A0 File &quot;/home/builds/oe-rpb-master/build-410c/tmp-rpb-glib=
c/work/cortexa53-linaro-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib=
/python3.10/site-packages/mesonbuild/modules/cmake.py&quot;, line 241, in d=
etect_cmake<br>
=C2=A0 =C2=A0 =C2=A0 p, stdout, stderr =3D mesonlib.Popen_safe(cmakebin.get=
_command() + [&#39;--system-information&#39;, &#39;-G&#39;, &#39;Ninja&#39;=
])[0:3]<br>
=C2=A0 =C2=A0 File &quot;/home/builds/oe-rpb-master/build-410c/tmp-rpb-glib=
c/work/cortexa53-linaro-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib=
/python3.10/site-packages/mesonbuild/mesonlib/universal.py&quot;, line 1397=
, in Popen_safe<br>
=C2=A0 =C2=A0 =C2=A0 p =3D subprocess.Popen(args, universal_newlines=3DTrue=
, close_fds=3DFalse,<br>
=C2=A0 =C2=A0 File &quot;/home/builds/oe-rpb-master/build-410c/tmp-rpb-glib=
c/work/cortexa53-linaro-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib=
/python3.10/subprocess.py&quot;, line 966, in __init__<br>
=C2=A0 =C2=A0 =C2=A0 self._execute_child(args, executable, preexec_fn, clos=
e_fds,<br>
=C2=A0 =C2=A0 File &quot;/home/builds/oe-rpb-master/build-410c/tmp-rpb-glib=
c/work/cortexa53-linaro-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib=
/python3.10/subprocess.py&quot;, line 1717, in _execute_child<br>
=C2=A0 =C2=A0 =C2=A0 and os.path.dirname(executable)<br>
=C2=A0 =C2=A0 File &quot;/home/builds/oe-rpb-master/build-410c/tmp-rpb-glib=
c/work/cortexa53-linaro-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib=
/python3.10/posixpath.py&quot;, line 152, in dirname<br>
=C2=A0 =C2=A0 =C2=A0 p =3D os.fspath(p)<br>
=C2=A0 ...<br>
<br>
Not inherit cmake class because expects meson-log.txt,<br>
<br>
=C2=A0 ...<br>
<br>
=C2=A0 File: &#39;exec_func_python() autogenerated&#39;, lineno: 2, functio=
n: &lt;module&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A00001:<br>
=C2=A0 =C2=A0*** 0002:meson_do_qa_configure(d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A00003:<br>
=C2=A0 File: &#39;/home/builds/oe-rpb-master/build-410c/conf/../../layers/o=
penembedded-core/meta/classes/meson.bbclass&#39;, lineno: 130, function: me=
son_do_qa_configure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A00126:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A00127:python meson_do_qa_configure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A00128:=C2=A0 =C2=A0 import re<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A00129:=C2=A0 =C2=A0 warn_re =3D re.compile(r&quot=
;^WARNING: Cross property (.+) is using default value (.+)$&quot;, re.MULTI=
LINE)<br>
=C2=A0 =C2=A0*** 0130:=C2=A0 =C2=A0 with open(d.expand(&quot;${B}/meson-log=
s/meson-log.txt&quot;)) as logfile:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A00131:=C2=A0 =C2=A0 =C2=A0 =C2=A0 log =3D logfile=
.read()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A00132:=C2=A0 =C2=A0 for (prop, value) in warn_re.=
findall(log):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A00133:=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;M=
eson cross property %s used without explicit assignment, defaulting to %s&q=
uot; % (prop, value))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A00134:}<br>
=C2=A0 Exception: FileNotFoundError: [Errno 2] No such file or directory: &=
#39;/home/builds/oe-rpb-master/build-410c/tmp-rpb-glibc/work/cortexa53-lina=
ro-linux/waffle/1.7.0-r0/build/meson-logs/meson-log.txt&#39;<br>
=C2=A0 ...<br>
<br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
naro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/waffle/<a href=3D"http://waffle_1.7.0.bb" rel=
=3D"noreferrer" target=3D"_blank">waffle_1.7.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/waffle/<a href=3D"http://waffle_1.7.0.bb=
" rel=3D"noreferrer" target=3D"_blank">waffle_1.7.0.bb</a> b/meta/recipes-g=
raphics/waffle/<a href=3D"http://waffle_1.7.0.bb" rel=3D"noreferrer" target=
=3D"_blank">waffle_1.7.0.bb</a><br>
index 6284af3076..ea11309940 100644<br>
--- a/meta/recipes-graphics/waffle/<a href=3D"http://waffle_1.7.0.bb" rel=
=3D"noreferrer" target=3D"_blank">waffle_1.7.0.bb</a><br>
+++ b/meta/recipes-graphics/waffle/<a href=3D"http://waffle_1.7.0.bb" rel=
=3D"noreferrer" target=3D"_blank">waffle_1.7.0.bb</a><br>
@@ -17,7 +17,7 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit meson features_check lib_package bash-completion pkgconfig<br=
>
<br>
-DEPENDS:append =3D &quot; python3&quot;<br>
+DEPENDS:append =3D &quot; python3 cmake-native&quot;<br>
<br>
=C2=A0# This should be overridden per-machine to reflect the capabilities o=
f the GL<br>
=C2=A0# stack.<br>
-- <br>
2.33.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158305): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158305" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158305</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87073490/1276=
296" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87073490/1276296</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:anibal.limon@linaro.org" t=
arget=3D"_blank">anibal.limon@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000029a00505d1788603--

