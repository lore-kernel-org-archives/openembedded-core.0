Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0925BC77B73
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 07:27:17 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.2526.1681975635875052567
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 00:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=aejIq2/f;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2a8dc00ade2so3308301fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 00:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681975634; x=1684567634;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZqqpXUBIjdNVW1Nz9inkgA0XmAb9dzQawDY3safmKrs=;
        b=aejIq2/fc0FN03YH5rS9tooEBoZSdkK3DdCOVas/1C2Yb8RPMZU7s+zD1tlrrNU+Y5
         JalVDALWVeU+oArowHel2+uLVkjQ2HDJaLI879WKX/f6fj80Rri4nbA+1VS4P0g+leNO
         VFVrRCJS/L+ihiARYF7UtKXl/cGhvvo5eGB4ItVXYXnbdBbsf69JSUxfAthyj71Fdo+p
         givQUT2cyagxQu7a/QZzoaMuHvleVTmsVXgrA5bRBaT9ltxEKZWYpttIsqdpewfdFasf
         4iMK4XXZYsreKB5ls6r3P1GLB5hs270M9DLmGiIKL6n1HGdNj+S+Q2xYDCuhOfY01+Fp
         BOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681975634; x=1684567634;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZqqpXUBIjdNVW1Nz9inkgA0XmAb9dzQawDY3safmKrs=;
        b=iJjjEajoNR0eCrAUbEJ9IX+yIKpRFN+o+ZsFumDR0BLq5+JLu/G2w3nBD0OV99Z3V5
         aHdax+h+iwR0wZq4eGMpK+g9QM5Bm4vtqRSCbMTpobIg4im5jCK2luROZclLrTSxcQyN
         HmF+8Z59PjmqNV3e8Sr0x1Ww7kBG6X9KebcEXKtZYQqgH34P4qqcNo9N1G8IW2HXZL3f
         Bg1rapdqNOc7r7+gRXDrC4CpIE4cT6PREhruUjwx+QNr7E8ij7yJZ2REwQ6uEs3rCCBY
         b5NRbNJJL7XNNolG4nCLw9rJjDi1Xej0xUirVCVjBMajW3A9A3bLZZ+5qtdxgdbxPq6H
         Sy2w==
X-Gm-Message-State: AAQBX9f+y0T/sSnbfbf/ZSyE/MOlri+ZC1aApgSDoQZgRyLcKqPjzXNb
	M1Q+o/fEhANY6YuIA33FYXkqclcYpFmKHUGViMtsic/q
X-Google-Smtp-Source: AKy350a7xpQUMK6fhDHzzhTI0F0aUBlsiiDE77M0Ha9BBzdny/wiWKwoUI+ZRK3oq8OkHeMiqcqBvxiWgjxCoHZo6vE=
X-Received: by 2002:ac2:5929:0:b0:4ee:8ff3:c987 with SMTP id
 v9-20020ac25929000000b004ee8ff3c987mr96422lfi.12.1681975633382; Thu, 20 Apr
 2023 00:27:13 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 20 Apr 2023 09:27:02 +0200
Message-ID: <CA+cAkepE6FLo7L8N0FG-39CfFfLgK9RPFH0qvi+dRNOY5gpXRw@mail.gmail.com>
Subject: Cargo and ptest
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000260fb805f9bf7876"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 07:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180238

--000000000000260fb805f9bf7876
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to build and ship tests for recipes which uses cargo and in
the process, three questions arose (maybe more when I will progress).
I would like to have your opinions on them.

1) should we ship cargo-native in ptest images or should we just build and
ship test binaries alone ?
2) should we place the cargo ptest specifics in a dedicated class (e.g
ptest-cargo.bbclass, like already existing ptest-gnome or ptest-perl) or
put this in cargo.bbclass itself ?
3) should we embed all kind of tests (unit, integration and doc tests, see
https://doc.rust-lang.org/book/ch11-03-test-organization.html) or just the
unit tests ?

Thank you very much for all insights you could give on this matter.

--000000000000260fb805f9bf7876
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,<div dir=3D"auto"><br></div><div dir=3D"auto">I wou=
ld like to build and ship tests for recipes which uses cargo and in the pro=
cess, three questions arose (maybe more when I will progress).</div><div di=
r=3D"auto">I would like to have your opinions on them.=C2=A0</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">1) should we ship cargo-native in pte=
st images or should we just build and ship test binaries alone ?=C2=A0</div=
><div dir=3D"auto">2) should we place the cargo ptest specifics in a dedica=
ted class (e.g ptest-cargo.bbclass, like already existing ptest-gnome or pt=
est-perl) or put this in cargo.bbclass itself ?</div><div dir=3D"auto">3) s=
hould we embed all kind of tests (unit, integration and doc tests, see <a h=
ref=3D"https://doc.rust-lang.org/book/ch11-03-test-organization.html">https=
://doc.rust-lang.org/book/ch11-03-test-organization.html</a>) or just the u=
nit tests ?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you ve=
ry much for all insights you could give on this matter.=C2=A0</div></div>

--000000000000260fb805f9bf7876--

