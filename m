Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB64C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 14:20:54 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.37286.1634566852786869955
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NBFI8U8N;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id s1so9520240plg.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4BJOMLCne/7YZKFU5WsnArLKE+rtKiz0hoX+iPve9Uo=;
        b=NBFI8U8Ni8XQWcPvcK0BpctW3dCp8kuy9F+cso7WVZDpEGHqz73gADy/LdELpG2Js/
         YWQHNFobCwJb4uI/+JzVAeJOcqWguEY3EqNtt3GClt+w4hwg1vfzj7uIhpxIjsu4y5il
         xR4jO9texk3Uhr3vzrRzo69dJtlLpf6U/NIgOKQTfiPKY7zMowLjlxGAjdJ3asQPvycw
         53SnvQ6gVNTYn0aABRSIghwfFmBkWnvZDXIsRyEqcjgkdzf4Ug0rSCGgFvmKIr9hSygE
         4XtyO1jrPd7vxomhbIT43WYZNaIF9EeKkE38n0xqiw6JfJbr3y07yrNX0yvamQzcgrAC
         WAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4BJOMLCne/7YZKFU5WsnArLKE+rtKiz0hoX+iPve9Uo=;
        b=aRALlOyp6noVZJMURXQEUGuVRJbbYDNW9Odo2GmDeth3FzyVdxjM5gt9jNwN+auTT/
         PqZC6LPCVqh2bWueKEwSpetobsN63RZxpPkJgZfA4xu/OIOc6koQiI9pMWQXbcvlqAAD
         JCnlT0918kveCSlaThBtvbSaR+tbJkprRAifaxZXTJPHAEXYH7SUbYlMATqRBPAIL41B
         uSfBUcLxu5QEaf+KjqL8wrYUWCwuB13RJkQUsCcg6QoGbNpWv7rU4r18URcZwcGnufQM
         4JSkp5L3qmnYUk6+KIRFy/Q8Ed8wnhUc12QEMGJa8LSZBCQq1/xRw/dLT5xmXnuh6zkA
         YLYQ==
X-Gm-Message-State: AOAM531k4L4gI6irfq2W06SykVKWamKpItGQxyXwRlm7n3pF3cMP/HK1
	xroEsHNEu8qejVNmp3fmZK5HKZdJbwaw2COf3Tk=
X-Google-Smtp-Source: 
 ABdhPJwqd7oBU3XD6VVc9DCuUT3bq5sd/Md8EzFGcS+b3m5IiWWcmAR8lReLoVzrx0nmA6auIXoIFMzaZcPpxjc1TEo=
X-Received: by 2002:a17:90a:e547:: with SMTP id
 ei7mr48857797pjb.169.1634566852224;
 Mon, 18 Oct 2021 07:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211018135322.246963-1-Martin.Jansa@gmail.com>
 <CANNYZj-A0eNR=GWz+-xdZQSxmWYNuU=0PGNQA-1d0w2tSp+NiA@mail.gmail.com>
 <CA+chaQf06t-OSB-x321YRUcWTTuooP=E4o1a0C+asiJJmQzn4g@mail.gmail.com>
 <CANNYZj_7uKo5qJSqVq0gfc2yjeiEW=oLh3Xvkk+JXb0bkGAQiA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_7uKo5qJSqVq0gfc2yjeiEW=oLh3Xvkk+JXb0bkGAQiA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Oct 2021 16:20:41 +0200
Message-ID: 
 <CA+chaQe8qS+GrVA5+hYUH_aSrQKFLssOrg1BzLM-fC4gjXUs+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: add PACKAGECONFIG for opengl-or-es
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000096a8d805cea14090"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 14:20:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157068

--00000000000096a8d805cea14090
Content-Type: text/plain; charset="UTF-8"

> If you say 'Pending', the upstreaming is on you

Sorry, but no, read the definition on
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

  Pending
  - No determination has been made yet or not yet submitted to upstream

> I will simply drop the patch if it proves to be a pain.

OK, I'll simply PNBLACKLIST all the recipes your AUH upgrades break or stop
doing the CI builds completely.

Having latest versions is nice, but this approach to regressions introduced
by version upgrades is quite a pain already.

Thanks

On Mon, Oct 18, 2021 at 4:16 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Sorry, but no. If you say 'Pending', the upstreaming is on you - I will
> simply drop the patch if it proves to be a pain.
>
> Alex
>
> On Mon, 18 Oct 2021 at 16:14, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> On Mon, Oct 18, 2021 at 4:06 PM Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>>
>>> Please do send this upstream, the patch looks like a pain to rebase (and
>>> there's no AB config to test it).
>>>
>>
>> Feel free to do that, I'm not interested in webkitgtk at all - just
>> wanted it to disappear from build failures in world CI.
>>
>

--00000000000096a8d805cea14090
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; If you say &#39;Pending&#39;, the upstreaming is on y=
ou<div><br></div><div>Sorry, but no, read the definition on=C2=A0<a href=3D=
"https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines">https:/=
/www.openembedded.org/wiki/Commit_Patch_Message_Guidelines</a></div><div><b=
r></div><div>=C2=A0 Pending<br>=C2=A0 - No determination has been made yet =
or not yet submitted to upstream<br></div><div><br></div><div>&gt; I will s=
imply drop the patch if it proves to be a pain.</div><div><br></div><div>OK=
, I&#39;ll simply PNBLACKLIST all the recipes your AUH upgrades break or st=
op doing the CI builds completely.</div><div><br></div><div>Having latest v=
ersions is nice, but this approach to regressions introduced by version upg=
rades is quite a pain already.</div><div><br></div><div>Thanks</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Oct 18, 2021 at 4:16 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanav=
in@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Sorry, but no. If=
 you say &#39;Pending&#39;, the upstreaming is on you - I will simply drop =
the patch if it proves to be a pain.</div><div><br></div><div>Alex<br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Mon, 18 Oct 2021 at 16:14, Martin Jansa &lt;<a href=3D"mailto:martin.ja=
nsa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr">On Mon, Oct 18, 2021 at 4:06 PM Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com=
</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div>Please do send this upstre=
am, the patch looks like a pain to rebase (and there&#39;s no AB config to =
test it).</div></div></blockquote><div><br></div><div>Feel free to do that,=
 I&#39;m not interested in webkitgtk at all - just wanted it to disappear f=
rom build failures in world CI.=C2=A0</div></div></div>
</blockquote></div>
</blockquote></div>

--00000000000096a8d805cea14090--

