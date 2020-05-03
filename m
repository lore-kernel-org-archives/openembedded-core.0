Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.32136.1588544180372986477
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 15:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=elMRbWSH;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id 145so4609345pfw.13;
        Sun, 03 May 2020 15:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=zdCPPodCmY3eGQV9PDOs+GiMSvLv4dDjqW+84AAYvTg=;
        b=elMRbWSH0lMBMOy7MvrXNmomX0TgxioeXcQMcMfSBAnNgNO+YJZcYjVt1GCBiYhWaI
         LLjTn4N7vhpw7NiBljvzsGp75Q1baM3SPZ9xDGQZaPAwnpF7Bpsir3fW052XanAHXD/6
         CV32vsZFeIHoTJ/ni2UzHwJURP5EyUs4/8a9cbPA42hOpeIdR2yq3/TealIQoMKZQ8fg
         2klYyvQjYZfh1OA2UDSV2DclLQi7UvmHhY6Mh0jaNsWFCqWoBRdW25YhhcN8kNImUR1w
         Er0utlTRLQrJ6kcRMwezqgbA2zWR1op710cflpE3ZwUGMazc5XSmWseQiJUgMMq8Hcft
         18zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=zdCPPodCmY3eGQV9PDOs+GiMSvLv4dDjqW+84AAYvTg=;
        b=QhdsRS03Fqff4nEoRFX9nCI4DLEpRaLWQN0Kk6sFPLtxQLZOMpIo/EJL47vfRzg/5T
         IyvDiylC6OJTSNMPu7C0hXTgOE66KPBOU5ERJsD3GH50axTJVh52q44t2R/4b8Ke6P+l
         kINy6RX1oOT9uv6GXJdIU24nVHEVP5WHwYUFc2O/jfEu7T1ihoYuvgiwCa/Te7dH2aqa
         jch/5UpdycFYsaIEQFVhh0cmczmd7Isulp/fPxjpJ4hgh/PnUeY3ViG/Zn148KO63Zr8
         b99rfCOI6byReGwNqdR1mWRY/YQSln4en45Deo7Bol4uX61hJO0FzFuM9dOs2JSSsL3U
         K4HA==
X-Gm-Message-State: AGi0PuYIITOPRLNu4lj3l885W8EDS393bbY6LQjtIQI7a57Qr3scTTs0
	oEhjfzFerkmVkyYUfnHdJYN8FcLM
X-Google-Smtp-Source: APiQypIV1+b+TXhlXy/l6oNps1xvtlIDM0/ZNCSXbtZKybwrZYDhKHpz5e0VJduZKITP44oeJMdaUA==
X-Received: by 2002:aa7:9904:: with SMTP id z4mr14381586pff.38.1588544179492;
        Sun, 03 May 2020 15:16:19 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:d8cc:ac72:24b0:3118? ([2601:202:4180:a5c0:d8cc:ac72:24b0:3118])
        by smtp.gmail.com with ESMTPSA id e4sm6558804pge.45.2020.05.03.15.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2020 15:16:19 -0700 (PDT)
Subject: Re: [Openembedded-architecture] Proposal: community maintained recipes in oe-core
To: openembedded-architecture@lists.openembedded.org,
 OE-core <openembedded-core@lists.openembedded.org>
References: <CANNYZj_R3LO5nZs77j_2HBYQx44rf=9pMz=oABvXzDAxSvzBWQ@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <53530eac-ce1c-db1a-f489-1d5a4a910870@gmail.com>
Date: Sun, 3 May 2020 15:16:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_R3LO5nZs77j_2HBYQx44rf=9pMz=oABvXzDAxSvzBWQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------CC951BB5A6A0C708F41634E9"
Content-Language: en-US

