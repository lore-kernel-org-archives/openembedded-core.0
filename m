Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DD6EE01E8
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 16:45:51 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.1807.1694623543083239877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 09:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hPIuPOKk;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-34df008b0e7so170415ab.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694623542; x=1695228342; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zCTdoXWbcu+CgLR2UKhMcpzRhxqHPfMYUFFMyIl83bw=;
        b=hPIuPOKk0BokUVbDJfIb96VyJc8H0hJ+nVHbZadrijFnvxh5dKwOGvHn3b7sNTddCn
         jkko1QX5TqEdSEN9wt1O1B8FY4r4cq/LKfJ+LbzfU8tghjOQX8mivcZX1KPD+HmK4BL5
         fV8r86ovzEEQlZ0i7dJwlCED84oR3VANy2UBtbpBogbwqA+sUWi5gsViwdEw1vyepHw/
         Wuv8Apx9XileaAZMapyke38gZLZ8ofN8DDpsPjgWxRZS0oLoq/7RkmGBd/1Xv4DqXcsZ
         rAxhuDBXzOcdG9Z0N+ZZFISEMsYVREC3mFwsu1QWAyT+fzhWfB1NYk2BmT0QHdi5fghi
         GHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694623542; x=1695228342;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zCTdoXWbcu+CgLR2UKhMcpzRhxqHPfMYUFFMyIl83bw=;
        b=khUpYgoUK6dUc5z5GDzWyvPVOTj9G/v5tdUZvKITQKpDFHkoEinR0v9GSbrGsEKL9u
         Z0CVQD70ByXD3kAQrcWV+zgr3nDAMOOZffjxrMkznCzRLI0Ca0yHQHPoU6iETcpHSZOl
         mLiOKVQmnRVazZlwW4AnbRl3S0R1lnfj8ySelVI9ZvVFzdqpP1Y63ac46ORbofecQ9ZZ
         oyZx0+mIVW0xb1R78fI928gkDqi/fg7dBlT6cEb8a+5oZKOROioO+JYcAtYp9hv7fsAv
         GSkIR4kwnJ3+E0aHq6mU8yRi+UIzmB0ow6CQpLAal4kCjxsUBT+loIR1FiPmmJrrUCFw
         vRCw==
X-Gm-Message-State: AOJu0YxavhMnr7jfq7xXY4OxIgx+Qd11wBcP++mpzLU4WQEpGggITuN5
	DNe21dtX36zJ7JK/opnjDWLpPfc0qI+SpuoWa1fqjsB7WaY=
X-Google-Smtp-Source: AGHT+IH2B5l7+ZdF8FEiedEueXL8r+L+p27je4qVaT9viE/g4iEckTjlK0cyPRreP3ymIfgEofu5fEUUcKJCe1Uq8Xg=
X-Received: by 2002:a05:6e02:1a29:b0:34f:89bf:98f5 with SMTP id
 g9-20020a056e021a2900b0034f89bf98f5mr6153227ile.3.1694623541867; Wed, 13 Sep
 2023 09:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <openembedded/openembedded-core/commit/af38a39b4bed9e43c5075008be47ca72191a489e@github.com>
 <openembedded/openembedded-core/commit/af38a39b4bed9e43c5075008be47ca72191a489e/127208368@github.com>
In-Reply-To: <openembedded/openembedded-core/commit/af38a39b4bed9e43c5075008be47ca72191a489e/127208368@github.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 13 Sep 2023 17:45:31 +0100
Message-ID: <CAO5Uq5TsXmkBsmBgyDJEaUszCncjuFbhjYWJUX_L1BBycyyxLA@mail.gmail.com>
Subject: Re: [openembedded/openembedded-core] openssh: Move
 sshdgenkeys.service to sshd.socket (af38a39)
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003dbb850605404aa4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 16:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187612

--0000000000003dbb850605404aa4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pretty much what they commit says - you avoid the delay in initial connect
at the expense of more CPU up front.


On Wed, 13 Sept 2023, 08:21 pawanbadganchi, <notifications@github.com>
wrote:

> @akiernan <https://github.com/akiernan> What problem is this commit
> supposed to solve
>
> =E2=80=94
> Reply to this email directly, view it on GitHub
> <https://github.com/openembedded/openembedded-core/commit/af38a39b4bed9e4=
3c5075008be47ca72191a489e#commitcomment-127208368>,
> or unsubscribe
> <https://github.com/notifications/unsubscribe-auth/AAE26BQK26OZXY2B2EWNDE=
3X2FNGHANCNFSM6AAAAAA4V6H7JE>
> .
> You are receiving this because you were mentioned.Message ID:
> <openembedded/openembedded-core/commit/af38a39b4bed9e43c5075008be47ca7219=
1a489e/127208368
> @github.com>
>

--0000000000003dbb850605404aa4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Pretty much what they commit says - you avoid the de=
lay in initial connect at the expense of more CPU up front.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D=
"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 13 Sept 2023, 08:21 pa=
wanbadganchi, &lt;<a href=3D"mailto:notifications@github.com" target=3D"_bl=
ank" rel=3D"noreferrer">notifications@github.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><p></p>
<p dir=3D"auto"><a class=3D"notranslate" href=3D"https://github.com/akierna=
n" rel=3D"noreferrer noreferrer" target=3D"_blank">@akiernan</a>  What prob=
lem is this commit supposed to solve</p>

<p style=3D"font-size:small;color:#666">=E2=80=94<br>Reply to this email di=
rectly, <a href=3D"https://github.com/openembedded/openembedded-core/commit=
/af38a39b4bed9e43c5075008be47ca72191a489e#commitcomment-127208368" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">view it on GitHub</a>, or <a href=
=3D"https://github.com/notifications/unsubscribe-auth/AAE26BQK26OZXY2B2EWND=
E3X2FNGHANCNFSM6AAAAAA4V6H7JE" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">unsubscribe</a>.<br>You are receiving this because you were mentioned.<=
img src=3D"https://github.com/notifications/beacon/AAE26BR62LBT2Q5GZXQZAHLX=
2FNGHA5CNFSM6AAAAAA4V6H7JGWGG33NNVSW45C7OR4XAZNNINXW23LJORBW63LNMVXHJKTDN5W=
W2ZLOORPWSZGOA6KQXMA.gif" height=3D"1" width=3D"1" alt=3D""><span style=3D"=
color:transparent;font-size:0;display:none;overflow:hidden;opacity:0;width:=
0;height:0;max-width:0;max-height:0">Message ID: <span>&lt;openembedded/ope=
nembedded-core/commit/af38a39b4bed9e43c5075008be47ca72191a489e/127208368</s=
pan><span>@</span><span>github</span><span>.</span><span>com&gt;</span></sp=
an></p>
</blockquote></div></div></div>

--0000000000003dbb850605404aa4--

