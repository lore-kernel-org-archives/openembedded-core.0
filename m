Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAE9C43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 18:57:40 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web08.44532.1658257053834519396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 11:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bgBYTc36;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.54,
 mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lf1-f54.google.com with SMTP id o7so26435290lfq.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 11:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=UQSrBAPxMG1/KKk6vLWKrp3ysVBVgmIV+YlV6EfaiHg=;
        b=bgBYTc36L/9pXD3DUhtOfBqq9TI6n3LtRPnxGUGRbi9aKwinsqOAWi1+gW06SNSmfG
         zmcIKFnpxt1RT1l+i9/0y0bXWlBJU5F110q8+t26kkPcO/wvEegJ2rekJW0IgkUV/loj
         I6TeaqIV+ke8mgemohLpOtspYP1q9erYyACag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=UQSrBAPxMG1/KKk6vLWKrp3ysVBVgmIV+YlV6EfaiHg=;
        b=c3f93e/8mWLDWIW1/l9e4X44ymTyn9VqZ617ey2PsIET+X4rybA9e0DG4EhLi77auX
         b+dCqKPm/qSfT4evlCK2k0WY0OYacF7RV+V+FBYoX1ksPM1LgX+MfLeKviZhE0SzmKqT
         eMYtAOmMbgyhgFVXtNbKWL8tVXo+WTaiKpQJeTdH81idGv0BPFsAbA0qQV+hbNKchpXO
         BOMzJ6o08A8IgxQbgcQEzkOWJVqFQBes0bqHXcl8gTIf7Or+EC8XGW68uyLtVhFVKPTN
         xMv+5WVbaZcnwgYOQyH0QsLQ9j29xJeitNwHHuheJIKUFllZHhbc9MC5Zn9ubTRr2hWg
         PAAA==
X-Gm-Message-State: AJIora/zNjGhZvjmB4/qb3RicpOKZoB4u++zvvxp4FBYvJIpTS9aiG4i
	e9mMqBlxL84e7EXEdUI45SbWIh9c2wVA5mzdPYXfsAOjMf2srw==
X-Google-Smtp-Source: 
 AGRyM1sT8CN+SSVIJbOb3D8gMiVR2sIV+YE05uCGwxjMjnrTlWGsZOR3cY9eMYRPzZWar1ZRweSKmZ3i6HQXNhe0uyA=
X-Received: by 2002:a05:6512:32c8:b0:48a:10da:b204 with SMTP id
 f8-20020a05651232c800b0048a10dab204mr16013772lfg.183.1658257051927; Tue, 19
 Jul 2022 11:57:31 -0700 (PDT)
MIME-Version: 1.0
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Tue, 19 Jul 2022 11:57:21 -0700
Message-ID: 
 <CADfgfoYJEXnriPM5EEcKU6F=5hg5AR4Zz+QYkUa2q29PFYw-6g@mail.gmail.com>
Subject: Hash Equivalence Server Domain Change
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000086e44805e42d0ea5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 18:57:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168287

--00000000000086e44805e42d0ea5
Content-Type: text/plain; charset="UTF-8"

We are moving the hash equivalence server to dedicated servers. As part of
the change we need to change the domain.

Please update any BB_HASHSERVE_UPSTREAM
<https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-BB_HASHSERVE_UPSTREAM>
variables
from "typhoon.yocto.io:8687" to "hashserv.yocto.io:8687" at your
earliest convenience.

We plan to make the switch during the next maintenance window on Friday
July 22nd. The previous server will quickly fall out of date and be taken
offline next week.

-- 
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--00000000000086e44805e42d0ea5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We are moving the hash equivalence server to dedicated ser=
vers. As part of the change we need to change the domain.=C2=A0<div><br></d=
iv><div>Please update any=C2=A0<a class=3D"gmail-reference external" href=
=3D"https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bitbake-u=
ser-manual-ref-variables.html#term-BB_HASHSERVE_UPSTREAM" title=3D"(in Bitb=
ake vVersion: Current Development)"><span class=3D"gmail-xref gmail-std gma=
il-std-term">BB_HASHSERVE_UPSTREAM</span></a>=C2=A0variables from &quot;<a =
href=3D"http://typhoon.yocto.io:8687">typhoon.yocto.io:8687</a>&quot; to &q=
uot;<a href=3D"http://hashserv.yocto.io:8687">hashserv.yocto.io:8687</a>&qu=
ot; at your earliest=C2=A0convenience.=C2=A0<div><div><br></div><div>We pla=
n to make the switch during the next maintenance window on Friday July 22nd=
. The previous server will quickly fall out of date and be taken offline ne=
xt week.</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Michael Halstead<di=
v>Linux Foundation / Yocto Project</div><div>Systems Operations Engineer</d=
iv></div></div></div></div></div>

--00000000000086e44805e42d0ea5--

