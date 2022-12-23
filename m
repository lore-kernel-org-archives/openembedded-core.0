Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A63C3DA7A
	for <webhook@archiver.kernel.org>; Fri, 23 Dec 2022 09:43:27 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.68948.1671788598906209542
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Dec 2022 01:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Np7mZvGt;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id m29so6402992lfo.11
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Dec 2022 01:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4IB7FZfQrAkoFeC6hsF1b5rOq4laV1dAIxjmHqQLoEs=;
        b=Np7mZvGtTqfxQDmuzdiOth4Je34+cLYrXD91/s+4LTU2FGJt0vFSwjabnjElMQHlI3
         Gp1I98gFWyfqtKSsE2DG/MUTazkwPXsRNOjePSVfJqkLn4Z4R8oad8FvcE9D7O/7BunX
         Ew46XoGQ8ErpFlpAOwgFgjUx6kzNG9iqabsIqXRpfxNhm1HDSm66/XttEhJvvJUqHAeU
         rBqUlXQ+JFBCvHD7ftGFf/DlNM/djdWuoSAX0yYdtQu4iQOUSuc+QBkF2fvgRIpvMlc/
         uTAcCxfiSKLmsg1uciikqnlq4OUgs46G2CbpBce1uunstgEegxm/8bdfOKoPpUBEHx7M
         C/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IB7FZfQrAkoFeC6hsF1b5rOq4laV1dAIxjmHqQLoEs=;
        b=nJ1zY6Rrwu7r78RKj+GL7mCtIfiH6H82/bLm27Y0dlYOQtEvUrOx3GgotalDmv1dwr
         TDKEm9gWPhE+a2kuwWgMmuoLeiKpiJdqAD0Z9VWOrzUIaSzZa/waW2/si7g9mitLrlSa
         hm44zSu+NIj3zx2W2EGMr9C0teOr11aDIOsag7OvaFoFVYNl2ifU2WdGU2g95zqSTq/d
         UkLP1dT5jdPEJhTex0q9VQ1dFEtt5nUBcZWmCdTykaoDT34I2sAhxgPtCJMHx0Q8yopX
         lSyiIIq9T+YTUkS6xdtaQ0Ew2x77YVjeNYqPBM2tYTpGLiQmKvWbtzD8OApVOVxtTZFv
         eIGA==
X-Gm-Message-State: AFqh2ko43zhIeD8xDj5LeNU0kSLobSmyPsM4VGxYLDoH1ImAWC17Mzof
	+FGhMu1RDkDI7YohSx8ZxeNwfXaxV0W1j60ivYI=
X-Google-Smtp-Source: AMrXdXtl782IRyQDFBIpJWJysHGwOGSAV8ytUn+Uu8vvtjeGuikc7j331HFg+0RpvsJA2rlFgmfV+RzwSUJbFGkNbJc=
X-Received: by 2002:ac2:4c28:0:b0:4a2:4d53:8294 with SMTP id
 u8-20020ac24c28000000b004a24d538294mr388789lfq.263.1671788596601; Fri, 23 Dec
 2022 01:43:16 -0800 (PST)
MIME-Version: 1.0
References: <20221223093229.823322-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20221223093229.823322-1-mingli.yu@eng.windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 23 Dec 2022 10:43:05 +0100
Message-ID: <CANNYZj-iY82hN76qV6DZSfMHobF30hM7rKRXkVwFUYGDV1AkJw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcr: add opengl to REQUIRED_DISTRO_FEATURES
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000070a77105f07b9d4e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Dec 2022 09:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174977

--00000000000070a77105f07b9d4e
Content-Type: text/plain; charset="UTF-8"

Is OpenGL really mandatory for gtk4?

Alex

