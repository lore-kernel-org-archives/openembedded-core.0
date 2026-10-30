Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11475.1793366675977360434
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 06:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kEDmoMLp;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53fdd2fb171so7815301cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 06:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793366675; cv=none;
        d=google.com; s=arc-20260327;
        b=QAbDebbKKXyf2nzjMpZ7H6mmgtTLKhDMXbBqTsrPNQY/S0j2LXt6Ei5VA3PFypbl7G
         EH09A8goPEs02FtPR3XAuk7anRYh4bsboqoI+UlPWxoKnV+ifhLEOrZYbaHNuY+pcAAz
         HIf+qW0WZMQ/ARBdh8xYfQJIHxRSIp/O+SM3p4PED5EKRPsSgst0VfFXtoTu32vfnL0r
         HBqc8T1BlBg8Czo8necVB2tOsECHVgqp/NdOKsS94dUfKnawu5k0cpmN6Poow8eBlToY
         +6tZg2zw91mrUSQKkUQxbDTqIaCok5UjOIR7XnSCOJ0HlEnnMF7uOPPMpTJZZ8W0Si/1
         vsBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=17cfgWDJONgXZBa5+/UKsMugbppt9lI/A2/dmhoWe10=;
        fh=3d571T8SRa6klgnGqFkKB7jgNbhbmQaR4RR78McTrIE=;
        b=p8q77+gUanWCh0XOe1yu40MQQSg/iZxTRC3KuPvo4/By/BITQ9OUjas60Yz1F/znO1
         QFm+Xmp9hApaWxN2W3EhAc7gO1xw7sDd/WoZz14G3UxZ1vAAMmJBkNvGYYA28ioxwjH/
         uTDpJ39gO+J5pIUFY/dDBJ8NRAMCylOJowfA/iDN7xpBZyUNE1EA9h/dfPA8PO/SEagN
         H9bMrned6yCQQ5MmsSGnzMAmtdxqllUqJ/kgN/TsFM2/O0OvORMHXCk1d8rO4RyTJfKQ
         Tv4RKwNLvCzMeAZ4jlBPoUW6KtEEXWYWVOJm9ZHSN+lfqUgWKi+Nj7mzeH8YqeS91F0r
         QWfQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793366675; x=1793971475; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=17cfgWDJONgXZBa5+/UKsMugbppt9lI/A2/dmhoWe10=;
        b=kEDmoMLpo0YWnDPbZr7dwW/Qf4+Gs7X7OTRBbtd5bYM0PMr6yxIybVAtRXTzV6X1cr
         Rmcc5H2AJ7sUJ+INtGzBoOPy8u5mjCPZXeIeRuZu4j70HTtH0fBMlSQSOfO00X56Nd9b
         st2ZpZxNaqOAgdhMlH64GqOTtuQRKCSo6jVHishuR+7neIQuO58CbA365AFDXkbYlEye
         gyhAOnFt5kOx5pst5g35M6l22Z32had5W01j3rG5OG+kw2n1QLgB1EDVFeBw1nmezH8D
         w8s6VaZgDWfKD6807vBTjYOgYaFqqmO9sg2qb61tOGwHWmETYoo91WPOZ8MrE0f0XhAa
         DNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793366675; x=1793971475;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=17cfgWDJONgXZBa5+/UKsMugbppt9lI/A2/dmhoWe10=;
        b=OpFPvI3OLNNLs0S0EYiI44JfcECecvN0eWblQBHe7oF8vLXWxTfFqZRfW4DS6jqTAb
         ayYEmPWeshTzUYtCWwVha4RBKmyNuwut/zRJklvI/CtUAA5xuovr82T1Ou4SOK7W8vZD
         0W0i2KyQpnuE3TLDBYho9ttVostraVXXitrAO2dKw7yFMtE0ZfLPyYRyMV17BEkHwwIR
         uv/BpL1Ytdsf8sfEDxO6fSe9+QBcMoZSbJ7FU+E3kkME7h3GGIKskJ2fYTAKCTbxiIGR
         /0kCIHWzvASn1StKaZnOdMxEhDHeQQBdaAyRUQ5Lu4eihXVaWdkp6bkNr8Cz0pwq05fy
         GlzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVRytWMsJV++qCew72Dvh+wKfa0N+gCBowQuHCFq3o5wz/0HyLG/KKblUotOrWW1CbTlUQ/Tv2SI2trfmFuZM0pg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYIlkIHM8DbS8NLitBGNUwk9nhcIKcPoYEQMYDMjWyKJZ15PSG8X
	CAxJr0+42t6HJsArL+lqrZRxsI8zYBIUxoxiBvcp/1pg2JGNqEq7a3ymmvZ1YNz7ijsQ4VsC/l0
	63N9rzWEX6gfrawhCInx2udOmZmMgrmA=
