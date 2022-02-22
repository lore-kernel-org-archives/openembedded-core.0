Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EF6C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:50:39 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web11.14318.1645545037772329597
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:50:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PjekJm10;
 spf=pass (domain: linaro.org, ip: 209.85.221.170,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vk1-f170.google.com with SMTP id j12so10700239vkr.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qSq0tulNH7IhoB2O1DCnyi+BvJ7fhUqob1VBP+w0qUk=;
        b=PjekJm10V2BcOWb5caxNgVoZlWLCFdxF2s5kSu8255llmjWEcd58gnxJz6P7ulhCRi
         bx6Mk1xDbsEdj3cSRQR9UbmexdTkG/V1mT2Kr+uBcXGFpB9amdVTAHGuJTDw8LnGuRjD
         z6L0yBQf83Lv75oa9CCMlPKKOyVu8NqszEpXsZxWgoZ7zXdKUK3WSDi/eGGvcYWogM03
         lgE9E2jWOgtqDefFqOMlbuYwki4jVOTKiE1IE0FmMFAhPiXNYWkPcQd8w2m42K3Rp5xE
         v1y9+Xihl+wEZLyYOzcH6iMCijMKmM8schST0ekr7r8VQsD7L5PIE/V1VsZ1sKBBrYo3
         Qf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qSq0tulNH7IhoB2O1DCnyi+BvJ7fhUqob1VBP+w0qUk=;
        b=vu2enQVxB9xmMQcgofTGVphX2N8HqZfvMBe1z9p2t0SgaS2fpX71qUZWvhyrNRrNt3
         acaqXAzxcEMS0kDtf9zJgd/iPvlv6zuPMhavw8aXoPBbvWe0U7P4/pRIG5OoSE4kgG28
         shIYb8cG8Iz1ee5+Mr0vZaH9dg8uOsjqU4HWEymTlG5JI+XsfugLijQ3TcNmTKw268L7
         8uBCnCiMuK4zuKeC8tjEaB60voabJYVfjJXRqYPqVkRdbUT/EMJkJHiP+zWgtzmVjUJS
         ApGk8BoATBpjzYbqewarWVm+4WSVgXnWGwANqEDpsEjp5z75XuCjGq5YkzyNnILpJ8dH
         2CuA==
X-Gm-Message-State: AOAM532qD9gpBnJyV/GCf2alH6rtkkC0q1BeKPxrru5EG0KfpRHcH7iG
	8kxr9TBgNRSZ/tQy47SbY0Ij4fsQ8VQyYSe/YShXpw==
X-Google-Smtp-Source: 
 ABdhPJx/8LJbB7DVPlJcuvUteYu0b/TF3lSjXldfqIQ8fRIww30yowwXXHD3lmIxIrAuvXtLbzgV2HlD3U4BE3M075o=
X-Received: by 2002:a05:6122:1348:b0:32c:bcba:ecda with SMTP id
 f8-20020a056122134800b0032cbcbaecdamr10239098vkp.39.1645545036775; Tue, 22
 Feb 2022 07:50:36 -0800 (PST)
MIME-Version: 1.0
References: <16C7F41596656732.11018@lists.openembedded.org>
 <AM9PR09MB464246FE3202004DD91EB054A84D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB464246FE3202004DD91EB054A84D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Tue, 22 Feb 2022 10:50:25 -0500
Message-ID: 
 <CANp-EDbCpBLQ6t8SKwu9k50imsBM9oeOBBfuRXHdnKg3P=7SZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][RFC] cve-check: add lockfile to task
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000061142705d89d4fe5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:50:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162176

--00000000000061142705d89d4fe5
Content-Type: text/plain; charset="UTF-8"

Hi Konrad,

On Fri, Jan 7, 2022 at 4:59 AM Konrad Weihmann <kweihmann@outlook.com>
wrote:

