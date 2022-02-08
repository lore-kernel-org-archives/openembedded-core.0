Return-Path: <bkylerussell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9960FC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 12:18:38 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web09.10416.1644322717209750076
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 04:18:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gJ5+kgBG;
 spf=pass (domain: gmail.com, ip: 209.85.210.47,
 mailfrom: krussell7711@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id
 b12-20020a9d754c000000b0059eb935359eso13079784otl.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 04:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8KUna8ArB0KLH6AoC/SiEwMzImNN4R8IqhHVr8br8G8=;
        b=gJ5+kgBGycXxnOx1ndpezUJWXU/RZrUnK3evPqWK4esEiRuLLusB25D2SX2bWNk0C/
         /9eXHg6tH5ZU88IdoGeOjbQtqJlQ3t6LLJG/E/qmPSnsGaAPRaDPe7jp+TCQ4N+1JiKU
         eFucQzBwe3U6wnLj4JA7AiVrEIXMlWkP1RMP8glh0DIGP6qxEtZ0Idr96Mla7TZbtS8d
         NpxbWYJZcYX4J6u8R+OdddI40ioxqy70TmkH3bz4Al6ekah6nA9KTtsHPtQp5E5Xl8Ki
         X1z2GU2AzIe+Rtm8tgyFfVdj55eIITT4kG/E8zeVZRkyO8vlqUv9CWrviG4CDL73/ady
         U4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8KUna8ArB0KLH6AoC/SiEwMzImNN4R8IqhHVr8br8G8=;
        b=WoXVIV4oR7LC5GlCrTv2tU+Zxz6D3shVhPcwd2zTXxMMSYodCwhqCzqnQkVFHAaqLq
         NZYnn1h7u+zJYDc0IT5AtTeKVgY+Iy1FwRSLqA4LvnFbqd694I7744qzb2Cx172AXdW+
         rqU2gQiDJJg4KrrHPkVaud0A7HlDXg2yjZBiKdURA4TT4TBqdWCELaD5OZ1Zk1UNEGvm
         5LPfHfhvBUfEAegRZfyszdGURULtj2g5RRvSml7PYFoFNWpLG9ny6PPiE+YIhBnzfqXO
         OGviKPR4U4BcvTCSmtIt6RK6+UBr+gR50QPlAgvRkVW5wVocBsIwO9QmmfyyG/1hMBlm
         A1+A==
X-Gm-Message-State: AOAM532ZMdnBF2a5NxXfAl6jRiS+Ty72DUzFcuwzonY7UopbzqjWJ+Z6
	QukL2LH+HA7BC7CxPGNgaz3FZyPRaxjXOH8yTTc=
X-Google-Smtp-Source: 
 ABdhPJyuHyHSIR0IWakOeZ+q0Qvdzaho7JofJo3A0qtUKtyVpQNlwz++JMxF6kUyE10npafIABnTAPZ0A9gll2dD+cw=
X-Received: by 2002:a9d:2f25:: with SMTP id h34mr1721570otb.346.1644322716343;
 Tue, 08 Feb 2022 04:18:36 -0800 (PST)
MIME-Version: 1.0
References: <20220208035000.400632-1-bkylerussell@gmail.com>
 <CANPvuRmgE1RknD3qB8q0-D0uTTSFCOd1BA76TTmRJrMMbhXRHQ@mail.gmail.com>
In-Reply-To: 
 <CANPvuRmgE1RknD3qB8q0-D0uTTSFCOd1BA76TTmRJrMMbhXRHQ@mail.gmail.com>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Tue, 8 Feb 2022 07:18:25 -0500
Message-ID: 
 <CAFrQVPOMJT83q8-j=kwU8hwoEOVNmhekcTMdToVLzDxq3-6rmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] devtool: get hooks directory path from git
 rev-parse
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000067600405d780b724"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 12:18:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161502

--00000000000067600405d780b724
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, I see.  I didn't realize I dropped that from the original line.  Thanks
for the catch.

On Tue, Feb 8, 2022 at 5:30 AM Jose Quaresma <quaresma.jose@gmail.com>
wrote:

> Hi,
>
> <bkylerussell@gmail.com> escreveu no dia ter=C3=A7a, 8/02/2022 =C3=A0(s) =
03:50:
>
>> Ask git rev-parse to provide the path to the repo's hooks directory.
>>
>> This allows devtool to support git submodules, where only the
>> superproject contains a .git directory.
>>
>> git submodules contain .git files pointing to their parent repo,
>> which confuses devtool when it tries to modify the commit hooks by
>> a manually constructed path.
>>
>
> +Signed-off-by: your@mail
>
>
>> ---
>>  meta/lib/oe/patch.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
>> index 950fe723dc..976a966083 100644
>> --- a/meta/lib/oe/patch.py
>> +++ b/meta/lib/oe/patch.py
>> @@ -510,7 +510,7 @@ class GitApplyTree(PatchTree):
>>          reporoot =3D (runcmd("git rev-parse --show-toplevel".split(),
>> self.dir) or '').strip()
>>          if not reporoot:
>>              raise Exception("Cannot get repository root for directory
>> %s" % self.dir)
>> -        hooks_dir =3D os.path.join(reporoot, '.git', 'hooks')
>> +        hooks_dir =3D runcmd("git rev-parse --git-path hooks".split())
>>
>
> This assumes that the git will run inside the self.dir but this is not
> guaranteed so adding self.dir to the runcmd is safer.
>
>
>>          hooks_dir_backup =3D hooks_dir + '.devtool-orig'
>>          if os.path.lexists(hooks_dir_backup):
>>              raise Exception("Git hooks backup directory already exists:
>> %s" % hooks_dir_backup)
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#161473):
>> https://lists.openembedded.org/g/openembedded-core/message/161473
>> Mute This Topic: https://lists.openembedded.org/mt/88989924/5052612
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> quaresma.jose@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>

--00000000000067600405d780b724
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok, I see.=C2=A0 I didn&#39;t realize I dropped that from =
the original line.=C2=A0 Thanks for the catch.<br></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 8, 2022 at 5:=
30 AM Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com">quaresma=
.jose@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div>Hi,</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">&lt;<a href=3D"mailto:bkylerussell@=
gmail.com" target=3D"_blank">bkylerussell@gmail.com</a>&gt; escreveu no dia=
 ter=C3=A7a, 8/02/2022 =C3=A0(s) 03:50:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Ask git rev-parse to provide the path to the repo&#=
39;s hooks directory.<br>
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
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>
</blockquote></div>

--00000000000067600405d780b724--

