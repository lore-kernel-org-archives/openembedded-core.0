Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87192C43334
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 20:33:39 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web12.3252.1656448413191345300
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 13:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YbRvDV48;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id a2so24348884lfg.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 13:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IJ35DwwTawNmk9389r7bj3qY6MDYLzEk/BB5EI4FYwc=;
        b=YbRvDV48Vzgv0XWLOfZ6QEcMen+hlrSOIm1n7A4lwSazc0xYbh0j3kOMEjGfu2htr6
         MBHBmX+FiRw/cbKltCdOj2yGUNFBpe8BaPpLrCuiOZPqA3iWs+wosXh1CFwYsMJb1XNK
         ip8JYl/Af0QVKuMCdQNoNHfY0lvJhUaJztZa/0oF5pDyHA5GwKIfNNTXFwXfDbAE+rxQ
         Pav1yam1FAnpcFC2UGcrgWN6GPK3ChsAxMK9oBe4K6HhFk6CjMcdMGy0iRGbRwX1Z1Gn
         D5Zj0YDzLR5NOCd5HVBmmonDv+tEhoBcdCh9MMMLpJvkXo3NMIbDGLwx1jENc/1HXQuA
         hQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IJ35DwwTawNmk9389r7bj3qY6MDYLzEk/BB5EI4FYwc=;
        b=5d0l20POeonM6XUE45k90ZVfFSE6nKkbs6Evg2S7wtV7JCY8H59nR1Z4aSL77A1tDr
         vWDJfknLVsR6rd8V1k36eHB4YVW3dKpiJD3vRjdLkaZyH/THrdFAMBiDgY50626ns9Sg
         p8z7HflvHbFGcAgYc3v3ygPfFkzr357byuv02fZXdP8yTzFwzbbelzTs5rphH7u6pN/P
         nlzIfnLu1X5+jeZEOc4DFx7tW34PrNzlZ0egudjxvuAuyRevIxIFmKg/29xxnl0091Vg
         pbd6Pe9dJKPMdSWfbv/zKDx8UO3rdsyHzOoI8O+6jjDnt8bC2kgxjwrWga9UZMg1LQpw
         LaTw==
X-Gm-Message-State: AJIora+yZIpsNVCjHby6UOxIsAjsxZr73CaoJe3j55vlsSPx3iSmQ5yl
	HH/1NbSV45IiQAg3iEozlSnOfSKIEIfDwiqjjpfZ0DFHT45jpw==
X-Google-Smtp-Source: 
 AGRyM1vfAedNHuVs3wOYL6T3TKqTGrNNtNL5mexVDRchiOYh46moVaNVKSE+OkoVhVShrW0gqRVbqPaeICePWSjR8RI=
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id
 p36-20020a05651213a400b004793b9ff13cmr13153843lfa.380.1656448411299; Tue, 28
 Jun 2022 13:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220628201152.25066-1-shruthi.ravichandran@ni.com>
In-Reply-To: <20220628201152.25066-1-shruthi.ravichandran@ni.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Jun 2022 23:33:20 +0300
Message-ID: 
 <CANNYZj8gqzaSSi56v8arKujeWa6zTRf0LubXzX0MeDP3BawiSQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] package_manager/ipk: do not pipe stderr to
 stdout
To: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000024f36805e287f336"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 20:33:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167355

--00000000000024f36805e287f336
Content-Type: text/plain; charset="UTF-8"

This needs additional justification. What are the error messages, why are
they harmless and why the solution is to suppress them instead of
addressing the reasons they appear?

Alex

On Tue 28. Jun 2022 at 23.13, Shruthi Ravichandran <
shruthi.ravichandran@ni.com> wrote:

> When parsing the output of a command, do not pipe stderr to stdout.
> Opkg sometimes prints harmless error messages even when the opkg
> command succeeds. When stderr is piped to stdout, these error
> messages may clobber the stdout and cause unexpected results while
> parsing the output.
>
> Signed-off-by: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
> ---
>  meta/lib/oe/package_manager/ipk/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/package_manager/ipk/__init__.py
> b/meta/lib/oe/package_manager/ipk/__init__.py
> index 4cd3963111..d7f3f31853 100644
> --- a/meta/lib/oe/package_manager/ipk/__init__.py
> +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> @@ -103,7 +103,7 @@ class OpkgDpkgPM(PackageManager):
>          """
>
>          try:
> -            output = subprocess.check_output(cmd,
> stderr=subprocess.STDOUT, shell=True).decode("utf-8")
> +            output = subprocess.check_output(cmd,
> shell=True).decode("utf-8")
>          except subprocess.CalledProcessError as e:
>              bb.fatal("Unable to list available packages. Command '%s' "
>                       "returned %d:\n%s" % (cmd, e.returncode,
> e.output.decode("utf-8")))
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167354):
> https://lists.openembedded.org/g/openembedded-core/message/167354
> Mute This Topic: https://lists.openembedded.org/mt/92051989/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000024f36805e287f336
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This needs additional justification. What are the error m=
essages, why are they harmless and why the solution is to suppress them ins=
tead of addressing the reasons they appear?</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue 28. Jun 2022 at 23.13, Shruthi Ravicha=
ndran &lt;<a href=3D"mailto:shruthi.ravichandran@ni.com">shruthi.ravichandr=
an@ni.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)">When parsing the outpu=
t of a command, do not pipe stderr to stdout.<br>
Opkg sometimes prints harmless error messages even when the opkg<br>
command succeeds. When stderr is piped to stdout, these error<br>
messages may clobber the stdout and cause unexpected results while<br>
parsing the output.<br>
<br>
Signed-off-by: Shruthi Ravichandran &lt;<a href=3D"mailto:shruthi.ravichand=
ran@ni.com" target=3D"_blank">shruthi.ravichandran@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/package_manager/ipk/__init__.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/pack=
age_manager/ipk/__init__.py<br>
index 4cd3963111..d7f3f31853 100644<br>
--- a/meta/lib/oe/package_manager/ipk/__init__.py<br>
+++ b/meta/lib/oe/package_manager/ipk/__init__.py<br>
@@ -103,7 +103,7 @@ class OpkgDpkgPM(PackageManager):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D subprocess.check_outp=
ut(cmd, stderr=3Dsubprocess.STDOUT, shell=3DTrue).decode(&quot;utf-8&quot;)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D subprocess.check_outp=
ut(cmd, shell=3DTrue).decode(&quot;utf-8&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except subprocess.CalledProcessError as e=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fatal(&quot;Unable to li=
st available packages. Command &#39;%s&#39; &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;returned %d:\n%s&quot; % (cmd, e.returncode, e.output.decode(&quo=
t;utf-8&quot;)))<br>
-- <br>
2.20.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167354): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167354" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167354</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92051989/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92051989/1686489</a><br>
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

--00000000000024f36805e287f336--

