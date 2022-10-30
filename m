Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E106C38A02
	for <webhook@archiver.kernel.org>; Sun, 30 Oct 2022 17:58:05 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.451.1667152682219484306
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Oct 2022 10:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aHNWzbt9;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id d6so16090545lfs.10
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Oct 2022 10:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mdDTIThqWh2xqXptR66XW8nkgKAL0Muu5KgngcXxMEg=;
        b=aHNWzbt9Geoc+VEHNhkVVx1lf+Q64/JCLon3b/MJCNSztoHEmL6h7/W3GElGo4ZNh6
         Wr44w2x1v9nGgsPKfq+u1TWnfzVM+95SxZfB9muxvFKn8dPZgQb4JuYLPR7jsdzzIqYt
         hsISA2NvZ7qTLHt4621088B7FU5Cyu2MIeAjtQFysF1uODyh2HzJJWYPDAsM2K+h69nk
         H2fzKyGysBlB+xD6/qy8fqGXs7vwHr69lcDPQtnbCWqo6/xQU8fgaOo2Gt/j7B2o3U1w
         PFxQInhXQbIJpm9wyIdf403yNEVGTQlOeIFR1VuZkFWwgss2oqA/x06CnyI6PGtz2JI+
         hGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdDTIThqWh2xqXptR66XW8nkgKAL0Muu5KgngcXxMEg=;
        b=bM+f+ph8ghao9RbnE4QN+2ZqD1Qyb2Wm+rGLu0U0kgqVoRBT49CEg1DN4nOM7lBhDJ
         CCY0DGHoAfIIELATzQBwC/r8YuO1aNZe+e25KiYxumTVrqDDCukgMbKp41WOaD2CYelJ
         EhvA+atG0r46eEGLibnqQ2heUsnmYjZzczBDk7k5sBmQPPDmAnXLt6Ihduw4f+z5fqdU
         jxnGTeHAZNCflHFMNyUorvmNHC1KTInVrBTLaYeSCAaJnv5LsA6vYWBJfS0uPg7bQky8
         TpHXq4lbUA574UjFe7eCrj/XJf2vlOF7DOZIacmgR4vLDmoOO/P7taI+nPRGzXoXWLPR
         rzQQ==
X-Gm-Message-State: ACrzQf34yY9iEAHaFUMGfZP2JF9K+NcMDviHfVz66kMN/mbn6jHn872S
	CMfxAH4yVrxUjh8dxB7jO8TAaCpEi2D3LPlBm8w=
X-Google-Smtp-Source: AMsMyM7xIxM3/3YAcbmmS/iO0DXmhaY76rS+3qiDOG5TyKIIwPC2W0w4MxA14DDLo6lSkyU2/sir4zx6FLNFQ4amXV0=
X-Received: by 2002:a05:6512:3989:b0:4a2:7d73:495a with SMTP id
 j9-20020a056512398900b004a27d73495amr3767741lfu.492.1667152680260; Sun, 30
 Oct 2022 10:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221030173815.10212-1-alex.kiernan@gmail.com> <20221030173815.10212-2-alex.kiernan@gmail.com>
In-Reply-To: <20221030173815.10212-2-alex.kiernan@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 30 Oct 2022 18:57:49 +0100
Message-ID: <CANNYZj_VyT8xSFF=un1cF_4PugEOhuP-hkN3K66XOc_MvbAV6g@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 2/2] cargo_common.bbclass: Support local github repos
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004b1abb05ec443b1e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Oct 2022 17:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172285

--0000000000004b1abb05ec443b1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There doesn=E2=80=99t seem to be a test case or an example for this. How ca=
n we
ensure the code is correct?

Alex

On Sun 30. Oct 2022 at 18.38, Alex Kiernan <alex.kiernan@gmail.com> wrote:

