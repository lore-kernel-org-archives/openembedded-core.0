Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC92C77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 15:02:49 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.28632.1684508565365977796
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 08:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZRopcW4M;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2af222c9e3cso12998731fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 08:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684508563; x=1687100563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sb/yVszkV2xfatbNfPr7F+9R5K8ekb1Y26NygQwVycY=;
        b=ZRopcW4McYJIT9++nbQ9kQM5gZ7+vUVkp0deib4Snn5rUJgOr4opIJfBgt28hS/Zd9
         FN0Th47OWupdjnRcmeUFmLVDMCjXtV6kpNTMEP2k/Lc8dl/oYA+pgHMhXOCGMNpjdIj9
         kK5evhSPMMS+mEpCwN4juqo5xBYSwG3SnQ7eQIfeQwTqJH4Qkc/8mJPlE9Q1f9i+4ejK
         H/I/ejaKmzqa8PlM0vCZTbqpF2QZhNyGuc+XLaO30CAnZh8RVJzOuGIE4+u8Oz2Q2WWH
         l86fd2kGhAU8x3c2BxWG7QQi0m8LeJoVafN7bbe0dU8jrMS1B5/NhzLFPWGU5qjxFMha
         JSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684508563; x=1687100563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sb/yVszkV2xfatbNfPr7F+9R5K8ekb1Y26NygQwVycY=;
        b=Hgn9xMBZCTri2oYgsTfh2vXeQMjDE4Lgd65/fNvcBDD23fLGwtIZwwgknk2qcLZvik
         r+LLvqRPKo1HmrF8qJL9I6/nhWHt7jQh3qjQ+1nrp3eyy9PE49RVb2WEuvg852KbcgSI
         T3kuLuyrIuADtxu3Zzyh+MAVygOSYCzXj0oI5svJXej29tslYZ3YugLLGsqCWkCdzYdA
         7RtUOLmvc7j+vwFSkLuWgw8dekwqU61ULX48Tk33AeFzl55JSpO/F+BITNTOP22Pi0jq
         GDe2YqDUWIEpqX3R+AAUfe94tHSRx31sc9roKNhc9AO8qoF2pMuthnTxMOnXUcCjKqRd
         54xw==
X-Gm-Message-State: AC+VfDyLWgmPIAD+WKqHODBA50v5u7Dy9Hd61qkA33aRbz/ukbVY/DXu
	h12Pu7WKCD+AHlMsafdj+VxF+Ly3ZT+KFhI74Xc=
X-Google-Smtp-Source: ACHHUZ6eldr+wVtc7DRHenzlGLunsqdbIX+RBgpXQAwz+NeqI8vVLERdlTxx/qucrOGEmyti2q4XwnPNPWjQ8Xo1e0k=
X-Received: by 2002:a2e:9547:0:b0:2a8:d021:4121 with SMTP id
 t7-20020a2e9547000000b002a8d0214121mr880005ljh.26.1684508563130; Fri, 19 May
 2023 08:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683671423.git.steve@sakoman.com> <5703fcbbede8ec438e36505d406e1f873b13a476.1683671423.git.steve@sakoman.com>
 <84545c02-50b6-e721-f539-8e09a895db46@gmail.com>
In-Reply-To: <84545c02-50b6-e721-f539-8e09a895db46@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 19 May 2023 17:02:30 +0200
Message-ID: <CAApg2=S3a=epBE+y6f7mwy8bLBeX31t5_Atg+9-Xjb4sw-oqhg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 04/15] linux-yocto: Exclude 121 CVEs already
 fixed upstream
To: Armin Kuster <akuster808@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000086ce4e05fc0d36f5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 15:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181557

--00000000000086ce4e05fc0d36f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 11:17=E2=80=AFPM Armin Kuster <akuster808@gmail.com=
> wrote:

>
>
> On 5/9/23 6:32 PM, Steve Sakoman wrote:
> > From: Yoann Congal <yoann.congal@smile.fr>
> >
> > Exclude CVEs that are fixed in both current linux-yocto version
> > v5.10.175 and v5.15.108.
> >
> > To get the commit fixing a CVE, I used the Debian kernel-sec repo [1].
> >
> > [1]:
> https://salsa.debian.org/kernel-team/kernel-sec/-/commit/86d5040aee9275f9=
555458fcaf9cb43710dff398
>
> Just a cautionary note: If anyone is including linux-yocto.inc in their
> custom kernel recipes based on the same kernel version but have not
> updated past the dot release Yocto has, you wont know you are missing
> fixes.
>
> I don't know how we advise the proper use of linux-yocto.inc?
>

Most of those should be in the NVD database and not included this way.
While working on the new featcher, I was also considering a multiple
fetcher configuration. Originally to allow OSV and such. But also,  an
additional "fetcher" could contain entries where we want to override the
NVD database. IMO that would be a cleaner solution and would allow safer
include of the complete fix file, because it will be always checked to the
actual package version. What do you think about it? Worth a POC?

Kind regards,
Marta

--00000000000086ce4e05fc0d36f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 11, 2023 at 11:17=E2=80=
=AFPM Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><br>
<br>
On 5/9/23 6:32 PM, Steve Sakoman wrote:<br>
&gt; From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=
=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt;<br>
&gt; Exclude CVEs that are fixed in both current linux-yocto version<br>
&gt; v5.10.175 and v5.15.108.<br>
&gt;<br>
&gt; To get the commit fixing a CVE, I used the Debian kernel-sec repo [1].=
<br>
&gt;<br>
&gt; [1]: <a href=3D"https://salsa.debian.org/kernel-team/kernel-sec/-/comm=
it/86d5040aee9275f9555458fcaf9cb43710dff398" rel=3D"noreferrer" target=3D"_=
blank">https://salsa.debian.org/kernel-team/kernel-sec/-/commit/86d5040aee9=
275f9555458fcaf9cb43710dff398</a><br>
<br>
Just a cautionary note: If anyone is including linux-yocto.inc in their <br=
>
custom kernel recipes based on the same kernel version but have not <br>
updated past the dot release Yocto has, you wont know you are missing fixes=
.<br>
<br>
I don&#39;t know how we advise the proper use of linux-yocto.inc?<br></bloc=
kquote><div><br></div><div>Most of those should be in the NVD database and =
not included this way. While working on the new <span class=3D"ng" style=3D=
"background:rgba(0,0,0,0) none repeat scroll 0% 0%!important">featcher</spa=
n>, I was also considering a multiple fetcher configuration. Originally to =
allow OSV and such. But also,=C2=A0 an additional &quot;fetcher&quot; could=
 contain entries where we want to override the NVD database. IMO that would=
 be a cleaner solution and would allow safer <span class=3D"ng" style=3D"ba=
ckground:rgba(0,0,0,0) none repeat scroll 0% 0%!important">include</span> o=
f the complete fix file, because it will <span class=3D"ng" style=3D"backgr=
ound:rgba(0,0,0,0) none repeat scroll 0% 0%!important">be always</span> che=
cked to the actual package version. What do you think about it? Worth a POC=
?</div><div><br></div><div>Kind regards,</div><div>Marta<br></div></div></d=
iv>

--00000000000086ce4e05fc0d36f5--

