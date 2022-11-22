Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E36C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 10:52:09 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.15990.1669114319159465223
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 02:51:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J/lwsj5t;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id s8so22977105lfc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 02:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n8fMPL2/e8EfT94wp9AqNIslDXGZyX8fEoVe5AoBkyQ=;
        b=J/lwsj5tZQSooErWk4Oq4ZVK4hR+A4UmEHwhmqOlqcYADR1tcEkM7UkcWtx2tP2bg9
         b5AZyvQp0+1nRlVphm6JWuHZIUc6eR3Oz+rX82TlkT3wXVWp4pXP91QWn5leatgLkfzH
         SS5bzDV1uVTZF5Xe5Vzdfusv48KoBwNER3Lz9UFCtWp9t2Kc2zy6sG/WAJ7RlNb3TpnE
         cF7Sh+xsaa6Yh/yNBYbdRsTlxbczyhzGU5lA0nX8TdG18iuiyIDBeWbaZNN1l2bmGkQo
         rwpYBea0+rz6YjeM5ZNutbJyidPR4ajj2vqhr8WcwHTHvnx6s/oN3/tdNWZAlRmxo7X3
         EO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8fMPL2/e8EfT94wp9AqNIslDXGZyX8fEoVe5AoBkyQ=;
        b=F67xXtorjNsXlG1IPEhy5LJzt4NAw+KTj2zp3zZFUmM73wj3sWYNgmXs6ZSe86gx8I
         9h5wxq4QKxXCidoFCv55rGtF79vF+4zRUCYTl2RnfTDnrAp7lPrwmUPblR5ysS/fNvW6
         FGTeXqrQNlLG0ctYrQvDaXpcHOwdsUJILrX2ecuf7nhzSjkB/55ut1BcMF1xAT6c48zo
         xz8ORtMYHgWzw0E1ng9Dnbt0eAcgbadKpi+yj/GEjxm28MP8OiGLcEeGSK+5RcsbsYsx
         xMKR1jfzDewdMNZH8+rcmPKB409dpvpbRJM90wwP6KxnxXA3vLmAKO5Vc4xqiPPbDFZq
         XJWw==
X-Gm-Message-State: ANoB5pnLeY5uM9okFmltQR/7//Li4mvZh1I3ZxQPQ9E5gTTkQE/Lk71c
	fEg8hS1+kjCiZl0c3xaUt1UHbSyHC6iikEYnTTo=
X-Google-Smtp-Source: AA0mqf5V90Ige/ryMH+y/ivxyD9YAQXkLW1TSxfdAQrbKTrVEJ9ofpkNd95BCnQ9mY9fAUwPIQRfNeA5vveKI+HhZss=
X-Received: by 2002:a19:6458:0:b0:4b1:d925:da5b with SMTP id
 b24-20020a196458000000b004b1d925da5bmr7364023lfj.149.1669114317243; Tue, 22
 Nov 2022 02:51:57 -0800 (PST)
MIME-Version: 1.0
References: <20221116112425.2173010-1-enrico.scholz@sigma-chemnitz.de> <20221119103925.767617-1-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <20221119103925.767617-1-enrico.scholz@sigma-chemnitz.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 22 Nov 2022 10:51:37 +0000
Message-ID: <CANPvuRkV_jmEgBq+3eDUFMXCvpe-xyL1vMb8p8sGspCXU-4+EA@mail.gmail.com>
Subject: Re: [PATCH v2] sstate: show progress bar again
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f80c6005ee0cf525"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 10:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173675

--000000000000f80c6005ee0cf525
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Enrico,

My last suggestion on this patch is that we can use the existing progress
variable to store the counter,
when the progress is 0 nothing is changed when not 0 they have the counter
on it.

Enrico Scholz <enrico.scholz@sigma-chemnitz.de> escreveu no dia s=C3=A1bado=
,
19/11/2022 =C3=A0(s) 10:39:

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
> Replace the information given to 'ProcessProgress' by a counter.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  meta/classes-global/sstate.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/sstate.bbclass
> b/meta/classes-global/sstate.bbclass
> index 2c8e7b8cc232..f5e0e623e28d 100644
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
> next(cnt_tasks_done)), d)
>

+ bb.event.fire(bb.event.ProcessProgress(msg, next(progress)), d)


>
>          tasklist =3D []
>          for tid in missed:
> @@ -1029,6 +1031,8 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,
> currentcount=3D0, summary=3DTrue,
>          if tasklist:
>              nproc =3D min(int(d.getVar("BB_NUMBER_THREADS")), len(taskli=
st))
>
> +            ## thread-safe counter
> +            cnt_tasks_done =3D itertools.count(start =3D 1)
>              progress =3D len(tasklist) >=3D 100
>              if progress:
>

+ ## thread-safe counter
+ progress =3D itertools.count(start =3D 1)

Jose

                 msg =3D "Checking sstate mirror object availability"
> --
> 2.38.1
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000f80c6005ee0cf525
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Enrico,<div><br></div><div>My las=
t suggestion=C2=A0on this patch is that we can use the existing progress va=
riable to store the counter,</div><div>when the progress is 0 nothing is ch=
anged when not 0 they have the counter on it.</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Enrico Scholz &lt;<a hre=
f=3D"mailto:enrico.scholz@sigma-chemnitz.de">enrico.scholz@sigma-chemnitz.d=
e</a>&gt; escreveu no dia s=C3=A1bado, 19/11/2022 =C3=A0(s) 10:39:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">From: Enrico Scholz &lt;=
<a href=3D"mailto:enrico.scholz@sigma-chemnitz.de" target=3D"_blank">enrico=
.scholz@sigma-chemnitz.de</a>&gt;<br>
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
read, the resulting backtrace is silently discarded.<br>
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
index 2c8e7b8cc232..f5e0e623e28d 100644<br>
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
vent.ProcessProgress(msg, next(cnt_tasks_done)), d)<br></blockquote><div><b=
r>+ bb.event.fire(bb.event.ProcessProgress(msg, next(progress)), d)</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cnt_tasks_done =3D itertools.cou=
nt(start =3D 1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0progress =3D len(tasklist) =
&gt;=3D 100<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if progress:<br></blockquot=
e><div><br>+ ## thread-safe counter<br></div><div>+ progress =3D itertools.=
count(start =3D 1)<br></div><div><br>Jose</div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D &quot=
;Checking sstate mirror object availability&quot;<br>
-- <br>
2.38.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000f80c6005ee0cf525--