On Fri 23. Dec 2022 at 10.32, Yu, Mingli <mingli.yu@eng.windriver.com>
wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> Fixes:
>   $ bitbake gcr
>   ERROR: Nothing PROVIDES 'gtk4' (but
> /build/layers/oe-core/meta/recipes-gnome/gcr/gcr_4.0.0.bb DEPENDS on or
> otherwise requires it)
> gtk4 was skipped: missing required distro feature 'opengl' (not in
> DISTRO_FEATURES)
>   ERROR: Required build target 'gcr' has no buildable providers.
>   Missing or unbuildable dependency chain was: ['gcr', 'gtk4']
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-gnome/gcr/gcr_4.0.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-gnome/gcr/gcr_4.0.0.bb b/meta/recipes-gnome/gcr/
> gcr_4.0.0.bb
> index 264069ffd1..22edd386fc 100644
> --- a/meta/recipes-gnome/gcr/gcr_4.0.0.bb
> +++ b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
> @@ -20,6 +20,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
>  inherit gnomebase gtk-icon-cache gi-docgen features_check
> upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
>  UPSTREAM_CHECK_REGEX = "gcr-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
>
> +REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', 'opengl', '', d)}"
> +
>  SRC_URI +=
> "file://0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch"
>  SRC_URI[archive.sha256sum] =
> "c45855924f0ee7bab43e2dd38bfafd2ac815c6e9864341c0161e171173dcec7c"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174976):
> https://lists.openembedded.org/g/openembedded-core/message/174976
> Mute This Topic: https://lists.openembedded.org/mt/95842308/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000070a77105f07b9d4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Is OpenGL really mandatory for gtk4?</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 23. Dec 2022 at 10.32, Yu, M=
ingli &lt;<a href=3D"mailto:mingli.yu@eng.windriver.com">mingli.yu@eng.wind=
river.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)">From: Mingli Yu &lt;<a=
 href=3D"mailto:mingli.yu@windriver.com" target=3D"_blank">mingli.yu@windri=
ver.com</a>&gt;<br>
<br>
Fixes:<br>
=C2=A0 $ bitbake gcr<br>
=C2=A0 ERROR: Nothing PROVIDES &#39;gtk4&#39; (but /build/layers/oe-core/me=
ta/recipes-gnome/gcr/<a href=3D"http://gcr_4.0.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gcr_4.0.0.bb</a> DEPENDS on or otherwise requires it)<br>
gtk4 was skipped: missing required distro feature &#39;opengl&#39; (not in =
DISTRO_FEATURES)<br>
=C2=A0 ERROR: Required build target &#39;gcr&#39; has no buildable provider=
s.<br>
=C2=A0 Missing or unbuildable dependency chain was: [&#39;gcr&#39;, &#39;gt=
k4&#39;]<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" tar=
get=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-gnome/gcr/<a href=3D"http://gcr_4.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">gcr_4.0.0.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-gnome/gcr/<a href=3D"http://gcr_4.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">gcr_4.0.0.bb</a> b/meta/recipes-gnome/gcr/<a =
href=3D"http://gcr_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">gcr_4.0.0=
.bb</a><br>
index 264069ffd1..22edd386fc 100644<br>
--- a/meta/recipes-gnome/gcr/<a href=3D"http://gcr_4.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">gcr_4.0.0.bb</a><br>
+++ b/meta/recipes-gnome/gcr/<a href=3D"http://gcr_4.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">gcr_4.0.0.bb</a><br>
@@ -20,6 +20,8 @@ GTKDOC_MESON_OPTION =3D &quot;gtk_doc&quot;<br>
=C2=A0inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-ve=
rsion-is-even vala gobject-introspection gettext mime mime-xdg<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;gcr-(?P&lt;pver&gt;\d+\.(\d*[02468])+(=
\.\d+)+)\.tar.xz&quot;<br>
<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATUR=
ES&#39;, &#39;x11&#39;, &#39;opengl&#39;, &#39;&#39;, d)}&quot;<br>
+<br>
=C2=A0SRC_URI +=3D &quot;file://0001-meson.build-correctly-handle-disabled-=
ssh_agent-opti.patch&quot;<br>
=C2=A0SRC_URI[archive.sha256sum] =3D &quot;c45855924f0ee7bab43e2dd38bfafd2a=
c815c6e9864341c0161e171173dcec7c&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174976): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/174976" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/174976</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95842308/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95842308/1686489</a><br>
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

--00000000000070a77105f07b9d4e--

