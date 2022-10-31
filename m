Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C22FA3740
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 08:03:39 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.6743.1667203411883621845
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 01:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p3nPXcsP;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id j4so18086480lfk.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 01:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9YfLuqrVQihiGKnsPeJjoaOujQuPOn2WRFPJ1LLweVA=;
        b=p3nPXcsPaAFa4I3ECxrOPrbKdkP9c9dCcdWBH7X5LR0O5eFQnF0iHyTzpCn/mAiczD
         D9QNkFM8MKuxFHoAJNd/aZHeb6Hr8z3Nax1V/Vy7ModDdQ9++7zlPbJ4drkvJG9/j16m
         2Z35Gu1WFaKDnLdSHbmbzPmqtG31izOqqhFQHZY2tHnSLhnkfDBEdOnhMHS6EyBt6YGW
         0q91JQmZP9M5aw+l7oad7Y1See8E9HYz2HbNn5yYgAKsvRhV0dnXpH4PiYJcWptHZCO+
         Cp1upm+yvBaYWtw6GWtUy1RDGpcKEHZIMWC9USWyq5L5DKN9yhp+xHU637LZcc8dOHir
         KDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YfLuqrVQihiGKnsPeJjoaOujQuPOn2WRFPJ1LLweVA=;
        b=WiVa+vVjt4oFdTTRf0JzIX2JQ00wauMd9m99u4sem12ra7lmLq11VxQ3KnIapJe57F
         Kmt0ybGT7vGgIl/fxC191VzkZNZvGMSMOrkuX0S1Qxew7XKhXEt80dEwJVFV9BRDQWGo
         2Qu6vW+bcrUUDI2HojvU62LcJOJe6V5lNEQxr14N/AF+w6EpN8JZanJ3TBqdSU0VpI/G
         qkqeJx5ioeBoTOQBn2u81DatbtN6W/VJtyasv26IE8J/GEfHaJxx+SeSBX0/rFSI40NC
         lemzH7Yndtk5/6K8i01+p8hQQuUggcwJArrn4mTmtqxFmBAaGiRTLubyvQmB/cpK8LoR
         Q+Vg==
X-Gm-Message-State: ACrzQf0no6YhUHEZBygjx6GXEmQzoR3cLiXqFHTybyf1ZEI3RS3SSema
	ND2PJHLxeXov4oJsjcM1pwwZ0+juIKR9J6shXS8=
X-Google-Smtp-Source: AMsMyM6DJr0hDuMVLYs/CpBMdbQhosOyn8SVd6hs10P2ZyoJwj7Y6cltnWUf47d6hi2Nwxv3NoihGdr/ydUIIzOK5yc=
X-Received: by 2002:a05:6512:3989:b0:4a2:7d73:495a with SMTP id
 j9-20020a056512398900b004a27d73495amr4800518lfu.492.1667203409792; Mon, 31
 Oct 2022 01:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <1666833162-10154-1-git-send-email-yanxk.fnst@fujitsu.com>
In-Reply-To: <1666833162-10154-1-git-send-email-yanxk.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Oct 2022 09:03:18 +0100
Message-ID: <CANNYZj_SNB98B4WgHjY8nGP-N1LCHg10c+SJZGY-1w+AXMa3Yw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH V3] bc: Add ptest.
To: Yan Xin Kuan <yanxk.fnst@fujitsu.com>
Cc: fnstml-fujitsuten@fujitsu.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000002535e05ec500bfe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 08:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172292

--00000000000002535e05ec500bfe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Was kvm enabled in qemu?

Alex

On Mon 31. Oct 2022 at 8.59, Yan Xin Kuan <yanxk.fnst@fujitsu.com> wrote:

