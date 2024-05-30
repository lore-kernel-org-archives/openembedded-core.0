Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226A0C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 16:44:36 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.1374.1717087471129475913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 09:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OMd7EKZJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f082d92864so9343175ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 09:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717087470; x=1717692270; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fe8o7E/peWtXz+8yzDulDN63Bj0QOXC9fJSAbCI0Ijc=;
        b=OMd7EKZJtuQtHsmgW3cHJLg4XI5/q7NXBs2CbJiBBQpunzeJBh22DC7xRNnlFeppF4
         Ql6X000oqzfOmZM45vOXayQDwMaigT1A3UEGG3jPKO0P2d7EurIiDvQmOHIvZND0tHgF
         ifg2XcKpX/iNx3ZMxleD9wkh54R/WfYCxEVNFqJPh8FAbmP1LZuaD8GMkgK+EY1Pje5v
         tyEfY8XdhodF9l8wF1zhb/yhTDqgiQuaZJOHjbf2DHXm22m3qUTnceWSSteP+KKUBdr5
         PJkPsio7/qZrP7EcJdC0pkUN5S0/2h+VbtBuE7HZodwyMJ8o7x3csRwFodRgphYllC+W
         hkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717087470; x=1717692270;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fe8o7E/peWtXz+8yzDulDN63Bj0QOXC9fJSAbCI0Ijc=;
        b=mWSy9OE2ZkXyyyn8s+JPHzE041xFNXZxjUr1Hz3Z/O8adIyhEe3gsKE33ZJov5ZxlF
         NR+yx5f73p8QEyHbniImYMLK2RnHlML0uDX6+5uUkZcaFaXBh8ILaqcPRFsV30Ccpu6v
         pKhDKZs5Px39h7s5Jpc45ncyh0D1wm6Br/muGiTemGWG6TQTbNxrPxNd39CTMqZJWzmO
         d8wM58di+sFivG1ynoK62ntgp4a2GcPFxNZwUcXH2LVDxtB/iAWYR/w9U+lwAEo/d+cE
         9OL5F9bKDr845dniDBVSZIBOdF+mXUERlwrPvPy9P1BlfxNGPMFROE2qLipup/CGGeuf
         Iz/w==
X-Forwarded-Encrypted: i=1; AJvYcCW9zGaDlrgL1QSYsm9W7vu0NOCy2FY5gutVXWQ/CFAKi/OCu3QNg+jXBy0GhyEPEIZPi2pHFM/5pCkAKBGLiP8ugx17sWoirF5FOsgtV6xfbEsHbEmpoAkv
X-Gm-Message-State: AOJu0YwkseGK06cre0Ao/gFzsqCwhWnP5fdq+UyDItjLTjBUkylIQ4wZ
	ASdP8wfveq86CZLpRTRTimJhbUNCyMTJ+dzyGrV4PQZw4WvtYIc5WBKs/jYQLtyCUIYTnFz6OG/
	2o1RjD8yQarkKny0goy5opDe0q+Kdh7F6
X-Google-Smtp-Source: AGHT+IGQt0C9kKDax+CHKfjLQ5TehD1xs/qJ/bAA2DFpB6ihDln+vYVLdSO1zH3/uhzopMUUmv/GNonPBdgkRlAPAOA=
X-Received: by 2002:a17:902:ec87:b0:1f4:466f:8ca4 with SMTP id
 d9443c01a7336-1f619209d85mr31062655ad.0.1717087470350; Thu, 30 May 2024
 09:44:30 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 30 May 2024 18:44:18 +0200
Message-ID: <CAApg2=S+YizxRSv5=5vj9dR0Z2uE25SDpe9_0UCr5w+0OQNFbA@mail.gmail.com>
Subject: NVD update
To: yocto-security@lists.yoctoproject.org, 
	OE-core <openembedded-core@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="000000000000b7fb420619ae94ab"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 16:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200034

--000000000000b7fb420619ae94ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://www.nist.gov/itl/nvd

*May 29, 2024: *NIST has awarded a contract for additional processing
support for incoming Common Vulnerabilities and Exposures (CVEs) for
inclusion in the National Vulnerability Database. We are confident that
this additional support will allow us to return to the processing rates we
maintained prior to February 2024 *within the next few months.*

In addition, a backlog of unprocessed CVEs has developed since February.
NIST is working with the Department of Homeland Security=E2=80=99s Cybersec=
urity
and Infrastructure Security Agency (CISA) to facilitate the addition of
these unprocessed CVEs to the NVD. *We anticipate that that this backlog
will be cleared by the end of the fiscal year. *

As we shared earlier, NIST is also working on ways to address the
increasing volume of vulnerabilities through technology and process
updates. Our goal is to build a program that is sustainable for the long
term and to support the automation of vulnerability management, security
measurement and compliance.

With a 25-year history of providing this database of vulnerabilities to
users around the world and given that we do not play an enforcement or
oversight role, NIST is uniquely suited to manage the NVD. NIST is fully
committed to maintaining and modernizing this important national resource
that is vital to building and maintaining trust in information technology
and fostering innovation.

Moving forward, we will keep the community informed of our progress toward
normal operational levels and our future modernization plans.

--000000000000b7fb420619ae94ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><a href=3D"https://www.nist.gov/itl/nvd">https://www.=
nist.gov/itl/nvd</a></div><div><br></div><div><p class=3D"MsoNormal"><stron=
g>May 29, 2024: </strong>NIST has awarded a=20
contract for additional processing support for incoming Common=20
Vulnerabilities and Exposures (CVEs) for inclusion in the National=20
Vulnerability Database. We are confident that this additional support=20
will allow us to return to the processing rates we maintained prior to=20
February 2024 <u>within the next few months.</u></p><p class=3D"MsoNormal">=
In=20
addition, a backlog of unprocessed CVEs has developed since February.=20
NIST is working with the Department of Homeland Security=E2=80=99s Cybersec=
urity
 and Infrastructure Security Agency (CISA) to facilitate the addition of
 these unprocessed CVEs to the NVD. <u>We anticipate that that this backlog
 will be cleared by the end of the fiscal year.<span>=C2=A0</span></u></p><=
p class=3D"MsoNormal">As
 we shared earlier, NIST is also working on ways to address the=20
increasing volume of vulnerabilities through technology and process=20
updates. Our goal is to build a program that is sustainable for the long
 term and to support the automation of vulnerability management,=20
security measurement and compliance.</p><p class=3D"MsoNormal">With a=20
25-year history of providing this database of vulnerabilities to users=20
around the world and given that we do not play an enforcement or=20
oversight role, NIST is uniquely suited to manage the NVD. NIST is fully
 committed to maintaining and modernizing this important national=20
resource that is vital to building and maintaining trust in information=20
technology and fostering innovation.=C2=A0</p><p class=3D"MsoNormal">Moving=
=20
forward, we will keep the community informed of our progress toward=20
normal operational levels and our future modernization plans.</p></div></di=
v>

--000000000000b7fb420619ae94ab--

