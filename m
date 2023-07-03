Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CCEEB64DC
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 05:49:40 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.21200.1688363372841111004
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jul 2023 22:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VVnArDLp;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b69ed7d050so63169591fa.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 22:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688363371; x=1690955371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9fxSKxQnE2C8Ond3k/e1Nxxd68+wXrsvJ7foLS2z+Po=;
        b=VVnArDLpqXwr7tXVE5+LCAiT0I6F+GqRYskEJCIjhfRkzxG7plg+J0dnbL/tmI3YLD
         238nbKdCanQdj9FVFdyrNgdbUc99BX8W5h7Brhde8Bo4pKKbgV8xYgXD/81U+hLW24Ia
         xArPqJUWibatyhQn1160d3bzQLGXyPuePmjC39oU7XygA/eX9vSqONLO+ADKrO/K871r
         t2bVGzmrvCZAFynlTrgYjr2E2qb5YMhZKBGdlApwJ8RFY6MB9YsdM4MjMorH+cNE+Jod
         dI5QRKOITkbnHScHYg4VNa1ZUDxeqaLQrK28FvyAXfazxdJktGAu1ncl7B1cagl5ODpd
         LpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688363371; x=1690955371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fxSKxQnE2C8Ond3k/e1Nxxd68+wXrsvJ7foLS2z+Po=;
        b=RZOMdsD5D2l2pIlSnMNmGebuLcPpx4epMW/HII5b3dkhazrcX6mMi11e/7eZaaWAqM
         IJe5GHor8saDNsAYHAUICvsuGV34eSLxtzyG9pHsnsxumNGqsaIyWcL/g/EkpJr5Htib
         7UoSxQRavunQpsPlCHqsVo4OE1PyRu/rPyyZjxdQ8duE3lyiFPadx5caMGq9TE31oG2e
         hTNdk4zT4i9jsZcGmErZQmBRU8tuQNF+DuQ6wu2W6d3lFvcERoo0s3T/cLlDuZCqcAlB
         XyPlpeU25MXi91blbI0drEyAG1E84wZkQ8KbzWAnzgC7o+mSMf6S/otzBOB5celjwqLo
         VMww==
X-Gm-Message-State: ABy/qLatUbJGOF8NXhPcI4EKFSFFFtTS2WLD4czLR/vf35nSYt5fG21A
	+v5KazYwOlGVfqWP00uBGcraKhpPejVsKzIc830=
X-Google-Smtp-Source: APBJJlEH7lMwuTm2CTXvwR89TGQDxPK5luuQF7Lg6a1XRpgqooavNONgFppYPWTik7zIIAgdm+wjL4lisJerezuPpyM=
X-Received: by 2002:ac2:4ed4:0:b0:4fb:52f1:9ab4 with SMTP id
 p20-20020ac24ed4000000b004fb52f19ab4mr5243911lfr.50.1688363370712; Sun, 02
 Jul 2023 22:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230703025959.3968541-1-raj.khem@gmail.com> <20230703025959.3968541-2-raj.khem@gmail.com>
In-Reply-To: <20230703025959.3968541-2-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Jul 2023 07:49:19 +0200
Message-ID: <CANNYZj967uL0xN2e1VhkkVEuVvF8_-XM=mUmWAnKDHyHyZGx5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] mesa: Point to native llvm-config
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f6932905ff8ebabe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 05:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183792

--000000000000f6932905ff8ebabe
Content-Type: text/plain; charset="UTF-8"

But should this be fixed in meson class rather?

Alex

On Mon 3. Jul 2023 at 5.00, Khem Raj <raj.khem@gmail.com> wrote:

> Default search in meson would grok /usr/bin for llvm-config and if found
> will use it, which might add wrong paths into cflags/ldflags, since we
> depend on llvm-native when building gallium support ( thats when
> llvm-config is effective), its better to point llvm-config into native
> sysroot so it can add correct paths into compiler/linker cmdline
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index 928899008e6..63d7494dfc4 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -75,6 +75,11 @@ EXTRA_OEMESON = " \
>  def strip_comma(s):
>      return s.strip(',')
>
> +# llvm-config should be the one from llvm-native and not from build host
> ( if llvm is installed on host )
> +do_write_config:append() {
> +    sed -i -e '/\[binaries\]/a\' -e "llvm-config =
> '${STAGING_BINDIR_NATIVE}/llvm-config'" ${WORKDIR}/meson.native
> +}
> +
>  PACKAGECONFIG = " \
>         gallium \
>         ${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} \
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183787):
> https://lists.openembedded.org/g/openembedded-core/message/183787
> Mute This Topic: https://lists.openembedded.org/mt/99920489/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f6932905ff8ebabe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">But should this be fixed in meson class rather?</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 3. Jul 2023 at 5.=
00, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:=
1ex;border-left-color:rgb(204,204,204)">Default search in meson would grok =
/usr/bin for llvm-config and if found<br>
will use it, which might add wrong paths into cflags/ldflags, since we<br>
depend on llvm-native when building gallium support ( thats when<br>
llvm-config is effective), its better to point llvm-config into native<br>
sysroot so it can add correct paths into compiler/linker cmdline<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index 928899008e6..63d7494dfc4 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -75,6 +75,11 @@ EXTRA_OEMESON =3D &quot; \<br>
=C2=A0def strip_comma(s):<br>
=C2=A0 =C2=A0 =C2=A0return s.strip(&#39;,&#39;)<br>
<br>
+# llvm-config should be the one from llvm-native and not from build host (=
 if llvm is installed on host )<br>
+do_write_config:append() {<br>
+=C2=A0 =C2=A0 sed -i -e &#39;/\[binaries\]/a\&#39; -e &quot;llvm-config =
=3D &#39;${STAGING_BINDIR_NATIVE}/llvm-config&#39;&quot; ${WORKDIR}/meson.n=
ative<br>
+}<br>
+<br>
=C2=A0PACKAGECONFIG =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gallium \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &=
#39;x11 vulkan wayland&#39;, d)} \<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#183787): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/183787" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/183787</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99920489/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99920489/1686489</a><br>
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

--000000000000f6932905ff8ebabe--

