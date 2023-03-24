Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13FFC6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:22:07 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.104196.1679671325521072316
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eXl1/p4+;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id q16so2691135lfe.10
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679671324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1pA/foizHN8HuKTqKja2tIk4RxL780znWTSteJt8PyE=;
        b=eXl1/p4+q6dz//onpfinj6K98BxKy5yxk6otZtPeel3w0QWFNDqL/zvKq178mr9cH8
         n5oNVbP7+a/v5NkZ7bwggzX/IfiMU2GOiMATOlMV7v+SxHfzi3E8xS5FevO/oW1Mwql5
         VH0kXeKkpcZ+6ROGR82sXIuklbu+sbUeSzf7xUinGHEUTlH4p3l+t57JHm7Lv2CSxfA6
         x4KFXx5i9eXmftjfNY8G6/Nz4dDZ4zsPpKWPmSH6SxXPs0VK9hC9PkIOgjejsgNGrM2S
         Hi8+6Yy54I6TeI4tgOdVHcWdMGsWbNX5Ac1PQXnnSsaXBBz5kO3zuiVGsPjsDGRYPpUh
         IFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679671324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1pA/foizHN8HuKTqKja2tIk4RxL780znWTSteJt8PyE=;
        b=6/4GII8PS5NJAyAs7eL9PS+mLjGxFnrxA3ZSEf3sh9hInDfW6dTVBRVCRhX4fb7gJ3
         KDZZUAnFUZRu3f/1qeFHRAMmc6V6MaRCyN53Arp0XyguEXl+ynbXK2oRJIGmKmEEF423
         eZ7eYwabbTwvMBjGRNxLuXjd9t999vXF1HXbbVKahmq3Hnl3QjvrznIKnm/VrbRo+OzQ
         OEunjoZcV4Fy3wUOdkWGRtGSW2gq6pn0SVAQzlNvFVFo1uNwsjzlqj9jmh4/LfW59IfJ
         L1/ATvLqmyR4i/D1i+GF0EAtOxgh6jZUK50wRY/b+ca6KvbLmvsIPfX7IuUsg97Iyc3h
         yoRw==
X-Gm-Message-State: AAQBX9cioh2POClga3E50y/2zDBkackbDppXHDBm2Q1nlAWzUHnt0+XV
	9HpaAXYVaVD52ypICLRLyUbKqlz8tgTJ4EnRDyw=
X-Google-Smtp-Source: AKy350a6nz5ZUYt1dF19VW0qC/5LHWxqj/jBZ1NwrRdq3B07tqOQsEbsVqkiqBWtXREPSiXN0nTRxVFvDw6VRSnxM4Q=
X-Received: by 2002:ac2:522e:0:b0:4ea:e2f8:5ed6 with SMTP id
 i14-20020ac2522e000000b004eae2f85ed6mr802145lfl.11.1679671323586; Fri, 24 Mar
 2023 08:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230324145958.278236-1-throos@amazon.de>
In-Reply-To: <20230324145958.278236-1-throos@amazon.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Mar 2023 16:21:52 +0100
Message-ID: <CANNYZj9_w84pYU4bKfVF4cnC0=CSmtTCNipeWjUdnDaioUB3WA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] change the default behavior of bitbake-layers
 and oe-setup-builddir to rel paths
To: throos@amazon.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000094f46d05f7a6f42a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179060

--00000000000094f46d05f7a6f42a
Content-Type: text/plain; charset="UTF-8"

Build directories are not meant to be relocatable, and will likely break in
all kinds of ways if you try. Can you explain the use case?

Alex

On Fri 24. Mar 2023 at 16.00, Thomas Roos via lists.openembedded.org
<throos=amazon.de@lists.openembedded.org> wrote:

