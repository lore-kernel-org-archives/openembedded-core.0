Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACF9C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 16:04:12 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.26898.1656605044682536811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IZdZPSEw;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id a4so20987935lfm.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FU/BxIYxNkruSH5jkFkPojSkxEcaJOohVn3NCopqkeM=;
        b=IZdZPSEwuAueue5tCO5ZDLNqmpo9b+LlcW6CrZ/XcxoQ6ujxC0FckQze5/c2N21grM
         L+NI2W6K8DqCDdLedeqaNTmyWN15NfRmo+yD53jrYsxx60RSHFp37W6FKH++8skABcWX
         J3uFObNB3Olb4IvWSqvzxOFJ/ofqUIZ5lC8YCE4MrS+Tgn9H/CvjdLGFhwey6E0qPHQu
         wTLhY5yZWfnYlppBxmBjRv2hYefVbxZjx9g8RxXaQPC+kwRrOuGOSAUUDka34FppZX9G
         1//TV5qYYVNTt50IRO8u6C2wv44Jno/LVDukDU+hmka14XsGlQ+MNqg+G3kK2KRDBD+H
         SR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FU/BxIYxNkruSH5jkFkPojSkxEcaJOohVn3NCopqkeM=;
        b=qZUG9rSFwa2KYM0sJbLEwHGlNT/Ch+QJi/c3K6p9jz2MSAGfpcAbt+fbzl8m+gI8rD
         rWiTzgZcpIdTg3HaInmN4fsSXhVgmnZFAL06KAOS6sfTTYOeuQf5I1z3nlNXwFJS8dk0
         PxxlDIt0SOO93UXNx/T2nLAUR8pUBd3uM+W8dvPsQku2sgKU2eydlsRwQ2YjKpiExEFC
         DCpC1xaz+twJxhUv1IOrq5OUH/HkUDI875htL4thtwmicw1ScLgD5oExXl0oNhIvecg3
         TpCSdLX0aWoH/1u4kEreQs6c04FMhL5FpQHgC87w2844fumj8zZUO4OXU9Qf0M7yMxhK
         uBow==
X-Gm-Message-State: AJIora84jxF9CbcsDWs0hoWOkkKb0XmyL/FvvallylQUPR3qhu311FQQ
	1/k3zAfNZ+k2AacnVQ4fNueuY7dNdwf7RL8+Sa0=
X-Google-Smtp-Source: 
 AGRyM1t2mPsYP8QGVZM1wJP32tcVK2JrUkizSmzXRrLVLQHqJsW+9YYChtyNmqGHlITud6yfroUHQWKP7PmyCBVTjvk=
X-Received: by 2002:a05:6512:3ca4:b0:47f:6e53:fb4 with SMTP id
 h36-20020a0565123ca400b0047f6e530fb4mr6247164lfv.57.1656605042813; Thu, 30
 Jun 2022 09:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220629151519.1179173-1-ross.burton@arm.com>
 <20220629151519.1179173-2-ross.burton@arm.com>
 <CAApg2=R5-tfzpbMzKevZaPkzVd=BOnJpu-QOmdSFAKXxxThdzw@mail.gmail.com>
 <137E539F-E832-47C4-B81E-4D9CE3E2C3DE@arm.com>
In-Reply-To: <137E539F-E832-47C4-B81E-4D9CE3E2C3DE@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 30 Jun 2022 18:03:51 +0200
Message-ID: 
 <CAApg2=SJFOXKL3yrJzMfEY-7hDdzgLNrBJKTsR2HPmZQav9sdg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cve-check: hook cleanup to the
 BuildCompleted event, not CookerExit
To: Ross Burton <ross.burton@arm.com>
Cc: Sean Nyekjaer <sean@geanix.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
	nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="0000000000001c306305e2ac6b37"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 16:04:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167414

--0000000000001c306305e2ac6b37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 5:45 PM Ross Burton <ross.burton@arm.com> wrote:

>
> > On 29 Jun 2022, at 16:19, Marta Rybczynska <rybczynska@gmail.com> wrote=
:
> > Sean, could you check if it is your case too? I'll be adding a more
> verbose error message
> > so that we know which package it comes from.
>
> I actually think we should get rid of the index file entirely. Why can=E2=
=80=99t
> the big JSON file simply be all of the written JSON files merged together
> (by simply listing the directory contents)?
>
> Without the index file I was running into the issue of merging fragment
files from different builds
in the same directory (different images, the world build etc). I can see
the following solutions:
1. Move the fragment files to a separate directory and remove it at the
build end. It would work if nobody if using fragment files.
2. Extract the complete list of the packages build in a different way and
get fragment files using that different list.

Opinions?

Regards,
Marta

--0000000000001c306305e2ac6b37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 29, 2022 at 5:45 PM Ross =
Burton &lt;<a href=3D"mailto:ross.burton@arm.com">ross.burton@arm.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
&gt; On 29 Jun 2022, at 16:19, Marta Rybczynska &lt;<a href=3D"mailto:rybcz=
ynska@gmail.com" target=3D"_blank">rybczynska@gmail.com</a>&gt; wrote:<br>
&gt; Sean, could you check if it is your case too? I&#39;ll be adding a mor=
e verbose error message<br>
&gt; so that we know which package it comes from.<br>
<br>
I actually think we should get rid of the index file entirely. Why can=E2=
=80=99t the big JSON file simply be all of the written JSON files merged to=
gether (by simply listing the directory contents)?<br>
<br></blockquote><div>Without the index file I was running into the issue o=
f merging fragment files from different builds</div><div>in the same direct=
ory (different images, the world build etc). I can see the following soluti=
ons:</div><div>1. Move the fragment files to a separate directory and remov=
e it at the build end. It would work if nobody <span class=3D"ng" style=3D"=
background:rgba(0,0,0,0) none repeat scroll 0% 0%!important">if using</span=
> fragment files.<br></div><div>2. Extract the complete list of the package=
s <span class=3D"ng" style=3D"background:rgba(0,0,0,0) none repeat scroll 0=
% 0%!important">build</span> in a different way and get fragment files usin=
g that different list.</div><div><br></div><div>Opinions?</div><div><br></d=
iv><div>Regards,</div><div>Marta<br></div></div></div>

--0000000000001c306305e2ac6b37--

