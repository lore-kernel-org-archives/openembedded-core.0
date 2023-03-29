Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A567C74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 04:45:33 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.17075.1680065131847751257
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 21:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IW8PEvm/;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id t14so14805214ljd.5
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 21:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680065130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hnDSPfgBRMHxf91Azier+ji+Qjs5GtIyKDtj6zh1+qE=;
        b=IW8PEvm/kO3ov28iiU662WORvyqY9LZZ3pRrN1J4mQSSbODYEXDIghrplMgqH+dT41
         wzh6AsvYhpla04XbCd8G0qCKJ9nmfYI8j33KGTscg5+d3TJtdzfKXnOwV1PSPqUvx+pM
         QZhJyR+Ki9G2SMiloatbC65oZNc1ejiZBEr7JLENJq7XVBOOb7Hdko8ZcgF3d7qjMi1S
         Lio9C0SLuuYADLmt+ITsOE6oMR1RhjJAuXJGgdHAgP6+VHHbj6q6Hb0VFyaxu1WuYGY+
         FHh1+TpYSZC0uY3ZzWpcdOkupk4r3uRLrDc9tqDlZtQPztFNHJgidquZetlNCCx0Xgxv
         PRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680065130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnDSPfgBRMHxf91Azier+ji+Qjs5GtIyKDtj6zh1+qE=;
        b=wwnSzwa/vUj/NbSEDdpuTOELZJj5WWp74/DzwbdHl9lK3b4AdxO1SxfnrxOXZilH6g
         vkxRIEmf0QktELL8/BAjTdIcLWD8s/oUQ46/J+QPV4coXAjmvpVQY5uRGBo4CG8XEkjj
         iqe/8HZzZuY3s0XIQ3TzG2SFySIpfm5xIDC/sryiIWhn0wS/60fctOtjlAGkAUBlkghg
         Psl+TKFlIKcyxAsI7B7mweePiaK3N+hUetgQPQ0a3aTkJMqN2DSPiSgP9c4gU/6LkjbJ
         g6yrpxiN9ofuuyEt2bcyg6ZD+BJc3yPNlcj96fZUG8ICZIfcFfdaFd9jGcEVDbhsndN7
         DP8A==
X-Gm-Message-State: AAQBX9cM9vRbHr6As6iCpmN0qsT8VxkjxCwDLw/q6FHvqpJWkV2aZdnS
	J5xdyP3wEPvg3Hn9fC0+8ftVDe2gqY2WSJDt9gE=
X-Google-Smtp-Source: AKy350bcJcCQvX8imVFKhFXE1BqxDJlYwKTY73szo0m36/yJ+lThlb2jiUClg3oLWGorS4p2OM+fQhfrPTvR8N2fu2o=
X-Received: by 2002:a2e:7017:0:b0:295:bb34:9c2 with SMTP id
 l23-20020a2e7017000000b00295bb3409c2mr5466972ljc.10.1680065129717; Tue, 28
 Mar 2023 21:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230328102349.57990-1-geoffrey.giry@smile.fr>
In-Reply-To: <20230328102349.57990-1-geoffrey.giry@smile.fr>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 29 Mar 2023 06:45:17 +0200
Message-ID: <CAApg2=TD8PtdUxmLT7wOqRG-7O9zEaEKt0n47mRuRX_yvr1T=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Fix cve-check false negative
To: Geoffrey GIRY <geoffrey.giry@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Yoann CONGAL <yoann.congal@smile.fr>
Content-Type: multipart/alternative; boundary="00000000000041a5cb05f802a5be"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 04:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179260

--00000000000041a5cb05f802a5be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 12:24=E2=80=AFPM Geoffrey GIRY <geoffrey.giry@smile=
.fr>
wrote:

> Fixes [YOCTO #14127]
>
> NVD DB store version and update in the same value, separated by '_'.
> The proposed patch check if the version from NVD DB contains a "_",
> ie 9.2.0_p1 is convert to 9.2.0p1 before version comparison.
>
>
Thank you for the patch. Which layers (and world builds) have you verified
it with?
I'm asking because versioning is always a complicated problems with
frequent exceptions to all "rules".

Kind regards,
Marta

--00000000000041a5cb05f802a5be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 28, 2023 at 12:24=E2=80=
=AFPM Geoffrey GIRY &lt;<a href=3D"mailto:geoffrey.giry@smile.fr">geoffrey.=
giry@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Fixes [YOCTO #14127]<br>
<br>
NVD DB store version and update in the same value, separated by &#39;_&#39;=
.<br>
The proposed patch check if the version from NVD DB contains a &quot;_&quot=
;,<br>
ie 9.2.0_p1 is convert to 9.2.0p1 before version comparison.<br>
<br></blockquote><div><br></div><div>Thank you for the patch. Which layers =
(and world builds) have you verified it with?</div><div>I&#39;m asking beca=
use versioning is always a complicated <span class=3D"ng" style=3D"backgrou=
nd:rgba(0,0,0,0) none repeat scroll 0% 0%!important">problems</span> with f=
requent exceptions to all &quot;rules&quot;.</div><div><br></div><div>Kind =
regards,</div><div>Marta <br></div></div></div>

--00000000000041a5cb05f802a5be--

