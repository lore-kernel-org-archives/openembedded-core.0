Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
 by mx.groups.io with SMTP id smtpd.web10.22967.1592240062303256386
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 09:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mrA6HH+g;
 spf=pass (domain: gmail.com, ip: 209.85.222.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f66.google.com with SMTP id b13so5914326uav.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 09:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+i0j3U2d04MAeE9/qZZqR8jKdHucI4qLkwzo+TWbAmo=;
        b=mrA6HH+gt5QD5m39P+wBFXwzqEqR39nB0e0i2MAAYHy6RelsO1XX4OwSjCaGrDiuNP
         8XvfSXBP9spDWUWuRb+jfm+hsB7I0MqDsoaOl7o9Fs7zWP+Kf7pgNKrqGvQPaDA8z0mb
         fPcX89xrTUqXZwsbh6ZJFI6sbvF0tnSvKzMwUbncLhB4JlwlEDDIyYDuV+wGEQU+n0V9
         dGeIrdACVpo61DCOFFgdEeJG9Bir/8ka04T7t0l8KGDP6SvbL1IVEAHf2h3cjUQ2tByx
         764iCNqobM/ZLYNnpENPCCfj0EHD0+SaDlDXoUgNkH0Pl5ka8d9BQM9MbwFNYE4lAiTx
         ouhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+i0j3U2d04MAeE9/qZZqR8jKdHucI4qLkwzo+TWbAmo=;
        b=kVJqQ0yfbQkExrRpZE4Jq/fd5m9QXXdn7Zu7taOvXV+nrxI/jEA6d3FRhSwwFr0TZY
         0MQDvvUW79w+HbfQlWXRu6Ne/WX1J3CQ/GDdkwp6fXvS3L3DAl2A0sFn2IDSGcpDTTpI
         KNeRerBFsCkZZyrMAH1DUNU7EE+a0NaQUinfHrSPnmcuR2qD5Ejdil4Rx0fJdl2wqYwj
         kWuljTBEYwmhxsEu3voF44BZHw3njC8TCSE3qaP+b9C/SYIYpJuuIb50p+SFCAcr8uc9
         P0cLQzYV9XdXlvJ/7sa/aW2hok0Hq1uk3t62DJz/y884lDfV4yVNJ7rF2OK6YXHxLy1s
         KCNg==
X-Gm-Message-State: AOAM530KdDVJFhZdxkauKAmMQToOI2SLlIEZKrS1DVsBM5nrPr54zE2u
	DhJGOHTsJUP+luPlH2AKelldX8ceUh+HYMiTXvY=
X-Google-Smtp-Source: ABdhPJzpZqWCKS5zH9/CqaRkNFp23WLhjKLGEtaf7ecBZGj3JeBUKRpdGBdomTtm9+7Pj9zUoAsu79CEKhhyS9ICXvk=
X-Received: by 2002:a9f:326a:: with SMTP id y39mr18695560uad.93.1592240060004;
 Mon, 15 Jun 2020 09:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <AM7PR05MB68814488723D88530BBC17E2A89E0@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <8c4f219514c2d9ca3d29b3f452dfb00df65109aa.camel@linuxfoundation.org> <1618C532747F3046.29686@lists.openembedded.org>
In-Reply-To: <1618C532747F3046.29686@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 15 Jun 2020 18:54:08 +0200
Message-ID: <CANNYZj9Q_cWv4L1ssOFLVDm1TdY20ZSu2B2V0zjLpYnAAJTeVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime: Add OERequirePackage decorator
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002c7dec05a822477e"

--0000000000002c7dec05a822477e
Content-Type: text/plain; charset="UTF-8"

Come to think of it, maybe it's okay in this situation to actually remove
OEHasPackage - the test will simply always run, and will still fail if the
package is absent, but the failure would be less specific than a missing
package.

Alex

On Mon, 15 Jun 2020 at 18:41, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> On Mon, 15 Jun 2020 at 16:02, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> I can see the use case, I'm a bit torn on whether we should fail in
>> these cases, or whether we should enourage people to check the tests
>> they expected to run really did.
>>
>> With the complexity on the autobuilder we've had to rely on the latter,
>> comparing that all tests that ran previously, still run.
>>
>
> Do we have some kind of tooling to check that tests that are expected to
> run, did run, and were not skipped?
> This patch came from our internal situation where due to debian renaming,
> @OEHasPackage started skipping tests
> that it should not have. It wasn't immediately noticed - test logs are
> hidden inside the build logs, and the build logs are not
> usually looked at if the overall build does not fail.
>
> People were very baffled by that, and it took 'yocto experts' (Konrad :)
> to sort the issue.
>
> Alex
> 
>

--0000000000002c7dec05a822477e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Come to think of it, maybe it&#39;s okay in this situ=
ation to actually remove OEHasPackage - the test will simply always run, an=
d will still fail if the package is absent, but the failure would be less s=
pecific than a missing package.<br></div><div><br></div><div>Alex<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Mon, 15 Jun 2020 at 18:41, Alexander Kanavin via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D=
"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div dir=3D"ltr">On Mon, 15 Jun 2020 at 16:02, Richard Purd=
ie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_bla=
nk">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I can s=
ee the use case, I&#39;m a bit torn on whether we should fail in<br>
these cases, or whether we should enourage people to check the tests<br>
they expected to run really did.<br>
<br>
With the complexity on the autobuilder we&#39;ve had to rely on the latter=
,<br>
comparing that all tests that ran previously, still run.<br></blockquote><=
div><br></div><div>Do we have some kind of tooling to check that tests that=
 are expected to run, did run, and were not skipped? <br></div><div>This pa=
tch came from our internal situation where due to debian renaming, @OEHasPa=
ckage started skipping tests</div><div>that it should not have. It wasn&#39=
;t immediately noticed - test logs are hidden inside the build logs, and th=
e build logs are not</div><div>usually looked at if the overall build does =
not fail.</div><div><br></div><div>People were very baffled by that, and it=
 took &#39;yocto experts&#39; (Konrad :) to sort the issue.<br></div><div><=
br></div><div>Alex<br></div></div></div>
<br>
</blockquote></div>

--0000000000002c7dec05a822477e--
