Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A94C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:46:30 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.1212.1693417587666770912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dcDwTa3K;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-31c8321c48fso754083f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693417586; x=1694022386; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nn+5O1BufdLUp6I0hC5NoHpCAgC813Xm9LCk2eS0qD8=;
        b=dcDwTa3KppKRRMpVL8w0dAwRx4Rc+bgApdEu1qaraPoKMiR0jd2Ka30p76SGGuDtR+
         ssAXDnl3vqTAE/7e27xUVkWHrT3MQSLkj/auaZ/wlnTGK1ilwYq0uG3x+VPZq5MvIAVF
         UOOyYZmdET7QdSX3z4daenc4fXwxali3i+pDJuad+Uce30st3sJbN9O5cSnIbOGj9+6O
         zKL4bdovxA1Jx9SYQwOnpKcEWG5EhgqIReC2JWebD8nARjKJ4TBOxwz5nkZJA6GldMgH
         Fzht/0TMyHncrnoCOf7MWxGKlmk1+XDxdgstaH5hNKh6kXZxnuzEqnSFWOLRkM8Qldpq
         jU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417586; x=1694022386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nn+5O1BufdLUp6I0hC5NoHpCAgC813Xm9LCk2eS0qD8=;
        b=KcJGOtQoRi5Dj4Ip80oJDUWBJ+ifMiiXLl3oxt0beFBWmQh9ajYghir4K/pLX8uY8k
         3jZcsgaMx0wwFepsKxseFX1bIU8viteC18LdFxlfDKOSZoPxxYpfGATXlfWdqQxwWj/5
         A4rmBym4OD7EyDujvzdBJZuuJdlgwM6ez/geM8KnEIlR5nvx9okJCyNHCQ7OAGijhByA
         IE/cNcpYAIIwHShCxy182cKgbHO6IZ8nu2AJzgrH6LEOltso4Q80zK8GCwl/jgJ8vcHh
         OHqfr9fAyIKu2C2BC3uU3erdn2VT+PLnnJi43/Lud36WJwYUD+MlAXJXpOx4LM1Yju7g
         8oqQ==
X-Gm-Message-State: AOJu0YxsZ0j0L4CI3nOn/6Mg54ee0JrbSPsnA+kMPUtWHhr7GN1KIOXc
	iKWk93hTKGYxCUJQznLZ1Dnac8aW983umGe+9Z4=
X-Google-Smtp-Source: AGHT+IFiCGSKK3B5ZkAaT6zuMuL6B5hq1goRwce09XrtmzKDxL0qLUUHIQ+dUgJDVKEhUQ/0GlDZl852Th9S/LLTM9A=
X-Received: by 2002:adf:f10e:0:b0:31a:cca0:2f3a with SMTP id
 r14-20020adff10e000000b0031acca02f3amr328253wro.0.1693417585923; Wed, 30 Aug
 2023 10:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230830083430.871652-1-Martin.Jansa@gmail.com> <CAOSpxdZgrH78pZ4dvY1D=mv6r2+5toT-M5=cDTz9E=iG-1DOoQ@mail.gmail.com>
In-Reply-To: <CAOSpxdZgrH78pZ4dvY1D=mv6r2+5toT-M5=cDTz9E=iG-1DOoQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Aug 2023 19:46:02 +0200
Message-ID: <CA+chaQfQpviuk_K6DsKKZnRyHuZN12+NFr6Ge0FeXuPKgE6s6g@mail.gmail.com>
Subject: Re: [kirkstone][PATCH] libdnf: backport a fix to build with gcc-13
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000aa5bb50604278122"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186901

--000000000000aa5bb50604278122
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 5:59=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:

> I took a patch submitted yesterday for this same issue:
>
> https://lists.openembedded.org/g/openembedded-core/message/186814
>
> It contains three patches from upstream, rather than the two in your
> submission.
>
> Could you please take a look and see if there is an issue with keeping
> yesterday's submission?
>

Yes, this version is fine as well. I just didn't notice it existed before
creating my own.

That's what I get for allowing wife to take me with her to week log
vacation to place where it's even warmer than here so I wasn't watching MLs
for couple days :).

Cheers,

--000000000000aa5bb50604278122
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Aug 30, 2023 at 5:59=E2=80=AFPM S=
teve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>=
&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">I took a patch submitted yesterday for this same iss=
ue:<br>
<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/18681=
4" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/186814</a><br>
<br>
It contains three patches from upstream, rather than the two in your submis=
sion.<br>
<br>
Could you please take a look and see if there is an issue with keeping<br>
yesterday&#39;s submission?<br></blockquote><div><br></div><div>Yes, this v=
ersion is fine as well. I just didn&#39;t notice it existed before creating=
 my own.</div><div><br></div><div>That&#39;s what I get for allowing wife t=
o take me with her to week log vacation to place where it&#39;s even warmer=
 than here so I wasn&#39;t watching MLs for couple days :).</div><div><br><=
/div><div>Cheers,</div></div></div>

--000000000000aa5bb50604278122--

