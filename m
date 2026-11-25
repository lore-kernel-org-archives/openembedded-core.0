Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38923.1795600569057545874
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 01:56:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=aoZLD1LS;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-921365696d9so39261196d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 01:56:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795600568; cv=none;
        d=google.com; s=arc-20260327;
        b=KE8kr7gEEeiY1pb997JtIcD2zvIq5UujlU/7Sajx02MC01NXf4iw8MovkHvWIDYXGA
         redKTre5fT6TQmNqXLY0X+ON6cFIjJvLeOug6+xQ2sn6VQ038jWOeUgiriXjB6fHcrE9
         xU++oz0DpIMZN4+lEIQYnkhJlXSKcGpEwe/r3cfU/dTLKYct0dKsdymjc5tkcXGpuAqu
         lVkxpU/+LF+pC6gmdw7PPVwp7Psbwbwy+W6tvZUyTyDsvAVOEJ3R1XkaiwUL6NSyrpR0
         NXFQh4ua5VTKS2Abimsh+XrDl66hizULa/pjdO3ZvfL0xrPgvmV+3EFxEhsjo/D7RNLq
         rb/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9Mas+cow44p2dg3c8wV3pWR7x4xW1IknzXFAVLC3/Xc=;
        fh=IIGSP5ttPxX7XJ64L4z1vyaY/NOPbSfkk2ig8BCb4Ag=;
        b=A7bS2hamm/BoQnaEh1uDqR+e8nR99sGsWuG17sm1zEmJfzjt3CsSKAgNeHeSMsWmOI
         qpYBAXmaSUeVBueURCNxPPL5QmvixQstecC5Ln9/HFE/jWmmdiRPxOS13X5NB59pBC/A
         Pqs9nxjYPPEc0uDZuqS5YrYmHSzZBFbq2CkzwXritl7/1HyUVLdkVXIbHJrMpiwlO5b3
         AknERXYSs4G4iZI5G+FhG4IrFHS+cq0FGj1KSaEO7xpkdikAwcY9yrjiRvtBTwMFTVMP
         Zy9qJpj+1EVrCwHDattJmKxvsCvhVWkGDnn5I7Pd4deiMynikM75r1kEaTBbLv061FvE
         eg2Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795600568; x=1796205368; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Mas+cow44p2dg3c8wV3pWR7x4xW1IknzXFAVLC3/Xc=;
        b=aoZLD1LSXwqTxVllYgtbtihmFFLAnSscZ9dVkniP1TshgYiBBZXxclk4XlaJ5GoMV2
         ySCoFw8cU28dbwNsRg7TQvM47TOFgUnC6+QqlGOY6dDVzPMjGn5Xz9E1QVG49kdSu/xx
         8Pw4oeStPRzWryMhjC8hMzI9xjbxh65BOvkT3XOwKRMZQd8NE1i31MJlpSb/HtV5cUB9
         pshCh22wVF3IPPbCfxMk+L7Lp+w9nVOVKj3HrjODotDQqDNjy/xidTkRmhOu+H1sMeUL
         31aaoFmFRZAq1+Wd5TxhO2YASIf3t5NyfZTOEIl9fVBsSEl6Xv/0agOGsf6UoG/XQE67
         jKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600568; x=1796205368;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9Mas+cow44p2dg3c8wV3pWR7x4xW1IknzXFAVLC3/Xc=;
        b=Ya7n+hbgEBQEAxG86Ys8kbwYN2DS+ku3AEkI2IPcuxSz3bGYh3oQIrPEhkaoT4PxqQ
         hPBmC9/zG4ZxNC1tJPWrdkHwywTxYoIxjxJCy7Bh8otMJ80BKGgBUbFhhuY1mMt0bKV7
         phPfR1LQ5H8vXqc0FZR2IqiqlIKL/aoU3jUsnT2AvAvtHLfedCKod/NEI5nd2U10Xept
         6TeiLv2xTW2ez2wUlqXU3FgJs2mHt9rXJiYxDYSH+ncLK4IokwpdYKQCWwnZ7k2Lxr7Y
         NgtZuudq0ZNC1QLSBERSQxLvnNDKzt65K4sBV/lbw0302OGuGbMyl4JKuz2VkQyVXb5i
         pJzA==
