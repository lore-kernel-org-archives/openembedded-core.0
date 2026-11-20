Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3505.1795171588109204926
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:46:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NvCahKvL;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55d2d380f6aso9094251cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 02:46:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795171587; cv=none;
        d=google.com; s=arc-20260327;
        b=buiBPmxCnhMiQaqTnWoJ8bY2d3vIEdVk3vhnFI9Ef6/DQjInqs2eEmAvN7khxBbyzH
         grxdsYgJEx0D/3HKAoYXCWKS3GADnsQooKxNG/gZWdsumDxaQlG38Y8e7AFHqEx7wBWD
         zIbN90LXY6zh8N41nNHKxHiheR0ItAdMishckW1KaHsO58dm0jNI4EcMAAOZCQEZZRGd
         Bbgf9b3Pq/oDhLm+H4OL+uLRH07PJKKWmYiVplsDgw/i1hCQraJ3O/6cX8UUpdYfIHc9
         SvIdI4UQhCvqDG1G6GnCr7iYnjcXR6lm+yPj82kG9HWArk9bhj/SA2BREJ9JTFnlVX3Y
         uzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=caMGONtakh3ku6kyKw+HCX+kpkq8AGQYJY9E2kj32to=;
        fh=A70T00D8FJSYieM0kb4cL/ZwKD9oh+DDCqRW0XG/0No=;
        b=dcV85C8fWohGAjg/wSRHxqeELXu6qboM66xw7KPVDEfN26qBIm/QSdkM5AoUdMXTRi
         VnB58CdRNswXQQ90kNa1WGBKUp/x0L+IXhY6e9wcg3QkXawN0X6++NDt0t0PJ7ljwohf
         AR7rbmqrRR24K38drotEE/zrTkn3dGerOePiVuQepvx2R74D0zlqj4i2nrI8gLwbXZx0
         TsoQuaGTgFFCjw8kLOpM1T2JJ+6KuNiYuNTpNd6vZ2TBcmbsf/+drLDUz5w8cAWyyxWG
         kZqcyFJHXaYf/lJYou9DRw69ZXcwG1WuyWMFPKVUw5MTbYkZqCQkR1792ljs0tERwLMc
         r73A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171587; x=1795776387; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=caMGONtakh3ku6kyKw+HCX+kpkq8AGQYJY9E2kj32to=;
        b=NvCahKvLTEiquwfHn/w69h1G83MpaXCfKQq/gn6R1RM/oMP1nSQTxR3WQmrAR3O6iz
         PIOr/w73jk2l5SGcofQj2jw48QLMI5Yw1wKOG3MIK/kXX3EhPPFzvrO3y0up0Q0fJ+J8
         3BTEwhPP2kmpkLLK/Do+bZTIbGhxWYng+PbQdpr5hOQMJhjJ4D0e5g/bJnY5UfwWAhhr
         gop7vfPNy9xfnOZE5qtCDjUZFPrG1qLaETdvbA5mr4Gfon4rwwNBUAz1lkJ/Sln3rII8
         ItXPGc4W792ZCsyjofai5H60mzpbCr6h4QEz+zYjk6FJgwqYTF2bj4mdhl7BnH3mMq6S
         WgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171587; x=1795776387;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=caMGONtakh3ku6kyKw+HCX+kpkq8AGQYJY9E2kj32to=;
        b=dlVyJQ8N1fdU05eNzFGXsMJrK+fO4ijPRVUNyMeVk5Qeti6ANm+vQC7oILJ9hIQ7i8
         wGEVR2J98VTy2pJD+TjhF+P5eUrg2hea0iC74M0yqz7RznDWLleEY/XX4XHiy5oQ27yL
         q61kFqGooLvX1+jd8dIQPz4eyr47TLv1r8NAZ/AJXENCKA1DAU2DMx9H2biLGoNJqHZZ
         yQSqgm6qe5r6+qbswphqka0sgEDGveTJ6ATlk0tPwKI4T+WBHFhFjHm45M+75xGxqN/u
         UTRR9zhqd40MOanTYCXKQtzcANAlVpET7E1PNkJLGXtg5Gt9ObVqzpVd5aHqURY5g47n
         aVDQ==
