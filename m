Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C815C4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 15:36:55 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.8741.1668613012577136302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 07:36:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=orQqmVFc;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id l12so30097696lfp.6
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 07:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mjZrmENxI0RIcyLQevpBkL09dONfb/JzM/ZUzgB8yGk=;
        b=orQqmVFcosCoEL1TuOOsT3JxBvLy7rOUQ9JgM9ZjC0AFsImqU7nCrCNfZv4QPWyg2E
         KDtJmdLd13wQrggW/NDzh1medHhGIUq1olUOOHOIVSuQ5hFfnRRrNV1Kh8aG+DdRgEFY
         teAI9Ph3XSGMqbHceYcunZWQ5spLHerIXQqV9DUoDo/bTWYe+uNvtAHxWzGtSLCAWS70
         tq29CykJ5f2MCFT3ok5QfeBWXBTzWUhxGvell+ubmQadDDwZ2RdYSu2Sn6ok4u3S1gDN
         u9yNneOdbVgxnATVtE+LWVBtMdUv2uFrlS3XUji1SqumnF/qiufrQ049DkIZBOj2bt4T
         MkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjZrmENxI0RIcyLQevpBkL09dONfb/JzM/ZUzgB8yGk=;
        b=S3+ZGwdvPzStKsDT5Btwaa9jBGTY7S4aCkIPcu8I2XyFKbAUj+djd5SOqHyDWAkinb
         ut1S5JwFwaFhTtgXQgWLQ87xhqTCjS1wn/BPY/uMb6VJUyDz7X14nEzefGrj+/kLPg3n
         T/ToXseWPFAlSTQ5ztAH+E72Y6g8khhgGPmFo9tk2sy4z3hSLtcZD2IiOVSTN9KgQnPX
         wDXA8J1niSteOWuQjWNWn79eRnx6HI61E17cSa3wJfeJzWTI2CpVSNsiyV/Feydz2J+I
         VJ4tZtIav7eQ9VB60YOTp6mV683ia/6CswadjsCMT50zJJxcj/6VOvwn5rCA3cMJZB/1
         kLSA==
X-Gm-Message-State: ANoB5pnvhH1cB4Trpqr7TGmV5L4FJZ8PUrWOvIlUhyVp0qlOZx9v03Cj
	NvYw2YkGZdyV6V5YieiYx7Hus7PEwNXy55rbg8o=
X-Google-Smtp-Source: AA0mqf77GRyzUFjLuu3hdhOC8lBGGsxa5Edq8W2DjnAUSFiPxucXK//7rTFCUti4CmzHsWYXCTr/6X5UCEPkfjJbcms=
X-Received: by 2002:a05:6512:3d22:b0:4af:b4ac:c2d6 with SMTP id
 d34-20020a0565123d2200b004afb4acc2d6mr8076373lfv.219.1668613010562; Wed, 16
 Nov 2022 07:36:50 -0800 (PST)
MIME-Version: 1.0
References: <20221116112425.2173010-1-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <20221116112425.2173010-1-enrico.scholz@sigma-chemnitz.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 16 Nov 2022 15:36:39 +0000
Message-ID: <CANPvuR=SJ35jquRnLYmkBaZ=YjX-sVp9QLQGSMmU9qE996ei4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate: show progress bar again
To: enrico.scholz@sigma-chemnitz.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c322e905ed983ddf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 15:36:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173388

--000000000000c322e905ed983ddf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Enrico,

Enrico Scholz via lists.openembedded.org <enrico.scholz=3D
sigma-chemnitz.de@lists.openembedded.org> escreveu no dia quarta,
16/11/2022 =C3=A0(s) 11:24:

> From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>
> Transition to ThreadPoolExecutor (eb6a6820928472ef194b963b606454e731f9486=
f)
> broke the
>
> | Checking sstate mirror object availability: ...
>
> progress bar because the removed 'thread_worker' was still referenced
> in an asynchronous function.  As the result of the future is never
> read, the resulting backtrace is silently discarded.
>

I have tested the patch at the time and the progress bar works as expected,
maybe something breaks after that.


>
> Replace the information given to 'ProcessProgress' by a counter.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  meta/classes-global/sstate.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/sstate.bbclass
> b/meta/classes-global/sstate.bbclass
> index 2c8e7b8cc232..3fabca4a3160 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -925,6 +925,8 @@ sstate_unpack_package () {
>  BB_HASHCHECK_FUNCTION =3D "sstate_checkhashes"
>
>  def sstate_checkhashes(sq_data, d, siginfo=3DFalse, currentcount=3D0,
> summary=3DTrue, **kwargs):
> +    import itertools
> +
>      found =3D set()
>      missed =3D set()
>
> @@ -1019,7 +1021,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,
> currentcount=3D0, summary=3DTrue,
>              connection_cache_pool.put(connection_cache)
>
>              if progress:
> -                bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist=
)
> - thread_worker.tasks.qsize()), d)
> +                bb.event.fire(bb.event.ProcessProgress(msg,
> next(num_tasks_done) + 1), d)


