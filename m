Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B1DC07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 14:18:34 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.11654.1664288310509712164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 07:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hh4RX96B;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id bk15so7488381wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 07:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=cjR4bJBu2P/GY9bMUcp88CBT+jQoYCjR/2crVt/TEss=;
        b=hh4RX96BU8rSFwetdFEBtgvalyd4NQHKp9FWhBQ69qQ/TVznrBTy46ah2XBKOjyVQh
         lBPvInk5i2yhMBPg7vZ0Tu+FzHtbkUnrAsHh2OTrXH6gPcWQlTdQQfGIrosAxE+PhPxE
         XMOdFkTBeYjzJValW0iI0MJFdhYouQpu1JZE4kz5FrGwZhhtpxYqiY16B374fyxJGwnl
         HgslXdwdKIlYtPH9+/aa3rUI3CbznA1q65D82ghHnMVxkmHt8/hGNA9oxKj8rqOV0O4N
         7F7l2owdLxxWjHhaC4W0v57VW1Zp2CiO5bjl6BrPzy7mkXBHNUzUXNa4FExXIj12U4oV
         q4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=cjR4bJBu2P/GY9bMUcp88CBT+jQoYCjR/2crVt/TEss=;
        b=5Mw6gSDuFlFVjHyH4Ll4oWO+XrAgCMnhw5Y8r3Jf6WRdv07LHQHyf4aTE/GrQT3Gfq
         /dbi5zJDGAjkvy/As99ixpoABCPGkqkNYG+GCt4dUEhaV7PYLg1YXOKM+npWn13Gw9Ju
         l4cqbFBjrrTlgJT6E3ikmuV+xb5oWosq6k7XBzKwNiaYV+P4FQOyX3KjgDkuSxtea567
         QzIGZKRNYOmflc4X/hz1NHaBIQKFXPYs8AFGrigGPKp1PtkwVBSymm5gkUqIO9zDKU9b
         RB1qX44sbVi2oasTq4wSUIChXRfcF9nxeVmtyEGDBz43TOHkpxe/d6OeqG3lPDUatqsN
         Fmug==
X-Gm-Message-State: ACrzQf0bPelx4UW3FdrI2iGnGDj7Ks7QxiAjsazOQ0U578pHgsbEyDzA
	wnrTPwfyNXiWY3/Se2OZUbbcfMcaQEQJEcxgRwo=
X-Google-Smtp-Source: 
 AMsMyM6uXEbQBKfLMo7J2wx/y5qIYsUlWrfOSdzEDASgJgNB+PQEUfMMv4Ta4ty2Iw064YhLoLBARHWmjVRzdMNEBac=
X-Received: by 2002:a5d:4e90:0:b0:22c:c1f2:40d7 with SMTP id
 e16-20020a5d4e90000000b0022cc1f240d7mr1579192wru.548.1664288308928; Tue, 27
 Sep 2022 07:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <6ldv.1652875317100283313.cW0Y@lists.openembedded.org>
 <1718BD59DC8195CF.1217@lists.openembedded.org>
In-Reply-To: <1718BD59DC8195CF.1217@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 27 Sep 2022 16:18:15 +0200
Message-ID: 
 <CA+chaQfCUkGZ=NWahBFh+nQJ+nYykUgY0VCqWjpUv+yu+7V1pA@mail.gmail.com>
Subject: Re: [OE-core] Wiki re submitting patches
To: Martin.Jansa@gmail.com
Cc: mangodan2003@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000075278605e9a95179"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 14:18:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171104

--00000000000075278605e9a95179
Content-Type: text/plain; charset="UTF-8"

and https://lists.yoctoproject.org/g/yocto/message/58182

On Tue, Sep 27, 2022 at 4:17 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> see https://git.openembedded.org/openembedded-core/commit/
>
> On Wed, May 18, 2022 at 2:01 PM <mangodan2003@gmail.com> wrote:
>
>> Is this page still relevant?
>>
>> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>>
>> I have just tried to submit a patch via both the email and git methods
>> and both fail. Google blocks the script when trying the email method saying
>> it is not secure and when trying the git method I get a timeout from the
>> script for github, tho I can access github just fine in my browser.
>>
>> dan@melon ~/workspace_ssd/kas/openembedded-core $
>> ./scripts/create-pull-request -u git@github.com:mangodan2003/openembedded-core.git
>>
>> NOTE: Assuming remote branch 'gst-1.20.2', use -b to override.
>> NOTE: Assuming local branch HEAD, use -l to override.
>> fatal: unable to connect to github.com:
>> github.com[0: 140.82.121.4]: errno=Connection timed out
>>
>> warn: No match for commit 38b9d17c45c15087d484559595b04c7b61fd8fbb found
>> at git://github.com/mangodan2003/openembedded-core
>> warn: Are you sure you pushed 'gst-1.20.2' there?
>> ERROR: git request-pull reported an error
>>
>>
>>
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171102):
> https://lists.openembedded.org/g/openembedded-core/message/171102
> Mute This Topic: https://lists.openembedded.org/mt/91184410/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000075278605e9a95179
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">and=C2=A0<a href=3D"https://lists.yoctoproject.org/g/yocto=
/message/58182">https://lists.yoctoproject.org/g/yocto/message/58182</a></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Sep 27, 2022 at 4:17 PM Martin Jansa via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;Martin.Jansa=3D<a href=3D"mailt=
o:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div dir=3D"ltr">see=C2=A0<a href=3D"https://git.openembedded.org=
/openembedded-core/commit/" target=3D"_blank">https://git.openembedded.org/=
openembedded-core/commit/</a></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, May 18, 2022 at 2:01 PM &lt;<a href=
=3D"mailto:mangodan2003@gmail.com" target=3D"_blank">mangodan2003@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Is this page still relevant?<br><br><a href=3D"https://www.openembedded.org=
/wiki/How_to_submit_a_patch_to_OpenEmbedded" rel=3D"noopener" target=3D"_bl=
ank">https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedde=
d</a><br><br>I have just tried to submit a patch via both the email and git=
 methods and both fail. Google blocks the script when trying the email meth=
od saying it is not secure and when trying the git method I get a timeout f=
rom the script for github, tho I can access github just fine in my browser.=
<br><span style=3D"font-family:monospace"><span style=3D"font-weight:bold;c=
olor:rgb(84,255,84)"><br>dan@melon</span><span style=3D"font-weight:bold;co=
lor:rgb(84,84,255)"> ~/workspace_ssd/kas/openembedded-core $</span><span st=
yle=3D"color:rgb(0,0,0)"> ./scripts/create-pull-request -u git@github.com:m=
angodan2003/openembedded-core.git =C2=A0</span><br>NOTE: Assuming remote br=
anch &#39;gst-1.20.2&#39;, use -b to override. <br>NOTE: Assuming local bra=
nch HEAD, use -l to override. <br>fatal: unable to connect to <a href=3D"ht=
tp://github.com" target=3D"_blank">github.com</a>: <br><a href=3D"http://gi=
thub.com" target=3D"_blank">github.com</a>[0: 140.82.121.4]: errno=3DConnec=
tion timed out <br><br>warn: No match for commit 38b9d17c45c15087d484559595=
b04c7b61fd8fbb found at git://<a href=3D"http://github.com/mangodan2003/ope=
nembedded-core" target=3D"_blank">github.com/mangodan2003/openembedded-core=
</a> <br>warn: Are you sure you pushed &#39;gst-1.20.2&#39; there? <br>ERRO=
R: git request-pull reported an error<br><br></span>
<br>
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171102): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171102" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171102</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91184410/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91184410/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000075278605e9a95179--

