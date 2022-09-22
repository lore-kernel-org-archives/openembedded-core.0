Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF3AC6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 13:17:16 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.6972.1663852627990702258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 06:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=msSufYYR;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id r7so15543570wrm.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 06:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hVlxLx/eJ7iOxq1+Z4b09SXa/DvUIO+VT3STF9JZkVw=;
        b=msSufYYRvI0UxDQw1SlY0JEmH2kktLlcVYYWFyKGxtA9JKwlE2HX6YgwccZJarjtPz
         qH3JKieY76bTkjLa8uBD6JoqZkOG4ulJcseosilrkWyRQrEpIrfzIML4p988BMwgzE3C
         PSQIIifc5vwblYkmHizeVFVW/6OD+h8wEN6ZjJQveX5qseslDZfhLbd30akKQWXWGUhH
         S0MgFNhXol94ywwIO6mPJM/u9xkFbz423bgubVIDX51KgQrIYAYSjz+6DIeOKl4DieNS
         CTMcc8Rop4ur2BJVriBdkavy0F9g7HJ7EMkklZX1qwfSLfixKMd+5OIPEFDhibHnT7Hc
         Rw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hVlxLx/eJ7iOxq1+Z4b09SXa/DvUIO+VT3STF9JZkVw=;
        b=wYLA1ZnEgBUzSJ4luEEa1HLVjAblggwK8f2zMQ1LhhKBsKULmmzFWQ0vrvJ+ZOg7qD
         aJkvqGRqnopq58f7GsFSEYntKUOc0fDN4oT9yDlh2KN0gggU9ZBs7ZhSsyFkS+bM048/
         +0mwPVFAt1PBvr+Xc8RHFji2uMjGSDdMXwYKmJqH8ob6F9H/T4SBRJ3Bw6jQ6dZcUqhV
         Sn+R8k3Ec0pRZczVXuBMNbzZ6FLowJOWbRdCknf6Pu9Z+g+os2CfygI84TOBsLRf5VnF
         iJUboLEMx0uCUNPZUzZnpVyKTVGasiGHijUhdVz6Cy6UFh1JNCBcisR3sF6dmgjgaVmL
         +mHQ==
X-Gm-Message-State: ACrzQf1bLzaZ3Wnplt6who2tCLwIepAX2eqPeqZFgXQYwPYP7abwylKI
	ojLw5NV4x6q1QtsLTdgMQRB3pEbVqzHg8TlRl1I=
X-Google-Smtp-Source: 
 AMsMyM6oSH4sYa1sCOpTPGOPkKpGdz4Urj2u2EmPKpScCLPevUvV/OkH8ZUV54qffQpDUvV551EXra22QZXrjefZ8Sc=
X-Received: by 2002:a5d:678a:0:b0:22a:c9d9:443d with SMTP id
 v10-20020a5d678a000000b0022ac9d9443dmr1966651wru.129.1663852626309; Thu, 22
 Sep 2022 06:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220922122402.32710-1-mikko.rapeli@linaro.org>
 <20220922122402.32710-2-mikko.rapeli@linaro.org>
In-Reply-To: <20220922122402.32710-2-mikko.rapeli@linaro.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 22 Sep 2022 15:16:53 +0200
Message-ID: 
 <CA+chaQf=ySOYLMvPJ-yLUzWopMoA+w+4RWntYx2FR4XVSKDe7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] git-describe.bbclass: add new class for
 "git describe --tags --allways --dirty"
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bff6ae05e943e011"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 13:17:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170980

--000000000000bff6ae05e943e011
Content-Type: text/plain; charset="UTF-8"

It would be nice to somehow consolidate this new bbclass with
https://git.openembedded.org/meta-openembedded/tree/meta-oe/classes/gitpkgv.bbclass
https://git.openembedded.org/meta-openembedded/tree/meta-oe/classes/gitver.bbclass

and at least move the various git "wrapper" functions to lib/oe for better
reuse.

On Thu, Sep 22, 2022 at 2:24 PM Mikko Rapeli <mikko.rapeli@linaro.org>
wrote:

