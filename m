Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web12.2028.1603219499892896004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2020 11:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PC7uOhuf;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id s15so1727179vsm.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2020 11:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B1k916ryPpPA1DSmS7aQ57ojC+jIi/5wbK7XUzv41XQ=;
        b=PC7uOhufNKFbcJ6QxeV2mYm1yAOK4cgvRpqZvQdHsO9qa5z1J7ldnblJqQHyzVWqNF
         pHteklrc2VpDoU4sWymIQmXDIt16bDUWA3mR+CbxwnNrUo+9iyJxnueOkbYO9pa6T4vT
         O/FahslNOYYpY7Wxf4kCnUhr1jXDdtEchCMjfSLgY+R699t1YknMoVdiqLx9BH69z8lF
         ytS+6PCWb9OYgYcm9qutqCXlVW+Qe/17qr4qzPToVuVhuRd82Hn7UGcNWIqGKRe/gmY3
         7QpV+3xbts7fh4VnfCwaUPtXolXlgXciYXoa8Czrfkzr9WbPeMcxI5I+ecM9M/TNI9hM
         60zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B1k916ryPpPA1DSmS7aQ57ojC+jIi/5wbK7XUzv41XQ=;
        b=QrovtasUDg6z9iH5Cco5ZPkZoPxO9GUSOJy4xyNDjKVSO3CIG8/sHTjyalNrZax1xD
         /eFjpn7QRq/xEM+elPeD8UBnv/3YrZ3WyjyuouZf0CgrO6BG4jfZPDgeuu+mvqJ4PEzg
         XyMbaHpgpIIUoFvzfNLrJJeLY02uiHR+IY5sAzh8VMuXRkIhzXcvtoZqGB6BsTLCU17a
         8fHZ3WBX9LysVbcuGb8L6nziKhK0BW3KQXp4LgSjgzwdoTogBo2EdYig8e6AHq+FEEFu
         5Qwd6FPdRGbf5DGWoixrKdXMXAwgzjtVRMyQEcTEU87zM4fKP1hYqOk2G9NBlOxnTpWS
         e+cA==
X-Gm-Message-State: AOAM531fy/yhnUy1CK8eSCoZl0OqIXsgnD0m0I/tPHXDZkr47hdC3mOX
	eFKYLJNQnNqNurNGrShqYx+6M17cTuPofbrSNXs=
X-Google-Smtp-Source: ABdhPJw+fdmb7jdclNmNL2aY6UII8hXilea22FnAHyq4r1C69TedXnkUUnczreLNhlQyeZYaCZMGc/zi7Vj+9ZNdNaM=
X-Received: by 2002:a67:ea0b:: with SMTP id g11mr2781560vso.20.1603219498909;
 Tue, 20 Oct 2020 11:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201019201332.12446-1-petr.vorel@gmail.com> <CANNYZj8k8zbpQMD-Y2EQF_y4AffOReL1v=5Luw2dy2yAxA9r8g@mail.gmail.com>
 <20201020182253.GB18387@dell5510>
In-Reply-To: <20201020182253.GB18387@dell5510>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 20 Oct 2020 20:44:46 +0200
Message-ID: <CANNYZj8Kcj_fzScBaaaO4ogeuoxhOTb4kmGvpX55m+_dz9RKsA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: Update to 20200930
To: Petr Vorel <petr.vorel@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, He Zhe <zhe.he@windriver.com>, 
	Anders Roxell <anders.roxell@linaro.org>, Yi Zhao <yi.zhao@windriver.com>, 
	=?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000bac57a05b21ea016"

--000000000000bac57a05b21ea016
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2020 at 20:22, Petr Vorel <petr.vorel@gmail.com> wrote:

> > Thank you, but please set Upstream-Status properly for the two newly
> added
> > patches.
> Thanks, fixed in v2.
>

Seems like v2 does not actually have the fixes?

Alex

--000000000000bac57a05b21ea016
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 20 Oct 2020 at 20:22, Petr Vorel &lt;<a href=3D"mailto:petr.=
vorel@gmail.com">petr.vorel@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">&gt; Thank you, but please set Upstrea=
m-Status properly for the two newly added<br>
&gt; patches.<br>
Thanks, fixed in v2.<br></blockquote><div><br></div><div>Seems like v2 does=
 not actually have the fixes?</div><div><br></div><div>Alex<br></div></div>=
</div>

--000000000000bac57a05b21ea016--
