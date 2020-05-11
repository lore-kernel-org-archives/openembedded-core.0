Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.8576.1589187818505663499
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 02:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qZsYyk/b;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: mhm.dawod@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id y6so7541566pjc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 02:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=YKJ4OuSzTwfZ9XSiqFON8yU1nASmUyKwYR/fQBgmTFU=;
        b=qZsYyk/bC6Y3j3cmmy2u/nufj3RprV47xhKjpLI56RNqi4Jxm3rGLoRtCbhUGNodXE
         uXrrQ9Ghg5U57MEQQJynR4nN/ApKtvnNDnWF07zE88gfAQAYpiaSNzWkFcAuniS5XbWn
         W25pB5fE/lMeBTVxpMQU9k6TQKxsjLLXDHSDdQMlgmnKzAzQMFwvrPR9GQxMfGkv4Sw4
         8OnHM6O79C1epn8QjTjUvSHlwUknvVPrH3+PRAoay5bKQHDjr30OVqQQUtFxnxf9qXMR
         CyOsLFopPhczC2BFv8DV4tvt3OPbb9wKf3ecdVv8DF9uK3vtRTio1DlbgCUBrXdcmssn
         s/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=YKJ4OuSzTwfZ9XSiqFON8yU1nASmUyKwYR/fQBgmTFU=;
        b=dOXD9r6Nuh//Fs9AB6FvD3lZ8QW585I2hL6oSJcAP5AU7ovfZnAhq4t43SkI0DfkM5
         dbe5zK321VAsRmMzUtyiX40EdOUZamqP9oRNoN9srdYE3tB6QjQEjPq+1rH6J+sKSZxF
         PeJw1e6rqsWT6BBdKP1jej4PoyFhoFBOZs/QSKG/rAUQwWS/G54arCcpHwg/pVAP9N70
         wsdojDgR11qYcyb1QYyICYum4NJlWcKXa4QQZ2uGbkoN2Rd0nRnP4/LNBtLrb5XgXPYy
         qdJuRGI3gQCVHspPY3dxn9eVgUyn4K6vL4XgvkDt7d2qPty6wyx3RoMgl1JYGQk3xLSY
         lLfw==
X-Gm-Message-State: AGi0PuZ4oRih3phJx19QyZfZFnpTyhlpm1we4F3VdMyImkAPzxQ5f8AL
	pEk+4Cet6RLz7IprVgfZpVr1Y4RGRaYJacEp2LVhOynD
X-Google-Smtp-Source: APiQypIwIYHbJGHML2x5wvzEMOzs9XVLUhJDqDtlAuTZGzA7onZr7Us8Az5nRJZCTVwYXGLh3CPphTw9tXeoausG/NQ=
X-Received: by 2002:a17:902:c3d3:: with SMTP id j19mr13679834plj.340.1589187817537;
 Mon, 11 May 2020 02:03:37 -0700 (PDT)
MIME-Version: 1.0
From: "Dawod" <mhm.dawod@gmail.com>
Date: Mon, 11 May 2020 11:03:26 +0200
Message-ID: <CAGCTLNQW1WWHmy1zaE+LF-AKBQa-UpY8sfOy=HH3tt0rJLJFLg@mail.gmail.com>
Subject: [oe][yocto][bitbake] Fetching source using different protocols
To: openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005885ae05a55b9f37"

--0000000000005885ae05a55b9f37
Content-Type: text/plain; charset="UTF-8"

Hello,

I need to fetch a git repo using 2 different protocols ( ssh & https )
So that when I run bitbake, It will fetch using ssh protocol first and if
it fails to fetch, It will try to fetch using https protocol.

can I do some thing like that or I will have to change it manually every
time ?

Thank you,
-- 

Mohamed Dawod
Computer Engineer

--0000000000005885ae05a55b9f37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I need to fetch a git=
 repo using 2 different protocols ( ssh &amp; https )<br></div><div>So that=
 when I run bitbake, It will fetch using ssh protocol first and if it fails=
 to fetch, It will try to fetch using https protocol.<br></div><div><br></d=
iv><div>can I do some thing like that or I will have to change it manually =
every time ?<br></div><div><br></div><div>Thank you,</div><div>-- <br><div =
dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=C2=A0<br>M=
ohamed Dawod<br></div><div>
Computer Engineer<br><br></div></div></div></div></div></div></div></div></=
div>

--0000000000005885ae05a55b9f37--
