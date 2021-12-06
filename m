Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94B6C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 11:15:50 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web11.50151.1638789349530957063
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 03:15:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BWZHXWVP;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id t13so18679334uad.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 03:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IbbDiA7zb9Tf2sti2ulE8cjnBvn53AJC2gbeKPm0S0Y=;
        b=BWZHXWVP6DHXekWsexfsgXZ5Vp62kEt6MXL+2Cp5TUoQsH0iw03i0RAUyYSuk66gsR
         5sKegwmeMQ7MZNcU0bbTSotMBKtsu4GV5UCnIolrxgEESbnBMgXeE9y1QZWcIThRERIV
         kL2AYx4Mg99BX5AQL5G99jqFBrqxVEseJQ3K8PVoggAMQzO+R8EUIsbN5bFP78OwD5Nt
         nIBs7pHq9/l5gFC1p5PZEhZe2fzsQITTkA5e56hZiVMXE4Xi6M5J1EWwa+Tf5L38bg9Q
         qz3dcVKrICLiEr+JzzZGR1Qxao7Ua73Hr+6sB+zh0RpVO/FzRi8Ch7m9HAhbN7hQoW/A
         6/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IbbDiA7zb9Tf2sti2ulE8cjnBvn53AJC2gbeKPm0S0Y=;
        b=dL1Uygd4Ux+Vo2X7gr245t4mkfIFG61psVezJB1b6dIXn2MV7NkAIkC3MRBQ2LVgG/
         /mO1qtSC/iqZgARZ7JarqFzhv0Z5e2ZGVJ0y5uGqgP2NfWlN7ba6Tn0vR3IcuzuAriKJ
         Nqm3dEC6NirsaFdbuyB3rNBTNCz3alBh8MxehX/+6EurtoNGlGqWL6x298aJkNhtyEo1
         8rBdCIHaBBqPbHiQkLYC9On5e9FMApzN1TZeob4bmYH3FzC/RA0Mhafd6Rf6wcTlpdKG
         mOBE3xyhTGH3wj9qNU+yiVdcv5uY6uq1zZUJXOrw+CgoRoDboP2E3mQ3Fv7Sf64E2YKA
         /MxA==
X-Gm-Message-State: AOAM530YPjcB+lJ55zu39jdWW3kkg23C7Lpg0afr+0tUYPfiIp4J7vIT
	VKTxArDD+RIJk+LgCQPz92vnuMFVa13g32/ualk=
X-Google-Smtp-Source: 
 ABdhPJzUehM//aF8enEtNP7GrwWSijP67kOo4iNNjOVvAsFTSkaglhucEj7rUkxe+rAg2u7sSZeq7pkcNabBM84rwA4=
X-Received: by 2002:a05:6102:3708:: with SMTP id
 s8mr34319459vst.45.1638789348546;
 Mon, 06 Dec 2021 03:15:48 -0800 (PST)
MIME-Version: 1.0
References: <20211206083629.2591982-1-alex@linutronix.de>
 <CAAnfSTuCwTFgkKTSVXUtO3e7nT82yWpMO_h11EWE01Q+PgC9gA@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTuCwTFgkKTSVXUtO3e7nT82yWpMO_h11EWE01Q+PgC9gA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Dec 2021 12:15:37 +0100
Message-ID: 
 <CANNYZj83815NKdVVxXRQEKrbymoffT+tja1xFgOfy+b3Y57SOw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] insane.bbclass: lock down pending patches
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000fb5e5c05d278608b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 11:15:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159220

--000000000000fb5e5c05d278608b
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Dec 2021 at 11:24, Ross Burton <ross@burtonini.com> wrote:

>
> As much as I hate pending patches, and I really do hate patches that
> sit in pending, there are situations where you know the problem, can
> work around it, but still want to push it upstream at some point
> pending further discussion.
>

These situations are rare and you know it. Almost all of the time it's
laziness and abuse of pending so that submission can be avoided altogether
or pushed onto maintainers, e.g. me, not a 'need for further discussion'.


> Yes, we should push back, and if a new patch is added with Pending
> status that is clearly good for upstream we should be asking the
> submitter to do that.  But I don't think that effectively banning
> Pending patches in core is the right way forwards.
>

But this doesn't ban them completely. If someone has a genuine reason to
not submit yet, they can add the patch to lockdown list, and provide a
better explanation for why it should be there. Almost all of the time when
someone submits a Pending patch, they do not bother to explain why it isn't
yet submitted, and no one has time or willpower to argue with it.
Conversely, from the submitter's perspective, it's a lot harder to argue
with an error message that sets policy than it is to argue with core
maintainers expressing opinion.  I do think the lockdown shifts the balance
towards a more disciplined approach.


Alex

--000000000000fb5e5c05d278608b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 6 Dec 2021 at 11:24, Ross Burton &lt;<a href=3D"mailto:ross@=
burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
As much as I hate pending patches, and I really do hate patches that<br>
sit in pending, there are situations where you know the problem, can<br>
work around it, but still want to push it upstream at some point<br>
pending further discussion.<br></blockquote><div><br></div><div>These situa=
tions are rare and you know it. Almost all of the time it&#39;s laziness an=
d abuse of pending so that submission can be avoided altogether or pushed o=
nto maintainers, e.g. me, not a &#39;need for further discussion&#39;. <br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">

Yes, we should push back, and if a new patch is added with Pending<br>
status that is clearly good for upstream we should be asking the<br>
submitter to do that.=C2=A0 But I don&#39;t think that effectively banning<=
br>
Pending patches in core is the right way forwards.<br></blockquote><div><br=
></div><div>But this doesn&#39;t ban them completely. If someone has a genu=
ine reason to not submit yet,=20
they can add the patch to lockdown list, and provide a better=20
explanation for why it should be there. Almost all of the time when someone=
 submits a Pending patch, they do=20
not bother to explain why it isn&#39;t yet submitted, and no one has time o=
r
 willpower to argue with it. Conversely, from the submitter&#39;s=20
perspective, it&#39;s a lot harder to argue with an error message that sets=
=20
policy than it is to argue with core maintainers expressing opinion.=C2=A0 =
I=20
do think the lockdown shifts the balance towards a more disciplined=20
approach.</div><div><br></div><div><br></div><div>Alex<br></div></div><div =
class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><br></div></div>

--000000000000fb5e5c05d278608b--

