Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212D5EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 12:05:40 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.20527.1688645138717527748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 05:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hD66RYZ2;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso829037e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 05:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688645137; x=1691237137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2CIFOWKTV6OC/oGtS1VQmMn7vWC6CleBsB0nKe1W75E=;
        b=hD66RYZ2RWGCxwqO+Q3ZGzj5zfJtP/2T3Gj19iUMKjggWoOAI2hwxSGDqPbxyqcLr+
         D2OmrTIXtjNXHssWBhu3xEXmlppTKb4uWHkF9mA1OQ3GIN/bp9rCtB3I7iCv8E+6pEZ4
         C44xoguyPVPbZTkvaoCsWCrBSa83bK0JlMvLv3toNIQ1yPT/Bks8Nfa1b9gV2kZDrcsV
         dquTFxsR09eY8szF7hX8BCS5HRGoIFP5rJi+H0oTASbqos6dS8t6Nb0ASlghpe4mnlR8
         IysWwr+9rs2p9ykyqikLdK6qGyi+WPk6uNWMbbvvB5JzI6zzCwnG5OjRLkhCfekZXvMC
         XIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688645137; x=1691237137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CIFOWKTV6OC/oGtS1VQmMn7vWC6CleBsB0nKe1W75E=;
        b=hHWT92adz3wxFtRkgfnJPJwtnau9pgDe2UPWPbSFtHsszLFi6SfDyM/qn4YtJtquoh
         KEL8DIedFksJgx5QAwuZeeHctcvaGHab5LHJ5R2NUQdxaVZzKftjxxPkaTUiqRCKv7fd
         bT93Ubg1EahGU3ditS44jYczkaQy4YAeGzbFmrswwTpsaNeWYI682HEa7IqQVZYZ8R5X
         YwbkpodLKf67x+qFMehIgRlehhssLIy84fDeiYJzcVaGC6Vp76GhL+BC4bQbCiRDd5WD
         9zr59f8Xp0PP1Cc7rIWCTt74uX1FmNwdRw3uuCxMps/CH4pDzob7e4OkWZuAj7/9YfKk
         E8wg==
X-Gm-Message-State: ABy/qLYlownLDsv5jmj8YoKIzg2RSUT9FN10RY8HnvC+028dtJqtr+fq
	u8cxKFeMefw4wePwWIgNkUg3VscyJtRVBf7LKmIcEtK/
X-Google-Smtp-Source: APBJJlH/DoG+ZXtkTx/t7zORJcC4HhyDVyIDjOdXDWcuW+0SE2o2XdbRSZJ3FA4cFApT7Y7upWV8HaEXmt0nYGjo5og=
X-Received: by 2002:a2e:9b15:0:b0:2b1:a89a:5f2b with SMTP id
 u21-20020a2e9b15000000b002b1a89a5f2bmr1256695lji.2.1688645136399; Thu, 06 Jul
 2023 05:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230706120105.553140-1-jstephan@baylibre.com> <20230706120105.553140-2-jstephan@baylibre.com>
In-Reply-To: <20230706120105.553140-2-jstephan@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Jul 2023 14:05:25 +0200
Message-ID: <CANNYZj8AhEXqdQpSYZA4hJEcA2jzbeHcMp1OtkRzPXGKA7dp2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] less: switch to github URI
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000081c2a505ffd05558"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 12:05:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183934

--00000000000081c2a505ffd05558
Content-Type: text/plain; charset="UTF-8"

This is still a no. Please read the feedback.

Alex

On Thu 6. Jul 2023 at 14.01, Julien Stephan <jstephan@baylibre.com> wrote:

