Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web10.8342.1588437379567579647
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 09:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tZSnktMw;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id u12so4854211uau.10
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2020 09:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qKE6rdF6fizHzsTUJEXlGNzjdg3IuZSUUUS09sQtxu8=;
        b=tZSnktMwhRea+rU+SoLr8/CmiSs8gH221Wk5f0oySqo/g+LpXJEAAVaMX+yOGyLRD9
         s0eM00497RLzeF8yRjr5U7tgmupLLj0tLAoJUZBNkv159blJ4yDI1oukNHpdVFbENt7H
         ClG+m0Mq/ktrSDx3+QMBS6SwXxJ8sAA+88qD7yVfQtI7aFt4kEqh60eOAYpfPoSBO7Th
         FUvNLadkX+4KL4KJMgdy151fRckFvMRRKMi2D7TE9NfO6YXrWBrm2hPsuIz7Uu0KZPHZ
         Agq4+++PsMJloRXis1KWeCsYqukrpu4544A7Zj0kEvIYE/MhC01pqOpiVnIyyB4ZzYsC
         X9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qKE6rdF6fizHzsTUJEXlGNzjdg3IuZSUUUS09sQtxu8=;
        b=X/Z0aHiG/LIfOB3gvzhbAEIDTmSvTrRaRohVwUjbtUcmtKc4/lY5toQxGqEWZ1MfoC
         nVQk69uJUxinj37Wz4H2hfjtv6k3Nw1GVwuYsvm7eVsTjYJxesV3T8+//424Jzr77EmH
         30VV4LbJ8+Cp0IwPlFxl6I5lF4FXrQvAdgmonKNblsKLKQKNFMCLMXrD7TzKEsDmeZ2O
         YY1GoL9vBZhKAcsHvDqR/J3TtIowHmwtJjA9ef+lKylLg1vz9SqIT1hBPx+i8sQ3jNx2
         8WUsj4aVU8+fgNykvjie8RoqpgMSCvdC2yEo351VyPrqYOeVICXKjaYScW/k5BzfIthl
         wALw==
X-Gm-Message-State: AGi0PuZTwKBZ7soWGBv9ehE9QJTcJW2VRQguoVRky0pOij+DIRC9fNYj
	2FsI40qc7Tfw5B++I5axLhunb7vrZz9UR4QrQORBVg==
X-Google-Smtp-Source: APiQypK0Xwvl6ZqrV8+cu2CiQvdjNhTFUIo5649w7V36791qfmau8KwOwv7laHrq9x9FHTv7te6nFV15w+EfwKA/Ons=
X-Received: by 2002:ab0:650f:: with SMTP id w15mr6104126uam.93.1588437378714;
 Sat, 02 May 2020 09:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <0a65790cfa0f43659d0cec942d729b1a@XBOX03.axis.com>
In-Reply-To: <0a65790cfa0f43659d0cec942d729b1a@XBOX03.axis.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 2 May 2020 18:36:07 +0200
Message-ID: <CANNYZj82SMaMu2rWRHnaVWegjWhjZTLMLQeX31HEqCG3j7H9UA@mail.gmail.com>
Subject: Re: Failure when generating image with latest OE-Core
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "OE Core (openembedded-core@lists.openembedded.org)" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b4d08005a4ace51c"

--000000000000b4d08005a4ace51c
Content-Type: text/plain; charset="UTF-8"

I haven't seen this, and neither has the autobuilder. Could this be caused
by something in 'internal package'?

Alex

On Sat, 2 May 2020 at 18:27, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

> After upgrading to the latest master of OE-Core, I get the following
> error when building an image:
>
> DNF version: 4.2.21
> cachedir: <image workdir>/rootfs/var/cache/dnf
> Added oe-repo repo from <image workdir>/oe-rootfs-repo
> User-Agent: falling back to 'libdnf': could not detect OS or basearch
> repo: using cache for: oe-repo
> oe-repo: using metadata from Sat 02 May 2020 04:04:01 PM UTC.
> Excludes in dnf.conf: rng-tools, shared-mime-info, udev-hwdb
> --> Starting dependency resolution
> History database cannot be created: <image
> workdir>/rootfs/var/lib/dnf/history.sqlite. Error: SQLite error on
> ":memory:": Executing an SQL statement failed: no such column: 1.2
> ---> Package <internal package> <version> will be installed
> History database cannot be created: <image
> workdir>/rootfs/var/lib/dnf/history.sqlite. Error: SQLite error on
> ":memory:": Executing an SQL statement failed: no such column: 1.2
> Error: SQLite error on ":memory:": Executing an SQL statement failed: no
> such column: 1.2
>
> I assume it is related to the recent rpm/dnf update.
> Any ideas on what's going on?
>
> //Peter
>
>

--000000000000b4d08005a4ace51c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I haven&#39;t seen this, and neither has the autobuil=
der. Could this be caused by something in &#39;internal package&#39;?</div>=
<div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sat, 2 May 2020 at 18:27, Peter Kjelle=
rstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellersted=
t@axis.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">After upgrading to the latest master of OE-Core, I get the follo=
wing <br>
error when building an image:<br>
<br>
DNF version: 4.2.21<br>
cachedir: &lt;image workdir&gt;/rootfs/var/cache/dnf<br>
Added oe-repo repo from &lt;image workdir&gt;/oe-rootfs-repo<br>
User-Agent: falling back to &#39;libdnf&#39;: could not detect OS or basear=
ch<br>
repo: using cache for: oe-repo<br>
oe-repo: using metadata from Sat 02 May 2020 04:04:01 PM UTC.<br>
Excludes in dnf.conf: rng-tools, shared-mime-info, udev-hwdb<br>
--&gt; Starting dependency resolution<br>
History database cannot be created: &lt;image workdir&gt;/rootfs/var/lib/dn=
f/history.sqlite. Error: SQLite error on &quot;:memory:&quot;: Executing an=
 SQL statement failed: no such column: 1.2<br>
---&gt; Package &lt;internal package&gt; &lt;version&gt; will be installed<=
br>
History database cannot be created: &lt;image workdir&gt;/rootfs/var/lib/dn=
f/history.sqlite. Error: SQLite error on &quot;:memory:&quot;: Executing an=
 SQL statement failed: no such column: 1.2<br>
Error: SQLite error on &quot;:memory:&quot;: Executing an SQL statement fai=
led: no such column: 1.2<br>
<br>
I assume it is related to the recent rpm/dnf update. <br>
Any ideas on what&#39;s going on?<br>
<br>
//Peter<br>
<br>
</blockquote></div>

--000000000000b4d08005a4ace51c--
