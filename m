Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3283E6F086
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 20:10:34 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.3622.1730491829179677162
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 13:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FoNf/U9t;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e4b7409fso2189057e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 13:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730491827; x=1731096627; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RzzXiJAd3h2gItPRSxtLxfQlJ4wwh23OFDbe9mbUkvQ=;
        b=FoNf/U9t0UUmi7cXbtJ1eFU4thrSS3lbX1sHiqyAdREVklMgPFS9cyQxSjtE5Ri4jq
         6qnMWKwjPm59Jh70jufze2B/1T5zOEhpKNN9pIBhXif2nPUfRE7kD5vXc1qG4/t0tDha
         i+BBDFf/XdGj8mHK6UD0/Sn+Z5z/bT6E8+byXc1ZvQDtLIgSZaNNZTkiYIYiyyEV1UNy
         iO+U6xGVdDtAjVnFh3gD4luKUp0qdH6cl6C6mNeJi5GRPl0jEF4eFKzztd7xiO5hEZH3
         KhCsB1JOA36nTLGNhfHI9TgGk3RLc0iz/Q2KE0LHLQhRQb8MWm5oouvtiKUDUqp7y0ad
         E/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730491827; x=1731096627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RzzXiJAd3h2gItPRSxtLxfQlJ4wwh23OFDbe9mbUkvQ=;
        b=MSlA8uvwGWReV5MTDjlbGCv3FcGUX7lmmejgZI77qtVyYKjhgJdsIotMyKPlQceTAW
         zaCTet3Q8Qp+jHARQQEgusKntRawOYEq+OP7cC3MO76JMG0xG5lS4qr+vkIKBeB/KVEN
         WGj7mgWc9UrI611Gxv1Ydf0O0WF4bW7sPAOCCeuuLXvOg2DH01QJyskJDizLZ0KOwHOs
         5GFHLT1mqHY1hnir2c8iaWM2ggFFOQf7ZZRvhH+DX01oBp6rPA7+wtXlXyZ34bRqILi2
         47X3cdYvKBeEdy659B2nhb10DEA0pCWyzQIHSHSmPw6go6j2b6dP8annVBEEmQ5GR7dM
         0r6g==
X-Gm-Message-State: AOJu0YyIx/AXUqQPdIGAo2nwPaumd0ylvmqFkeN6V8+jYCFIg2y1EFzz
	bc14LDG/9WV+Lw0PhuGdigmVHB9+SoMEV8hSrN5lpR5LfALL3rFyA1G+fNs9pAwTHWzzugGOv9w
	z+EgsYwTacMzOZdkChu41Fcgf4M8=
X-Google-Smtp-Source: AGHT+IHfg1ZmEZQv0d9/plsKUZKaOvtsAzj4NZ0taW9m7E3ltCR3SEhJtBgDrfG0n2VnRVRVmo3g7M1dZsRfKZo0GWg=
X-Received: by 2002:a05:6512:2382:b0:53a:1d:e3bc with SMTP id
 2adb3069b0e04-53d65dc6f5bmr1671192e87.26.1730491826951; Fri, 01 Nov 2024
 13:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241101193811.2068211-1-chris.laplante@agilent.com>
In-Reply-To: <20241101193811.2068211-1-chris.laplante@agilent.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Nov 2024 21:10:15 +0100
Message-ID: <CANNYZj-_8+EH51Nk2tj+o7a2PpscSO2bi8e-ak8g5fnUhADULg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] devtool: modify: add DEVTOOL_PREFER_BRANCH support
To: chris.laplante@agilent.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a1e1f70625df8626"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 20:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206631

--000000000000a1e1f70625df8626
Content-Type: text/plain; charset="UTF-8"

Will devtool finish and devtool reset do the right thing as well when this
is used?

Alex

On Fri 1. Nov 2024 at 20.38, Chris Laplante via lists.openembedded.org
<chris.laplante=agilent.com@lists.openembedded.org> wrote:

> From: Chris Laplante <chris.laplante@agilent.com>
>
> Provide a per-recipe opt-out for devtool's default behavior of using the
> 'devtool'
> branch. This is primarily intended for company-internal recipes (e.g. on
> private
> layers) that use floating upstream SRCREV. It is assumed that such recipes
> do
> not care about patches, since the upstream is 100% controlled by the user.
>
> In those cases, the 'devtool' branch is unnecessary and just confuses
> users.
>
> Typical usage would be something like the following:
>
> BRANCH = "main"
> DEVTOOL_PREFER_BRANCH = "${BRANCH}"
> SRCREV = "${AUTOREV}"
> SRC_URI = "git://
> intranet.company.io/whatever/libsecretsauce;branch=${BRANCH};protocol=https
> <http://intranet.company.io/whatever/libsecretsauce;branch=$%7BBRANCH%7D;protocol=https>
> "
>
> This way, when users 'devtool modify' the recipe, the 'main' branch is
> checked out by default.
>
> Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
> ---
>  scripts/lib/devtool/standard.py | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py
> index f2440ae804..6b6d542e8b 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -907,6 +907,14 @@ def modify(args, config, basepath, workspace):
>                          seen_patches.append(origpatch)
>                          branch_patches[branch].append(origpatch)
>
> +        if not args.no_extract and not
> args.ignore_recipe_preferred_branch and (args.branch == "devtool"):
> +            prefer_branch = rd.getVar("DEVTOOL_PREFER_BRANCH")
> +            if prefer_branch:
> +                logger.info("Checking out recipe preferred branch
> (DEVTOOL_PREFER_BRANCH) "
> +                            "'{0}'; use
> -i/--ignore-recipe-preferred-branch or -b/--branch "
> +                            "next time to override".format(prefer_branch))
> +                bb.process.run('git checkout {0}'.format(prefer_branch),
> cwd=srctree)
> +
>          # Need to grab this here in case the source is within a
> subdirectory
>          srctreebase = srctree
>          srctree = get_real_srctree(srctree, rd.getVar('S'),
> rd.getVar('WORKDIR'))
> @@ -2307,7 +2315,9 @@ def register_commands(subparsers, context):
>      group = parser_modify.add_mutually_exclusive_group()
>      group.add_argument('--same-dir', '-s', help='Build in same directory
> as source', action="store_true")
>      group.add_argument('--no-same-dir', help='Force build in a separate
> build directory', action="store_true")
> -    parser_modify.add_argument('--branch', '-b', default="devtool",
> help='Name for development branch to checkout (when not using
> -n/--no-extract) (default "%(default)s")')
> +    group = parser_modify.add_mutually_exclusive_group()
> +    group.add_argument('--branch', '-b', default="devtool", help='Name
> for development branch to checkout (when not using -n/--no-extract)
> (default "%(default)s")')
> +    group.add_argument('--ignore-recipe-preferred-branch', '-i', help='Do
> not check out the branch indicated by DEVTOOL_PREFER_BRANCH.',
> action='store_true')
>      parser_modify.add_argument('--no-overrides', '-O',
> action="store_true", help='Do not create branches for other override
> configurations')
>      parser_modify.add_argument('--keep-temp', help='Keep temporary
> directory (for debugging)', action="store_true")
>      parser_modify.set_defaults(func=modify,
> fixed_setup=context.fixed_setup)
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206630):
> https://lists.openembedded.org/g/openembedded-core/message/206630
> Mute This Topic: https://lists.openembedded.org/mt/109341115/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000a1e1f70625df8626
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Will devtool finish and devtool reset do the right thing =
as well when this is used?</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Fri 1. Nov 2024 at 20.38, Chris Laplante via <a href=3D"http=
://lists.openembedded.org">lists.openembedded.org</a> &lt;chris.laplante=3D=
<a href=3D"mailto:agilent.com@lists.openembedded.org">agilent.com@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;padding-left:1ex;border-left-color:rgb(204,204,204)">From: Chris Laplante=
 &lt;<a href=3D"mailto:chris.laplante@agilent.com" target=3D"_blank">chris.=
laplante@agilent.com</a>&gt;<br>
<br>
Provide a per-recipe opt-out for devtool&#39;s default behavior of using th=
e &#39;devtool&#39;<br>
branch. This is primarily intended for company-internal recipes (e.g. on pr=
ivate<br>
layers) that use floating upstream SRCREV. It is assumed that such recipes =
do<br>
not care about patches, since the upstream is 100% controlled by the user.<=
br>
<br>
In those cases, the &#39;devtool&#39; branch is unnecessary and just confus=
es users.<br>
<br>
Typical usage would be something like the following:<br>
<br>
BRANCH =3D &quot;main&quot;<br>
DEVTOOL_PREFER_BRANCH =3D &quot;${BRANCH}&quot;<br>
SRCREV =3D &quot;${AUTOREV}&quot;<br>
SRC_URI =3D &quot;git://<a href=3D"http://intranet.company.io/whatever/libs=
ecretsauce;branch=3D$%7BBRANCH%7D;protocol=3Dhttps" rel=3D"noreferrer" targ=
et=3D"_blank">intranet.company.io/whatever/libsecretsauce;branch=3D${BRANCH=
};protocol=3Dhttps</a>&quot;<br>
<br>
This way, when users &#39;devtool modify&#39; the recipe, the &#39;main&#39=
; branch is<br>
checked out by default.<br>
<br>
Signed-off-by: Chris Laplante &lt;<a href=3D"mailto:chris.laplante@agilent.=
com" target=3D"_blank">chris.laplante@agilent.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/devtool/standard.py | 12 +++++++++++-<br>
=C2=A01 file changed, 11 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py<br>
index f2440ae804..6b6d542e8b 100644<br>
--- a/scripts/lib/devtool/standard.py<br>
+++ b/scripts/lib/devtool/standard.py<br>
@@ -907,6 +907,14 @@ def modify(args, config, basepath, workspace):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0seen_patches.append(origpatch)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0branch_patches[branch].append(origpatch)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not args.no_extract and not args.ignore_rec=
ipe_preferred_branch and (args.branch =3D=3D &quot;devtool&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefer_branch =3D rd.getVar(&quo=
t;DEVTOOL_PREFER_BRANCH&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if prefer_branch:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://=
logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;Che=
cking out recipe preferred branch (DEVTOOL_PREFER_BRANCH) &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&#39;{0}&#39;; use -i/--ignore-recipe-prefer=
red-branch or -b/--branch &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;next time to override&quot;.format(prefer_br=
anch))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.process.run(&#3=
9;git checkout {0}&#39;.format(prefer_branch), cwd=3Dsrctree)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Need to grab this here in case the sour=
ce is within a subdirectory<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srctreebase =3D srctree<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srctree =3D get_real_srctree(srctree, rd.=
getVar(&#39;S&#39;), rd.getVar(&#39;WORKDIR&#39;))<br>
@@ -2307,7 +2315,9 @@ def register_commands(subparsers, context):<br>
=C2=A0 =C2=A0 =C2=A0group =3D parser_modify.add_mutually_exclusive_group()<=
br>
=C2=A0 =C2=A0 =C2=A0group.add_argument(&#39;--same-dir&#39;, &#39;-s&#39;, =
help=3D&#39;Build in same directory as source&#39;, action=3D&quot;store_tr=
ue&quot;)<br>
=C2=A0 =C2=A0 =C2=A0group.add_argument(&#39;--no-same-dir&#39;, help=3D&#39=
;Force build in a separate build directory&#39;, action=3D&quot;store_true&=
quot;)<br>
-=C2=A0 =C2=A0 parser_modify.add_argument(&#39;--branch&#39;, &#39;-b&#39;,=
 default=3D&quot;devtool&quot;, help=3D&#39;Name for development branch to =
checkout (when not using -n/--no-extract) (default &quot;%(default)s&quot;)=
&#39;)<br>
+=C2=A0 =C2=A0 group =3D parser_modify.add_mutually_exclusive_group()<br>
+=C2=A0 =C2=A0 group.add_argument(&#39;--branch&#39;, &#39;-b&#39;, default=
=3D&quot;devtool&quot;, help=3D&#39;Name for development branch to checkout=
 (when not using -n/--no-extract) (default &quot;%(default)s&quot;)&#39;)<b=
r>
+=C2=A0 =C2=A0 group.add_argument(&#39;--ignore-recipe-preferred-branch&#39=
;, &#39;-i&#39;, help=3D&#39;Do not check out the branch indicated by DEVTO=
OL_PREFER_BRANCH.&#39;, action=3D&#39;store_true&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_modify.add_argument(&#39;--no-overrides&#39;, &#=
39;-O&#39;, action=3D&quot;store_true&quot;, help=3D&#39;Do not create bran=
ches for other override configurations&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_modify.add_argument(&#39;--keep-temp&#39;, help=
=3D&#39;Keep temporary directory (for debugging)&#39;, action=3D&quot;store=
_true&quot;)<br>
=C2=A0 =C2=A0 =C2=A0parser_modify.set_defaults(func=3Dmodify, fixed_setup=
=3Dcontext.fixed_setup)<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#206630): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/206630" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/206630</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109341115/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109341115/1686489</a><br>
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

--000000000000a1e1f70625df8626--

