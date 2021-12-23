Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C829CC433F5
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 15:54:48 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web09.34688.1640274887764305750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 07:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aQfC80KM;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id u6so3540516uaq.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 07:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J/Fy709soRzY3EPTtdMoV+6W+KQOxj1Xlvm+DPjEt1o=;
        b=aQfC80KMaqTGR2bYff5/3WHHuDuKnthN+MQxt3mZ4jIGt73V4UEL14ewlcHOKpNxR3
         f0wLJDjhDJYPqx1EH5MSrFlLO8lfSW/eTiAfPwdj+P0aFGakXWswkjvCqAY8ZZsfU7Xm
         MSNyev1thn/XE5psMERZdHHFab1kg+KedK6O9PnS3/PUKI7zYZvqnrXSxFQ/JA2FtP/Y
         v0KrRii/6HdeL4b+Q85LrkcNxYq2keHvfrr4Dmii0RogfkCefNQlx13ZgmTpavSsuzl1
         IsX9+yr+jbGTh6DPca5EMmBdT1XXEPxJnhePcdTEI5ed/IINTmkKEpSRTh482JW2L6S2
         m8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J/Fy709soRzY3EPTtdMoV+6W+KQOxj1Xlvm+DPjEt1o=;
        b=ynuftZ+EdgQVMWAimajrLpeqoL3Z4bL1+B690erwgmccsPy8A4oreuuEsLsYrNOeFB
         a0+MxXlsAT9fO2crnBFw4tYc3XwPWYjnC6k0Lxx43gGmLvNJFm6RKOcm0JsZGxI1oyMk
         O4QnUf9dwJf2Tm/UX4MZmSIFbS9eKScAGKQEGiuf+TfMjPMySXiLnscY5txqIQlUOIYu
         zPI/7TpQ1RFC+PRs/zILp3UjzyT4MvNzGPXFaiSRbmZgaAm0qbsjsz2TCwnZINOFQz1m
         VIgbFGQpXmvLpBUjIYU29HP4lBkfiuIIqrnmSrqj+B4Qy3nsFIJjsYP4OL+1M01dF+aJ
         8Dtg==
X-Gm-Message-State: AOAM5318aZ2DFv4N0AeQGQcICwzzvhQl17+G9Z6Rm3YK3UBymJLipVi+
	6mXrJ82jEzC6sPa5yJRHyOXhd7YxGxbWxBXp7ec=
X-Google-Smtp-Source: 
 ABdhPJyX6T0yFOcGy5hWAaHAjMm/9amtgKpzt+6CxMjitxGMM54RGM+r/jST0x2Bd1hXshrNhcsItJgdZqmamHrRnGc=
X-Received: by 2002:a67:7105:: with SMTP id m5mr973103vsc.81.1640274886837;
 Thu, 23 Dec 2021 07:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <baa4d9a18f054cc9a9064f9ca415d829@axis.com>
 <AM9PR09MB46424FF6EC0BC8DA32B7B66BA87E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <a468b92caeabf9fc6307ee951e462e4adbd10bbe.camel@linuxfoundation.org>
In-Reply-To: 
 <a468b92caeabf9fc6307ee951e462e4adbd10bbe.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Dec 2021 16:54:35 +0100
Message-ID: 
 <CANNYZj_v0PuHrji-wV505BaFyv=SuEvD9sapY28HHZ3befC2Zg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f6c83c05d3d241cc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 15:54:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159990

--000000000000f6c83c05d3d241cc
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Dec 2021 at 14:11, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> > This is actually a brilliant idea, which would also make it easier to
> > control this behavior from a user's perspective
>
> Part of me wonders if we really do want to make this "easy" for the user :/
>

If people are determined to subvert this, they're likely to do it by
sandwiching additional tasks between configure/compile/install in both
cases. It's better to explicitly force adding the 'network' flag to those
extra tasks then, as it can be clearly seen, and questions can be asked in
code review.

Alex

--000000000000f6c83c05d3d241cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 23 Dec 2021 at 14:11, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; T=
his is actually a brilliant idea, which would also make it easier to <br>
&gt; control this behavior from a user&#39;s perspective<br>
<br>
Part of me wonders if we really do want to make this &quot;easy&quot; for t=
he user :/<br></blockquote><div><br></div><div>If people are determined to =
subvert this, they&#39;re likely to do it by sandwiching additional tasks b=
etween configure/compile/install in both cases. It&#39;s better to explicit=
ly force adding the &#39;network&#39; flag to those extra tasks then, as it=
 can be clearly seen, and questions can be asked in code review.</div><div>=
<br></div><div>Alex<br></div></div></div>

--000000000000f6c83c05d3d241cc--

