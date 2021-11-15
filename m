Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF1AC433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 20:20:55 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web12.36.1637007655408521141
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 12:20:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gQEfYlXI;
 spf=pass (domain: gmail.com, ip: 209.85.222.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id az37so37496317uab.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 12:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NDbadyavAiYxFoiax43fPbLzg5TB8BhBcMBV5HfXp6U=;
        b=gQEfYlXI87Rlt9b9i2ojGnyUtCHQ7wu8KUqFQp6zXJ9Mf+HUFhQzpAGElJZHL55JSS
         k6e1ouRrKFAr7mvyaSjkKXZO363QcWjPEmD1vIjqdyEImqv9nWHvNWtSapI5x8QwmAkv
         wQ211FSUGWBTSjVfuMdAklHATjh33Zf8y+9GAxLMMI+zoCka2JY1n0Jsttgo4Sa1GsKX
         AZ1DhzgwuqhDBWUqMnfauHGan1DQLemCdqwoTpp/yqQMjEecTnIGMAhoDifOqAQGxK8X
         JWKnvITqCM0MPxKoucv0Ue8GRYTNfOkTtYXzo8wyh/EIpMGnDqgeC+/E1MxQLparftU2
         tN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NDbadyavAiYxFoiax43fPbLzg5TB8BhBcMBV5HfXp6U=;
        b=F/AAa7nh9wXVFR4XLbp4NlNrG7D8l/dsYSmZfwBFjZbM/2hTYzJfzD0ZAbsr2GHOM8
         GsGU9oDUgzsi7yKAxY/BM6kF/8wqkak8+LgyEXUOZJDl+31X3cjE8SkZZmvAhnrpgBTW
         e/rtR7j3A26HVJpkETc5oqGU0YFiNeiBTH6JVFf/Rbe570Bwk/wK+XHcUIFP0yvz+Aop
         B3q1dj5viM9KBF1zVuuj7/kVBdAI/YBUGZTQrCp5s3+DGvG3coA4dEAvv1x+M6CIaMcY
         jH7z90TPOvBuU1Tqxt2KrD+/HmLQRRM7S7xBQ7bknwaWDAG/RUgMuW4qYyGQlbQcESwT
         3zEw==
X-Gm-Message-State: AOAM532gKpdGUNi/+8mGTEADjiTfLkB9MQ8FzmAMmQZRTqyxJfYa4mcD
	SLf9pH2d20DL6BuxatYTTYLQgEo3/HL/Ah/+YP4=
X-Google-Smtp-Source: 
 ABdhPJw0oD5a6R3g5lRit2z8a4F1wl45Z4VVqBXCSL8iM0gBm3xFue39esU4NPJrvpFZme0tkuxRA/mlvtAyV7kR5CI=
X-Received: by 2002:a05:6102:2c6:: with SMTP id
 h6mr47987032vsh.13.1637007654516;
 Mon, 15 Nov 2021 12:20:54 -0800 (PST)
MIME-Version: 1.0
References: <8a12d84e-fdb1-3383-ce9e-10ddc75130cf@gmail.com>
 <CANNYZj-xeJS_+3r-Lwg=Nzyr+KrtFA8hCpGj-DeDpaihzB_TQg@mail.gmail.com>
 <d897665a-3746-80f0-9771-875165d16b2b@gmail.com>
In-Reply-To: <d897665a-3746-80f0-9771-875165d16b2b@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Nov 2021 21:20:43 +0100
Message-ID: 
 <CANNYZj-UTWzhnRoxTpTn3kqp4d7FiRk0NPD_Mon0cOd6Js13UQ@mail.gmail.com>
Subject: Re: [OE-core] Suggestion to use python-parameterized for QA
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bdfb0c05d0d98bd9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 20:20:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158312

--000000000000bdfb0c05d0d98bd9
Content-Type: text/plain; charset="UTF-8"

I can't understand what is supposed to happen, perhaps because it's
incomplete? There's

@parameterized.expand([
("original", True),
("preinit", False),
])

but where is that used?

Alex

On Mon, 15 Nov 2021 at 20:53, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:

> This is still work-in-progress, but I'm working on overlayfs-etc class,
> which would have different behavior depending on an input variable. You
> can see the example here
>
>
> https://github.com/UVV-gh/openembedded-core/commit/ea424efb7780dc3c85e329b36f4a675b56e86877#diff-9980b9625344e11f15451ab7c97fb1f137e94b68fa27df737c576b75e313996aR215
>
> Regardless of the input parameter the test would be the same and should
> work.
>
> What do you think?
>
> Vyacheslav
>
> On 15.11.2021 20:38, Alexander Kanavin wrote:
> > It would be helpful to provide an example of improvements that can be
> > enabled with it.
> >
> > Alex
>
>

--000000000000bdfb0c05d0d98bd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I can&#39;t understand what is supposed to happen, pe=
rhaps because it&#39;s incomplete? There&#39;s</div><div><table class=3D"gm=
ail-diff-table gmail-js-diff-table gmail-tab-size"><tbody><tr><td class=3D"=
gmail-blob-code gmail-blob-code-addition gmail-selected-line gmail-selected=
-line-top gmail-selected-line-bottom"><span class=3D"gmail-blob-code-inner =
gmail-blob-code-marker">    <span class=3D"gmail-pl-en"><br>@<span class=3D=
"gmail-pl-s1">parameterized</span>.<span class=3D"gmail-pl-en">expand</span=
>([</span></span></td>
</tr>



    <tr>
    </tr></tbody></table>
      <table class=3D"gmail-diff-table gmail-js-diff-table gmail-tab-size">=
<tbody><tr><td class=3D"gmail-blob-code gmail-blob-code-addition">    <span=
 class=3D"gmail-blob-code-inner gmail-blob-code-marker"><span class=3D"gmai=
l-pl-en">        (<span class=3D"gmail-pl-s">&quot;original&quot;</span>, <=
span class=3D"gmail-pl-c1">True</span>),</span></span></td>
</tr>



    <tr>
    </tr></tbody></table>
      <table class=3D"gmail-diff-table gmail-js-diff-table gmail-tab-size">=
<tbody><tr><td class=3D"gmail-blob-code gmail-blob-code-addition">    <span=
 class=3D"gmail-blob-code-inner gmail-blob-code-marker"><span class=3D"gmai=
l-pl-en">        (<span class=3D"gmail-pl-s">&quot;preinit&quot;</span>, <s=
pan class=3D"gmail-pl-c1">False</span>),</span></span></td>
</tr>



    <tr>
    </tr></tbody></table>
          <span class=3D"gmail-blob-code-inner gmail-blob-code-marker"><spa=
n class=3D"gmail-pl-en">    ])</span></span></div><div><span class=3D"gmail=
-blob-code-inner gmail-blob-code-marker"><span class=3D"gmail-pl-en"><br></=
span></span></div><div><span class=3D"gmail-blob-code-inner gmail-blob-code=
-marker"><span class=3D"gmail-pl-en">but where is that used?<br></span></sp=
an></div><div><span class=3D"gmail-blob-code-inner gmail-blob-code-marker">=
<span class=3D"gmail-pl-en"><br></span></span></div><div><span class=3D"gma=
il-blob-code-inner gmail-blob-code-marker"><span class=3D"gmail-pl-en">Alex=
<br></span></span></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, 15 Nov 2021 at 20:53, Vyacheslav Yurkov &lt=
;<a href=3D"mailto:uvv.mail@gmail.com">uvv.mail@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">This is still work=
-in-progress, but I&#39;m working on overlayfs-etc class, <br>
which would have different behavior depending on an input variable. You <br=
>
can see the example here<br>
<br>
<a href=3D"https://github.com/UVV-gh/openembedded-core/commit/ea424efb7780d=
c3c85e329b36f4a675b56e86877#diff-9980b9625344e11f15451ab7c97fb1f137e94b68fa=
27df737c576b75e313996aR215" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/UVV-gh/openembedded-core/commit/ea424efb7780dc3c85e329b36f4a675b56=
e86877#diff-9980b9625344e11f15451ab7c97fb1f137e94b68fa27df737c576b75e313996=
aR215</a><br>
<br>
Regardless of the input parameter the test would be the same and should <br=
>
work.<br>
<br>
What do you think?<br>
<br>
Vyacheslav<br>
<br>
On 15.11.2021 20:38, Alexander Kanavin wrote:<br>
&gt; It would be helpful to provide an example of improvements that can be =
<br>
&gt; enabled with it.<br>
&gt;<br>
&gt; Alex<br>
<br>
</blockquote></div>

--000000000000bdfb0c05d0d98bd9--

