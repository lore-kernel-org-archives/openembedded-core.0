Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12EDC4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 19:11:37 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.1695.1672341095166404353
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 11:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z8nVmqX+;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id t17so46984154eju.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 11:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8gFteaHcNOAu9BnzvX5lwpho0OjM6m3hItkrpv/ppgA=;
        b=Z8nVmqX+Dgre25T3Bh2Ex7C7O3hF2dA5qMMsSNyc6O7cgqyWdhJJfii6GHxkpYasbQ
         TRsTa0x4IHjw61iQkCMB/r+qeRNAs17lyXm8q8UXA0TM/GIhKE8A/4CpIfwCQvpD9H7B
         9R6LXe+FTMIj88x1RWMJSHu2CR/tHTI4N1Hr51X3CTragZesMpy9k7uJg37RLmJ9b9A9
         R6wp2pF3CdJhSCWnK1DLKZ/glMY7pAf1N01SYCS5mw1cKH8U/h8STHs0kOT9+oNdqTfo
         K3svsmc67nC12hwtU4RDES7SikcUDRzSzun+iXlaHUCRB/dSwwKLwkli27eEVjqtMR3I
         +MXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8gFteaHcNOAu9BnzvX5lwpho0OjM6m3hItkrpv/ppgA=;
        b=B09dOa6Us/nz+jMJXeuA37oOz7bHhxlrvsnfnpOgVt4BhkYAaSkdZ2NOgpVdbnNBjU
         TzqYSCb2efH7Tipc6mQaBsRK+TGaDmRhjFWAx7X4Df1xzE5xOKZu0aK4GKZjPd7OW2FG
         X6bm12AcfWfbO5iYns4ZRLJQ33sq9RK7SU51aAdYwE/cJ+pcEEg5WED+8/E+4OSsxYo+
         rTlmixJh19Pm4oiveSEr4XIdp0IZZH19qV71sEjWzRevXog9ZJzAkVWQdslbduDpboWZ
         EIQILJ6S2O60CdQsbuFxyBUTf8xqdrpaSB1r++PqPKul9gzu/wZkv0yZA/sFneun5e8h
         R4vw==
X-Gm-Message-State: AFqh2kpZyNlRcq6D/+Ty/KLIhGd53POK7/MiMRp6/e3mliFDO5l8pLao
	MzjKi0ovXlreuBGlwlxTxlWfybKUwIB0Xy71CSg=
X-Google-Smtp-Source: AMrXdXsPlMovl/oXTSuoHwzuHnOTrWgZjgL/KbohwNOQVq+JstI49oeGX9ZFyVD3YKw+Lft211sj5Rq/E7eIQDsylRw=
X-Received: by 2002:a17:906:148a:b0:7a3:fc74:7fb4 with SMTP id
 x10-20020a170906148a00b007a3fc747fb4mr3536129ejc.17.1672341093602; Thu, 29
 Dec 2022 11:11:33 -0800 (PST)
MIME-Version: 1.0
References: <20221229190918.2242791-1-raj.khem@gmail.com>
In-Reply-To: <20221229190918.2242791-1-raj.khem@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 29 Dec 2022 19:11:23 +0000
Message-ID: <CAO5Uq5SXZrmiu-RsxaJ_yxj6RV=+-LH1765D7Dqdz+a1DCecMA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo: Do not use open64 on musl anymore
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d3daee05f0fc40bb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 19:11:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175127

--000000000000d3daee05f0fc40bb
Content-Type: text/plain; charset="UTF-8"

Should we just move these patches to rust-source and apply them for
everyone who consumes it?

On Thu, 29 Dec 2022, 19:09 Khem Raj, <raj.khem@gmail.com> wrote:

> The same rust getrandom patch is needed for cargo on target as well
> as it uses the same crate
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/rust/cargo_1.66.0.bb                   | 5 ++++-
>  .../rust/{rust => files}/getrandom-open64.patch              | 0
>  2 files changed, 4 insertions(+), 1 deletion(-)
>  rename meta/recipes-devtools/rust/{rust => files}/getrandom-open64.patch
> (100%)
>
> diff --git a/meta/recipes-devtools/rust/cargo_1.66.0.bb
> b/meta/recipes-devtools/rust/cargo_1.66.0.bb
> index 37e0123ee3..f45f8f1e12 100644
> --- a/meta/recipes-devtools/rust/cargo_1.66.0.bb
> +++ b/meta/recipes-devtools/rust/cargo_1.66.0.bb
> @@ -14,7 +14,10 @@ LIC_FILES_CHKSUM = " \
>  require rust-source.inc
>  require rust-snapshot.inc
>
> -SRC_URI:append:class-target = "
> file://crossbeam_atomic.patch;patchdir=${RUSTSRC}"
> +SRC_URI:append:class-target = "\
> +    file://crossbeam_atomic.patch;patchdir=${RUSTSRC} \
> +    file://getrandom-open64.patch;patchdir=${RUSTSRC} \
>
> +"
>
>  # Used by crossbeam_atomic.patch
>  export TARGET_VENDOR
> diff --git a/meta/recipes-devtools/rust/rust/getrandom-open64.patch
> b/meta/recipes-devtools/rust/files/getrandom-open64.patch
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust/getrandom-open64.patch
> rename to meta/recipes-devtools/rust/files/getrandom-open64.patch
> --
> 2.39.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175126):
> https://lists.openembedded.org/g/openembedded-core/message/175126
> Mute This Topic: https://lists.openembedded.org/mt/95942095/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kiernan@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d3daee05f0fc40bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Should we just move these patches to rust-source and=
 apply them for everyone who consumes it?<br><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 29 Dec 2022, 19:09 Khem Raj,=
 &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">The same rust getrandom patch is =
needed for cargo on target as well<br>
as it uses the same crate<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/rust/<a href=3D"http://cargo_1.66.0.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">cargo_1.66.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 ++++-<br>
=C2=A0.../rust/{rust =3D&gt; files}/getrandom-open64.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A02 files changed, 4 insertions(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/rust/{rust =3D&gt; files}/getrandom-open=
64.patch (100%)<br>
<br>
diff --git a/meta/recipes-devtools/rust/<a href=3D"http://cargo_1.66.0.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">cargo_1.66.0.bb</a> b/meta/=
recipes-devtools/rust/<a href=3D"http://cargo_1.66.0.bb" rel=3D"noreferrer =
noreferrer" target=3D"_blank">cargo_1.66.0.bb</a><br>
index 37e0123ee3..f45f8f1e12 100644<br>
--- a/meta/recipes-devtools/rust/<a href=3D"http://cargo_1.66.0.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">cargo_1.66.0.bb</a><br>
+++ b/meta/recipes-devtools/rust/<a href=3D"http://cargo_1.66.0.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">cargo_1.66.0.bb</a><br>
@@ -14,7 +14,10 @@ LIC_FILES_CHKSUM =3D &quot; \<br>
=C2=A0require rust-source.inc<br>
=C2=A0require rust-snapshot.inc<br>
<br>
-SRC_URI:append:class-target =3D &quot; file://crossbeam_atomic.patch;patch=
dir=3D${RUSTSRC}&quot;<br>
+SRC_URI:append:class-target =3D &quot;\<br>
+=C2=A0 =C2=A0 file://crossbeam_atomic.patch;patchdir=3D${RUSTSRC} \<br>
+=C2=A0 =C2=A0 file://getrandom-open64.patch;patchdir=3D${RUSTSRC} \=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <br>
+&quot;<br>
<br>
=C2=A0# Used by crossbeam_atomic.patch<br>
=C2=A0export TARGET_VENDOR<br>
diff --git a/meta/recipes-devtools/rust/rust/getrandom-open64.patch b/meta/=
recipes-devtools/rust/files/getrandom-open64.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/rust/rust/getrandom-open64.patch<br>
rename to meta/recipes-devtools/rust/files/getrandom-open64.patch<br>
-- <br>
2.39.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#175126): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/175126" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/175126</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95942095/3618=
097" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/95942095/3618097</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kiernan@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">alex.kiernan@gmail.com</a>]<b=
r>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000d3daee05f0fc40bb--