>          tasklist =3D []
>          for tid in missed:
> @@ -1029,6 +1031,8 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,
> currentcount=3D0, summary=3DTrue,
>          if tasklist:
>              nproc =3D min(int(d.getVar("BB_NUMBER_THREADS")), len(taskli=
st))
>
> +            ## thread-safe counter
> +            num_tasks_done =3D itertools.count()
>              progress =3D len(tasklist) >=3D 100
>              if progress:
>

Can the num_tasks_done be moved to there and call the first
next(num_tasks_done) so we can remove the +1 on the ProcessProgress

Jose


>                  msg =3D "Checking sstate mirror object availability"
> --
> 2.38.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173383):
> https://lists.openembedded.org/g/openembedded-core/message/173383
> Mute This Topic: https://lists.openembedded.org/mt/95064126/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000c322e905ed983ddf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Enrico,</div><div><br></div><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">Enrico Scholz via <a href=3D"htt=
p://lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &l=
t;enrico.scholz=3D<a href=3D"mailto:sigma-chemnitz.de@lists.openembedded.or=
g" target=3D"_blank">sigma-chemnitz.de@lists.openembedded.org</a>&gt; escre=
veu no dia quarta, 16/11/2022 =C3=A0(s) 11:24:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Enrico Scholz &lt;<a href=3D"mailto:=
enrico.scholz@sigma-chemnitz.de" target=3D"_blank">enrico.scholz@sigma-chem=
nitz.de</a>&gt;<br>
<br>
Transition to ThreadPoolExecutor (eb6a6820928472ef194b963b606454e731f9486f)=
<br>
broke the<br>
<br>
| Checking sstate mirror object availability: ...<br>
<br>
progress bar because the removed &#39;thread_worker&#39; was still referenc=
ed<br>
in an asynchronous function.=C2=A0 As the result of the future is never<br>
read, the resulting backtrace is silently discarded.<br></blockquote><div><=
br>I have tested the patch at the time and the progress bar works as expect=
ed, maybe something breaks after that.<br>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
Replace the information given to &#39;ProcessProgress&#39; by a counter.<br=
>
<br>
Signed-off-by: Enrico Scholz &lt;<a href=3D"mailto:enrico.scholz@sigma-chem=
nitz.de" target=3D"_blank">enrico.scholz@sigma-chemnitz.de</a>&gt;<br>
---<br>
=C2=A0meta/classes-global/sstate.bbclass | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass<br>
index 2c8e7b8cc232..3fabca4a3160 100644<br>
--- a/meta/classes-global/sstate.bbclass<br>
+++ b/meta/classes-global/sstate.bbclass<br>
@@ -925,6 +925,8 @@ sstate_unpack_package () {<br>
=C2=A0BB_HASHCHECK_FUNCTION =3D &quot;sstate_checkhashes&quot;<br>
<br>
=C2=A0def sstate_checkhashes(sq_data, d, siginfo=3DFalse, currentcount=3D0,=
 summary=3DTrue, **kwargs):<br>
+=C2=A0 =C2=A0 import itertools<br>
+<br>
=C2=A0 =C2=A0 =C2=A0found =3D set()<br>
=C2=A0 =C2=A0 =C2=A0missed =3D set()<br>
<br>
@@ -1019,7 +1021,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse, c=
urrentcount=3D0, summary=3DTrue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0connection_cache_pool.put(c=
onnection_cache)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if progress:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.event.fire(bb.e=
vent.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.event.fire(bb.e=
vent.ProcessProgress(msg, next(num_tasks_done) + 1), d)</blockquote><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tasklist =3D []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for tid in missed:<br>
@@ -1029,6 +1031,8 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse, c=
urrentcount=3D0, summary=3DTrue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if tasklist:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nproc =3D min(int(d.getVar(=
&quot;BB_NUMBER_THREADS&quot;)), len(tasklist))<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ## thread-safe counter<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_tasks_done =3D itertools.cou=
nt()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0progress =3D len(tasklist) =
&gt;=3D 100<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if progress:<br></blockquot=
e><div><br></div><div>Can the=C2=A0num_tasks_done be moved to there and cal=
l the first next(num_tasks_done) so we can remove the=C2=A0+1 on the Proces=
sProgress</div><div><br>Jose<br>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D &quot=
;Checking sstate mirror object availability&quot;<br>
-- <br>
2.38.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#173383): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/173383" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/173383</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95064126/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95064126/5052612</a><br>
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

--000000000000c322e905ed983ddf--