> From: Thomas Roos <throos@amazon.de>
>
> This patch will use the $TOPDIR variable to create layer entries in
> bblayers.conf.
> Instead of an absolute path this will create an relative path to $TOPDIR,
> which will
> allow to move the bblayers.conf to different paths without modification of
> it.
>
> Signed-off-by: Thomas Roos <throos@amazon.de>
> ---
>  bitbake/lib/bblayers/action.py | 4 +++-
>  scripts/oe-setup-builddir      | 5 +++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/bitbake/lib/bblayers/action.py
> b/bitbake/lib/bblayers/action.py
> index 0d7fd6edd1..bd13e15a2f 100644
> --- a/bitbake/lib/bblayers/action.py
> +++ b/bitbake/lib/bblayers/action.py
> @@ -26,7 +26,7 @@ def plugin_init(plugins):
>  class ActionPlugin(LayerPlugin):
>      def do_add_layer(self, args):
>          """Add one or more layers to bblayers.conf."""
> -        layerdirs = [os.path.abspath(ldir) for ldir in args.layerdir]
> +        layerdirs = [os.path.relpath(ldir, findTopdir()) for ldir in
> args.layerdir]
>
>          for layerdir in layerdirs:
>              if not os.path.exists(layerdir):
> @@ -38,6 +38,8 @@ class ActionPlugin(LayerPlugin):
>                  sys.stderr.write("Specified layer directory %s doesn't
> contain a conf/layer.conf file\n" % layerdir)
>                  return 1
>
> +        layerdirs = [os.path.join('${TOPDIR}', ldir) for ldir in
> args.layerdir]
> +
>          bblayers_conf = os.path.join(findTopdir(),'conf', 'bblayers.conf')
>          if not os.path.exists(bblayers_conf):
>              sys.stderr.write("Unable to find bblayers.conf\n")
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index 89ae30f609..65a77b76fd 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -92,8 +92,9 @@ EOM
>      # bitbake without the init script after the first run.
>      # ##COREBASE## is deprecated as its meaning was inconsistent, but
> continue
>      # to replace it for compatibility.
> -    sed -e "s|##OEROOT##|$OEROOT|g" \
> -        -e "s|##COREBASE##|$OEROOT|g" \
> +    LAYERPATH='${TOPDIR}'/$(realpath --relative-to=$BUILDDIR $OEROOT)
> +    sed -e "s|##OEROOT##|$LAYERPATH|"g \
> +        -e "s|##COREBASE##|$LAYERPATH|"g \
>          "$OECORELAYERCONF" > "$BUILDDIR/conf/bblayers.conf"
>      SHOWYPDOC=yes
>  fi
> --
> 2.34.1
>
>
>
>
> Amazon Web Services EMEA SARL
> 38 avenue John F. Kennedy, L-1855 Luxembourg
> Sitz der Gesellschaft: L-1855 Luxemburg
> eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284
>
> Amazon Web Services EMEA SARL, Niederlassung Deutschland
> Marcel-Breuer-Str. 12, D-80807 Muenchen
> Sitz der Zweigniederlassung: Muenchen
> eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240,
> USt-ID DE317013094
>
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179040):
> https://lists.openembedded.org/g/openembedded-core/message/179040
> Mute This Topic: https://lists.openembedded.org/mt/97825329/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000094f46d05f7a6f42a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Build directories are not meant to be relocatable, and wi=
ll likely break in all kinds of ways if you try. Can you explain the use ca=
se?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 24. =
Mar 2023 at 16.00, Thomas Roos via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;throos=3D<a href=3D"mailto:amazon.de@lists=
.openembedded.org">amazon.de@lists.openembedded.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)" dir=3D"auto">From: Thomas Roos &lt;<a href=3D"mailto:thro=
os@amazon.de" target=3D"_blank">throos@amazon.de</a>&gt;<br>
<br>
This patch will use the $TOPDIR variable to create layer entries in bblayer=
s.conf.<br>
Instead of an absolute path this will create an relative path to $TOPDIR, w=
hich will<br>
allow to move the bblayers.conf to different paths without modification of =
it.<br>
<br>
Signed-off-by: Thomas Roos &lt;<a href=3D"mailto:throos@amazon.de" target=
=3D"_blank">throos@amazon.de</a>&gt;<br>
---<br>
=C2=A0bitbake/lib/bblayers/action.py | 4 +++-<br>
=C2=A0scripts/oe-setup-builddir=C2=A0 =C2=A0 =C2=A0 | 5 +++--<br>
=C2=A02 files changed, 6 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/bitbake/lib/bblayers/action.py b/bitbake/lib/bblayers/action.p=
y<br>
index 0d7fd6edd1..bd13e15a2f 100644<br>
--- a/bitbake/lib/bblayers/action.py<br>
+++ b/bitbake/lib/bblayers/action.py<br>
@@ -26,7 +26,7 @@ def plugin_init(plugins):<br>
=C2=A0class ActionPlugin(LayerPlugin):<br>
=C2=A0 =C2=A0 =C2=A0def do_add_layer(self, args):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Add one or more layers =
to bblayers.conf.&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 layerdirs =3D [os.path.abspath(ldir) for ldir =
in args.layerdir]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 layerdirs =3D [os.path.relpath(ldir, findTopdi=
r()) for ldir in args.layerdir]<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for layerdir in layerdirs:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.exists(layer=
dir):<br>
@@ -38,6 +38,8 @@ class ActionPlugin(LayerPlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.stderr.wr=
ite(&quot;Specified layer directory %s doesn&#39;t contain a conf/layer.con=
f file\n&quot; % layerdir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 layerdirs =3D [os.path.join(&#39;${TOPDIR}&#39=
;, ldir) for ldir in args.layerdir]<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bblayers_conf =3D os.path.join(findTopdir=
(),&#39;conf&#39;, &#39;bblayers.conf&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.exists(bblayers_conf):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.stderr.write(&quot;Unab=
le to find bblayers.conf\n&quot;)<br>
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir<br>
index 89ae30f609..65a77b76fd 100755<br>
--- a/scripts/oe-setup-builddir<br>
+++ b/scripts/oe-setup-builddir<br>
@@ -92,8 +92,9 @@ EOM<br>
=C2=A0 =C2=A0 =C2=A0# bitbake without the init script after the first run.<=
br>
=C2=A0 =C2=A0 =C2=A0# ##COREBASE## is deprecated as its meaning was inconsi=
stent, but continue<br>
=C2=A0 =C2=A0 =C2=A0# to replace it for compatibility.<br>
-=C2=A0 =C2=A0 sed -e &quot;s|##OEROOT##|$OEROOT|g&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|##COREBASE##|$OEROOT|g&quot; \<br>
+=C2=A0 =C2=A0 LAYERPATH=3D&#39;${TOPDIR}&#39;/$(realpath --relative-to=3D$=
BUILDDIR $OEROOT)<br>
+=C2=A0 =C2=A0 sed -e &quot;s|##OEROOT##|$LAYERPATH|&quot;g \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s|##COREBASE##|$LAYERPATH|&quot;g \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$OECORELAYERCONF&quot; &gt; &quot;$=
BUILDDIR/conf/bblayers.conf&quot;<br>
=C2=A0 =C2=A0 =C2=A0SHOWYPDOC=3Dyes<br>
=C2=A0fi<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
<br>
Amazon Web Services EMEA SARL<br>
38 avenue John F. Kennedy, L-1855 Luxembourg<br>
Sitz der Gesellschaft: L-1855 Luxemburg<br>
eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284<br>
<br>
Amazon Web Services EMEA SARL, Niederlassung Deutschland<br>
Marcel-Breuer-Str. 12, D-80807 Muenchen<br>
Sitz der Zweigniederlassung: Muenchen<br>
eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, =
USt-ID DE317013094<br>
<br>
<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179040): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179040" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179040</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97825329/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97825329/1686489</a><br>
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

--00000000000094f46d05f7a6f42a--

