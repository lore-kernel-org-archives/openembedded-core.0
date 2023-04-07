Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3521C6FD1D
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 05:16:42 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.1103.1680844598636132267
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 22:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NV+GEaHs;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id y15so53270773lfa.7
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 22:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680844596;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T42geDXR+stg7Y79arESL1Zwj539TRldNt9d9qHxaL0=;
        b=NV+GEaHsyPnVLp+tlGu/5tp1uhb69a5aoUN9BbSXZPIP5Cbfi1O1RPpTcu7GRg2edK
         rYK4OvKHhNsvuxrb5/dYD+T6Ix4ljUjf+nsf9td6s3jhXSQNnxSZTIqITtlOeawSOcn8
         pkh4Yr8FXUBhUY5+QAmiOKkh9bgXyMXrsdyNwOOQJJ/B/ayy5c6InEN4g8P5IaiRpLQo
         PLQJk/twvjo7tBCzVLCiUTKQIXirNp50tAGk81i6oRls4EwENw1olKf1BFn9Kw0pbXWo
         kxtu72ItofO/v3Atrr5L5w4iOLFG1q8xjzKvqj+sp5bpIAbwH72TTMxNBpyhBbwZscTK
         rjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680844596;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T42geDXR+stg7Y79arESL1Zwj539TRldNt9d9qHxaL0=;
        b=2fhNbLaJraYAXb6wwnn4F3sHnB54fuyY6/c/+dPJfSmmkCXCsoOak7cg8NdNC+TSys
         pq8Bc6XbEWzCbLsnUUg7LeDnj44Ly5kuzwz5tr62GDoWT16UwNk49JjS8fQtKWRinzbU
         GPsn0YxsyY1szfC0+6xbd3TCOsRfiQ4iEaQAzsBpho8rjrXoM+wqjHfAmdKQV7CwyZjZ
         /+dpw1Vg3MmhDwXelEBtszHTd//xxh3guoeKvPfG+q+/DPiZkIBBLsiU+tE/QbhSNMLX
         xbrthFajtGtqTPlCk1Fjq6tu88N1wqwpUSkI0TP8/A6re56HK5Pk2eO/JfnPWJBNo89F
         mnxw==
X-Gm-Message-State: AAQBX9e0uthBLKo/G0Li3jfZiDDdZoRdvzkcJUtGobG3lsowIZBZWsdt
	foKel6TIa2/aMAKCvbM4N/gwQYr6rhDQmEk8VhchfQzIvPI=
X-Google-Smtp-Source: AKy350Z91Se63QsptX9GPLybQARPxii7TkKWUjFCJowGOL7Ibrh/smm4oEBkvmahI5D2QXBeYks8a2wv0gGmWtHbcwE=
X-Received: by 2002:ac2:5382:0:b0:4d5:ca32:6aec with SMTP id
 g2-20020ac25382000000b004d5ca326aecmr397602lfh.12.1680844595352; Thu, 06 Apr
 2023 22:16:35 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 7 Apr 2023 07:16:24 +0200
Message-ID: <CA+cAkep4o0Ep2VfZrq0jTn_gXvdBuZ9rYC7OgXMCfCHXBf68rg@mail.gmail.com>
Subject: [OE-core][dunfell] qemu-system-native build failure
To: openembedded-core@lists.openembedded.org
Cc: "steve@sakoman.com" <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="00000000000007599c05f8b82174"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 05:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179811

--00000000000007599c05f8b82174
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I came across a build issue for qemu-system-native on dunfell branch when
using spice PACKAGECONFIG.
I found that the culprit is the CVE-2022-4144.patch introduced mid-march
and that was merged in upstream
end of november 2022:
https://gitlab.com/qemu-project/qemu/-/commit/6dbbf055148c6f1b7d8a3251a65bd=
6f3d1e1f622

because it misses a variable declaration:

