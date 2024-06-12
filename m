Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E714C27C75
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 09:32:00 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web11.7125.1718184715035151174
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 02:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gfo2Dnq5;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-80b7c11aaf9so624280241.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 02:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718184714; x=1718789514; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Stf3xkQERbyiyKOmptPtHgVij2+eo+ncbWhm/7fAEkc=;
        b=gfo2Dnq5QzUNNa8HUZM48H7PlnxS3i5S2fSJadUqRSzmgEqkmKLdaHnbwKSJcwl2AY
         mx87ley6agZIsv5+2jknnoMIZObJkVxODujqWqjr8y51D4Luc4iahv/lYNDybduxXUoJ
         llzRT2+hMBhqe6WaGx7RQytjFV9BmIMZ3IuKoRXVHChhN9uKu3mOd3Vv+XTwT6IazxfE
         AMeFNTr+YiivCeiERC3mOfGm1zI0ELZ4WK2ZIfWMrlrHBe/QQvnTQHQuFW18l5nMWX7Z
         NHCHWzTI3nZ2VA9WdTkvf8O6WdPYg3tsEZ0T9sOaQyd6EhERx1/E3C3BpYgbAk5dE5En
         a2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718184714; x=1718789514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Stf3xkQERbyiyKOmptPtHgVij2+eo+ncbWhm/7fAEkc=;
        b=N6wm7wB3iC+DrYhD+SyJEHCYXLegzsvEsKNJp1qRHJqngZGWDleNHzwncz/0AJBf+G
         5UWKV0G4iiCEKMOa2CQe8UsFPKUJ82GrM1XMPdb09/LlJ3TJv1vh1fPSl06gMCM1GkoI
         TsILkZ7lfINkn2tFyFoxsVG4lxkxVaMPZhy+x0/ImNOY/GUVTbiBe0jsfmkCiDf4GB22
         kEZm2ZWypnTLBe6ll9pzdJ7PJB5cD4GlZ9nMq+uGOnEUqTm136vnSO+5Q5cqa04De6d2
         QGdL2qLOAWCve/9Xo9gPjp/Sy45ZrgSk79jOGxiAaigigGzaIvVAWXSmxZPI+SljF/a1
         xtJw==
X-Gm-Message-State: AOJu0Yzq80DM+xA7VVafYSdjMMvzacSya0/fesuTLu2ycq8pFlXOFcEh
	H5pIykmTCLfVMk32MB60rg/L2UKRprswEkiGImU45Tlxe2WCjmkvKQwnXWvexRIFIxe8HacoXo9
	v8Z3X24Gr5YpJe6/FvLR2lHGE2NY=
X-Google-Smtp-Source: AGHT+IEyi7jxbz4g/KY9rLvXMDo6cLT9dCSN/ZB7Dp29DqiWpdcgzavFS775VznP1KzYkSJDOX5vjNcan49mANiJWxI=
X-Received: by 2002:a05:6102:4656:b0:48c:3c3f:3689 with SMTP id
 ada2fe7eead31-48d91e86866mr1352289137.26.1718184713965; Wed, 12 Jun 2024
 02:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <23837.1718148644454631767@lists.openembedded.org> <Groupsio.3.23837.1718148644454631767@lists.openembedded.org>
In-Reply-To: <Groupsio.3.23837.1718148644454631767@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 12 Jun 2024 10:31:43 +0100
Message-ID: <CANPvuRm4b5+=LiKksGny0TOU=MigiHzh81FYpuGQUfmM4MifGA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] archiver.bbclass: Fix work-shared checking for
 kernel recipes
To: egyszeregy@freemail.hu
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000088d659061aae0df1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 09:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200569

--00000000000088d659061aae0df1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Livius,

In reality, although the kernel has its code in S =3D "${WORKDIR}/git" it
ends up being moved to ${STAGING_KERNEL_DIR} in the do_symlink_kernsrc
kernel.bbclass function.
https://github.com/openembedded/openembedded-core/blob/07b4c7a2bd23f8645810=
e13439e814caaaf9cd94/meta/classes-recipe/kernel.bbclass#L182C8-L199

After this, the source S becomes a symbolic link for STAGING_KERNEL_DIR
so I think if we check the real path following the symbolic link we solve
the problem.

- return d.getVar('S').startswith(sharedworkdir)
+ return os.path.realpath(d.getVar('S')).startswith(sharedworkdir)

Could you try using os.path.realpath in S to see if it works?

Jose

Livius via lists.openembedded.org <egyszeregy=3D
freemail.hu@lists.openembedded.org> escreveu (quarta, 12/06/2024 =C3=A0(s)
00:35):

