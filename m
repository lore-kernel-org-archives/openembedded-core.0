Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC04BC77B61
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 15:21:25 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.11033.1680880875110541703
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Apr 2023 08:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UFUsunyO;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id a44so25184034ljr.10
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 08:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680880873;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FjmL/1DcIsHUsu4hzbV87zAUE8LdZ8RkYW24lgK0w/s=;
        b=UFUsunyOlFuZEY746RCX7ohIsHzgoKaHbOT9jojU3swSfLeIUqLC6sHBXRnzN2YVow
         2Nxz2dZsAfFjnTuBnYMSMuxpy8qVafrhDsrItQl2LTD3ZkVhCmqg/lXH0iw+CWgGsXmw
         QGYebDsdRU/PCPPzzlPkKJy8yjA4AY6IcDlG5DiP6ZOQob4Bj4XkscAkx2sFpm/OiyRo
         W8SliQhIPgB7xkltu7wVwxHjSMCKW6k2c5QNY0g/lNyawMYfzXhGl8hJ+l1DoYpeQXb4
         BlenTnekPbkEd8WHDDucgRb/UVVu/H9caMEWt+6QIcGHuGwJHiuObiLML9oZ6PWdy3OP
         NtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680880873;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FjmL/1DcIsHUsu4hzbV87zAUE8LdZ8RkYW24lgK0w/s=;
        b=3j2UCZLWsTZSF06tqp6lOvYMRIEQmxByFNGuHW98rggDZe4Cv3MxUN/PUe+RpbhSrI
         chYlDvtXO448pFxLcVXmUhRCkJo0rbt9z3p0plchvS428OYENzxJJFS0IN8ICOiNtcFm
         KCPe6w7rBNKUNcwIhVV1k5TCrrzeLT46W1w4ehv6/VwNNEi7PgofjrlBe4usDYWJrjwV
         pWeJcT6dS09LvynB0J2cOcdUT5WfJD2q3PEYf46V7GUC6ocEgUBdUC0WOOZVYS0UahBz
         jrxOuGV+AV2/izHyWS87NJS//A2OkDsS72Iq4QMjito8JAx/vNicy3qsJK3DGMSVkNy0
         phEw==
X-Gm-Message-State: AAQBX9e6GZyZ6YcUqq3G4C+rXdZEgJPYV7u/PcbwiSifZwqA3KeM8AMY
	jYqEap9MqzV9VkWMjasbaabY1d6xXnF/gu1M2U2bhgC8qIs=
X-Google-Smtp-Source: AKy350a5lQOoMDIECfBKqotQxplIIol8sYItNM7Kpqm2cAQQCtAnUjNkJ+8IfXl1D56dqstn3I8ota7/NBx1nqttuN0=
X-Received: by 2002:a2e:7019:0:b0:29f:caf0:f77f with SMTP id
 l25-20020a2e7019000000b0029fcaf0f77fmr661989ljc.3.1680880872598; Fri, 07 Apr
 2023 08:21:12 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 7 Apr 2023 17:21:01 +0200
Message-ID: <CA+cAkepjPjqTHHwxkKv-9xJHZMoBToUpAvg+tyGKQo6KDN-89A@mail.gmail.com>
Subject: Reproducible build
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000522f9705f8c0932c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 15:21:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179826

--000000000000522f9705f8c0932c
Content-Type: text/plain; charset="UTF-8"

Hello,

I plan to work on https://bugzilla.yoctoproject.org/show_bug.cgi?id=15090
in the coming days.
To show how things are tested I ran "oe-selftest -r
reproducible.ReproducibleTests.test_reproducible_builds" but even on a
strong machine, it took several hours (I waited for 6h and it is not
finished yet).

Does anyone know if it is possible to test reproducibility on a single
package (here, zvariant) ?
Should I tweak the python test class or is there a simple way ?

Thanks

--000000000000522f9705f8c0932c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,=C2=A0<div><br></div><div>I plan to work on=C2=A0<a =
href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090">https://=
bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090</a>=C2=A0 in the coming d=
ays.</div><div>To show how things are tested I ran &quot;oe-selftest -r rep=
roducible.ReproducibleTests.test_reproducible_builds&quot;=C2=A0but even on=
 a strong machine, it took several hours (I waited for 6h and it is not fin=
ished yet).</div><div><br></div><div>Does anyone know if it is possible to =
test reproducibility on a single package (here, zvariant) ?</div><div>Shoul=
d I tweak the python test class or is there a simple way ?</div><div><br></=
div><div>Thanks</div></div>

--000000000000522f9705f8c0932c--

