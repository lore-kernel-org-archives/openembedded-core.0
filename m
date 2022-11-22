Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82075C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 10:46:39 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.15910.1669113994358428330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 02:46:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jZ/7qxOn;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id f13so1447251lfa.6
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 02:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mU3nnL2Rjp57VweWZjGKTDkd+9xC9X5/unHySxre0E8=;
        b=jZ/7qxOnkdIHQbJ3+Lrk6cyo1Dk+8MUg7kdvF5Fxp529FEH2mniguHdqWLobp0pyxE
         NZWBrPekn1qm7u90/+VGiCXSH1vsZFYnsyjjvVQLAb2M3m0XH8+X3QM+4xZfPkHPR5La
         tWA5UWVObzfuLuhHG7DRYvTfRXBg2sNmlq8GbrROm/I1cv1z019AuX14ZPFl2GgMtjE/
         Dy3cuIbI2JTROSyqbOpBVcxJNH7Z0MWL62uotLLG1ie68K7f/5qEZXFF4SXcFA5ude7i
         u1D6M/+ylqANF/2gybVNGxX9AFi0Z4cRMLXusHPGYkP48Mmsoc1pCztGUZXkm7edbZaA
         +v1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mU3nnL2Rjp57VweWZjGKTDkd+9xC9X5/unHySxre0E8=;
        b=NOSn2pObqIPji0ceY3dkPYelHHDQ3SC0LPyjQe734XtGL/FZ0rBGwz2I5qMpmZ39n7
         /cFHlXIOHjnAgJmxDaxdCtwNGxSiEuw8kvWxNiIzBzWpRtuclRMCPlAo/YVYdt6DtmWW
         EQxC59PL7VOxdRTFnDEYB+U0G2k2gMzDQ7BbYHofC9d+QZN13hKh0l29DUOvodEvFjGA
         aPb/oK39kxQFTdImWGvQjWloRLAVw/5Q6mlOH82Y4zxubs5k/4Rvbhy7Z0+kzOy1plIK
         jcPNS0dbhuaMvTc/hV1WLeb0MgfVemhU0w9rDvwmUsiVKukCVN289S9egCz2AqTZ8cv1
         MkgQ==
X-Gm-Message-State: ANoB5plVyav+fdqZWbuvphAlsGFjW4/sHgvJzFnLf0yIv26VwrmjmfQM
	CG56p3hk3WWqdxtz7H51cQel3Nn8rG1l6lGagsw=
X-Google-Smtp-Source: AA0mqf6rlsf7SsL9iNA6lhrMMxxhcB/5pWwIvopfiwjVVabq+xn1Ao8i3h8PedhSLgKHPCXVbuppFhLFnYhljrQ2YIc=
X-Received: by 2002:a19:6458:0:b0:4b1:d925:da5b with SMTP id
 b24-20020a196458000000b004b1d925da5bmr7358146lfj.149.1669113991477; Tue, 22
 Nov 2022 02:46:31 -0800 (PST)
MIME-Version: 1.0
References: <20221116112425.2173010-1-enrico.scholz@sigma-chemnitz.de>
 <CANPvuR=SJ35jquRnLYmkBaZ=YjX-sVp9QLQGSMmU9qE996ei4g@mail.gmail.com> <lya64phkgk.fsf@ensc-pc.intern.sigma-chemnitz.de>
In-Reply-To: <lya64phkgk.fsf@ensc-pc.intern.sigma-chemnitz.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 22 Nov 2022 10:46:11 +0000
Message-ID: <CANPvuRmW1a=EQ93KRd9UHVgj3Ji0kDB7=wmcMEz3m0c8YY3vBA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate: show progress bar again
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008d404605ee0ce2b8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 10:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173674

--0000000000008d404605ee0ce2b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Enrico Scholz <enrico.scholz@sigma-chemnitz.de> escreveu no dia quinta,
17/11/2022 =C3=A0(s) 11:47:

