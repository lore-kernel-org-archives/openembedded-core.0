Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B776C77B70
	for <webhook@archiver.kernel.org>; Sun,  9 Apr 2023 15:05:14 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.21356.1681052708454074397
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Apr 2023 08:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DNVuvqR/;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id y7so15221652ljp.2
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Apr 2023 08:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681052706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=30PR1cnm1Aj3+q1F4y9toAQL8kTCcpRZbscVz14/SEs=;
        b=DNVuvqR/fuwJ6Vd8vg47xcyYFo1AJfW5vxxpnvtCOoF3hoECAcCqQtzCBkpPvBYuRZ
         8nAjmRUiekF5RN2e6yUI/Jdytsq1GOcvY6IbrCOWlFX+zi+tMpFu4ZzUvxLs+XEdj5Ha
         fZGVXbpleTcl4QtpE6Nb3UTQ5uQB2pMLxAa/8NH7uvKQ4D8bJ5nPf9U6XllZjKrJXnWo
         iEcTM30oFapZ9FGuiJGudTm/JztqXGVfI6OqBsPMNAMY9SOrxdtniqJw4h3+2RtPISHP
         ITkbK18m/gF5/QegjCC1gSVtyPKdcgLeB1zjPlqnZH/3uP255zhX7Q7b5UGxF4HLJ9UY
         st5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681052706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30PR1cnm1Aj3+q1F4y9toAQL8kTCcpRZbscVz14/SEs=;
        b=WNKET3mLuL9ykExTJcEH/zyTpVk61cgRV2kXQtmiefONvlxfzmbCWxNK7YCCL1mLir
         WZwxxCz6C6b8qvAFqhqL6pr5XrCEk9XQAo2m/gTzsZRJJYKcRPmgAeW5INL3Uz3E4VSi
         0p7kJlMGjy7i0PxqQA2h2Eo80rvK4Mghcn2fwxB0799IntbI9gdxCjkI8qrDZo8VszBP
         9OJs7cpadNrrv77JeoDBYMSDpyOpQFkcJxTsDNcw8Dqlrx0zZSrdZSqC0MTNWhe5g8hJ
         XQvQJNnQa3YFWvauJ5rxyvjRzLDgj9gt0DATReVwqNksSbeFpZahgJJU7sUkyhHt+PhY
         e1gw==
X-Gm-Message-State: AAQBX9e33E5eVhSsevaHvP+OHfFZXIzyer4+HOCoMk8b1MZI/GBcgYQm
	NTHp/bN4muGqsxMhhOZQcT9GwkrjUENbXY4Bnkc=
X-Google-Smtp-Source: AKy350bq8j1ZyK3kInTlFFFEnRPZ+8t9QnhdCvSCMUpQPAHhhI6r//QofAPXzJxp0VRHivdvZwS6b4AolMTjIb6CqxE=
X-Received: by 2002:a05:651c:103c:b0:2a6:16b4:a554 with SMTP id
 w28-20020a05651c103c00b002a616b4a554mr2064737ljm.3.1681052705903; Sun, 09 Apr
 2023 08:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <1753B0402875C548.11304@lists.openembedded.org>
 <CA+cAkerWUvabx_kzN2s6S64454t88ifOR+nqtaLwk0wHfw3n2Q@mail.gmail.com> <6381549a7f058cb233c656dca9324ae4d7a435c2.camel@linuxfoundation.org>
In-Reply-To: <6381549a7f058cb233c656dca9324ae4d7a435c2.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Sun, 9 Apr 2023 17:04:54 +0200
Message-ID: <CA+cAkerd92jAqwA1iDrNOV+W1mK5Tb39yvT_Dp-t18=LCNm09w@mail.gmail.com>
Subject: Re: [OE-core] Reproducible build
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006259cd05f8e895ab"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Apr 2023 15:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179841

--0000000000006259cd05f8e895ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 9 avr. 2023, 10:43, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Sat, 2023-04-08 at 09:56 +0200, Frederic Martinsons wrote:
> > Forget my previous question,
> >
> > I simply
> > edit https://git.openembedded.org/openembedded-core/tree/meta/lib/oeq
> > a/selftest/cases/reproducible.py#n137
> > to replace by zavariant, and with OEQA_DEBUGGING_SAVED_OUTPUT set , I
> > managed to see the html diff
> >
> > Nevertheless, It took one hour, but it seems that it cannot be
> > avoided since there are two builds and one
> > without any shared state.
>
> Unfortunately that is the nature of the test, one side has to be built
> from scratch. Tweaking the test as you'd done to target a specific
> component is what I'd have done too to speed things up for a specific
> recipe.
>
> To get a further speedup, you could probably keep the sstate for each
> of the two builds separate but retain both, then in theory on the
> pieces you change would rebuild. Again, it would mean tweaking the test
> but for debugging, I think that is fine. Rust can be a pain if you just
> rebuild those as it still takes a while. Thanks for taking a look!
>
> Cheers,
>
> Richard
>
>
Thank you for the tip, I'll try that, everything that help to speed up is
good to take of course.

--0000000000006259cd05f8e895ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le dim. 9 avr. 2023, 10:43, Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
On Sat, 2023-04-08 at 09:56 +0200, Frederic Martinsons wrote:<br>
&gt; Forget my previous question,=C2=A0<br>
&gt; <br>
&gt; I simply<br>
&gt; edit=C2=A0<a href=3D"https://git.openembedded.org/openembedded-core/tr=
ee/meta/lib/oeq" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gi=
t.openembedded.org/openembedded-core/tree/meta/lib/oeq</a><br>
&gt; a/selftest/cases/reproducible.py#n137<br>
&gt; to replace by zavariant, and with=C2=A0OEQA_DEBUGGING_SAVED_OUTPUT set=
 , I<br>
&gt; managed to see the html diff<br>
&gt; <br>
&gt; Nevertheless, It took one hour, but it seems that it cannot be<br>
&gt; avoided since there are two builds and one<br>
&gt; without any shared state.<br>
<br>
Unfortunately that is the nature of the test, one side has to be built<br>
from scratch. Tweaking the test as you&#39;d done to target a specific<br>
component is what I&#39;d have done too to speed things up for a specific<b=
r>
recipe.<br>
<br>
To get a further speedup, you could probably keep the sstate for each<br>
of the two builds separate but retain both, then in theory on the<br>
pieces you change would rebuild. Again, it would mean tweaking the test<br>
but for debugging, I think that is fine. Rust can be a pain if you just<br>
rebuild those as it still takes a while. Thanks for taking a look!<br>
<br>
Cheers,<br>
<br>
Richard<br><br></blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Thank you for the tip, I&#39;ll try that, everything that help t=
o speed up is good to take of course.=C2=A0</div><div dir=3D"auto"></div></=
div>

--0000000000006259cd05f8e895ab--

