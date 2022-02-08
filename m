Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5687FC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 10:30:41 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.9463.1644316240254824899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 02:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hUKVdVJi;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id i17so6318625lfg.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 02:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hdzd73JbQKzwm1IxpqIDUfAMt1oyj44+yrnmlp2OVe8=;
        b=hUKVdVJipvp9zzTL/N7IinEoM2OlBJ7Gwx8dmFMEwWu3iuE3f00fBGou0IGFuPb7kp
         MrKGJru6SBGl+p8SwiyfrkgO2F0dT5OYS4XDVtIaQ3tvyUwCzPCVm/i1uKn7ljfoF9WW
         0LFPY81J5fcTNXLx0uWtFLfMtUr1bJofA40IbAV+SDF65rxJvlF6L71nG7lK30zyy2to
         HWO7vzI720HxKNTEwpD6bB2h/kr29e8HxGXoghgNQYL7LcjmNCfuczYhD3ICpR2KeW+S
         UqO9xhjD4ZVkryOeGXGUtRQ1plVV/9MGLh816pB4+ijEMivq3jdIV4hXP0fzlz/KKTMM
         4IBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hdzd73JbQKzwm1IxpqIDUfAMt1oyj44+yrnmlp2OVe8=;
        b=Hy4Tuu0dsXfLpyIp91VfcZgIW7LHvZgtSor0gV0e+Ma+ToFIdX9SYRlqFjhI7v37im
         UdXib43t2LZnL1rrt1tc94Ll7jZosQGw1xH7EZzPdwIy5IQHbOlcuJrvFWjARaMa3Q8L
         zw0OGly4am9p3aPsApKRqMPRiBKWGwR6/O25xhDQngkDNKg4bM5yoMgzXLEMGIgsXIET
         rakMCk6ByOAm4Q2OuJaxxkbCtXAB4L/bo55OsWBqCHd/u29RIjRicotanVfnmMh2NCtv
         tizTi5xzZH649ciNVZuDTnzAMU3ZUk0MLU7txnZajDDrTAebC+1xrC4PuCTDgtPXGxhA
         RKng==
X-Gm-Message-State: AOAM532McTrs+bnhFsq4ypu1ThRAQkAxJNhM918+ZD3lEXmAGzxiDJdj
	y5fgBtwDTfpKjmXI3UXWh2ycMAA+PGXSZYpaiW4=
X-Google-Smtp-Source: 
 ABdhPJwg/PbeYWAg6+6J7ANwzBp2gegi0Vk9vVgFqpBjQU2Yq0tR86ovd1XWHddmC7Pmq2NOjOURaFmvIMcRMPc9uE0=
X-Received: by 2002:a05:6512:332a:: with SMTP id
 l10mr2520392lfe.94.1644316238471;
 Tue, 08 Feb 2022 02:30:38 -0800 (PST)
MIME-Version: 1.0
References: <20220208035000.400632-1-bkylerussell@gmail.com>
In-Reply-To: <20220208035000.400632-1-bkylerussell@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 8 Feb 2022 10:30:27 +0000
Message-ID: 
 <CANPvuRmgE1RknD3qB8q0-D0uTTSFCOd1BA76TTmRJrMMbhXRHQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] devtool: get hooks directory path from git
 rev-parse
To: bkylerussell@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004ae47a05d77f3564"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 10:30:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161496

--0000000000004ae47a05d77f3564
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

<bkylerussell@gmail.com> escreveu no dia ter=C3=A7a, 8/02/2022 =C3=A0(s) 03=
:50:

> Ask git rev-parse to provide the path to the repo's hooks directory.
>
> This allows devtool to support git submodules, where only the
> superproject contains a .git directory.
>
> git submodules contain .git files pointing to their parent repo,
> which confuses devtool when it tries to modify the commit hooks by
> a manually constructed path.
>

+Signed-off-by: your@mail


> ---
>  meta/lib/oe/patch.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index 950fe723dc..976a966083 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -510,7 +510,7 @@ class GitApplyTree(PatchTree):
>          reporoot =3D (runcmd("git rev-parse --show-toplevel".split(),
> self.dir) or '').strip()
>          if not reporoot:
>              raise Exception("Cannot get repository root for directory %s=
"
> % self.dir)
> -        hooks_dir =3D os.path.join(reporoot, '.git', 'hooks')
> +        hooks_dir =3D runcmd("git rev-parse --git-path hooks".split())
>

This assumes that the git will run inside the self.dir but this is not
guaranteed so adding self.dir to the runcmd is safer.


>          hooks_dir_backup =3D hooks_dir + '.devtool-orig'
>          if os.path.lexists(hooks_dir_backup):
>              raise Exception("Git hooks backup directory already exists:
> %s" % hooks_dir_backup)
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161473):
> https://lists.openembedded.org/g/openembedded-core/message/161473
> Mute This Topic: https://lists.openembedded.org/mt/88989924/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000004ae47a05d77f3564
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">&lt;<a href=3D"mailto:bkylerussell@gmail.com">bkyl=
erussell@gmail.com</a>&gt; escreveu no dia ter=C3=A7a, 8/02/2022 =C3=A0(s) =
03:50:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ask git r=
ev-parse to provide the path to the repo&#39;s hooks directory.<br>
<br>
This allows devtool to support git submodules, where only the<br>
superproject contains a .git directory.<br>
<br>
git submodules contain .git files pointing to their parent repo,<br>
which confuses devtool when it tries to modify the commit hooks by<br>
a manually constructed path.<br></blockquote><div><br></div><div>+Signed-of=
f-by: your@mail<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
---<br>
=C2=A0meta/lib/oe/patch.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py<br>
index 950fe723dc..976a966083 100644<br>
--- a/meta/lib/oe/patch.py<br>
+++ b/meta/lib/oe/patch.py<br>
@@ -510,7 +510,7 @@ class GitApplyTree(PatchTree):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reporoot =3D (runcmd(&quot;git rev-parse =
--show-toplevel&quot;.split(), self.dir) or &#39;&#39;).strip()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not reporoot:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise Exception(&quot;Canno=
t get repository root for directory %s&quot; % self.dir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 hooks_dir =3D os.path.join(reporoot, &#39;.git=
&#39;, &#39;hooks&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 hooks_dir =3D runcmd(&quot;git rev-parse --git=
-path hooks&quot;.split())<br></blockquote><div><br></div><div>This assumes=
 that the git will run inside the self.dir but this is not guaranteed so ad=
ding self.dir to the runcmd=C2=A0is safer.</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hooks_dir_backup =3D hooks_dir + &#39;.de=
vtool-orig&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.lexists(hooks_dir_backup):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise Exception(&quot;Git h=
ooks backup directory already exists: %s&quot; % hooks_dir_backup)<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#161473): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/161473" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/161473</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88989924/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88989924/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000004ae47a05d77f3564--