> [Edited Message Follows]
>
> S =3D "${WORKDIR}/git" does not contain "${TMPDIR}/work-shared" path,
> therefore "def is_work_shared(d):" will be returned with False and archiv=
er
> is failed for linux kernel recipe (somewhy unpack is broken and kernel
> source is missing in work-shared folder in this situation).
> https://github.com/openembedded/bitbake/blob/master/conf/bitbake.conf#L45
>
> In default S =3D "${STAGING_KERNEL_DIR}" is the source path for a kernel.
> Now, archiver works only in this case when it is not changed to
> "${WORKDIR}/git" symbolic link folder. We can see
> "bb.data.inherits_class('kernel', d)" was in the old code for checking it
> because of this situation, when somebody like to use this kind of symboli=
c
> link git source solution. This should not have been dropped in last commi=
t.
>
>
> https://github.com/openembedded/openembedded-core/commit/5fbb4ca8da4f4f1e=
a426275c45634802dcb5a575#diff-7a2ccc0d645ec49c87c4956f90ab24ace5292140dff66=
5459bbc94e4e72a8e07L473
>
> https://github.com/openembedded/openembedded-core/blob/master/meta/classe=
s-recipe/kernel.bbclass#L26
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200551):
> https://lists.openembedded.org/g/openembedded-core/message/200551
> Mute This Topic: https://lists.openembedded.org/mt/106531570/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000088d659061aae0df1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Livius,<br><br>In reality, although th=
e kernel has its code in S =3D &quot;${WORKDIR}/git&quot; it ends up being =
moved to ${STAGING_KERNEL_DIR}=C2=A0in the do_symlink_kernsrc kernel.bbclas=
s function.</div><div dir=3D"ltr"><a href=3D"https://github.com/openembedde=
d/openembedded-core/blob/07b4c7a2bd23f8645810e13439e814caaaf9cd94/meta/clas=
ses-recipe/kernel.bbclass#L182C8-L199">https://github.com/openembedded/open=
embedded-core/blob/07b4c7a2bd23f8645810e13439e814caaaf9cd94/meta/classes-re=
cipe/kernel.bbclass#L182C8-L199</a><br><br></div><div dir=3D"ltr">After thi=
s, the source S becomes a symbolic link for STAGING_KERNEL_DIR</div><div di=
r=3D"ltr">so I think if we check the real path following the symbolic link =
we solve the problem.<br><br>- return d.getVar(&#39;S&#39;).startswith(shar=
edworkdir)<br>+ return os.path.realpath(d.getVar(&#39;S&#39;)).startswith(s=
haredworkdir)<br><br></div><div dir=3D"ltr">Could you try using os.path.rea=
lpath in S to see if it works?<br></div><div><br></div>Jose<br><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Livius via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;egyszereg=
y=3D<a href=3D"mailto:freemail.hu@lists.openembedded.org">freemail.hu@lists=
.openembedded.org</a>&gt; escreveu (quarta, 12/06/2024 =C3=A0(s) 00:35):<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">[Edited Message Fo=
llows]<br>
<br>
S =3D &quot;${WORKDIR}/git&quot; does not contain &quot;${TMPDIR}/work-shar=
ed&quot; path, therefore &quot;def is_work_shared(d):&quot; will be returne=
d with False and archiver is failed for linux kernel recipe (somewhy unpack=
 is broken and kernel source is missing in work-shared folder in this situa=
tion).<br>
<a href=3D"https://github.com/openembedded/bitbake/blob/master/conf/bitbake=
.conf#L45" rel=3D"noreferrer" target=3D"_blank">https://github.com/openembe=
dded/bitbake/blob/master/conf/bitbake.conf#L45</a><br>
<br>
In default S =3D &quot;${STAGING_KERNEL_DIR}&quot; is the source path for a=
 kernel. Now, archiver works only in this case when it is not changed to &q=
uot;${WORKDIR}/git&quot; symbolic link folder. We can see &quot;bb.data.inh=
erits_class(&#39;kernel&#39;, d)&quot; was in the old code for checking it =
because of this situation, when somebody like to use this kind of symbolic =
link git source solution. This should not have been dropped in last commit.=
<br>
<br>
<a href=3D"https://github.com/openembedded/openembedded-core/commit/5fbb4ca=
8da4f4f1ea426275c45634802dcb5a575#diff-7a2ccc0d645ec49c87c4956f90ab24ace529=
2140dff665459bbc94e4e72a8e07L473" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/openembedded/openembedded-core/commit/5fbb4ca8da4f4f1ea42627=
5c45634802dcb5a575#diff-7a2ccc0d645ec49c87c4956f90ab24ace5292140dff665459bb=
c94e4e72a8e07L473</a><br>
<a href=3D"https://github.com/openembedded/openembedded-core/blob/master/me=
ta/classes-recipe/kernel.bbclass#L26" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/openembedded/openembedded-core/blob/master/meta/classes-=
recipe/kernel.bbclass#L26</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#200551): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/200551" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/200551</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106531570/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106531570/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000088d659061aae0df1--

