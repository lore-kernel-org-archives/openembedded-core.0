Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3B9C7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 06:49:16 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.124117.1680677349489362181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 23:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MrJ9aacM;
 spf=pass (domain: linaro.org, ip: 209.85.219.175, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f175.google.com with SMTP id p15so41374594ybl.9
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 23:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680677348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MLQuQwGA4Fc3x35bYNc06MBOsldxeBYNO0d4MMgZSqQ=;
        b=MrJ9aacMQC+Cm/pitSh07PGKGgjo4vhTO8NAG1H/tm8/2GfupEfmcx5DUlDxdlBt/J
         wZJFqGRnXFB29/amkA/kktd2iQOhNLmX3/VMgjBo+dFXokaBVHldsZKQhwsFLU3ssDmn
         Vzp7bPEXgs7yL2PG4dGpRI0W+u41euJ5K81C/wZXjn6kvZzPXni6r7S032Cao4hsC4Gl
         fK1dKvR34bWA0wPAC8GPahdUeG14J0IUQD9yaU+KN1XBUmGVkEqCxfPsyO+7+iv4eLCW
         dC4J+DWq58kVv1giaFS1ZsG6qZRpL3LpsXEx8vXyKlxPXJ+XgzVKAiAGI4SCJA5oFCcM
         eHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680677348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLQuQwGA4Fc3x35bYNc06MBOsldxeBYNO0d4MMgZSqQ=;
        b=ChVerc2azl333OObhqvKgimJ/kDU1rmazwQn73AzF4X8tXhIgvdcj4Mq087Lndx1sV
         hLP2eAA915vrHupGFPNSufHw0/0aPmWrkQwU52bsOZIjhjgtjmsuA72XbRYviPwo21a6
         hvjrADHKMS0TI5DumcEzHXOhMwQ75dt6APQdbAbWFTrdjJQfuXxS4aG0hHaUB2ZQ6etP
         krzTob+FrIU5imFtz4SO+eH14xZDh6WLZUtzIyTBHK5S94Ns/rbWaCr8qptIqmho5nK4
         2nl+8RryqcfelviwEdMrWVpijeiaaqeyLnHkN40GgMIgkKT3ZueszNex0uCRPB2gGIan
         MJkA==
X-Gm-Message-State: AAQBX9dSmFhCPp0fzVVie/hz+ZaWOxtkpk6J6omCgWIaH3dlnWWQulV7
	/u0DXeCyuNur1wiGOJR+e4JR0KgDNglmbXM4velG+g==
X-Google-Smtp-Source: AKy350b8N1zQm8qux2aUHbDs0HSuohy50gbTWTGP7HxOSnS7Ht9318697EjgEiRsCBd3CkcFL/dGxD5GaxyJ7DV5d98=
X-Received: by 2002:a25:d047:0:b0:b78:8bd8:6e77 with SMTP id
 h68-20020a25d047000000b00b788bd86e77mr3469019ybg.8.1680677348527; Tue, 04 Apr
 2023 23:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230404213605.170461-1-marex@denx.de>
In-Reply-To: <20230404213605.170461-1-marex@denx.de>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 5 Apr 2023 08:48:57 +0200
Message-ID: <CAP71WjyQOZNY5bnDkN33_nCfv8R3MBVb+MGDX1A1F+Jfg-m3_g@mail.gmail.com>
Subject: Re: [PATCH] yocto-check-layer: scan additional layers for tested
 layer dependencies
To: Marek Vasut <marex@denx.de>
Cc: openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000576b6d05f89130b3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 06:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179723

--000000000000576b6d05f89130b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 4, 2023 at 11:36=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:

> In case a LAYERDEPENDS of a tested layer contains a dependency which is
> present in additional layers, such dependency does not get pulled into
> the layer test as a dependency be default and instead of YCL stops and
> reports it cannot find dependent layers.
>

Hmm. I know this script is slightly (!) convoluted.
But I think this is done 'by design'. Since you are expected to list all
your dependencies with --dependency when you are testing a layer.


>
> An example of this is a layer with LAYERDEPENDS =3D " core openembedded-c=
ore
> "
> and then by running YCL on such layer using the following invocation:
> $ yocto-check-layer -d --additional-layers ../meta-openembedded/ --
> ../meta-board-distro
>

In this specific example, you are supposed to use --dependency
../meta-openembedded instead of --additional-layers, no?
--additional-layers (see 31e53430f1bb6f73b82698b20ef7f1047313214a) is
supposed to bring extra layers when parsing/testing to mimic a full distro
or to manually force optional layers to be present. But --dependency is
still required to contain all potential dependencies.


> ...
> ERROR: Layer meta-board-distro depends on openembedded-layer and isn't
> found.
> ...
>
> The fix here adds all layers in the --additional-layers list into layers
> which are searched for dependencies of the tested layer. That way, even
> layers present in additional-layers list are searched and possibly used
> as dependencies for the layer check.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  scripts/yocto-check-layer | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
> index 67cc71950f..fbb715c0af 100755
> --- a/scripts/yocto-check-layer
> +++ b/scripts/yocto-check-layer
> @@ -144,7 +144,7 @@ def main():
>      if not args.no_auto_dependency:
>          depends =3D []
>          for layer in layers:
> -            layer_depends =3D get_layer_dependencies(layer, dep_layers,
> logger)
> +            layer_depends =3D get_layer_dependencies(layer, dep_layers +
> additional_layers, logger)
>              if layer_depends:
>                  for d in layer_depends:
>                      if d not in depends:
> @@ -188,7 +188,7 @@ def main():
>          missing_dependencies =3D not add_layer_dependencies(bblayersconf=
,
> layer, dep_layers, logger)
>          if not missing_dependencies:
>              for additional_layer in additional_layers:
> -                if not add_layer_dependencies(bblayersconf,
> additional_layer, dep_layers, logger):
> +                if not add_layer_dependencies(bblayersconf,
> additional_layer, dep_layers + additional_layers, logger):
>                      missing_dependencies =3D True
>                      break
>          if missing_dependencies:
> --
> 2.39.2
>
>

--000000000000576b6d05f89130b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 4, 2023 at 11:36=E2=80=AF=
PM Marek Vasut &lt;<a href=3D"mailto:marex@denx.de">marex@denx.de</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">In case a =
LAYERDEPENDS of a tested layer contains a dependency which is<br>
present in additional layers, such dependency does not get pulled into<br>
the layer test as a dependency be default and instead of YCL stops and<br>
reports it cannot find dependent layers.<br></blockquote><div><br></div><di=
v>Hmm. I know this script is slightly (!) convoluted.=C2=A0</div><div>But I=
 think this is done &#39;by design&#39;. Since you are expected to list all=
 your dependencies with --dependency when you are testing a layer.=C2=A0</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
An example of this is a layer with LAYERDEPENDS =3D &quot; core openembedde=
d-core &quot;<br>
and then by running YCL on such layer using the following invocation:<br>
$ yocto-check-layer -d --additional-layers ../meta-openembedded/ -- ../meta=
-board-distro<br></blockquote><div><br></div><div>In this specific example,=
 you are supposed to use --dependency ../meta-openembedded instead of --add=
itional-layers, no?=C2=A0</div><div>--additional-layers (see=C2=A031e53430f=
1bb6f73b82698b20ef7f1047313214a) is supposed to bring extra layers when par=
sing/testing to mimic a full distro or to manually force optional layers to=
 be present. But --dependency is still required to contain all potential de=
pendencies.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
...<br>
ERROR: Layer meta-board-distro depends on openembedded-layer and isn&#39;t =
found.<br>
...<br>
<br>
The fix here adds all layers in the --additional-layers list into layers<br=
>
which are searched for dependencies of the tested layer. That way, even<br>
layers present in additional-layers list are searched and possibly used<br>
as dependencies for the layer check.<br>
<br>
Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_=
blank">marex@denx.de</a>&gt;<br>
---<br>
Cc: Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com" =
target=3D"_blank">alexandre.belloni@bootlin.com</a>&gt;<br>
Cc: Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org" tar=
get=3D"_blank">nicolas.dechesne@linaro.org</a>&gt;<br>
Cc: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org=
" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
---<br>
=C2=A0scripts/yocto-check-layer | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer<br>
index 67cc71950f..fbb715c0af 100755<br>
--- a/scripts/yocto-check-layer<br>
+++ b/scripts/yocto-check-layer<br>
@@ -144,7 +144,7 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0if not args.no_auto_dependency:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends =3D []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for layer in layers:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 layer_depends =3D get_layer_depe=
ndencies(layer, dep_layers, logger)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 layer_depends =3D get_layer_depe=
ndencies(layer, dep_layers + additional_layers, logger)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if layer_depends:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for d in laye=
r_depends:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if d not in depends:<br>
@@ -188,7 +188,7 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0missing_dependencies =3D not add_layer_de=
pendencies(bblayersconf, layer, dep_layers, logger)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not missing_dependencies:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for additional_layer in add=
itional_layers:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not add_layer_d=
ependencies(bblayersconf, additional_layer, dep_layers, logger):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not add_layer_d=
ependencies(bblayersconf, additional_layer, dep_layers + additional_layers,=
 logger):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0missing_dependencies =3D True<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if missing_dependencies:<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div>

--000000000000576b6d05f89130b3--

