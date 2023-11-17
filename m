Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EBEC072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 15:51:15 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.14410.1700236272378048806
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 07:51:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T9XeyZoq;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-67131800219so11137876d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 07:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700236271; x=1700841071; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HTFqV7iuE3NxZvFElAAolxLJbDBeAYtpSFWwOkIhNzw=;
        b=T9XeyZoqe69nXfHtdqsA8E53SBJZP5pTer9i1alC/EzmMkporMiCYmt8UlRJReAogD
         JMzmuMOeh0FpH1WLXnQbXoYUTYKcE2e+4YihKvM4Of44sYAexVHz4jFR/ZWjGxhdT1fJ
         QfHJeXdvhDxsHVCcY40fp+XI4Q9NOuRaYBjjApizcXk9G5hX7PaPANEQhu6i/M5q9Ytu
         agsvwJVEnsmG1Mj9BBYEzfOp/+sm5Xgs4LP/qbHl84tfds4n81GdVcP4c+6wHNtFBhsK
         /i79KGF908trTAGOEi0ohG8+nj6lE+3O6TvRcq1qUyfmvc0kcvVaBz1Qxm3bPSwDDiYU
         vZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700236271; x=1700841071;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HTFqV7iuE3NxZvFElAAolxLJbDBeAYtpSFWwOkIhNzw=;
        b=CExf5DHaQ71yww9hbw+aIqYlei9kZLUR+C20z6HXzJlRuNGAt3ALors8jnNdhcfswv
         hgfNZKbfekdgzx8oUEtnlLqnQQ4eSH7ZLEzGXQ0k9pAxcUhO+cik+Sy8JIs5EQG4biF1
         qosp9PCCvjCLspMyJIuyMr4qNQiq5zZ9b6W4rH0Yy9scIXP/12MwQbcVedI/Q2Rc8B9+
         j6/DqAlrPAD/uMqJMp4SWqzVK2yv+QNpzeJl95VGYJTYKMWr3p81EVqBLhob3mR+NBTA
         Dbjt4Mf90qpmOjNWmJii49etUvShDyc0cKf5kfAD0yUsg/RRztcm3MoipSOBu5cfml2E
         UfTw==
X-Gm-Message-State: AOJu0YyprTGtLcR2QJXlJuZVafc3YnRyWSy7/Etj9BH4RRNNUZS2Ndt6
	BTytVSsYjnf6gmN+fKUtbvsSSKL6zuGqiVkb1sRdYLPg+TE=
X-Google-Smtp-Source: AGHT+IFj6veFwzrLIKfQ68enveBMpv4h2K/umTOY8sQZMi8BLWyfuRF9wzNpAb9e3VJEuz3R7us/3Pa07LUfr+qKczE=
X-Received: by 2002:a0c:b341:0:b0:677:f830:83f0 with SMTP id
 a1-20020a0cb341000000b00677f83083f0mr1578778qvf.8.1700236271287; Fri, 17 Nov
 2023 07:51:11 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 17 Nov 2023 16:51:00 +0100
Message-ID: <CA+cAkeorg-Xfi25GsXnY39kuu20yHyNhXzkk=AXPmJAQjZNJUQ@mail.gmail.com>
Subject: Migration dunfell to kirkstone , init manager issue
To: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fc02b4060a5b1acb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 15:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190853

--000000000000fc02b4060a5b1acb
Content-Type: text/plain; charset="UTF-8"

Hello,

I recently started upgrading my system from dunfell to kirkstone and I
started with a basic (but custom nonetheless) qemu image that I used in
dunfell (before starting machine/distro specific ops).

After several corrections , many thanks by the way for the various
convert scripts !, I managed to get my qemu image built on kirkstone.

But when I didn't manage to boot it correctly (I used qemu-system-x86-64 of
my  host)  and every second on prompt I got these messages

process '-/bin/sh' (pid 143) exited. Scheduling for restart.
process '-/bin/sh' (pid 144) exited. Scheduling for restart.
process '-/bin/sh' (pid 145) exited. Scheduling for restart.
can't open /dev/tty2: No such file or directory
can't open /dev/tty3: No such file or directory
can't open /dev/tty4: No such file or directory

I looked into it more and found that the init system is set to busybox
(/sbin/init point to /bin/busybox.nosuid).
My system needs systemd as init manager  and I verify that I have set
INIT_MANAGER="systemd" in my configuration (I even perform a bitbake -e to
check that this is not overridden).

Can someone please tell me where to look (which log file, or some oe tools
that I can use)  to find why systemd is not used as the init manager ?

Thanks.

--000000000000fc02b4060a5b1acb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I recently started upgrading my =
system from dunfell to kirkstone and I started with a basic (but custom non=
etheless) qemu image that I used in dunfell (before starting machine/distro=
 specific ops).</div><div><br></div><div>After several corrections , many t=
hanks=C2=A0by the way for the various convert=C2=A0scripts !, I managed to =
get my qemu image built on kirkstone.</div><div><br></div><div>But when I d=
idn&#39;t manage to boot it correctly (I used qemu-system-x86-64 of my=C2=
=A0 host)=C2=A0 and every second on prompt I got these messages</div><div><=
br></div><div>process &#39;-/bin/sh&#39; (pid 143) exited. Scheduling for r=
estart.<br>process &#39;-/bin/sh&#39; (pid 144) exited. Scheduling for rest=
art.<br>process &#39;-/bin/sh&#39; (pid 145) exited. Scheduling for restart=
.<br>can&#39;t open /dev/tty2: No such file or directory<br>can&#39;t open =
/dev/tty3: No such file or directory<br>can&#39;t open /dev/tty4: No such f=
ile or directory<br></div><div><br></div><div>I looked into it more and fou=
nd that the init system is set to busybox (/sbin/init point to /bin/busybox=
.nosuid).</div><div>My system needs systemd as init manager=C2=A0 and I ver=
ify that I have set INIT_MANAGER=3D&quot;systemd&quot; in my configuration =
(I even perform a bitbake -e to check that this is not overridden).</div><d=
iv><br></div><div>Can someone please tell me where to look (which log file,=
 or some oe tools that I can use)=C2=A0 to find why systemd is not used as =
the init manager ?</div><div><br></div><div>Thanks.</div><div><br></div><di=
v><br></div></div>

--000000000000fc02b4060a5b1acb--

