Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2BEC433EF
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 08:43:13 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web09.4781.1635928993273612987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 01:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mINC/a6Y;
 spf=pass (domain: gmail.com, ip: 209.85.222.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id i6so2954775uae.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 01:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U60XGIxQgUCkxCv98QQT2x82aO75iIzXHTMdC5yLKz8=;
        b=mINC/a6YayYoYYF8Di6KXEcy3eJDSUcy5ggBaCiBTqceu27Fv6jexzkSXMzglVV0Ml
         48HYepLnuI+b8ObHwWYYX6h3/nYewl0PQULMp+TZ+Y6H18UNancpLagrMh+8mVz+fGiN
         YN8Keb/ct+kbQnaS+0w1F7Q0n6uBjI/R+Pnrlnnyi+iTFpSLfecjH7lgWPtJAV0AfSW/
         qN2kjo5s1jAAYxBDl6zqq4/MsPfEl5cx8aoh8G08KflCTOxgXB1laYNwyQaOvj5Gacuu
         lSVjZ5pCgH7TPbr1EE2Ss1VFn3dHqvfBikFYiyySXa0XpzMLuEkLhVB6IDX7FJggg2A7
         utwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U60XGIxQgUCkxCv98QQT2x82aO75iIzXHTMdC5yLKz8=;
        b=ofAO8U95A7UatfXtMmme8bz54kqLE5cwpRuvANa7a7s4wWS2o22cB3+xC/v1heW9uO
         7hPyu9cAD9CYyRPxQbiKQ5k6UQbFitpQT3uvZYmi7OOycP30p6LLzPYA2idueW+ZGkQh
         mk8ZaBK8qbnaR8mULQFBYr6phbRfl8U1CXSE2r2FhhoNqvLqL/6gTIaq1HbqEXxrCR+m
         OD9klvOUgwil4utVqpz2HhcGEWDbaFbEPqWbR2eZDzbfqkabCB7otg6rbkq1yjBjzVV9
         gS1ZAiqX0N77gS/TVGh/u4pjS+ne0Bs+O5bZkDlFw+Ctwvx4SPdqXsp54Y7G6naD3yHu
         hc5g==
X-Gm-Message-State: AOAM532AEp6nKxTKf3+Y8VOwh/voPt7TJodjR46c0IQiiLz/pO46EbrE
	YmKAWL/pdYp95QuL4gbjphda8WWtnYzrwuMiTMI=
X-Google-Smtp-Source: 
 ABdhPJzY3TBRib3a8myZ2KLE6fB0NPuTsfyINly0G5LtqqP/Ch6uKrOJDc6v1+O1JzD5e9DfIZyC1jv+uTCQQy76l7c=
X-Received: by 2002:a05:6102:358e:: with SMTP id
 h14mr48182596vsu.13.1635928992351;
 Wed, 03 Nov 2021 01:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211102084303.2974802-1-alex@linutronix.de>
 <20211102084303.2974802-33-alex@linutronix.de>
 <0da19b5aa737377b8020330e6c6bb1e928da4b68.camel@linuxfoundation.org>
In-Reply-To: 
 <0da19b5aa737377b8020330e6c6bb1e928da4b68.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Nov 2021 09:43:01 +0100
Message-ID: 
 <CANNYZj_e_Orf1Rrp4SuQ_HuThfQn5EFe+Vg2sWqM47SrCj7MHQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 33/33] perl: backport gdbm 1.2x compatibility
 fixes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000778b7a05cfde66f8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Nov 2021 08:43:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157825

--000000000000778b7a05cfde66f8
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Nov 2021 at 09:39, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> I noticed we had a perl gdbm failure on both:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2782/steps/12/logs/stdio
> and
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2498
>
> (as well as lttng-tools)
>
> Is that related to this? The commit doesn't say why we need gdbm
> compatibility
> fixes?
>

Yes, the patches are needed to address the ptest failure when gdbm is
updated from 1.19 to 1.2something.

Alex

--000000000000778b7a05cfde66f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 3 Nov 2021 at 09:39, Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
I noticed we had a perl gdbm failure on both:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/build=
s/2782/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2782/steps/12/logs/=
stdio</a><br>
and<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/82/build=
s/2498" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/82/builds/2498</a><br>
<br>
(as well as lttng-tools)<br>
<br>
Is that related to this? The commit doesn&#39;t say why we need gdbm compat=
ibility<br>
fixes?<br></blockquote></div><div class=3D"gmail_quote"><br></div><div clas=
s=3D"gmail_quote">Yes, the patches are needed to address the ptest failure =
when gdbm is updated from 1.19 to 1.2something.</div><div class=3D"gmail_qu=
ote"><br></div><div class=3D"gmail_quote">Alex<br></div></div>

--000000000000778b7a05cfde66f8--

