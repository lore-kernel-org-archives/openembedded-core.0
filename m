Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web10.3673.1588063963701131521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 01:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QAgqMaWe;
 spf=pass (domain: gmail.com, ip: 209.85.222.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f65.google.com with SMTP id a10so20548858uad.7
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 01:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j/jsaBRTtIZe3tOCop5UxXYsel3K4oXSLH+KjpcKH7c=;
        b=QAgqMaWeVS6hZxjGuNRrpRmNfSqjLQ9RIPdIbYxOoJWdaYzrjrFfCnQt7OdkLmowKj
         Nfm1W7mdyGBVpZC+OAiu/pJ/IfGu1AoLN2HfLCx4ndqLhHIDk4RvM0oFmGJwQA7D9/NR
         OiZ0yuzmK7VCApfT84+nWj2eIqk+iiPmmJikGORad/jntIy93X0/Sm0vcpfzUpOjZJnZ
         WZTQ08ioJnnfpLTDzC1Dj5ojdsdalhoKCi4woGoMivZ8XYf4tf+fPqFUgmOZacEgijRy
         EMCdT1bDqrGyyIZcp5PkMXnAuI6s7bvJMgTsP4FjQpNaliR9d0o2uPMn8JYq8KyxIxAu
         jx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j/jsaBRTtIZe3tOCop5UxXYsel3K4oXSLH+KjpcKH7c=;
        b=RuPXVbu4V9eG/bPNLPBhi4oTw4M2kJU1M6dkD/zPIfuQoPsQS5oUJE8H4G3r6Zrscf
         AU9kf6SZL4O1JlkgEeFcxo1IGRTwYJtbG7y71a3ZieerN5rmBl/V6mHPajjwKe4wsJIb
         Vpv5bHMl7wgGVRw+jrJJW8k6+cR5M7cSApxCy02J+Cq4V0eSwQQV+JMpvnZMA1b1AS33
         0NcU5hfTUeKyQ1V2/BAVMJ1496RxuF0JqkNamMVL9rKSz28e/TbHXwm+m9uyJFb8HBkC
         7rEz+Qn1ImjK5//oLchtN7KacIEZZ43wKdsnrmtHQx2Op99jBcPOiTKezPCNz0tw/tpf
         kD9Q==
X-Gm-Message-State: AGi0PuaBIbw0FHtYsJmlMS0RJp1ma72qE0IdxvtPfm8yfskMF6dpBJlr
	t1QScaFzRliCizNcoAkFNHQGvofvM5BLANhkWAQ=
X-Google-Smtp-Source: APiQypJv1MZRn2tNpx6fD2WoBXd8T5BIJ2LfXGpXiqIv5V8tXeUbU9E/cLjpOV5J5gX1gWUgVVa9dfp1StDfZa5mDvg=
X-Received: by 2002:ab0:650f:: with SMTP id w15mr18614741uam.93.1588063962780;
 Tue, 28 Apr 2020 01:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587841042.git.alex.kanavin@gmail.com> <05d961392eb30920f441731f662ba0dd6a6bd5db.1587841042.git.alex.kanavin@gmail.com>
 <CAMKF1sopu5jZ_obZ7Qkt6vzCvaHyvbnSKEdLioTzmo87D7bZYw@mail.gmail.com>
In-Reply-To: <CAMKF1sopu5jZ_obZ7Qkt6vzCvaHyvbnSKEdLioTzmo87D7bZYw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 28 Apr 2020 10:52:31 +0200
Message-ID: <CANNYZj-5dGKXV45-SfbxopMUy51URsujoyNzQkK_kSyMKD14cA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk from target
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000061d88205a455f43f"

--00000000000061d88205a455f43f
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Apr 2020 at 03:19, Khem Raj <raj.khem@gmail.com> wrote:

> This change will indicate that a distro that enables openGL for target
> needs to have a build machine also with OpenGL support,
> this does not sound right to me, If you want to have openGL support on
> build host for some testing bits then lets deal with that separately
> by
> adding a new feature to control it and perhaps it should be machine
> specific since I dont see any use of it besides qemu machines.
>

Good point. I will rework the patches to use 'virgl' DISTRO_FEATURE
instead. Making it machine specific isn't feasible, because the recipes
affected are all native ones.

Alex

--00000000000061d88205a455f43f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 28 Apr 2020 at 03:19, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
This change will indicate that a distro that enables openGL for target<br>
needs to have a build machine also with OpenGL support,<br>
this does not sound right to me, If you want to have openGL support on<br>
build host for some testing bits then lets deal with that separately<br>
by<br>
adding a new feature to control it and perhaps it should be machine<br>
specific since I dont see any use of it besides qemu machines.<br></blockqu=
ote><div><br></div><div>Good point. I will rework the patches to use &#39;v=
irgl&#39; DISTRO_FEATURE instead. Making it machine specific isn&#39;t feas=
ible, because the recipes affected are all native ones.</div><div><br></div=
><div>Alex<br></div></div></div>

--00000000000061d88205a455f43f--