> as of today, release tarballs are fetched from [1] but the less test code
> is not
> bundled within these releases. A github issue has been opened asking for
> maintainer to bundle it [2]
>
> In order to add ptest for less, switch to github URI. This commit can be
> reverted
> if release tarballs from [1] bundle the test code in the future.
>
> [YOCTO #15073]
>
> [1]: http://www.greenwoodsoftware.com/
> [2]: https://github.com/gwsw/less/issues/344
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  meta/recipes-extended/less/less_633.bb | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-extended/less/less_633.bb
> b/meta/recipes-extended/less/less_633.bb
> index 2defb5ccb7a..e6535d16a78 100644
> --- a/meta/recipes-extended/less/less_633.bb
> +++ b/meta/recipes-extended/less/less_633.bb
> @@ -23,16 +23,23 @@ LICENSE = "GPL-3.0-or-later | BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
>                      file://LICENSE;md5=1b2446f5c8632bf63a97d7a49750e1c6 \
>                      "
> -DEPENDS = "ncurses"
> +DEPENDS = "ncurses groff-native"
>
> -SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
> +SRC_URI = "git://github.com/gwsw/less.git;protocol=https;branch=master"
> +SRCREV = "0d7ca880375bde651313f03f7115d26921b43722"
>
> -SRC_URI[sha256sum] =
> "2f201d64b828b88af36dfe6cfdba3e0819ece2e446ebe6224813209aaefed04f"
> -
> -UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html
> "
> +S = "${WORKDIR}/git"
>
>  inherit autotools update-alternatives
>
> +# According to the README of the project when getting code from git we
> should run
> +# the following command before running the configure script
> +do_configure:prepend () {
> +        cd ${S}
> +        make -f Makefile.aut distfiles
> +        cd -
> +}
> +
>  do_install () {
>          oe_runmake 'bindir=${D}${bindir}' 'mandir=${D}${mandir}' install
>  }
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183932):
> https://lists.openembedded.org/g/openembedded-core/message/183932
> Mute This Topic: https://lists.openembedded.org/mt/99984034/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000081c2a505ffd05558
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This is still a no. Please read the feedback.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu 6. Jul 2023 at 14.0=
1, Julien Stephan &lt;<a href=3D"mailto:jstephan@baylibre.com">jstephan@bay=
libre.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)">as of today, release t=
arballs are fetched from [1] but the less test code is not<br>
bundled within these releases. A github issue has been opened asking for<br=
>
maintainer to bundle it [2]<br>
<br>
In order to add ptest for less, switch to github URI. This commit can be re=
verted<br>
if release tarballs from [1] bundle the test code in the future.<br>
<br>
[YOCTO #15073]<br>
<br>
[1]: <a href=3D"http://www.greenwoodsoftware.com/" rel=3D"noreferrer" targe=
t=3D"_blank">http://www.greenwoodsoftware.com/</a><br>
[2]: <a href=3D"https://github.com/gwsw/less/issues/344" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/gwsw/less/issues/344</a><br>
<br>
Signed-off-by: Julien Stephan &lt;<a href=3D"mailto:jstephan@baylibre.com" =
target=3D"_blank">jstephan@baylibre.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/less/<a href=3D"http://less_633.bb" rel=3D"nore=
ferrer" target=3D"_blank">less_633.bb</a> | 17 ++++++++++++-----<br>
=C2=A01 file changed, 12 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/less/<a href=3D"http://less_633.bb" rel=
=3D"noreferrer" target=3D"_blank">less_633.bb</a> b/meta/recipes-extended/l=
ess/<a href=3D"http://less_633.bb" rel=3D"noreferrer" target=3D"_blank">les=
s_633.bb</a><br>
index 2defb5ccb7a..e6535d16a78 100644<br>
--- a/meta/recipes-extended/less/<a href=3D"http://less_633.bb" rel=3D"nore=
ferrer" target=3D"_blank">less_633.bb</a><br>
+++ b/meta/recipes-extended/less/<a href=3D"http://less_633.bb" rel=3D"nore=
ferrer" target=3D"_blank">less_633.bb</a><br>
@@ -23,16 +23,23 @@ LICENSE =3D &quot;GPL-3.0-or-later | BSD-2-Clause&quot;=
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1ebbd3e34237af26da5dc=
08a4e440464 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENSE;md5=3D1b2446f5c8632bf63a97d7a49750e1c6 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;<br>
-DEPENDS =3D &quot;ncurses&quot;<br>
+DEPENDS =3D &quot;ncurses groff-native&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://www.greenwoodsoftware.com/$%7BBPN%7D/$=
%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www=
.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/gwsw/less.git;protoco=
l=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com/=
gwsw/less.git;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
+SRCREV =3D &quot;0d7ca880375bde651313f03f7115d26921b43722&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;2f201d64b828b88af36dfe6cfdba3e0819ece2e446ebe=
6224813209aaefed04f&quot;<br>
-<br>
-UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://www.greenwoodsoftware.com/l=
ess/download.html" rel=3D"noreferrer" target=3D"_blank">http://www.greenwoo=
dsoftware.com/less/download.html</a>&quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit autotools update-alternatives<br>
<br>
+# According to the README of the project when getting code from git we sho=
uld run<br>
+# the following command before running the configure script<br>
+do_configure:prepend () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 make -f Makefile.aut distfiles<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd -<br>
+}<br>
+<br>
=C2=A0do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake &#39;bindir=3D${D}${bindir}&#3=
9; &#39;mandir=3D${D}${mandir}&#39; install<br>
=C2=A0}<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#183932): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/183932" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/183932</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99984034/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99984034/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000081c2a505ffd05558--