X-Gm-Message-State: APuU4Z9rmPqLjizRyPquBUAI/om/Lz3Uos8FdyrzfY4lHip756NLxJ/m
	KbH9baIcYdwgDwbtTSpVkU1dGpMubhI1dFtqLn6jBYY6Pmn+9bEQLb5flLAVKc6CYFd1C9pBHzM
	/GLDsWJq7ZQGxjpqfWZyRFb8/olvcYsw=
X-Gm-Gg: AYBFou0qIVT/Crk4GqmlKHqWi3xhdg/I0wsEMCDMK85m8EE7D4Hz8bg0nVTnVUuSzIV
	8VK+uOyNQgPDJVj5K//LeLobQo1+Xv08WMXwU5REw+oDBT57RKoe1nuK7aHWPueET/Ohf+WBCp2
	1ir7FyRd/5ytOq0o/3ydI0RZWlwixHJxebAWUi5M0UZgvr7xf0azMTOK/UkdwZRb9Xe1h8G5FXJ
	09V0DbIm+Ujjcsz3OC180SfqPBVfpB1rh5PpuVROOMPEAR8bs0EWfLZUaOVg1NIHn0AqOl30cKw
	C8CBwa0BLZM4SvAM2dITxSuSrYtQvuCPJF8WjuEV8FYCBiQ9KPVnH6chbn+OM+mQ2G3oKHj+MXX
	Gaq4zKz9Zq0Kw+HoN+3nPNFZSWWQcwuuG8sZdz1Hl47yd3w4OVwZ4KfsOdG2S2joIq736r/I=
X-Received: by 2002:ac8:5d06:0:b0:55d:6cfa:3e66 with SMTP id
 d75a77b69052e-55d76a06db5mr50421961cf.28.1795171586847; Fri, 20 Nov 2026
 02:46:26 -0800 (PST)
MIME-Version: 1.0
References: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
 <20261119141333.34492-8-jaipaul.cheernam@est.tech> <CANNYZj9dikE_THGNhhdMYKdJ9PJj4fPApc_mS1XgiJufwZFmQg@mail.gmail.com>
 <cf973a06-a224-4c21-89ae-4a35c0af9384@est.tech>
In-Reply-To: <cf973a06-a224-4c21-89ae-4a35c0af9384@est.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Nov 2026 11:46:14 +0100
X-Gm-Features: Aa3M54pi86AH_chfABwgzBToYZZvyd4irgTAULuGCaNu3zsb3YTN7tJrtTF6AEg
Message-ID: <CANNYZj_pF6nSsORkZiTu_6xJgJHZwv1Rfknu4X=AtdWKJs=4HA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/7] dnf: Do not hardcode /etc bash completion directory
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000beb7ec0660b2f442"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 10:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250761

--000000000000beb7ec0660b2f442
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 at 11:41, Jaipaul Cheernam <jaipaul.cheernam@est.tech>
wrote:

> I can try for both bash and systemd patches. But as its failing now
> meanwhile can we take the patch into oe-core?


We can, subject to the normal patch review process. Meanwhile you can
submit upstream and resend here with an updated Upstream-Status line, or if
the patch has already merged, then rebase, and adjust the commit message
and send that.

Generally try to be critical towards Inappropriate patches, including your
own. If you think it can't be submitted upstream as it is, then at least
there should be an upstream ticket, so upstream is aware of the issue that
a prominent user (the yocto project) is having.

Alex

--000000000000beb7ec0660b2f442
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 20 Nov 2026 at 11:41, Jaipaul Che=
ernam &lt;jaipaul.cheernam@est.tech&gt; wrote:</div><div class=3D"gmail_quo=
te gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>I can try for both bash and systemd patches. But as its failing now <br>
meanwhile can we take the patch into oe-core?</blockquote><div><br></div><d=
iv>We can, subject to the normal patch review process. Meanwhile you can su=
bmit upstream and resend here with an updated Upstream-Status line, or if t=
he patch has already merged, then rebase, and adjust the commit message and=
 send that.</div><div><br></div><div>Generally try to be critical towards I=
nappropriate patches, including your own. If you think it can&#39;t be subm=
itted upstream as it is, then at least there should be an upstream ticket, =
so upstream is aware of the issue that a prominent user (the yocto project)=
 is having.</div><div><br></div><div>Alex=C2=A0</div></div></div>

--000000000000beb7ec0660b2f442--
