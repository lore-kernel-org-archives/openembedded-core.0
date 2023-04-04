Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBDBC761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 12:22:41 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.99886.1680610953068602834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 05:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=DtrWfRPA;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id j24so32644292wrd.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 05:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680610951; x=1683202951;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/xYsqsBUizfeLdi1LEZrQi23ghN7Z9a13XdEgfDqYNg=;
        b=DtrWfRPAht9OVpY5NFzu1sqrY68NqXI7aozvZ82l9gUYgKqh/IAooaYal9snkjrsZV
         wGj/Ys2e9aCDqdryDaQpZZiJZpRzmiOJtvRCJ4jXiWPU1YnK55ynTi19BeFy24BHah6/
         kTQaOfJcJ9T9/qEIXpud5K3/EVwZz/KDT5gxgbXYcFTOI6XKvXaywb8usihHGt7uor/Y
         VNBkEZB6Y8p37c2+maGeJdSZVkX7WxLr/Wo6TIQHnsuNhMXv+By6EKcXK5dtQTdXnK7Z
         W+2u1jcKZmwuansv/q7eh/8+sd3hpt568Atwc1tFhKeJjJG+ZGgQkLzhKvpDpFPQ9fwS
         RewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680610951; x=1683202951;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xYsqsBUizfeLdi1LEZrQi23ghN7Z9a13XdEgfDqYNg=;
        b=u3hDdlNyhSS9Okq0p8CGeADkRQxVqBhUfIi1Jbso2rITbW/j2esw7fa7xdRQC5V61Q
         YvDFF1febheaVH2/yLuB5iaLIYTZqsJgkSkOfsBHIfC0t+6ntXPuqPW1isgZvaKwsr1q
         ElYoB6wv0IQ8zSgbsnRz7+lYMbtWhlolmiZCNEDP6LutrWcmn7JPGBohWji1n0oy9K7B
         5OcG3KLtkH3BT+Y2gU5v29iQF0mJus2oCJc86lyD26ZoCUMkNUeMLVw6heVOKmEsDBUZ
         z9fsO/Mds54dgJV8Oyd6TJKK1iqzbaxRbuWR2VMELnad2MK7TLil51+4IjvRA6t5tZD7
         +gqA==
X-Gm-Message-State: AAQBX9fXtYoecYI4Hg4UdDHPQoHIDU/IapXvWPiHuXP7d/o4Os0gqYzY
	srFdttcb1Vm4N+NrpX54aLEBf7+J/LmvdHOfivM=
X-Google-Smtp-Source: AKy350atdHrh5IuqVjFi/+c15iCFOLpJAy0Y2s5Fk9mNO4HKlf37pEt4dnIlBQ+qp+y2kezUW61VHPi/y4UpxTk3S6o=
X-Received: by 2002:adf:f78d:0:b0:2e4:cbfe:da3e with SMTP id
 q13-20020adff78d000000b002e4cbfeda3emr461762wrp.1.1680610951361; Tue, 04 Apr
 2023 05:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <CA+chaQe_21ixnj=Uq_CuMYLJCjNinjCcMcjQhm8_Ot43g37rcw@mail.gmail.com>
 <30535.1680604298900052783@lists.openembedded.org>
In-Reply-To: <30535.1680604298900052783@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 4 Apr 2023 14:22:14 +0200
Message-ID: <CA+chaQcEo5uX8MPsaeHxj-ff8vuF=aZE-11J+q_tuJ=98vqi=g@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH] curl: Add fix for CVE-2023-23916
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c2fa8905f881ba39"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 12:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179687

--000000000000c2fa8905f881ba39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No, you should keep Upstream-Status and remove first 2 lines in the .patch
file.

On Tue, Apr 4, 2023 at 12:31=E2=80=AFPM Pawan Badganchi <badganchipv@gmail.=
com>
wrote:

> On Tue, Apr 4, 2023 at 02:58 AM, Martin Jansa wrote:
>
> Upstream-Status
>
> Hi Martin,
> Do you mean i should remove Upstream-Status line and keep other 2 lines a=
s
> it is.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179681):
> https://lists.openembedded.org/g/openembedded-core/message/179681
> Mute This Topic: https://lists.openembedded.org/mt/98055877/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c2fa8905f881ba39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No, you should keep Upstream-Status and remove first 2 lin=
es in the .patch file.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Apr 4, 2023 at 12:31=E2=80=AFPM Pawan Badganc=
hi &lt;<a href=3D"mailto:badganchipv@gmail.com">badganchipv@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue=
, Apr 4, 2023 at 02:58 AM, Martin Jansa wrote:<br>
<blockquote>Upstream-Status</blockquote>
Hi Martin,<br>Do you mean i should remove Upstream-Status=C2=A0line and kee=
p other 2 lines as it is.
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179681): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179681" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179681</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98055877/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98055877/3617156</a><br>
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

--000000000000c2fa8905f881ba39--

