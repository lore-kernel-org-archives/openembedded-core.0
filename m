Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web09.1498.1616560035084812985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 21:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LDpHTy6j;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id h5so3505870uaw.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 21:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gTuhNmIy/VJiCzaIwTa84+pNYdPoJcSTWppFgructrg=;
        b=LDpHTy6jLZhwjrSWTcl/aD87u5wz3dOeE2h9aT9KuwYgqE/OIp4jWMSPUfCnx/MsTr
         XhSzbsU2tymbA3DJvvPk0LK5QRLlbjfAWdDSwQMQptrdhcZGyfzPmJ+P/82r5ykmjJnK
         YQiblTk6fG9vWUgasIU/faEF+VxQEDKvKVpHJw+kY6YaeVywED6NxMpYKQscbk1TnVhh
         nej0a5c1+D5U1mUiRNKyU6lXJE4EV6dw3mr/MDtNKkXkH/b84KYNma5UBprthI6idzQn
         8Zp2mSV1uPb5JCfwCWAdbZ0L4DzC4cdCi97a8Ix+2AG3976/Yt5WA84c9HZUG3a8lIwK
         2jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gTuhNmIy/VJiCzaIwTa84+pNYdPoJcSTWppFgructrg=;
        b=feWf2iXX5FNOcjLCDL/AgmZFaJc5aQXygetKHRjWvKFARgzzlZ4lXjgxc+ImqVTlnN
         nklTIfXTeakPcIFz41dw58IkF64HVjGJM1ccek7z9cKQ8pql9803nyG/t6bZwvIYr6cA
         9/9ZvaZNEL9AImqaPR7Tsf8uE3FZEJCOJNV/g/SqS0/8W83DSe1ckv5dMt37ydLFMMF5
         77f8uRunDCxmS+J70yAATBFlx55u8q9D6AWnJGxU75bTh6UV77a3schOvP+LKzUS9yKt
         EngnOn6TZOKYuCsm7bC3qT/WY3iwRcOktRLilETwVzDJISq/1gzzQeBTrvRPegbmU74+
         Ttbw==
X-Gm-Message-State: AOAM532Lhz9WlJznrxQn84yca3S+Xqbh2fX3XFNZ7v/kE9TOUZJ22tTP
	NIyM8U3B+nyOxTv9G6IAYRSs+oUfnW6TILrdMgY=
X-Google-Smtp-Source: ABdhPJySoGq0dorQbrGag84Sx3aaPNMmOvVMMdFA/y2400taZ2nQE6QZDHLKWe5DcfIe1n06tQJy3xeb2uir7eNHbXU=
X-Received: by 2002:ab0:48c2:: with SMTP id y2mr652836uac.22.1616560034199;
 Tue, 23 Mar 2021 21:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210323205029.87251-1-yifan.yu@windriver.com>
 <20210323205029.87251-2-yifan.yu@windriver.com> <CANNYZj-V8feRiiYvEEGKRrOKgFd-392PZa8XWRMs7Qmmm8+dgg@mail.gmail.com>
 <835b0b66-1f28-ced5-c52b-7fb4516e8cc5@windriver.com> <083932b6-c2c0-841b-8c34-868aaf3b64ee@windriver.com>
In-Reply-To: <083932b6-c2c0-841b-8c34-868aaf3b64ee@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 24 Mar 2021 05:27:03 +0100
Message-ID: <CANNYZj-xqDVvTUvz=3boGaWNm6U9p6q2Erjo+KePDnhPmUdm4g@mail.gmail.com>
Subject: Re: [oe-core][PATCH 2/2] valgrind: Disable ptest swapcontext.vgtest
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Yi Fan Yu <yifan.yu@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000098bc0505be40b61e"

--00000000000098bc0505be40b61e
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Mar 2021 at 00:55, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> I had asked Yi to disable the one failing test until we understood more
> about it and had a fix. If people prefer to drop the patch that
> removes the test, that's fine.
>
> We'll fix the new test over the coming days/week regardless.
>

I'm sorry if I was too terse, I just think that disabling tests needs more
diligence than what was visible here - at least a proper record of observed
failures, and an upstream bug and/or a yocto bug (the latter explicitly
assigned to a person).  Thanks!

Alex

--00000000000098bc0505be40b61e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 24 Mar 2021 at 00:55, Randy MacLe=
od &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriv=
er.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">I had asked Yi to disable the one failing =
test until we understood more<br>
about it and had a fix. If people prefer to drop the patch that<br>
removes the test, that&#39;s fine.<br>
<br>
We&#39;ll fix the new test over the coming days/week regardless.<br></block=
quote><div><br></div><div>I&#39;m sorry if I was too terse, I just think th=
at disabling tests needs more diligence than what was visible here - at lea=
st a proper record of observed failures, and an upstream bug and/or a yocto=
 bug (the latter explicitly assigned to a person).=C2=A0 Thanks!</div><div>=
<br></div><div>Alex<br></div></div></div>

--00000000000098bc0505be40b61e--
