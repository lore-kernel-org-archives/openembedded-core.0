Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web10.277.1587499914657779783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 13:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r3qzgFH7;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id s11so1120vsq.13
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2020 13:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vW8EWAsv6SP6/h34jsJMCVASuSNA3xaNnC28reDyt04=;
        b=r3qzgFH77lMvvppxKkzirqLB3i2dej8esDqMZ+FZAez7fKzucFDwe0XjxxYHH+uM9B
         v8MwFxUmFya7atiZHL38ozDk5HfS078iGANn93dKO6rdK2jjjANrf2G5nF9fonuFJJBw
         f0XDtDeE2Z7A/5NeAyoa/g/xSxtjmrUGPO4wG4giMM1ocWQKyjUuXiRSw/rX3X0IYLZR
         xGWQ4rahxVh9KKCCYReSCPay9cC6RU0Bc4/oyaU38K6TBcyHiKF2WYIOF43bdyz7o0gZ
         O1KTSTGq8OATuU9lo46QN9y1kG1Y/JJbLwiarOo7Ib0b8+Abcb2KY1WkNkurpsFm6oMC
         GPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vW8EWAsv6SP6/h34jsJMCVASuSNA3xaNnC28reDyt04=;
        b=JmFt4gxHJYFbDpX1H7fXfRjPhuoWA9PE47B0DlHodJ71fWTt6N9oIIrVRV2UL6EQ7D
         00Fi6JW15g/cRTTY46kgDzFrzZfod1ntd+0WSXbu84Scrf3C1zXNj5xTUYfhw+AS57vA
         3ZSlOGTfra4KuR11hXq4RthhN5uKK8dLKrS4WtdJjdS0Y6C0zoMSXQWNpjlyf1KQTVGO
         3ZZ0ZQgqRnNaQnvkeObcbyhpKrtsfAPYNvD4vuwrj6lXZin3MCuPbVqO8fDRLCZD5m2e
         gomYK8O2UCwlZbb9ASyW11xuqYwNkpKTHaLu3wDa62J+hlkz4fDlAngIbwtC9EWo7yar
         GOxw==
X-Gm-Message-State: AGi0PubUorb3x61B+L689l8NunoxVkHQV0OB6GslTI2ayol41U81TABT
	TXvAHgQAZ8YnFADvjzhyqWz94rP1QeNvARitHSY=
X-Google-Smtp-Source: APiQypIKdv9Pe3uj8mjYuKJWCvpf8mgPAOYF9w0LmBh/ZNliSY/h8VPgGJJT+QRz9nVuKUIxXht5rQsYRebQT7OaLJE=
X-Received: by 2002:a67:6889:: with SMTP id d131mr13265240vsc.25.1587499913665;
 Tue, 21 Apr 2020 13:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj_PYZSmYSdYUytQOYHJw+P=1M26nfzy7crQ0-X3MRvfRg@mail.gmail.com>
 <21679.1587497486653997697@lists.openembedded.org>
In-Reply-To: <21679.1587497486653997697@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 21 Apr 2020 22:11:42 +0200
Message-ID: <CANNYZj8cZfkNROS5jp2tP+Hbpw9uU4Oefc2vXSBRWqauZ_V5aQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] boost: revert 1.72.0 regression
To: Andrew Geissler <geissonator@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006f602105a3d2a08f"

--0000000000006f602105a3d2a08f
Content-Type: text/plain; charset="UTF-8"

You need to sign-off the patch as yourself. Upstream-Status: should be
Backport [link to github commit]

Alex

On Tue, 21 Apr 2020 at 21:31, Andrew Geissler <geissonator@gmail.com> wrote:

> The patch needs an Upstream-Status. Is it a backport (then the link to
> repo needs to be provided)?
>
> Thanks for the quick review Alexander. My understanding is that boost
> released 1.72.0 and then found this regression so they provide a link to
> this patch on their 1.72.0 release page.
>
> Here's a link to the upstream revert commit:
>
> https://github.com/boostorg/coroutine/commit/9c73b2f7c1759a9508ba8780b38dc15f07f1a447
>
> I saw an automated response from patchwork asking for a Signed-off-by tag
> for the patch but since the upstream commit does not have it, not sure what
> to do? 
>

--0000000000006f602105a3d2a08f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You need to sign-off the patch as yourself. Upstream-=
Status: should be Backport [link to github commit]</div><div><br></div><div=
>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, 21 Apr 2020 at 21:31, Andrew Geissler &lt;<a href=
=3D"mailto:geissonator@gmail.com">geissonator@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><blockquote>The pat=
ch needs an Upstream-Status. Is it a backport (then the link to repo needs =
to be provided)?</blockquote>
Thanks for the quick review Alexander. My understanding is that boost rele=
ased 1.72.0 and then found this regression so they provide a link to this p=
atch on their 1.72.0 release page.<br><br>Here&#39;s a link to the upstream=
 revert commit:<br><a href=3D"https://github.com/boostorg/coroutine/commit/=
9c73b2f7c1759a9508ba8780b38dc15f07f1a447" target=3D"_blank">https://github.=
com/boostorg/coroutine/commit/9c73b2f7c1759a9508ba8780b38dc15f07f1a447</a><=
br><br>I saw an automated response from patchwork asking for a Signed-off-b=
y tag for the patch but since the upstream commit does not have it, not sur=
e what to do?
<br>
</blockquote></div>

--0000000000006f602105a3d2a08f--