> From: Yan Xinkuan <yanxk.fnst@fujitsu.com>
>
> Add package test function for OSS 'bc', using bc in the
> system to do calculation jobs according to the .b files
> from the source code file of 'bc'.
>
> Test example as below:
> ......
> .00673400673400673400
> =E2=80=9CPASS: bc/div.b=E2=80=9D
> 99836408603283573660347145562829683495827909199408566065153345558783\
> 9427595471.89114392327665123852
> =E2=80=9CPASS: bc/exp.b=E2=80=9D
> length(b)=3D 1406
> =E2=80=9CPASS: bc/fact.b=E2=80=9D
> ......
>
> If bc runs the .b files and does not crash, it would 'PASS',
> otherwise it would 'FAIL'.
>
> I ran ptest with Intel CORE i5 4450, in qemux86-64, the whole
> test took up to 124 seconds, so it should be a slow test.
>
> Thanks to Ross Burton for the professional guidance.
>
> Signed-off-by: Yan Xinkuan <yanxk.fnst@fujitsu.com>
> ---
>  meta/conf/distro/include/ptest-packagelists.inc | 1 +
>  meta/recipes-extended/bc/bc/run-ptest           | 9 +++++++++
>  meta/recipes-extended/bc/bc_1.07.1.bb           | 9 +++++++--
>  3 files changed, 17 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-extended/bc/bc/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> index 56088e4e66..5cbed54cc5 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -100,6 +100,7 @@ PTESTS_SLOW =3D "\
>      tcl-ptest \
>      util-linux-ptest \
>      valgrind-ptest \
> +    bc-ptest \
>  "
>
>  PTESTS_SLOW:remove:riscv64 =3D "valgrind-ptest"
> diff --git a/meta/recipes-extended/bc/bc/run-ptest
> b/meta/recipes-extended/bc/bc/run-ptest
> new file mode 100644
> index 0000000000..da2156f8cd
> --- /dev/null
> +++ b/meta/recipes-extended/bc/bc/run-ptest
> @@ -0,0 +1,9 @@
> +#! /bin/sh
> +
> +for TEST in *.b; do
> +       if bc -l $TEST </dev/null; then
> +               echo =E2=80=9CPASS: bc/$TEST=E2=80=9D
> +        else
> +               echo =E2=80=9CFAIL: bc/$TEST=E2=80=9D
> +        fi
> +done
> diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb
> b/meta/recipes-extended/bc/bc_1.07.1.bb
> index 1bec76bb2a..178588f11b 100644
> --- a/meta/recipes-extended/bc/bc_1.07.1.bb
> +++ b/meta/recipes-extended/bc/bc_1.07.1.bb
> @@ -15,11 +15,12 @@ DEPENDS =3D "flex-native"
>  SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
>             file://no-gen-libmath.patch \
>             file://libmath.h \
> -           file://0001-dc-fix-exit-code-of-q-command.patch"
> +           file://0001-dc-fix-exit-code-of-q-command.patch \
> +           file://run-ptest"
>  SRC_URI[md5sum] =3D "cda93857418655ea43590736fc3ca9fc"
>  SRC_URI[sha256sum] =3D
> "62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a"
>
> -inherit autotools texinfo update-alternatives
> +inherit autotools texinfo update-alternatives ptest
>
>  PACKAGECONFIG ??=3D "readline"
>  PACKAGECONFIG[readline] =3D "--with-readline,--without-readline,readline=
"
> @@ -29,6 +30,10 @@ do_compile:prepend() {
>      cp -f ${WORKDIR}/libmath.h ${B}/bc/libmath.h
>  }
>
> +do_install_ptest() {
> +        install ${S}/Test/*.b ${D}${PTEST_PATH}
> +}
> +
>  ALTERNATIVE:${PN} =3D "bc dc"
>  ALTERNATIVE_PRIORITY =3D "100"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172291):
> https://lists.openembedded.org/g/openembedded-core/message/172291
> Mute This Topic: https://lists.openembedded.org/mt/94680520/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000002535e05ec500bfe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Was kvm enabled in qemu?</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon 31. Oct 2022 at 8.59, Yan Xin Kuan &lt=
;<a href=3D"mailto:yanxk.fnst@fujitsu.com">yanxk.fnst@fujitsu.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">From: Yan Xinkuan &lt;<a href=3D"mailto:yan=
xk.fnst@fujitsu.com" target=3D"_blank">yanxk.fnst@fujitsu.com</a>&gt;<br>
<br>
Add package test function for OSS &#39;bc&#39;, using bc in the<br>
system to do calculation jobs according to the .b files<br>
from the source code file of &#39;bc&#39;.<br>
<br>
Test example as below:<br>
......<br>
.00673400673400673400<br>
=E2=80=9CPASS: bc/div.b=E2=80=9D<br>
99836408603283573660347145562829683495827909199408566065153345558783\<br>
9427595471.89114392327665123852<br>
=E2=80=9CPASS: bc/exp.b=E2=80=9D<br>
length(b)=3D 1406<br>
=E2=80=9CPASS: bc/fact.b=E2=80=9D<br>
......<br>
<br>
If bc runs the .b files and does not crash, it would &#39;PASS&#39;,<br>
otherwise it would &#39;FAIL&#39;.<br>
<br>
I ran ptest with Intel CORE i5 4450, in qemux86-64, the whole<br>
test took up to 124 seconds, so it should be a slow test.<br>
<br>
Thanks to Ross Burton for the professional guidance.<br>
<br>
Signed-off-by: Yan Xinkuan &lt;<a href=3D"mailto:yanxk.fnst@fujitsu.com" ta=
rget=3D"_blank">yanxk.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/ptest-packagelists.inc | 1 +<br>
=C2=A0meta/recipes-extended/bc/bc/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 9 +++++++++<br>
=C2=A0meta/recipes-extended/bc/<a href=3D"http://bc_1.07.1.bb" rel=3D"noref=
errer" target=3D"_blank">bc_1.07.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 9 +++++++--<br>
=C2=A03 files changed, 17 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-extended/bc/bc/run-ptest<br>
<br>
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc<br>
index 56088e4e66..5cbed54cc5 100644<br>
--- a/meta/conf/distro/include/ptest-packagelists.inc<br>
+++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
@@ -100,6 +100,7 @@ PTESTS_SLOW =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0tcl-ptest \<br>
=C2=A0 =C2=A0 =C2=A0util-linux-ptest \<br>
=C2=A0 =C2=A0 =C2=A0valgrind-ptest \<br>
+=C2=A0 =C2=A0 bc-ptest \<br>
=C2=A0&quot;<br>
<br>
=C2=A0PTESTS_SLOW:remove:riscv64 =3D &quot;valgrind-ptest&quot;<br>
diff --git a/meta/recipes-extended/bc/bc/run-ptest b/meta/recipes-extended/=
bc/bc/run-ptest<br>
new file mode 100644<br>
index 0000000000..da2156f8cd<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/bc/bc/run-ptest<br>
@@ -0,0 +1,9 @@<br>
+#! /bin/sh<br>
+<br>
+for TEST in *.b; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if bc -l $TEST &lt;/dev/null; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo =E2=80=9CPASS:=
 bc/$TEST=E2=80=9D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo =E2=80=9CFAIL:=
 bc/$TEST=E2=80=9D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+done<br>
diff --git a/meta/recipes-extended/bc/<a href=3D"http://bc_1.07.1.bb" rel=
=3D"noreferrer" target=3D"_blank">bc_1.07.1.bb</a> b/meta/recipes-extended/=
bc/<a href=3D"http://bc_1.07.1.bb" rel=3D"noreferrer" target=3D"_blank">bc_=
1.07.1.bb</a><br>
index 1bec76bb2a..178588f11b 100644<br>
--- a/meta/recipes-extended/bc/<a href=3D"http://bc_1.07.1.bb" rel=3D"noref=
errer" target=3D"_blank">bc_1.07.1.bb</a><br>
+++ b/meta/recipes-extended/bc/<a href=3D"http://bc_1.07.1.bb" rel=3D"noref=
errer" target=3D"_blank">bc_1.07.1.bb</a><br>
@@ -15,11 +15,12 @@ DEPENDS =3D &quot;flex-native&quot;<br>
=C2=A0SRC_URI =3D &quot;${GNU_MIRROR}/${BPN}/${BP}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://no-gen-libmath.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libmath.h \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-dc-fix-exit-code-of-q=
-command.patch&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-dc-fix-exit-code-of-q=
-command.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;cda93857418655ea43590736fc3ca9fc&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;62adfca89b0a1c0164c2cdca59ca210c1d44c3ff=
c46daf9931cf4942664cb02a&quot;<br>
<br>
-inherit autotools texinfo update-alternatives<br>
+inherit autotools texinfo update-alternatives ptest<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;readline&quot;<br>
=C2=A0PACKAGECONFIG[readline] =3D &quot;--with-readline,--without-readline,=
readline&quot;<br>
@@ -29,6 +30,10 @@ do_compile:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0cp -f ${WORKDIR}/libmath.h ${B}/bc/libmath.h<br>
=C2=A0}<br>
<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install ${S}/Test/*.b ${D}${PTEST_PATH}<br>
+}<br>
+<br>
=C2=A0ALTERNATIVE:${PN} =3D &quot;bc dc&quot;<br>
=C2=A0ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172291): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172291" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172291</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94680520/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94680520/1686489</a><br>
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

--00000000000002535e05ec500bfe--