> Output from git_describe() function can then be used in various places
> and from various git trees to create a user friend(lier) name to builds.
> Examples where this could be used is BUILD_ID, SDK_VERSION and
> IMAGE_VERSION_SUFFIX.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/classes/git-describe.bbclass | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta/classes/git-describe.bbclass
>
> diff --git a/meta/classes/git-describe.bbclass
> b/meta/classes/git-describe.bbclass
> new file mode 100644
> index 0000000000..3a2b06b3fd
> --- /dev/null
> +++ b/meta/classes/git-describe.bbclass
> @@ -0,0 +1,24 @@
> +# Defines a simple function which calls 'git describe --tags --always
> --dirty'
> +# on specified directory and returns the string.
> +#
> +# Can be used for example to easily generate a BUILD_ID in local.conf if
> +# TOPDIR build directory is under the main git tree for the project:
> +# INHERIT += "git-describe"
> +# BUILD_ID = "${@git_describe("${TOPDIR}/../meta-mylayer", d)}"
> +# # BUILD_ID to /etc/os-release
> +# OS_RELEASE_FIELDS:append:pn-os-release = " BUILD_ID"
> +# # Add os-release to all images
> +# IMAGE_INSTALL:append = " os-release"
> +# # BUILD_ID to image file name
> +# IMAGE_VERSION_SUFFIX = "-${BUILD_ID}"
> +# # BUILD_ID to SDK file names and paths
> +# SDK_VERSION = "${BUILD_ID}"
> +
> +def git_describe(p, d):
> +    import bb.process
> +    try:
> +        describe, _ = bb.process.run('git describe --tags --always
> --dirty', cwd=p)
> +    except bb.process.ExecutionError:
> +        describe = ''
> +    return describe.strip()
> +
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170970):
> https://lists.openembedded.org/g/openembedded-core/message/170970
> Mute This Topic: https://lists.openembedded.org/mt/93847068/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000bff6ae05e943e011
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It would be nice to somehow consolidate this new bbclass w=
ith<div><a href=3D"https://git.openembedded.org/meta-openembedded/tree/meta=
-oe/classes/gitpkgv.bbclass">https://git.openembedded.org/meta-openembedded=
/tree/meta-oe/classes/gitpkgv.bbclass</a><br></div><div><a href=3D"https://=
git.openembedded.org/meta-openembedded/tree/meta-oe/classes/gitver.bbclass"=
>https://git.openembedded.org/meta-openembedded/tree/meta-oe/classes/gitver=
.bbclass</a><br></div><div><br></div><div>and at least move the various git=
 &quot;wrapper&quot; functions to lib/oe for better reuse.</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep=
 22, 2022 at 2:24 PM Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro=
.org">mikko.rapeli@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Output from git_describe() function can then b=
e used in various places<br>
and from various git trees to create a user friend(lier) name to builds.<br=
>
Examples where this could be used is BUILD_ID, SDK_VERSION and<br>
IMAGE_VERSION_SUFFIX.<br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" =
target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/classes/git-describe.bbclass | 24 ++++++++++++++++++++++++<br>
=C2=A01 file changed, 24 insertions(+)<br>
=C2=A0create mode 100644 meta/classes/git-describe.bbclass<br>
<br>
diff --git a/meta/classes/git-describe.bbclass b/meta/classes/git-describe.=
bbclass<br>
new file mode 100644<br>
index 0000000000..3a2b06b3fd<br>
--- /dev/null<br>
+++ b/meta/classes/git-describe.bbclass<br>
@@ -0,0 +1,24 @@<br>
+# Defines a simple function which calls &#39;git describe --tags --always =
--dirty&#39;<br>
+# on specified directory and returns the string.<br>
+#<br>
+# Can be used for example to easily generate a BUILD_ID in local.conf if<b=
r>
+# TOPDIR build directory is under the main git tree for the project:<br>
+# INHERIT +=3D &quot;git-describe&quot;<br>
+# BUILD_ID =3D &quot;${@git_describe(&quot;${TOPDIR}/../meta-mylayer&quot;=
, d)}&quot;<br>
+# # BUILD_ID to /etc/os-release<br>
+# OS_RELEASE_FIELDS:append:pn-os-release =3D &quot; BUILD_ID&quot;<br>
+# # Add os-release to all images<br>
+# IMAGE_INSTALL:append =3D &quot; os-release&quot;<br>
+# # BUILD_ID to image file name<br>
+# IMAGE_VERSION_SUFFIX =3D &quot;-${BUILD_ID}&quot;<br>
+# # BUILD_ID to SDK file names and paths<br>
+# SDK_VERSION =3D &quot;${BUILD_ID}&quot;<br>
+<br>
+def git_describe(p, d):<br>
+=C2=A0 =C2=A0 import bb.process<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 describe, _ =3D bb.process.run(&#39;git descri=
be --tags --always --dirty&#39;, cwd=3Dp)<br>
+=C2=A0 =C2=A0 except bb.process.ExecutionError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 describe =3D &#39;&#39;<br>
+=C2=A0 =C2=A0 return describe.strip()<br>
+<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#170970): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/170970" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/170970</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93847068/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93847068/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000bff6ae05e943e011--