X-Gm-Message-State: APuU4Z9Q+lY9ENivoDuT+78n9pTvrAmi348TSeKgvF0FgJ26GJv+5r25
	bZwgSETOMRMOPaQ0yTG/oNuDnfNQoXzEh7VvvCiZf3o9KI0siiwUYNKCUKPSM+F2lZLs1U2dQLm
	/A7XLRkIf61160exVhL6095zfU6w1VYw=
X-Gm-Gg: AZFdTZchxd/sVvUaVGj4F6MG2EObdBS3nMBeNzKuAQGZ3YbVHHMMAR1/dKJlxixspAr
	HBE+YNPr6fW2GfHkB5/xZvVFJkqK9r35tKRlmlOVcYxUWuLWKmc0aMCfEqaeV27kGl90Jfs8/2s
	Lp4PSu8ftr926c07WYJN6cGN+DA9sI5PHDwUZQ4cU39hl01O5rNdPGDgRbDTipPkBO6NkPKiA9u
	lLDInQRPEJfHmNXWE36CSGxYh3oNQnVMI4rrjcZ5B80al2e/7NehMg0+i/9oYGKb+ifMqXhB6R7
	HlZvnVWZhLuo07t/G8xe1Uqe4IVjSNyNNuaY8J+2YfhH2u8keKdgyyg26JBOQpOpbYepQjm5xnk
	YDKO/g+Ot8GDPuWDdLpA2qcaQeXB/t71AFJrCHOUlo01/DgBTvEZdRicRtwnLE9AAXmcwEQo=
X-Received: by 2002:a05:6214:3ca0:b0:921:34df:57b0 with SMTP id
 6a1803df08f44-92134df5863mr297571116d6.28.1795600567889; Wed, 25 Nov 2026
 01:56:07 -0800 (PST)
MIME-Version: 1.0
References: <20261125032545.536406-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261125032545.536406-1-khem.raj@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Nov 2026 10:55:56 +0100
X-Gm-Features: Aa3M54qcihAOmPs2WAYPi-ddfcwvhDb-ja1zti-od7srjQFardsCRRBGoFpfGUs
Message-ID: <CANNYZj874+xNyc6-qQSf-_BOFLJOZ8QNA3LE_+PbxO0Bnx9J7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gawk: Fix intformat ptest failure with clang
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="00000000000001f24a066116d6be"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 09:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251172

--00000000000001f24a066116d6be
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 at 04:25, Khem Raj via openembedded-core <raj.khem=
gmail.com@lists.openembedded.org> wrote:

> v2: Use the patch suggested by gawk maintainer ( Arnold ) which also fixes
> the problem.
> +Upstream-Status: Pending
> +Reported upstream:
> https://lists.gnu.org/archive/html/bug-gawk/2026-11/msg00028.html


This link does not contain the suggested v2 patch, and my previous comment
(about not using Pending) is not addressed.

Alex

--00000000000001f24a066116d6be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, 25 Nov 2026 at 04:25, Khem Raj via openembe=
dded-core &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">v2: Use the patch sugge=
sted by gawk maintainer ( Arnold ) which also fixes the problem.<br>+Upstre=
am-Status: Pending<br>
+Reported upstream: <a href=3D"https://lists.gnu.org/archive/html/bug-gawk/=
2026-11/msg00028.html" rel=3D"noreferrer" target=3D"_blank">https://lists.g=
nu.org/archive/html/bug-gawk/2026-11/msg00028.html</a></blockquote><div><br=
></div><div>This link does not contain the suggested v2 patch, and my previ=
ous comment (about not using Pending) is not addressed.</div><div><br></div=
><div>Alex=C2=A0</div></div></div>
</div>

--00000000000001f24a066116d6be--