--------------CC951BB5A6A0C708F41634E9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 5/2/20 4:35 AM, Alexander Kanavin wrote:
> Hello all,
>
> the current maintenance model in openembedded-core is problematic due
> to lack of well-working process of finding maintainers, and replacing
> them when they're no longer able to contribute. This becomes
> especially frustrating when maintainers silently disappear, and
> perfectly fine patches produced by Auto Upgrade Helper and sent to
> them via private mail go wasted.

Can you clarify what you mean by silently disappear.=C2=A0 By the time I h=
ave
time to process an update, someone else has sent the patches.=C2=A0
>
> I'm proposing that some of the recipes in oe-core - those that are
> known to lack an active maintainer - would be transitioned to
> 'community maintenance'.
Define active

> What this means is that the maintainer's email becomes the oe-core
> mailing list email, and accordingly monthly upgrade patches will be
> sent to the list. Then anyone with an interest in those components can
> pick up the patches, polish/test them as needed and send them to
> oe-core for inclusion into master/release branches.

Well that is one of the problems of putting tooling into the community's
hands. It is made it easy to send updates to the list. Is not uncommon
to accept "Update" as the only=C2=A0 information, do you expect the submmi=
ter
to deal with stable or the Package Maintainer?

This opens up an easy path for people to become maintainers, and also
highlights what recipes suffer from lack of attention.

I agree there should be a way to update maintainers e-main once we
determine they are not longer willing to take part in that program or
absent. I believe this an issue in general for OpenSource has had to
address over the years.
>
> Let me know,
> Alex
>
>=20


--------------CC951BB5A6A0C708F41634E9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 5/2/20 4:35 AM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj_R3LO5nZs77j_2HBYQx44rf=9pMz=oABvXzDAxSvzBWQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>Hello all,</div>
        <div><br>
        </div>
        <div>the current maintenance model in openembedded-core is
          problematic due to lack of well-working process of finding
          maintainers, and replacing them when they're no longer able to
          contribute. This becomes especially frustrating when
          maintainers silently disappear, and perfectly fine patches
          produced by Auto Upgrade Helper and sent to them via private
          mail go wasted.</div>
      </div>
    </blockquote>
    <br>
    Can you clarify what you mean by silently disappear.  By the time I
    have time to process an update, someone else has sent the patches. 
    <br>
    <blockquote type="cite"
cite="mid:CANNYZj_R3LO5nZs77j_2HBYQx44rf=9pMz=oABvXzDAxSvzBWQ@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>I'm proposing that some of the recipes in oe-core - those
          that are known to lack an active maintainer - would be
          transitioned to 'community maintenance'.</div>
      </div>
    </blockquote>
    Define active<br>
    <br>
    <blockquote type="cite"
cite="mid:CANNYZj_R3LO5nZs77j_2HBYQx44rf=9pMz=oABvXzDAxSvzBWQ@mail.gmail.com">
      <div dir="ltr">
        <div> What this means is that the maintainer's email becomes the
          oe-core mailing list email, and accordingly monthly upgrade
          patches will be sent to the list. Then anyone with an interest
          in those components can pick up the patches, polish/test them
          as needed and send them to oe-core for inclusion into
          master/release branches.</div>
      </div>
    </blockquote>
    <br>
    Well that is one of the problems of putting tooling into the
    community's hands. It is made it easy to send updates to the list.
    Is not uncommon to accept "Update" as the only  information, do you
    expect the submmiter to deal with stable or the Package Maintainer?<br>
    <br>
    <div dir="ltr">
      <div>This opens up an easy path for people to become maintainers,
        and also highlights what recipes suffer from lack of attention.</div>
    </div>
    <br>
    I agree there should be a way to update maintainers e-main once we
    determine they are not longer willing to take part in that program
    or absent. I believe this an issue in general for OpenSource has had
    to address over the years.<br>
    <blockquote type="cite"
cite="mid:CANNYZj_R3LO5nZs77j_2HBYQx44rf=9pMz=oABvXzDAxSvzBWQ@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Let me know,</div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------CC951BB5A6A0C708F41634E9--