> On 07.01.22 10:48, Konrad Weihmann wrote:
> > this should prevent running into the very rare error
> > sqlite3.OperationalError: attempt to write a readonly database
>
> It's also possible that check_same_thread (that defaults to True ) in
> the sqlite3.connect causes this (see
> https://docs.python.org/3/library/sqlite3.html#sqlite3.connect) - I have
> too little experience with sqlite to provide any further input.
>
> I'd be happy to get some feedback from users that do have that
> experience with sqlite in a highly multithreaded/multiprocess
> environment. Or by people that use cvecheck class in larger setups than
> just core.
>

Afraid I am not well versed in the internals of sqlite, so I cannot comment
on that part.

However, I do run cve-check on a larger setup than core, and after this
commit recently landed in dunfell branch, I noticed that do_cve_check step
is taking considerably longer than it used to. I have not benchmarked it
carefully, but visually from watching the console during the build, it
seems to be somewhere from 2 to 5 times slower. This is running a native
build on an ext4 filesystem (not using containers etc).

Are others seeing similar behaviour?

While I am writing, I should also mention that the CVE JSON feeds are
apparently going to be changing (again).
https://www.cve.org/Media/News/item/news/2022/01/11/Changes-Coming-to-CVE-Record
I wonder if we should perhaps move instead to using the git repo:
https://github.com/CVEProject/cvelist  (existing v4 format)
https://github.com/CVEProject/cvelistV5 (preview of upcoming v5 format)
This would not solve the sqlite locking issue, though perhaps we could
sidestep it and just search the json directly?
I guess I should really start a separate thread about this ;-)

Regards,
Ralph

--00000000000061142705d89d4fe5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Konrad,<div><br></div></div><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 7, 2022 =
at 4:59 AM Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com">kwe=
ihmann@outlook.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 07.01.22 10:48, Konrad Weihmann wrote:<br>
&gt; this should prevent running into the very rare error<br>
&gt; sqlite3.OperationalError: attempt to write a readonly database<br>
<br>
It&#39;s also possible that check_same_thread (that defaults to True ) in <=
br>
the sqlite3.connect causes this (see <br>
<a href=3D"https://docs.python.org/3/library/sqlite3.html#sqlite3.connect" =
rel=3D"noreferrer" target=3D"_blank">https://docs.python.org/3/library/sqli=
te3.html#sqlite3.connect</a>) - I have <br>
too little experience with sqlite to provide any further input.<br>
<br>
I&#39;d be happy to get some feedback from users that do have that <br>
experience with sqlite in a highly multithreaded/multiprocess <br>
environment. Or by people that use cvecheck class in larger setups than <br=
>
just core.<br></blockquote><div><br></div><div>Afraid I am not well versed =
in the internals of sqlite, so I cannot comment on that part.</div><div><br=
></div><div>However, I do run cve-check on a larger setup than core, and af=
ter this commit recently landed in dunfell branch, I noticed that do_cve_ch=
eck step is taking considerably longer than it used to. I have not benchmar=
ked it carefully, but visually from watching the console during the build, =
it seems to be somewhere from 2 to 5 times slower. This is running a native=
 build on an ext4 filesystem (not using containers etc).</div><div><br></di=
v><div>Are others seeing similar behaviour?</div><div><br></div><div>While =
I am writing, I should also mention that the CVE JSON feeds are apparently =
going to be changing (again).</div><div><a href=3D"https://www.cve.org/Medi=
a/News/item/news/2022/01/11/Changes-Coming-to-CVE-Record">https://www.cve.o=
rg/Media/News/item/news/2022/01/11/Changes-Coming-to-CVE-Record</a><br></di=
v><div>I wonder if we should perhaps move instead to using the git repo:</d=
iv><div><a href=3D"https://github.com/CVEProject/cvelist">https://github.co=
m/CVEProject/cvelist</a>=C2=A0 (existing v4 format)<br></div><div><a href=
=3D"https://github.com/CVEProject/cvelistV5">https://github.com/CVEProject/=
cvelistV5</a> (preview of upcoming v5 format)<br></div><div>This would not =
solve the sqlite locking issue, though perhaps we could sidestep it and jus=
t search the json directly?</div><div>I guess I should really start a separ=
ate thread about this ;-)<br></div><div><br></div><div>Regards,</div><div>R=
alph</div></div></div>

--00000000000061142705d89d4fe5--

