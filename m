Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24642C27C52
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 19:15:15 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.23171.1717701307066193159
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 12:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=WWdhfqR3;
 spf=pass (domain: foundries.io, ip: 209.85.214.172, mailfrom: daiane.angolini@foundries.io)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f64ecb1766so11652035ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 12:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1717701306; x=1718306106; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qa/60KLEmQBhQ/2n15Ws7VTxEEF5OZdG/qIo/KGbpFU=;
        b=WWdhfqR3QRVQNCmFLVtCkLA17hfVYYZhv6UVxTTI9LxNuSRp4IYDg6ylqeWUHOYpdI
         8VFmVLnOBwJzELWdckXCZFDBFUX9ZoHuWxYX7Mnc1qfY6/3ehn4NPVNClAcBc8rJZAZF
         j0zIGErYJzbQxMvaP2W+LTnqo7xg4hRTRF99c5ihLE9SSF6QdpS8X30pCjfq5Xpevm4K
         sxXvJGb18hzjgHp0fmk+RYB9vwA6z6PtFbM8D3H8JIUN6AgPvUQkDda34UnD7ugVG97/
         Ty72FFsalAdUdtjUl/xsADF9lExHFzTaXjwhoty3VChZh9gDIgoCUN87WperR3zGStg0
         rslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717701306; x=1718306106;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qa/60KLEmQBhQ/2n15Ws7VTxEEF5OZdG/qIo/KGbpFU=;
        b=tmLT/OCqq9u0720L2KtbPmXzVwVmMeCtGv17+Qg0daZsPQxzFfdFA3ikcewQ7IDIDN
         gcp837XqpWc8F5thq70LV+qV19Q74oHOa/ks09vryaHrc75yO53ASVoRqIl19rqUhyXg
         InR7xKXdGcX9ToUNmjgAJf7q+QIEiil3rRC4vYgNEEvfHAcvrBnYPaJ0LAHxAVAu4MFn
         cftl3IVaTE1edmr7I6GeO2EhevxzAtVNvtDGABZT0Xuqb4+7YyvE6k05PRcDa/neo/Gp
         C8XzXosYHbvtvU+w+B69yKL4kHa26Jj80hOhaQqV3r/DonPLWJGgPqr7criQNZN41edD
         SQgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKZqBnvR5Viewlh8hMWxVeiL1dAK/eegh0CYvufiaj+ShcFH/4cqzviMt5tfkzsf7+f3LZDsCbyOvGaXyBB6XH2+AZXuS6vxV8+9nXImy56bUUV7sLvfny
X-Gm-Message-State: AOJu0YxOcZzGMHAG8XqJ2iRi/FLKwoBHYjfMQhbXw9MArLmckjpKROwC
	d67NBAELq8wMvPS2lAlzIlzjKBt9kzKTFQgb7mvh9gHxpp9PbSRtDv+SJ4X2RVb0gbZ4+HhXuud
	kJcNBQwkskKOisLFkNxX0SCkdr0v6XsviQy5KkQ==
X-Google-Smtp-Source: AGHT+IFUwMjDNbEZNOvDZTMkobmW8XhNxsqGT6Nse36hxkef9ie2vROrruLNPUKN+bWEFHg7vYwNwKlcKsYKa6cvvFo=
X-Received: by 2002:a17:903:184:b0:1f6:4d2f:c44e with SMTP id
 d9443c01a7336-1f6d02e3127mr4741865ad.21.1717701306312; Thu, 06 Jun 2024
 12:15:06 -0700 (PDT)
MIME-Version: 1.0
From: Daiane Angolini <daiane.angolini@foundries.io>
Date: Thu, 6 Jun 2024 16:14:55 -0300
Message-ID: <CA+HEL78YtRHHdtwHu4+x=5jAEKTV7j0=vyo7NWVQa-2Fm5voZw@mail.gmail.com>
Subject: [OE-core] [kirkstone] gobject-introspection: Do not hardcode objdump name
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000318890061a3d80fd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 19:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200415

--000000000000318890061a3d80fd
Content-Type: text/plain; charset="UTF-8"

I kindly ask to have commit [1] from master backported to Kirkstone (the
commit has been included since Langdale).

I could not find a bug reported associated with the commit, but I faced the
error when using kirkstone.

I'm following the steps 2.1 described in [2]
I also add the link to the patch from ML [3] and to the commit [4].


[1] c04b3e0e371859c159b76bff87a5b1299b51d0c8

[2]
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#submitting-changes-to-stable-release-branches

[3] https://lists.openembedded.org/g/openembedded-core/message/170473

[4]
https://git.openembedded.org/openembedded-core/commit/meta/recipes-gnome/gobject-introspection?id=c04b3e0e371859c159b76bff87a5b1299b51d0c8

BR,
Daiane

--000000000000318890061a3d80fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I kindly ask to have commit [1] from master backported to =
Kirkstone (the commit has been included since Langdale).<br><br>I could not=
 find a bug reported associated with the commit, but I faced the error when=
 using kirkstone.<br><br><div>I&#39;m following the steps 2.1 described in =
[2]</div><div>I also add the link to the patch from ML [3] and to the commi=
t [4].<br></div><div><br></div><div><br></div>[1] c04b3e0e371859c159b76bff8=
7a5b1299b51d0c8<br><br>[2] <a href=3D"https://docs.yoctoproject.org/dev/con=
tributor-guide/submit-changes.html#submitting-changes-to-stable-release-bra=
nches">https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.h=
tml#submitting-changes-to-stable-release-branches</a><br><br>[3] <a href=3D=
"https://lists.openembedded.org/g/openembedded-core/message/170473">https:/=
/lists.openembedded.org/g/openembedded-core/message/170473</a><br><div><br>=
</div><div>[4]<a href=3D"https://git.openembedded.org/openembedded-core/com=
mit/meta/recipes-gnome/gobject-introspection?id=3Dc04b3e0e371859c159b76bff8=
7a5b1299b51d0c8">https://git.openembedded.org/openembedded-core/commit/meta=
/recipes-gnome/gobject-introspection?id=3Dc04b3e0e371859c159b76bff87a5b1299=
b51d0c8</a></div><div><br></div><div><div style=3D"font-size:small" class=
=3D"gmail_default">BR,</div><div style=3D"font-size:small" class=3D"gmail_d=
efault">Daiane<br></div><br></div></div>

--000000000000318890061a3d80fd--