X-Gm-Gg: AYBFou0+p5VZlN9tMfyN0CTIBX1bYGWIkqlOfXVfGmwMCNCSIE2/eD2RavE/iZHr//g
	SAY4fLilkjrNfQVICXv4SZH9YGrHYyUQ6n+vZtW5dpfkgGWk6EGtXD37nEziBcYZDdUmBHToQsj
	Vy7w+pSOWWu3NLdI+cu7cvD9/L17SSB16qYSY+qKvlMmQOlKSgHLFzTRY6JbJg/cziWCHFHxkrW
	FMYMpwDfUMdbK+ycB/1/jXhRpfyD4FMauoOe8Tcb+oakvJv01OAiRFv7ZurwUmFzApPu44ei7Va
	2jPMzR+Scyi/mRiDX2xPuphXpmQzCtGauL5TkPiMo0fUvxSfRQ1/Bmfzq1uOkM7T0JexGibuksS
	v6T0/pgraohXdHg3bWda/1T6Z6Dxdwyg7FeFNDzFl+Pf55yigrlxuo/mYbWbltmiWDCltRM/wYQ
	PE1L4vwgD4esvPijOA
X-Received: by 2002:a05:620a:444f:b0:93f:5717:e7b9 with SMTP id
 af79cd13be357-9442177e372mr342192185a.30.1793366674886; Fri, 30 Oct 2026
 06:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20261030100214.3111726-1-roshs@qti.qualcomm.com> <CADkTA4NWzzaT11ssicpviaA3AgYtOPbpg_HGuciPSttkQUggdQ@mail.gmail.com>
In-Reply-To: <CADkTA4NWzzaT11ssicpviaA3AgYtOPbpg_HGuciPSttkQUggdQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 30 Oct 2026 14:24:22 +0100
X-Gm-Features: AclHuK8RGdLlcveHwEiXkSWW1G-3AeTEXEaNCZlTplt2M2nfiYmb3UEFoJ3ES2w
Message-ID: <CANNYZj-1kbfQpAGpPKaOd_mGqA8Ums_+NO_aFyYtO2fq+gUudA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel-devsrc: add runtime dependency on sed
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: roshs@qti.qualcomm.com, openembedded-core@lists.openembedded.org, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Sumanth Gavini <sumanth.gavini@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000009bd4a9065f0eb7fe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 13:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249039

--0000000000009bd4a9065f0eb7fe
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Oct 2026 at 13:56, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> I say "probably" above, because you aren't saying what you are
> building that triggered that script to be called at all. From a quick
> grep of the kernel it is only linking vmlinux that uses that.
>
> Are you rebuilding the kernel completely from -devsrc ? (which
> shouldn't work)  Or doing something else that is triggering it to be
> called ?
>

From a different thread, I do not think this script is actually called or
used. Rather there was an interaction with rpm packaging that revealed the
missing sed dependency in the package, caused by this script. Rpm tries to
be clever when processing binaries it's asked to package up, and sometimes
that gets in the way (but other times reveals useful info about missing
dependencies).

Alex

--0000000000009bd4a9065f0eb7fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 30 Oct 2026 at 13:56, Bruce Ashfi=
eld &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.co=
m</a>&gt; wrote:</div><div class=3D"gmail_quote gmail_quote_container"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div><div style=3D"font-size:small">I say &quot;probably&q=
uot; above, because you aren&#39;t saying what you are</div><div style=3D"f=
ont-size:small">building that triggered that script to be called at all. Fr=
om a quick</div><div style=3D"font-size:small">grep of the kernel it is onl=
y linking vmlinux that uses that.=C2=A0</div><div style=3D"font-size:small"=
><br></div><div style=3D"font-size:small">Are you rebuilding the kernel com=
pletely from -devsrc ?=C2=A0(which=C2=A0</div><div style=3D"font-size:small=
">shouldn&#39;t work)=C2=A0 Or doing something else that is triggering it t=
o be</div><div style=3D"font-size:small">called ?</div></div></div></div></=
blockquote><div><br></div><div>From a different thread, I do not think this=
 script is actually called or used. Rather there was an interaction with rp=
m packaging that revealed the missing sed dependency in the package, caused=
 by this script. Rpm tries to be clever when processing binaries it&#39;s a=
sked to package up, and sometimes that gets in the way (but other times rev=
eals useful info about missing dependencies).</div><div><br></div><div>Alex=
=C2=A0</div></div></div>

--0000000000009bd4a9065f0eb7fe--
