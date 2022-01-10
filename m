Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83129C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 20:39:59 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web09.37776.1641847198450081694
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 12:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AGSNND6W;
 spf=pass (domain: gmail.com, ip: 209.85.222.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id p1so25820181uap.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 12:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zfhtUcRVSmLmgDkUsqSMjAbDFWxy8lICB8m9gLQOebc=;
        b=AGSNND6WW6hA/Tls37pcGEL980gAvmcKihrY9GgV1PuAaBSfGje6vsxF40F6oO2FMF
         XLmY07YX8g9/+unGGv+RCQITRsyWOwEhG1DINHCWRG3vBY4MhbHCB3em2SxoJ8lIpdvN
         pMDlzfUi3rBXt64x5m6Fp/swV3EXRvGOz6G+U/TD0PwmMj2gFyVOY+exAV7qykL3fjbY
         z023YuyPvKWEL8Pzjyw/YHAoCkvP1vDrm6+t7C6IZ3IWfXLnDfbFAIoXbAUrnxYEjri/
         CiIZn6NlHSbZivlEl13EGoKJoturPeQYUyfxFGCBk9wB5y4XdTjrix7A7cwteFlyaD0b
         5qAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zfhtUcRVSmLmgDkUsqSMjAbDFWxy8lICB8m9gLQOebc=;
        b=4cHJUVqLgfnx27XzlHo7iFtBZ2gVrVOQjOqJuF/seF60at/5q3Ivh9h3TX/6fsCD4p
         EysCZ97advwBO/ndZJs2fosNOIoWRwOKi6Xs9aS3vWp/v1KOT+0lldK84w14BMQd+ETX
         neK2I+l9eMqb8CvO/DtDaprTYt2CafJtFRn/UM+QadmmpCENuAlw/lVxnTUsZJhRyMrs
         NmOUBMLOpsAcSO9e3yI8Tip+jxlmEfoz0Z2ltDOEMDS+qZ0mvA+1Z26Ug0XPl491Q72q
         k8tSasJv5eSTNH1St7UmiqJ6w9HVmwWI4nU9u1Uv9MPTxPvOoUaQT5YebAZBmAdcP8ph
         MW1Q==
X-Gm-Message-State: AOAM531Va2PbDZwyIjJxUofqgRNtaK1viYLLMUFyqnp9VxlMRdMW6oL1
	MG2yWtttaQ+Dqf5ym04dlUDCCuM4fPvLB9l5X2A=
X-Google-Smtp-Source: 
 ABdhPJxXsKSQ+t4xvGkB4TBR66piyl1HVe1GN+1ww0SH0wZbYp9r4y5l50aH++phwv+NTDulHggj4pfOGp07W5w0ZGg=
X-Received: by 2002:a05:6102:370c:: with SMTP id
 s12mr708783vst.42.1641847197528;
 Mon, 10 Jan 2022 12:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20220110153733.29006-1-pkj@axis.com>
 <71cf0c9e5896ea005d3cfb75a67e8982f2a9aff0.camel@linuxfoundation.org>
 <a15707912cbd4ec39883439a542dccf7@axis.com>
In-Reply-To: <a15707912cbd4ec39883439a542dccf7@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Jan 2022 21:39:46 +0100
Message-ID: 
 <CANNYZj97NsmwTH1YhtsjHrq9gXV6CrjM5N7U5rW2=8pawEU8QQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rootfs-postcommands.bbclass: Change the
 default.target location
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fbf67305d540567c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 20:39:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160379

--000000000000fbf67305d540567c
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Jan 2022 at 21:33, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> Thinking a bit more about this though, I am not sure I can win. We have
> had a corresponding local patch for many years, and it seems natural to
> have the link only in /usr/lib/systemd/system. However, for a system that
> uses package management (which we do not), it may not be as natural,
> since then updating the systemd package in runtime would restore systemd's
> default.target rather than the one that was installed with the system.
>
> Would you accept a patch that instead introduces a variable for the path
> to the default.target link, with the following definition:
>
> SYSTEMD_DEFAULT_TARGET_PATH ?= "${@bb.utils.contains('IMAGE_FEATURES',
> 'package-management', '${sysconfdir}/systemd/system',
> '${systemd_system_unitdir}', d}"
>
> That would make it reasonably sane by default, but still allow it to be
> overridden if you have other ideas for your system.
>

I think you can mark certain files as 'configuration' and then package
management won't touch them during updates?

Alex

--000000000000fbf67305d540567c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 10 Jan 2022 at 21:33, Peter Kjellerstedt &lt;<a href=3D"mail=
to:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thinking a bit m=
ore about this though, I am not sure I can win. We have <br>
had a corresponding local patch for many years, and it seems natural to <br=
>
have the link only in /usr/lib/systemd/system. However, for a system that <=
br>
uses package management (which we do not), it may not be as natural, <br>
since then updating the systemd package in runtime would restore systemd&#3=
9;s <br>
default.target rather than the one that was installed with the system.<br>
<br>
Would you accept a patch that instead introduces a variable for the path <b=
r>
to the default.target link, with the following definition:<br>
<br>
SYSTEMD_DEFAULT_TARGET_PATH ?=3D &quot;${@bb.utils.contains(&#39;IMAGE_FEAT=
URES&#39;, &#39;package-management&#39;, &#39;${sysconfdir}/systemd/system&=
#39;, &#39;${systemd_system_unitdir}&#39;, d}&quot;<br>
<br>
That would make it reasonably sane by default, but still allow it to be <br=
>
overridden if you have other ideas for your system.<br></blockquote></div><=
div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">I think you =
can mark certain files as &#39;configuration&#39; and then package manageme=
nt won&#39;t touch them during updates?</div><div class=3D"gmail_quote"><br=
></div><div class=3D"gmail_quote">Alex<br></div></div>

--000000000000fbf67305d540567c--