> Since disable network was added cargo configurations which reference git
> repos fail as they attempt to fetch across the network as part of
> do_compile, even if EXTRA_OECARGO_PATHS to add them as part of `paths`
> is used, as this is documented as only working for packages which exist
> in crates.io.
>
> Add parsing of the SRC_URIs for git repos and include `[patch]` sections
> to redirect to the checked out source repos which the bitbake fetcher
> has already populated.
>
> There are still cases which don't work - if you have multiple copies of
> the same repo with different revisions, there's currently no way to
> represent that and anything using a repo which has a virtual manifest
> will fail to build (see https://github.com/rust-lang/cargo/issues/4934).
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>  meta/classes-recipe/cargo_common.bbclass | 30 ++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/meta/classes-recipe/cargo_common.bbclass
> b/meta/classes-recipe/cargo_common.bbclass
> index f503a001dd8e..63b13829084b 100644
> --- a/meta/classes-recipe/cargo_common.bbclass
> +++ b/meta/classes-recipe/cargo_common.bbclass
> @@ -116,6 +116,36 @@ cargo_common_do_configure () {
>         EOF
>  }
>
> +python cargo_common_do_patch_paths() {
> +    cargo_config =3D os.path.join(d.getVar("CARGO_HOME"), "config")
> +    if not os.path.exists(cargo_config):
> +        return
> +
> +    src_uri =3D (d.getVar('SRC_URI') or "").split()
> +    if len(src_uri) =3D=3D 0:
> +        return
> +
> +    patches =3D dict()
> +    workdir =3D d.getVar('WORKDIR')
> +    fetcher =3D bb.fetch2.Fetch(src_uri, d)
> +    for url in fetcher.urls:
> +        ud =3D fetcher.ud[url]
> +        if ud.type =3D=3D 'git':
> +            name =3D ud.parm.get('name')
> +            destsuffix =3D ud.parm.get('destsuffix')
> +            if name is not None and destsuffix is not None:
> +                repo =3D '%s://%s%s' % (ud.proto, ud.host, ud.path)
> +                path =3D '%s =3D { path =3D "%s" }' % (name,
> os.path.join(workdir, destsuffix))
> +                patches.setdefault(repo, []).append(path)
> +
> +    with open(cargo_config, "a+") as config:
> +        for k, v in patches.items():
> +            print('\n[patch."%s"]' % k, file=3Dconfig)
> +            for name in v:
> +                print(name, file=3Dconfig)
> +}
> +do_configure[postfuncs] +=3D "cargo_common_do_patch_paths"
> +
>  oe_cargo_fix_env () {
>         export CC=3D"${RUST_TARGET_CC}"
>         export CXX=3D"${RUST_TARGET_CXX}"
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172284):
> https://lists.openembedded.org/g/openembedded-core/message/172284
> Mute This Topic: https://lists.openembedded.org/mt/94668827/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004b1abb05ec443b1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">There doesn=E2=80=99t seem to be a test case or an exampl=
e for this. How can we ensure the code is correct?=C2=A0</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Sun 30. Oct 2022 at 18.38, Ale=
x Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com">alex.kiernan@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-=
left:1ex;border-left-color:rgb(204,204,204)">Since disable network was adde=
d cargo configurations which reference git<br>
repos fail as they attempt to fetch across the network as part of<br>
do_compile, even if EXTRA_OECARGO_PATHS to add them as part of `paths`<br>
is used, as this is documented as only working for packages which exist<br>
in <a href=3D"http://crates.io" rel=3D"noreferrer" target=3D"_blank">crates=
.io</a>.<br>
<br>
Add parsing of the SRC_URIs for git repos and include `[patch]` sections<br=
>
to redirect to the checked out source repos which the bitbake fetcher<br>
has already populated.<br>
<br>
There are still cases which don&#39;t work - if you have multiple copies of=
<br>
the same repo with different revisions, there&#39;s currently no way to<br>
represent that and anything using a repo which has a virtual manifest<br>
will fail to build (see <a href=3D"https://github.com/rust-lang/cargo/issue=
s/4934" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/c=
argo/issues/4934</a>).<br>
<br>
Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" t=
arget=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/cargo_common.bbclass | 30 +++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 30 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe=
/cargo_common.bbclass<br>
index f503a001dd8e..63b13829084b 100644<br>
--- a/meta/classes-recipe/cargo_common.bbclass<br>
+++ b/meta/classes-recipe/cargo_common.bbclass<br>
@@ -116,6 +116,36 @@ cargo_common_do_configure () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EOF<br>
=C2=A0}<br>
<br>
+python cargo_common_do_patch_paths() {<br>
+=C2=A0 =C2=A0 cargo_config =3D os.path.join(d.getVar(&quot;CARGO_HOME&quot=
;), &quot;config&quot;)<br>
+=C2=A0 =C2=A0 if not os.path.exists(cargo_config):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 src_uri =3D (d.getVar(&#39;SRC_URI&#39;) or &quot;&quot;).sp=
lit()<br>
+=C2=A0 =C2=A0 if len(src_uri) =3D=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 patches =3D dict()<br>
+=C2=A0 =C2=A0 workdir =3D d.getVar(&#39;WORKDIR&#39;)<br>
+=C2=A0 =C2=A0 fetcher =3D bb.fetch2.Fetch(src_uri, d)<br>
+=C2=A0 =C2=A0 for url in fetcher.urls:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ud =3D fetcher.ud[url]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ud.type =3D=3D &#39;git&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D ud.parm.get(&#39;name&#=
39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destsuffix =3D ud.parm.get(&#39;=
destsuffix&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if name is not None and destsuff=
ix is not None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo =3D &#39;%s:/=
/%s%s&#39; % (ud.proto, ud.host, ud.path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D &#39;%s =
=3D { path =3D &quot;%s&quot; }&#39; % (name, os.path.join(workdir, destsuf=
fix))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patches.setdefault=
(repo, []).append(path)<br>
+<br>
+=C2=A0 =C2=A0 with open(cargo_config, &quot;a+&quot;) as config:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k, v in patches.items():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;\n[patch.&quot;%s&quo=
t;]&#39; % k, file=3Dconfig)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for name in v:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(name, file=
=3Dconfig)<br>
+}<br>
+do_configure[postfuncs] +=3D &quot;cargo_common_do_patch_paths&quot;<br>
+<br>
=C2=A0oe_cargo_fix_env () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CC=3D&quot;${RUST_TARGET_CC}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CXX=3D&quot;${RUST_TARGET_CXX}&quot;<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172284): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172284" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172284</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94668827/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94668827/1686489</a><br>
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

--0000000000004b1abb05ec443b1e--

