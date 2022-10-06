Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AA3C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 12:39:08 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web08.5177.1665059942170922207
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 05:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kvj3en77;
 spf=pass (domain: gmail.com, ip: 209.85.167.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id o64so1829767oib.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 05:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=RiyvMFZESqaHk6CrrXaR1Oc27gIoVy7XFopQvLH5voU=;
        b=kvj3en77wYENU3kicfqvDdwlHnB5LW4I82eYggSd8cjjmaddJQhey3snUX3hoCA4l2
         3e0sTeuZ4y0QqE/ngzSqWZWih7KXSRJRtmEqG0OuU6JvMlhHupwE5Xa/xKnVMK1rt2pg
         HGCMOlHjr2JkYUzvA6vW6fm0z2V8bzy0l9YEWi8AN8RQO6tc8rFqYCM1T2jvgGKpmqt9
         FfX7su1D6AdC2x2SNBoFrurfhUdKAk3VD0BjSmV9TBblakmYalMRT+vp0BjJCnY9S5L+
         ODZEU/Qu/1Aq7FdR/EGkmLF8upLbIpby5cSe6n4PqZ3y22Nd/sgKLZOqO5Sp5eQ6KSNu
         N4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RiyvMFZESqaHk6CrrXaR1Oc27gIoVy7XFopQvLH5voU=;
        b=2POd3OUSSD5LLfFfGsNZizLbmOh87HodQh5bGGta0M82pVYOzXTv5x3Im9Xi8Xn0J1
         vku1QP8vxEYjW2JU6J2R7K6X+cvB1Yj4ixSpi8puqo3g5wUzzNbYb9+63CQkMvVEpV5g
         qUfzlxQBWV9fIgpFKUCLxUweZ1fCf2ixWP24UHJd9ac9o3arYziR+Mmwd7f7lkDQDnlh
         dKUWbVWWV0PsykSPgisEZu1Jgor198d8jpKSa8yyRpEAYlri9/KbvztAmYUsHq2h+ndY
         Wf2BqaaDUixVHohsYHmJQaoTAcK8kZDaPNZsQKfqvUnqFHhqSIKhlM9Whovj1ZAKwZ8w
         WYDA==
X-Gm-Message-State: ACrzQf0DzCbtMLLerO8xIPdXMoBiwOFIPM6wRQuXhHGnyTb7TX4YOXpK
	lS90mGMSGphu94lJRmQiCboLew3w/URE7M/GAiDOth4ATHE=
X-Google-Smtp-Source: 
 AMsMyM5VugIUNIiS4SklxnJK+A5I2Z5lwPWwNuGhX4K8Ep1Y9MkI4Qou9jNSbtE9JjGeIoNCp9lbGJzpVWUcNLqdwCw=
X-Received: by 2002:a54:441a:0:b0:350:7b73:bbca with SMTP id
 k26-20020a54441a000000b003507b73bbcamr2210630oiw.241.1665059941276; Thu, 06
 Oct 2022 05:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664904217.git.bruce.ashfield@gmail.com>
 <ce66ad3692d01831e5f41f27702c01744a8708c5.1664904217.git.bruce.ashfield@gmail.com>
 <8757104C-1103-45EA-8CEF-43EEE0CF18F8@arm.com>
In-Reply-To: <8757104C-1103-45EA-8CEF-43EEE0CF18F8@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 6 Oct 2022 08:38:50 -0400
Message-ID: 
 <CADkTA4OKoeVa0VgJjEKbsoATtmQ03L28p1QVUdn0ibJ=jcoEwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] perf: make scripting depend on setuptools3
To: Ross Burton <Ross.Burton@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 12:39:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171498

On Thu, Oct 6, 2022 at 7:29 AM Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 4 Oct 2022, at 18:27, Bruce Ashfield via lists.openembedded.org <bruce=
.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> > -inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3tar=
getconfig', '', d)}
> > +inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3tar=
getconfig setuptools3', '', d)}
>
> For reasons, setuptools3-base does this:
>
> RDEPENDS:${PN}:append:class-target =3D " ${PYTHON_PN}-core=E2=80=9D
>
> So buildhistory-diff says:
>
> packages/qemuarm64-poky-linux/perf/perf: RDEPENDS: added "python3-core=E2=
=80=9D
>
> I=E2=80=99m guessing that isn=E2=80=99t what you meant.
>

We do need the python support on the target when perf is installed.
Isn't that what python-core provides ?

While it maybe wasn't a RDEPENDS before, it really should have been
(if python-core does provide the runtime bits for target execution).


> Might be easier to :remove that RDEPENDS than faff around recreating the =
right dependencies.

I can definitely do that, but I just want to understand if we do .. or
don't want python3-core appearing now.

Bruce

>
> Ross



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

