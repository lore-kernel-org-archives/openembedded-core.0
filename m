Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21C8C001DE
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 03:30:25 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.6743.1691033422753551097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 20:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mA34KTNC;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-584388ec441so4595017b3.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 20:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691033422; x=1691638222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aSzadLEwWIwM7Z/uTyJMsPp+i9CgFn3J6j6FsynIEms=;
        b=mA34KTNCtiKBGb0GtwWTUTqHwyBAGdWQpbHFX1RHedba34jAdUVhAUYnRP7T5xFVpJ
         BHUCNdDudEVI7LNFPa70RTe2Ewnsn0iUswzERVnqlO+gXZ457mKPl2uReihOe/jJ/JG/
         2N/gnWN9rMJL03sA2CbBgklwGQcvjkheml0s2Q80wkvYFJv+LvRXqMwq2pCT5EBxA2YZ
         /H9Gc6knBWe4tlmn8SG7Jh8YyHsRypXlawRY3Rl7AibNPZnerQBcxis09W8FQ2AGyMhF
         ml4BxzBb7DV0ImQqo/qiFsFYLgM9q+UpM3XrVofACIDk8nRTPmUUsrMBRlJ246YMFI/Z
         oFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691033422; x=1691638222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSzadLEwWIwM7Z/uTyJMsPp+i9CgFn3J6j6FsynIEms=;
        b=LGAgAsqVGYngMQHitIMt9Nr8tAhf+9GNM+s/v4ntZJ+DM3fUeSfUZXlglKVe5wZUsa
         CAXOCAfadSUhnFeNOFnOBI1E/oCggnY/9HvO6yBRILBY5CWtlKFwwwfmSSLKyzfjsUXG
         6GZH+ngl8yvhftjmhGs1TLoitMHQ9MDtAo2elnP5ltpqSMqtfsBhguWwFImMSgOgIfR1
         OikxZYjPJ+h8x4lf0aMk15q5dPbCj1Li3ROKEivcIZntKC1hO4AhFBjahYdSx1dgqZyo
         l8FmlyikupeSOAGhD3eC8PktXtFBcgUyKDY3YxDhFArpQ4cq1lmZhACwkmJ56ujeFZ2h
         WO8g==
X-Gm-Message-State: ABy/qLY6sV3YmHzRyceFSk/A02aHn7kp5kUdee6cXNhtbkrLGfG2YJ1H
	TPwHQN/MwdLs3PUJRV4iRDb1+3J5nnr1YrCQEE8=
X-Google-Smtp-Source: APBJJlER09nEHWUeSFQ5HPttmcvMGIfjHLyOhYyp71hxibI13gBSxzOKMDcBY4T3NGFyjIKDw56a/BFr+329aClmJgk=
X-Received: by 2002:a81:7457:0:b0:570:7df7:e401 with SMTP id
 p84-20020a817457000000b005707df7e401mr17897993ywc.29.1691033421698; Wed, 02
 Aug 2023 20:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230802072436.1020900-1-alex@linutronix.de>
In-Reply-To: <20230802072436.1020900-1-alex@linutronix.de>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 2 Aug 2023 20:30:10 -0700
Message-ID: <CANx9H-CWfiYbu=M6JQKU_6mnM0gX82D9vTXczb_fg46XLpRuCQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] devtool/upgrade: raise an error if
 extracting source produces more than one directory
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000675c4d0601fc663a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 03:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185450

--000000000000675c4d0601fc663a
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 2, 2023 at 12:24 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> This can happen if running unpack task produces unrelated files and
> directories
> (e.g. if recipe_qa or other tasks run); in this case it's better to stop,
> rather
> than allow devtool to continue and error out much later with a message
> that has
> nothing to do with where the problem originated.
>
> The idea here was to handle tarballs that don't contain a top level
> directory and thus
> the source tree is one level up; this basically never happens, and if it
> does we
> should find a less brittle way to handle such tarballs.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

Tested-by: Tim Orling <tim.orling@konsulko.com>

>
> ---
>  scripts/lib/devtool/upgrade.py | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/lib/devtool/upgrade.py
> b/scripts/lib/devtool/upgrade.py
> index 6c4a62b5584..e015a85982c 100644
> --- a/scripts/lib/devtool/upgrade.py
> +++ b/scripts/lib/devtool/upgrade.py
> @@ -35,6 +35,8 @@ def _get_srctree(tmpdir):
>      dirs = scriptutils.filter_src_subdirs(tmpdir)
>      if len(dirs) == 1:
>          srctree = os.path.join(tmpdir, dirs[0])
> +    else:
> +        raise DevtoolError("Cannot determine where the source tree is
> after unpacking in {}: {}".format(tmpdir,dirs))
>      return srctree
>
>  def _copy_source_code(orig, dest):
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185378):
> https://lists.openembedded.org/g/openembedded-core/message/185378
> Mute This Topic: https://lists.openembedded.org/mt/100500737/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000675c4d0601fc663a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Aug 2, 2023 at 12:24 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">This can happen if running unpack t=
ask produces unrelated files and directories<br>
(e.g. if recipe_qa or other tasks run); in this case it&#39;s better to sto=
p, rather<br>
than allow devtool to continue and error out much later with a message that=
 has<br>
nothing to do with where the problem originated.<br>
<br>
The idea here was to handle tarballs that don&#39;t contain a top level dir=
ectory and thus<br>
the source tree is one level up; this basically never happens, and if it do=
es we<br>
should find a less brittle way to handle such tarballs.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;</blockquote><div dir=3D"auto">=
Tested-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com">tim.or=
ling@konsulko.com</a>&gt;</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto">=
<br>
---<br>
=C2=A0scripts/lib/devtool/upgrade.py | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y<br>
index 6c4a62b5584..e015a85982c 100644<br>
--- a/scripts/lib/devtool/upgrade.py<br>
+++ b/scripts/lib/devtool/upgrade.py<br>
@@ -35,6 +35,8 @@ def _get_srctree(tmpdir):<br>
=C2=A0 =C2=A0 =C2=A0dirs =3D scriptutils.filter_src_subdirs(tmpdir)<br>
=C2=A0 =C2=A0 =C2=A0if len(dirs) =3D=3D 1:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srctree =3D os.path.join(tmpdir, dirs[0])=
<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DevtoolError(&quot;Cannot determine wher=
e the source tree is after unpacking in {}: {}&quot;.format(tmpdir,dirs))<b=
r>
=C2=A0 =C2=A0 =C2=A0return srctree<br>
<br>
=C2=A0def _copy_source_code(orig, dest):<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#185378): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185378" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/185378</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100500737/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/100500737/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000675c4d0601fc663a--

