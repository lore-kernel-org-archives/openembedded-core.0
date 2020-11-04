Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.10222.1604478435440752476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 00:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@balena-io.20150623.gappssmtp.com header.s=20150623 header.b=u7eDWxxa;
 spf=pass (domain: balena.io, ip: 209.85.218.51, mailfrom: florin@balena.io)
Received: by mail-ej1-f51.google.com with SMTP id i19so17523818ejx.9
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2020 00:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=balena-io.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=QxPByu3mtKzccaHRLvHPZqG24ftRC6vzYJIZEkcNyZw=;
        b=u7eDWxxax3X+iH0gxoYe104JJBQVgqg9xjf0jB73yd7v6VCMcpfG1cbSjoCp9b2/wI
         WztMuOu/KszaEeotNf0vcD1tpY0G15gPZOXg+PAs9K7VcWgofd2YyvywR3VmFwz5mRqW
         ktgOwEBLGhMYaFAh+Zv4ITcjZ2WR+5qAtmEQUzZESoKMkGTgEcFFEUnnxBrrs34FqqC1
         4j4HSD4zzvBxuQS2zVDMFJBUYtsrJ0gF6mt1KaxCNSHrjDCt/rSF9v3zIbKBM2kwDWb6
         /vpdLPk1WJbQ8Bf5r+rAT6NYAnmktvnf++VfV/XOWo3g/AjL9OK1GP9ZhlC+CLi+lzc2
         rVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=QxPByu3mtKzccaHRLvHPZqG24ftRC6vzYJIZEkcNyZw=;
        b=KiX9FMCA3+k6AJTKIuRWY90oRA1GmtbsHdmoXBOOLeB6YuED5RCIchaiedBRJI1pf9
         nTY62Uu9Syx7XcSkqCB+433UPmDVW7ZyRqlplVpk653lYgsYO6okGgsLf1kCnlU1vd53
         VqDG2RJ74o6DNRREu1KzazdOeMPmgWX2harMO2alymY2W8XoK+PZR0EGOWGqhcsDF7zP
         tSRRdwptqxCmvwMnLVBKt6bJPRfOCERUK8QGacpnPjveMoQo/uZfgm3E338kzVdRg6Hf
         gqi9knI7bC3TI+6RT4TTTYiFop3V5TD2s+n/ivqPUiXaKjnimxznI46Z18c72z2bxolC
         ZQeA==
X-Gm-Message-State: AOAM532UAxrnrxttXBwOc19ycA23/KMWq/b5ipf5gRDzFm5xAfUM7ggZ
	tVzYWbXKEjOIq1u4lgFIcR9o0DMzzXXApAqeSzwWbXbklaHhUUWT
X-Google-Smtp-Source: ABdhPJzWtlXrrCZlEvlK3fjUHYMwZWuKGB1VF/edR0mQS1WgzwkyvxV8xmH/f71R+QOa/4YAF1AnwIaewS+J6gXyh14=
X-Received: by 2002:a17:906:3a97:: with SMTP id y23mr23908699ejd.250.1604478433387;
 Wed, 04 Nov 2020 00:27:13 -0800 (PST)
MIME-Version: 1.0
From: florin@balena.io
Date: Wed, 4 Nov 2020 10:27:02 +0200
Message-ID: <CAGHO4hUyy=XL-iKKty+qLBG7cOoh97Yy1eFspoB_mQvnqySajA@mail.gmail.com>
Subject: Backport 05043a26cc297ed9834055678ac699e20e2f16d5 to warrior
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000012838205b343bf84"

--00000000000012838205b343bf84
Content-Type: text/plain; charset="UTF-8"

Hi, we'd need 05043a26cc297ed9834055678ac699e20e2f16d5 to be backported to
warrior.
When this is backported, will this result in a new release tag? Or does
this typically get merged first to warrior or warrior-next and a release
tag follows only later on?

--00000000000012838205b343bf84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, we&#39;d need=C2=A005043a26cc297ed9834055678ac699e20e2=
f16d5 to be backported to warrior.<div>When this is backported, will this r=
esult in a new release tag? Or does this typically get merged first to warr=
ior or warrior-next and a release tag follows only later on?</div></div>

--00000000000012838205b343bf84--
