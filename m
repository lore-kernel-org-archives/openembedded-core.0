Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web12.4003.1587862376201167475
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 17:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Cq4I6pPB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.210.49, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-ot1-f49.google.com with SMTP id g14so19734790otg.10
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 17:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=OQMSueteSCX+ghGioW1e/a4sKabIQfucBxnMzoG7f7E=;
        b=Cq4I6pPBQqXUH2jyPe1fIRguJXnpTxis+ra3TYE5EGZvhH4ULgf7A3fyVfrqAbUxoJ
         ycb2weh1+raRlKcW5UDR484KgDtiVHd/fHz9wNot8SFWgNv9fAGeHEC8hwr7SQZScSVa
         rzLLHAD4KYzFAjKsq06sglsYrcqzfCfFGC5Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=OQMSueteSCX+ghGioW1e/a4sKabIQfucBxnMzoG7f7E=;
        b=UzZXxCfd2g6OREz4Dob0Yf4tghMh0ujSZrwWzBFD8ysx8beFrrZwsETdjoKEQDVH5u
         EhL2JUi/eEVnIXVpqTIL9DAFZY1w0ehi38Ag2cL/m/P2vDbdLiV/KiyFEqhUe4M+DqOb
         QrMqJXjuGUOX5GnXngIxJh4j8t6E1x5JefrkSvWCXOVbjSDznzMtQLyDd5eTKMPY7CA6
         fQy6VjdAWGzNqA5nKgz7OEjXesYmxmgi3H2Tv1lfUW7i/c/NqpRTn9zG3hmtacxxkWmt
         hNYk/BK/p1X+/Ue+dZyYLsuID7gWP0aenedMXbSSjXNmJ3QL2t3Crg5UoWihEc+BFeJz
         ylXw==
X-Gm-Message-State: AGi0PuZ+N65GL3Zakgyk0nrDjO0xAq903L4UyeCCRD7gLmnHCMd1WUVM
	eH/IGYQLBXn0hozUBqkDxm2TMFU9gvk/PyhcPN8z3OW1IQo=
X-Google-Smtp-Source: APiQypIawOO92exfv8X+bT6qu1qLnZ9JN5cFGyk4Hebs7sNGHNqvAwDf3PiWbp/O/I1yLo7AbDXMcalbFdUvbfCzfQA=
X-Received: by 2002:a9d:6295:: with SMTP id x21mr13134680otk.291.1587862374994;
 Sat, 25 Apr 2020 17:52:54 -0700 (PDT)
MIME-Version: 1.0
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
Date: Sat, 25 Apr 2020 17:52:43 -0700
Message-ID: <CADfgfoY6Mjzr9rP2mKMOhTwQr2+aFodmDe8c0cp_BPtghgEH=w@mail.gmail.com>
Subject: Brief git.openembedded.org Downtime
To: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d068ca05a4270401"

--000000000000d068ca05a4270401
Content-Type: text/plain; charset="UTF-8"

There is a potential issue with the physical machine hosting
git.openembedded.org. I'm going to take the VM offline to move it to new
hardware. The process should take less than 30 minutes.  Full backups have
been taken in case of unexpected failures.

The downtime will begin in about 2 hours starting at 2020-04-25 20:00 PDT.
I will e-mail when the process is complete.

-- 
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--000000000000d068ca05a4270401
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is a potential issue with the physical machine hosti=
ng <a href=3D"http://git.openembedded.org">git.openembedded.org</a>. I&#39;=
m going to take the VM offline to move it to new hardware. The process shou=
ld take less than 30 minutes.=C2=A0 Full backups have been taken in case of=
 unexpected failures.<div><br></div><div>The downtime will begin in about 2=
 hours starting at 2020-04-25 20:00 PDT. I will e-mail=C2=A0when the proces=
s is complete.<br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><blockquote type=3D"cite" style=3D"co=
lor:rgb(0,0,0)"><pre></pre></blockquote><pre><div>--=20
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

</div></pre></div></div></div></div>

--000000000000d068ca05a4270401--
