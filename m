Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.3552.1585048297921996027
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 04:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=Un+kIs0O;
 spf=neutral (domain: kynetics.com, ip: 209.85.208.43, mailfrom: diego.rondini@kynetics.com)
Received: by mail-ed1-f43.google.com with SMTP id w26so13862335edu.7
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=2WPpKYrpiwX1xUFbTRxEiuQsQrF26/wz0fEh2SgjmnU=;
        b=Un+kIs0OHzi4O6QRSvPlVbTnk4Or+3Wybk3jtZR9oOQi1GAmxUSxk6TgD51wLyR2Qj
         51tt9z4UxN4ZUE+BjsZ+7vxbHDuZYEGbhWeFvPN5bqAH6/hLRuNBiGtMeBTxyJQno3Yg
         b/eO+/gxyFOu/wejbkgGoLgGBt+VFvOajCGXW3STi12lyqaY+3VmrJXco00TUIv+9tfj
         AtiI/MSdMtH40bB5WWb+nQkdW6I58Ma4B6rGarbEPv1PaJ8OARAc4E5xJYoa5voUtdjB
         f23SLpMrjGgs4KSsBjFcoGEcC2mW0ZdVHTSRLUpbajqN96/GKXPjQSorOrQrcbPPYKfm
         4+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=2WPpKYrpiwX1xUFbTRxEiuQsQrF26/wz0fEh2SgjmnU=;
        b=hm+wTzy1Rj5ZQ43sAox4QXDL5tHt6He/T856g+oJoh2PMT6jXHp8zwl/FRJENue/4N
         U/NdjbRybFesWpT9p8LGJL2qQw1Fuz+wXYZM2tbkCaRYLg/1dT9Dw9OX6XdWl2GOPRIc
         YmljK4BJmkmT1KuIxe/wnzGYgjqqnlV8q0Vowjmo0sJE2D2CLwF+uwPeqMuRmkXl62DU
         +c4hM1kPKMeY2fEhcSC1WSrffWpy3pw7mjHc1FIGGVm7Af+HFp4CSuFvg5HhhumuElGy
         /PJfxjmV7PeQsGmwvEIz6blMH2AXM3zs7hp4Owp8Enb0vV569G7MDfbknReh0pa2Vnfj
         JS8w==
X-Gm-Message-State: ANhLgQ27Q/5gGRV7m8NKRyYBOUTgf3/ER3bRd6CAk0NiMpzxUB6/ZW6y
	LqNnlPeWputupQXNjUioAa+AiWACBthTnJWFYLkNLJqR3P8=
X-Google-Smtp-Source: ADFU+vsmrhos23iE31YTKAuqnpLzvjNGzkSbmMe8f+CNQacJDMr3lVP7qJ+E5ICLkNkukiR19L4j92h538DLvMumQiA=
X-Received: by 2002:a17:906:30d9:: with SMTP id b25mr12855356ejb.168.1585048295961;
 Tue, 24 Mar 2020 04:11:35 -0700 (PDT)
MIME-Version: 1.0
From: "Diego" <diego.rondini@kynetics.com>
Date: Tue, 24 Mar 2020 12:11:25 +0100
Message-ID: <CAMfw5YqoLWdHLxcJNAfz8CxVd9GanYgZJV5B76wgPF1fgzK=zg@mail.gmail.com>
Subject: python3 and util-linux dependency loop
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a20b8005a197d01a"

--000000000000a20b8005a197d01a
Content-Type: text/plain; charset="UTF-8"

Hi list,

I'm trying to enable the pylibmount PACKAGECONFIG of util-linux.
Unfortunately this seems to uncover a dependency loop:
python3 depends on util-linux:
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3_3.8.2.bb#n69
while util-linux with pylibmount enabled depends on python3:
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-core/util-linux/util-linux.inc#n123

What do you think is the best approach to solve this dependency loop?

Thank you,
Diego Rondini
Sr. Embedded Engineer

Kynetics
www.kynetics.com

--000000000000a20b8005a197d01a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi list,</div><div><br></div><div>I&#39;m trying to e=
nable the pylibmount PACKAGECONFIG of util-linux.</div><div>Unfortunately t=
his seems to uncover a dependency loop:</div><div>python3 depends on util-l=
inux:</div><div><a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/poky/=
tree/meta/recipes-devtools/python/python3_3.8.2.bb#n69">https://git.yoctopr=
oject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3_3.8.=
2.bb#n69</a></div><div>while util-linux with pylibmount enabled depends on =
python3:<br><a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree=
/meta/recipes-core/util-linux/util-linux.inc#n123">https://git.yoctoproject=
.org/cgit/cgit.cgi/poky/tree/meta/recipes-core/util-linux/util-linux.inc#n1=
23</a></div><div><br></div><div>What do you think is the best approach to s=
olve this dependency loop?<br></div><div><br></div><div>Thank you,<br></div=
><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_si=
gnature"><div dir=3D"ltr">Diego Rondini<br>Sr. Embedded Engineer<br><br>Kyn=
etics<br><a href=3D"http://www.kynetics.com" target=3D"_blank">www.kynetics=
.com</a><br></div></div></div></div>

--000000000000a20b8005a197d01a--
