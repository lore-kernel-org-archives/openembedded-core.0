Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE63C52D7D
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 12:24:54 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.146613.1723811085508949960
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Aug 2024 05:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b08Ydpv8;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2d3b5f2f621so1439056a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 05:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723811085; x=1724415885; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r+UFTxKBnnH8nwzqN0aNvUcaBn/U7sRrcfCIH2rcMWQ=;
        b=b08Ydpv8wG1bF+0Pjcg3SXQvzPgQG3am5kr577YPzbEsmC+LcUtJ9/JTTOU6S1NGTo
         ndAs/JgjRZdPe635iTA7Uqprmxn50/BUodFatr1CHFUrq+I8hsauD+rxg51+zrk68MM1
         BVjIgnT3+PmrOIkkgAWGdS0Gwuz0eJAoMw8dhtrQ1rF5z5mKL6FmfoeCXHPIZd50tilh
         vt8TfV0A3JCCvSCvJUWHfxDLWYk5J9QkcfL1gzCezN4CYjPaSXbffd8CDr2h0fQXe6jV
         s27nytDeybDs2lCpDR8HqwrH+kNbjvspCtTI+W7GQP/NRTSsJxBXNVKm3ejvCz7oR95f
         AObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811085; x=1724415885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+UFTxKBnnH8nwzqN0aNvUcaBn/U7sRrcfCIH2rcMWQ=;
        b=p+orVnwIxQiQPueaKu7Y4ofWYed7wt8YozHLGDQBYA2MmmHNhWHEUJiCAHTJaB/6Hh
         uzEmZO2P+ZSmzr9EdmiiBkx5IfPNnU31bfSXMAk4GNB8+0EwZpgROmpCGTbtYtkAPKW7
         NWS2n7X3lIPeBeGRMB4Vgyr0+xlufS1mNNe+Y/hbTmdcsreufiSpfmLLZZr0CG3jHVtX
         fx5ps/aO7hpABk/16c1pJKmM+TJ9tcj1D2+ufCQNmLIjPOXVpP48A9recbECbM6fsHDH
         933aeRkfdj3p82iRT1mxSKKxsZvAANLYk+apkEJDckF/fIOcasCOboiS3bZbi9+OT0c5
         2z1g==
X-Gm-Message-State: AOJu0YzELAqMJ7nNZPKHzKe/fpXR/MMZHJA2P4J7Sy/3FdcZtwGXtPJB
	U9h+TpRDmJlcKrFE9MmN0QW/LKM582Dlelf2RcOFW16ruNQfSx9jgB0mcjKUFjaqcgZoLWZ7nyL
	hu+EMsfjVL0afO2/UOk6nQxhqm1c=
X-Google-Smtp-Source: AGHT+IHtSSxKlQOtb2ODMn34JqdWoG0iVbVTgcScZI31a3VD4MaRBSvRym9HbhEvjp0n9XbR+QjPjKcKDiNTZ5O9wI0=
X-Received: by 2002:a17:90b:234f:b0:2cf:28c1:4cc9 with SMTP id
 98e67ed59e1d1-2d3dfc2ae5bmr3056129a91.3.1723811084650; Fri, 16 Aug 2024
 05:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <17EC34D44A2F6C2A.10903@lists.openembedded.org>
In-Reply-To: <17EC34D44A2F6C2A.10903@lists.openembedded.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 16 Aug 2024 14:24:32 +0200
Message-ID: <CAApg2=TAzg0AdCCKaNvByG4C9+KyZt_rb8ok2Re=5RJRW8wveQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check: nvd2 download database variables update
To: rybczynska@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Content-Type: multipart/alternative; boundary="0000000000005c555e061fcc0bee"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 12:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203461

--0000000000005c555e061fcc0bee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 2:20=E2=80=AFPM Marta Rybczynska via lists.openembe=
dded.org
<rybczynska=3Dgmail.com@lists.openembedded.org> wrote:

> Update the recent code adding local/source database files. Add LOCAL and
> SOURCE part to variable names, as none of them needs to be in DL_DIR.
> Use old variable names for the source files, so that the change should be
> invisible to users after backporting.
>
> At the same time fix a bug: handle a situation when both point to the
> same place (was: a deadlock).
>
> Fixes: 03596904392d257572a905a182b92c780d636744 (cve_check: Use a local
> copy of the database during builds)
>
> Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
>

Please disregard this version, one bb.plain was left.

Regards,
Marta

--0000000000005c555e061fcc0bee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 16, 2024 at 2:20=E2=80=AF=
PM Marta Rybczynska via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists.openem=
bedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Update the recent code adding l=
ocal/source database files. Add LOCAL and<br>
SOURCE part to variable names, as none of them needs to be in DL_DIR.<br>
Use old variable names for the source files, so that the change should be<b=
r>
invisible to users after backporting.<br>
<br>
At the same time fix a bug: handle a situation when both point to the<br>
same place (was: a deadlock).<br>
<br>
Fixes: 03596904392d257572a905a182b92c780d636744 (cve_check: Use a local cop=
y of the database during builds)<br>
<br>
Signed-off-by: Marta Rybczynska &lt;<a href=3D"mailto:marta.rybczynska@sysl=
inbit.com" target=3D"_blank">marta.rybczynska@syslinbit.com</a>&gt;<br></bl=
ockquote><div><br></div><div>Please disregard this version, one bb.plain wa=
s left.</div><div><br></div><div>Regards,</div><div>Marta <br></div></div><=
/div>

--0000000000005c555e061fcc0bee--

