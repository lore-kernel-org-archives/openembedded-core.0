Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1CDC43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 19:03:30 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web12.134.1657825406031385756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oin2Nek+;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id x91so3637541ede.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=kbwtSq4dZapasA+h4Xs2uy34d10wlW9nn5TeKg9AfHk=;
        b=oin2Nek+9iUmXz0Qe/tZdskNe3FHoona2/U+kb/CRDp8wDvKC4lNN2C/ngPqOhaf5T
         rJV/H7SKpkNYMwsv0zAopgD7SFg5uEBkAoHqdw4vwwg+mF/o/s6lih0yoSc/kNXoNN/T
         UXhWKensBbmPZIqI1xnlVfGpzCwAySfnxdWGlTpolh3gtMkOkmX/R11gN5PvmzAWGpq0
         Ui6h3o/5vkywVqJqG8bcqKZXGpO/4gdYIfJuqsWX1Qrej4FVWneCFJUQStK0uTMi9LgO
         gO2IfO03Rn5V6wNf+thfFWJ3FyhMdGsEO8An7UMUPPrlZDRjC+HYqVvGtrZtb1r3sr3L
         izRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=kbwtSq4dZapasA+h4Xs2uy34d10wlW9nn5TeKg9AfHk=;
        b=R0B1CIrgnGp3QKIp2e8l+T4a0Wfmgqgm5k3bQSghpJjguPEWrPMxm1IgKIK6w4JtPf
         BX4BPO9UnMLXAw8dw22umPNvsp++ZNzI3HpaTzD/QqJ1qsaMO8uIplbBW5aV4kdpdrBu
         tLsECqanXFQnB9Ah4R/f5BN+OqGcCnaduSXnxYkkCYyHuSF0Z2JlcLqqevqq5BNQY+ef
         BKn28bIXyI7No7rhiz7DNxgwfULaRUx3p0SFiDVkWameiddK79WFkUOyacQ/1rO+QQ4z
         1doReVl9msuCL3LmsTNQBqCl9tqlwLhCSXraYlFOOgAKUAFZMeLcRH8hPM+/s/cIqKaQ
         Pm4w==
X-Gm-Message-State: AJIora/M0QlGazKrx0CIV3vO5QxE282Np2YmqK2MpqSOWKJlGu294R2f
	Ny/Scv0LyqB7XhR4yXLmgRprqSiRkTTLk6QhrzDTkbUoMuA=
X-Google-Smtp-Source: 
 AGRyM1uFftlatUHt1geM3R5Y23gUFGrCsyJDoz09fxj8hHnwipKO2DfMgWMMEzavscy24Zu1Fzs7yd/4WxcsdR8SS38=
X-Received: by 2002:a05:6402:520c:b0:43a:aba8:84ae with SMTP id
 s12-20020a056402520c00b0043aaba884aemr14682635edd.198.1657825404004; Thu, 14
 Jul 2022 12:03:24 -0700 (PDT)
MIME-Version: 1.0
From: jan vermaete <jan.vermaete@gmail.com>
Date: Thu, 14 Jul 2022 21:03:13 +0200
Message-ID: 
 <CABF_=yge_DgiH6+MzKNooWYSkks5=zJu=V23FKpx1v-1j=UCBg@mail.gmail.com>
Subject: python3-jsonschema: is ${PYTHON_PN}-setuptools-scm still needed?
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004e2e8405e3c88e33"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 19:03:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168038

--0000000000004e2e8405e3c88e33
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I think the RDEPENDS on ${PYTHON_PN}-setuptools-scm is not needed anymore.
Could this one be removed?  And how to test it?

br

--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

--0000000000004e2e8405e3c88e33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I think the RDEPENDS on=C2=A0${PYTH=
ON_PN}-setuptools-scm is not needed anymore.</div><div>Could this one be re=
moved?=C2=A0 And how to test it?</div><div><br></div><div>br</div><div><div=
><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature">Jan Vermaete<br>=E2=80=9CSuccess is a self-correcting =
phenomenom.=E2=80=9D -- Gary Hamel</div></div></div>

--0000000000004e2e8405e3c88e33--