> Jose Quaresma <quaresma.jose@gmail.com> writes:
>
> >> Transition to ThreadPoolExecutor
> (eb6a6820928472ef194b963b606454e731f9486f)
> >> broke he
> >>
> >> | Checking sstate mirror object availability: ...
> >>
> >> progress bar because the removed 'thread_worker' was still referenced
> >> in an asynchronous function.  As the result of the future is never
> >> read, the resulting backtrace is silently discarded.
> >
> > I have tested the patch at the time and the progress bar works as
> expected,
> > maybe something breaks after that.
>
> Probably, you saw only the full 100% bar produced by
> 'bb.event.ProcessFinished'
>
> But the patch does
>
> | -        def checkstatus(thread_worker, arg):
> | +        def checkstatus(arg):
> |  ...
> |                  bb.event.fire(bb.event.ProcessProgress(msg,
> len(tasklist) - thread_worker.tasks.qsize()), d)
>
> This will always raise an exception and 'bb.event.ProcessProgress' will
> never be fired.
>

I got where the problem came from, this patch serie has been tested on the
autobuilder for quite some time
and had several interactions so in one of them the patch [1] has been
dropped.
[1] https://lists.openembedded.org/g/openembedded-core/message/164564

Anyway your solution is much simpler than mine.

Best regards,
Jose


>
> > Can the num_tasks_done be moved to there and call the first
> > next(num_tasks_done) so we can remove the +1 on the ProcessProgress
>
> I will send a v2
>
>
>
> Enrico
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000008d404605ee0ce2b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">Enrico Scholz &lt;<a href=3D"mailto:enrico.scholz=
@sigma-chemnitz.de">enrico.scholz@sigma-chemnitz.de</a>&gt; escreveu no dia=
 quinta, 17/11/2022 =C3=A0(s) 11:47:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmai=
l.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; writes:<br>
<br>
&gt;&gt; Transition to ThreadPoolExecutor (eb6a6820928472ef194b963b606454e7=
31f9486f)<br>
&gt;&gt; broke he<br>
&gt;&gt;<br>
&gt;&gt; | Checking sstate mirror object availability: ...<br>
&gt;&gt;<br>
&gt;&gt; progress bar because the removed &#39;thread_worker&#39; was still=
 referenced<br>
&gt;&gt; in an asynchronous function.=C2=A0 As the result of the future is =
never<br>
&gt;&gt; read, the resulting backtrace is silently discarded.<br>
&gt;<br>
&gt; I have tested the patch at the time and the progress bar works as expe=
cted,<br>
&gt; maybe something breaks after that.<br>
<br>
Probably, you saw only the full 100% bar produced by<br>
&#39;bb.event.ProcessFinished&#39;<br>
<br>
But the patch does<br>
<br>
| -=C2=A0 =C2=A0 =C2=A0 =C2=A0 def checkstatus(thread_worker, arg):<br>
| +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def checkstatus(arg):<br>
|=C2=A0 ...<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.event.fi=
re(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize(=
)), d)<br>
<br>
This will always raise an exception and &#39;bb.event.ProcessProgress&#39; =
will<br>
never be fired.<br></blockquote><div><br></div><div>I got where=C2=A0the pr=
oblem came=C2=A0from, this patch serie has been tested on the autobuilder f=
or quite some time=C2=A0<br>and had several interactions so in one of them =
the patch [1] has been dropped.<br>[1] <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/164564">https://lists.openembedded.org/g/=
openembedded-core/message/164564</a><br><br>Anyway your solution is much si=
mpler than=C2=A0mine.</div><div><br></div><div>Best regards,</div><div>Jose=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; Can the num_tasks_done be moved to there and call the first<br>
&gt; next(num_tasks_done) so we can remove the +1 on the ProcessProgress<br=
>
<br>
I will send a v2<br>
<br>
<br>
<br>
Enrico<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000008d404605ee0ce2b8--