|   CC      hw/dma/xlnx-zynq-devcfg.o
|   CC      hw/dma/xlnx-zdma.o
|   CC      hw/dma/bcm2835_dma.o
|   CC      hw/gpio/max7310.o
|   CC      hw/gpio/pl061.o
| /home/test/qemu-4.2.0/hw/display/qxl.c: In function =E2=80=98qxl_phys2vir=
t=E2=80=99:
| /home/test/qemu-4.2.0/hw/display/qxl.c:1508:67: error: =E2=80=98size=E2=
=80=99 undeclared
(first use in this function); did you mean =E2=80=98gsize=E2=80=99?
|  1508 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset,
size)) {
|           |
                                ^~~~
|           |
                                gsize
| /home/test/qemu-4.2.0/hw/display/qxl.c:1508:67: note: each undeclared
identifier is reported only once for each function it appears in
| make: *** [/home/test/qemu-4.2.0/rules.mak:69: hw/display/qxl.o] Error 1
| make: *** Waiting for unfinished jobs....
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.

Looking more to the qemu git, I think the backported CVE is not an atomic
commit one
and is a part of larger patches series, it needs at least this one:
https://gitlab.com/qemu-project/qemu/-/commit/8efec0ef8bbc1e75a7ebf6e325a35=
806ece9b39f
to be able to build.

Moreover, I saw 5 commits that were merged by the same issuer and that
seems to
be related to the same code path.

Can someone who knows qemu give advice on what to do ?
Modify the single CVE patch ? take the other commit which corrects the
mistake ? take the whole 5 commits ?

--00000000000007599c05f8b82174
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I came across=C2=A0a build issue=
 for qemu-system-native on dunfell branch when using spice PACKAGECONFIG.</=
div><div>I found that the culprit is the=C2=A0CVE-2022-4144.patch introduce=
d mid-march and that was merged in upstream</div><div>end of=C2=A0november =
2022:</div><div><a href=3D"https://gitlab.com/qemu-project/qemu/-/commit/6d=
bbf055148c6f1b7d8a3251a65bd6f3d1e1f622">https://gitlab.com/qemu-project/qem=
u/-/commit/6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622</a></div><div><br></div=
><div>because it misses a variable declaration:</div><div><br></div><div>| =
=C2=A0 CC =C2=A0 =C2=A0 =C2=A0hw/dma/xlnx-zynq-devcfg.o<br>| =C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0hw/dma/xlnx-zdma.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0hw/d=
ma/bcm2835_dma.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0hw/gpio/max7310.o<br>| =
=C2=A0 CC =C2=A0 =C2=A0 =C2=A0hw/gpio/pl061.o<br>| /home/test/qemu-4.2.0/hw=
/display/qxl.c: In function =E2=80=98qxl_phys2virt=E2=80=99:<br>| /home/tes=
t/qemu-4.2.0/hw/display/qxl.c:1508:67: error: =E2=80=98size=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98gsize=E2=80=99?<br=
>| =C2=A01508 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!qxl_get_check_slot_offset(=
qxl, pqxl, &amp;slot, &amp;offset, size)) {<br>|=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~<br>|=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gsize<br>| /hom=
e/test/qemu-4.2.0/hw/display/qxl.c:1508:67: note: each undeclared identifie=
r is reported only once for each function it appears in<br>| make: *** [/ho=
me/test/qemu-4.2.0/rules.mak:69: hw/display/qxl.o] Error 1<br>| make: *** W=
aiting for unfinished jobs....<br>| ERROR: oe_runmake failed<br>| WARNING: =
exit code 1 from a shell command.<br></div><div><br></div><div>Looking more=
 to the qemu git, I think the backported CVE is not an atomic commit one</d=
iv><div>and is a part of larger patches series, it needs at least this one:=
</div><div><a href=3D"https://gitlab.com/qemu-project/qemu/-/commit/8efec0e=
f8bbc1e75a7ebf6e325a35806ece9b39f">https://gitlab.com/qemu-project/qemu/-/c=
ommit/8efec0ef8bbc1e75a7ebf6e325a35806ece9b39f</a></div><div>to be able to =
build.</div><div><br></div><div>Moreover, I saw 5 commits that were merged =
by the same issuer and that seems to</div><div>be related to the same code =
path.<br></div><div><br></div><div>Can someone who knows qemu give advice o=
n what to do ?</div><div>Modify the single CVE patch ? take the other commi=
t which corrects the mistake ? take the whole 5 commits ?</div></div>

--00000000000007599c05f8b82174--

